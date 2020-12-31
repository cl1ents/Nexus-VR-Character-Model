--[[
TheNexusAvenger

Manipulates a character model.
--]]

local TweenService = game:GetService("TweenService")

local NexusVRCharacterModel = require(script.Parent)
local NexusObject = NexusVRCharacterModel:GetResource("NexusInstance.NexusObject")
local Head = NexusVRCharacterModel:GetResource("Character.Head")
local Torso = NexusVRCharacterModel:GetResource("Character.Torso")
local Appendage = NexusVRCharacterModel:GetResource("Character.Appendage")
local FootPlanter = NexusVRCharacterModel:GetResource("Character.FootPlanter")

local Character = NexusObject:Extend()
Character:SetClassName("Character")



--[[
Creates a character.
--]]
function Character:__new(CharacterModel)
    self:InitializeSuper()
    self.CharacterModel = CharacterModel
    self.TweenComponents = true

    --Store the body parts.
    self.Parts = {
        Head = CharacterModel:WaitForChild("Head"),
        UpperTorso = CharacterModel:WaitForChild("UpperTorso"),
        LowerTorso = CharacterModel:WaitForChild("LowerTorso"),
        HumanoidRootPart = CharacterModel:WaitForChild("HumanoidRootPart"),
        RightUpperArm = CharacterModel:WaitForChild("RightUpperArm"),
        RightLowerArm = CharacterModel:WaitForChild("RightLowerArm"),
        RightHand = CharacterModel:WaitForChild("RightHand"),
        LeftUpperArm = CharacterModel:WaitForChild("LeftUpperArm"),
        LeftLowerArm = CharacterModel:WaitForChild("LeftLowerArm"),
        LeftHand = CharacterModel:WaitForChild("LeftHand"),
        RightUpperLeg = CharacterModel:WaitForChild("RightUpperLeg"),
        RightLowerLeg = CharacterModel:WaitForChild("RightLowerLeg"),
        RightFoot = CharacterModel:WaitForChild("RightFoot"),
        LeftUpperLeg = CharacterModel:WaitForChild("LeftUpperLeg"),
        LeftLowerLeg = CharacterModel:WaitForChild("LeftLowerLeg"),
        LeftFoot = CharacterModel:WaitForChild("LeftFoot"),
    }
    self.Motors = {
        Neck = self.Parts.Head:WaitForChild("Neck"),
        Waist = self.Parts.UpperTorso:WaitForChild("Waist"),
        Root = self.Parts.LowerTorso:WaitForChild("Root"),
        RightShoulder = self.Parts.RightUpperArm:WaitForChild("RightShoulder"),
        RightElbow = self.Parts.RightLowerArm:WaitForChild("RightElbow"),
        RightWrist = self.Parts.RightHand:WaitForChild("RightWrist"),
        LeftShoulder = self.Parts.LeftUpperArm:WaitForChild("LeftShoulder"),
        LeftElbow = self.Parts.LeftLowerArm:WaitForChild("LeftElbow"),
        LeftWrist = self.Parts.LeftHand:WaitForChild("LeftWrist"),
        RightHip = self.Parts.RightUpperLeg:WaitForChild("RightHip"),
        RightKnee = self.Parts.RightLowerLeg:WaitForChild("RightKnee"),
        RightAnkle = self.Parts.RightFoot:WaitForChild("RightAnkle"),
        LeftHip = self.Parts.LeftUpperLeg:WaitForChild("LeftHip"),
        LeftKnee = self.Parts.LeftLowerLeg:WaitForChild("LeftKnee"),
        LeftAnkle = self.Parts.LeftFoot:WaitForChild("LeftAnkle"),
    }
    self.Attachments = {
        Head = {
            NeckRigAttachment = self.Parts.Head:WaitForChild("NeckRigAttachment"),
        },
        UpperTorso = {
            NeckRigAttachment = self.Parts.UpperTorso:WaitForChild("NeckRigAttachment"),
            LeftShoulderRigAttachment = self.Parts.UpperTorso:WaitForChild("LeftShoulderRigAttachment"),
            RightShoulderRigAttachment = self.Parts.UpperTorso:WaitForChild("RightShoulderRigAttachment"),
            WaistRigAttachment = self.Parts.UpperTorso:WaitForChild("WaistRigAttachment"),
        },
        LowerTorso = {
            WaistRigAttachment = self.Parts.LowerTorso:WaitForChild("WaistRigAttachment"),
            LeftHipRigAttachment = self.Parts.LowerTorso:WaitForChild("LeftHipRigAttachment"),
            RightHipRigAttachment = self.Parts.LowerTorso:WaitForChild("RightHipRigAttachment"),
            RootRigAttachment = self.Parts.LowerTorso:WaitForChild("RootRigAttachment"),
        },
        HumanoidRootPart = {
            RootRigAttachment = self.Parts.HumanoidRootPart:WaitForChild("RootRigAttachment"),
        },
        RightUpperArm = {
            RightShoulderRigAttachment = self.Parts.RightUpperArm:WaitForChild("RightShoulderRigAttachment"),
            RightElbowRigAttachment = self.Parts.RightUpperArm:WaitForChild("RightElbowRigAttachment"),
        },
        RightLowerArm = {
            RightElbowRigAttachment = self.Parts.RightLowerArm:WaitForChild("RightElbowRigAttachment"),
            RightWristRigAttachment = self.Parts.RightLowerArm:WaitForChild("RightWristRigAttachment"),
        },
        RightHand = {
            RightWristRigAttachment = self.Parts.RightHand:WaitForChild("RightWristRigAttachment"),
        },
        LeftUpperArm = {
            LeftShoulderRigAttachment = self.Parts.LeftUpperArm:WaitForChild("LeftShoulderRigAttachment"),
            LeftElbowRigAttachment = self.Parts.LeftUpperArm:WaitForChild("LeftElbowRigAttachment"),
        },
        LeftLowerArm = {
            LeftElbowRigAttachment = self.Parts.LeftLowerArm:WaitForChild("LeftElbowRigAttachment"),
            LeftWristRigAttachment = self.Parts.LeftLowerArm:WaitForChild("LeftWristRigAttachment"),
        },
        LeftHand = {
            LeftWristRigAttachment = self.Parts.LeftHand:WaitForChild("LeftWristRigAttachment"),
        },
        RightUpperLeg = {
            RightHipRigAttachment = self.Parts.RightUpperLeg:WaitForChild("RightHipRigAttachment"),
            RightKneeRigAttachment = self.Parts.RightUpperLeg:WaitForChild("RightKneeRigAttachment"),
        },
        RightLowerLeg = {
            RightKneeRigAttachment = self.Parts.RightLowerLeg:WaitForChild("RightKneeRigAttachment"),
            RightAnkleRigAttachment = self.Parts.RightLowerLeg:WaitForChild("RightAnkleRigAttachment"),
        },
        RightFoot = {
            RightAnkleRigAttachment = self.Parts.RightFoot:WaitForChild("RightAnkleRigAttachment"),
        },
        LeftUpperLeg = {
            LeftHipRigAttachment = self.Parts.LeftUpperLeg:WaitForChild("LeftHipRigAttachment"),
            LeftKneeRigAttachment = self.Parts.LeftUpperLeg:WaitForChild("LeftKneeRigAttachment"),
        },
        LeftLowerLeg = {
            LeftKneeRigAttachment = self.Parts.LeftLowerLeg:WaitForChild("LeftKneeRigAttachment"),
            LeftAnkleRigAttachment = self.Parts.LeftLowerLeg:WaitForChild("LeftAnkleRigAttachment"),
        },
        LeftFoot = {
            LeftAnkleRigAttachment = self.Parts.LeftFoot:WaitForChild("LeftAnkleRigAttachment"),
        },
    }

    --Store the limbs.
    self.Head = Head.new(self.Parts.Head)
    self.Torso = Torso.new(self.Parts.LowerTorso,self.Parts.UpperTorso)
    self.LeftArm = Appendage.new(CharacterModel:WaitForChild("LeftUpperArm"),CharacterModel:WaitForChild("LeftLowerArm"),CharacterModel:WaitForChild("LeftHand"),"LeftShoulderRigAttachment","LeftElbowRigAttachment","LeftWristRigAttachment","LeftGripAttachment")
    self.RightArm = Appendage.new(CharacterModel:WaitForChild("RightUpperArm"),CharacterModel:WaitForChild("RightLowerArm"),CharacterModel:WaitForChild("RightHand"),"RightShoulderRigAttachment","RightElbowRigAttachment","RightWristRigAttachment","RightGripAttachment")
    self.LeftLeg = Appendage.new(CharacterModel:WaitForChild("LeftUpperLeg"),CharacterModel:WaitForChild("LeftLowerLeg"),CharacterModel:WaitForChild("LeftFoot"),"LeftHipRigAttachment","LeftKneeRigAttachment","LeftAnkleRigAttachment","LeftFootAttachment",false)
    self.LeftLeg.InvertBendDirection = true
    self.RightLeg = Appendage.new(CharacterModel:WaitForChild("RightUpperLeg"),CharacterModel:WaitForChild("RightLowerLeg"),CharacterModel:WaitForChild("RightFoot"),"RightHipRigAttachment","RightKneeRigAttachment","RightAnkleRigAttachment","RightFootAttachment",false)
    self.RightLeg.InvertBendDirection = true
    self.FootPlanter = FootPlanter:CreateSolver(CharacterModel:WaitForChild("LowerTorso"))
end

--[[
Sets a property. The property will either be
set instantly or tweened depending on how
it is configured.
--]]
function Character:SetCFrameProperty(Object,PropertyName,PropertyValue)
    if self.TweenComponents then
        TweenService:Create(
            Object,
            TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
            {
                [PropertyName] = PropertyValue,
            }
        ):Play()
    else
        Object[PropertyName] = PropertyValue
    end
end

--[[
Sets the transform of a motor.
--]]
function Character:SetTransform(MotorName,AttachmentName,StartLimbName,EndLimbName,StartCFrame,EndCFrame)
    self:SetCFrameProperty(self.Motors[MotorName],"Transform",(StartCFrame * self.Attachments[StartLimbName][AttachmentName].CFrame):Inverse() * (EndCFrame * self.Attachments[EndLimbName][AttachmentName].CFrame))
end

--[[
Updates the character from the inputs.
--]]
function Character:UpdateFromInputs(HeadControllerCFrame,LeftHandControllerCFrame,RightHandControllerCFrame)
    --Get the CFrames.
    local HeadCFrame = self.Head:GetHeadCFrame(HeadControllerCFrame)
    local NeckCFrame = self.Head:GetNeckCFrame(HeadControllerCFrame)
	local LowerTorsoCFrame,UpperTorsoCFrame = self.Torso:GetTorsoCFrames(NeckCFrame)
	local JointCFrames = self.Torso:GetAppendageJointCFrames(LowerTorsoCFrame,UpperTorsoCFrame)
	local LeftUpperArmCFrame,LeftLowerArmCFrame,LeftHandCFrame = self.LeftArm:GetAppendageCFrames(JointCFrames["LeftShoulder"],LeftHandControllerCFrame)
	local RightUpperArmCFrame,RightLowerArmCFrame,RightHandCFrame = self.RightArm:GetAppendageCFrames(JointCFrames["RightShoulder"],RightHandControllerCFrame)
	local LeftFoot,RightFoot = self.FootPlanter:GetFeetCFrames()
	local LeftUpperLegCFrame,LeftLowerLegCFrame,LeftFootCFrame = self.LeftLeg:GetAppendageCFrames(JointCFrames["LeftHip"],LeftFoot * CFrame.Angles(0,math.pi,0))
	local RightUpperLegCFrame,RightLowerLegCFrame,RightFootCFrame = self.RightLeg:GetAppendageCFrames(JointCFrames["RightHip"],RightFoot * CFrame.Angles(0,math.pi,0))
    
    --Set the character CFrames.
    --TODO: Improve - allow tweening
    self.Parts.HumanoidRootPart.CFrame = LowerTorsoCFrame * self.Attachments.LowerTorso.RootRigAttachment.CFrame * self.Attachments.HumanoidRootPart.RootRigAttachment.CFrame:Inverse()
    self:SetTransform("Neck","NeckRigAttachment","UpperTorso","Head",UpperTorsoCFrame,HeadCFrame)
    self:SetTransform("Waist","WaistRigAttachment","LowerTorso","UpperTorso",LowerTorsoCFrame,UpperTorsoCFrame)
    self:SetTransform("RightShoulder","RightShoulderRigAttachment","UpperTorso","RightUpperArm",UpperTorsoCFrame,RightUpperArmCFrame)
    self:SetTransform("RightElbow","RightElbowRigAttachment","RightUpperArm","RightLowerArm",RightUpperArmCFrame,RightLowerArmCFrame)
    self:SetTransform("RightWrist","RightWristRigAttachment","RightLowerArm","RightHand",RightLowerArmCFrame,RightHandCFrame)
    self:SetTransform("LeftShoulder","LeftShoulderRigAttachment","UpperTorso","LeftUpperArm",UpperTorsoCFrame,LeftUpperArmCFrame)
    self:SetTransform("LeftElbow","LeftElbowRigAttachment","LeftUpperArm","LeftLowerArm",LeftUpperArmCFrame,LeftLowerArmCFrame)
    self:SetTransform("LeftWrist","LeftWristRigAttachment","LeftLowerArm","LeftHand",LeftLowerArmCFrame,LeftHandCFrame)
    self:SetTransform("RightHip","RightHipRigAttachment","LowerTorso","RightUpperLeg",LowerTorsoCFrame,RightUpperLegCFrame)
    self:SetTransform("RightKnee","RightKneeRigAttachment","RightUpperLeg","RightLowerLeg",RightUpperLegCFrame,RightLowerLegCFrame)
    self:SetTransform("RightAnkle","RightAnkleRigAttachment","RightLowerLeg","RightFoot",RightLowerLegCFrame,RightFootCFrame)
    self:SetTransform("LeftHip","LeftHipRigAttachment","LowerTorso","LeftUpperLeg",LowerTorsoCFrame,LeftUpperLegCFrame)
    self:SetTransform("LeftKnee","LeftKneeRigAttachment","LeftUpperLeg","LeftLowerLeg",LeftUpperLegCFrame,LeftLowerLegCFrame)
    self:SetTransform("LeftAnkle","LeftAnkleRigAttachment","LeftLowerLeg","LeftFoot",LeftLowerLegCFrame,LeftFootCFrame)
end



return Character
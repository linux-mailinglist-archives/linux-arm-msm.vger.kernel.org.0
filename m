Return-Path: <linux-arm-msm+bounces-41991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E846D9F0B2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C080A16B6D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48D51DFD83;
	Fri, 13 Dec 2024 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UiviArnH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6511DF263;
	Fri, 13 Dec 2024 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089514; cv=none; b=f+IfzDDrpHcW8xmTaRPpiXAnpV4QUo/6+BdRPr2y9W66MMkkpmUFJ4lCgw7jRLargiKCCsk2qxgSyszltk/m9/JyvE2SEXSGYRezgAtynOgcPeH//Vk/cPg6hTUYPafCviqviUPquMwhm6iz0jlry1gX6xkiiwOnEigbRwxnYNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089514; c=relaxed/simple;
	bh=KCEPaTQU7EzKEn2ArSYOPblqClFbvVdeAzYKQmPsvOQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=WMZlCtA9kvpvZ78W6ybpObdpjF5V84Ft9u39mZNSx4S/m0Cgoh3jlZF5DIlgLsGyo+YXFNahmMnJqzqjHByz5mCXHzGowoER+XnufAsqyNic+4MTILB9HoeLf6I4kfkcDpU+tdt9TA+dRyPd3R1eMuZJQ7m7/3SBYyf3m/z6Hyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UiviArnH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD1VqJH001463;
	Fri, 13 Dec 2024 11:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QWAEMClknfXnAhTk4A8QYY
	+QNIf29dtZFi43bugEFiY=; b=UiviArnHlhnMYsmtR5tPPMJbanYfAbuZ1IoQvb
	nAxQMU3S6tngdQfoGabHqNaPb/0vxBLfhcH8JZINaxxhuARr7zj+XltKkVtypsi2
	V0qoDAgAFAw3OSGfvwa/MSTGLFOcEw2yCWxuJInOpfjgBJrGhkhtu4vPlUUaFmvA
	OPaHK8vZ+8wJWkNkYbxDPZJFbdW9ZmQOemGZ0upX1uoM822vrbkfURMc2MpFqex9
	EoLQS9nqiP6JNzWk/jaMXs5oH+RNFshZXM9wmMhUt/+RLFAXtteqkmztWv7MQVoa
	Qgptj+4zMZs0P0cOuF5ArPMDgRIsHwl8GAGqcV/jop71clZw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes4nm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:31:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDBVcMC010376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:31:38 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 03:31:31 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH RESEND v2 0/4] Devicetree changes for QCS615's GPU
Date: Fri, 13 Dec 2024 17:01:02 +0530
Message-ID: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPcaXGcC/5WSwY7bIBCGXyXyuRPBYDCOqtUeutce2mNVRZiBB
 NU2CThWt6u8e4mTVburlbo9Duj/5huYpyq7FFyuNqunKrk55BDHUuCHVWX3Ztw5CFTqChnWnKO
 Eo82KS9gdTkATeGM70sYKrn1VMofkfPi58L5VXx6+Pnz+VH2/nid3PBX8dLvsTHZg4zCEabMSz
 HXKs47pjgtPKJ3haIRR3jCjZcslb5nl9tJicDmbxWuz+njVYjUYom0YwxRMv82nwyGmaetj2t5
 0Zwk1tEROU9Pp0ui+yNgw2nVRuHsbyxCfp7V9tD+AUphdgrkGAYIargwxanXzbxZrC68WrdTr8
 oQFWwLb1Jvd7jHv36HCmX5WGYarjY3jlGLfX4QENNCQ6JBQSE/+v4nlJ8dILsPMgUOHSrXWWKa
 wfg8KkTV1i7hGzaUogGW84/HXPp5e5i+rsA95iulx2biZL7tww6hXy1VkGBjdNBrbRpGhv2ELa
 8Y/eeTidR5LXimmrKo9E518mT+fz78BeLcnyf8CAAA=
X-Change-ID: 20241125-qcs615-gpu-dt-facbd8ac318f
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734089491; l=3591;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=KCEPaTQU7EzKEn2ArSYOPblqClFbvVdeAzYKQmPsvOQ=;
 b=V9qGhxLytAdeETZ8B3j9vTdA3M3aHlm51qCwJIlM3QiTReMngd+kTujA/9hE1VALBXouiF1+t
 RGCBGC2EtJAA8o2Vh1a/VfhnQOtQAwQmFJFRHxdSLNTUKvbdY7Nr5+g
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1p_XHtM7My_xhtYIPH2BekdSXmb1kaup
X-Proofpoint-ORIG-GUID: 1p_XHtM7My_xhtYIPH2BekdSXmb1kaup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130080

This series adds support for Adreno 612 to QCS615 chipset's devicetree.
DRM driver's support was posted earlier and can be found here:
	https://patchwork.freedesktop.org/patch/626066/

Patch#1 & #2 are for Rob Clark and the other 2 for Bjorn

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
Changes in v2:
- Completely describe RGMU in devicetree and also add necessary binding
documentation (Konrad, feedback on the driver patch)
- Remove smmu_vote clk from clock list (Konrad)
- Add R-b from Dmitry
- Link to v1: https://lore.kernel.org/r/20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com

---
Akhil P Oommen (2):
      dt-bindings: display/msm: gpu: Document A612 GPU
      dt-bindings: display/msm/gmu: Document RGMU

Jie Zhang (2):
      arm64: dts: qcom: qcs615: Add gpu and gmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  7 +-
 .../devicetree/bindings/display/msm/gpu.yaml       | 36 +++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  8 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 88 ++++++++++++++++++++++
 4 files changed, 137 insertions(+), 2 deletions(-)
---
base-commit: 30eb6f0b08b13fd25ea12a3a6fa0a85915190c1c
change-id: 20241125-qcs615-gpu-dt-facbd8ac318f
prerequisite-message-id: <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae
prerequisite-message-id: <20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com>
prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
prerequisite-message-id: <20240924143958.25-2-quic_rlaggysh@quicinc.com>
prerequisite-patch-id: 3c73bafb074ea339d387a6aa39e5362c8775596d
prerequisite-patch-id: 0e224a7310d36e9a633d57c4a177ff24c1e8e767
prerequisite-message-id: <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>
prerequisite-patch-id: 748a4e51bbedae9c6ebdbd642b2fd1badf958788
prerequisite-patch-id: 72a894a3b19fdbd431e1cec9397365bc5b27abfe
prerequisite-patch-id: da2b7a74f1afd58833c6a9a4544a0e271720641f
prerequisite-patch-id: 40b79fe0b9101f5db3bddad23551c1123572aee5
prerequisite-patch-id: cb93e5798f6bfe8cc3044c4ce973e3ae5f20dc6b
prerequisite-patch-id: 13b0dbf97ac1865d241791afb4b46a28ca499523
prerequisite-patch-id: 807019bedabd47c04f7ac78e9461d0b5a6e9131b
prerequisite-patch-id: 8e2e841401fefbd96d78dd4a7c47514058c83bf2
prerequisite-patch-id: 125bb8cb367109ba22cededf6e78754579e1ed03
prerequisite-patch-id: b3cc42570d5826a4704f7702e7b26af9a0fe57b0
prerequisite-patch-id: df8e2fdd997cbf6c0a107f1871ed9e2caaa97582
prerequisite-message-id: <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>
prerequisite-patch-id: bcb1328b70868bb9c87c0e4c48e5c9d38853bc60
prerequisite-patch-id: 8844a4661902eb44406639a3b7344416a0c88ed9
prerequisite-message-id: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
prerequisite-patch-id: 50223f2370a7ae8053b164fa5219a1690d7e4567
prerequisite-patch-id: c71c7897d6f250b381f7a9ac66ec58f4a10d49d6

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>



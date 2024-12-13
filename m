Return-Path: <linux-arm-msm+bounces-41988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B109F0AE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B638716A920
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654091DE4D0;
	Fri, 13 Dec 2024 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OUhiPqi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B961F1D0E20;
	Fri, 13 Dec 2024 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089148; cv=none; b=dGcx6z7Ter+VhBrmgVfMF2p2Lrsiuq3ojjsYF1QCWZh/3dw0Hf2ORUJjDJqa20sHvMX0MGJzbtFcETFHNdG4FsUKShHH4tUN9jkH0z/NqyNyszHdxGKbaEYDw527yeQgKbKe4MUwZwk5eu+hNTsIw0Lo8kXn/nc7NesTZe2VFNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089148; c=relaxed/simple;
	bh=AAySlqWRU7tneaj1wMOloOL1qA7eTfg3gG+BsQ+phnw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=L+gcAzwdAYKNxYXD2TBb3NNeypersdvHXtyhSf6WuDyXRaN/oIz216F1ShW14IO5HlhPTUpTS1/LzZfTSqrqGpak2m6eISqVVgIfmxQoGl35LN57nY0CT5/P6dsiAArcxocVLiN2AOTI6vICe7oszkastcUfvCom7M4o6TVutjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OUhiPqi7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9p3tV018631;
	Fri, 13 Dec 2024 11:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KzcnJU/yNMnn7D6lBfjSk1
	CYG5+7awuwww2XHLNxjWc=; b=OUhiPqi73GugeSwGZSYExbBeYQT+//vH5mfHt2
	rlvyLt0tIEv8+ekRctYdYEfuiA4wruiSrV1neE4/764SiQJFWSFP5KX9iQtYvt0O
	hik1AWS/fInraqRr66n8APr6t5Ymo3YkaGPAteXzVoLmwhdOUARRNCXoweQhMe2L
	LUA4cv6ZvZ/A+0fI1mgZ+5+vlHBHU3uZRUOHtTt58p0otC0Sb1u7QOpmv5Rt37H5
	IAyOQZ5ts2PLAp/DniAteo7zHnAi2oVDH5jaoK8oUCfaGh3jHThIUF8rnnK4dL34
	D7cQlbVKb3zLAw2W7rGOBejviTlIAiJSyfvFyEtcArc136Rg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjnb09g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:25:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDBPXhl000719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:25:33 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 03:25:25 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH RESEND v2 00/26] Devicetree changes for QCS615's GPU
Date: Fri, 13 Dec 2024 16:54:56 +0530
Message-ID: <20241213-qcs615-gpu-dt-v2-0-64751d9c3748@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Qingqing
 Zhou" <quic_qqzhou@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jie Zhang" <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734089124; l=3591;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=AAySlqWRU7tneaj1wMOloOL1qA7eTfg3gG+BsQ+phnw=;
 b=bMZFKFmg26NUBS+pYVxgFmPOL3DhHhE86SoPClG9/JMRKRMNoEuzcWsMJlyVgNoQR5X+2n/hy
 yN9AQzrC7w7BXyIZqOX4+Szl/JEtEEiKE72QmdQ04syLWPpJ2U/Qa8t
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SOXcy6brp1HZUj8htpvzdJKCsJ2m5C2G
X-Proofpoint-GUID: SOXcy6brp1HZUj8htpvzdJKCsJ2m5C2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130079

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
prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-message-id: <20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com>
prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
prerequisite-message-id: <20240924143958.25-2-quic_rlaggysh@quicinc.com>
prerequisite-patch-id: 0e224a7310d36e9a633d57c4a177ff24c1e8e767
prerequisite-patch-id: 3c73bafb074ea339d387a6aa39e5362c8775596d
prerequisite-message-id: <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>
prerequisite-patch-id: df8e2fdd997cbf6c0a107f1871ed9e2caaa97582
prerequisite-patch-id: b3cc42570d5826a4704f7702e7b26af9a0fe57b0
prerequisite-patch-id: 125bb8cb367109ba22cededf6e78754579e1ed03
prerequisite-patch-id: 8e2e841401fefbd96d78dd4a7c47514058c83bf2
prerequisite-patch-id: 807019bedabd47c04f7ac78e9461d0b5a6e9131b
prerequisite-patch-id: 13b0dbf97ac1865d241791afb4b46a28ca499523
prerequisite-patch-id: 40b79fe0b9101f5db3bddad23551c1123572aee5
prerequisite-patch-id: cb93e5798f6bfe8cc3044c4ce973e3ae5f20dc6b
prerequisite-patch-id: da2b7a74f1afd58833c6a9a4544a0e271720641f
prerequisite-patch-id: 72a894a3b19fdbd431e1cec9397365bc5b27abfe
prerequisite-patch-id: 748a4e51bbedae9c6ebdbd642b2fd1badf958788
prerequisite-message-id: <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>
prerequisite-patch-id: 8844a4661902eb44406639a3b7344416a0c88ed9
prerequisite-patch-id: bcb1328b70868bb9c87c0e4c48e5c9d38853bc60
prerequisite-message-id: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
prerequisite-patch-id: c71c7897d6f250b381f7a9ac66ec58f4a10d49d6
prerequisite-patch-id: 50223f2370a7ae8053b164fa5219a1690d7e4567

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>



Return-Path: <linux-arm-msm+bounces-49753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE903A48970
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 21:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 917AB188599A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 20:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBE026FA51;
	Thu, 27 Feb 2025 20:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BrqK2Axz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A56126A0BF;
	Thu, 27 Feb 2025 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740686925; cv=none; b=EE0ZfkvH7K5XQp13lKb9Cx2Za9Z0di12r8IDAhlcaHino+wnHRRBeMfLL0QeO61XP0+3kI6NrcZlLs03l4/4eLxtY6dRoEJPND5/Na10qnvG7ApNJNfcBXGttMQoGkhbYSiaJUVmshMpTJDSfqvSnTgGL+l2vD4nCpK2Zuo9EsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740686925; c=relaxed/simple;
	bh=Gp7Np1uNLWQTHyBaGS7MHACrSioXyt4C5ZJwKQMSxZ4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Mq0MFHcXSksUgH9RKyYCY+iJUiXqaU49oX6DrDn9WedKqFBIUoEo6IBJ+9GlskYi15fvSopSbMrV2VDTEwO1uxchJEGigP5YTfwK9dNh/4hRdooxnS5svvOctqcpz95V7zCi9rdMV/7WDodXHKyCHxDRh9IGK7Rjf1ETK//BSgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BrqK2Axz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RAmHB0003268;
	Thu, 27 Feb 2025 20:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lBWq1nIHs8SVaVeGZfZPKB
	ueNQ/iSxF0sZnlSAfBKPA=; b=BrqK2AxzFtZchbQhvtjsH2bmL0o8bWBvX9xGOG
	3njGpIT6uGBFzfyUiuOIMw5H8LxJX8uyxBcoVK/AB6lmfKxwZFq0KSl3jk9qmbJ2
	v1q5yJ6p4G6OYPQYrMZGMFD+4mR5MiKfUU08URT+QMVW4B25Ey0H4vZR5+r6qW2M
	htNqW0CGICSOidSIci6lJOaVY8MiZY1GPZ1ttBwgpfrjGxJ5DAZGsh9Kuw30HgBp
	GuiUJ63sVGoRO4q8/S+jZTw0hOB/pF3BKipnR519PkzFhuEOy52YH3zoTbBCvgb0
	stmiLabJjtEQtp23+HLM1VAIdnS3TT8EQQuXzprWED3dbZLw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452pm7hm2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:08:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RK8TPc002253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:08:29 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 12:08:22 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v2 0/6] Support for Adreno 623 GPU
Date: Fri, 28 Feb 2025 01:37:48 +0530
Message-ID: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABTGwGcC/3WPyw6CMBBFf4XM2jF9QGNZ+R/GBa0tdNGCbSEYw
 79bcOPG5b3J3HPmDclEZxK01RuiWVxyYyiBnSrQQxd6g+5RMjDCGsIox04wjv00Y5qnaYwZrRD
 yIgi36tJAOZuisW49Jm/3b47mOZfl/C1BdcmgHr13ua188hjMmuGXWAR2HuUUVY0qdkEP2NsVk
 /czKsKZoFJwIup2aWCnDC7lMb6OPxZ6YP4rLxQJSsm1aDSX9sGuxU+7oM/FCu7btn0ANeQauRg
 BAAA=
X-Change-ID: 20250213-a623-gpu-support-f6698603fb85
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>,
        "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740686902; l=1755;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=Gp7Np1uNLWQTHyBaGS7MHACrSioXyt4C5ZJwKQMSxZ4=;
 b=hhHGrGZy4IvBXKHhvIjLe+a63IRatsLxEd9TR8otJs5AbIWWuMRwYl0XIrOwKEJ8ZjMLvslO6
 bkBqUPcWqzjBpATcCb/fj9uWIciEQX5OxkVAjf22DiVUWNdW8bZPbTG
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fuGlA0-yGs2WUh-QN3WEchl9CweF7H-T
X-Proofpoint-GUID: fuGlA0-yGs2WUh-QN3WEchl9CweF7H-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270149

This series adds support for A623 GPU found in QCS8300 chipsets. This
GPU IP is very similar to A621 GPU, except for the UBWC configuration
and the GMU firmware.

Both DT patches are for Bjorn and rest of the patches for Rob Clark to
pick up.

---
Changes in v2:
- Fix hwcg config (Konrad)
- Split gpucc reg list patch (Rob)
- Rebase on msm-next tip
- Link to v1: https://lore.kernel.org/r/20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com

---
Jie Zhang (6):
      drm/msm/a6xx: Split out gpucc register block
      drm/msm/a6xx: Fix gpucc register block for A621
      drm/msm/a6xx: Add support for Adreno 623
      dt-bindings: display/msm/gmu: Add Adreno 623 GMU
      arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
      arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 93 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 29 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 13 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 17 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
 8 files changed, 171 insertions(+), 3 deletions(-)
---
base-commit: 89839e69f6154feecd79bd01171375225b0296e9
change-id: 20250213-a623-gpu-support-f6698603fb85
prerequisite-change-id: 20250131-b4-branch-gfx-smmu-b03261963064:v5
prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
prerequisite-patch-id: 08a0540f75b0f95fd2018b38c9ed5c6f96433b4d

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>



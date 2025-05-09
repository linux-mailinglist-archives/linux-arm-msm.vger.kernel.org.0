Return-Path: <linux-arm-msm+bounces-57366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51896AB0B88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 09:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 204A53ACDAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B2526AAAE;
	Fri,  9 May 2025 07:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lNeOSzKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFC18F64;
	Fri,  9 May 2025 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775357; cv=none; b=PVCxDKfnRxf3AwVEHjoVyjaBS09EnQZy9EBhKTsLA2vu0PIuC9e0dB2gMvY/UhH+jXT2h0M08jydQs4anCEnkMSyJ2Hr3v5t9RtueHU81JJhOhmCSYdqWHVy4huST0seg4M0sOq6/1Ft9zDgF/cxVJzL2fHWGCRpMErXfYxx90M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775357; c=relaxed/simple;
	bh=97WtU+MBAa+57anLMQl6DoUdFVtogLxvVIWNsqKvBVY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=XtuI5jLcRmYj7ZO7fTmGaDoAMzuP7EGnIFIs3WUpCGH1iRqDE/vxFzVj94PZ/POQR6zv9qM3PdLX//DwSugAc72erugDvKOdfUXQAC5/6ZKFZMJng0KXdj6t29CT7GaPXYsr4itrPI9x+/ML5KyiNDlYyTkMpjeOrb7sZ3YEkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lNeOSzKJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492ApUZ024939;
	Fri, 9 May 2025 07:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m/OkqM920/9mWe1H1Onn3C
	LPqmU72LcQ6hBPXuTFPXM=; b=lNeOSzKJvsJdJKODNf3fvlo4BBOu1eHxqJBryI
	I2/7rrJAcG+HeRwQxnVMdyIi35/0d1Iav05OoqYHh+8lMfECnpergQdxE+9eGmTs
	B1cueCUkSIrqOH6OPjckkEI2og581meAxCCu90c7alrlSSoVXsuj64clb2jrCKjz
	Ir4ZEikmqcagLFrPtibd/Zm7ZwsGGDeOZRZiP8s/oOWkquM07b+iHhSm+EcOiJV1
	35j6x/kkSsmnehCnHIitTD3tlG5qdLDIOAQl36uNPkyZ/ZSXaz88R2FjCQqjA2O7
	qK6v6LL21U/ySFJhalCgZAA+sDzPdyfAKHACZU9//mtM9HCw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp13t85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:22:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5497MN50026480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 07:22:23 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 00:22:17 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v4 0/3] Support for Adreno 623 GPU
Date: Fri, 9 May 2025 12:51:38 +0530
Message-ID: <20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKtHWgC/3XPy07DMBAF0F+JvGYqP2ITRwjxH4iFPXESL/Kon
 VhFVf4d4y4ooizvSPdczZVEF7yLpK2uJLjko1/mHOqniuBo5sGB73ImnHJJORNgFBcwrDvEfV2
 XsEGvlG4UFb1tJMm1NbjeXwr5/nHLwZ33LG+3I7EmOsBlmvzWVkmdmISApTu5GE3ZbKuXMikYB
 VuDDWbGEYb+AnGadkgKODCJitrG2E7rt7yAfsZTdl/J9+7o47aEz/JZYmX4/ycSAwpaC1QShe4
 7fu8VLvE7gjcPCJ4J44yStUNknfhLiB9C0keEyIRAK9iz1l1du9/EcRxfNPVZgbABAAA=
X-Change-ID: 20250213-a623-gpu-support-f6698603fb85
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>,
        "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746775337; l=1850;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=97WtU+MBAa+57anLMQl6DoUdFVtogLxvVIWNsqKvBVY=;
 b=bCho6Xre9ekWKe4Pn4FbREI4mf8pBQkoBgosMhRWb6TAQY4OnRIhH0zdxHqV12v3pCtjq8Eea
 u7EkLsXnAMaDHGzMgcfFg5cjd3N20EtGsUr8ECKT9hWeWMdPdqRROQc
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA2OSBTYWx0ZWRfXzVCoUXPUIOrT
 dVZOFL3HYuPxPAhIjQiYiqrMUqoZMSvFrTaj+z70Gn/FNvkEObO21Bcy4jYoT6227jZbi5RfmJ7
 gRpgIqQ6KyeFPIxnddarl3rfeHtnQwb2r3ZYOh7L5tzP0U9/REwWWJbOZ5McXGKCHI0Gx5WUxQl
 l3OtxGlR++PwbP3sPguSvjpIHcdRZS97CgnKjqaQ6xESf/3Le8FPooPv4ZL6ZjRSWHK9xaS1vCZ
 NHFozLlolt2JxJlO9BtZx4ACT+talqL7pmczc1oEPX7Rz9nG0o94O85oe44a6AE7GXP+FgTzyGS
 eTSZeHGcw6gOYxoC4CwHiGIkgAXX5vQFVPp13Mh3gWHWZ8nHxS82YWDYncvPMmmfUrYdehTReHr
 Ic3z777kPgJvrPQfA4GVf2xvdsWGkUngYg8OBb+37/Je8UrJbcTi0RqgZ/S9M4cxLeGmlGP7
X-Proofpoint-GUID: VGbfHNDHiV1NdB_oqKj9sojzexwl6XPN
X-Proofpoint-ORIG-GUID: VGbfHNDHiV1NdB_oqKj9sojzexwl6XPN
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681dad30 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=Zgk8kBV0DBUZDr0MsEgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090069

This series adds support for A623 GPU found in QCS8300 chipsets. This
GPU IP is very similar to A621 GPU, except for the UBWC configuration
and the GMU firmware.

Both DT patches are for Bjorn and the dt-bindings update for Rob Clark
to pick up.

---
Changes in v4:
- Correct the commit text for the new patch#1 added in v3 and drop the
incorrect R-b tag
- Link to v3: https://lore.kernel.org/r/20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com

Changes in v3:
- Rebased on top of v6.15-rc5
- Dropped drm-msm patches since they are merged in v6.15
- Correct GMU opp table in dt (Konrad)
- Remove smmu_clk from gmu clock list (Konrad)
- Update dt-bindings yaml with a new patch#1
- Link to v2: https://lore.kernel.org/r/20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com

Changes in v2:
- Fix hwcg config (Konrad)
- Split gpucc reg list patch (Rob)
- Rebase on msm-next tip
- Link to v1: https://lore.kernel.org/r/20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com

---
Jie Zhang (3):
      dt-bindings: display/msm/gmu: Update Adreno 623 bindings
      arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
      arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       | 34 ++++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 91 ++++++++++++++++++++++
 3 files changed, 133 insertions(+)
---
base-commit: bc720facc421d0ff6d568323035d1a4d5d35ce84
change-id: 20250213-a623-gpu-support-f6698603fb85
prerequisite-message-id: <20250310-b4-branch-gfx-smmu-v6-2-15c60b8abd99@quicinc.com>
prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
prerequisite-patch-id: 6a64b525e8ef33377b3cd885554b421fe8e6a192

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>



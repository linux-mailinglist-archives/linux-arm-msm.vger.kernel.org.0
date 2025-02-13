Return-Path: <linux-arm-msm+bounces-47909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E476A3496E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE15C3B1139
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DDB201100;
	Thu, 13 Feb 2025 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AybmQ+qw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823991F866A;
	Thu, 13 Feb 2025 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739463060; cv=none; b=SH/osj0WQpZFaBo1z79O9RgUcjLoCJSKR2rpfNUn5DdKrvF75EzTaaH0/fI9WjI+WCHW5oior03wOBavLOfKJ9LFAHhLhFkkbQ4QSVCblgXrZIKL9BQ2n7g+xfgek2z1ui/JjyEUdL1eqCwqudqkir/hsR0Ou8gZuSgNew1dH18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739463060; c=relaxed/simple;
	bh=aShwjUfnBQpsl1EcIoJd4jiVsoDI0EqhU/fFH6S/DiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hMQ92wynBuF0wUpuvNNxKxpdhm6Aj9bce5MZZsrMfxfohphMBrvzVPUpdj0ROZ+YQBwrx0IkhuJPMHpFEC7DFGav0ltHhFfnIgUR9ctH3ZNnJFOE8OFDSE+40IUvUXfBjN5uTLbpSsmUq3qyWJF+gKVwyJZDFkdgFIiZH3hfTAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AybmQ+qw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D7Ds6Y012187;
	Thu, 13 Feb 2025 16:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6n/9+FMrORD9wg/fe4EyKwLgbpamMGbJ0vQm1ZdU77Y=; b=AybmQ+qwLkpOOloz
	sHecKMyEVoARlX+dit8y/jEIIqfMqSRFNg1xVWlvWYyYeFd7O16djlh3QAazHeor
	+UX9kqaNzV130wirburv9upjHQHUY14dOuYRyUeSF2F3FE2a3EmbQCmwTzNGbZJX
	r+kQ0d2yH5wHA4T88DVgJ5DqXsOPI7Xcl/On1EjkhGnFeLCZKYYsGlDSADcXmo8s
	JpXjnFyoo/Fo1+MvgBxdOtwFPd1dopveMJHBtwJzRNw8jYiRNStIQKAwLFG5bit+
	XB/W5RxWlcGDbLwO19iko+Zg4PVUrTNdo7h10VRwD6Em9lzCIvPbD5FKjBxugZ5v
	znS0fA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc5u9dc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 16:10:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DGAhRK028766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 16:10:43 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 08:10:37 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Thu, 13 Feb 2025 21:40:06 +0530
Subject: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
In-Reply-To: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
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
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739463031; l=3871;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=tW3uCSr8aHyPnyQuY8uCfvxsskP6uTDXQlSBuuqaIHY=;
 b=5LyPQI0yQ38CTdWmvU6RIx7dzXqW1JkgU1CDeEL5JiUy7OM5G4powkbtYjZ5YPidJpBKde76J
 SlPcDKYWY7SCJU0qoqj7FSM6FqMIA19VK+lt+75PfYTUWRB8wClaC2r
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zLRB_fXjJL6JQIkrB7_UJP-i2K9H6W8X
X-Proofpoint-ORIG-GUID: zLRB_fXjJL6JQIkrB7_UJP-i2K9H6W8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=990 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502130118

From: Jie Zhang <quic_jiezh@quicinc.com>

Adreno 621 has a different memory map for GPUCC block. So update
a6xx_gpu_state code to dump the correct set of gpucc registers.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 13 ++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 17 +++++++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 0fcae53c0b14..2c10474ccc95 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1214,12 +1214,12 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	a6xx_state->gmu_registers = state_kcalloc(a6xx_state,
-		3, sizeof(*a6xx_state->gmu_registers));
+		4, sizeof(*a6xx_state->gmu_registers));
 
 	if (!a6xx_state->gmu_registers)
 		return;
 
-	a6xx_state->nr_gmu_registers = 3;
+	a6xx_state->nr_gmu_registers = 4;
 
 	/* Get the CX GMU registers from AHB */
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[0],
@@ -1227,6 +1227,13 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
 		&a6xx_state->gmu_registers[1], true);
 
+	if (adreno_is_a621(adreno_gpu))
+		_a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
+			&a6xx_state->gmu_registers[2], false);
+	else
+		_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
+			&a6xx_state->gmu_registers[2], false);
+
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return;
 
@@ -1234,7 +1241,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 	gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
 
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
-		&a6xx_state->gmu_registers[2], false);
+		&a6xx_state->gmu_registers[3], false);
 }
 
 static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index dd4c28a8d923..e545106c70be 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -363,6 +363,9 @@ static const u32 a6xx_gmu_cx_registers[] = {
 	0x51e0, 0x51e2, 0x51f0, 0x51f0, 0x5200, 0x5201,
 	/* GMU AO */
 	0x9300, 0x9316, 0x9400, 0x9400,
+};
+
+static const u32 a6xx_gmu_gpucc_registers[] = {
 	/* GPU CC */
 	0x9800, 0x9812, 0x9840, 0x9852, 0x9c00, 0x9c04, 0x9c07, 0x9c0b,
 	0x9c15, 0x9c1c, 0x9c1e, 0x9c2d, 0x9c3c, 0x9c3d, 0x9c3f, 0x9c40,
@@ -373,6 +376,17 @@ static const u32 a6xx_gmu_cx_registers[] = {
 	0xbc00, 0xbc16, 0xbc20, 0xbc27,
 };
 
+static const u32 a621_gmu_gpucc_registers[] = {
+	/* GPU CC */
+	0x9800, 0x980e, 0x9c00, 0x9c0e, 0xb000, 0xb004, 0xb400, 0xb404,
+	0xb800, 0xb804, 0xbc00, 0xbc05, 0xbc14, 0xbc1d, 0xbc2a, 0xbc30,
+	0xbc32, 0xbc32, 0xbc41, 0xbc55, 0xbc66, 0xbc68, 0xbc78, 0xbc7a,
+	0xbc89, 0xbc8a, 0xbc9c, 0xbc9e, 0xbca0, 0xbca3, 0xbcb3, 0xbcb5,
+	0xbcc5, 0xbcc7, 0xbcd6, 0xbcd8, 0xbce8, 0xbce9, 0xbcf9, 0xbcfc,
+	0xbd0b, 0xbd0c, 0xbd1c, 0xbd1e, 0xbd40, 0xbd70, 0xbe00, 0xbe16,
+	0xbe20, 0xbe2d,
+};
+
 static const u32 a6xx_gmu_cx_rscc_registers[] = {
 	/* GPU RSCC */
 	0x008c, 0x008c, 0x0101, 0x0102, 0x0340, 0x0342, 0x0344, 0x0347,
@@ -386,6 +400,9 @@ static const struct a6xx_registers a6xx_gmu_reglist[] = {
 	REGS(a6xx_gmu_gx_registers, 0, 0),
 };
 
+static const struct a6xx_registers a6xx_gpucc_reg = REGS(a6xx_gmu_gpucc_registers, 0, 0);
+static const struct a6xx_registers a621_gpucc_reg = REGS(a621_gmu_gpucc_registers, 0, 0);
+
 static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu);
 static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu);
 

-- 
2.45.2



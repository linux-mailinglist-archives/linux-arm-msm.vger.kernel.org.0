Return-Path: <linux-arm-msm+bounces-49755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF43A4897D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 21:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44DF03B2C21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 20:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0A326FA5C;
	Thu, 27 Feb 2025 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mM2F3NCw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F190C26FA55;
	Thu, 27 Feb 2025 20:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740686933; cv=none; b=P94crvt6oLjc8pM7+bvUzZh3Xv9Cgz/E7myc8LsUxoD4+PA0T2lmWnR/iY+hHSldmU4V70gKS7qEzfXLrT21GpYir8pVFJ3Mpw1/uXeDP2as/FFBTqj4v5p7TSgiJvYGgYMfXe1HNJwPEE4YRP6rc+iWzLdZe/slzpBQb3p+Zcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740686933; c=relaxed/simple;
	bh=UB9Ny/voKl4DCzQ/0tPOS97KgFsPEoL4gShbxPxNLTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=U+6ozmWoLF27+N8ROZFq3OUYwe+z8Q/ujuFSZMnoq8zxs8Hr9UAsGCTawLDpvBNyk1ritwFGCbo5feNnBWPI0vwYsqdDJSXTC6fdT8MJ48kfvai26Mqc3G3bRnMOw73rbHT3Mn6yfe/t6zBeDLAJN39W2hicAo5zNb0tn2H4E9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mM2F3NCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RJRlsX005768;
	Thu, 27 Feb 2025 20:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZpI9rrBfOQS6UCxuOktsHGSqzVVpwZkqHv91xPL+uDs=; b=mM2F3NCw9RTLRElW
	gjySOu10osAWf8XnWWu0FRGer6PqVoe4+vbxbVsjy1Rf2kPXVg0XNgdtZogzIArY
	80Sz48iRfhAuYencZPBW4gvJz7s/mUw3UP9u1PhZ5bGteWxjTKZJSinrkoyLCRJ8
	jcxhWs1CaJk3hyvrRlZKun0hNEK7RLD4mfjih+u9FiQFYejy4V3mAbizCiUwjj9g
	iOPmpJOCJqlCHQIfcN4YrR6mVrKxbz/8fyklsphIbwZpHnYy2eJNABpKkRnBL6qj
	rBwxiNrzD+9njBo2uyVdpoIDQwbt35/fNPcHMrE9R2nKrzJibAaGfhMXhx1eKIbC
	s+/QiA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452be6kh0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:08:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RK8fME002521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:08:41 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 12:08:35 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 28 Feb 2025 01:37:50 +0530
Subject: [PATCH v2 2/6] drm/msm/a6xx: Fix gpucc register block for A621
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250228-a623-gpu-support-v2-2-aea654ecc1d3@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
In-Reply-To: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740686902; l=2829;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=70KMrkhJRIJup3HaWYI2iranpFlA4gjazCTPcLhltEc=;
 b=rWK/R5AnN0UanbNvQsnaI46+Xk3coIdHbOGgEv+CmGYiPrzgfkMA4xx2AP/k9n4OOHpRWhaQu
 c7CnMOXf49jAaCyrfv8Bkx4/C5oBqfHbLAxr5s9B7O56Et7se1Xn+Rj
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qAtrHh657dS8EQ2qzjwL2Qm05ctlL6xv
X-Proofpoint-ORIG-GUID: qAtrHh657dS8EQ2qzjwL2Qm05ctlL6xv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=939 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270149

From: Jie Zhang <quic_jiezh@quicinc.com>

Adreno 621 has a different memory map for GPUCC block. So update
a6xx_gpu_state code to dump the correct set of gpucc registers.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  9 +++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 12 ++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 81763876e4029713994b47729a2cec7e1dd3fbb9..2c10474ccc95cf2515c6583007a9b5cc478f836c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1226,8 +1226,13 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		&a6xx_state->gmu_registers[0], false);
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
 		&a6xx_state->gmu_registers[1], true);
-	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
-		&a6xx_state->gmu_registers[2], false);
+
+	if (adreno_is_a621(adreno_gpu))
+		_a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
+			&a6xx_state->gmu_registers[2], false);
+	else
+		_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
+			&a6xx_state->gmu_registers[2], false);
 
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 31c7462ab6d7b877c55abc04b98c0a80dac87759..e545106c70be713b07904187a9e246e08499f228 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -376,6 +376,17 @@ static const u32 a6xx_gmu_gpucc_registers[] = {
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
@@ -390,6 +401,7 @@ static const struct a6xx_registers a6xx_gmu_reglist[] = {
 };
 
 static const struct a6xx_registers a6xx_gpucc_reg = REGS(a6xx_gmu_gpucc_registers, 0, 0);
+static const struct a6xx_registers a621_gpucc_reg = REGS(a621_gmu_gpucc_registers, 0, 0);
 
 static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu);
 static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu);

-- 
2.48.1



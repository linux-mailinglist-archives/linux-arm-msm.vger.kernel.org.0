Return-Path: <linux-arm-msm+bounces-39118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 516409D8A70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 17:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53705163973
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 16:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB3E1B6547;
	Mon, 25 Nov 2024 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cnuf99e9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219EA1B395F;
	Mon, 25 Nov 2024 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732552424; cv=none; b=BmQcW+QyFocY5eGlQCRBAtAumNGxfhscDNokaUhcYg4L9UjOPwDnZ1bco0sXYrXh1uPkRAHpEHSu/NKw6H32quS4BSYSvQ3wHqVUeLsryZV9jom8DRY8NW3op5jDlDKz50dArwN0ahHs4+a7d2yMhqCyXEY9SPcyWFg9DWxSqbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732552424; c=relaxed/simple;
	bh=0b9nQ9EfEGB7VdwrbTXtga4eH63LhXyAMy4kiO4tCFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OPONgWxWJAOEiXke/kdALICFSzxCdpwD1aUx5TESP7TV9rRa+akB62MMI/hhMUfAKvkpWykOOk6/VizV4VFXZgoFKPnkd6O5wANZNBCTOaYMZxW9NGeuYkdoF2UHVl8F+BKPvIVXuVrYh81JdUvR31mXw7bJJ8XhiQysgbrfamo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cnuf99e9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APAThuE030525;
	Mon, 25 Nov 2024 16:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXwZ4NQeg2R83ST+/G9mV5EeOQPsGKzHl8DwiBSaPf0=; b=Cnuf99e9dIiuKCMx
	ByPZG/MFdvpLc0f1xFzZXNZfgNCzYXgZAQtz/nVVhE+ZxqYY5nvS7KY9zWxgM9We
	FaA2fCzLZrDtk9+p6Mf5rbBMTM3+a8naxhrBOPFC2kcJCUYkRhTVP+GgXQ+O20rN
	VphgkWc7tZ+RVISW2f15sELf6AJkqG0dZIc92wDBkchrdSTgBAWSd/rNTbHgfezX
	9yQQjzbuRJOcIreTNx8oRk7CY8d1eX8xznNPflsIG8DyvxmplMfv9shFephqONJY
	XkTAscM6iiwf+HSFz/aP4NJpWb2MkkYMmNNBjpfMJCA3PwL86l7wHQ7SZYV4h0F9
	svOKRQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334rd5pu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 16:33:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APGXXjT012170
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 16:33:33 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 08:33:29 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Mon, 25 Nov 2024 22:03:00 +0530
Subject: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
In-Reply-To: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732552405; l=3061;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=0b9nQ9EfEGB7VdwrbTXtga4eH63LhXyAMy4kiO4tCFM=;
 b=+SJGYWgq9yxKiYn3ZSxrnMbKX777dwuVlseoMW1ZaZkAjZldfdlIFzAGeJTVAkDl1JU4RKR83
 6gYmD9886rPBbAaSRxJhHcnK64UHEe3NrbOszN6vIKa789eyuabTTII
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Gdpj4VDYfPMOG0uBDiVDZ3KD8-5yWVkY
X-Proofpoint-GUID: Gdpj4VDYfPMOG0uBDiVDZ3KD8-5yWVkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=924
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250138

There are a few chipsets which don't have system cache a.k.a LLC.
Currently, the assumption in the driver is that the system cache
availability correlates with the presence of GMU or RPMH, which
is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
with a full blown GMU, but doesnot have a system cache. So,
introduce an Adreno Quirk flag to check support for system cache
instead of using gmu_wrapper flag.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a..5e389f6b8b8a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = (SZ_128K + SZ_4K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_NO_SYSCACHE,
 		.init = a6xx_gpu_init,
 		.zapfw = "a610_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		},
 		.gmem = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_SYSCACHE,
 		.init = a6xx_gpu_init,
 		.zapfw = "a702_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 019610341df1..a8b928d0f320 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
 {
-	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
-	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
-		return;
-
 	llcc_slice_putd(a6xx_gpu->llc_slice);
 	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
 }
@@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 {
 	struct device_node *phandle;
 
-	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
-	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
+	if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
 		return;
 
 	/*
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e71f420f8b3a..398be2218110 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -57,6 +57,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
+#define ADRENO_QUIRK_NO_SYSCACHE		BIT(6)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.

-- 
2.45.2



Return-Path: <linux-arm-msm+bounces-49376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF64A44BDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 20:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 740021890579
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE25205AB6;
	Tue, 25 Feb 2025 19:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kMjeqMJA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB617E015;
	Tue, 25 Feb 2025 19:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740513163; cv=none; b=UgY9XgG1Vc/SZkg/sKsgHLBmze6XupNXgL5oiGhnkUujPwtrFTInq/3qo2VcIK1Bu5KQe7GjHprubd2Oz5sWSrJRBuOYwucHFiOfJ3pRUZxLmIWEOggAN2y9tb1r0pR7Fzc1TeRH1vM0pefdLKpyeiJsI8mSB1AgC1r7rxDDekA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740513163; c=relaxed/simple;
	bh=oIhL+Qdbu1UaNBgkh+rV4EwGPx0L/bL4d+e/qgMhUKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=UQatmhuAfNKsR6Z7Mq3eMg5alRLBS+ofqn2ssRJADjVJRWooJ/GRbZUwgNqukNrQ7pVdofl10j3/SWVbSBP3Y9oZpQ02nNyOPDuemwWFv4cAsUd4Fpt6Z0wzl3rTyrIyTPsjlyLpVyh2+SG1UZyO/WOIg2Jok5GWody89evUWbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kMjeqMJA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PHinoW013301;
	Tue, 25 Feb 2025 19:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RrPOkSjYbqRM3KAmIfVN6s
	d80ddpWeBNzJEAuPYvib4=; b=kMjeqMJAeRyUkJVceGzPvk/pEL2c2+wy81Wujd
	VHM1g1w/bdUAML21OSwy96QL0BrdgGJ6V5WeLidYD1lUWkv7XLFswC3HfKSSj3uw
	Q2+sipoaVwOrS3ETV77d+58YvJay87V3dfEP0kLYPGInf9N28wHKRFsT5yoE41kc
	ksdASu1L/RiDQKfL8CNY7thlAJ8Elz2wwsl5fwfQDJwpz4bY0XAlV+F/WcOJenG+
	KyGxlvDMIuBMv92NzxwujM9Qj8SXzAMncTDZZRFwif67ztaJqLM3BM9MjeuqsV9j
	x7GMnac9mOr6JJFOqLM5JajYuZfda3S+cKwrvsptj1UPXZ+g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgt44k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 19:52:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51PJqU6F016222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 19:52:30 GMT
Received: from [10.213.111.143] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 11:52:26 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Wed, 26 Feb 2025 01:22:14 +0530
Subject: [PATCH v2] drm/msm/a6xx: Fix stale rpmh votes from GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250226-adreno-sys-suspend-fix-v2-1-cc9628d583ed@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAG0fvmcC/3WOwW7CMAyGX6XyeZ7iLGkZp70H4pA4LuRAyuJSg
 VDffVk5c/x+y5++J6jULAr77glVlqx5Kg3sRwd8DuUkmFNjsMZ6Q2QwpCplQn0o6k2vUhKO+Y7
 sIw9RJBh20J6vVdq8iQ/HF1f5vTX//BohBhXk6XLJ874bbDJhdIE5ffc+8ZcdvXHOmTS4dnGJd
 nEcdgT/rnPWeaqPrXmhTbblWdu/y1sICY13tqcYA5H7aS2cC3+2Ajiu6/oHLYmcDAoBAAA=
X-Change-ID: 20250110-adreno-sys-suspend-fix-c5bc7beea0c4
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740513146; l=4190;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=oIhL+Qdbu1UaNBgkh+rV4EwGPx0L/bL4d+e/qgMhUKA=;
 b=092qsXfcOFw3ETYPgMSy1zSqbQyxWUM+17l4lMjbcOTzy8M9zEEc5eWnScMMw1/fLfEi9QJmy
 S7HVwvjy79vDuHI5llfILigpY8ug9Zo+XgHic3WM8y62flP9kQKVZfk
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7KmwKPSKBkTJoDMNo38VqcOc9byaNS9R
X-Proofpoint-ORIG-GUID: 7KmwKPSKBkTJoDMNo38VqcOc9byaNS9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_06,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250120

It was observed on sc7180 (A618 gpu) that GPU votes for GX rail and CNOC
BCM nodes were not removed after GPU suspend. This was because we
skipped sending 'prepare-slumber' request to gmu during suspend sequence
in some cases. So, make sure we always call prepare-slumber hfi during
suspend. Also, calling prepare-slumber without a prior oob-gpu handshake
messes up gmu firmware's internal state. So, do that when required.

Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Cc: stable@vger.kernel.org
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
Changes in v2:
- Minor update to commit text and CC'ed Stable
- Link to v1: https://lore.kernel.org/r/20250226-adreno-sys-suspend-fix-v1-1-054261bba114@quicinc.com
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 72 +++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 699b0dd34b18f0ec811e975779ba95991d485098..38c94915d4c9d6d33354502651a77c1f9e4648df 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1169,49 +1169,50 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	u32 val;
+	int ret;
 
 	/*
-	 * The GMU may still be in slumber unless the GPU started so check and
-	 * skip putting it back into slumber if so
+	 * GMU firmware's internal power state gets messed up if we send "prepare_slumber" hfi when
+	 * oob_gpu handshake wasn't done after the last wake up. So do a dummy handshake here when
+	 * required
 	 */
-	val = gmu_read(gmu, REG_A6XX_GPU_GMU_CX_GMU_RPMH_POWER_STATE);
+	if (adreno_gpu->base.needs_hw_init) {
+		if (a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET))
+			goto force_off;
 
-	if (val != 0xf) {
-		int ret = a6xx_gmu_wait_for_idle(gmu);
+		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+	}
 
-		/* If the GMU isn't responding assume it is hung */
-		if (ret) {
-			a6xx_gmu_force_off(gmu);
-			return;
-		}
+	ret = a6xx_gmu_wait_for_idle(gmu);
 
-		a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	/* If the GMU isn't responding assume it is hung */
+	if (ret)
+		goto force_off;
 
-		/* tell the GMU we want to slumber */
-		ret = a6xx_gmu_notify_slumber(gmu);
-		if (ret) {
-			a6xx_gmu_force_off(gmu);
-			return;
-		}
+	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
 
-		ret = gmu_poll_timeout(gmu,
-			REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS, val,
-			!(val & A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS_GPUBUSYIGNAHB),
-			100, 10000);
+	/* tell the GMU we want to slumber */
+	ret = a6xx_gmu_notify_slumber(gmu);
+	if (ret)
+		goto force_off;
 
-		/*
-		 * Let the user know we failed to slumber but don't worry too
-		 * much because we are powering down anyway
-		 */
+	ret = gmu_poll_timeout(gmu,
+		REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS, val,
+		!(val & A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS_GPUBUSYIGNAHB),
+		100, 10000);
 
-		if (ret)
-			DRM_DEV_ERROR(gmu->dev,
-				"Unable to slumber GMU: status = 0%x/0%x\n",
-				gmu_read(gmu,
-					REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS),
-				gmu_read(gmu,
-					REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS2));
-	}
+	/*
+	 * Let the user know we failed to slumber but don't worry too
+	 * much because we are powering down anyway
+	 */
+
+	if (ret)
+		DRM_DEV_ERROR(gmu->dev,
+			"Unable to slumber GMU: status = 0%x/0%x\n",
+			gmu_read(gmu,
+				REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS),
+			gmu_read(gmu,
+				REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS2));
 
 	/* Turn off HFI */
 	a6xx_hfi_stop(gmu);
@@ -1221,6 +1222,11 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 
 	/* Tell RPMh to power off the GPU */
 	a6xx_rpmh_stop(gmu);
+
+	return;
+
+force_off:
+	a6xx_gmu_force_off(gmu);
 }
 
 

---
base-commit: 72d0af4accd965dc32f504440d74d0a4d18bf781
change-id: 20250110-adreno-sys-suspend-fix-c5bc7beea0c4

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>



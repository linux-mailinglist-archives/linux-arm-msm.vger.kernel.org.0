Return-Path: <linux-arm-msm+bounces-49375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1EA44B70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 20:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65E773B06D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EC842A8C;
	Tue, 25 Feb 2025 19:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CHopUVH8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0467821ABC6;
	Tue, 25 Feb 2025 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740512237; cv=none; b=VsFa7jkIff+fLHKHOyQqDh9Dayj+1GIkIRD74lwYwqS8gG8bw5ekaqtVmoen1FBcSOAk4JPT9NKn9Lrjyu2JNYjzr4Y1zX+ZhBSVDCVsYHFBprF43poh74yxZ9EEx7Z3uTtmEjdcgMeJUhoXhBlnwDFa7awKAQlYQdl1RLqssIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740512237; c=relaxed/simple;
	bh=VjH9vNCiu3abfUxNaT6nINjS7akZ+Q5dBNiweXmoEpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=CAYjKrsNFvvTjyfYmbNp/MWJz1z8lTHrCGaU+kvhDaWqWTowDaqYstYQWau6H1vO/LdT/Rhl6cKV5HmNUDXBjghpB5Z4tJT41wZ4hOKi5A7+MS6IuAnWhwJCIXU9xzA/BH0wASw5KaTMEf2XiBlsxMbfGpw5S9CGp+kga4elm+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CHopUVH8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PHsERo013305;
	Tue, 25 Feb 2025 19:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NodEt7I6mKquqqHW9X6vXf
	RbJ/et24sQ+jaIy1bvO/8=; b=CHopUVH8pp4Jga397zRqXK3U0RQsyZPT3S5P7z
	MNFFL/Zzr5DxUjUIapcK+/N2kt2i/s4PXawWtwq4lEiBrwEn1wZe3Eh6Azd5TSRL
	VJ3IvAflrXjXqXfzLAcs0mlu3Rr8k1AgFkjajoRcIHoO+HpwH8/s68gEFDtMFicE
	0ylKqjEcGTvnKMPqm4AZ5do7w6Q6EgXFc1pa65PNSqon4QhGw+3h+tlh3+tPnKDq
	TgCeOH6eD+lpdHdTP7fQELpqmPa3+ngnv+hgpOlaicefgnYGJBx6DN4v52AwOXFj
	rurAP0dEmy6wkY6tKDPKUUHUZxpqpAFp8MpRWMjmJpYlUFTA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgt354-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 19:37:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51PJb4QK023736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 19:37:04 GMT
Received: from [10.213.111.143] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 11:37:00 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Wed, 26 Feb 2025 01:06:27 +0530
Subject: [PATCH] drm/msm/a6xx: Fix stale rpmh votes from GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250226-adreno-sys-suspend-fix-v1-1-054261bba114@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALobvmcC/yWMQQ7CIBBFr9LMWhJAkOpVTBfADMqitDKt0TS9u
 8Qu3/v5bwOmmonh1m1Q6Z05T6WBOnUQn748SGRsDFpqK5WSwmOlMgn+suCVZyooUv6IaEN0gcj
 LaKCd50pN/8P34eBKr7X1l0NC8EwiTuOYl1vnNEqfjI8RrxeL8ayTlcYYic60xaDqQ3K9gmHff
 1VYOkO0AAAA
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
        "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740512220; l=3990;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=VjH9vNCiu3abfUxNaT6nINjS7akZ+Q5dBNiweXmoEpk=;
 b=xjeoldI0qTLOM55Y/lXODIcejB2UM+RT52Zi9F1KAGY1zYhCeMv3PF61EpE+S+2nLpXBjGbb3
 jfEjeUqdMa9B4nXL2pIy9Xy+SRPvE9a/twflug4wm4jbiUoeyauiuW0
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4LJM5ITYHbAuK60lqsvi9heg-2MBJssl
X-Proofpoint-ORIG-GUID: 4LJM5ITYHbAuK60lqsvi9heg-2MBJssl
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
in some cases. So, make sure we always call prepare-suspend hfi during
suspend. Also, calling prepare-suspend without a prior oob-gpu handshake
messes up gmu firmware's internal state. So, do that when required.

Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
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



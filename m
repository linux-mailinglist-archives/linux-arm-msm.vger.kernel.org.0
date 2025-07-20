Return-Path: <linux-arm-msm+bounces-65797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAD0B0B602
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA873AC9F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792E121E0BB;
	Sun, 20 Jul 2025 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJzyONwu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA19202F7C
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013861; cv=none; b=I2+ootomZU+eSnNCB56ut8YdOj+ZBOrlTaLeWoKgOzX6B5Os79SlSyl5l87Y3U0ACZoPszMOHJ8LIFwkDxTWoQ1cS1QpCmsLq+ahahgtDn4zP1ENXDxu9g3coRV7+RW4i7k61+RC3kLKgzLl6G2Qes0Q6c/4lxpOEHVX4mN2y5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013861; c=relaxed/simple;
	bh=wqJpkzMI0ES2mEy8nQuiLa2Vdj3zgdiMb0q9pTdHGtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/aKgIHGyT35D5g9hI++XVtN1y1g5NLtWhnBgr3P0ceYqRu3YaNZ2G1aGfsNSR3A3/O35FTqImXb2U+NFxwi2low86AMA1ZeNJVsnfbsO76nX5tPqrGuQuCCz/yhByS8yHoCuJQKDjNMbXCk/hejvt3efv8n5xRJlkQx5epIAaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJzyONwu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K5nA51032459
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SthMOvj/tgeikoDF1DaOQafMj/mya3JcY+MR5c3vfhY=; b=XJzyONwuCsAmdsVp
	uEWekU2mkMBk4NTwwSL9PejCmB3rrqq5cBzI1VJRBOZUvRCI7S4NmnHYRYAZVcOF
	8tk1Zt9QV2SlNNq1dKfGjLQc27saRaYg316BXpDQzXApdRMnwjYoV2U6srXv8B2j
	R7YBHu8tBMnwk4NiIYrTA8R1rIJliXww2wqFTZTNL/Eru1vy/S4obpD7b8jd8sgX
	9H9HfN4tu+vyvWQFWC30IQ1dIEP974jiM5kgPcmHP+FbTCD/aAFOhbzay/APWrjs
	ebsH8/tg1KAS653ZxrKu18MBlDMIZJtz7B1da/R5iOiCkYzFjrdsi68pUUJarbh+
	ZmtjKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vt5bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7489ac848f3so5495129b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013847; x=1753618647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SthMOvj/tgeikoDF1DaOQafMj/mya3JcY+MR5c3vfhY=;
        b=ganW1gcRCoYTA1AaOIorxE+MB5UvMz07rS8ss+vkKgzZo1XQV5kN5fWDnDQmZ2s2Xc
         PCOYU0NKhNPUMD0uDMRCkzX8dJiX46P+vY2PwPCfVlscgVpshkBOZkXfNsJgjVP90p+Y
         BZNnZPBNtD1oHhIyMjy71EvO/HAD1oisY22KEBfiqKMc7LVgcIBI5sDRxhl2SXRPU967
         UktROuSh4QsKsHvcl+pw/LKUdz3L0iFYeSTH1R8PW3eh2ayNgEZ9Ml7fdXjrd+xDQ2Ui
         1anwOCa9ryEWM2cTcljcvhRMdfwSPUz1BI2Q/DywsIUXwPSIj54T5KUvPDb4bKC21VsE
         INig==
X-Gm-Message-State: AOJu0YwEc7DnJvO6NiBJIM7z+qb/i7uyfIsSCslgN+05LNJsRxagZfGg
	gBg6d5oGvxE4tj32Yty2b0Drqs9z06YkA1xEP3rnkIbkJzR3ETL9dV4+Nq+Fz/gRpUKqC6E2TIe
	IdRZg3s939azjFUVfesymZ8qObYl7m6CduaY6i+P1V7xv2AbqbpE9UE7MsbxqOzpyZVU/4mj+G6
	N8
X-Gm-Gg: ASbGncs/7mjYUc8FQku0f96HY2Yby/xD6Yoc7FPjTHWu0O7oARoQbljNhkTO2BZLSgx
	ANxExZF+p+RqFPkho+WRC4tSKat0uuldkqFBdMwD2/QYF3wT8AgqVVnJuxmYcdVXoL1Q6I5sK6i
	XNacC2Gyr0tXwQmvsjbGigVuB426JC1A/PGw1z79QWpj6Npe1s2mLpkZUrmzaxUqKxF8cJKo1BD
	iD6Ny4J7oBC6qeRyxLcsKzau4obxoV32xaI7t+H1GlXb3kXsmsTtUTf0TmIf0o8+w6ni8YvTtsv
	T24mAnN5h+eKFM77tAxikZBHFjx1t+8U+b7iJmHszRLMoZkzUWqVo/+/4QfLmgY1
X-Received: by 2002:a05:6a00:98d:b0:755:9110:c00c with SMTP id d2e1a72fcca58-757250806bbmr27254973b3a.11.1753013846851;
        Sun, 20 Jul 2025 05:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs1tuitviwC/J4/O6Bb16mbD1enJVUrTELkd81BeF8q+yHvYhQvPif6zen4HAAh/KoTrNivA==
X-Received: by 2002:a05:6a00:98d:b0:755:9110:c00c with SMTP id d2e1a72fcca58-757250806bbmr27254940b3a.11.1753013846439;
        Sun, 20 Jul 2025 05:17:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:17:26 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:10 +0530
Subject: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2596;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wqJpkzMI0ES2mEy8nQuiLa2Vdj3zgdiMb0q9pTdHGtg=;
 b=dN5Ha5ZJ1vy2SWgzYUESebNz8sZiXP+h4UlpLjzQ6YYCuUUyAbxGHHl1x/rWbxhGlW5EP8351
 +4ZawQy9qRBAIE8eJ5Tx+2jrBUEsUpkB+yuxg9EPmPkcPOU7ILwLRhb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687cde61 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IO4KcYcNY2hykouNLhsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: EAiMo3uXAz2dtF71lmGUACWP2Eskf3SI
X-Proofpoint-ORIG-GUID: EAiMo3uXAz2dtF71lmGUACWP2Eskf3SI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX4kwEaT/Zpqjs
 0s684RDwmjjo2ez+PHx9ybNp58xQHurSJv9mGwxihS5ocCzauCEzdtBEsb4XCO+C60eW/nG30t3
 z0WHehrE4s4imrVXbUSzedEV9c3so5PI3vBW3QzGHpDU1A5V421n9jcIxDAaw+5EiXGEzSndpXN
 U31TM3LhbO51UR5kf3ylb3pSDJBp9jZAfE6UIGVx198iaGxT7RlwcA3AvJ172xdgzX0VbO6BZjk
 igYohPgOaB9dzXgfmMq6XRgp9N/o/ZoEZLBf8YUrg1sr+4ww6jgyXffOXeI6NSjgAN7e3DyBVxv
 Lp65NPo2FRUq5RoBAtexucVziCTn/Xf+CeBZIYuge2DheGKaH1Eny/gUlPJ/OxAktngncb6L2Qc
 rCFVTNaHgcyY3vU32F18HoicxrP0BakwZTuWS00j7jh2XMO9o8psj/CKf7c94WFKQ8kvfJp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118

CP_ALWAYS_ON counter falls under GX domain which is collapsed during
IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
not impacted by IFPC. Both counters are clocked by same xo clock source.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3c92e590f14999d10d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -16,6 +16,19 @@
 
 #define GPU_PAS_ID 13
 
+static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
+{
+	u64 count_hi, count_lo, temp;
+
+	do {
+		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
+		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+	} while (count_hi != temp);
+
+	return (count_hi << 32) | count_lo;
+}
+
 static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
 {
 	/* Success if !writedropped0/1 */
@@ -358,8 +371,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 }
@@ -559,8 +571,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	}
 
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 
@@ -2246,16 +2257,7 @@ static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
-
-	/* Force the GPU power on so we can read this register */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
-
-	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	mutex_unlock(&a6xx_gpu->gmu.lock);
+	*value = read_gmu_ao_counter(a6xx_gpu);
 
 	return 0;
 }

-- 
2.50.1



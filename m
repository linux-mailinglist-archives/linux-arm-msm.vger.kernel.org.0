Return-Path: <linux-arm-msm+bounces-72520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5542EB48730
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F56B3A1EF0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3762F83D7;
	Mon,  8 Sep 2025 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BnHMSviT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143772F83A5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320085; cv=none; b=AqGp2LUlA2xPg2e29MsNJm5TVmMfvtlJKSpVDvwuJKzerrAnEkUUtXi6Xi2CBuAN96FArR6a49ekzpRonpQXTYu7JjzLEJFASUr3EQU718Q6nsag5R9vmMUxJpQWDTOvZAei4FLQykvhHzJvhb4+5LDw+kklfOAIjEcfebJsh2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320085; c=relaxed/simple;
	bh=BnBwOePYgAk3DH3Xs1s99xX8yvtkGViS+FKVC0Tm+Fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekDtyAqtQ4eo9LFSL30yPxsjzqyl2Jxr5NXXKBSxh5EjYwqEB5nxseIGZNiTmvLCwL2Ksm8A6bze+Nkd6yte0VsosZkHoygdvQ4OF4MnX3ZdZpAEEalOeYpDYkGu/LXP6FLN/PTQMOZn+Q1nErHdoq9pRH+WBGkj67+nhU4iMq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BnHMSviT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587IA28G018400
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZyO3Nq93Bf/xQ1FnubJPlIMWCRx8r4Toxq5+4c0O5k=; b=BnHMSviTEesJu1Az
	snAreBs3+0WgA3WFrF2l5dpD/ZKSciieP5EARfjD5pZAErEWC0Cdnd8/iI6ppJ9L
	ZekdmBqXOEZ1tr4bC+XBZOD3ULLsieH3UOnLnCODkhtZNRsMciNoZySZn9sgynul
	fOT+ug0FK7Jr8FTvur3X5xt6B3ANZcfJ3P6joY9EC5CmnlIaZUI+4X6vZJgZ2LwE
	FO3kIWDfwt6YEY04F3raSr7TQZ57mj01I/RG8KfjK2pzh3uvBiznnzDTLYvEKiX/
	EIbzbuFUs/MNNBAT1WRUQmcnHrd5PuPo8tEQ/L3lOp3LxDjMwJ2LqibBHY5Yeal6
	qlqhQg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8uw4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:28:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-772299b3405so8818874b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320081; x=1757924881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZyO3Nq93Bf/xQ1FnubJPlIMWCRx8r4Toxq5+4c0O5k=;
        b=bWvZ3p+vryU2tEivoJwNXKWCFASbmPvoVwURfdcHGi/4nqF6wqFqAPIAv6DkGy6Hq0
         tGXS1U5K5vsOlbIV+d4fdmhrLjs/hi1WsKZVMZIum7IQGH34iDdfnIHF1p+mOFkyB1Sc
         k+n6EYcmA9OM4gwuL7mKk0Poo71Y+8ZzGJV18HZzuUa5HTez2qySPunriXeJ5fbIwnnP
         771V5HYGFBfbQR3vPrZwg/u/2YFQ/Cs/bGn3gorUZ0F1EH831SI5130Y7kq8HDdt9c/V
         L74xFFYQFFILXCfFIsZ18hBf+oQKuNV1xBSkcM2GTU+3hwfQYG4QoMUcdXJvVBATpOrh
         AC8g==
X-Gm-Message-State: AOJu0Yx9rCJgwZ3vQm+/NCFaVhkNlFxR1cfG+E/T9SjLORA4saaY5aXU
	dk+hdOCbKbAvK72degUIJ52r733WwBHGlP/pkIjp0aMMJIu1yUJmJDQxnjI/HXDZuhcH58A2tZJ
	e/cXNiyhwyBvUK28IkoLDmA59p8TtbkPtfy87Fp8pa2OdL/yyQBVFlz/pj2eoK9uf3LyH
X-Gm-Gg: ASbGncunaioSLLytuB6JsUA+SbjlR1/EL9EWxil0YO1nB8ypL5QGxv8FyZq2VBKaLvz
	m5mZPpgWyijv1UDTU6DkNoFLjbu4qS/army6L+oQnqy4e1OP2EKZN+AKVvIsxiMgs7NTL2Ip17Y
	gBHiJiJPG1SpqtWukokwSDufQLUpNskHWxVeJJdM+5Qv+lrFLaqTC+W+OuuNxkEJMw0VsxKjmdU
	nPJ531Xn2LqYjSP4rb/ywlN7pykYeBsL2ShPr1OplW1HH6DIB/4XG/5SlOx5eCqFC8tw6Ry78cE
	Gfvbrz0KjIkcf6t22ap0pbBldL7bo91HJUH62mhGWswkunzVcthCMXd5KPxEdMkV
X-Received: by 2002:a05:6a00:1489:b0:774:20a0:dd65 with SMTP id d2e1a72fcca58-7742def5affmr9598650b3a.18.1757320081356;
        Mon, 08 Sep 2025 01:28:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA/YHKsqfgyAor24HUBSKnNnWTsB78uSq0VADVG8FDB/BKgowEMs4Q/v/ZpMOJN0/Ze4YAVw==
X-Received: by 2002:a05:6a00:1489:b0:774:20a0:dd65 with SMTP id d2e1a72fcca58-7742def5affmr9598614b3a.18.1757320080912;
        Mon, 08 Sep 2025 01:28:00 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:28:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:02 +0530
Subject: [PATCH v2 09/16] drm/msm/a6xx: Switch to GMU AO counter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-9-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2606;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=BnBwOePYgAk3DH3Xs1s99xX8yvtkGViS+FKVC0Tm+Fs=;
 b=J31mz5s4viqszzEmkcEfZjUtCxH2Yw01ajJbFJ25U/VAJMLlEvOdpS0BogFIDeLhaY3SaHt1M
 MwcJWKugZ1QB2hkmvF0EeEVLF3Hs0+joMGgptu4DLTNtzaUEzS9JIkk
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68be9393 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IO4KcYcNY2hykouNLhsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: a4bBQVIoLu5qmftiyvIpgDQkd6E-QQcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXzVkZJz2rbL3J
 avjftf9wT7HrM/b8TKdUXOEpPXIkECsU9qAmLFwx1da9lrf8tgt25GBCw2SyOGJNKcmCU474Ekd
 1/PdwfyB22/WVUnV0AHpbmYSYFd446KlN/ObwUTJw/4ilIegjBRc38nwc+OG7vT6yImCN6JmbUP
 Bwr7WFuS3lnyj/aTRwiYDUrJ3Jnqy/BvM7DwgbwjrBCH2mXVVc9OyFUq08ZtBCYZHHqGPYvOFJB
 6fC4lVqnkoQPLc/ix4NGenzqMvrD2hkj7FN0A6M0nb1WvN57GOWV9RBqNGsUhdj4qSzieD4SclO
 0Py9vvFL9ZtpvgF73jU68Kp9/wi8EjfzJ954CSTdF/GcdH4FyxlBQARIzq8h0Z95n6U6+W96zhw
 gcUsFV+b
X-Proofpoint-ORIG-GUID: a4bBQVIoLu5qmftiyvIpgDQkd6E-QQcC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

CP_ALWAYS_ON counter falls under GX domain which is collapsed during
IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
not impacted by IFPC. Both counters are clocked by same xo clock source.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 33a26bbd245ff49784bf1219a584936b4caa62b6..c64c84affa6821f79ea74b80b2f2014df38ec918 100644
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
+	} while (unlikely(count_hi != temp));
+
+	return (count_hi << 32) | count_lo;
+}
+
 static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
 {
 	/* Success if !writedropped0/1 */
@@ -376,8 +389,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 }
@@ -577,8 +589,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	}
 
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 
@@ -2265,16 +2276,7 @@ static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
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



Return-Path: <linux-arm-msm+bounces-81073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E1845C481F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D8964F6273
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F47287506;
	Mon, 10 Nov 2025 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ns6ldHOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxYBm+dj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962D2313E06
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792740; cv=none; b=S/4ktGfJA1RJ6R/7IkjfK9A1RaBTlT6pn1K6fyvqbAdEhIC1WDHtQYQhZU6EmkkdcMplYLCgAKRuyoVkPyoUtlQXgzsYFBRLILznjAurPTc7zfbnuJuuR6m8aLNiIGxpIK6AC/Q0I9T1rTDpNWAv96YBjW3h0h9FVIKkW+7LLbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792740; c=relaxed/simple;
	bh=8uOk6MoHQ4XtxnDe/lI2Mr7cqNt7gTyTYYefSPfwTs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ej5YrjRoJpzmoT8JHx3vnBWgH4CM1tKmflx5tz8cQr/t1ga+IFAeJWTKiG2QPLPEwDmd7wwI5XikmjZ9ZCIlRdVQoFmb7FPLtRyHi4oEcrIcfJGi5Gn9fK0eOdJs9h1GpqVSz448d6SLpZeNi9LEWfxnb4C67fluXq5puaPrxo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ns6ldHOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxYBm+dj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACMvHk3306813
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oes+EnLQiIXAxPUxYP+Mc2ycI3/yrDxiwXneiCBW2Ac=; b=Ns6ldHOfieujVYNh
	ghYYNnXV4LNbii660TohN4WhN+8dtFwvOhjTDagzEa0FHAHZz/xPpIgzs1zrjKiv
	upPq8U5Hx/igLzr/076pubKzv66l9wJ+jsewA9DhWsmPrm4TMR3cHzqkNxi6lSVR
	fgPWpOESTsJX8QNInYm3pTqDwuANk787cbS24AU97KwEXGw7jwn0ix70KgSUJl2W
	YucqnZw638bHZsBmDvUbsdeOXczN3M/VCRT3Bjeud0A7SKVWUdD51EeSSikdBfND
	ycnFm0L0XIXkO9n9rWLRuiTTkWY3zCEb/FMvCFWIb0cL5GuNPmovWLwGWmRg6gdH
	/XqVPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q8ruf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so4104338a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792737; x=1763397537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oes+EnLQiIXAxPUxYP+Mc2ycI3/yrDxiwXneiCBW2Ac=;
        b=KxYBm+djQcE8Ng0EwebNu+JdvYa9yZcqcoJfxw1qQ+XGIugImhNE3tR3ydxmBsm0Dq
         76Nu7uCYF1HhB7HQBRASzdmtRgv7u5fcdysuVcgv7m32hTeop3VEh1F7mD02w3+Z2EYi
         jFf05yuykW5tVLZEb5f5/8Ib0eB0yZIGNs7WYlZ9md91NcaaeUypj2S8m6+DmLq56Tqz
         WciVsdNufB4NfGDLWn9JqU4n4N4imehwZcXLE5z7+WMTGJBnBOu/oniGUwDx0KIINk8O
         3zAPdExEjVMUCTg25o45dbYp4y0gZYbLbadzQUe3lZH5iNGTDSNmCqtW15eT3CStpQ4x
         XPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792737; x=1763397537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oes+EnLQiIXAxPUxYP+Mc2ycI3/yrDxiwXneiCBW2Ac=;
        b=MYiuJ1mZrHVyFp4tJH6wK4NB3/0h0sT7UuezqTY7TvlT4AQbJwezIow1G2mUqCEc8j
         Bt0//JUCQAzC+fMPh9bTInpmazS95Ac9D7OpTU55Oz6CknZ2ZM0/Dh9lNN10wPGzul3a
         HLCStBogoneRmjRt4xS+vS/eM1hl+dBnjZ0QanHt73SBdIdfpV1eFnwyVsz0QVt+b/B5
         w4N3E7TtcV653qp3RtxuG5QoTBHZXTMvdj26XMQbBqfe7+fj5kyKMWLhx7qxQO97Ufcv
         RciJrCpYhCdoH8pjaLKulPPAlysAnIU8e/k8vn5WRnrUZHXVt5MUo+bC6DU4tfPMEiJc
         +FOg==
X-Gm-Message-State: AOJu0Yzoe9lX4m/zrOPq44dVly0RBfDrXaG3mZyuJvWEIDMr98klY6pE
	4+YYo/KtzrB38JPngkkAaP2ewtPoOZzTiiGFSJE327C0BHBoeync6o6+Bdc/j6tURQsb8QOXkyv
	/7EzeUVMoT2iVe9VklB1mQJ7GJbWcdRwa7pEQPxvTy9EVaz61UCDyXB4SrdTNIIKC2/rf
X-Gm-Gg: ASbGncvNqyIXpcE1ObfxLPZ42xW9BsG2cjE+i6CMl8r8voRZv3aYVk2JUTFcUKUGmLa
	IS4FHLqEO3PcYlFnBKjBnXe2KjoRNVDnQ3DEwkVqNbkzJRG6ZzNJtGeAi0xZblQypuFIV/lD70A
	iRTSduZcbuvCzqVcRkw6j8l3S/yT1uM5po0GIDsgXlj+l+bWMX6dogIzlxIKxajy1Tkzsf6TXC5
	lk/hAIfigfMCSzIacdjrsGcFTEn1XBQ48SlhsYqO+md2JGSXX1DDm1xuJeAuHSpNq4pQSkzTmAF
	pw+bFyR7N16ft9Sw4mM41iP2NSLXlK6rVfH1Z6Gn2gzYAetv00yccxnnRaprPaMlvykz/EFtM3j
	vFx0qYFtHcd7ZYsQi5EInFEE=
X-Received: by 2002:a17:90a:c10f:b0:340:b501:7b7d with SMTP id 98e67ed59e1d1-3436cb22897mr10962367a91.14.1762792737043;
        Mon, 10 Nov 2025 08:38:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrUp9qwIPLGlfFgKZfxVyplHxc1TH6QJBrbZSSrUu4CbpB3XwLUpZQxF12o559s4wVWQ60Xg==
X-Received: by 2002:a17:90a:c10f:b0:340:b501:7b7d with SMTP id 98e67ed59e1d1-3436cb22897mr10962333a91.14.1762792736515;
        Mon, 10 Nov 2025 08:38:56 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:56 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:12 +0530
Subject: [PATCH v2 06/21] drm/msm/adreno: Move gbif_halt() to
 adreno_gpu_func
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-6-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=3692;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=8uOk6MoHQ4XtxnDe/lI2Mr7cqNt7gTyTYYefSPfwTs8=;
 b=waJ7CLv76Kc9w1AzujDl/sZEg+E5ppNZ+FHPNnfO1xxCO2UX9m5a26YORP7ypnqLm1QwDLdf4
 5QXzTH756vTAoC8HJsN/CliDpX95vxnRX4qB/i1vXAs92UcBAP7iQwr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=69121521 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W_sW28Yvd0frASqVc48A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX5dYuCQ+L/tZl
 S1ti+VSeD+UeKXeTSEXqnNFAsomi4jp7wgKX8cfeErvH89+X1D5RGBpYoSGkxtuuyl8Z5OKzIvg
 sKTNl0MRWfdch2AkpJV0HI8KV9qxeq1/R7NQrDBxVcbhpnHQ6Aa7X41nmKmtnR/vI1pJapQAQMk
 45uiizvz9CM6fZSqgamt5z9EereSvdtqDof1jUa85IxO2dx2vAdhaBw26Psj9A+O7B1AcKciWMd
 7ij0sel9TOQQXBmcDElC2biu0jzJlkjVVRSGO1vpjfFBz0b9Dpvhqsj190HC3SDqok1pZHcHdgn
 goKGpaH6lFKi/4GYj9/htBe+S1mLilL8gKQnOuNrWUldSiV+2dSuVNve2trVquJGEyJGBcodlxG
 wrf7VgO5dChLFwKQdU8iwIANDs7atA==
X-Proofpoint-GUID: A1NwWhBByZAXZJaShrlf4HZg1faTMGYy
X-Proofpoint-ORIG-GUID: A1NwWhBByZAXZJaShrlf4HZg1faTMGYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140

Move the gbif halt fn to adreno_gpu_func so that we can call different
implementation from common code. This will come handy when we implement
A8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 605bb55de8d5..306fc08492e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1053,7 +1053,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
@@ -1225,7 +1225,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	if (ret)
 		goto force_off;
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, a6xx_gpu->hung);
 
 	/* tell the GMU we want to slumber */
 	ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6856b6faf6c7..7a87f6407abf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1584,7 +1584,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
-		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+		adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 		/* Reset the GPU to a clean state */
 		a6xx_gpu_sw_reset(gpu, true);
@@ -2295,7 +2295,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Drain the outstanding traffic on memory buses */
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_disable(gmu);
@@ -2664,6 +2664,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2695,6 +2696,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2728,4 +2730,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index eeb31fbc69ae..acdc51dbec79 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -78,6 +78,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 };
 
 struct adreno_reglist {

-- 
2.51.0



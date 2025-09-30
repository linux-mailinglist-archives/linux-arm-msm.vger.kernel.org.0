Return-Path: <linux-arm-msm+bounces-75546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFCBAB903
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04FBF7A8A26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 05:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7C4279780;
	Tue, 30 Sep 2025 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gifKMrKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8DE27A927
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759211452; cv=none; b=VRB9wKW3Uhs6NywLpahpx93nDRXyNnOMqnGMLrIyooi9E/tH0lEWKkx0/mqjtrc96f5kl0bIPp8JoTBJyqQ3o91tU3yXr2Qv+0mD7323MjIurOilIQMhiXlZf33gv5h/CXiXAz/wlsV+rZJ39bzwwd/re0pW8hj7+rT7ZD/QPf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759211452; c=relaxed/simple;
	bh=iTx0Dgw6/NGdDmnjDpXwtxM3ls+MrtO4sIvE3+opA2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTmNXOrhrH0F7Vvtx4WRlQioeO6i//jVBJDFuTxy3XsOYyhq/eM3D/nKi2zfQBrcb84xWu8eKh6h1m1ALJt4ou6txHLLZ3oI4vZZcgpemF3eIZYwUjKfVE9E72dixKp6/fpv0HMUL45JRmUTK3itDP4K+86rwHJAbdNqX8eQFyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gifKMrKc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HP1B017557
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUYDtG14iwXt6CshtaDwxA9smtoMJnlMfawF2rRoaMg=; b=gifKMrKclxrtGxLk
	4rBp68Bl5B0XrOiBHgo+Ek0HHOeetPON/+M+lYt2jf4elx+NMkNH2DQcgy/w3qFp
	v7osQynKfDhFxD0Qx1W1tQgtLFxRDTe8pc2jdzRaMS39dfJcqu4NEqn/aYhq1tkd
	OtmsZrfIrMxPmtCG3Ym1+/oM8JcIds+wGGQHvdXcH0VX2l2QdWMZfTi1ZIz8ufnP
	C9A1zvQ8Wehp/JZxQN8PVbTOGIa/SErqVUcDj1UqjAWl7mGX319OwnLPCU6+nDUM
	75CKEeaPghDkO2EJ1e4TY64P9zsGqxdlnZDzFYiv8VO++0293ceG4lKOkG6uxeYh
	MHBNcA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tqvqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:50:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b588fd453d7so3213672a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 22:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211448; x=1759816248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUYDtG14iwXt6CshtaDwxA9smtoMJnlMfawF2rRoaMg=;
        b=Yi6vXOCLvEtLveA2woUxp3eGd07o6/Jww7mZ7Mmei4gBieVask1iEj/8FgF9/OIUCx
         gkN8g0fWpCjlfXbLOd0v2h5ilKT94TCUoH/NQvINPcNnMtyCkW0dlNpnxgHm5tiR3WXq
         ulCONbhFkieWHGUKA8xkaRMeS4p68MPU43PapNNbnOIEPMtp27hTbipwk3jK2LOa+T8I
         6RaPnqKE6QYPQRayRp4DPw+Q+w77D86gYNCTbQyga7eNp072HMF7Gn8h9P7C/kdI8VQT
         2YmzvCG+qrWkD2cG+MmMqd7yzX6JFheqNG2Zs2drcLvZbaBHClw2x6T3pOvXEjGCLgG6
         1x+Q==
X-Gm-Message-State: AOJu0YxRNQbKLRrHirPPS7IQG9WtJ0lJ9eLMb4OOZqDpvloBSBgeq8Li
	nBA3RG3RZU/Kg+1A84cknn0ow3Uz7UJX3yu5ElJLKrOQaYUFvWdh4T4Og3I00RBPYupCl1YYKTc
	MnQRF4s3yev9yIAfrZXGRHDP4kDROxFFyraUI0K7HOB7vHXQKzOo126T72SDUiRX+w2xf
X-Gm-Gg: ASbGnct7ICS/MYssVIG7GWNPT5UHu87KaBERPDCEZcLwNidx0lE1JRRnL6OZY7SaF0e
	pZOlIOQTARDsCyq5lZMtNCvjjKP2n+uAdIVCMhUXeIWewI2Tp401fc8SB6Y/l8d6SNklkUCQ6xz
	HYmHajuVHG2m8l0NMi0WRPjbMkVXDdA0cMUHExPC8J9JTkhpxzucz5EU+f5Nm+PVQTJMVvLvoaV
	jKpm51BzshrkLL/5qA7uGOz8VHCPXnAMRQRsCdBAAHo2pqGacsnXsFRLpyTQwHUgZAzz1NNSNjv
	/OrG4bLT5Z4Ewj913yw5/QXnJZHWQPyIkevi9GYw2c+GSUlRviYlHGD/GzbTK+RK7KDu/Q==
X-Received: by 2002:a17:90b:1a86:b0:32e:e186:726d with SMTP id 98e67ed59e1d1-3342a2e08a1mr17586669a91.31.1759211448067;
        Mon, 29 Sep 2025 22:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBv29jZXzsR2GHyzv4/aiF55cKo23OPq++pHW+jUt6OPLZ0TQSWk4QbBrVwj5PowUQlBWBaw==
X-Received: by 2002:a17:90b:1a86:b0:32e:e186:726d with SMTP id 98e67ed59e1d1-3342a2e08a1mr17586627a91.31.1759211447597;
        Mon, 29 Sep 2025 22:50:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:50:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:13 +0530
Subject: [PATCH 08/17] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-8-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=2518;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=iTx0Dgw6/NGdDmnjDpXwtxM3ls+MrtO4sIvE3+opA2Q=;
 b=MrGaWbf42ncH24JynsUmGMasa2mINaJed6eMYoi/gzz6Y7t9s0yIQ5H8PlIqlwA9cPDCLVgVF
 vIbOkIclF6NBtnDJY0fAqoMVfUB0LG8GNmKX4udlGZcehELqKzVLBu/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX7oZt/FJp7DS7
 rQHUsQmXh4nNZMwdXJFF5wYYXPfgG/iKE6bVXD5xD7cLPUDPOA53C6a2rP+liKQQUsMqIhD1Kuc
 r596IaZ82Abtryz8m1LHHMuzmz8YZQZ4YiCIURUXCcIRJdb3u3sQDecaJCcSj9dNoEcQN8JZeGU
 1oTlL+3a2zowxX9VWzxZlpb4mI9qOFywGhKbhfLzCOLTZZVhXlQOljlforxPG9fVY8fup3P2opu
 2JbYfA/qhE7Qha5HFh595d8E2HF90A76nj67dB3gKRWw/cLdvg1ZuEjfwZr+IUIx2aGuWwgyVq0
 9boEQByOMmTGVXPUAUPgAjxuHb/8WFWCz1/1EC4WvAraIXVxtvkVxZ+rGl/sdMEmeIghm0HoR/U
 CIMqaOSz6GrJ+pqA1pVGECaL4/tj5g==
X-Proofpoint-GUID: ghJNrX5kXXgKYVsMCDX7w_cs-wN3K9EV
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68db6fb9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=s_9S_yPA7-Eg1sbpcaoA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ghJNrX5kXXgKYVsMCDX7w_cs-wN3K9EV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

Move MMU fault handler for each generation to adreno function list. This
will help to use common code for mmu pagefault handler registration between
a6x/a7x and a8x layer.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 02725d28c607e7815587e9589c8344da3341c78d..27168f3a7264f2651cb41c8d59e6dc80ddba4262 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2613,7 +2613,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2659,6 +2659,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2691,6 +2692,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.get_timestamp = a6xx_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2726,4 +2728,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.submit_flush = a6xx_flush,
 	.feature_probe = a7xx_gpu_feature_probe,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 991481adf2261f09912786ada3574f9f144953c0..b27974d97c7512ecae326eb2d22238330d6c52f0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -80,6 +80,7 @@ struct adreno_gpu_funcs {
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 	int (*feature_probe)(struct msm_gpu *gpu);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
+	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
 
 struct adreno_reglist {

-- 
2.51.0



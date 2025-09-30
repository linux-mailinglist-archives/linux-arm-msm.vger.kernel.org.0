Return-Path: <linux-arm-msm+bounces-75541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD88BAB87F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01FAC1C58C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 05:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF0D2765CD;
	Tue, 30 Sep 2025 05:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt/QzqV2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C451027932B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759211422; cv=none; b=NJczdEN9e0q2exUiLPqLktia0aaiHEcxx34dOYS++KHR3prJp2k5/F8ldAszXDHFGhHjaHpxaGtrSE74T2TVuSWRavmC8Tnnglj8oGm9EbuiSIKyLDY8NWyb2XysoQTF/5to5uZpAAo8QuWOLiLsTbm53cVZFCR6Fwfg9IDCRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759211422; c=relaxed/simple;
	bh=HQNn0GpSr5MaoATHj12j1OfeIQxkRKUAuDUx63OS8o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eU/ehFfdaYrG0p3YluPca55DmA1LNd1f1VbS8CVprghi1UoyNETHo89QVcXyxj3NrG3OZD+UYCeOOvh+//axXp9eEQnI48f88eb7OOWEGCIRkpdZ/4KJlwqBhDVkByHoPsA//bjcxYoJ89I/gyO1DIBkD7GmWl4FmFm1fGnogI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt/QzqV2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HWgX020359
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3KVfEGjSay2MX7CoJvLOzV1CqboHslXk9pdc9qozsE=; b=Lt/QzqV2PX0S0ruc
	9FWTfzCCUYcj+zhi2JgJw3zmuSYHFNZMybigdd8EJV3x4fVNPlNqnx8UurLNECAW
	gws+NNgNM9/UKdVNpMw+M5b73MCaGr0L/HqhJ9ZwxQq35nnQ8RHWG49xjbtKmt7X
	rEbUWklmsdd+s3bePJey5K9eVrBmJuhyw7E37nQG7VjF3YElTsNWiexjeEE9CMNK
	GQEGJUyhfpn/h8Nmq19Y4JX0NUD9LdSvQvG6N37/TQN/xaUUH+VpDItV9NL+3GLv
	0IgqdowmcND1Fd7UBVlF92ASDyBah9lThER1cUZj/TItiDw5UO3I5tKaAGYRWhiK
	WjCcPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5qumv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:50:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so5152799a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 22:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211418; x=1759816218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3KVfEGjSay2MX7CoJvLOzV1CqboHslXk9pdc9qozsE=;
        b=vDyvHzSZdfCZaQepOV6xD/lDvMR+M2ngulnkjxk2lL24H3hqVpvbZKSMdajOBN3hiu
         S9BOrFDqtaJ0ykDTVkiCHZI0KRjdAfZkjGfztvnwPiRCedUrNR6JLZ92qkg/mmkL5Dp5
         A/IscU5/I9DXIL830r2D+dPsX7SQquXEc/f2tBlqcHV2ZkmQRdGnc4XnvR5QgbnGxbm6
         TGyjT3UgnAcRB9o07JrPUuPJn1Vuw6QLOrFAtkZaa/LBXMgqhZFKHuu9O6Qut0+gmbTk
         ugC3aiS32wuYWrzXF/SNOkKN+O02iAk5Qg4lHFjsNT+HS/0bDnStggCL9s9pzojI1dRj
         ISqA==
X-Gm-Message-State: AOJu0YzJxm5P5A81NeGT/hhDoeZzv4nfTqCZqO+kdWTfSQzeWY1e1niA
	2RCbgEcftzoafgndxw/9UKBmB8cWyFHYeuYH1NBoy9PGkesegW4o1tYMyhEVSwgji8FDpSo/1kA
	OJyr2SY61g1FD5O8nG5eHB7viJQgrnM6NDuvQebHcplWM+0N0ajCvrepNEGdW8iPmCPVP
X-Gm-Gg: ASbGnctuCBHNz4dheSysj/mwX38KhyMmzAkPXw8S8ugDXm8ZHMrPAIYeLF0BduT0EXk
	qjzNcV5c2/MMaxHGN7bkGy4DkrRXc7jPfQ5CzMp9WDDJ8/YEQ/Lm25J5SmZDgWA//yHphvqRzDP
	/8CcCfC/ukfRYLSiHBumisYE52el2KbqioRFTrPkP1kWTSTSKIhPNo+ab93Rj4atbjFdMpXPCBJ
	YPF5dPMdXEWH5nnJTSyiyb5F7YTEtOK2EFnqLH40Z9omS4rdSThK1yy4Fdh/LP8fTVFpZwd1lQV
	II8w0eLR1FzhYdWSmhh8MNIeP0WVCuu9q+p3JdMWWspVqNUAvTTWzh99NR1XJ33CJ+gz3A==
X-Received: by 2002:a17:90b:314c:b0:32e:96b1:fb6e with SMTP id 98e67ed59e1d1-3342a29906dmr20304932a91.18.1759211417989;
        Mon, 29 Sep 2025 22:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo0RE2YKa4ZygxZu6kxjp8Q2RIAaVkJ/MyZNvDXmSDipKXnnMeHOY/Pjn5S54HjeUH61NjDQ==
X-Received: by 2002:a17:90b:314c:b0:32e:96b1:fb6e with SMTP id 98e67ed59e1d1-3342a29906dmr20304912a91.18.1759211417534;
        Mon, 29 Sep 2025 22:50:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:50:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:09 +0530
Subject: [PATCH 04/17] drm/msm/adreno: Create adreno_func->submit_flush()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-4-73530b0700ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=2662;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=HQNn0GpSr5MaoATHj12j1OfeIQxkRKUAuDUx63OS8o0=;
 b=R/N87ADKLI885gc4zTsGjeVFnAH7lthAW1ze2DZJAlARQpSnNO9Y+gAiY+MUbS9j70fOi7I4V
 Whw/OBdpDLmDwFAQAOu1zNCO8SxfWv4eBVJ1taJgS1R0W3pl7D4FPDR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: _pFZu_hRR41EjpCPbyY5szj7Rd3BuIaY
X-Proofpoint-ORIG-GUID: _pFZu_hRR41EjpCPbyY5szj7Rd3BuIaY
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68db6f9b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=geZ1VMdEqvdXz0YL0KoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX3srOnpJRdIaP
 ZcS1KmQ/GtqE6UUGrOMMDkV57Y8+VwL3CdWo6fQ+m/B7IUlVWdKw283Z64roQZRA3Qzlnhd7iQv
 wj4ap1zmMTalkLeuNtDWDHPVlLTlTFIWd4uPbGjulluMll6TUMctluYD05K8TR3Sb8fOvCKVnfd
 RVvNnw70e17m0gR+o6sd6/jD/tsckU5Z+dYWePuf3b6jp16mcW3r0yd40hfjpeApFsrXxyKnJdf
 8jm+htFxHg2DCUqHWSv7L8BwqFHROHqeRHtTDas1gtamI2lztv3np1m6NCoHxML0U8CqKio5kl+
 tQGSTvjwmPP7baGnxOmIhwZBinHH05o+LoR0OQrpiueEDmb7jyTs01+VBb1x0VLJSVaETbzX3XT
 0XjOBhjv3FT5SeklCidxSqZ0u1anNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

To dynamically decide the right flush routine, convert a6xx_flush to an
adreno_func op. This will help us to reuse a7xx_submit() along with
a8xx_flush op.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55f5578abdbdec6bf1e90a53e721a5..9cc2f008388929f0c8e8f70a3e3e79fb4d35ab38 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -391,7 +391,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
-	a6xx_flush(gpu, ring);
+	adreno_gpu->funcs->submit_flush(gpu, ring);
 }
 
 static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
@@ -591,7 +591,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
-	a6xx_flush(gpu, ring);
+	adreno_gpu->funcs->submit_flush(gpu, ring);
 
 	/* Check to see if we need to start preemption */
 	a6xx_preempt_trigger(gpu);
@@ -2557,6 +2557,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 static const struct adreno_gpu_funcs funcs_gmuwrapper = {
@@ -2586,6 +2587,7 @@ static const struct adreno_gpu_funcs funcs_gmuwrapper = {
 		.progress = a6xx_progress,
 	},
 	.get_timestamp = a6xx_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 static const struct adreno_gpu_funcs funcs_a7xx = {
@@ -2618,6 +2620,7 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 390fa6720d9b096f4fa7d1639645d453d43b153a..77b1c73ff8946fb0f8ff279e16c973cade50c130 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -74,6 +74,7 @@ enum adreno_family {
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
+	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 };
 
 struct adreno_reglist {

-- 
2.51.0



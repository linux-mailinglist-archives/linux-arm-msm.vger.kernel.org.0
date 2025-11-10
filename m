Return-Path: <linux-arm-msm+bounces-81074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA2C4829E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57B704FB179
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67F1314D1B;
	Mon, 10 Nov 2025 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQUKhzqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZqqCl4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B280E27F74B
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792749; cv=none; b=bC9p4eHRf0gwwDrb4XMnpT5KNenzafXsMbup02bnc3oi/XBebcyrhYQF8Gq6uplJ4iZ7LfJ3dwogtrmTztoyGwbhd9ceFaS+JUr3HHIQeb1u0iaFVASXEkKCcKYaaIt/owH/rt1Alk/ZNsEhV5J+02YiaVnAWgLolklmAPcsHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792749; c=relaxed/simple;
	bh=FV6xLDthA453vaD5oogIe+3kjmqh0dTIHuw+y3wfzsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWWWoxItqm4QRYezSC+GDkHKnOYcVW3kmC+DoaEnRh/TfBwJDljtsMg4S1xH9+2R2gfsJQutKvhdOqsmWmVoTH3xDxFIm9w/zO9xVzqTkMBPz9DOabfDfqrdzVpHdNIJ+XDjgcvM/38lewaUmm6csNCbCYpobcFvTuekkQkC5K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQUKhzqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZqqCl4S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGP7gA2868103
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WKibWSrUWripKfBtWsfTympYKLBOlYD+nhQZn/FVCxg=; b=EQUKhzqokJW3UCgb
	lUStWYh9MO6cD+zNjSDLutwBmspsn+lVBRiz3s/hwSJFUslCm9kDSciti1HaANoP
	0LCGEVCgprEznyG7HIHI4yzb3CNH9ki/rmaDjF+b/mHxMAS9/A+2uLhYNg2i5USw
	55F3Yd5/SwwrbMy6zuvZy6Z3vta0X9NkW8xCBjUY7GT3i66/VXXCB61IczV4prcv
	hrt88dFaLWyyB74vxtE7p7xfkSuJ2nmeuz/9W57knNx8O0cb1OQdfGHuQr8bNO1x
	VAxGBvArQLAf3LpRIoNimzupM5SOqYGfRMSh/YWTJQqtTwOzQWJH2s1w8FBb7nKJ
	3N2Iww==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd761bbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:39:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3436d81a532so5311639a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792745; x=1763397545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKibWSrUWripKfBtWsfTympYKLBOlYD+nhQZn/FVCxg=;
        b=RZqqCl4Sp0VXp1TB6Pd6OS5bgnEwAZiUn1NxJyI222lTVy00f7PK9g9bUGu5V9fQ/z
         rH1/FaYqja3poqTY9b2vvtR5O20T7RqpV8f8r5Fc9qqtR7P76DAiU7j3+jmuPEKsQ9hJ
         4+NwFrkgmFbeac36wrhpmOsRhUP6DqzmjJ/gngAYhEzna4CiSQdqoAEMAJ65uFNVAAdW
         OetBp4fQ0iWLX/xX5sX6eK0Ibjhm43nHjKIYZMX4nzCIFN99Y407MiV/mNCX+3GSooz6
         2kY4RhaTgwqXHhy3yoivY15LV9UaWsTjkDOx6rub/CPBvq48ZJ58nTxFLmjhFiFckim7
         k5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792745; x=1763397545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WKibWSrUWripKfBtWsfTympYKLBOlYD+nhQZn/FVCxg=;
        b=lLX2uskykqmIV6s4IptPiwKmwzbzwrQ6QlEpeMAT708ld31XyX2y3fIlImxRt2kxdS
         4qhTMbshnNTg1oeAygRtT+HVZnwT0uVKBcZOMKpHzGndX/K7FOiLuFf1Ps1IZhSt0nGZ
         hkiIynd90odXLCnDpxQRX6U9HRHlFAEo7F4wGR5kDZTJaODbSVIcvVbeWmWD1isXO6hZ
         52qa7AXGR9mSYsFTxCaYRY1Sm3C9kp4OnSHz3xbXI/kFMK+BiV42MPgWqEa3s7p9BCpK
         jX+9k4wx/RwH8n/EJ5jVJdQ4dBQpKUybNnNGy5noEK3Chz78k8e50wd1cD+BuTd5qgX8
         cSiw==
X-Gm-Message-State: AOJu0YyvLoUeChJUXBrE0GtRTXmBJkXEqkpWajsNOSG3D5Ds862ggw2N
	IgJ5KePjuI0JT4Rg20Cvu24VZ7A1ORPdo57/gSHKZomCw9TLthGYc1CPP8XJcciV5LXc3Lj4865
	xITHXvb6WCm61k1x03MVxViPF5haKE07/I7IDmn2n+q5lig0bKww4wsPRS73c5uvPXzsE
X-Gm-Gg: ASbGncutuz4GaAoYyLfGsBUT4uQvXWY4TUdFDrgOQx0+ldW9OzsL6pQCJFTbCG0NhYo
	xyPrbOTnlBvSrCohfM8Lu5ZitBGXsWti5U4NjbvzsZay+MEub/bpuT9tQoqWNBZkO4auy0oCOSI
	8ZhgZqx1XXTf5eeqsVYY7uMaK1MM10k9Bq4YDif0VPgr52h/QTv/xlGTNPq5+c5zO6ZRZd4X6b2
	xOnTWvCqeJd1O4i/nQMWbiykkROeMHLf71gCuynIeVpKgzIDBO+NIdGAej7x40hIIBsD4xxnW9g
	dQkJrsnmLKu8DlMkiLJmTn+awq+5iBNPGaSGA5yJW7dbVxHNr1OLJdUAOBPmo3iCZLrMB91qMYs
	duBe7KSETJEDlDGSV+LcU0BA=
X-Received: by 2002:a17:90b:1c8e:b0:340:ba29:d3b6 with SMTP id 98e67ed59e1d1-3436cb1209fmr12752615a91.6.1762792745230;
        Mon, 10 Nov 2025 08:39:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHQA2IWMXamJLpaNer6zgOuLzI6Ik83UCBpaA75HoppwknGF27iOTm6iO2NwkR1P9RuzAm7g==
X-Received: by 2002:a17:90b:1c8e:b0:340:ba29:d3b6 with SMTP id 98e67ed59e1d1-3436cb1209fmr12752559a91.6.1762792744693;
        Mon, 10 Nov 2025 08:39:04 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:39:04 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:13 +0530
Subject: [PATCH v2 07/21] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-7-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=2490;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FV6xLDthA453vaD5oogIe+3kjmqh0dTIHuw+y3wfzsc=;
 b=TbMQN2jeHbfSzsXvNtITuiiGmAIjAd8wamkBaIOa6vE0PSVAN1N+TZjArgXIn5hVVUYEREIPx
 e9HotsFB4BODpcPk1sAT2+SANyLk02r+uI0pgfpOwVIuHYPptV6085/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 2_tYs6mIx2dVK8-pfPWjY6dUb2vk98mq
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=69121529 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i9YFFn0sWQDpYGFnbDoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXzLt20aw7U/PL
 0BfXdtf91z6ZcouVwVGVs90C2pauempo9ZaObLav9piVakKlRFinMw5PRcRlbgUT0QIZqXTj079
 JTekvBPy1c0gYE0f/GNwagmID9+IvTP80DVH7dTJZe3gFciCRLgbzdHJmcQUa0JMzdYYZfNFmyE
 kRlvjGNKNuW+L/GVaSMrYrBr5x4tWBMg1ppep7n+cJCTcPiHaYghUKVaVOAGtcnhDwSDQZRKz9O
 WajiBATwNRC11ZZ4q1MCwNSeva+fGSJWoVpcVKmwl2MBmsvBInCcbVOGR0EttvRJwZLQqxXoENK
 gq57et1mwwHM5qfWw27/cKHRFKa4s7FR4thfApQQ5NHDb5eUZNqblaoA8IJjHJTMb5h3AvyREzE
 zWUqXQugsyoYZOffhPtgAfLuBE6l6w==
X-Proofpoint-GUID: 2_tYs6mIx2dVK8-pfPWjY6dUb2vk98mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140

Move MMU fault handler for each generation to adreno function list. This
will help to use common code for mmu pagefault handler registration between
a6x/a7x and a8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7a87f6407abf..51d32c66512e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2619,7 +2619,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2665,6 +2665,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2697,6 +2698,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.get_timestamp = a6xx_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2731,4 +2733,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index acdc51dbec79..50359f2be5d5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -79,6 +79,7 @@ struct adreno_gpu_funcs {
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
+	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
 
 struct adreno_reglist {

-- 
2.51.0



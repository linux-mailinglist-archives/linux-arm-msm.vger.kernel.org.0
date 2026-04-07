Return-Path: <linux-arm-msm+bounces-102231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJEWII5k1Wm05gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 22:09:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CF03B45D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 22:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3F663039CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 20:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142AC2ED843;
	Tue,  7 Apr 2026 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgGlEcP5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtRk+e6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD033F5A4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775592285; cv=none; b=FuLDzRnAO5TflRkcGtxPtrWZlCfJ6gP/5GIzqvaArCAw/zoTl/zhmJ5xIkAl0mxDPj09Yyh56LGAE82Bz64UN8p5VNaWovOHs4IJP/u9JDYR9svEPeCKRi2t7KM7qQpC+cFmi95M9Ci4n7t7gr5aar04ocqb6EAOQZ7E6FGxmoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775592285; c=relaxed/simple;
	bh=WAa5KQ2KFRDGtldbxEarCerDaWDlFFeHJlgLmLqsxb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYJNQJ3wOtdAUs/DiQsnXtwyUoGENcyd2EIZntYL/WscDIoapcNHddvpGCvRmBjaVsJO98mDXkt8zM9BcmHvZJ1jR7KewFX6V5tepHcFVIpBIoIIXx0hL7bkOyb8P7IFoHBE9UuvtoefMkqWH4aEOsDI/aYJHvPjIVQUr0T0Ny4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgGlEcP5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtRk+e6T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DKN483815757
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 20:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Vjxvuw/FF1VPBI4n/D+FS0MDHLJtFBAmtaqwcmoPPA=; b=jgGlEcP5NRD1MUzj
	fVQuWsKJMV2SC+hWqG9FVSd/ir552grlW5p0aBLX62duRB3Eic31aWKespOiaJdM
	DzOOINccltoFOqSVh2wkwX3WC4MCuvyHvsgh3uXttgbvmw+1ebmxdHarUOgqbffH
	X8sVInGlKsXOXFfOVP6agwGAsIQufRMAIQIUnabr2MhwTZRKbOW/GG1NsqTEK6DN
	0b82mg1MGsrXiLRgFLOUnAku907W7XnggeWY4fhqpAbVxfvAl7GcBV8ZvX9AkYVq
	Z0byi9yy0Uv8YkCCwRV4PbxqfrY+cTiAY1ajNA7qUtcpk9PhVsH9NQ7a3wfSdVXK
	DZEiMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4vfbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 20:04:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24308165dso137986855ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775592282; x=1776197082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Vjxvuw/FF1VPBI4n/D+FS0MDHLJtFBAmtaqwcmoPPA=;
        b=LtRk+e6TLW+jlLyZR24dx1AY+l0oOkJwIjsydwMZK1kC5UT7fjLHKQSt+HfLW1HZbO
         p36K7lgeBuYuSMkxzTCtod1zRSMXdJ5ckDEmEk+cBOHiKefVLyjJ03t82Ik2C52FCKCI
         +BnixPBBN/O1GEu5z9UPqAi3gj/a6cTsB2BSFsvXQHlCNIwFkkTf0T+QguMm+k2S8jeC
         AEzI/dfBKJ8OdY81WY5qNAa1NCMqpK+CWmZKp1TN8xwONLzujkkKt4T636CjtTMzryLH
         H9+GIGTaNmckHrDsz3RCLeYNQKO6RBXV3Tc5T+D/jboOxjOCHbA3cWRMckE0bD+zCl8c
         kSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775592282; x=1776197082;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Vjxvuw/FF1VPBI4n/D+FS0MDHLJtFBAmtaqwcmoPPA=;
        b=l7a4aul7Sci3TnsaIcGjptwejYdmomnbRyUS2XsLqqfU3kgrsswWdWbwM8mTFdxKbh
         TS04PRRghQvCHz8mfSuk18F9+GrI6MgX1gNJG1vCQFXMQDwmwPnE8cdkwdg3FHf6Hnem
         nv58Or57zL9cXutCO58UJxL9G7z9K0xicjFY0P6N2DfsmPXCNRaDKJabBDuFxBjFcaWu
         o7nFMTSIgrIoW4CYG++SaiKRwkWUW9UnFBndH3yiFB1IAB7FWC/71EcgPSIzTojzU7wN
         Lj7riT/n59pEDFpQlcVGMDT5fSePBJTenNPLxDdU+VqjtCVqrQzwirpLPfS+I7sw0kE0
         mWNg==
X-Forwarded-Encrypted: i=1; AJvYcCU+Zf3gl8lQaK577UGRvWlyrtQeqwFQ4LW5lRzrp3JtcvnBCA5UkT8RIAgS9ioJWi7/irkseCUVY8K3wlut@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6l0p8Roh5r9HGJsp5Aeld4K2ScwKBFluiGgkrR2jGdEb8PC8
	7f9nogJ7RA5c2OEuqFfmd8SzcHxaXJWZT9xd4barc+zUofM1zKOTq9Ewxw8cxPpQwFg5tLnhZOJ
	+QYdvBbitt5pxSbUXBcKHz9FpKiIOaBoD3zJUujYert/SWLOgqcBJ2uTDwdjK4rFJ2X9Z
X-Gm-Gg: AeBDieugCxTRmKBv3IXu6s9BwfqUszzzCfZ6MNbWlICdhaT649mVdOxFFLN8Q5RTDyS
	OqhYPqwVi+iY7PQnQDnpJ5OOXdILtm5JKYOPlSv4nyeAtfFnrMniIxEWicp2ohSs3FrJN9dqsIf
	atyEN7gk9brR4aYj37bIWO2jpqtpDgIlP2NAW6djodh03QXBRSsr54zoeNtjzvuYtghEWkiXjgC
	Uk0BThhRDe/YHSKse5dsGNMQ9skdO9rzhkRLJYxywDQaSO4U3xeJk2QayqUqdjSf2yKv6Sj+SpX
	q1aPhiHakmHqs+oRFhlXoom/66CHeKtajj6kHEsuaU0STDUdnl3LVCcFU2SEoum9CUSmEzdxA9H
	bvjCgoFEStKTBAkw94LHBjYbfmO6g9B61eI51K6Mz+XDZUQ==
X-Received: by 2002:a17:902:d2c8:b0:2b2:523f:50d with SMTP id d9443c01a7336-2b281802cacmr192447445ad.29.1775592281508;
        Tue, 07 Apr 2026 13:04:41 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2b2:523f:50d with SMTP id d9443c01a7336-2b281802cacmr192446915ad.29.1775592280993;
        Tue, 07 Apr 2026 13:04:40 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbce2sm178975185ad.79.2026.04.07.13.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 13:04:40 -0700 (PDT)
Message-ID: <c9ce392d-d1f8-421c-aff0-ef3b7d737df0@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 01:34:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/6] drm/msm/adreno: set cx_misc_mmio regardless of
 if platform has LLCC
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-3-ce337ca87a9e@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-adreno-810-v2-3-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d5635a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zzMsImXSMt5mrjmxLFkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: CN2JpbgAKZD3dzaP-kvN62Q12Mkvu5J9
X-Proofpoint-ORIG-GUID: CN2JpbgAKZD3dzaP-kvN62Q12Mkvu5J9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE4MiBTYWx0ZWRfX1GFFu2tsXXwB
 1n9rkh1yGVdphbxn39qYkxO85WZ1X0QvD+XaH2hxvQ9UIuzs+ZtUejbMnu7+Gtn0oGOpbGuK1zI
 ExaWmqVmSuUOnHCSkbKIvHuQTzDJJWM6fDD9y+ysGXH6rRQkTlZJD7jZeti+CSZihABzr/c1kaQ
 5/Ivacya4wWfmBAVB1e8L1erz+J62jWmbUyW5ojeD68AMQezKWHFYSQbtnKMhbWnwChMBciASvG
 u8g7ZgtXoRQvqjXukQ56u+bCeUMw4zaDxv4MflbQLEeBbGD/PP2b0m2feNs6a0aMUu8ncjwM58H
 QCnB9Jl2E61DeDKiZdz23l/W79MJfeVFsRdPdNgkvCMKXleYyPWA0CjQvBByZOf1wHTNWy7cR9K
 251it869nEa+LOY+A7KEvHAMuHLEJSvhImsQQbXLmwC4esNYqE9URwR3rUIMnK0hSz4974gpl++
 NhSC32Df0vJ03f6XRgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070182
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[fairphone.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-102231-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20CF03B45D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/2026 4:39 AM, Alexander Koskovich wrote:
> Platforms without a LLCC (e.g. milos) still need to be able to read and
> write to the cx_mem region. Previously if LLCC slices were unavailable
> the cx_misc_mmio mapping was overwritten with ERR_PTR, causing a crash
> when the GMU later accessed cx_mem.
> 
> Move the cx_misc_mmio mapping out of a6xx_llc_slices_init() into
> a6xx_gpu_init() so that cx_mem mapping is independent of LLCC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 ++++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 9847f83b92af..d691ad1f88b3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2039,7 +2039,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	u32 cntl1_regval = 0;
>  
> -	if (IS_ERR(a6xx_gpu->cx_misc_mmio))
> +	if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
>  		return;
>  
>  	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
> @@ -2098,7 +2098,7 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  
> -	if (IS_ERR(a6xx_gpu->cx_misc_mmio))
> +	if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
>  		return;
>  
>  	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
> @@ -2135,31 +2135,12 @@ static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>  static void a6xx_llc_slices_init(struct platform_device *pdev,
>  		struct a6xx_gpu *a6xx_gpu, bool is_a7xx)
>  {
> -	struct device_node *phandle;
> -
>  	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
>  	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
>  		return;
>  
> -	/*
> -	 * There is a different programming path for A6xx targets with an
> -	 * mmu500 attached, so detect if that is the case
> -	 */
> -	phandle = of_parse_phandle(pdev->dev.of_node, "iommus", 0);
> -	a6xx_gpu->have_mmu500 = (phandle &&
> -		of_device_is_compatible(phandle, "arm,mmu-500"));
> -	of_node_put(phandle);
> -
> -	if (is_a7xx || !a6xx_gpu->have_mmu500)
> -		a6xx_gpu->cx_misc_mmio = msm_ioremap(pdev, "cx_mem");
> -	else
> -		a6xx_gpu->cx_misc_mmio = NULL;
> -
>  	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
>  	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
> -
> -	if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> -		a6xx_gpu->cx_misc_mmio = ERR_PTR(-EINVAL);
>  }
>  
>  #define GBIF_CLIENT_HALT_MASK		BIT(0)
> @@ -2621,6 +2602,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
>  	const struct adreno_info *info = config->info;
> +	struct device_node *phandle;
>  	struct device_node *node;
>  	struct a6xx_gpu *a6xx_gpu;
>  	struct adreno_gpu *adreno_gpu;
> @@ -2656,6 +2638,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  
>  	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
>  
> +	/*
> +	 * There is a different programming path for A6xx targets with an
> +	 * mmu500 attached, so detect if that is the case
> +	 */
> +	phandle = of_parse_phandle(pdev->dev.of_node, "iommus", 0);
> +	a6xx_gpu->have_mmu500 = (phandle &&
> +		of_device_is_compatible(phandle, "arm,mmu-500"));
> +	of_node_put(phandle);
> +
> +	if (is_a7xx || !a6xx_gpu->have_mmu500)

Instead of this check, I feel it is better to just add a
WARN_ONCE(a6xx_gpu->cx_misc_mmio) in the a6xx_cx_misc_* io accessors.
Then "a6xx_gpu->have_mmu500" init can be moved to the llc_init(). But
that is outside the scope of this series.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> +		a6xx_gpu->cx_misc_mmio = msm_ioremap(pdev, "cx_mem");
> +	else
> +		a6xx_gpu->cx_misc_mmio = NULL;
> +
>  	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info);
>  	if (ret) {
>  		a6xx_llc_slices_destroy(a6xx_gpu);
> 



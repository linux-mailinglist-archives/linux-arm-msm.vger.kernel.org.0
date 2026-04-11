Return-Path: <linux-arm-msm+bounces-102752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBKyINCv2WmKsAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 04:20:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA123DDF76
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 04:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45E613012873
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 02:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37A71DA628;
	Sat, 11 Apr 2026 02:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPlQbhoY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UH/oCXLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC6D175A8C
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 02:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775873996; cv=none; b=VxJdk0SXjclGd2XCfYzoNTW7dnPx7AsI/UcnKa78sf/yElrhIpK/6OLpuud+1FhG6ZtvWZSsVk8jzvBQX7NAtzoRfIjSFDyGZzMWIysl/UoKqSKq33hndwf0aXvVqIqK1NoetTEkdZRJzBhXVP90WyWHbJxe3y/LGvEoVMvme0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775873996; c=relaxed/simple;
	bh=qV94mvhunm2CQxfU5vWLj2IDFJWAz+BpYskLeJcFbGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/3Sk1mpAmu0M+43i5gYyxGxJc9iePLHTjrPm6VJW1kwuA5Fw6xyLT7SeHXxfq74xpEKjwu7uqh28VBFqeiqbH1PejmPlF01O/hrJoTWaOVeMQ10vaf6jtNjZiseh8sHM3I1dXrShTqIRxlzvYbI6KusbjdFn8vz/18cHdx1Jd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPlQbhoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UH/oCXLT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AH5Awh1498649
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 02:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gu/teDD23fbBDqFsqXo8me0HScED9ySD1rAeh3K6Hoc=; b=OPlQbhoYxHsfB80l
	LtswwCJZ06ZS4yDA67ORpWXqiNdDCT7+vCLHYBF8eX8DuJyaw+WUeKM7U3hgEF7U
	lYNhxfzFAMp4mg71Ng1lCT7lz218ld59cUIfO9F0/9q3IC6CZjRDdqnZgxR1s3dg
	AoNx1drI2YYzVAxkWfuhnVoUIXzNp/nd8NwN0gtHue3Kocq64TBscLbKcaWupfUB
	+XMX7invrlqHOVs9mgoitG8Kfh8kp66OC5Q+IOEA4ZGUEjSt+VvUzszwy9AiTVDS
	G1rQBNuLZ6cfJbdsFXi8KFPBG25Yc5QbXG7x97rqGcghk6jS1KRiZ0xi77XXLn98
	b8L5IQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5b2fe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 02:19:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741f038f7cso1648712a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 19:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775873994; x=1776478794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gu/teDD23fbBDqFsqXo8me0HScED9ySD1rAeh3K6Hoc=;
        b=UH/oCXLTXvbO/Kqt8Vdh8OtxKIBMoaYsVWhpuOGIdkHHBG0Fit9hjxeOgnQxpSHN+o
         3lcG/X5PiCoptHd16gvWuvpqjwkZCSYRVmg5IDvn+OyVdSAqjWqphrCXlqppS9+AvRCr
         0PE7CCMht3pPCiVRwZMBFT+bMx7IOpQPg/c7afoay15tOMMxlBwf0FuR5m/OQNotpefG
         bRxsfywSIkC7LxhfVqRiZIBdQdRI9LfQEFpOSQskSAQLiwi/FBuXfSlTBakPlja7UeKa
         s7tMscB6NZRiFC+UmKuFWdiq7pNkY1qLWxO7yE2AAp+m1b68fxb1C12Y1H0y3bM2mXAJ
         lYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775873994; x=1776478794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gu/teDD23fbBDqFsqXo8me0HScED9ySD1rAeh3K6Hoc=;
        b=sGXhszbamCJg1UCZCjYioabSZ1dgUz7rt7XCd0hJe6XVLXHNwvy3taE8RB+VOW9TCq
         tI54yUY3LIgOD7rJiewcy6JrQ5ilt/ivlisJptV2dLtBt6yAkU7D0FgdoMOnRpXnWcaL
         eCjqgXfn5SDPmSdQRD3zkhXVFXn6IL69VrGhltmGj1kFZfiw6gw1175ihBIPza8Czvds
         +XwzoMrxl7gxTjXwPnxhAkvbdYG34PC7RnidINPxo3mHjhGRm27zgr2D77QbUjMCQoEA
         KuA7i+1YHy5C4vJOwa75Hk4iirv/j9oeD87CH6j0sTzrScFKYyPHieqixWlOIHcvaOMN
         zBWg==
X-Gm-Message-State: AOJu0YxPol9jw8LyQUr77of/U8d/uUqcLDTyImCFtoxy8gfukZkJbY84
	e7zBpEO/24/VWje/CSm3Ap0PdImmMxgMsf9LnfDgxq4WIYXYuDk+5c05N4KxTrbndvvL+2K7ECY
	x3cn5sp49mU4zgDT1TU1A9SkcyLDpSXcx93NcdcAD5C+zzPA049oBMyOqTwDTMg6MpxbYXnpnCX
	c59OE=
X-Gm-Gg: AeBDietCejBjOSJap9jEZZ1B9lvt6xhho5Cca3e1KybxW0SMee7wBraMl8ipZfeaWzA
	GbIkzQmdnLwF9UJyBneuMh6Q9wJPmgr9+ixwpEe6DqGZS556mIF8IPruoXQslLTNjixQCoymfbp
	u8fRMCxetaQ5Znnr6JvBn6+YLMg1IrX7BMwhee6uQVRQ+Y483q7qj4U1tn1IZDQBqDtPgFrGLpC
	mgp5x04vwzEvNiKE+zAr+Ir0TLe+yRvyUcCrJu4XSrm/tWfjR0TZS+EERiU4c0Fh0xCpd8tTQPW
	z7jeHtgsS5efEwkTR6N/6maFE3GMvsXdLHL2TFryAi1ZThyA4Ol5t/KkD9VdoPDadJ99OTm3Klx
	vFSqESW5+78e/EA8B/sBtAQMsBlcSnuamchP/jI/AgueX+6FWuQgBAnU2ZVEdq/ERDPSo5NAhS4
	psyN/8DjrwGA==
X-Received: by 2002:a05:6a00:2411:b0:82c:d6d3:3190 with SMTP id d2e1a72fcca58-82f0c250e58mr5670299b3a.38.1775873993457;
        Fri, 10 Apr 2026 19:19:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:2411:b0:82c:d6d3:3190 with SMTP id d2e1a72fcca58-82f0c250e58mr5670271b3a.38.1775873992848;
        Fri, 10 Apr 2026 19:19:52 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b251esm4053702b3a.37.2026.04.10.19.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 19:19:52 -0700 (PDT)
Message-ID: <31e75026-f22e-4bb1-9589-317408081d10@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 10:19:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/17] drm/msm/a6xx: Add soft fuse detection support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-12-2b53c38d2101@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-12-2b53c38d2101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8CuKOlhPsGnBJeUtnBtsY9Sc1NzhkIQr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDAxNiBTYWx0ZWRfX0i6Yekn2ZZU3
 hGUDyVLF8NT9kcAem5LHSjFv3Ifo3O2eoSwRtTjdCBMfK0vTJIDkAj+ryFJyrvTkQ1IvCmLEwLo
 /EOUfdjQvXMAUbg509MibPibAPEt+J5YV70bcQBxg5WfFsvl9LpFDEGIVcbbvo14f/EB5+rNQy1
 N1LjWvANHdh1PChEwwyHIIxEaXQNa1u/gZ5o0FKTF8RAYMLlF/uCUwZntQ1iYrWkkBi1iwco7N8
 6IAtqR1nwWk49PO4fZ2o4f67qtaHNgD5b/GTK0Vadt2v/9yhIQzyLcCCpZ4K61VEjXfsVNz29jN
 4fl8aVSl9XgrJau8G7KtIuCo0Bybeza3CJv/FtF6c5E2jib7rffUuwTnfdVM3nsY1anpkqB+19K
 laVGe/vPAUfEkdjOR/Kt2ZCkmm+Lv5N25ENyiGxZ6yijnCjBWA+/YW6Rlxil97DsS786oO+Sis1
 opbPLvcsw90ou0YjbLw==
X-Proofpoint-GUID: 8CuKOlhPsGnBJeUtnBtsY9Sc1NzhkIQr
X-Authority-Analysis: v=2.4 cv=VsgTxe2n c=1 sm=1 tr=0 ts=69d9afca cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_Z3VJ0DL17_MYGaqnVMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110016
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102752-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AA123DDF76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/27/2026 8:14 AM, Akhil P Oommen wrote:
> Recent chipsets like Glymur supports a new mechanism for SKU detection.
> A new CX_MISC register exposes the combined (or final) speedbin value
> from both HW fuse register and the Soft Fuse register. Implement this new
> SKU detection along with a new quirk to identify the GPUs that has soft
> fuse support.
> 
> There is a side effect of this patch on A4x and older series. The
> speedbin field in the MSM_PARAM_CHIPID will be 0 instead of 0xffff. This
> should be okay as Mesa correctly handles it. Speedbin was not even a
> thing when those GPUs' support were added.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  6 ++++
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 41 ++++++++++++++++++++++-----
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  5 ----
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  1 +
>   drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  4 +++
>   5 files changed, 45 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 79a441e91fa1..d7ed3225f635 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1731,6 +1731,7 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>   	struct adreno_gpu *adreno_gpu;
>   	struct msm_gpu *gpu;
>   	unsigned int nr_rings;
> +	u32 speedbin;
>   	int ret;
>   
>   	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
> @@ -1757,6 +1758,11 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>   		return ERR_PTR(ret);
>   	}
>   
> +	/* Set the speedbin value that is passed to userspace */
> +	if (adreno_read_speedbin(&pdev->dev, &speedbin) || !speedbin)
> +		speedbin = 0xffff;
> +	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> +
>   	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
>   				  a5xx_fault_handler);
>   
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5cddfc03828f..fb9662b946d0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2546,13 +2546,33 @@ static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
>   	return UINT_MAX;
>   }
>   
> -static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *info)
> +static int a6xx_read_speedbin(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> +		const struct adreno_info *info, u32 *speedbin)
> +{
> +	int ret;
> +
> +	/* Use speedbin fuse if present. Otherwise, fallback to softfuse */
> +	ret = adreno_read_speedbin(dev, speedbin);
> +	if (ret != -ENOENT)
> +		return ret;
> +
> +	if (info->quirks & ADRENO_QUIRK_SOFTFUSE) {
> +		*speedbin = a6xx_llc_read(a6xx_gpu, REG_A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS);

a6xx_llc_read accesses the a6xx_gpu->llcc_mmio without check the 
validation of the a6xx_gpu->llcc_mmio. If the llcc_mmio is invalid, the 
subsequent readl() in a6xx_llc_read() will crash with a kernel oops.

Thanks,
Jie

> +		*speedbin = A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS_FINALFREQLIMIT(*speedbin);
> +		return 0;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> +		const struct adreno_info *info)
>   {
>   	u32 supp_hw;
>   	u32 speedbin;
>   	int ret;
>   
> -	ret = adreno_read_speedbin(dev, &speedbin);
> +	ret = a6xx_read_speedbin(dev, a6xx_gpu, info, &speedbin);
>   	/*
>   	 * -ENOENT means that the platform doesn't support speedbin which is
>   	 * fine
> @@ -2586,11 +2606,13 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct platform_device *pdev = priv->gpu_pdev;
>   	struct adreno_platform_config *config = pdev->dev.platform_data;
> +	const struct adreno_info *info = config->info;
>   	struct device_node *node;
>   	struct a6xx_gpu *a6xx_gpu;
>   	struct adreno_gpu *adreno_gpu;
>   	struct msm_gpu *gpu;
>   	extern int enable_preemption;
> +	u32 speedbin;
>   	bool is_a7xx;
>   	int ret, nr_rings = 1;
>   
> @@ -2613,14 +2635,14 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
>   
>   	adreno_gpu->base.hw_apriv =
> -		!!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
> +		!!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
>   
>   	/* gpu->info only gets assigned in adreno_gpu_init(). A8x is included intentionally */
> -	is_a7xx = config->info->family >= ADRENO_7XX_GEN1;
> +	is_a7xx = info->family >= ADRENO_7XX_GEN1;
>   
>   	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
>   
> -	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
> +	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info);
>   	if (ret) {
>   		a6xx_llc_slices_destroy(a6xx_gpu);
>   		kfree(a6xx_gpu);
> @@ -2628,15 +2650,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   	}
>   
>   	if ((enable_preemption == 1) || (enable_preemption == -1 &&
> -	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
> +	    (info->quirks & ADRENO_QUIRK_PREEMPTION)))
>   		nr_rings = 4;
>   
> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, nr_rings);
> +	ret = adreno_gpu_init(dev, pdev, adreno_gpu, info->funcs, nr_rings);
>   	if (ret) {
>   		a6xx_destroy(&(a6xx_gpu->base.base));
>   		return ERR_PTR(ret);
>   	}
>   
> +	/* Set the speedbin value that is passed to userspace */
> +	if (a6xx_read_speedbin(&pdev->dev, a6xx_gpu, info, &speedbin) || !speedbin)
> +		speedbin = 0xffff;
> +	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> +
>   	/*
>   	 * For now only clamp to idle freq for devices where this is known not
>   	 * to cause power supply issues:
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 8475802fdde2..f6c39aed50f2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1185,7 +1185,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	struct msm_gpu_config adreno_gpu_config  = { 0 };
>   	struct msm_gpu *gpu = &adreno_gpu->base;
>   	const char *gpu_name;
> -	u32 speedbin;
>   	int ret;
>   
>   	adreno_gpu->funcs = funcs;
> @@ -1214,10 +1213,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   			devm_pm_opp_set_clkname(dev, "core");
>   	}
>   
> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> -		speedbin = 0xffff;
> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> -
>   	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
>   			ADRENO_CHIPID_ARGS(config->chip_id));
>   	if (!gpu_name)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 29097e6b4253..044ed4d49aa7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -63,6 +63,7 @@ enum adreno_family {
>   #define ADRENO_QUIRK_PREEMPTION			BIT(5)
>   #define ADRENO_QUIRK_4GB_VA			BIT(6)
>   #define ADRENO_QUIRK_IFPC			BIT(7)
> +#define ADRENO_QUIRK_SOFTFUSE			BIT(8)
>   
>   /* Helper for formating the chip_id in the way that userspace tools like
>    * crashdec expect.
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> index 3941e7510754..2309870f5031 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> @@ -5016,6 +5016,10 @@ by a particular renderpass/blit.
>   		<bitfield pos="1" name="LPAC" type="boolean"/>
>   		<bitfield pos="2" name="RAYTRACING" type="boolean"/>
>   	</reg32>
> +	<reg32 offset="0x0405" name="CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS" variants="A8XX-">
> +		<bitfield high="8" low="0" name="FINALFREQLIMIT"/>
> +		<bitfield pos="24" name="SOFTSKUDISABLED" type="boolean"/>
> +	</reg32>
>   </domain>
>   
>   </database>
> 



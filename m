Return-Path: <linux-arm-msm+bounces-91214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K2eJBTne2laJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:02:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 048E0B591D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52A87301D07D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 23:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E92374168;
	Thu, 29 Jan 2026 23:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6mbEAxm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOnffnc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB01354AEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 23:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769727759; cv=none; b=Vgru5w2VN4nu+yeTB00QMqVNR6fXqk+0Gy6pVyIVzdDCSGx91oIQnkpqXvt6DCUDWpqvhd+E1Q7NioBHKzqrGFqSbJRCx49oY1wDnAwzQwGhgchihOZWjjpr6NRZ2eE00+EvoHDBPGLvlRG/322nqqtULHyL0Xjj8ldJrphYZsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769727759; c=relaxed/simple;
	bh=PDLDbnsx0SNRhlKEe/qnBNXtlRc4HiciMUZ2KaESdmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMUFTPN2ovDZ7qo5YvMXv7o9z3LJrsJWHRzP3oG2a7XTRZk7gaDtUsm87kqVyT1LcZ1YH0b0tb0FGFHkgmxGDCoGaT2ga8RKFYAjqjV8br/bNZ3kAQtpXpu9k2FX6H3mpTI1UVDId+gkpf9LNU8yuhXEgJ9M5DRs/L0ApRQ8Ubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6mbEAxm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOnffnc4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TH4C69028735
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 23:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xilsLx0mjQbln6HYtM7EOjqDHQpTIQtLvmJs2JkP+U=; b=k6mbEAxm7frTtzMN
	4tVAMWhTa4OFmoXqfomAAzSyebIeq5NgqaQrtLHcgCOQM07i/JucX9GKnsdFBWjb
	EnnLFYVmf3tvXR4BNoNmxkPfpJaa5M6GB5XqDreNjxZ3/1lCMCy89e6i+wbnTDxD
	qWkc/s2VT3uZB0lahj0EHfXn4VNANXCWIMdGHtgLRVzSgeeggTOyPCSX6C7N2vD9
	ikyPTHbKeYRcLxLjRJ/6PLcPYox7tMYNr1RNzCDBeSBllDfT/WeyT9/7GtbAUAUs
	/P0acaM7bHq2u+I5ewxzbftX5TVsIOohxXyHT2wW95RiLpaipq/5Fe79klhyXspy
	VQ4S9Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bm590wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 23:02:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso809542a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769727756; x=1770332556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xilsLx0mjQbln6HYtM7EOjqDHQpTIQtLvmJs2JkP+U=;
        b=jOnffnc4kEHGSwqQsAlRefzA9/jCEZUq/PKoVPyrHcdqGLbm8N64sot9Cdmra1T7jr
         upqII8Q0aeSwcrFnOOMw9Uxpqrg/PhvV2X0qEQQUIB1zU0y8Uk8V6v0iQPyeBBJ112IH
         +NlnIiefxyIPis7Lg5RBsMhJf0gsOMFOPmzdwFsYckVr0avpHiXzHhkWexKimZ83zIzn
         X3hLKI+iD62pTdq+hbMdJBb2UBONdTqoL6nLs7ii2rVPxpanF7DH79PUpLjfsmI9Yvjo
         4BEclCCxls1OZ+9Ocir5kY2vFIgpxGb+XXuaWj+maQLl3IkbdqR8uE0EwYvyT9+loOq4
         pA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769727756; x=1770332556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xilsLx0mjQbln6HYtM7EOjqDHQpTIQtLvmJs2JkP+U=;
        b=tBFY/Ow8O4Tp9MC5JYzK6xhlens9OCJo61Q5VP+sp/YjKJv8xKmZ9x9+6Ii39WEpPq
         J2b2Rp2a4QNzjYrOmjKHoC18eU6d4mo6PHwHmg3XSGQtX7FGx751+HVjPhedOcFINynB
         P4cXF9sZAJ8p+uD0ChSb90xyzo7bHbGAbH1KdSWnw/vVWWMrTPWmr2xlMApyFWVC/r+i
         qvHWmaLx1Yo9Op/AtWe+UyvV3kqcGaTNDTTnT1HDzkHWyNnO3lEr8SHMQUmUhddFbv2y
         tYF/8LhKaXy+xoeDWp2sOSF23pTD7pJ3Un74CNLZCuJzztTpbMed/WIcirWDViamtzkc
         srcA==
X-Gm-Message-State: AOJu0YxoKTU0+OmQa9WhibXCsqditOYAaa7xtoruc6t4Wy3YFrqaJZeK
	sQhHITJg4uZLm9DH0uab6GFKfqjkqKk1v0VAJVqBGWwK+bbxEicmMDCvhZMc0nzNXfYU1YaNo5b
	Jlfm8GtHzjnPxH2b9kAGnRtkKyrgYJQJjwRoCUmzfRX8kgEfubFKS1b85JEOhK9f19LwA
X-Gm-Gg: AZuq6aJvmeTIypC8Ns6AIcUS4qX46zhEyVoJjvbbie8ylIWWhJ0+P57bEczbnkOKi/w
	7L4oEtSdnjabjEmF4rxTvoWHtPntSPx/5imQvVEds1Fg/xZGAUvSe5UIpvLJjTsqwYnOcjLrD44
	RcwjGQeXnxQxpQVtrVTkNjo0BwceFq5UT6G9Y8GlQbvu0eFj4Ha3hyF0mbVWhg/OuWEdg/6qFKP
	4LSrLVcig8uEl5A4L3IuXPUr/AH4IBXI6XJiQmh9JiXCsIrG9XsgF7fULXD9ZZVQeEqvz24cfZw
	GGKCaJn2lBCGpedXJKEbXUjbmx9IS66qQ9MiIYQdK+kvWsaBOrFH7xknqAhEHkejW8enm9CiQ2f
	MO+CHw9NZ1qwc3YN4GOQ/PNaHU9OkJ4WWHQ==
X-Received: by 2002:a17:90b:180f:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-3543b3d2607mr833135a91.33.1769727756351;
        Thu, 29 Jan 2026 15:02:36 -0800 (PST)
X-Received: by 2002:a17:90b:180f:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-3543b3d2607mr833091a91.33.1769727755696;
        Thu, 29 Jan 2026 15:02:35 -0800 (PST)
Received: from [192.168.1.3] ([106.222.231.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc7absm6439131a91.12.2026.01.29.15.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 15:02:35 -0800 (PST)
Message-ID: <0dda1100-49d3-4ca7-9ae8-1541e2b855b9@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 04:32:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/adreno: Fix a reference leak in
 a6xx_gpu_init()
To: Felix Gu <ustc.gu@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HYuVcZ5rUiHMo9hltCW8w9YzqK-aOynq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE3MCBTYWx0ZWRfXxyBFYYy1IJ52
 jLTibpx8TwfEC1IGSCK7B9rTYkwNjwpcMVOC1nJuPXbvhkAx5ovAv1Y46kattMDw8XaiJTmN9OX
 tVQ+JyrA6pSCQVgAuR/pu+qUjlds8O+NaSAg5HDsjRkVIgvUfvb0cqfbrPMqC3/4VnYguPiTq9I
 Ks/pAY/el0Es+xhHgKpsXImkU4/HExzmFtVyS7A2qqdMFpenNBOxeUxevjjFdH0LoE8dHO4WWsY
 Yw3Sf/ptkT61fu6+AQoxRMgCMOszr95NqmvaS1LdhOEqgBaXCalCUjv8vpoVJK0PM6BE28VpRbN
 uyL75HelA0su4uD0u6HKUGTxLmwqndb9nnZREyMaP3UIcpfQsiiISZdpjXB4MCLQ7rHA9b0D2Bt
 0MSdaBmZrVJ7VNgohSjVb4s0dcZ/U7+KpmfxqaSJaWmqj2NbDUUILD51fiyJU5MZj2DaCBZueP5
 fdWEXhs7NWruslG9/wA==
X-Proofpoint-GUID: HYuVcZ5rUiHMo9hltCW8w9YzqK-aOynq
X-Authority-Analysis: v=2.4 cv=bZNmkePB c=1 sm=1 tr=0 ts=697be70d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZveB2507E6DkPBHLdDca7g==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=mHnloJP8uCFruMiY-FkA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290170
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91214-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 048E0B591D
X-Rspamd-Action: no action

On 1/24/2026 1:04 AM, Felix Gu wrote:
> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> While there was a manual of_node_put() at the end of the
> common path, several early error returns would bypass this call,
> resulting in a reference leak.
> Fix this by using the __free(device_node) cleanup handler to
> release the reference when the variable goes out of scope.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
> Changes in v2:
> - Explicitly add header file.
> - Link to v1: https://lore.kernel.org/r/20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2129d230a92b..604b0f861d27 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -9,6 +9,7 @@
>  #include "a6xx_gmu.xml.h"
>  
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/devfreq.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/pm_domain.h>
> @@ -2640,7 +2641,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
> -	struct device_node *node;
>  	struct a6xx_gpu *a6xx_gpu;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -2660,7 +2660,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->registers = NULL;
>  
>  	/* Check if there is a GMU phandle and set it up */
> -	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> +	struct device_node *node __free(device_node) =
> +		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>  	/* FIXME: How do we gracefully handle this? */
>  	BUG_ON(!node);
>  
> @@ -2702,7 +2703,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
>  	else
>  		ret = a6xx_gmu_init(a6xx_gpu, node);
> -	of_node_put(node);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
>  		return ERR_PTR(ret);
> 
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20260123-a6xx_gpu-cbc095dbe423
> 
> Best regards,



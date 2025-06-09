Return-Path: <linux-arm-msm+bounces-60674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A77CAD2511
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 19:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 573F3167588
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 17:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA5021ABC2;
	Mon,  9 Jun 2025 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e65QfGjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04440194137
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 17:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749490671; cv=none; b=D6o7ewudhoksmHNIZZAoWzY5qX3Gg+bPx/kKGyYf7WzDC62HguZDps2Ihi3zQE+RoyG507SCLNMHDV5s7sW/HmHeFEjHaO1c+VAtGjt8F0K/kwXR5WiQ2S3L84quUbla43RM8N2ZzllEsHAZ3oY3WyuJFmqvA7mLdvVTm3jIaRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749490671; c=relaxed/simple;
	bh=NLe94yPt4q2EEiFA0+JfFwaP7sn2Zq/pZsMRfkjjFbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNiJWnHsJFq6FtTB2FQAuYBQvSbygl1+7s1GU8NW9nHrHUK9qxKa+U1+N/SrnXobBqwGhDGI5FYlILST6TX+50nr5h5vjNhvFn/Lyu3HnGr+Ga7pyvxqVG1+JEPX3vpSynwdthR1Qy55twYd+7/e0iQE3fMqEglH6ALBjUAx5mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e65QfGjf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599bqbO008107
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 17:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mD1/0CoskR/YlijKuKFXQSB2LX4lWU/ihQ9C+M2R1A=; b=e65QfGjfmnEbu4p3
	UihaUlZiORk3Gozu9dLSaMSP9mF34+aiX4WazCx72GGLHI/OpvsWfbzMTiyI8CJ7
	mLLawg5hHG4k6Y9ElBnt/LhzrUX3PFK6kg0ClvFNa2HHuhvKvyZdKST+ve7kkN5C
	t5fxlPVuJXdK3KSDbmG2Agn7iX++l5ruXwifbVXyKLSFpyHuvOhjHdqTUSuYTTRb
	0Vd5vWEbDBJHOr9XFJxjsL1END05UxhmjxlBVCA+w5wE6Wb5C6RRhAni4d15POmL
	wnqBFAOEkKtRCz23tHkxlX7dA320UncHJ7y//sisuXdb/j/lF4azs/8Ky3nkMHkv
	VhFB8A==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11xyjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 17:37:48 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4067b33c9a6so2850953b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 10:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490667; x=1750095467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mD1/0CoskR/YlijKuKFXQSB2LX4lWU/ihQ9C+M2R1A=;
        b=m6mYAo2e1VGPQX0OpTonjpMdIOLOSpa1nWjyQuJOYfRze7eSD4U5uaXCw9sto9cCfm
         yal3MjrvCIBCEX6vtFeLuJVnxj6EuLqwkl+qfo08MbH3NYm91j/c7U3xgOx8epNd8sm/
         KQSB29cLKqsB29+YPw/EU9xm0QZdZ3iUJdxDIpuxJmXa9bSWrtuBknd+pTEgtBM0TMDh
         XiwOdLvMKHVj+W1aiTA6sVTUJOOjy5vkpi/Q7IHzG5qeTKXlBORXSWcNwWv/kwoSxSaO
         CJfZHiuf0LvGhkAP11Du3OAV3kqnmJhQzxa3Uh1ugkNwTWfgzZIicsXAUWZrInpH1guJ
         /0UA==
X-Gm-Message-State: AOJu0Yy4/22oMm5WUnHRi/m8j50Nsc0eVXZsOvQr9SimMmfSB3RYuaIN
	KrGFkO/e0UDjYV7uvYgbIL0xUNKrglYpwKw4mTHRCLKFC9AEAeA11D+OgGq2N3CqGTCVL9OOET/
	2F/nFEM6s84OoTyf2eWoXPRT/xoo8WTXewuF3wTSiRRczNGDTgFQ1CqImIrl+0AomIU63uiAEeP
	kN
X-Gm-Gg: ASbGncuZKT7Cy2czxR/zrbu5kiMam9OFXl4LKlLjWQt8J5m3wJRdqDxOi9ajBT2TVwp
	My6VuPutkSnj/U5x1uoidyUp7brNTXr9B+kYXK8AERsFOxIq9hxUeBrUaXOih40/8qc0biQ1Hq4
	GfJl3bdhfgU+bNCeoyOkfDQMELHE3O27xbY5jXTUJAN+jsDJLEiQWE4Vi5UGSdDrAyH/aD/JONZ
	W0j3ZRmdz1xPw354kZ2kqQOfHBtAYuiscwSTCPWkjEl2efbp6Np614pPQw9TRu8OFw2R173KPOG
	pc5Y9q1MJK10Vvo0HYBw2GwDT5x1jLZxebWol7NDqQg7TxJdafhyNLsLQXdUbskADmZhZxBQ00R
	SQ0VoiVpJ6v4wovp69wNpfBME
X-Received: by 2002:a05:6808:1386:b0:407:a0ea:a233 with SMTP id 5614622812f47-40a548ec3acmr318295b6e.10.1749490666569;
        Mon, 09 Jun 2025 10:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDybc/cT1a1uzm8usYYLOngzIkeYWJ3oezh6aMZj11iyv41ICeZDa+085dK1+g2POh2T0oFw==
X-Received: by 2002:a05:6214:1c8b:b0:6fa:9ca0:c67e with SMTP id 6a1803df08f44-6fb238dc2e9mr7311616d6.5.1749490654418;
        Mon, 09 Jun 2025 10:37:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b347afsm11373071fa.34.2025.06.09.10.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 10:37:32 -0700 (PDT)
Message-ID: <951f781a-d823-4240-a1c8-b9ea85ba64e0@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 20:37:31 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/adreno: Check for recognized GPU before bind
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
 <20250609170438.20793-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250609170438.20793-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zfrI3383KppVljnJVaW4MrebiUVvz2zg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEzMyBTYWx0ZWRfX+9CNRkALhSG1
 07NXHuU8Aw6HFTIGxVXh4YLOQFzNFIx1JX7LyjSecxGtrF/BfHXdXH3qNEk7kUu0j0qjvh+lNfO
 PAMDyh/I6PkazoHFimcRyCPvfSNwr4SThOrhF5ZOwXRGPV/+F9pLzL67pNkAYntqZS1ZmnTrVCK
 nU/0ks528FYRHCypYJIIoKHrLcg4ROaZt2wH9py20ya2u9iYO4LiLRYfMh/jwDLe97XDSRIut8P
 2Eggg0F6vq/zVo7ctnC0ZBovpD1QhQMBNzjhkwsER2DJjh2kcNXAvwRPKT8EH0ZvmSkLYfDEaIM
 3TZBn3hHHvJwuL2AerJfoI+nj5KfnEGKGW0d9hUxLCW1Ptp/ZALqJvhhPHWx/+oNhOJzpeFr4GK
 3U1fUdIqwXoKm///CSaNEgr1PBFGp0BUu40qO36duxbjWKxsl2us2XvRYrqvaROP/mcMpo48
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68471bec cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=4MAclHcQAAAA:8 a=ciEtJq1xeetoClZ_GcsA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-ORIG-GUID: zfrI3383KppVljnJVaW4MrebiUVvz2zg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090133

On 09/06/2025 20:04, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
>   drivers/gpu/drm/msm/msm_drv.c              |  2 +-
>   drivers/gpu/drm/msm/msm_gpu.h              |  1 +
>   3 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 504174dbe6d6..002aaf365322 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -178,6 +178,26 @@ static int find_chipid(struct device_node *node, uint32_t *chipid)
>   	return 0;
>   }
>   
> +bool adreno_has_gpu(struct device_node *node)
> +{
> +	const struct adreno_info *info;
> +	uint32_t chip_id;
> +	int ret;
> +
> +	ret = find_chipid(node, &chip_id);
> +	if (ret)
> +		return false;
> +
> +	info = adreno_info(chip_id);
> +	if (!info) {
> +		pr_warn("%s: Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",

Please use %pOFf instead of %s (and node instead of node->full_name).

Other than that, LGTM.

> +			node->full_name, ADRENO_CHIPID_ARGS(chip_id));
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static int adreno_bind(struct device *dev, struct device *master, void *data)
>   {
>   	static struct adreno_platform_config config = {};
> @@ -188,18 +208,17 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>   	int ret;
>   
>   	ret = find_chipid(dev->of_node, &config.chip_id);
> -	if (ret)
> +	/* We shouldn't have gotten this far if we can't parse the chip_id */
> +	if (WARN_ON(ret))
>   		return ret;
>   
>   	dev->platform_data = &config;
>   	priv->gpu_pdev = to_platform_device(dev);
>   
>   	info = adreno_info(config.chip_id);
> -	if (!info) {
> -		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
> -			ADRENO_CHIPID_ARGS(config.chip_id));
> +	/* We shouldn't have gotten this far if we don't recognize the GPU: */
> +	if (!WARN_ON(info))
>   		return -ENXIO;
> -	}
>   
>   	config.info = info;
>   
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 87ee9839ca4a..40eb04bab35e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -956,7 +956,7 @@ static int add_gpu_components(struct device *dev,
>   	if (!np)
>   		return 0;
>   
> -	if (of_device_is_available(np))
> +	if (of_device_is_available(np) && adreno_has_gpu(np))
>   		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
>   
>   	of_node_put(np);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 5508885d865f..56bd1a646b83 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -729,6 +729,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
>   void msm_gpu_cleanup(struct msm_gpu *gpu);
>   
>   struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
> +bool adreno_has_gpu(struct device_node *node);
>   void __init adreno_register(void);
>   void __exit adreno_unregister(void);
>   


-- 
With best wishes
Dmitry


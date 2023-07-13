Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30878752B56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 22:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjGMUGL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 16:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjGMUGL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 16:06:11 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17582D4B
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 13:06:09 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36DJxqYt032016;
        Thu, 13 Jul 2023 20:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=GQQFlseTHJXewMnf4AH7VinCynpLCICqRB3T1dO5yFA=;
 b=XTqJfk1c8Z5Q7SgjaJdrVp+y6pJNXZloQ236O34rLJ4g0XlzBOlxqVSPSKj+UmCVsvYd
 He9Byw8eMw+fGn8uApG9oD2tkArtiLWbRXetQ6bFJHN3GFb34zWpC3/m9SZAXJXl+h8k
 6AU7LrEq5cKuBgX0pK5+sTq9mSuirUy3qz1BKtyqd4mFiCTz1loDnMF3/dCP47b3b6zI
 bp2THZOL7j4iqfROhBgbAZKVnq3iz6SQ/uzkZ2RH519mMjdrMriC9mRExqApEWFbshvd
 AURlNx5VWJ0WuvIMxu6L8IAEgzrpTjOQtnPCRr8RPEeJloUg0O7GU3Yw6J7+Fqdy01it cw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpu904wy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jul 2023 20:06:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36DK65PJ024069
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jul 2023 20:06:05 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 13 Jul 2023 13:06:03 -0700
Date:   Fri, 14 Jul 2023 01:35:59 +0530
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     Rob Clark <robdclark@gmail.com>
CC:     <dri-devel@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [PATCH 05/12] drm/msm/adreno: Use quirk to identify
 cached-coherent support
Message-ID: <m2r2klrcvgs2qiywx5eetcwwjph6suzjey4hhbon3bhqdsbg7t@lvwdvbhoaqaw>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230706211045.204925-6-robdclark@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ejw8zUvfqETWCo_Wr3Lt5oLEArpleIJp
X-Proofpoint-ORIG-GUID: Ejw8zUvfqETWCo_Wr3Lt5oLEArpleIJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_08,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307130176
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 06, 2023 at 02:10:38PM -0700, Rob Clark wrote:
> 
> From: Rob Clark <robdclark@chromium.org>
> 
> It is better to explicitly list it.  With the move to opaque chip-id's
> for future devices, we should avoid trying to infer things like
> generation from the numerical value.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
>  2 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index f469f951a907..3c531da417b9 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -256,6 +256,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  	}, {
>  		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
> @@ -266,6 +267,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a615_zap.mdt",
>  		.hwcg = a615_hwcg,
> @@ -278,6 +280,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a630_zap.mdt",
>  		.hwcg = a630_hwcg,
> @@ -290,6 +293,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a640_zap.mdt",
>  		.hwcg = a640_hwcg,
> @@ -302,7 +306,8 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M + SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a650_zap.mdt",
>  		.hwcg = a650_hwcg,
> @@ -316,7 +321,8 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M + SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a660_zap.mdt",
>  		.hwcg = a660_hwcg,
> @@ -329,7 +335,8 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.hwcg = a660_hwcg,
>  		.address_space_size = SZ_16G,
> @@ -342,6 +349,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_2M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a640_zap.mdt",
>  		.hwcg = a640_hwcg,
> @@ -353,7 +361,8 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_4M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a690_zap.mdt",
>  		.hwcg = a690_hwcg,
> @@ -565,9 +574,9 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>  
> -	if (config.rev.core >= 6)
> -		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
> -			priv->has_cached_coherent = true;
> +	priv->has_cached_coherent =
> +		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> +		!adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index a7c4a2c536e3..e08d41337169 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -33,6 +33,7 @@ enum {
>  #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
>  #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
> +#define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
a shorter ADRENO_IS_IOCOHERENT?

-Akhil

>  
>  struct adreno_rev {
>  	uint8_t  core;
> -- 
> 2.41.0
> 

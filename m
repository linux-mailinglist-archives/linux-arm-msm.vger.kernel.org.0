Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 655507A2AD3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Sep 2023 01:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbjIOXCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 19:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237489AbjIOXCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 19:02:12 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAA710D
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 16:02:04 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FMvXt1004607;
        Fri, 15 Sep 2023 23:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VXBlEB2XpPMFGFEmGKIaOcT821gt2+mnrTCQkXmlEkM=;
 b=XTXlZM5Q7YVHh0jBttte3un0au4ydRqBkMIXb2cj4XYSuCWmsTWWAAaCXq+l5MZ0RBto
 HXyIFsDkKZ3Krsmjcoz7ptfpZz96+tEu7cJkpNnvcRfVhizFcxqAoU3qvqa9Py1WUVnf
 Et8/19fUyMaycekkLufuM0+iwPSTMTGl8l+rZHpMXzuaJVeCMk/it92xgoDjmv7wKASV
 lc8GeE4hfDgOSOacy6E1kH6xBD2DlqhtvpM0/2lNc/xJm8NJ4cTW+ycpEw1aKo6zfQqn
 5KyZ4F3SphEVuHc85IPj13j8bzPOR1bnC9fD8jndeUgTGD5604OsLjHYS8NQ2YOZwR7a uA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g842auj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 23:01:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FN1r55008520
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 23:01:53 GMT
Received: from [10.110.81.121] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 16:01:50 -0700
Message-ID: <a2c778b0-43c4-3485-e7c6-e40484e451dc@quicinc.com>
Date:   Fri, 15 Sep 2023 16:01:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 8/9] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3,
 QSEED3LITE, QSEED4
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
 <20230911214521.787453-9-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230911214521.787453-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cH7O6aV_aYzVudPOWLZbc_AKEi0KPlEl
X-Proofpoint-ORIG-GUID: cH7O6aV_aYzVudPOWLZbc_AKEi0KPlEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_19,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150206
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/11/2023 2:45 PM, Dmitry Baryshkov wrote:
> Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
> are all related to different versions of the same HW scaling block.
> Corresponding driver parts use scaler_blk.version to identify the
> correct way to program the hardware. In order to simplify the driver
> codepath, merge these three feature bits.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I am okay with some parts of this change but not all.

Please see below.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 4 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
>   5 files changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b37b4076e53a..67d66319a825 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -31,10 +31,10 @@
>   	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
>   
>   #define VIG_SC7180_MASK \
> -	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
> +	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>   
>   #define VIG_SM6125_MASK \
> -	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
> +	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>  

This is like a half-n-half solution. This is telling that SC7180 and 
SM6125 have a scaler blk version of 3.1 but are still qseed3. That gives 
a misleading picture.



>   #define VIG_SC7180_MASK_SDMA \
>   	(VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index fc5027b0123a..ba262b3f0bdc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -51,9 +51,7 @@ enum {
>   /**
>    * SSPP sub-blocks/features
>    * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
> - * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
> - * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
> - * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
> + * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support (also QSEED3LITE and QSEED4)
>    * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
>    * @DPU_SSPP_CSC,            Support of Color space converion
>    * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
> @@ -72,8 +70,6 @@ enum {
>   enum {
>   	DPU_SSPP_SCALER_QSEED2 = 0x1,
>   	DPU_SSPP_SCALER_QSEED3,
> -	DPU_SSPP_SCALER_QSEED3LITE,
> -	DPU_SSPP_SCALER_QSEED4,
>   	DPU_SSPP_SCALER_RGB,
>   	DPU_SSPP_CSC,
>   	DPU_SSPP_CSC_10BIT,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 7e9c87088e17..d1b70cf72eef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -594,9 +594,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
>   		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
>   		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
>   
> -	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
> -			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
> -			test_bit(DPU_SSPP_SCALER_QSEED4, &features))
> +	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features))
>   		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
>  
any reason we cannot replace this with sblk->scaler_blk.version >= 1.2?

>   	if (test_bit(DPU_SSPP_CDP, &features))
> @@ -629,10 +627,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>   			cfg->len,
>   			kms);
>   
> -	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> +	if (sblk->scaler_blk.len)
>   		dpu_debugfs_create_regset32("scaler_blk", 0400,
>   				debugfs_root,
>   				sblk->scaler_blk.base + cfg->base,

This part LGTM.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index ca02f86c94ed..b157ed7da065 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -26,9 +26,7 @@ struct dpu_hw_sspp;
>    */
>   #define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
>   			 BIT(DPU_SSPP_SCALER_QSEED2) | \
> -			 BIT(DPU_SSPP_SCALER_QSEED3) | \
> -			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
> -			 BIT(DPU_SSPP_SCALER_QSEED4))
> +			 BIT(DPU_SSPP_SCALER_QSEED3))
>   

I am not seeing DPU_SSPP_SCALER_RGB being set by any chipset in the 
catalog? So we can drop it in a separate change and then just use 
sblk->scaler_blk.len in the place of this macro and drop this macro.

>   /*
>    * Define all CSC feature bits in catalog
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c2aaaded07ed..109355275ec5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
>   			scale_cfg->src_height[i] /= chroma_subsmpl_v;
>   		}
>   
> -		if (pipe_hw->cap->features &
> -			BIT(DPU_SSPP_SCALER_QSEED4)) {
> +		if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
>   			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
>   			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
>   		} else {

This part LGTM.

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBEC78D1AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 03:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234837AbjH3BVb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 21:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241548AbjH3BVT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 21:21:19 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2233EE
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 18:21:16 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37U13UTC003466;
        Wed, 30 Aug 2023 01:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=61aeN3uhFCGtTiNlLpamkcRPSt1Bojbf8SvmuoUcVFA=;
 b=STHP71B5p3N5JNnLNCDbXqKLLVHTxaCi+zq9U+ZBIuUxf2lpNuHgc3mcVaXkfE96dI2Q
 Wo6cpk1iunjEW1fvlWp1Bzq6ALUMr5pYbY0M2xP+nyLVUOQ57U0u6Co9UQvcaiOCO6hW
 CqLjrRtgWcZUXORknd9Al04J1NPVd7mKA+XryHv/gn1GDd5hIm1Qexh1fl62wzXwCOtA
 ierWabQ4kx0bPvMNyk3guA5YydG9UQXpFvGvwu8G/lZMidoAFxEYKsM29YjWwTbRhDmT
 qaU2fo8bQ8Poy8Mw9d/CpC52gpDOqSFQIFELExecpKT1CROOK+WzusRfrN6nvrMTXF2C lA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss7metwna-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Aug 2023 01:20:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37U1KkTh031111
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Aug 2023 01:20:46 GMT
Received: from [10.71.110.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 18:20:45 -0700
Message-ID: <3028dc15-c58e-c7e9-fb8d-67b2c67299a8@quicinc.com>
Date:   Tue, 29 Aug 2023 18:20:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: split
 _dpu_encoder_resource_control_helper()
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
References: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
 <20230604144514.949628-3-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230604144514.949628-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0EZ99Yr3y3tyDljr47yKW-I_8ZrikPDf
X-Proofpoint-GUID: 0EZ99Yr3y3tyDljr47yKW-I_8ZrikPDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308300011
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/4/2023 7:45 AM, Dmitry Baryshkov wrote:
> Follow the _dpu_encoder_irq_control() change and split the
> _dpu_encoder_resource_control_helper() into enable and disable parts.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++++++++++++--------
>   1 file changed, 29 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7c131c5cbe71..cc61f0cf059d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -757,8 +757,7 @@ static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
>   	}
>   }
>   
> -static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
> -		bool enable)
> +static void _dpu_encoder_resource_enable(struct drm_encoder *drm_enc)
>   {
>   	struct msm_drm_private *priv;
>   	struct dpu_kms *dpu_kms;
> @@ -768,28 +767,42 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
>   	priv = drm_enc->dev->dev_private;
>   	dpu_kms = to_dpu_kms(priv->kms);
>   
> -	trace_dpu_enc_rc_helper(DRMID(drm_enc), enable);
> +	trace_dpu_enc_rc_helper(DRMID(drm_enc), true);

same question about trace here.

>   
>   	if (!dpu_enc->cur_master) {
>   		DPU_ERROR("encoder master not set\n");
>   		return;
>   	}
>   
> -	if (enable) {
> -		/* enable DPU core clks */
> -		pm_runtime_get_sync(&dpu_kms->pdev->dev);
> +	/* enable DPU core clks */
> +	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>   
> -		/* enable all the irq */
> -		_dpu_encoder_irq_enable(drm_enc);
> +	/* enable all the irq */
> +	_dpu_encoder_irq_enable(drm_enc);
> +}
>   
> -	} else {
> -		/* disable all the irq */
> -		_dpu_encoder_irq_disable(drm_enc);
> +static void _dpu_encoder_resource_disable(struct drm_encoder *drm_enc)
> +{
> +	struct msm_drm_private *priv;
> +	struct dpu_kms *dpu_kms;
> +	struct dpu_encoder_virt *dpu_enc;
>   
> -		/* disable DPU core clks */
> -		pm_runtime_put_sync(&dpu_kms->pdev->dev);
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	priv = drm_enc->dev->dev_private;
> +	dpu_kms = to_dpu_kms(priv->kms);
> +
> +	trace_dpu_enc_rc_helper(DRMID(drm_enc), false);

and here.

> +
> +	if (!dpu_enc->cur_master) {
> +		DPU_ERROR("encoder master not set\n");
> +		return;
>   	}
>   
> +	/* disable all the irq */
> +	_dpu_encoder_irq_disable(drm_enc);
> +
> +	/* disable DPU core clks */
> +	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
>   
>   static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
> @@ -847,7 +860,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
>   		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
>   			_dpu_encoder_irq_enable(drm_enc);
>   		else
> -			_dpu_encoder_resource_control_helper(drm_enc, true);
> +			_dpu_encoder_resource_enable(drm_enc);
>   
>   		dpu_enc->rc_state = DPU_ENC_RC_STATE_ON;
>   
> @@ -942,7 +955,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
>   		 * and in IDLE state the resources are already disabled
>   		 */
>   		if (dpu_enc->rc_state == DPU_ENC_RC_STATE_PRE_OFF)
> -			_dpu_encoder_resource_control_helper(drm_enc, false);
> +			_dpu_encoder_resource_disable(drm_enc);
>   
>   		dpu_enc->rc_state = DPU_ENC_RC_STATE_OFF;
>   
> @@ -977,7 +990,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
>   		if (is_vid_mode)
>   			_dpu_encoder_irq_disable(drm_enc);
>   		else
> -			_dpu_encoder_resource_control_helper(drm_enc, false);
> +			_dpu_encoder_resource_disable(drm_enc);
>   
>   		dpu_enc->rc_state = DPU_ENC_RC_STATE_IDLE;
>   

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B026EF8D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Apr 2023 18:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbjDZQ5d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Apr 2023 12:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbjDZQ5c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Apr 2023 12:57:32 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7116F5249
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Apr 2023 09:57:31 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QG4fbQ027862;
        Wed, 26 Apr 2023 16:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FwKcP5niNOmqwkdOLHKL8t5D6iVAlSUHqMpOYKiuw1Q=;
 b=Ow3lO/jbifrmJiwdw90wyUskV6ozX3Hqy1OV4UuJykvf3YyY/dL1na+E4n6KSYV2sAKY
 kJalKs5sh0XRYJTeRUsaj+Nrsvumup8mV2uwO3DlVv3YQ1SxqG0hLdl8Ocr0nLBJ1iAB
 LaG7ROEOnXwrI6JdsflwleCJEZKf9OtYGeuCqVhblojJM/cVnZNCTxu8rnV4pQJdHiVM
 7bS7gxFkWzpHufX83pEfC5DANioip+FwGVnvZVhneDIWQffAFCAnQLry4ZE4Xf+5X4xA
 QYobKXMIAnAvvaL/ezxw4Iue7XYVqtsf/ky4Lk2S2q0TeGaMljIwJJctd2E/Nd3VKTOf 2g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q70nes5nw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Apr 2023 16:57:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33QGvO0g025207
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Apr 2023 16:57:24 GMT
Received: from [10.110.11.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 26 Apr
 2023 09:57:23 -0700
Message-ID: <06f52002-c99a-a582-1308-6e8a4560a541@quicinc.com>
Date:   Wed, 26 Apr 2023 09:57:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: access QSEED registers
 directly
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230422000839.1921358-1-dmitry.baryshkov@linaro.org>
 <20230422000839.1921358-3-dmitry.baryshkov@linaro.org>
From:   Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230422000839.1921358-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3001gBceZkjjzqpbwL4DBHcWVBk4LUqN
X-Proofpoint-GUID: 3001gBceZkjjzqpbwL4DBHcWVBk4LUqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_08,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260149
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/21/2023 5:08 PM, Dmitry Baryshkov wrote:
> Stop using _sspp_subblk_offset() to get offset of the scaler_blk. Inline
> this function and use ctx->cap->sblk->scaler_blk.base directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 27 +++++++--------------
>   1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index fce135f010d4..22c59f2250be 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -149,11 +149,6 @@ static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
>   	sblk = ctx->cap->sblk;
>   
>   	switch (s_id) {
> -	case DPU_SSPP_SCALER_QSEED2:
> -	case DPU_SSPP_SCALER_QSEED3:
> -	case DPU_SSPP_SCALER_RGB:
> -		*idx = sblk->scaler_blk.base;
> -		break;
>   	case DPU_SSPP_CSC:
>   	case DPU_SSPP_CSC_10BIT:
>   		*idx = sblk->csc_blk.base;
> @@ -195,22 +190,21 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>   static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
>   		u32 mask, u8 en)
>   {
> -	u32 idx;
> +	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
>   	u32 opmode;
>   
>   	if (!test_bit(DPU_SSPP_SCALER_QSEED2, &ctx->cap->features) ||
> -		_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED2, &idx) ||
>   		!test_bit(DPU_SSPP_CSC, &ctx->cap->features))
>   		return;
>   
> -	opmode = DPU_REG_READ(&ctx->hw, SSPP_VIG_OP_MODE + idx);
> +	opmode = DPU_REG_READ(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE);
>   
>   	if (en)
>   		opmode |= mask;
>   	else
>   		opmode &= ~mask;
>   
> -	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_OP_MODE + idx, opmode);
> +	DPU_REG_WRITE(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE, opmode);
>   }
>   
>   static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
> @@ -416,25 +410,22 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
>   		struct dpu_hw_scaler3_cfg *scaler3_cfg,
>   		const struct dpu_format *format)
>   {
> -	u32 idx;
> -
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
> -		|| !scaler3_cfg)
> +	if (!ctx || !scaler3_cfg)
>   		return;
>   
> -	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
> +	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg,
> +			ctx->cap->sblk->scaler_blk.base,
>   			ctx->cap->sblk->scaler_blk.version,
>   			format);
>   }
>   
>   static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
>   {
> -	u32 idx;
> -
> -	if (!ctx || _sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx))
> +	if (!ctx)
>   		return 0;
>   
> -	return dpu_hw_get_scaler3_ver(&ctx->hw, idx);
> +	return dpu_hw_get_scaler3_ver(&ctx->hw,
> +				      ctx->cap->sblk->scaler_blk.base);
>   }
>   
>   /*
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D62DE54DAD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 08:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358853AbiFPGjU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 02:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358742AbiFPGjU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 02:39:20 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889F756FA5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 23:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655361559; x=1686897559;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J4D+lzNfTLikG8wWJ++Wu7CZ6chaUPMyBbaxvNfq1/I=;
  b=y8n7ivE0oGLP1ategt0mbPHHFsG0wkyYQ+i4FQN525jv3l+LKpdnxc6D
   csWV8JhcLVswPNo+3advfvq+tTSpxf8EUV8C+rvC4l7IVqz4f5UMtvfVI
   WW0KnbD8oQiH0kSS+fnOQAV/03dWn9MN1bCZn0ONm+Vet6GIViIKTPe1R
   w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jun 2022 23:39:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 23:39:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 23:39:18 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 23:39:16 -0700
Message-ID: <4d334492-0c43-47ae-b8f6-9242fc2ae6bf@quicinc.com>
Date:   Wed, 15 Jun 2022 23:39:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/msm/dpu: dont_use IS_ERR_OR_NULL for encoder phys
 backends
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220507115942.1705872-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220507115942.1705872-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/7/2022 4:59 AM, Dmitry Baryshkov wrote:
> The functions dpu_encoder_phys_foo_init() can not return NULL. Replace
> corresponding IS_ERR_OR_NULL() checks with just IS_ERR().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb20cb8..07de0c0506d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2144,10 +2144,10 @@ static int dpu_encoder_virt_add_phys_encs(
>   	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
>   		enc = dpu_encoder_phys_vid_init(params);
>   
> -		if (IS_ERR_OR_NULL(enc)) {
> +		if (IS_ERR(enc)) {
>   			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
>   				PTR_ERR(enc));
> -			return enc == NULL ? -EINVAL : PTR_ERR(enc);
> +			return PTR_ERR(enc);
>   		}
>   
>   		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
> @@ -2157,10 +2157,10 @@ static int dpu_encoder_virt_add_phys_encs(
>   	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
>   		enc = dpu_encoder_phys_cmd_init(params);
>   
> -		if (IS_ERR_OR_NULL(enc)) {
> +		if (IS_ERR(enc)) {
>   			DPU_ERROR_ENC(dpu_enc, "failed to init cmd enc: %ld\n",
>   				PTR_ERR(enc));
> -			return enc == NULL ? -EINVAL : PTR_ERR(enc);
> +			return PTR_ERR(enc);
>   		}
>   
>   		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
> @@ -2170,10 +2170,10 @@ static int dpu_encoder_virt_add_phys_encs(
>   	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
>   		enc = dpu_encoder_phys_wb_init(params);
>   
> -		if (IS_ERR_OR_NULL(enc)) {
> +		if (IS_ERR(enc)) {
>   			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
>   					PTR_ERR(enc));
> -			return enc == NULL ? -EINVAL : PTR_ERR(enc);
> +			return PTR_ERR(enc);
>   		}
>   
>   		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;

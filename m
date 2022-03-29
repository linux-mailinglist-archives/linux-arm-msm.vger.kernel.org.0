Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8EDF4EB538
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Mar 2022 23:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233885AbiC2V2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 17:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233747AbiC2V2M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 17:28:12 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D1F2274F6
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648589189; x=1680125189;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=d+l6zk+HBGJYVQnsOcVI6/lvAO3CQ/oEJX8wdFBB6EE=;
  b=Xzy9vm0nYOtbchx7v7Uki8nUxbcXZ4HsZ9yyYcF9ijChFWddoO8Y0+7H
   YvL4+9PYRWzbwIQucVHvojuEQhOAvJks/C0kZZydipvA8hOamVbDNAFAl
   y3J6a2+RU6/He+J/8dgyVGoJBaPeG5cMeULQJ0OSkvTZg7bGV3OnOZaQa
   M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Mar 2022 14:26:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:26:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 14:26:27 -0700
Received: from [10.110.122.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 29 Mar
 2022 14:26:27 -0700
Message-ID: <d82ffad8-46a7-853f-b379-7c548cd4fa0f@quicinc.com>
Date:   Tue, 29 Mar 2022 14:26:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/3] drm/msm/dpu: fix error handling around
 dpu_hw_vbif_init
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
 <20220217034502.464312-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220217034502.464312-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/16/2022 7:45 PM, Dmitry Baryshkov wrote:
> Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
> the value is NULL, then the function will return 0 instead of a proper
> return code. Moreover dpu_hw_vbif_init() function can not return NULL.
> So, replace corresponding IS_ERR_OR_NULL() call with IS_ERR().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 81a35c8d62e7..f8f1bf3b511d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1102,10 +1102,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   
>   		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
>   				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
> -		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
> +		if (IS_ERR(dpu_kms->hw_vbif[vbif_idx])) {
>   			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
> -			if (!dpu_kms->hw_vbif[vbif_idx])
> -				rc = -EINVAL;
>   			DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
>   			dpu_kms->hw_vbif[vbif_idx] = NULL;
>   			goto power_error;

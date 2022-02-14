Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 317C34B5AB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 20:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiBNTp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 14:45:26 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiBNTpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 14:45:25 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B101179B9
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 11:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644867909; x=1676403909;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4iZqoUrkugin9SUai2lkb0dMAEuY8zcppu0qMTnAWZs=;
  b=hPks0+zw8v6PDIYnjr+DYaQLff/vcI28EIOBbVphryH/f8yqZjNqgQYz
   XM+C10dIIEpfiQ4bG0SvtGIjukArcq721gOMpYSCOED9CP6IroLtN7GQQ
   823c9CxwU9sKjzGdymvOsuurhZNPkoOChDlBG4ISWA38QTE5DiSuIu4js
   4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 14 Feb 2022 11:15:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 11:15:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 11:15:43 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 14 Feb
 2022 11:15:41 -0800
Message-ID: <5b517150-ae78-98c6-b9a8-d84905f38f56@quicinc.com>
Date:   Mon, 14 Feb 2022 11:15:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 5/6] drm/msm/dpu: fix error handling in dpu_rm_init
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
 <20220121210618.3482550-6-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220121210618.3482550-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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



On 1/21/2022 1:06 PM, Dmitry Baryshkov wrote:
> Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
> the value is NULL, then the function will return 0 instead of a proper
> return code. Moreover none of dpu_hw_*_init() functions can return NULL.
> So, replace all dpu_rm_init()'s IS_ERR_OR_NULL() calls with IS_ERR().
> 
Can you please give an example of a case where dpu_hw_*_init() can 
return NULL?

All dpu_hw_*_init() functions are only called if the corresponding
hw*_counts are valid. So I would like to understand this.

Now, if NULL is treated as a non-error case, should we atleast print
a message indicating so?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 96554e962e38..7497538adae1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -109,7 +109,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_lm_init(lm->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed lm object creation: err %d\n", rc);
>   			goto fail;
> @@ -126,7 +126,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_merge_3d_init(merge_3d->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed merge_3d object creation: err %d\n",
>   				rc);
> @@ -144,7 +144,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_pingpong_init(pp->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed pingpong object creation: err %d\n",
>   				rc);
> @@ -168,7 +168,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_intf_init(intf->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed intf object creation: err %d\n", rc);
>   			goto fail;
> @@ -185,7 +185,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_ctl_init(ctl->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed ctl object creation: err %d\n", rc);
>   			goto fail;
> @@ -202,7 +202,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_dspp_init(dspp->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed dspp object creation: err %d\n", rc);
>   			goto fail;

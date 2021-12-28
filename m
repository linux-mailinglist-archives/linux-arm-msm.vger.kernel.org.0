Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BECF480DDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Dec 2021 00:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237719AbhL1XL2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Dec 2021 18:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237713AbhL1XL2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Dec 2021 18:11:28 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078E1C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Dec 2021 15:11:28 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id a26-20020a9d6e9a000000b0058f37eeb861so23602627otr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Dec 2021 15:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QJatUqtrqh2u+VQ/YEVsxnrHJlj+/BrTRHbzfVft99w=;
        b=lqkilty6YJQ1GjHtPQzpLJtQ3DiUkzKB4wNlcIoixTL8Bi1PYowZY6V0KjQh60SlXi
         NWIzka+giCnGfLHgBA12GV0CMRk48HAlTIPHP4viQV8K8lfwWYZ3hwpWTKf1ZE5TYzX/
         2pikMyyMySkKvU+eG9JFxmYMKaw/phzBKQ46NU0QWPGB4HK8B30lVgIoa7JgUMHCFZot
         F6e7/7uRG9Z9SA6v4ztKE6RHQOs2t4icWTZ7fAgHrAWfzXK9oRvS42wfdXHImPgLdRWc
         UOYpr8PFxM81Yz6fXQLh3bfd0zOjOt3ZQcj8EoODoMt/GUjboz6SD1tLcoNTRttnIqdL
         NwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QJatUqtrqh2u+VQ/YEVsxnrHJlj+/BrTRHbzfVft99w=;
        b=lS5LpYb+1x1q+fddhLwyxmh9Zt7gJztuO0MvVo3YYSXuXuK4BMnDtNZEnpIdOPICdI
         Vxb3nggBPv6qlXyXDNW5LTvTAwDjkMtE/1IUfKMNnUphxfTijcF8BOH63za978qKF0a1
         Yjxa5rmOGPW6v23JBotbbF9fOcqN0gmvqiRUABzH/t3VTEZ+Kf014C982RvBXjufLWLL
         NrgjpkSyGvQ3u7BY6d2vSwk9kJQW9oiMPS7J5sRI9DVJUW13saKihAr6DhKbTL4jetqP
         dfGNPqiPAjQy7Vvz8d+C280FggZZO31Emqp+KxEbdHNvLd1/58PlpMSDTSYA6+9sQsg2
         tSBg==
X-Gm-Message-State: AOAM533LyFJx+dshnyIRp5z1C135JFHBRXf74LB/uYS1FaV35sG4IN4r
        9L1T9aoPE0L9KE+ryc8ua7DAIQ==
X-Google-Smtp-Source: ABdhPJwH8iu/90QsiUNBVr78Y45xQO15a26mtV1pK6pLYmCJ5Ecawo2PscMep3kzBxC6RJzSDRQwdA==
X-Received: by 2002:a9d:200f:: with SMTP id n15mr16820098ota.66.1640733087117;
        Tue, 28 Dec 2021 15:11:27 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a6sm4198301oil.6.2021.12.28.15.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 15:11:26 -0800 (PST)
Date:   Tue, 28 Dec 2021 15:12:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kuogee Hsieh <khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: add support of tps4 (training pattern 4) for
 HBR3
Message-ID: <YcuZ29QV+hfJprSl@ripper>
References: <1640717489-7366-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1640717489-7366-1-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Dec 10:51 PST 2021, Kuogee Hsieh wrote:

> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Some DP sinkers prefer to use tps4 instead of tps3 during training #2.
> This patch will use tps4 to perform link training #2 if sinker's DPCD
> supports it.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 39558a2..c7b0657 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1181,7 +1181,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>  			int *training_step)
>  {
>  	int tries = 0, ret = 0;
> -	char pattern;
> +	char pattern, state_ctrl_bit;
>  	int const maximum_retries = 5;
>  	u8 link_status[DP_LINK_STATUS_SIZE];
>  
> @@ -1189,12 +1189,20 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>  
>  	*training_step = DP_TRAINING_2;
>  
> -	if (drm_dp_tps3_supported(ctrl->panel->dpcd))
> +	if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
> +		pattern = DP_TRAINING_PATTERN_4;
> +		state_ctrl_bit = 4;
> +	}
> +	else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {
>  		pattern = DP_TRAINING_PATTERN_3;
> -	else
> +		state_ctrl_bit = 3;
> +	}
> +	else {
>  		pattern = DP_TRAINING_PATTERN_2;
> +		state_ctrl_bit = 2;
> +	}
>  
> -	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, pattern);
> +	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, state_ctrl_bit);

The patch looks good, but as the state_ctrl_bit is no longer equal to
DP_PATTERN_n the function and argument names are misleading.

Please rename it to something like
"dp_catalog_ctrl_set_pattern_state_bit()" and the "pattern" argument
within that function to "state_bit".

Thanks,
Bjorn

>  	if (ret)
>  		return ret;
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

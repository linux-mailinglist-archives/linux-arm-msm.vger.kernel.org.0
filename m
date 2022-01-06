Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732EF486D8B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 00:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245354AbiAFXJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 18:09:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245283AbiAFXJV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 18:09:21 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96AEC061201
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 15:09:20 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id t204so5873195oie.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 15:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ellt6MjzLF5sLUldei4o9NxlFsmkksIJlVQvjDivSks=;
        b=CqQBSA9Fycf49Rqosg7w2As6sk5LjhU7gBBtMELfqTFoE5LTYaH0EAFx5MJJc1MISu
         /QlNcmT56A3epX0FVXHwV5WiJS6EiLIVIqyP4Ew5UvnPEeL95DYBjlcIVZmDa32IZofs
         hzTKsy+r1Ypb/I8H5g9k3AVOzr4FKAlnk4Bx9EShJ7lRADBi38f62utDApMIKae6o90B
         CzoehUttwZFiHdFzhqFJuy3vzUHPIz/dpp/lC2UjiY9uQfBjszH7Kb6Vthawtk8RYCo3
         ZYz6eicpbT/KC8zEJQtnob7ZRuKwU8pfwakGC88KPDYRORNCDFipx8gzoJ1a3XkopGpU
         TXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ellt6MjzLF5sLUldei4o9NxlFsmkksIJlVQvjDivSks=;
        b=DQV9lX57aCWYrH1f+F6ULla0kY9A0or5lge78xJaK95mQUsWf3rkBQAMMBc8noeLWB
         /2ffUDCvWEY4ADbsxp9sCL3/5+mk94nLjGP+K+VqpXe5nltQ50bC5/4/NgWjViYXr2L1
         nLx+lQJtyYOSJCVmxlfe3lz1QBp0gvJWqtw6ybvIu5LILqCTc+2FadvJZfyWuREcejWU
         DP/pxRrjjM4hmwzyE76hzaudPmzI1cAjpTqY+GkkM5wmWswLs3B7smhWuV1r23EtvtOz
         3Z1pe8/5eNUyfta88NCYy43yPhNYGPmrZCJ7vMhE453cIHCcVYnZ/k2GqClmbjjPLniG
         i7lg==
X-Gm-Message-State: AOAM531qGrp1LTKptx8/DfbXd8xTJKZPb+6fewTXrGG1my+aILN8f8M1
        gI2/Ov50DzJehtzeQSTPuZFFuzVo8mzQww==
X-Google-Smtp-Source: ABdhPJyq6sRzUeRRegPHrbZlM4MOy++XyhVktPJ6AqBMtRYyZCcV2eNcaXx6iApBKxUIexhmB6lTPg==
X-Received: by 2002:a54:4493:: with SMTP id v19mr2915886oiv.61.1641510560064;
        Thu, 06 Jan 2022 15:09:20 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n26sm574272ooc.48.2022.01.06.15.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:09:19 -0800 (PST)
Date:   Thu, 6 Jan 2022 15:10:08 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm/dp:  populate connector of struct  dp_panel
Message-ID: <Ydd20C+YP2w060Tn@ripper>
References: <1641501894-17563-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1641501894-17563-1-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 06 Jan 12:44 PST 2022, Kuogee Hsieh wrote:

> DP CTS test case 4.2.2.6 has valid edid with bad checksum on purpose
> and expect DP source return correct checksum. During drm edid read,
> correct edid checksum is calculated and stored at
> connector::real_edid_checksum.
> 

Interesting, thanks for adding this!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> The problem is struct dp_panel::connector never be assigned, instead the
> connector is stored in struct msm_dp::connector. When we run compliance
> testing test case 4.2.2.6 dp_panel_handle_sink_request() won't have a valid
> edid set in struct dp_panel::edid so we'll try to use the connectors
> real_edid_checksum and hit a NULL pointer dereference error because the
> connector pointer is never assigned.
> 
> Changes in V2:
> -- populate panel connector at msm_dp_modeset_init() instead of at dp_panel_read_sink_caps()
> 
> Changes in V3:
> -- remove unhelpful kernel crash trace commit text
> -- remove renaming dp_display parameter to dp
> 
> Changes in V4:
> -- add more details to commit text
> 
> Fixes: 7948fe12d47 ("drm/msm/dp: return correct edid checksum after corrupted edid checksum read")
> Signee-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3449d3f..40a059d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1499,6 +1499,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>  			struct drm_encoder *encoder)
>  {
>  	struct msm_drm_private *priv;
> +	struct dp_display_private *dp_priv;
>  	int ret;
>  
>  	if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
> @@ -1507,6 +1508,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>  	priv = dev->dev_private;
>  	dp_display->drm_dev = dev;
>  
> +	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
> +
>  	ret = dp_display_request_irq(dp_display);
>  	if (ret) {
>  		DRM_ERROR("request_irq failed, ret=%d\n", ret);
> @@ -1524,6 +1527,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>  		return ret;
>  	}
>  
> +	dp_priv->panel->connector = dp_display->connector;
> +
>  	priv->connectors[priv->num_connectors++] = dp_display->connector;
>  	return 0;
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

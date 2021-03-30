Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90BB34DF17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhC3DQu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhC3DQe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:16:34 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D136C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:16:34 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id n12-20020a4ad12c0000b02901b63e7bc1b4so3459555oor.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BbiUtJcTU0s9GBE7VMo5ArmKSVJ+whelLeWlW4S+Rl8=;
        b=NTh/nyb6jyS0BDMpH4EFPz5UFr9EjQfVqwO6IDspXDj635dD9lQAo4/BYfk3M4eaDj
         dzDUavx1dOxwuLKZl3bd09Pdwvk+vQ9f6V9jf7e8X3IOtSmTCDPUM4c+M8IrkNymqNjN
         6R+cAfcxu3ly/CFOXfN/8TkUfuCRY2yDKw57Yfd5BVVMsqkZ1CFjnyG/txrSgwEzLpqv
         n6xdyCW+ps75JLDBrIRZ5sqggrTyK6tL8cvVd/07FH1IKaMh999rXFqYcd9mGU0csQRs
         NEqTJsfQJMvhpP3kmpUI7JBSmQ7b3O33VdbxjJ6Av3uWkZ995vgl8aF72dgc5gjLYQrq
         oulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BbiUtJcTU0s9GBE7VMo5ArmKSVJ+whelLeWlW4S+Rl8=;
        b=AcZPRgQK1YEvC6g4Ue+RsTxAUoeTmGyJwjWQ8Dyt4gfe5bsC2zY1Jt8FqEMdCp2ufX
         l79peuPDy1zMohTGQI8YRMOzlZb8kt6xxs7cd2F5AEjiUisI04Di1rd2+b0MiVXkAhE4
         SdkoLOhwWpVKJ+lWRS1J9IVvG4WOAeYO5iFNBiN++xAZzWm3A8V6FbHkyyhTy7s5PWhN
         KtXeMwd109x94LqDW04nWGG1zeKv7qYxBL93v9lI/PPKXuIqj1sicG5zlU2sjEBaaTrG
         ibvW3ZuoFtV0HeOSZ+SQko9SWUtO6hq5inCeb5Z+3m7SkAsPh8frHpdSeWRsDPkTQGc+
         NNxQ==
X-Gm-Message-State: AOAM531O8xdLY8ZXx6YobReWIEsr/3F4jrwWZNX8w7UW2Y+xSLQtVEzB
        FrpqyFxnvFg1tovjo160vXsaWw==
X-Google-Smtp-Source: ABdhPJzYp2O4gVtnixVZG2kbyQF+HvlHY3ouevBNmotObRpgcE/psp/e5x8OWYmI375hx5v48UDavg==
X-Received: by 2002:a4a:d88a:: with SMTP id b10mr23514407oov.29.1617074193873;
        Mon, 29 Mar 2021 20:16:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m19sm4137863oop.6.2021.03.29.20.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 20:16:33 -0700 (PDT)
Date:   Mon, 29 Mar 2021 22:16:31 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] drm/msm: add compatibles for sm8150/sm8250 display
Message-ID: <YGKYDzCzwz+1pxOi@builder.lan>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
 <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 29 Mar 07:00 CDT 2021, Dmitry Baryshkov wrote:

> From: Jonathan Marek <jonathan@marek.ca>
> 
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
> 
> Also inverse the non-mdp4 condition in add_display_components() to avoid
> having to check every new compatible in the condition.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>  drivers/gpu/drm/msm/msm_drv.c           | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5a8e3e1fc48c..fff12a4c8bfc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
>  static const struct of_device_id dpu_dt_match[] = {
>  	{ .compatible = "qcom,sdm845-dpu", },
>  	{ .compatible = "qcom,sc7180-dpu", },
> +	{ .compatible = "qcom,sm8150-dpu", },
> +	{ .compatible = "qcom,sm8250-dpu", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dpu_dt_match);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 94525ac76d4e..928f13d4bfbc 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
>  	 * Populate the children devices, find the MDP5/DPU node, and then add
>  	 * the interfaces to our components list.
>  	 */
> -	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
> -	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
> -	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
> +	if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {

Please consider reviewing my proposed alternative solution for this
hunk:

https://lore.kernel.org/linux-arm-msm/20210317025634.3987908-1-bjorn.andersson@linaro.org/

For the rest

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>  		if (ret) {
>  			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> @@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
>  	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>  	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> -- 
> 2.30.2
> 

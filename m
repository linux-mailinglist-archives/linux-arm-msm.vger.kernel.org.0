Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E3F31CE7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 17:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbhBPQzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 11:55:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhBPQzK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 11:55:10 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF95C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 08:54:30 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id r77so9982891qka.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Zhyu+nC9+CPMV4JA3grDQ6Xc5qBaXkOYbaPkzmAlcg=;
        b=gbFxfeL0ybh8TJ11CwDsF8YXkz5foMi6jC7WLCPgNjrHnNJyO5lsI0RR+hGTUzCstP
         rfjAqDYTpnJgkHzoZUKAr+cKMf/vHLLDZ0OFL9+S2Xx4wbBQZxa8memc4+v1TgD/fFwE
         k5rIpN3IMKkU6MsdR3u6USf51Vmse//UQHpEiyDVGd3FLPCsYtCwyNIjibsVRtmycboE
         GNaMDoVw5rOEOa2yFK0wVy7iRy3T1kRSkN72kHwq80EFeXFYXVnBN7OjQo+PkK1fvkdA
         los2vdAuCqT22DC3wS2OCGU4brNnY8sCSZo6qZ1bqTTRJE7oIR9HHzRQ+ciLfhJv1WT3
         heVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Zhyu+nC9+CPMV4JA3grDQ6Xc5qBaXkOYbaPkzmAlcg=;
        b=KPWfETx05Utsw8F4j10cL0vvKdXCr8fELbdPnCzqVKDn+kPhBE68K1CZn/CadqOhAG
         aPjegz1i1enjpiR6eigK4QHdlGHXKGeNFlIHvV+uGj1kMeULE/kGJRfGRBsMzAGhjpLr
         UL4F33Rh5lPNxY3ybLtd7cybwzTK8rIdnG2JRyiLKe7Biju81Njpv77ILddaKb7+CHao
         sgKpDsyzH4GmJS7Qqpj3ei9Ff7OTQMOXloHalFzaQHw2V2P1lbSeho6pmDiEt1L6N7oP
         WMXXRyebE7vOZsyE51/q5VCSj42SAsMYR2uCuJMk99CPTfxm1P/9HFhJXVVagZ83mWER
         Db/g==
X-Gm-Message-State: AOAM532KbjyRex8MiGWfAtcwwf9LsLo8ABO1kuz6VoTKuZYnSMP7ZW3y
        wyNjbA4b01I4UlwjyuOUZwMAIUXCTK6VxdXTKNzfiA==
X-Google-Smtp-Source: ABdhPJy5giYk3zchfxtQjLAyvp7G+emQEY5YPUBbkl2jA55BNYnMtVotkiP14rfgzioNsAOrXutaR1HTIJjckO8Gk78=
X-Received: by 2002:a37:5702:: with SMTP id l2mr20738364qkb.486.1613494469361;
 Tue, 16 Feb 2021 08:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20210215161537.14696-1-jonathan@marek.ca> <20210215161537.14696-2-jonathan@marek.ca>
In-Reply-To: <20210215161537.14696-2-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 16 Feb 2021 19:54:16 +0300
Message-ID: <CAA8EJpo_Fs8Wj6zjH6BQqm=mG=qcGt3_JMj4nK-vsKCzr8tn1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: add compatibles for sm8150/sm8250 display
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        tongtiangen <tongtiangen@huawei.com>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Feb 2021 at 19:25, Jonathan Marek <jonathan@marek.ca> wrote:
>
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
>
> Also inverse the non-mdp4 condition in add_display_components() to avoid
> having to check every new compatible in the condition.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
>  drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26f60da..5763f43200a0 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
>
>  MDSS:
>  Required properties:
> -- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
> +- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
>  - reg: physical base address and length of contoller's registers.
>  - reg-names: register region names. The following region is required:
>    * "mdss"
> @@ -41,7 +41,7 @@ Optional properties:
>
>  MDP:
>  Required properties:
> -- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
> +- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
>  - reg: physical base address and length of controller's registers.
>  - reg-names : register region names. The following region is required:
>    * "mdp"

These two chunks should probably go to the separate patch 'dt-bindings:...'.

Also, could you please pinpoint the reason for adding more
compatibility strings, while they map to the same internal data?
I think we might want instead to use some generic name for the dpu
block, like "qcom,dpu" or "qcom,mdp-dpu" instead of specifying the
platform name.


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5a8e3e1fc48c..fff12a4c8bfc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
>  static const struct of_device_id dpu_dt_match[] = {
>         { .compatible = "qcom,sdm845-dpu", },
>         { .compatible = "qcom,sc7180-dpu", },
> +       { .compatible = "qcom,sm8150-dpu", },
> +       { .compatible = "qcom,sm8250-dpu", },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, dpu_dt_match);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 94525ac76d4e..928f13d4bfbc 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
>          * Populate the children devices, find the MDP5/DPU node, and then add
>          * the interfaces to our components list.
>          */
> -       if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
> -           of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
> -           of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
> +       if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {
>                 ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>                 if (ret) {
>                         DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> @@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
>         { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
>         { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>         { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> +       { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> +       { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> --
> 2.26.1
>


-- 
With best wishes
Dmitry

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B8C4FA092
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 02:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240137AbiDIAVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 20:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238299AbiDIAVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 20:21:04 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080772AC7E
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 17:18:59 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id a5so8745826qvx.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 17:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9LrNVvLpOj6dTmwk7aa8KUTu0jhCOqauaVgReZqBa7c=;
        b=xE0tX7NtCkWLvBMwhqajK3qfCfoNEpWFKuP2acf2SlDT23Qqs0ecoD80HseySZgDsF
         WKCXbRoEzgKZXIs+RWz7X5ab107GjaBlxA1ptNfo68jBnFEbdSt0OAxsqV5vWKZbdbVy
         ExcYExo1BlK8zkkHupU0MlYVAQVBsW9LxraTaHQ94tdbP057gScytmZB/f2fDvXBI5y9
         rKI7/OlSwwcmCMSe9L+IklhhYjR+N1b5HHDd7KkRmQnU3nlf4MnwgQmrx7tZBCgd58o6
         HTb1hxQkkAcON4uoLJ9N4IgxzSnvvz/MB+tygzfFwbaDbjpvnxnOwiIChZd6mtxyL+WS
         KGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9LrNVvLpOj6dTmwk7aa8KUTu0jhCOqauaVgReZqBa7c=;
        b=fLPkpv0vVXfznY6DEeoRHkBUQhY4j4LCXOcytS5S0ODpNMF9gvctUmj9a5BVgj37Hy
         C3a/PHlV5sn4gbxlimyW/MauGyrfkmqrfHKhU5krJgQEZV4rLUbMKzgb9oqO7stZvUrP
         CnFYzOv/MXas6Sh7Q0Wgym+ia3i7wqKH0whEt74lWuw+0J6ye07JY+mSCeWzAboq2Zyz
         GBaFS+NW79w3w8uhwCRFs3ANn+uJOe6QmHf2MZ87S7+PC1kxIqiDdV3dLQ5i1A+VTAo+
         NEQNELzZ2vnX4ClRgr7wyLe40vl7j/V3yXOTQZl+1hyAL3hYfwv19ggqoWYwZ5l4X4J/
         3Lzg==
X-Gm-Message-State: AOAM532g14DigxwM/fuI8mbXFjrw1chbrk/tNtGg3F4pxTL9l88o9wY/
        iHftbcaSJL7R/ZtfSnxCYAKrz9X1Xz2hMc8FK2yrWQ==
X-Google-Smtp-Source: ABdhPJzyS2BKDeVIYsYws7rF8u0vK8mefrCUH0O7J9tqRAkVK9AS1lptIkXtSiP4qBJZJpVRd03iCrSudeAaaxy+1Ns=
X-Received: by 2002:ad4:4eaf:0:b0:441:7ff6:f639 with SMTP id
 ed15-20020ad44eaf000000b004417ff6f639mr18482856qvb.73.1649463538218; Fri, 08
 Apr 2022 17:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220408210813.581391-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220408210813.581391-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 9 Apr 2022 03:18:47 +0300
Message-ID: <CAA8EJprtAubOe==dND9ru2ws71cGXt=B4vB5Hm8ZcZuQ5h9qLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: msm: Add optional resets
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 9 Apr 2022 at 00:05, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> Add an optional reference to the MDSS_CORE reset, which when specified
> can be used by the implementation to reset the hardware blocks.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>
> Resending these two patches again as I put "v2" in the subject, even though I
> meant v3. Sorry about that.
>
> Changes since v2:
> - None
>
>  .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++++
>  Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 4 ++++
>  Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 4 ++++
>  Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
>  4 files changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> index 6fb7e321f011..734d14de966d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> @@ -66,6 +66,10 @@ properties:
>    interconnect-names:
>      const: mdp0-mem
>
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> index 12a86b1ec1bc..b41991eaa454 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -65,6 +65,10 @@ properties:
>    interconnect-names:
>      const: mdp0-mem
>
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
> index fbeb931a026e..6e417d06fc79 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
> @@ -64,6 +64,10 @@ properties:
>    interconnect-names:
>      const: mdp0-mem
>
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> index 0dca4b3d66e4..1a42491efdbc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -57,6 +57,10 @@ properties:
>
>    ranges: true
>
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> --
> 2.35.1
>


-- 
With best wishes
Dmitry

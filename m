Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED19A44EF0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 23:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbhKLWJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 17:09:33 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:41661 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbhKLWJd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 17:09:33 -0500
Received: by mail-ot1-f48.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so15906670ote.8;
        Fri, 12 Nov 2021 14:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fAH2FOMt6ByFuulhcFjd5qWVzjhUNrdP0WgFpwV39B0=;
        b=s0H0NNstSN1BueFR1L69Du2SYPFwknwPYLkVbTgsAlt5dKhxrmWa87PtuRi7sW9ixw
         rYtW18uFMx4va2EE40wGNEdabp+8XWHYSntkJ3ULom9EXwfsS4eIFWAoZvIBHXM2zfpV
         VbQ6qfg29wmqFWa7iEpz1U1KujRwkuednbP2MYdLMhftMGelOJTDTnJXVcw06pK7dWFv
         zIrZZUkI2nurdMLKAKV1Kn3XQwBMjvwTVH/UxFeQ2WvKnBk0Ct0WTocVMNRHnCh4B+Wx
         /NR7pkh6vJnw6sWBOhRAeH396nnhKCR08JjOf/x4C7Zrxc57w3jrvSOEyQ2AgftFxmA0
         Ruaw==
X-Gm-Message-State: AOAM532XBGJpkxcOIjH+xvS9VTPJS+m2JV5B2fRwhtCIJYNHfQwGEEHi
        byNkxEUq9iyEOUQ++9DikQ==
X-Google-Smtp-Source: ABdhPJzYCaZPSoDKSlmsF80rRO7ILm+llkMdr8lAkIa0PoG+u4OX6b9xy2pxwRPJ/XupxrXEJePnkw==
X-Received: by 2002:a9d:6e09:: with SMTP id e9mr10631391otr.230.1636754801498;
        Fri, 12 Nov 2021 14:06:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j5sm1465590ots.68.2021.11.12.14.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:06:40 -0800 (PST)
Received: (nullmailer pid 3458175 invoked by uid 1000);
        Fri, 12 Nov 2021 22:06:39 -0000
Date:   Fri, 12 Nov 2021 16:06:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, jani.nikula@intel.com,
        abhinavk@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 12/14] dt-bindings: msm/dp: Add bindings for HDCP
 registers
Message-ID: <YY7lb9k2UArZf7I/@robh.at.kernel.org>
References: <20211105030434.2828845-1-sean@poorly.run>
 <20211105030434.2828845-13-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105030434.2828845-13-sean@poorly.run>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 04, 2021 at 11:04:29PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
> 
> We'll use a new compatible string for this since the fields are optional.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-13-sean@poorly.run #v3
> 
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> Changes in v3:
> -Add new compatible string for dp-hdcp
> -Add descriptions to reg
> -Add minItems/maxItems to reg
> -Make reg depend on the new hdcp compatible string
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml    | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index b36d74c1da7c..f6e4b102373a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -21,12 +21,16 @@ properties:
>        - qcom,sc8180x-edp
>  
>    reg:
> +    minItems: 5
> +    maxItems: 7

This should be a warning. Not sure why the bot didn't run. You just need 
'minItems: 5'

>      items:
>        - description: ahb register block
>        - description: aux register block
>        - description: link register block
>        - description: p0 register block
>        - description: p1 register block
> +      - description: (Optional) Registers for HDCP device key injection
> +      - description: (Optional) Registers for HDCP TrustZone interaction
>  
>    interrupts:
>      maxItems: 1
> @@ -111,7 +115,9 @@ examples:
>                <0xae90200 0x200>,
>                <0xae90400 0xc00>,
>                <0xae91000 0x400>,
> -              <0xae91400 0x400>;
> +              <0xae91400 0x400>,
> +              <0x0aed1000 0x174>,
> +              <0x0aee1000 0x2c>;

Be consistent and drop the leading 0.

>          interrupt-parent = <&mdss>;
>          interrupts = <12>;
>          clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> 

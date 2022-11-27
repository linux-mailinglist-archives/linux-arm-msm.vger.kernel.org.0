Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75FCC639D44
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Nov 2022 22:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiK0V0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Nov 2022 16:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiK0V0M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Nov 2022 16:26:12 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DC7DF56
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 13:26:11 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id e141so11146095ybh.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 13:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HgkwP5Gr80kx+eoGWhH3ysjp0qUkMA9X8iHdrpzsq2s=;
        b=OKJQqp4VyiAfqlu0X5PXSQ7tpF2LJEPqnDmcSV4+/9rQHlkzRgaRCFw04przmQqUQM
         7+lA5rG1+pKUHVZLEexCqV2RTWphTRQPnDu+03bYgismKtCixMntR1a3HhgT8Mg0QyHC
         z275aSefj99qRFPPmsDk/ExOf/+dkzGNgTsyxVkvR3R6NbDCfUIFbCZ+7+K6SrDEXeq2
         Juj69zzXZR0ha78JwDjocolxL0zYruk0oQm71Qz+CQiBYOxA77y+fP/4DtztvBtcR8v9
         hvAq0Xk7us+CM+h7aw9JteVSfizcXqvU5dH6eBjfxMVLTIuBYj2Td44kCppeIYOjBXil
         bnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgkwP5Gr80kx+eoGWhH3ysjp0qUkMA9X8iHdrpzsq2s=;
        b=a7H5nF8u/1GDtBT72rhueO7pCqUrKiHa1PJ2cHYNS6iA2Bb2p3IJ1YolwfhzPsLk9g
         aWNZ46GndQ/yj/Cy/Mv9ceDyioU8XwuvIW6cYaK9EV7av/lr2m3PmU12j+fGenAE9dUg
         CPNcFg1NNHYjovLlyMcewsMWIU53f+AWR1EW9LvU7FFoq2VEwIjZbfGULaOoJ5YrjJDZ
         i+WBGpgzPXDQbuQa4FV9OfP2E4oD3tLdLMTxte9jLsjqS4YUKdno7oY2Y48UKnUEJq87
         kpeyuUVWLxIFjJC2gD79ihpEqu9yKuWFW38n3EptLVQr/ATTyllQY9kwtyFHg7VAg2fA
         Y9Yg==
X-Gm-Message-State: ANoB5pkUxvrPLBqKxbgcir8CPlFX/dCz5krdToLfIHx80BRb5zQosMBf
        rL55OomUqHB+XYXQFdLRxJ8fKi6i6rlKS1ANU1y79L06NLc=
X-Google-Smtp-Source: AA0mqf64g3pQHzizACdiWdG2+InatoZLEaDSdZ1QJS+X5/UwYFgxeO/dIIfDAWFCQz4vo1LXrEjab31B7HV8jsb7a68=
X-Received: by 2002:a25:4282:0:b0:6f2:7d57:e51b with SMTP id
 p124-20020a254282000000b006f27d57e51bmr14291337yba.15.1669584370695; Sun, 27
 Nov 2022 13:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20221127181835.806410-1-luca@z3ntu.xyz>
In-Reply-To: <20221127181835.806410-1-luca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 27 Nov 2022 23:25:59 +0200
Message-ID: <CAA8EJpoe09FZcfVXuknmFWO5qg-iYDOBVN3=qr=DeJjvHw56Mw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document oneplus,bacon device
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 27 Nov 2022 at 20:19, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Document the OnePlus One ("bacon") which is a smartphone based on the
> Snapdragon 801 SoC.
>
> Also allow msm8974 devices to use qcom,msm-id and qcom,board-id.

The patch itself is good. However it raised a broader question for me.
Up to now all msm8974pro devices use qcom,msm8974 as a top-level
compatibility string. Should it be changed to use pro-specific one
(e.g. qcom,msm8974pro)?

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 463509f0f23a..3d2cc8ae34d8 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -167,6 +167,7 @@ properties:
>            - enum:
>                - fairphone,fp2
>                - lge,hammerhead
> +              - oneplus,bacon
>                - samsung,klte
>                - sony,xperia-amami
>                - sony,xperia-castor
> @@ -896,6 +897,7 @@ allOf:
>                - qcom,apq8026
>                - qcom,apq8094
>                - qcom,apq8096
> +              - qcom,msm8974
>                - qcom,msm8992
>                - qcom,msm8994
>                - qcom,msm8996
> --
> 2.38.1
>


-- 
With best wishes
Dmitry

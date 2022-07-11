Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0510E570637
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 16:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbiGKOwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 10:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiGKOwU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 10:52:20 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09036F7E0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:52:19 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id w12so5837996edd.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SGTevPUwkzc81+3xxS7RaXwvxQl65M4pwfdwK/mf7M8=;
        b=Z4XNDNccxkqkkO69BxWuxx6IsFvM9Iy0/pO+RqiO8BrUoiKcx1R1xBCQ13TE/3t9Bw
         onK38E1qGpBYWskQ0GBgkh6x2n4S3k9KaSM3oMUWRo9sVHRiL40eS9WhzYfitS6df7IE
         vjbiZz9yu5MdyHrK0cs75bFs7cpF22uzW2PaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SGTevPUwkzc81+3xxS7RaXwvxQl65M4pwfdwK/mf7M8=;
        b=B35cHMWaLwqyKnVnDVplS7dni9al41O8kOM4pDqiY11OlEVi+XRjwY1IjssOVn9kNR
         yZi9dXYSDv2y4Jy3/gfWFyB3Svl0LQP68e5UXNNxV0b1mv+a+j1MNcDcQqEesMhQ8V1d
         XuR7u2g3OkQP0qrMHOAhuylv36SKFRDa0dEMhcyDpeDH7sc2fssvqvvuAfAHZssyvqmz
         OB6B+faGBAqC59/LzIlOSELaBKS04ro3IZlRsgmFHykIMn7uO9umGpwddtIPZhOrsnFd
         hOT1qhlm/2P3INVZT2ce2xTI9FM1G0Cmk5YhhjZFhWzeGxb/6gzgDFUQB0jv0lDu3+bc
         1D3Q==
X-Gm-Message-State: AJIora8CKrAVGAv1Ks5H2wIsseGzc81k7uawQI+SRhFcZ5YxTjEOUEh0
        wgEd6g1BNm9HDSAnLRpAU6DeeSH8elNTAQTS
X-Google-Smtp-Source: AGRyM1s1Sp5X2Hcra4FNONWay2XtgkBeLCpYLv51WfMyMNQ8MtDEFgyIVG/cxB/HiwaQvyvj7MZQVg==
X-Received: by 2002:a05:6402:1006:b0:43a:d397:68c3 with SMTP id c6-20020a056402100600b0043ad39768c3mr8070287edu.170.1657551137980;
        Mon, 11 Jul 2022 07:52:17 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id d26-20020a170906345a00b00726e51b6d7dsm2726781ejb.195.2022.07.11.07.52.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 07:52:17 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id v14so7351459wra.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:52:16 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr17639861wrr.617.1657551136373; Mon, 11
 Jul 2022 07:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220711082940.39539-1-krzysztof.kozlowski@linaro.org> <20220711082940.39539-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711082940.39539-3-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 07:52:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUCPzzZHAPqoz-vhmcVxzYDxkKQs=+1tLZvsQjWe4q3Q@mail.gmail.com>
Message-ID: <CAD=FV=WUCPzzZHAPqoz-vhmcVxzYDxkKQs=+1tLZvsQjWe4q3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: mmc: sdhci-msm: constrain reg-names
 perp variants
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On Mon, Jul 11, 2022 at 1:29 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The entries in arrays must have fixed order, so the bindings and Linux
> driver expecting various combinations of 'reg' addresses was never
> actually conforming to guidelines.
>
> The 'core' reg entry is valid only for SDCC v4 and lower, so disallow it
> in SDCC v5.  SDCC v4 supports CQE and ICE, so allow them, even though
> the qcom,sdhci-msm-v4 compatible is used also for earlier SoCs with SDCC
> v2 or v3, so it is not entirely accurate.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Changes since v1:
> 1. Rework the patch based on Doug's feedback.
> ---
>  .../devicetree/bindings/mmc/sdhci-msm.yaml    | 61 ++++++++++++-------
>  1 file changed, 38 insertions(+), 23 deletions(-)

In the ${SUBJECT} I'm not sure what a "perp variant" is. Is that a
typo or just a phrase I'm not aware of?


> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index fc6e5221985a..2f0fdd65e908 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -49,33 +49,11 @@ properties:
>
>    reg:
>      minItems: 1
> -    items:
> -      - description: Host controller register map
> -      - description: SD Core register map
> -      - description: CQE register map
> -      - description: Inline Crypto Engine register map
> +    maxItems: 4
>
>    reg-names:
>      minItems: 1
>      maxItems: 4
> -    oneOf:
> -      - items:
> -          - const: hc
> -      - items:
> -          - const: hc
> -          - const: core
> -      - items:
> -          - const: hc
> -          - const: cqhci
> -      - items:
> -          - const: hc
> -          - const: cqhci
> -          - const: ice
> -      - items:
> -          - const: hc
> -          - const: core
> -          - const: cqhci
> -          - const: ice
>
>    clocks:
>      minItems: 3
> @@ -177,6 +155,43 @@ required:
>  allOf:
>    - $ref: mmc-controller.yaml#
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdhci-msm-v4
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          items:
> +            - description: Host controller register map
> +            - description: SD Core register map
> +            - description: CQE register map
> +            - description: Inline Crypto Engine register map
> +        reg-names:
> +          minItems: 2
> +          items:
> +            - const: hc
> +            - const: core
> +            - const: cqhci
> +            - const: ice
> +    else:
> +      properties:
> +        reg:
> +          minItems: 1
> +          items:
> +            - description: Host controller register map
> +            - description: CQE register map
> +            - description: Inline Crypto Engine register map
> +        reg-names:
> +          minItems: 1
> +          items:
> +            - const: hc
> +            - const: cqhci
> +            - const: ice

Do you need to set "maxItems" here? If you don't then will it inherit
the maxItems of 4 from above?

-Doug

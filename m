Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604D65706B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 17:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbiGKPLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 11:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbiGKPLr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 11:11:47 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC3074E06
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 08:11:46 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id u6so5011381iop.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 08:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xninKA70EtexcdYCbdfuTinCaP7pxcUur1I8bK0NPTw=;
        b=OKNN2Re5+g4wHUiVyzepFDVWZOXbvcZGQio3rTb0i4xibe7JSuEzbHrs4S05ZN6i78
         sgkq6ZFhZVQQkc5t3f0VvdAB31FviPnkCYj3b5bH0gdYLrYCm00hqvh4HCRUj2dy9Ap5
         Q02/02O/jxHXt17YhY2tvweobdiXpz005KJ8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xninKA70EtexcdYCbdfuTinCaP7pxcUur1I8bK0NPTw=;
        b=6w4MdfxiVmQxQZ1EdOOJ3DkoQ/3BtonMEVYdNk53c43CXgHQV2JYAwzxu7YD6yoOtM
         w4XdtsukB5ePojcaWsMmJWInsSJm6ltpys6ZZ7/oYnpGkrgoOnOjb2vuPBRWbkQ97yJr
         wnwBgnNFWehV2M6f87Yfu/1quSomAX6yFd9cax5NqinPkjmF1Fqh6O0Z3jHgeni2yaTg
         +foc+rFO9ydi+i67MpN609WEI+zrs2K3u/DW+RaUaxicuEjKJel6m3KCAsH7IBtrr4d2
         +BL1FJ32ZJLFI4Ul74QJIpFlu0JUtml20IbkQfz6yn3BWiTUY31nQNGOunzrVV4Nhcce
         Ns8A==
X-Gm-Message-State: AJIora9+BBHkPAUKwpvGYWA8wbUsowyQmVhccyY+R9w7MUPVPheEbLGC
        yVCA/O6Rco2fsiXcCwEVf0aed36J7htONc31PJs=
X-Google-Smtp-Source: AGRyM1vWbY0XIxjD/eBOGjhOrZxbBRyBFWup6YzswHnPcTHsVxONJLPOWXD+Rl0JXOgirHAs0EWGlg==
X-Received: by 2002:a6b:ba56:0:b0:678:e98d:b769 with SMTP id k83-20020a6bba56000000b00678e98db769mr9567498iof.183.1657552305503;
        Mon, 11 Jul 2022 08:11:45 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id 126-20020a021184000000b0033f3782eccfsm3054079jaf.89.2022.07.11.08.11.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 08:11:44 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id 190so5187698iou.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 08:11:43 -0700 (PDT)
X-Received: by 2002:a05:6602:2d48:b0:67b:73f5:7e74 with SMTP id
 d8-20020a0566022d4800b0067b73f57e74mr8746907iow.154.1657552303271; Mon, 11
 Jul 2022 08:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220711082940.39539-1-krzysztof.kozlowski@linaro.org>
 <20220711082940.39539-3-krzysztof.kozlowski@linaro.org> <CAD=FV=WUCPzzZHAPqoz-vhmcVxzYDxkKQs=+1tLZvsQjWe4q3Q@mail.gmail.com>
 <f8744ff8-15a0-bf31-c49f-b1bb35ba5cdd@linaro.org>
In-Reply-To: <f8744ff8-15a0-bf31-c49f-b1bb35ba5cdd@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 08:11:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2ZfwwDO_hSSN35ObfvBbBbPjMoSB4GvS7m0yJieNg3Q@mail.gmail.com>
Message-ID: <CAD=FV=X2ZfwwDO_hSSN35ObfvBbBbPjMoSB4GvS7m0yJieNg3Q@mail.gmail.com>
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

Hi,

On Mon, Jul 11, 2022 at 7:53 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/07/2022 16:52, Doug Anderson wrote:
> > Hi
> >
> > On Mon, Jul 11, 2022 at 1:29 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> The entries in arrays must have fixed order, so the bindings and Linux
> >> driver expecting various combinations of 'reg' addresses was never
> >> actually conforming to guidelines.
> >>
> >> The 'core' reg entry is valid only for SDCC v4 and lower, so disallow it
> >> in SDCC v5.  SDCC v4 supports CQE and ICE, so allow them, even though
> >> the qcom,sdhci-msm-v4 compatible is used also for earlier SoCs with SDCC
> >> v2 or v3, so it is not entirely accurate.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes since v1:
> >> 1. Rework the patch based on Doug's feedback.
> >> ---
> >>  .../devicetree/bindings/mmc/sdhci-msm.yaml    | 61 ++++++++++++-------
> >>  1 file changed, 38 insertions(+), 23 deletions(-)
> >
> > In the ${SUBJECT} I'm not sure what a "perp variant" is. Is that a
> > typo or just a phrase I'm not aware of?
>
> Should be:
> "per variants"
>
> >
> >
> >> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> >> index fc6e5221985a..2f0fdd65e908 100644
> >> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> >> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> >> @@ -49,33 +49,11 @@ properties:
> >>
> >>    reg:
> >>      minItems: 1
> >> -    items:
> >> -      - description: Host controller register map
> >> -      - description: SD Core register map
> >> -      - description: CQE register map
> >> -      - description: Inline Crypto Engine register map
> >> +    maxItems: 4
> >>
> >>    reg-names:
> >>      minItems: 1
> >>      maxItems: 4
> >> -    oneOf:
> >> -      - items:
> >> -          - const: hc
> >> -      - items:
> >> -          - const: hc
> >> -          - const: core
> >> -      - items:
> >> -          - const: hc
> >> -          - const: cqhci
> >> -      - items:
> >> -          - const: hc
> >> -          - const: cqhci
> >> -          - const: ice
> >> -      - items:
> >> -          - const: hc
> >> -          - const: core
> >> -          - const: cqhci
> >> -          - const: ice
> >>
> >>    clocks:
> >>      minItems: 3
> >> @@ -177,6 +155,43 @@ required:
> >>  allOf:
> >>    - $ref: mmc-controller.yaml#
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - qcom,sdhci-msm-v4
> >> +    then:
> >> +      properties:
> >> +        reg:
> >> +          minItems: 2
> >> +          items:
> >> +            - description: Host controller register map
> >> +            - description: SD Core register map
> >> +            - description: CQE register map
> >> +            - description: Inline Crypto Engine register map
> >> +        reg-names:
> >> +          minItems: 2
> >> +          items:
> >> +            - const: hc
> >> +            - const: core
> >> +            - const: cqhci
> >> +            - const: ice
> >> +    else:
> >> +      properties:
> >> +        reg:
> >> +          minItems: 1
> >> +          items:
> >> +            - description: Host controller register map
> >> +            - description: CQE register map
> >> +            - description: Inline Crypto Engine register map
> >> +        reg-names:
> >> +          minItems: 1
> >> +          items:
> >> +            - const: hc
> >> +            - const: cqhci
> >> +            - const: ice
> >
> > Do you need to set "maxItems" here? If you don't then will it inherit
> > the maxItems of 4 from above?
>
> No, items determine the size instead.

Can you just remove the "maxItems" from above then? Does it buy us anything?

In any case, with the ${SUBJECT} fixed:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

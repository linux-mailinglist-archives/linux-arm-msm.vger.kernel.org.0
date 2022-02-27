Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7554C5E84
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Feb 2022 21:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbiB0UNH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Feb 2022 15:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbiB0UNG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Feb 2022 15:13:06 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2538B63B3;
        Sun, 27 Feb 2022 12:12:27 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id f14so12686076ioz.1;
        Sun, 27 Feb 2022 12:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mZFvwtuK5rzdjJTgzXoknsNe52lngj5l45fnHN2s9EA=;
        b=b1k9QCr9ysDO2pOOKoUC1vycuz6UP6D/aAtYGlaR1JWs4fGJD+h7eisuKLeF1C4Zy+
         Dyd80Axg6RtCTOsL/X1iyG8c5ZjeIKP5yoLFHSwL6ljXYJml84S27YRdXWk5kSUkue57
         0Udfr9Ky4rTAWhVhjHWk/vGlFsmn91YyJ31G2kRcH2HbIJ36Xe/z1YKamQRx5XPlU6HD
         8OAOw0BeuNp1SnpOiUtXgXY/rbS/7no8FF6OUynJTpYau+NjHiqG54uTcASF9LoKHAkB
         daejP/CweZxcReQ7LyMGditb1c4SQICyrz6l6BPxTNwMuC/fZMhGKP7lkJbmMhwJoAt9
         gsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mZFvwtuK5rzdjJTgzXoknsNe52lngj5l45fnHN2s9EA=;
        b=GHKq8t6NbG7H6+fnzriEyNkS6HtcK8GmjsaKVf50iHU0i7eGbrFOuZ6+ay8010cLaj
         iJ/QhOVtU5OCN8QDPgjltqbihLm+AdVJ0Tu4UUlPmeN5duA1T3a9k1kF0kMvxKwkdYXr
         7E4mwXNqui+OENjhDil/47ZOR2dIJABZ+EpUA3QAmkXIhkq9CTzmgL11YLO4Ze2x+JJV
         8eQPH3/pDwaZPn+dZQ3pH9jDLD6CnOKL242ZeliLisAUlIjJqR2oCzhrPmHYfIY4IyQh
         AAN7XgplKQzxIF4upzH1n0qGiqEvah8xBrHNYPuLfGfgLlcXzjULjwNTJW0M+xjbbgNu
         5tOA==
X-Gm-Message-State: AOAM532Y67mFEnNOuY5dq7K6AUjSzXnNNHHof5C4BOQjP74ojT0+wAs5
        7722pxhVC3C984ir5frJFORqjZ8QYoQsurFV6wE=
X-Google-Smtp-Source: ABdhPJwpCSppZ6Yw2mHaH3DTl3Mfki6KikEfebjmAX8Dpb4Kf4pHt+ok/u4vIzh7QqaluxZxP1POC9Kij1ee8aeHKEI=
X-Received: by 2002:a5d:970d:0:b0:5f2:9242:d881 with SMTP id
 h13-20020a5d970d000000b005f29242d881mr12912255iol.187.1645992745645; Sun, 27
 Feb 2022 12:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20220220212034.9152-1-michael.srba@seznam.cz> <20220220212034.9152-3-michael.srba@seznam.cz>
In-Reply-To: <20220220212034.9152-3-michael.srba@seznam.cz>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Sun, 27 Feb 2022 13:12:14 -0700
Message-ID: <CAOCk7Noo_opbG3tLwMkXc1U1MHKQgf+JfEwRnpQqeLamcS5tuA@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Feb 20, 2022 at 6:32 PM <michael.srba@seznam.cz> wrote:
>
> From: Michael Srba <Michael.Srba@seznam.cz>
>
> Adds bindings for the AHB bus which exposes the SCC block in the global
> address space. This bus (and the SSC block itself) is present on certain
> qcom SoCs.

"SSC" or "SCC"?  You have both and I suspect one is a typo.

>
> In typical configuration, this bus (as some of the clocks and registers
> that we need to manipulate) is not accessible to the OS, and the
> resources on this bus are indirectly accessed by communicating with a
> hexagon CPU core residing in the SSC block. In this configuration, the
> hypervisor is the one performing the bus initialization for the purposes
> of bringing the haxagon CPU core out of reset.
>
> However, it is possible to change the configuration, in which case this
> binding serves to allow the OS to initialize the bus.
>
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  CHANGES:
>  - v2: fix issues caught by by dt-schema
>  - v3: none
>  - v4: address the issues pointed out in the review
>  - v5: clarify type of additional properties; remove ssc_tlmm node for now
>  - v6: none
>  - v7: fix indentation, use imperative in commit message
>  - v8: none
> ---
>  .../bindings/bus/qcom,ssc-block-bus.yaml      | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
>
> diff --git a/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml b/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> new file mode 100644
> index 000000000000..4044af0afda8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/qcom,ssc-block-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: The AHB Bus Providing a Global View of the SSC Block on (some) qcom SoCs
> +
> +maintainers:
> +  - Michael Srba <Michael.Srba@seznam.cz>
> +
> +description: |
> +  This binding describes the dependencies (clocks, resets, power domains) which
> +  need to be turned on in a sequence before communication over the AHB bus
> +  becomes possible.
> +
> +  Additionally, the reg property is used to pass to the driver the location of
> +  two sadly undocumented registers which need to be poked as part of the sequence.

Surely "SSC" is an acronym.  Can you define it in the description?  I
suspect folks not familiar with 8998 will not know what it is.

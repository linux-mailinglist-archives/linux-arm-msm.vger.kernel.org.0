Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A6D4BAB2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 21:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241957AbiBQUiH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 15:38:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiBQUiG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 15:38:06 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFB11029C1;
        Thu, 17 Feb 2022 12:37:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 06B63CE304A;
        Thu, 17 Feb 2022 20:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BA2C340E8;
        Thu, 17 Feb 2022 20:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645130268;
        bh=WvB3pMHan4KZf2v4LBcyF6JQ0l8MH2FO7QMD1R1TgtI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SexuwOYclW9ti047ezvq3yGNvit7l9+yvOfcovYYwChvz8b9rZFDj63I9nF3WdJaM
         Fe5/fVBBjl/u9ZduuTekWwSL/Km7zFMJAobtrGiMDI3GIa4gylXadOEuu3lQcAIzHP
         B0NIl4aaorDNPecTeOUps5RLUmX1X60hlkwfMgTGO6fgo06WAs3SzqiEYC3SJIVVDG
         LwjueDX6OGU0n0IEyiQ2CZ3NwXXWcGNJLR6k7nysG/VV5CQUUXfRlNbu+yyIEw/RHh
         WM6isFDLokTJaxK7vhqpZYv2E8bcVs2ZKCMPNZEEpTyp9nQk2lTyeyOs8QGPXw6YYd
         PLwHe7RqTmmHg==
Received: by mail-ej1-f48.google.com with SMTP id p14so9955689ejf.11;
        Thu, 17 Feb 2022 12:37:48 -0800 (PST)
X-Gm-Message-State: AOAM532bTWSvB0PEmyP9lSwuCY2Sj6h1NYSbxRjwxeTuThBbxrFJLupt
        zwD7uZcAspDr0dsYaQjnaiM/cdo1+JICb7qVKA==
X-Google-Smtp-Source: ABdhPJzomFYt3XcmDibzvF0nfFwU1YGP0Q2jOHbmTouoBRnelIjfmH2Y56rgGm5jtuHlCn2fuZaoaGyq7IKF9lDwSpY=
X-Received: by 2002:a17:906:a40f:b0:6c9:e255:7926 with SMTP id
 l15-20020a170906a40f00b006c9e2557926mr3657982ejz.27.1645130266680; Thu, 17
 Feb 2022 12:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20220217113004.22757-1-michael.srba@seznam.cz> <20220217113004.22757-3-michael.srba@seznam.cz>
In-Reply-To: <20220217113004.22757-3-michael.srba@seznam.cz>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 17 Feb 2022 14:37:34 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+22ufg8OoU0-J=KShguY8NA5wZGMYdApV2zbPZpy4AFw@mail.gmail.com>
Message-ID: <CAL_Jsq+22ufg8OoU0-J=KShguY8NA5wZGMYdApV2zbPZpy4AFw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
To:     Michael Srba <michael.srba@seznam.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 17, 2022 at 5:32 AM <michael.srba@seznam.cz> wrote:
>
> From: Michael Srba <Michael.Srba@seznam.cz>
>
> This patch adds bindings for the AHB bus which exposes the SCC block in
> the global address space. This bus (and the SSC block itself) is present
> on certain qcom SoCs.
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
> ---
>  NOTE: this applies against v5.17-rc4 just fine; dt_binding_check seems
>        to have an issue with indentation, but the indentation looks correct
>        to me as well as to local dt_binding_check; also, it seems that the
>        rest of this series doesn't get applied before checking for compile
>        errors on the example, which results in missing defines for
>        GCC_IM_SLEEP, AGGRE2_SNOC_NORTH_AXI, SSC_XO, and SSC_CNOC_AHBS_CLK.
>
>  CHANGES:
>  - v2: fix issues caught by by dt-schema
>  - v3: none
>  - v4: address the issues pointed out in the review
>  - v5: clarify type of additional properties; remove ssc_tlmm node for now
>  - v6: none
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
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,msm8998-ssc-block-bus
> +      - const: qcom,ssc-block-bus
> +
> +  reg:
> +    description: |
> +      Shall contain the addresses of the SSCAON_CONFIG0 and SSCAON_CONFIG1
> +      registers
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: mpm_sscaon_config0
> +      - const: mpm_sscaon_config1
> +
> +  '#address-cells':
> +    enum: [ 1, 2 ]
> +
> +  '#size-cells':
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
> +  clocks:
> +    minItems: 6
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: aggre2
> +      - const: gcc_im_sleep
> +      - const: aggre2_north
> +      - const: ssc_xo
> +      - const: ssc_ahbs
> +
> +  power-domains:
> +    description: Power domain phandles for the ssc_cx and ssc_mx power domains
> +    minItems: 2
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: ssc_cx
> +      - const: ssc_mx
> +
> +  resets:
> +    description: |
> +      Reset phandles for the ssc_reset and ssc_bcr resets (note: ssc_bcr is the
> +      branch control register associated with the ssc_xo and ssc_ahbs clocks)
> +    minItems: 2
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: ssc_reset
> +      - const: ssc_bcr
> +
> +  qcom,halt-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: describes how to locate the ssc AXI halt register
> +    items:
> +      - items:
> +        - description: Phandle reference to a syscon representing TCSR
> +        - description: offset for the ssc AXI halt register

These need indenting 2 more spaces.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

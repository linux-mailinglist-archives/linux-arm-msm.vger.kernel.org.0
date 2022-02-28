Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 686E64C7C88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 22:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiB1V4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 16:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiB1V4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 16:56:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715B733A10;
        Mon, 28 Feb 2022 13:55:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 044046125B;
        Mon, 28 Feb 2022 21:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C98C340EE;
        Mon, 28 Feb 2022 21:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646085320;
        bh=LczBSDm6Uc0Q4dRCm0NyjD8OkSIDDPEpgJolzKcX5WM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ab4/ozRU2o9MEojSPOGq6RYi8i99oEMq9fXG9q6fPoyrvn/pXBR2DHBrjHFTox6Wg
         IZ3+X+ps0eN3pR4s8gMkJo4DoN/k5AnRtYkCK4y9KkQuAvNxQp9cjBfoQyAsg3eDLN
         UAz1SfoZm2u0Wd9V2lZlvOdpUaD2cQdPJTu10pRDZllTb2F3XX1NciqLBV15eDk13x
         rXhfo5P+bJFTDxTbGo94xGdW6Pdg1dQa5INCtEP4wul17JNK0mrfh+KEyEZnzG4fvt
         qF/Eh0upvYNUwf9qsH4iHw7axG1aYPDOBL03vDKGQEApBAjfswVgRWiQ5RTD055gy5
         zSBzrCiiYzqng==
Received: by mail-ed1-f46.google.com with SMTP id w3so19488266edu.8;
        Mon, 28 Feb 2022 13:55:20 -0800 (PST)
X-Gm-Message-State: AOAM5313Lf3YKZ1sUQJ+ukXzZEqfG2KtCf+dKjFdiKimYYX0KbWFk3he
        8LgeapKn8WplhBm2lPWSO+yVLX+SFKtCuVTKSw==
X-Google-Smtp-Source: ABdhPJxVFM5uEo/WfiysGAqUH9IlTD4c6kjFVSqhWiuXsAa85mkhJYkbCEQGpBs6i+Uj8JqsYczIXsRnH5grwapZmNo=
X-Received: by 2002:a05:6402:1cae:b0:410:d3ae:3c8a with SMTP id
 cz14-20020a0564021cae00b00410d3ae3c8amr21349170edb.215.1646085318679; Mon, 28
 Feb 2022 13:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20220228131435.29207-1-michael.srba@seznam.cz>
 <20220228131435.29207-3-michael.srba@seznam.cz> <1646082901.647733.1599408.nullmailer@robh.at.kernel.org>
In-Reply-To: <1646082901.647733.1599408.nullmailer@robh.at.kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 28 Feb 2022 15:55:07 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+j+LmZbCfnKUTveKAsBqqT_VGNcNrpVef=z_0yPBxMwA@mail.gmail.com>
Message-ID: <CAL_Jsq+j+LmZbCfnKUTveKAsBqqT_VGNcNrpVef=z_0yPBxMwA@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
To:     Michael Srba <michael.srba@seznam.cz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 28, 2022 at 3:15 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 28 Feb 2022 14:14:33 +0100, michael.srba@seznam.cz wrote:
> > From: Michael Srba <Michael.Srba@seznam.cz>
> >
> > Adds bindings for the AHB bus which exposes the SSC block in the global
> > address space. This bus (and the SSC block itself) is present on certain
> > qcom SoCs.
> >
> > In typical configuration, this bus (as some of the clocks and registers
> > that we need to manipulate) is not accessible to the OS, and the
> > resources on this bus are indirectly accessed by communicating with a
> > hexagon CPU core residing in the SSC block. In this configuration, the
> > hypervisor is the one performing the bus initialization for the purposes
> > of bringing the haxagon CPU core out of reset.
> >
> > However, it is possible to change the configuration, in which case this
> > binding serves to allow the OS to initialize the bus.
> >
> > Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  CHANGES:
> >  - v2: fix issues caught by by dt-schema
> >  - v3: none
> >  - v4: address the issues pointed out in the review
> >  - v5: clarify type of additional properties; remove ssc_tlmm node for now
> >  - v6: none
> >  - v7: fix indentation, use imperative in commit message
> >  - v8: none
> >  - v9: fix typo in commit description; explain what SSC is in the 'decription' section of the binding
> > ---
> >  .../bindings/bus/qcom,ssc-block-bus.yaml      | 147 ++++++++++++++++++
> >  1 file changed, 147 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dts:39.32-33 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1398: dt_binding_check] Error 2

This can be ignored I guess as the bot doesn't handle missing cover
letter... As I mentioned on v6, you should be sending series with a
cover letter.

Rob

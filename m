Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2FFA4C7BA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 22:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiB1VPo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 16:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiB1VPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 16:15:44 -0500
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A695DFD2;
        Mon, 28 Feb 2022 13:15:04 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id l21-20020a056830239500b005afd2a7eaa2so7713541ots.9;
        Mon, 28 Feb 2022 13:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=y6AzB2ljaq086U1SKhDMlS54EEVDwXoqAsbqXMIOXW4=;
        b=5v3jmBu0ZJGvoJliCVepx6QAZOysofgvt/eXCdblQSltmeIYdJmuDlqC+M9cqMlb5G
         dLlT6qVyV0HZLBXLRG13oJkr2SXjd5aBPVTZgTHf8zSEvyORkc5KZPpceKbl8KmZ8C0X
         2LvFATNInZ69bm02By/7XVFxcFdKouD6Ln4GSVJ0Bl/3BhlLxdVyWHsqt6b07p9LU9yQ
         bwAfeUEQVL8O+U30rOIzS4hH71O3sF2hDb69AZ9YhmUGrI3WzC/B/5RlWqngU0iS3WEH
         mkV5qAW/tjWTnNozF4AvOLQrqG4OhIvXkmjpOOi3ycT/T7fSOrJGBO8ApediAsnaO6KH
         XS9A==
X-Gm-Message-State: AOAM533KwmWfeLMZy6JWqI9TPJkEb/9B7joILKfqE39y2AVoQ5ymyqJx
        90nGQcdYPjSVz8sMKh84qg==
X-Google-Smtp-Source: ABdhPJw7aBN9mUJo0g3AXWmCIIBdVBxbVetccP0NRASyfXWxAf1XCNcG3srYD3XgcUmcOM7JuPoVKw==
X-Received: by 2002:a9d:4712:0:b0:5ad:f2a:6394 with SMTP id a18-20020a9d4712000000b005ad0f2a6394mr10507051otf.281.1646082903555;
        Mon, 28 Feb 2022 13:15:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g7-20020a056870d20700b000d1614be328sm4994086oac.27.2022.02.28.13.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 13:15:02 -0800 (PST)
Received: (nullmailer pid 1599409 invoked by uid 1000);
        Mon, 28 Feb 2022 21:15:01 -0000
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Michael Srba <Michael.Srba@seznam.cz>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-clk@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220228131435.29207-3-michael.srba@seznam.cz>
References: <20220228131435.29207-1-michael.srba@seznam.cz> <20220228131435.29207-3-michael.srba@seznam.cz>
Subject: Re: [PATCH v9 3/5] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
Date:   Mon, 28 Feb 2022 15:15:01 -0600
Message-Id: <1646082901.647733.1599408.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 28 Feb 2022 14:14:33 +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> Adds bindings for the AHB bus which exposes the SSC block in the global
> address space. This bus (and the SSC block itself) is present on certain
> qcom SoCs.
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
>  - v9: fix typo in commit description; explain what SSC is in the 'decription' section of the binding
> ---
>  .../bindings/bus/qcom,ssc-block-bus.yaml      | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dts:39.32-33 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1598879

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


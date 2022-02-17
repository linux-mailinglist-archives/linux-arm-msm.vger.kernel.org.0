Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A76F4BAB1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 21:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343695AbiBQUeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 15:34:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237168AbiBQUeJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 15:34:09 -0500
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89E4DD45F;
        Thu, 17 Feb 2022 12:33:54 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id p11so3166100ils.1;
        Thu, 17 Feb 2022 12:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=fylirAF1zDkLXaLozKbvhF1L9CZdwCNlFVYZ7FuvJh0=;
        b=OsY+othL+VaRZwqKpFQvDXNdqLqM3PEa84lZ5qIsdzZ/T9sALj6IwRK34z2Lrl4VZ6
         sH3KK8q92F13thmruwQqMaHhpWPy5gjM1JWeAAvqDnJ/lnY5VzTkU74ow1BTMCZhR05F
         QRKIH+Pq/O61e00fru+ogxzd0LuKiC5M+Up3rOjcCuEuhCFLVTCS6thrUnAMm9CMWaXb
         1b9JtSrkoAzFg5kXlif7SU4Pojblmz7OTYzwiGRt3QRI9nuEln5HeDA29zoK4dkLe2Ld
         5p95KM1LGc+BOtDS/8xaw8Wh9BoHHobAZGFnvUR5oG7SXDtuJnIi0adj2IQxKO9TI7wm
         Ok+g==
X-Gm-Message-State: AOAM530d2GUfoJtbh0gb0HTRIuY5kO6G2ITzuAF4BMJxtacLauq5ILst
        Xk/19ZhctcW3mUwMH5RAPncTboCPSw==
X-Google-Smtp-Source: ABdhPJyLRYJm1RzOpjeeV39skqjy1+iKO3qSoYiCt9dePqIPlPTTUTbPgz5/W61dbxXpeDc4pGPZyA==
X-Received: by 2002:a92:6402:0:b0:2ba:a9a1:95d0 with SMTP id y2-20020a926402000000b002baa9a195d0mr3225541ilb.303.1645130034188;
        Thu, 17 Feb 2022 12:33:54 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id o13sm2564084iou.3.2022.02.17.12.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 12:33:53 -0800 (PST)
Received: (nullmailer pid 3729188 invoked by uid 1000);
        Thu, 17 Feb 2022 20:33:51 -0000
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     linux-clk@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <20220217113004.22757-3-michael.srba@seznam.cz>
References: <20220217113004.22757-1-michael.srba@seznam.cz> <20220217113004.22757-3-michael.srba@seznam.cz>
Subject: Re: [PATCH v6 3/5] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
Date:   Thu, 17 Feb 2022 14:33:51 -0600
Message-Id: <1645130031.752215.3729187.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 17 Feb 2022 12:30:02 +0100, michael.srba@seznam.cz wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml:86:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dts:39.32-33 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1594179

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


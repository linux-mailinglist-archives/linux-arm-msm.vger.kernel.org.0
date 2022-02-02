Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04B894A729E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 15:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344739AbiBBOC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 09:02:57 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:34337 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbiBBOC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 09:02:57 -0500
Received: by mail-oi1-f182.google.com with SMTP id i5so2074209oih.1;
        Wed, 02 Feb 2022 06:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=zULRLQpcJWbF7S4BmPAAlkw3ALyvA8RPOoLUEYmEAB8=;
        b=wIes07ZO+zS+qPuRL9goBWjvVN8i8MBL57LY03ROg9aKP9y2PZVV+Df03XH90z9341
         FrU5X/kd7md6CaBTdwL5+6y3mXPbwHCQjjyPv3cPZNwo5avUB1XA7d6uFDXDv5l1Gxyl
         deeI1ZHTla/QfQ7i9ykpMuFj7y+f+2Js1VeEhzjRsClkM3lbQnyMtDG29ztIuwut71rQ
         nTaos6+owGlk3C0KOa/k88oa4p5UnTEPHSo7jUyQffY8qWu2YuRgcBPQh1WxVW3uoh6f
         Ihj27kfZeKU+9PvtxvllRsS+chtvyCR8rN5yfzKj0p/mCuLieq8D5DTLH45OzKRwXCMQ
         CFVw==
X-Gm-Message-State: AOAM530PTDZuuC8tVmENDSXlMM8IouMZSbi5EhvLgWk0N4BVKEr6F/Ni
        qx4ZTks7WsK/f2MaR76geqt+NN92rQ==
X-Google-Smtp-Source: ABdhPJwbTVOOGbJ3u4w4TpdhGw7J1oL86U+BXox0mdkJbrwx4e/c1mPVAJH+sgGkpvyZhr2CeHVJZQ==
X-Received: by 2002:aca:e0d7:: with SMTP id x206mr4225281oig.195.1643810576345;
        Wed, 02 Feb 2022 06:02:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l15sm6842536ots.28.2022.02.02.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 06:02:55 -0800 (PST)
Received: (nullmailer pid 2312325 invoked by uid 1000);
        Wed, 02 Feb 2022 14:02:54 -0000
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>
In-Reply-To: <20220202113722.7550-3-michael.srba@seznam.cz>
References: <20220202113722.7550-1-michael.srba@seznam.cz> <20220202113722.7550-3-michael.srba@seznam.cz>
Subject: Re: [PATCH v5 3/5] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
Date:   Wed, 02 Feb 2022 08:02:54 -0600
Message-Id: <1643810574.466782.2312324.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 02 Feb 2022 12:37:20 +0100, michael.srba@seznam.cz wrote:
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
>  CHANGES:
>  - v2: fix issues caught by by dt-schema
>  - v3: none
>  - v4: address the issues pointed out in the review
>  - v5: clarify type of additional properties; remove ssc_tlmm node for now
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

See https://patchwork.ozlabs.org/patch/1587590

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


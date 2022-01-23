Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29793496FA9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jan 2022 04:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbiAWDBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Jan 2022 22:01:38 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:40620 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbiAWDBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Jan 2022 22:01:38 -0500
Received: by mail-ot1-f51.google.com with SMTP id x52-20020a05683040b400b0059ea92202daso1391770ott.7;
        Sat, 22 Jan 2022 19:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=wDMTk0DnxhaaGUxVRBMPKWhwOgiTi1Kkm54GsxFRRcc=;
        b=lPqlNce0mnN8dWeQRSNViMtKSXq9iHTV8XAv75UGpSceNaZ+RBUVci54wEItgMbMz/
         h0VFnorPXibjCt2q7u7wYD+9phKF5ZUS0z0xy9ffs5A2aRQVKRaQsb6OXTPNZNsin3kz
         LK5iDactwqFuNAKQ6pivOEGVofeQbUz4L4kSc5SzY+bNAJrt0YakQU+0VerUB/PkBYfQ
         3Wzu9RAXIGA4rVAuNZtq/+2jvH4qf3ug8NGowoBX52rCQ/5NZeiCmjXZVrymOqocYwiN
         d1QlxJtDWFyci6G8AtZ2BymdaM5O+tTTgf1jmk56FrxApAlpXdjNzbbwvECmdAfAurUR
         JWkQ==
X-Gm-Message-State: AOAM531Z9rUvs0mW2jdJxGXrU3bmLC0wKfgdgipMTLO4mcLp3nlCfZ+E
        Z6qTECor4bwoBzzDRRZq4w==
X-Google-Smtp-Source: ABdhPJxBy4sn6p1H4HDfyPgqVB197xpp7M+OfMk2Foff9IO6biCP1QIkWOCG2AcOnNe2DAQ00iLK9w==
X-Received: by 2002:a9d:5a12:: with SMTP id v18mr7513650oth.265.1642906897240;
        Sat, 22 Jan 2022 19:01:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f4sm350853otf.6.2022.01.22.19.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 19:01:36 -0800 (PST)
Received: (nullmailer pid 232205 invoked by uid 1000);
        Sun, 23 Jan 2022 03:01:35 -0000
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Srba <Michael.Srba@seznam.cz>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20220122180413.1480-3-michael.srba@seznam.cz>
References: <20220122180413.1480-1-michael.srba@seznam.cz> <20220122180413.1480-3-michael.srba@seznam.cz>
Subject: Re: [PATCH 3/4] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
Date:   Sat, 22 Jan 2022 21:01:35 -0600
Message-Id: <1642906895.383434.232203.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 22 Jan 2022 19:04:12 +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
>  This patch adds bindings for the AHB bus which exposes the SCC block in
>  the global address space. This bus (and the SSC block itself) is present
>  on certain qcom SoCs.
> 
>  In typical configuration, this bus (as some of the clocks and registers
>  that we need to manipulate) is not accessible to the OS, and the
>  resources on this bus are indirectly accessed by communicating with a
>  hexagon CPU core residing in the SSC block. In this configuration, the
>  hypervisor is the one performing the bus initialization for the purposes
>  of bringing the haxagon CPU core out of reset.
> 
>  However, it is possible to change the configuration, in which case this
>  binding serves to allow the OS to initialize the bus.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  .../bindings/bus/qcom,ssc-block-bus.yaml      | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml:30:7: [warning] wrong indentation: expected 8 but found 6 (indentation)
./Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml:30:22: [warning] too few spaces after comma (commas)
./Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml:123:111: [warning] line too long (135 > 110 characters) (line-length)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml: properties:reg-names: {'minItems': 2, 'maxItems': 2, 'items': [{'const': 'mpm_sscaon_config0'}, {'const': 'mpm_sscaon_config1'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml: properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'mpm_sscaon_config0'}, {'const': 'mpm_sscaon_config1'}] is too long
	[{'const': 'mpm_sscaon_config0'}, {'const': 'mpm_sscaon_config1'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml: ignoring, error in schema: properties: reg-names
Error: Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dts:21.9-13 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1583024

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


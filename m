Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB60498411
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jan 2022 17:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243377AbiAXQBX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 11:01:23 -0500
Received: from mail-oo1-f52.google.com ([209.85.161.52]:34759 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243349AbiAXQBU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 11:01:20 -0500
Received: by mail-oo1-f52.google.com with SMTP id f4-20020a4ac484000000b002e3e221d769so5968013ooq.1;
        Mon, 24 Jan 2022 08:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Rq7cFFhp86Lgw8pqk5QniiA52vkohLXsw9kEkwg54KE=;
        b=A+6Hni9MtNSgECtvWGY9ECSCO1AGMtG3zml/PctbtBaMhQvI8ntKl4ZKe/lZTqp27P
         1awkfi1JHer9hvhfgF7dL3sFB6K/NWHu+iomTZY2gWjnVkRtPcS2hv9/bvtu7fbOKujJ
         Olajf2361Tn1ePzHV9wzeNyMIpfpdHGuPVUGArxfCpvmMLeaJjBCRTT4uU0uLMxIaT6c
         jZISb0KDRpbp/IPo5hPKUa3kRwKQjQwBASCtdA0pHq7wORIxPbDmORNLaR3izsGYEIl8
         imOpIqJNW2oqGEbkl03o5saSUKy639F4S591U/PC2+3z8bAR7RWjS22z0VCJX7KX2Td6
         jkJg==
X-Gm-Message-State: AOAM5317LqCjeywlpnFgkxVkTbnGMLjkdNrhMrUcl07d07aiaRPfPRDU
        SqsiPlmSMJfZVSHCiZpf8w==
X-Google-Smtp-Source: ABdhPJwo1iUnHQbgMOt2ftOiGJyfq67tnksCGetQAJy8m89P6hEC22qzIlpxZGpk70kzDk5PHPBRaQ==
X-Received: by 2002:a4a:d184:: with SMTP id j4mr10548512oor.20.1643040079979;
        Mon, 24 Jan 2022 08:01:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c20sm5823655ots.50.2022.01.24.08.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:01:19 -0800 (PST)
Received: (nullmailer pid 3901533 invoked by uid 1000);
        Mon, 24 Jan 2022 16:01:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20220124121853.23600-3-michael.srba@seznam.cz>
References: <20220124121853.23600-1-michael.srba@seznam.cz> <20220124121853.23600-3-michael.srba@seznam.cz>
Subject: Re: [PATCH v3 3/5] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
Date:   Mon, 24 Jan 2022 10:01:12 -0600
Message-Id: <1643040072.602285.3901532.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 24 Jan 2022 13:18:51 +0100, michael.srba@seznam.cz wrote:
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
>  CHANGES:
>  - v2: fix issues caught by by dt-schema
>  - v3: none
> ---
>  Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml | 159 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml:30:7: [warning] wrong indentation: expected 8 but found 6 (indentation)
./Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml:30:22: [warning] too few spaces after comma (commas)
./Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml:126:111: [warning] line too long (138 > 110 characters) (line-length)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dt.yaml:0:0: /example-0/soc/bus@10ac008/pinctrl@5e10000: failed to match any schema with compatible: ['qcom,msm8998-ssc-tlmm-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1583436

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


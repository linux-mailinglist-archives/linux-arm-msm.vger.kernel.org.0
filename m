Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10DA649D514
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 23:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbiAZWLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 17:11:10 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:43876 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbiAZWLF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 17:11:05 -0500
Received: by mail-ot1-f41.google.com with SMTP id j38-20020a9d1926000000b0059fa6de6c71so674398ota.10;
        Wed, 26 Jan 2022 14:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=mWzFgIdFBfjTrsmYvpDvQiTB3AYUGt3QjdlF8YKt81o=;
        b=RT1m7CGSZvih/vfj89e0qh1HIZgPE5hKmv8oAUsaCEmNUkZCHPsYmAVoczgt2R4Fqf
         Ag3mmzn4vtwnZlw0LbLALcefIVUKDwq5VJYvmcqOoYo18QcmqTYqZuLyrRz/L8lvBUW/
         QsqxUSiyf1VeOgd0jTsL1Hmk6NtpABNqEVNDcJOEDU6ZjQbsx1s5/f2PuwE6Md+c50lB
         1uUNhTuTTtzmwynv1w9S9rFlDQWL47AUDzIA7VPo8zwmvqRqI6HkfpNvhtS5ahT4vr/H
         vuIi+CHZVj8VXegoDM3a7slX+DmcPtuz9Ih3CXKWDL3+ltl6fWUxZ4QO5IvO2zBwEAL8
         Da+g==
X-Gm-Message-State: AOAM531saVec5O9k0dH1cKoU9owO5Wg6jDTd5Py1TZsL81qQ9EAgDOED
        wixHUCb/bH0E/IYmHZpUyw==
X-Google-Smtp-Source: ABdhPJw5ToBw3P3H9Ryzc7tRQt+hkw/HI9tQEKtEPH0l0u1PGZUDhWxMmp4AzUxfZ97PPLdUJuJGBw==
X-Received: by 2002:a05:6830:1e11:: with SMTP id s17mr492020otr.347.1643235064885;
        Wed, 26 Jan 2022 14:11:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k17sm9189614otk.80.2022.01.26.14.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:11:04 -0800 (PST)
Received: (nullmailer pid 1535100 invoked by uid 1000);
        Wed, 26 Jan 2022 22:10:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Arnd Bergmann <arnd@arndb.de>,
        Saravana Kannan <saravanak@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20220126183250.11924-3-michael.srba@seznam.cz>
References: <20220126183250.11924-1-michael.srba@seznam.cz> <20220126183250.11924-3-michael.srba@seznam.cz>
Subject: Re: [PATCH v4 3/5] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
Date:   Wed, 26 Jan 2022 16:10:52 -0600
Message-Id: <1643235052.876294.1535099.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 26 Jan 2022 19:32:48 +0100, michael.srba@seznam.cz wrote:
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
> ---
>  .../bindings/bus/qcom,ssc-block-bus.yaml      | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml:86:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dt.yaml:0:0: /example-0/soc/bus@10ac008/pinctrl@5e10000: failed to match any schema with compatible: ['qcom,msm8998-ssc-tlmm-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1584622

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


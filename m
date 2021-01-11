Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25E32F2204
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 22:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbhAKVmo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 16:42:44 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:44958 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731102AbhAKVmo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 16:42:44 -0500
Received: by mail-oi1-f169.google.com with SMTP id d189so131029oig.11;
        Mon, 11 Jan 2021 13:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PICJ1Bc4OaHxE0/WepcU1dqeCBwn7MPOx0XJxeGAj3s=;
        b=lvjAmQbKivGkD8DzU8a/hi3EwkqTzWemZkV+4sCw+cypAavESbpDuDKg82rhk1C9pj
         /YT7PjpoALegyod5Ud5UwBfEtBrY6bsDbjQwv2l5gqvYS5bZlUpKgUNdEzAfaQ1ToKJm
         QWv7Muujtsh5m3IR9/WGIvnB2PMSB74f+iUTZoIhFltrn+SlFgDX1ojkUx3mEqSx9NEP
         +WtpR4KN+Zxl5BU1Zyvp4D0rX9R2OwqbswlTwSuFiN7EK4364gYvtKF373I+/pqY/Qva
         38pZcpGU92dLbqYvcNe/ovBZtl3gPZlnt25+jen/SZjYfmxv2G3w/QoyhBG7Xc1LJuom
         btMw==
X-Gm-Message-State: AOAM532F9sjrIRNimxW5YUBhhV3O87EnoAQkfKehEn3dkvLLayhfhNBf
        U24femCsZr0/PtivqwMOJQ==
X-Google-Smtp-Source: ABdhPJzPpyejpxb0c8wgEECfmZ4orbtw8yI1tVr/edxfpdSakuh7rpELhDYcO2M1ATryStcdexkFFg==
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr520506oia.54.1610401322401;
        Mon, 11 Jan 2021 13:42:02 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v4sm211918otk.50.2021.01.11.13.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 13:42:01 -0800 (PST)
Received: (nullmailer pid 3109374 invoked by uid 1000);
        Mon, 11 Jan 2021 21:42:00 -0000
Date:   Mon, 11 Jan 2021 15:42:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     swboyd@chromium.org, lee.jones@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, linux-arm-msm-owner@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V5 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml
 format
Message-ID: <20210111214200.GA3094286@robh.at.kernel.org>
References: <1609329384-15534-1-git-send-email-kgunda@codeaurora.org>
 <1609329384-15534-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609329384-15534-2-git-send-email-kgunda@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 30, 2020 at 05:26:22PM +0530, Kiran Gunda wrote:
> Convert the bindings from .txt to .yaml format.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 --------------
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 117 +++++++++++++++++++++
>  2 files changed, 117 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml

> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> new file mode 100644
> index 0000000..b753bdb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SPMI PMICs multi-function device bindings
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Kiran Gunda <kgunda@codeaurora.org>
> +
> +description: |
> +  The Qualcomm SPMI PMICs use a QPNP scheme through SPMI interface.
> +  QPNP is effectively a partitioning scheme for dividing the SPMI extended
> +  register space up into logical pieces, and set of fixed register
> +  locations/definitions within these regions, with some of these regions
> +  specifically used for interrupt handling.
> +
> +  The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, and are
> +  interfaced to the chip via the SPMI (System Power Management Interface) bus.
> +  Support for multiple independent functions are implemented by splitting the
> +  16-bit SPMI slave address space into 256 smaller fixed-size regions, 256 bytes
> +  each. A function can consume one or more of these fixed-size register regions.
> +
> +properties:
> +  spmi_bus:
> +    type: object
> +    description: SPMI bus node

This is outside the scope of this binding.

> +
> +patternProperties:
> +  "^pmic@[0-9]$":
> +    description: Child PMIC nodes
> +    type: object

You've defined spmi_bus and pmic@... as siblings. I assume you meant 
parent/child instead. You'd need to indent all this 4 more spaces. 

However, this is also outside the scope of the binding and should be 
removed.

> +
> +    properties:
> +      compatible:

So this needs to be at the top level. 'compatible' is also how we decide 
to apply a schema to a node. What you did here will never be applied. 
Introduce an error to the example and see.

> +        items:
> +          - enum:
> +              # Sorted based on subtype ID the device reports
> +              - qcom,pm8941
> +              - qcom,pm8841
> +              - qcom,pma8084
> +              - qcom,pm8019
> +              - qcom,pm8226
> +              - qcom,pm8110
> +              - qcom,pma8084
> +              - qcom,pmi8962
> +              - qcom,pmd9635
> +              - qcom,pm8994
> +              - qcom,pmi8994
> +              - qcom,pm8916
> +              - qcom,pm8004
> +              - qcom,pm8909
> +              - qcom,pm8950
> +              - qcom,pmi8950
> +              - qcom,pm8998
> +              - qcom,pmi8998
> +              - qcom,pm8005
> +              - qcom,pm660l
> +              - qcom,pm660
> +
> +          - enum:
> +              - qcom,spmi-pmic

You can use 'const' here instead of enum.

> +
> +      reg:
> +        maxItems: 1
> +        description:
> +          Specifies the SPMI USID slave address for this device.
> +          For more information see bindings/spmi/spmi.txt
> +
> +    patternProperties:
> +      "^[a-zA-Z0-9]$":
> +        description:
> +          Each child node of SPMI slave id represents a function of the PMIC.
> +          In the example below the rtc device node represents a peripheral of
> +          pm8941 SID = 0. The regulator device node represents a peripheral of
> +          pm8941 SID = 1.
> +        type: object

No, you need to define all the child nodes. This may mean you need to 
split to several schemas if each PMIC has different sub devices.

> +
> +    required:
> +      - compatible
> +      - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi_bus {
> +        compatible = "qcom,spmi-pmic-arb";
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        pmic@0 {
> +         compatible = "qcom,pm8941";
> +         reg = <0x0 SPMI_USID>;
> +
> +         rtc {
> +           compatible = "qcom,rtc";

Not documented nor used anywhere.

> +           interrupts = <0x0 0x61 0x1 0x1>;
> +           interrupt-names = "alarm";
> +          };
> +        };
> +
> +        pmic@1 {
> +         compatible = "qcom,pm8941";
> +         reg = <0x1 SPMI_USID>;
> +
> +         regulator {
> +           compatible = "qcom,regulator";

Same here.

> +           regulator-name = "8941_boost";
> +           };
> +          };
> +        };
> +...
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 

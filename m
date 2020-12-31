Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51802E827F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 23:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbgLaWuv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 17:50:51 -0500
Received: from mail-il1-f180.google.com ([209.85.166.180]:42978 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgLaWuu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 17:50:50 -0500
Received: by mail-il1-f180.google.com with SMTP id 2so18351388ilg.9;
        Thu, 31 Dec 2020 14:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FTT5mZwVbwzaG7eO2xhxJL9MrI/0IncmuTso7WylOvo=;
        b=haMRRLmPOabqolVfEVXMbg18A8Y8PWOt7Aa8eIVfHIAeqJ69gJnWkOpL6RroLU6MSZ
         8zUxjUSw/31Z8aIPhAgXAaqtZQ2FE/8/rnsOacczMBEILpbDSZj6DqV54UyNc25DhwgZ
         QT2BaZdEmgMhK/m3CQYkiodKdisP21JBvjgJBqLAvZmmNorPmG/qXhAMN1V3TzJhbZT9
         8C8tLVRJkazyz423I6gYBHNhr1lvPrnjJveVFtN/N5Meyd1zn0q+CYrPKGtsC802V0ao
         7rpaIyn9pm+prCkUyFbQHAyYe9sg8sMPA0DESJjryqMn+SsBOakME1k7LveRdOCk+Y9v
         AkAg==
X-Gm-Message-State: AOAM530J1UYAWBpA0jJKAkLzH3yBs9xWWPp5CEHZlCj8OEh3etJjkCOz
        2sONdDhrStPB1pkKE6PDlA==
X-Google-Smtp-Source: ABdhPJw4L54UvX4krlopSQzP2+D/VHZquWlRvbZQA/BfJqKquzIV83uxJJiBOxlonPiOcykAWZFvmw==
X-Received: by 2002:a92:d8d1:: with SMTP id l17mr56264705ilo.99.1609455009632;
        Thu, 31 Dec 2020 14:50:09 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o7sm36357973iop.51.2020.12.31.14.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 14:50:08 -0800 (PST)
Received: (nullmailer pid 2522805 invoked by uid 1000);
        Thu, 31 Dec 2020 22:50:07 -0000
Date:   Thu, 31 Dec 2020 15:50:07 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: qcom,qca639x: add binding for
 QCA639x defvice
Message-ID: <20201231225007.GA2509172@robh.at.kernel.org>
References: <20201220165845.3712599-1-dmitry.baryshkov@linaro.org>
 <20201220165845.3712599-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201220165845.3712599-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Dec 20, 2020 at 07:58:42PM +0300, Dmitry Baryshkov wrote:
> Qualcomm QCA639x is a family of WiFi + Bluetooth SoCs, with BT part
> being controlled through the UART and WiFi being present on PCIe bus.
> Both blocks share common power sources. Add binding to describe power
> sequencing required to power up this device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/mfd/qcom,qca639x.yaml | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml b/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml
> new file mode 100644
> index 000000000000..d43c75da136f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mfd/qcom,qca639x.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QCA639x WiFi + Bluetoot SoC bindings
> +
> +maintainers:
> +  - Andy Gross <agross@kernel.org>
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description: |
> +  This binding describes thes Qualcomm QCA6390 or QCA6391 power supplies and
> +  enablement pins.

Humm, this should really be for the whole device. For BT/WiFi chips 
we've gotten away with 2 nodes for each interface. If that doesn't work 
here, then I think this needs to be 1 node for all, not 3 as it seems 
you are doing.

> +
> +properties:
> +  compatible:
> +    const: qcom,qca639x

List each device, we don't do wildcards in compatible strings. 

> +
> +  '#power-domain-cells':
> +    const: 0
> +
> +  pinctrl-0: true
> +  pinctrl-1: true
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: active
> +
> +  vddaon-supply:
> +    description:
> +      0.95V always-on LDO power input
> +
> +  vddpmu-supply:
> +    description:
> +      0.95V LDO power input to PMU
> +
> +  vddrfa1-supply:
> +    description:
> +      0.95V LDO power input to RFA
> +
> +  vddrfa2-supply:
> +    description:
> +      1.25V LDO power input to RFA
> +
> +  vddrfa3-supply:
> +    description:
> +      2V LDO power input to RFA
> +
> +  vddpcie1-supply:
> +    description:
> +      1.25V LDO power input to PCIe part
> +
> +  vddpcie2-supply:
> +    description:
> +      2V LDO power input to PCIe part

Do the PCIe supplies have to be on if only the BT part is used?

Supplies are refcounted, so I'd suggest just duplicating the supplies in 
both the BT and PCIe nodes.

> +
> +  vddio-supply:
> +    description:
> +      1.8V VIO input
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    qca639x: qca639x {
> +      compatible = "qcom,qca639x";
> +      #power-domain-cells = <0>;
> +
> +      vddaon-supply = <&vreg_s6a_0p95>;
> +      vddpmu-supply = <&vreg_s2f_0p95>;
> +      vddrfa1-supply = <&vreg_s2f_0p95>;
> +      vddrfa2-supply = <&vreg_s8c_1p3>;
> +      vddrfa3-supply = <&vreg_s5a_1p9>;
> +      vddpcie1-supply = <&vreg_s8c_1p3>;
> +      vddpcie2-supply = <&vreg_s5a_1p9>;
> +      vddio-supply = <&vreg_s4a_1p8>;
> +      pinctrl-names = "default", "active";
> +      pinctrl-0 = <&wlan_default_state &bt_default_state>;
> +      pinctrl-1 = <&wlan_active_state &bt_active_state>;
> +    };
> +...
> -- 
> 2.29.2
> 

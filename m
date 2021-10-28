Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC4B43E9D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 22:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhJ1Upc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 16:45:32 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:40895 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbhJ1Upc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 16:45:32 -0400
Received: by mail-oi1-f180.google.com with SMTP id n63so10099234oif.7;
        Thu, 28 Oct 2021 13:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oVyS3Eyp56LdR9Osn4635yi5S+r7XAQD1bAus+2vp8Q=;
        b=6YAbdGvnCxUp1ZX07SyZZdyxq+ERfURPWji30YkAsJen65rVtfuL29mdS4W1cmiI6w
         rzqo7Qq0bb0F+rrw5qLGznYZPFuO39i+MiEh0o3cho8YAXrLH+NFdUgyXE8zgiJypwpJ
         1EB63902DoT66v4NGqTH8d9SihDL2Q6+RI5f3+IAGCc55HgC4alzeJm8kaWNNgQFK4WU
         I2pheVoUek2E/hhHskK6A9bPxZedoKv5ijYrTO/c1UIGO0qyAnK62vLPtt4ss6njQa+L
         RZmvKlO7xZyf27L0maYgEr7zxZUpqS1SLWFlQhTlBhkzWnKkCNorOMPS8ZDCVFpBfoz6
         tDBw==
X-Gm-Message-State: AOAM533el5YyRiXIumlvgWBYWgyuu5j6Mm2jdCvSPNuji8HHSk3xyOiE
        6I58WHLNi78MDx72aYfFtA==
X-Google-Smtp-Source: ABdhPJyolLYvkvV5OHPwqB7bNj3L45JZhYDhPoeqoEPB6thhWdWkaVkI7ykYPyA8wqX7ss86Iw6O7Q==
X-Received: by 2002:aca:b982:: with SMTP id j124mr10412558oif.56.1635453784464;
        Thu, 28 Oct 2021 13:43:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 3sm1364797oif.12.2021.10.28.13.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 13:43:03 -0700 (PDT)
Received: (nullmailer pid 545639 invoked by uid 1000);
        Thu, 28 Oct 2021 20:43:03 -0000
Date:   Thu, 28 Oct 2021 15:43:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [RESEND PATCH v2 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM
 YAML schema
Message-ID: <YXsLVwLcvlJSQX88@robh.at.kernel.org>
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
 <20211028164941.831918-6-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028164941.831918-6-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 28, 2021 at 05:49:39PM +0100, Bryan O'Donoghue wrote:
> Add a YAML description for the pm8150b-tcpm driver. The pm8150b-tcpm
> encapsulates a type-c block and a pdphy block into one block presented to
> the tcpm Linux API.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-tcpm.yaml          | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
> new file mode 100644
> index 0000000000000..6dd51a1dd944f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-tcpm.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm PMIC TCPM Driver
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  Qualcomm PMIC Type-C Port Manager Driver
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8150b-tcpm
> +
> +  ports:
> +    description: Remote endpoint connections
> +    $ref: /connector/usb-connector.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        description: Remote endpoints for the type-c device
> +
> +      port@1:
> +        description: Remote endpoints for the pdphy device
> +
> +      port@2:
> +         description: Connection to role switch node

I don't understand these ports. The graph binding should be showing data 
stream connections. It should look something like a block diagram of the 
h/w components.

> +
> +    required:
> +      - port@0
> +      - port@1
> +      - port@2
> +
> +required:
> +  - compatible
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/usb/pd.h>
> +    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h>
> +    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h>
> +
> +    pm8150b_tcpm: pmic-tcpm {
> +        compatible = "qcom,pmic-tcpm";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        status = "disabled";

Not much point in having a disabled example.

> +        ports {
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                pmic_tcpm_typec: endpoint {
> +                    remote-endpoint = <&pmic_typec>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                pmic_tcpm_pdphy: endpoint {
> +                    remote-endpoint = <&pmic_pdphy>;
> +                };
> +            };
> +            port@2 {
> +                ret = <2>;
> +                usb3_role: endpoint@0 {
> +                    remote-endpoint = <&dwc3_drd_switch>;
> +                };
> +            };
> +        };
> +
> +        connector {
> +            compatible = "usb-c-connector";
> +
> +            power-role = "source";
> +            data-role = "dual";
> +            self-powered;
> +
> +            source-pdos = <PDO_FIXED(5000, 3000,
> +                           PDO_FIXED_DUAL_ROLE |
> +                           PDO_FIXED_USB_COMM |
> +                           PDO_FIXED_DATA_SWAP)>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    pmic_tcpm_ss_mux: endpoint@0 {
> +                        remote-endpoint = <&qmp_ss_mux>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.33.0
> 
> 

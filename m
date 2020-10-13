Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F4928D0CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 17:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730778AbgJMPBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 11:01:02 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38167 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730768AbgJMPA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 11:00:59 -0400
Received: by mail-oi1-f196.google.com with SMTP id h10so10120672oie.5;
        Tue, 13 Oct 2020 08:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VjmNHgLrDRIv4sEY9/S/NIEnsCKdo3pbg9OQDx7zfsM=;
        b=o4tItsk/ehPeV58oXQb9UjphtiQmUy45aS3dvj0ivP0Ykzj3QzcIM9DE45abmlEdSH
         Mx75uEblhX/STLdKId0W9RAjC490zxzfoJ+nuXfxVAZuVHY9pI7zUPTv7ELiB9mUBpu6
         6EzZjZKKhmGBIKOS8fnDGnM0h5N+bp5PD2K1MRTPNkTVFl0GoOAihL5bgNrOcPORLx/t
         sYDbLRdlSzG4WHWHe9blHFJmndC6SFXI2kr3JA83YTZTP4p+NuRd6Rs5XdL8dw+ebKpf
         VBkEIGK8Vth0HtIGjNf1nm0osB8RN/fRl/J4OEXkgOSaPtMrCLC7/D7d9yCvwkuFg/5R
         wzWw==
X-Gm-Message-State: AOAM53279owM+xACKHDqwRsx3XHsFYge2u2Aw7m57JqTWgQdBJKg7AYG
        eWwIX5WhbHO0ua0XCeGb3Q==
X-Google-Smtp-Source: ABdhPJwCck+OH36faxumQAVj/KQNA2C+VBOeoMeRMy1pFs9yE+WdJqQajF3KjiBfdH+rALx+mN/7Nw==
X-Received: by 2002:aca:31d6:: with SMTP id x205mr72606oix.117.1602601258478;
        Tue, 13 Oct 2020 08:00:58 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k13sm26603ooi.41.2020.10.13.08.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 08:00:57 -0700 (PDT)
Received: (nullmailer pid 3507507 invoked by uid 1000);
        Tue, 13 Oct 2020 15:00:56 -0000
Date:   Tue, 13 Oct 2020 10:00:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, jackp@codeaurora.org,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v10 2/4] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
Message-ID: <20201013150056.GA3497815@bogus>
References: <20201008235934.8931-1-wcheng@codeaurora.org>
 <20201008235934.8931-3-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008235934.8931-3-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 08, 2020 at 04:59:32PM -0700, Wesley Cheng wrote:
> Introduce the dt-binding for enabling USB type C orientation and role
> detection using the PM8150B.  The driver will be responsible for receiving
> the interrupt at a state change on the CC lines, reading the
> orientation/role, and communicating this information to the remote
> clients, which can include a role switch node and a type C switch.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 000000000000..40e0a296f922
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm PMIC based USB type C Detection Driver
> +
> +maintainers:
> +  - Wesley Cheng <wcheng@codeaurora.org>
> +
> +description: |
> +  Qualcomm PMIC Type C Detect
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8150b-usb-typec
> +
> +  reg:
> +    maxItems: 1
> +    description: Type C base address
> +
> +  interrupts:
> +    maxItems: 1
> +    description: CC change interrupt from PMIC
> +
> +  port:
> +    description: Remote endpoint connection to the DRD switch
> +    type: object

I don't understand what this is supposed to be. You'll have to expand 
the example or provide a block diagram of what the connections/routing 
looks like.

> +
> +    properties:
> +      endpoint:
> +        description: Connection to the DRD switch being used
> +        type: object
> +
> +  connector:
> +    $ref: /connector/usb-connector.yaml#
> +    description: Connector type for remote endpoints
> +    type: object
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - usb-c-connector
> +
> +      power-role: true
> +      data-role: true
> +
> +      ports:
> +        description: Remote endpoint connections for type C paths
> +        type: object
> +
> +        properties:
> +          port@1:
> +            description: Remote endpoints for the Super Speed path
> +            type: object
> +
> +            properties:
> +              endpoint:
> +                description: Connection to USB type C mux node
> +                type: object
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - connector
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    pm8150b {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pm8150b_typec: usb-typec@1500 {
> +            compatible = "qcom,pm8150b-usb-typec";
> +            reg = <0x1500>;
> +            interrupts = <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>;
> +
> +            port {
> +                usb3_role: endpoint {
> +                    remote-endpoint = <&dwc3_drd_switch>;
> +                };
> +            };
> +
> +            connector {
> +                compatible = "usb-c-connector";
> +                power-role = "dual";
> +                data-role = "dual";
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {
> +                        reg = <0>;
> +                    };
> +                    port@1 {
> +                        reg = <1>;
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        usb3_data_ss: endpoint {
> +                            remote-endpoint = <&qmp_ss_mux>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

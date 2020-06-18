Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3020C1FFB1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 20:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbgFRSdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 14:33:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:47010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729862AbgFRSdU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 14:33:20 -0400
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBC1F20DD4;
        Thu, 18 Jun 2020 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592505199;
        bh=Wa43T7w4Pf81pk4qHW8JXP2v08fY04xx7ru8epXTzJg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ecX5Ld1C7sjO0SKydvTx6QgyY74RFFqkiWnwMkxD4jX71EmRFAZbRf1SerGyIli3R
         RZl95VzhTjcClNC29YOwPoiGgk7m7vhs8a1gruUkjU0bfitz0O1/8qARf5cXGIDbju
         zjjHj9YihPIoZu0HkGVQjpeneXBfdHEM4Q05d4L8=
Received: by mail-ot1-f44.google.com with SMTP id v13so5345603otp.4;
        Thu, 18 Jun 2020 11:33:19 -0700 (PDT)
X-Gm-Message-State: AOAM532oj0Lz6d7z6RBJL/UzqyzCpdjBDjNcid6/gwdCeNKAPD6q5QkG
        QIjrSJprmw2HlEW2TPUUP32f/F4UWI1LwwnhrA==
X-Google-Smtp-Source: ABdhPJx+Rb+JwD1PIWMOTJ6UqjOwSRAy1TpYrAkSXPkBhtxEkdRG5n3IX0zx8pWKa9xRNHPUxS5L8u5iKcFIdAX3nNk=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr68860ots.192.1592505199060;
 Thu, 18 Jun 2020 11:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200617180209.5636-1-wcheng@codeaurora.org> <20200617180209.5636-3-wcheng@codeaurora.org>
In-Reply-To: <20200617180209.5636-3-wcheng@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 18 Jun 2020 12:33:07 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+fhXWGJvYxUDygd6hKs3dc8GKxKCz_Q+_C1AjK0J0N+w@mail.gmail.com>
Message-ID: <CAL_Jsq+fhXWGJvYxUDygd6hKs3dc8GKxKCz_Q+_C1AjK0J0N+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux USB List <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Jun Li <lijun.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 17, 2020 at 12:02 PM Wesley Cheng <wcheng@codeaurora.org> wrote:
>
> Introduce the dt-binding for enabling USB type C orientation and role
> detection using the PM8150B.  The driver will be responsible for receiving
> the interrupt at a state change on the CC lines, reading the orientation/role,
> and communicating this information to the remote clients, which can include
> a role switch node and a type C switch.
>
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 000000000000..085b4547d75a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,117 @@
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
> +  connector:
> +    description: Connector type for remote endpoints
> +    type: object

You are duplicating everything in usb-connector.yaml. You should have
a $ref to it.

> +
> +    properties:
> +      compatible:
> +        enum:
> +          - usb-c-connector
> +
> +      power-role:
> +       enum:
> +         - dual
> +         - source
> +         - sink
> +
> +      data-role:
> +        enum:
> +          - dual
> +          - host
> +          - device
> +
> +      port:
> +        description: Remote endpoint connections
> +        type: object
> +
> +        properties:
> +          endpoint@0:
> +            description: Connection to USB type C mux node

This is wrong. The connector binding says port 0 is the connection the
USB HS controller.

What's a type C mux node? Is there a binding for that? There's an
ongoing discussion with the CrOS folks on how to describe Alt mode
mux/switches.

> +            type: object
> +
> +            properties:
> +              remote-endpoint:
> +                maxItems: 1
> +                description: Node reference to the type C mux
> +
> +          endpoint@1:
> +            description: Connection to role switch node

Again, what's this?

> +            type: object
> +
> +            properties:
> +              remote-endpoint:
> +                maxItems: 1
> +                description: Node reference to the role switch node
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - connector
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    pm8150b {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        qcom,typec@1500 {
> +            compatible = "qcom,pm8150b-usb-typec";
> +            reg = <0x1500>;
> +            interrupts =
> +                <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>;
> +
> +            connector {
> +                compatible = "usb-c-connector";
> +                power-role = "dual";
> +                data-role = "dual";
> +                port {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    usb3_data_ss: endpoint@0 {
> +                        reg = <0>;
> +                        remote-endpoint =
> +                                <&qmp_ss_mux>;
> +                    };
> +
> +                    usb3_role: endpoint@1 {
> +
> +                        reg = <1>;
> +                        remote-endpoint =
> +                                <&dwc3_drd_switch>;
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

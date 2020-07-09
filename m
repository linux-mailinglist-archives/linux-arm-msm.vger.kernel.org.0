Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515E521AAC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 00:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgGIWqf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 18:46:35 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44044 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgGIWq3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 18:46:29 -0400
Received: by mail-io1-f65.google.com with SMTP id i4so4030742iov.11;
        Thu, 09 Jul 2020 15:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QXFKaIMVMvoCqLqiHJ2gAavHpO+CjG0ilPbgcK2+QFs=;
        b=OVGZQIbQF1+vcqb1L6GeXRw5pW1d/A4vcjQJ4Pa55elc44WgLSmpAr0OKEARSNABvc
         cvy1bqKiHOHxWeAW3n38IhZE7ExDPKsvzybq59ClQ+5k0myaCqAF0F+Giv3IvzYoahHw
         SEp4m7LVxZuEpB6TUPs915bqoKH/qn/jQZuxwlTuKgnp/+7VvFU7AMFXmZOC8IdpJE9C
         561QMBsMsAYTOih+NNDPejoQtODTUewVmkzkOOfg6G5kFowDxujK4/9cGh578eXUQgmc
         Mq8fRicWY2w+Um1ItpUgDhKuWr/Omcf5SUuXuDQrcaCPNiPoiKjgZ3jlDWhRcm9O5tNo
         rLTA==
X-Gm-Message-State: AOAM530Pv4zObmmMqn+GHEh4jPsI2V8VSEbVXGTgbmWTVdWI5Lwr4krw
        E+/RxiApbmVZBVU/S7TEmQ==
X-Google-Smtp-Source: ABdhPJyKXp0NnPd3+aWgOm1nwSaG7xmAY38yYWlsy/z8UNBc0kMfraXWzB4Dxdq1HDX525Ov/1rOuw==
X-Received: by 2002:a05:6602:1544:: with SMTP id h4mr45081721iow.24.1594334788520;
        Thu, 09 Jul 2020 15:46:28 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id g8sm2510122ilq.49.2020.07.09.15.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:46:27 -0700 (PDT)
Received: (nullmailer pid 1029281 invoked by uid 1000);
        Thu, 09 Jul 2020 22:46:26 -0000
Date:   Thu, 9 Jul 2020 16:46:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     lgirdwood@gmail.com, mark.rutland@arm.com, agross@kernel.org,
        broonie@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, rdunlap@infradead.org,
        bryan.odonoghue@linaro.org
Subject: Re: [PATCH v5 2/6] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
Message-ID: <20200709224626.GA1021653@bogus>
References: <20200703015102.27295-1-wcheng@codeaurora.org>
 <20200703015102.27295-3-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703015102.27295-3-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 02, 2020 at 06:50:58PM -0700, Wesley Cheng wrote:
> Introduce the dt-binding for enabling USB type C orientation and role
> detection using the PM8150B.  The driver will be responsible for receiving
> the interrupt at a state change on the CC lines, reading the orientation/role,
> and communicating this information to the remote clients, which can include
> a role switch node and a type C switch.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 000000000000..735b1f74664b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,130 @@
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
> +    $ref: /schemas/connector/usb-connector.yaml#

Why is all the connector schema duplicated here? You only need things 
that are further constrained like 'compatible'.

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
> +      ports:
> +        description: Remote endpoint connections
> +        type: object
> +
> +        properties:
> +          port@0:
> +            description: Remote endpoints for the High Speed path
> +            type: object
> +
> +          port@1:
> +            description: Remote endpoints for the Super Speed path
> +            type: object
> +
> +            properties:
> +              endpoint@0:
> +                description: Connection to USB type C mux node
> +                type: object
> +
> +                properties:
> +                  remote-endpoint:
> +                    maxItems: 1

'remote-endpoint' in not an array.

> +                    description: Node reference to the type C mux
> +
> +              endpoint@1:
> +                description: Connection to role switch node
> +                type: object
> +
> +                properties:
> +                  remote-endpoint:
> +                    maxItems: 1
> +                    description: Node reference to the role switch node

So USB-SS data can come from 'type C mux' or 'role switch node'? That 
seems odd.

Rob

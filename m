Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FAF25D3BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 10:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbgIDIeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 04:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgIDIeK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 04:34:10 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C70C061244;
        Fri,  4 Sep 2020 01:34:07 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s205so6962677lja.7;
        Fri, 04 Sep 2020 01:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rO+8dFM6+CySLVuYpUE9JcayB5tROzwwLjKQ4GSNTpE=;
        b=OUacaBU4KUZCGSxwpzCBKjANVzYzSsbeUJXMcT9vVNlaxC/Ivys7B2SITAesW3r5b6
         veCy6gxCXeopfK4Z+GQVyQQ4EZ8zfqehYzw75F7gfQSm3z2bxCz9hexrtEdUWzvSx2eq
         hY4/oodj1HwY0Rp0YIIDLx16O03ux++C1j8p6UoNv2kPDIV0Rcj83DUj5NJEVejyZgWR
         Q7zawiy5853rrcYRBQozmr/Sys+4OfAcrdIWuC/UA0AatqUJerFGHgj02FXeKFdwfr3e
         xFOWPDum4ySXTjdggQ6Ax7C3D5Hxs+KxoLkY9dZ8oT3LBySdDNB8TPv1xGytCpSjYsFB
         YIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rO+8dFM6+CySLVuYpUE9JcayB5tROzwwLjKQ4GSNTpE=;
        b=OP72l88suL84E6KZlo0aVcaww8sxh4EqSEsA8p87Qlq1omLAkcYAIw0jjx6PJuwwRM
         KGo/aiMlOB28S8vvujR3/8dg8iCR2dfC5o3/9NDydhAuNM4vrP2rXfDrCmJ83p5sfFtv
         +tA69Qmvysuv8/zHi/LRKXdszHe1b7fGBlu8QvcLv1gWnvXYxWdWEh+0JULxzipUka8a
         GZrTFUJddJSwfM8hG8oQQo6OFh4BvdUNLom20+Dl/NoC3xMdSoJ8ptRAgWc5QjcaRXLk
         JLV+dfeatXHCFgh7s/jOA34U0pqVT7vL4SPjhw4SNjzZn7TVh0+ti3R5p3lW5g835rYV
         kDdw==
X-Gm-Message-State: AOAM530VjBfDTqm3PBcILhrNJyYMtyyCdJEFAeoA1R4UJ6UHAqM0PLRi
        SWehSmLdMcxUiiRpAcg5mr4TXQaApAn+vQ==
X-Google-Smtp-Source: ABdhPJw7O6p6no+oEvoKbIFoYR6Y2rIj+qxM7DNV4ZKdwvTu8/Vg0ta95TjHKiH+hU17sUyzLb+HsQ==
X-Received: by 2002:a2e:71a:: with SMTP id 26mr3381332ljh.198.1599208445293;
        Fri, 04 Sep 2020 01:34:05 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4b4:8b5e:bc57:27d1:fcc8:28b8? ([2a00:1fa0:4b4:8b5e:bc57:27d1:fcc8:28b8])
        by smtp.gmail.com with ESMTPSA id h11sm1132851ljc.60.2020.09.04.01.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2020 01:34:04 -0700 (PDT)
Subject: Re: [PATCH v9 2/4] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
To:     Wesley Cheng <wcheng@codeaurora.org>, sboyd@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org
References: <20200904082223.25563-1-wcheng@codeaurora.org>
 <0101017458361303-16620b87-c433-4c00-a061-b1e688363539-000000@us-west-2.amazonses.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <1147af8f-68c6-ecea-7527-f59db3a87d17@gmail.com>
Date:   Fri, 4 Sep 2020 11:33:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0101017458361303-16620b87-c433-4c00-a061-b1e688363539-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04.09.2020 11:22, Wesley Cheng wrote:

> Introduce the dt-binding for enabling USB type C orientation and role
> detection using the PM8150B.  The driver will be responsible for receiving
> the interrupt at a state change on the CC lines, reading the
> orientation/role, and communicating this information to the remote
> clients, which can include a role switch node and a type C switch.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>   .../bindings/usb/qcom,pmic-typec.yaml         | 108 ++++++++++++++++++
>   1 file changed, 108 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 000000000000..8582ab6a3cc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,108 @@
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
> +        description: Remote endpoint connections
> +        type: object
> +
> +        properties:
> +          port@1:
> +            description: Remote endpoints for the Super Speed path
> +            type: object
> +
> +            properties:
> +              endpoint@0:
> +                description: Connection to USB type C mux node
> +                type: object
> +
> +              endpoint@1:
> +                description: Connection to role switch node
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    pm8150b {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pm8150b_typec: typec@1500 {

    Shouldn't we call it "usb-typec@1500" for more clarity?

> +            compatible = "qcom,pm8150b-usb-typec";
> +            reg = <0x1500>;
> +            interrupts = <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>;
[...]

MBR, Sergei

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15AFE5877CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 09:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbiHBH2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 03:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233933AbiHBH2p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 03:28:45 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4C7491C2
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 00:28:43 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y11so20695955lfs.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 00:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=2wW+pW8iv7CjZwE7FU2+N4FeVyi5IA1nYjrBItlvXmw=;
        b=iwn1tkT0IhoEXGX91JW2PcDuYxmh0sZlbFzZMYZOrrw/UIOxzQjSq/+0r3dsMFJ2zh
         iovWS6WF6yFL6Lpv/H2Z0hQwOeTcmvbRLK9E/b9IJRbPgJ/7ZE8odQuky/UlYjRLxKbh
         e4mNgfYfKgA9abky2bywIRt6wdEbYu8ep5e4jLvAeIDXnmRf7zH6noR59Y4YNESS4tWu
         ggDgnVeER0iQ0C0+1W/iOcKvoAhqHddyWu8IOicJ0UTu2cN19lEHrM6rBf1ugixcQHrs
         aGq5qLpkN4qBdx5d9fws5Cxk0EYwAlEKwwP4ytBFKwHUXoCT8Au381UNCsrGsLWdOIIe
         b9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=2wW+pW8iv7CjZwE7FU2+N4FeVyi5IA1nYjrBItlvXmw=;
        b=pcLeUOtCvArSWMHb/T2lIozcWEyKvhmIkf7hcl1fx/mJu1HBHByF9rVI5M/QtabgjR
         YvocwtISsCv0f1lDDmMl7SRfeQxF2TpwJ7qBhBgHl1yhMPsDToeWZdqBpZ53un57ED5A
         p8PyDKtaOWqdqQURYT6zq9wbWLtQ+ZUjCcD1CJ2fi3M6c8vpyrz8deJHeMtOYUnmAtgQ
         ZEPmppw5xCQXJoazKfAlw0pnt0oXDiT0c5FYZT3ZiJfFyRirduIk7UJEwBrJR75F7VuW
         OHdqN4NCp1IMcRV6GBbBayWUY6zHYj4UkF0TVuODFXvVyNdDTN4zH2xqekp+fCQ4bCRY
         CZCg==
X-Gm-Message-State: AJIora/+5gOs75VvIXOCF2qt3V9dNQWg1bzvkHOJirp9CaasPpQFl5aV
        AmCwuZKXyTgjbvqNRQmUEPWhNg==
X-Google-Smtp-Source: AGRyM1sbs7Pia9l1GPT3H8p4ExsIV87tAWP6X7IH/C7nolnZru4z6kO5bAYo4b+ZdPy+yuX7k/jpzA==
X-Received: by 2002:a05:6512:1318:b0:482:ae30:fc77 with SMTP id x24-20020a056512131800b00482ae30fc77mr7266024lfu.279.1659425321572;
        Tue, 02 Aug 2022 00:28:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bu7-20020a056512168700b0048a1a70d14dsm2004992lfb.94.2022.08.02.00.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 00:28:41 -0700 (PDT)
Message-ID: <0ad6bd7b-b5cb-6f9a-eeca-b493c5bfa8b3@linaro.org>
Date:   Tue, 2 Aug 2022 10:28:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/11] dt-bindings: Add binding for gunyah hypervisor
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-3-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220801211240.597859-3-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/08/2022 00:12, Elliot Berman wrote:
> When Linux is booted as a guest under the Gunyah hypervisor, Gunyah
> applies a devicetree overlay describing the virtual platform
> configuration of the guest VM, such as the message queue capability IDs
> for communicating with the Resource Manager. Add the DT bindings that
> Gunyah adheres for the hypervisor node and message queues.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   .../bindings/firmware/gunyah-hypervisor.yaml  | 84 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   2 files changed, 85 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> new file mode 100644
> index 000000000000..e50d932e768c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/gunyah-hypervisor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Gunyah Hypervisor
> +
> +maintainers:
> +  - Murali Nalajala <quic_mnalajal@quicinc.com>
> +  - Elliot Berman <quic_eberman@quicinc.com>
> +
> +description: |+
> +  On systems which support devicetree, Gunyah generates and overlays a deviceetree overlay which
> +  describes the basic configuration of the hypervisor. Virtual machines use this information for
> +  initial discovery that they are running as a Gunyah guest VM.
> +  See also: https://github.com/quic/gunyah-resource-manager/blob/develop/src/vm_creation/dto_construct.c
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: gunyah-hypervisor-1.0
> +          - const: gunyah-hypervisor

Just:
  - items:
   - const: gunyah-hypervisor-1.0
   - const: gunyah-hypervisor

oneOf is not necessary

> +
> +  "#address-cells":
> +    description: Number of cells needed to represent 64-bit capability IDs.
> +    const: 2
> +  "#size-cells":
> +    description: must be 0, because capability IDs are not memory address
> +                  ranges and do not have a size.
> +    const: 0
> +
> +patternProperties:
> +  "^gunyah-resource-mgr(@.*)?":
> +    type: object
> +    description:
> +      Resource Manager node which is required to communicate to Resource
> +      Manager VM using Gunyah Message Queues.
> +
> +    properties:
> +      compatible:
> +        oneOf:

Again, please drop the oneOf.

> +          - items:
> +              - const: gunyah-resource-manager-1-0
> +              - const: gunyah-resource-manager
> +      reg:
> +        items:
> +          - description: Gunyah capability ID of the TX message queue
> +          - description: Gunyah capability ID of the RX message queue
> +      interrupts:
> +        items:
> +          - description: Interrupt for the TX message queue
> +          - description: Interrupt for the RX message queue
> +    additionalProperties: false
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    hypervisor {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        compatible = "gunyah-hypervisor-1.0", "gunyah-hypervisor";
> +
> +        gunyah-resource-mgr@1 {
> +            compatible = "gunyah-resource-manager-1-0", "gunyah-resource-manager";
> +            interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>, /* TX full IRQ */
> +                         <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>; /* RX empty IRQ */
> +            reg = <0x00000000 0x00000000>, <0x00000000 0x00000001>;
> +                  /* TX, RX cap ids */

Do these cap ids persist from platform to platform? Then you might want 
to define generic values for these caps.

Also it feels like you are misusing the #address-cells/reg properties. 
For example, the device should have its @NNNN to be equal to the first 
addres. But you are using the second reg.

I think that using a separate property with /bits/ 64 might be a better 
solution.

> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 18fb034526e1..0cd12ea6c11c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8741,6 +8741,7 @@ M:	Elliot Berman <quic_eberman@quicinc.com>
>   M:	Murali Nalajala <quic_mnalajal@quicinc.com>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
>   F:	Documentation/virt/gunyah/
>   
>   HABANALABS PCI DRIVER


-- 
With best wishes
Dmitry

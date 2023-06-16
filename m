Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6937C733605
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 18:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241507AbjFPQcl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 12:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344095AbjFPQck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 12:32:40 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC91230E7
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 09:32:37 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-777b4716673so27477839f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686933157; x=1689525157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27BucVbJGmBPMM/ePWYXHXpruzrUnk1K2qiauBa6U6w=;
        b=p75neDQO9RFaCXBXb4VTCDLzw3oNuDrxwvEHbWCKcq58eoh4ThNA+jR72ziL8lCfLU
         Cd4cj5yx7pPzPLnTXcjZ5UHKdemuPVJ9Cv0iC5vPLOE/Tn9+AO92pYaBcN+MA5bljSt5
         fLwH/M0ME25RVpU0wo1xHuK1BUnDwx4pexSTiD2YHQ80OxPGMferUkJ5oh/LVFXFpn9G
         ZUJly6SDFmzWhOKxyg8rFn/fOO+A9PPOowM7yJKK3AtdGczOHrMwM9lLWOoWf1M12WG5
         cRbMteunWDnEDAj6ozVajdcvLHeuc+j6knMvoWenFurSIBvFOWzCTy7ZZt4Jox62FdKu
         cvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686933157; x=1689525157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27BucVbJGmBPMM/ePWYXHXpruzrUnk1K2qiauBa6U6w=;
        b=dKwur1yVKL9xeJAqPZuhJOzkFz1ZBScwbhpJEX4z0phIXDD18zvcx11N26oDKHfNH3
         Cl7cuA69leRXS5M9+uXXPH9NY4b6LlBgAohg+Hi80LU96/Cw/tTejf74sTbL/QQtKUUG
         a5buQffUqH0j/mwPpdP8IEi+6mbrUcAD0youdd83dFW8/6VCwNX0YwnK7u/yvr7uCuWw
         X7/2H7QKgnSwYPkq5I+ahrXwJfv4qPwQx/ug5/HDcjrxbN/ZBdzCNcFfVJJqsPpTevtZ
         8qkAaVy4xtq2Qf4LTMKa485YvOrOoRcjtqSd2VyzouiYhbzm6EpdnGVEnjeBmBw3Vz+I
         oLVg==
X-Gm-Message-State: AC+VfDw7aOS3s9VLmxgYKQk73oNuYJcoUlxg+RX1SU6g4UkW2t08KYak
        nMEUs9TKhAGTVDG2C7qc8Oy20w==
X-Google-Smtp-Source: ACHHUZ6aWtyXtIoCHeSQHdFbRI0tSWDXdS9E+1oIA6eNu3too5L8oHgF3ZAPjcrK8Qvw90nXmXiKJA==
X-Received: by 2002:a05:6602:4184:b0:77a:e8c6:9f15 with SMTP id bx4-20020a056602418400b0077ae8c69f15mr6110998iob.4.1686933157034;
        Fri, 16 Jun 2023 09:32:37 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id k19-20020a02a713000000b0041ab38c1a4esm6425620jam.60.2023.06.16.09.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 09:32:36 -0700 (PDT)
Message-ID: <5b6a97cc-3604-7a37-b61d-018034dd37de@linaro.org>
Date:   Fri, 16 Jun 2023 11:32:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 02/25] dt-bindings: Add binding for gunyah hypervisor
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20230613172054.3959700-1-quic_eberman@quicinc.com>
 <20230613172054.3959700-3-quic_eberman@quicinc.com>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20230613172054.3959700-3-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/13/23 12:20 PM, Elliot Berman wrote:
> When Linux is booted as a guest under the Gunyah hypervisor, the Gunyah
> Resource Manager applies a devicetree overlay describing the virtual
> platform configuration of the guest VM, such as the message queue
> capability IDs for communicating with the Resource Manager. This
> information is not otherwise discoverable by a VM: the Gunyah hypervisor
> core does not provide a direct interface to discover capability IDs nor
> a way to communicate with RM without having already known the
> corresponding message queue capability ID. Add the DT bindings that
> Gunyah adheres for the hypervisor node and message queues.

Isn't the resource-manager property required?  And there
is exactly one of them?  (Maybe those constraints are
represented here; I learn something every time I try to
write a YAML binding...)

Anyway, this otherwise looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   .../bindings/firmware/gunyah-hypervisor.yaml  | 82 +++++++++++++++++++
>   1 file changed, 82 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> new file mode 100644
> index 0000000000000..3fc0b043ac3cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/gunyah-hypervisor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Gunyah Hypervisor
> +
> +maintainers:
> +  - Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> +  - Elliot Berman <quic_eberman@quicinc.com>
> +
> +description: |+
> +  Gunyah virtual machines use this information to determine the capability IDs
> +  of the message queues used to communicate with the Gunyah Resource Manager.
> +  See also: https://github.com/quic/gunyah-resource-manager/blob/develop/src/vm_creation/dto_construct.c
> +
> +properties:
> +  compatible:
> +    const: gunyah-hypervisor
> +
> +  "#address-cells":
> +    description: Number of cells needed to represent 64-bit capability IDs.
> +    const: 2
> +
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
> +        const: gunyah-resource-manager
> +
> +      reg:
> +        items:
> +          - description: Gunyah capability ID of the TX message queue
> +          - description: Gunyah capability ID of the RX message queue
> +
> +      interrupts:
> +        items:
> +          - description: Interrupt for the TX message queue
> +          - description: Interrupt for the RX message queue
> +
> +    additionalProperties: false
> +
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
> +        compatible = "gunyah-hypervisor";
> +
> +        gunyah-resource-mgr@0 {
> +            compatible = "gunyah-resource-manager";
> +            interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>, /* TX full IRQ */
> +                         <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>; /* RX empty IRQ */
> +            reg = <0x00000000 0x00000000>, <0x00000000 0x00000001>;
> +                  /* TX, RX cap ids */
> +        };
> +    };


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2A25AE2A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 10:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239206AbiIFIbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 04:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239204AbiIFIac (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 04:30:32 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372F840E23
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 01:30:03 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id b17so925851wrq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=v8ouXiM/D6PovqdDcjRRSqwSIhMxmugCgoNU0mgYx10=;
        b=ojLY3eaYDCDRhPHbtp0/eACZnuFvgdyQqlXnABqm76NrtAo/PDeUE7QeApNhcfiAFH
         t7iZBsasZsIdF+S9V+913pWzRr8yD9aZbhh9YqdBl12BDaM+FRdUQLLejcm0T9vdG8op
         1Q7538AOZrZTGNB1ArpETrev3EYAedxupmthfTn5KHOux3s73zoh3bPbtB3vKaF920dB
         5ZlSmX0NiW4rYFWxGOf6kN7a+58E8qB3/FxV8XoLvrhuWKo7NlhE63wIFC85+heMyF4M
         Fg4b0gRs5PqjINLuDCBqq5c0JT328kBINEDAZO+OebMZh/vkPb+FtZxSmJ+Z5300HK/T
         zyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=v8ouXiM/D6PovqdDcjRRSqwSIhMxmugCgoNU0mgYx10=;
        b=dv5fFQVLhUylrDgc4e/4xPNowofuvtrNSY5sV0S7WJKbIzFlsXjutZ3v/xaHohf6Tb
         3OL+GQuIgPKxg+1RAxfbZJPs3pvWvJpMopZsmC1FORthLfgiCEGEqHE7QFeWAjDsl2tN
         AOxWsfT5VWK7gp32QZ86DlXIolILaVDWa6uxjvxrHC6u7/TN7GQTb0bHFVy0mz4NTvmI
         7Ism0zQLU30r2uMo+7NyVN1BqrjlTJIVE9u8pwCgJN+0fZYh7lD3NJ6Sxa0QdU/f2D3A
         aJIrQnLcj2fuInKwFZuyl+5Vt0bcO7hiJ6Jmrt4BsaT0+YxGqD2cJjKyl7kkGi6EbE5l
         6i9A==
X-Gm-Message-State: ACgBeo3KMnUW3CHin1BAymXYG+kaBXv72AxemUcQZMpJVZ9HiC7Qnp6U
        /T/dCrscj8cGQpuWWsuKp+WBsA==
X-Google-Smtp-Source: AA6agR6Ij/SlWC2xamBYW4wjAWzpKpcJCN4algrGYEx6qIU0+EskptbLBVBTgWpgZumhQp+ds5rt6g==
X-Received: by 2002:a05:6000:1361:b0:228:dc47:8a49 with SMTP id q1-20020a056000136100b00228dc478a49mr91226wrz.50.1662453001723;
        Tue, 06 Sep 2022 01:30:01 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b003a61306d79dsm15963347wmr.41.2022.09.06.01.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:30:01 -0700 (PDT)
Date:   Tue, 6 Sep 2022 11:29:59 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v7 1/2] dt-bindings: misc: fastrpc convert bindings to
 yaml
Message-ID: <YxcFB4lEu16SXOyl@linaro.org>
References: <20220905144554.1772073-1-abel.vesa@linaro.org>
 <3649a134-0ea7-b67c-8b5a-2971f090446c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3649a134-0ea7-b67c-8b5a-2971f090446c@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-09-06 08:45:22, Krzysztof Kozlowski wrote:
> On 05/09/2022 16:45, Abel Vesa wrote:
> > Convert Qualcomm FastRPC bindings to yaml format, so that we could validate
> > dt-entries correctly and any future additions can go into yaml format.
> > 
> > Use compute-cb@ subnodes instead of just cb@.
> > 
> > Also add qcom,non-secure-domain, qcom,glink-channels and
> > qcom,smd-channels missing properties to make sure dtbs_check doesn't
> > fail right off the bat.
> 
> qcom,non-secure-domain is in original binding, so I don't understand why
> it is being "added".
> 

Yeah, my bad, I should've added this line to the changes since v4.

> > 
> > Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Co-developed-by: David Heidelberg <david@ixit.cz>
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > 
> > Changes since v6:
> >  * renamed the parent node name in the example from smd-edge to glink-edge
> > 
> >  .../devicetree/bindings/misc/qcom,fastrpc.txt |  88 -------------
> >  .../bindings/misc/qcom,fastrpc.yaml           | 118 ++++++++++++++++++
> 
> As you can see in Rob's bot report - the patchset introduces errors and
> is not bisectable.

Please note that Rob's bot report is for v6.

v7 fixes the errors reported, by using glink-edge instead of smd-edge.

Looking at all QCOM SoCs that have fastrpc node in devicetree, they all
seem to be using glink-edge.

> 
> You also need to fix qcom,glink-edge.yaml
> 

I don't see why, with the changes I made in v7, there are no errors
anymore.

> >  2 files changed, 118 insertions(+), 88 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> >  create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> > deleted file mode 100644
> > index 5ec124b138a6..000000000000
> > --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> > +++ /dev/null
> > @@ -1,88 +0,0 @@
> > -Qualcomm Technologies, Inc. FastRPC Driver
> > -
> > -The FastRPC implements an IPC (Inter-Processor Communication)
> > -mechanism that allows for clients to transparently make remote method
> > -invocations across DSP and APPS boundaries. This enables developers
> > -to offload tasks to the DSP and free up the application processor for
> > -other tasks.
> > -
> > -- compatible:
> > -	Usage: required
> > -	Value type: <stringlist>
> > -	Definition: must be "qcom,fastrpc"
> > -
> > -- label
> > -	Usage: required
> > -	Value type: <string>
> > -	Definition: should specify the dsp domain name this fastrpc
> > -	corresponds to. must be one of this: "adsp", "mdsp", "sdsp", "cdsp"
> > -
> > -- qcom,non-secure-domain:
> > -	Usage: required
> > -	Value type: <boolean>
> > -	Definition: Property to specify that dsp domain is non-secure.
> > -
> > -- qcom,vmids:
> > -	Usage: optional
> > -	Value type: <u32 array>
> > -	Definition: Virtual machine IDs for remote processor.
> 
> You miss qcom,vmids in the conversion.
> 
> > -
> > -- #address-cells
> > -	Usage: required
> > -	Value type: <u32>
> > -	Definition: Must be 1
> > -
> > -- #size-cells
> > -	Usage: required
> > -	Value type: <u32>
> > -	Definition: Must be 0
> > -
> > -= COMPUTE BANKS
> > -Each subnode of the Fastrpc represents compute context banks available
> > -on the dsp.
> > -- All Compute context banks MUST contain the following properties:
> > -
> > -- compatible:
> > -	Usage: required
> > -	Value type: <stringlist>
> > -	Definition: must be "qcom,fastrpc-compute-cb"
> > -
> > -- reg
> > -	Usage: required
> > -	Value type: <u32>
> > -	Definition: Context Bank ID.
> > -
> > -- qcom,nsessions:
> > -	Usage: Optional
> > -	Value type: <u32>
> > -	Defination: A value indicating how many sessions can share this
> > -		    context bank. Defaults to 1 when this property
> > -		    is not specified.
> > -
> > -Example:
> > -
> > -adsp-pil {
> > -	compatible = "qcom,msm8996-adsp-pil";
> > -	...
> > -	smd-edge {
> > -		label = "lpass";
> > -		fastrpc {
> > -			compatible = "qcom,fastrpc";
> > -			qcom,smd-channels = "fastrpcsmd-apps-dsp";
> > -			label = "adsp";
> > -			#address-cells = <1>;
> > -			#size-cells = <0>;
> > -
> > -			cb@1 {
> > -				compatible = "qcom,fastrpc-compute-cb";
> > -				reg = <1>;
> > -			};
> > -
> > -			cb@2 {
> > -				compatible = "qcom,fastrpc-compute-cb";
> > -				reg = <2>;
> > -			};
> > -			...
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> > new file mode 100644
> > index 000000000000..2b446272cc14
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Qualcomm FastRPC Driver
> > +
> > +maintainers:
> > +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > +
> > +description: |
> > +  The FastRPC implements an IPC (Inter-Processor Communication)
> > +  mechanism that allows for clients to transparently make remote method
> > +  invocations across DSP and APPS boundaries. This enables developers
> > +  to offload tasks to the DSP and free up the application processor for
> > +  other tasks.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> 
> no "items", as it is not a list.
> 
> > +      - const: qcom,fastrpc
> > +
> > +  label:
> > +    items:
> 
> ditto (plus this actually does not define even how many items)
> 
> > +      enum:
> > +        - adsp
> > +        - mdsp
> > +        - sdsp
> > +        - cdsp
> > +
> > +  qcom,glink-channels:
> > +    description:
> > +      A list of channels tied to this function, used for matching
> > +      the function to a set of virtual channels.
> > +    $ref: "/schemas/types.yaml#/definitions/string-array"
> 
> maxItems: 1
> 
> > +
> > +  qcom,non-secure-domain:
> > +    description:
> > +      Used to mark the current domain as non-secure.
> > +    type: boolean
> > +
> > +  qcom,smd-channels:
> > +    description:
> > +      Channel name used for the RPM communication
> > +    $ref: "/schemas/types.yaml#/definitions/string-array"
> 
> maxItems: 1
> 
> 
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +patternProperties:
> > +  "(compute-)?cb@[0-9]*$":
> > +    type: object
> > +
> > +    description: >
> > +      Each subnode of the Fastrpc represents compute context banks available on the dsp.
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> 
> Drop items
> 
> > +          - const: qcom,fastrpc-compute-cb
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      qcom,nsession:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        default: 1
> > +        description: >
> > +          A value indicating how many sessions can share this context bank.
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +
> > +required:
> > +  - compatible
> > +  - label
> > +  - '#address-cells'
> > +  - '#size-cells'
> 
> Use consistent quotes, either ' or "
> 
> 
> 
> Best regards,
> Krzysztof

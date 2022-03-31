Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEEAE4EE1FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 21:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235269AbiCaTme (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 15:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240967AbiCaTm1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 15:42:27 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2243D21AD
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 12:40:11 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id h4so517382edr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 12:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZJPRDVJ4i3CoCpBpHTerrKP5+xFbRI1ypwTw9ETZHIs=;
        b=LgUqkPajNt93eXRRHm8ZYg6x6pggOukr4LiPjE9VwNUjKKDtGSvJjZgFrlfDzkrw+Q
         QxFsSXnRdRhBaafA1/1Qq6UlVwCYpP4kElG90RmPS4EXSFjgR+VACiUY/ppc85f1li4+
         rYfgVhS9bysVCw47LDUgf9XCn/ozyhNvE7tHCFqQ1bYnHe1b5Yjb9E+eZ5Jr2FxQ44qZ
         pNHccjpPMS/cxCLk5wPwA4zgFgX2HRZ/6nQBrrh5rnBSm3QCEt04rNshHKbb8DJH63dc
         afuy0wIMk9vIfmB0CJNnuGSglM4PcpPM3nI2p5y2BxbwlTaaO0dMe9sav9Tn24IpyE6e
         h66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZJPRDVJ4i3CoCpBpHTerrKP5+xFbRI1ypwTw9ETZHIs=;
        b=3Q5RbeEnwWcGefTGkPre1PmIfFpWE+64b5QLOK79yePxqUlyIQ5RPT+8K0NfU4fH0I
         zuPzfospoNJn+Qv/XJGKOei8wr4GsOGs5nay9O05D7doDt5Gz8xU76HNRrFuHKmfLeEq
         Hhm+SLMdZGYTLrGNANK5kZgw5PoNsZu6XM10Wg+meGqmd4LJKcUlgWBbTSxIc/CWv/p0
         7x3+evkDdyPyvxQJqTljGfjkIG4swHOt0Vp8OuKhwl9nP5QmHk9/vlHXxABvOz0hxVQ8
         5rM4pDetig5ufu4OJ6bOnTxsutZ7k9Dm9B+nZ5FjdiZpZIN17QeAzsLGSbrkGadLpNnG
         LrkQ==
X-Gm-Message-State: AOAM531sM9gbgHVHw4qsihrhqO3rVMAh7GfiwPSqr0NPqWgy298008Sy
        Qpf38vUfIWTtf4J/Srwtr4FB9g==
X-Google-Smtp-Source: ABdhPJyyU7vh2YKhs2wXuvlY2VhSEWOYdBjCLkaHIh9iLI8tueZDx8Hr4XOIVJO8fkYZLCfr8/2h5A==
X-Received: by 2002:a05:6402:2743:b0:419:4edd:c487 with SMTP id z3-20020a056402274300b004194eddc487mr18118161edd.325.1648755609668;
        Thu, 31 Mar 2022 12:40:09 -0700 (PDT)
Received: from [192.168.0.167] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906505600b006da7d71f25csm137088ejk.41.2022.03.31.12.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 12:40:09 -0700 (PDT)
Message-ID: <ddc12aab-3cff-16a1-9ec9-a246240f9521@linaro.org>
Date:   Thu, 31 Mar 2022 21:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: qcom,spi-geni-qcom: convert to
 dtschema
Content-Language: en-US
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
References: <20220331160248.716234-1-krzysztof.kozlowski@linaro.org>
 <20220331175817.GA91341@9a2d8922b8f1>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220331175817.GA91341@9a2d8922b8f1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2022 19:58, Kuldeep Singh wrote:
> On Thu, Mar 31, 2022 at 06:02:47PM +0200, Krzysztof Kozlowski wrote:
>> Convert the GENI based Qualcomm Universal Peripheral (QUP) Serial
>> Peripheral Interface (SPI) bindings to DT Schema.
>>
>> The original bindings in TXT were not complete, so add during conversion
>> properties already used in DTS and/or in the driver: reg-names, dmas,
>> interconnects, operating points and power-domains.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes since v1:
>> 1. Correct $ref path and remove interconnect minItems (Kuldeep).
>> 2. Remove child tpm device from example.
>> 3. Pad reg hex addresses with 00.
>> ---
>>  .../bindings/spi/qcom,spi-geni-qcom.txt       |  39 ------
>>  .../bindings/spi/qcom,spi-geni-qcom.yaml      | 120 ++++++++++++++++++
>>  2 files changed, 120 insertions(+), 39 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.txt
>>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.txt b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.txt
>> deleted file mode 100644
>> index c8c1e913f4e7..000000000000
>> --- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.txt
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -GENI based Qualcomm Universal Peripheral (QUP) Serial Peripheral Interface (SPI)
>> -
>> -The QUP v3 core is a GENI based AHB slave that provides a common data path
>> -(an output FIFO and an input FIFO) for serial peripheral interface (SPI)
>> -mini-core.
>> -
>> -SPI in master mode supports up to 50MHz, up to four chip selects, programmable
>> -data path from 4 bits to 32 bits and numerous protocol variants.
>> -
>> -Required properties:
>> -- compatible:		Must contain "qcom,geni-spi".
>> -- reg:			Must contain SPI register location and length.
>> -- interrupts:		Must contain SPI controller interrupts.
>> -- clock-names:		Must contain "se".
>> -- clocks:		Serial engine core clock needed by the device.
>> -- #address-cells:	Must be <1> to define a chip select address on
>> -			the SPI bus.
>> -- #size-cells:		Must be <0>.
>> -
>> -SPI Controller nodes must be child of GENI based Qualcomm Universal
>> -Peripharal. Please refer GENI based QUP wrapper controller node bindings
>> -described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
>> -
>> -SPI slave nodes must be children of the SPI master node and conform to SPI bus
>> -binding as described in Documentation/devicetree/bindings/spi/spi-bus.txt.
>> -
>> -Example:
>> -	spi0: spi@a84000 {
>> -		compatible = "qcom,geni-spi";
>> -		reg = <0xa84000 0x4000>;
>> -		interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>> -		clock-names = "se";
>> -		clocks = <&clock_gcc GCC_QUPV3_WRAP0_S0_CLK>;
>> -		pinctrl-names = "default", "sleep";
>> -		pinctrl-0 = <&qup_1_spi_2_active>;
>> -		pinctrl-1 = <&qup_1_spi_2_sleep>;
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
>> new file mode 100644
>> index 000000000000..62c4a9598e16
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
>> @@ -0,0 +1,120 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/qcom,spi-geni-qcom.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: GENI based Qualcomm Universal Peripheral (QUP) Serial Peripheral Interface (SPI)
>> +
>> +maintainers:
>> +  - Andy Gross <agross@kernel.org>
>> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> +
>> +description:
>> +  The QUP v3 core is a GENI based AHB slave that provides a common data path
>> +  (an output FIFO and an input FIFO) for serial peripheral interface (SPI)
>> +  mini-core.
>> +
>> +  SPI in master mode supports up to 50MHz, up to four chip selects,
>> +  programmable data path from 4 bits to 32 bits and numerous protocol variants.
>> +
>> +  SPI Controller nodes must be child of GENI based Qualcomm Universal
>> +  Peripharal. Please refer GENI based QUP wrapper controller node bindings
>> +  described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
>> +
>> +allOf:
>> +  - $ref: /schemas/spi/spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,geni-spi
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: se
>> +
>> +  dmas:
>> +    maxItems: 2
>> +
>> +  dma-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: qup-core
>> +      - const: qup-config
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    const: se
> 
> Why reg-names is required?
> Reg contain max 1 value, we can skip reg-names like other users.
> 
> Also, "se" is used as clock name and using it again for reg-names?
> I think this is wrong and reg-names shouldn't be documented.

reg-names are not required. If you ask why they are documented? As I
wrote in commit msg - bindings were not fully updated to DTSes being used.

Best regards,
Krzysztof

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E245255B385
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 20:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbiFZS2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jun 2022 14:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbiFZS2d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jun 2022 14:28:33 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD7ADFE5
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jun 2022 11:28:32 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id fi2so14652386ejb.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jun 2022 11:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XAouVpcuNw+xkGv1ro6XQDbRNz/+UookdfvS2DjviFc=;
        b=df1WpvNnsk4sOSrk1LpaKY9Dd6EcxG47fQKxV/1LDriGOhH6eu9cw2a4/YZwccX+nM
         vNcwqm9MyaR2bhJVqTYIvOwGLFU/8XehY/yR24Fu2+/FN3dWB5VjB8oX4PW/jegmv5cz
         BS5EapXZx/A1OenJVpKAenOW9ZEUmHsfKUXZzICpSHhB3cWhLQe/1+ybP6oPFxDJbCay
         0eLH6Ziym37sYWPccFE5Y5I3DRWLwKxJ16w4fsNpP+1iVyHL7D3x1V0jsNO72qHZGRcp
         QTu72d7BvOcsK42toxzM48QnPJHm1P8FGFRGccPLio/VBHuuzuI4/GzKI6L6LukFkZEE
         LvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XAouVpcuNw+xkGv1ro6XQDbRNz/+UookdfvS2DjviFc=;
        b=v+sGoi1U50mCTNK4eURKO29HxWktmpYvg9TXOUOugFOwQKW7Wr8xJzjIRXXt6ByHYZ
         h5f1/beU/QYkKwBCX8uvDrepSQe7dFEcSZWmM/GWVKtos+gE8/q48jshRrmxm2tG3wTJ
         iOs4cHT3ZGYukJdcIN94U45ogwgzqnh0Ah8SgUiHOOMZdXy0xoc3ByOFl4y+5csJUOCS
         BR/Tw8YkEXvNXGJUlqSoQlT2u9YZeaKpWoBJEZAYglr3tAogk4Sn9Fm1MpA/fVmA/3I/
         HNP4il+7v1UvmaTJB8I5P48KtC1WdJDpZd1cHVJT2KEfF2YUcuxoQBTAgkv3dUMmCpRy
         Y+5A==
X-Gm-Message-State: AJIora+Km+fWZBKSpbs2pAqhgx6u63IpSWTkTTuEM0dtCDq67mSKDbp2
        2PKWNPmtxgXw7EuRQrQt87QHBg==
X-Google-Smtp-Source: AGRyM1sLUwWh1IchCdLHZvbLfcuBrxSWUg30trCiAE/Q0kbP5vlObIQUmHVe7Jwf2wXJFjiv0qupwQ==
X-Received: by 2002:a17:906:5d07:b0:722:eac8:29a6 with SMTP id g7-20020a1709065d0700b00722eac829a6mr9072271ejt.89.1656268110735;
        Sun, 26 Jun 2022 11:28:30 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h8-20020a170906260800b00718f4d4f073sm4039818ejc.88.2022.06.26.11.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 11:28:30 -0700 (PDT)
Message-ID: <7f4ebc9c-6412-9494-ba77-cc625b34d197@linaro.org>
Date:   Sun, 26 Jun 2022 20:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/3] dt-bindings: firmware: convert Qualcomm SCM
 binding to the yaml
Content-Language: en-US
To:     David Heidelberg <david@ixit.cz>
Cc:     ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Robert Marko <robimarko@gmail.com>
References: <20220626114634.90850-1-david@ixit.cz>
 <20220626114634.90850-3-david@ixit.cz>
 <d00d6c3e-7d65-9021-7a26-486c705a16de@linaro.org>
 <8704fbd6-94a1-5692-5ccb-95f66ffaaf6f@ixit.cz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8704fbd6-94a1-5692-5ccb-95f66ffaaf6f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/06/2022 19:13, David Heidelberg wrote:
> On 26/06/2022 18:45, Krzysztof Kozlowski wrote:
>> On 26/06/2022 13:46, David Heidelberg wrote:
>>> Convert Qualcomm SCM firmware binding to the yaml format.
>>>
>>> This commit also:
>>>   - adds qcom,scm-mdm9607 into list which has only core clock
>>>   - adds qcom,scm-sm6125, qcom,scm-ipq6018
>>>   - #reset-cells, because the property is already used
>>>
>>> Cc: Robert Marko <robimarko@gmail.com>
>>> Cc: Guru Das Srinagesh <quic_gurus@quicinc.com>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>> v3:
>>>   - add preceding patches for ARM and arm64 adding missing compatible strings
>>>   - extended with missing compatible strings
>>>   - added two additional maintainers, see https://lkml.org/lkml/2022/6/23/1969
>>> v2:
>>>   - changed maintainer to Bjorn
>>>   - document #reset-cells
>>>
>>>   .../devicetree/bindings/firmware/qcom,scm.txt |  57 --------
>>>   .../bindings/firmware/qcom,scm.yaml           | 131 ++++++++++++++++++
>>>   2 files changed, 131 insertions(+), 57 deletions(-)
>>>   delete mode 100644 Documentation/devicetree/bindings/firmware/qcom,scm.txt
>>>   create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
>>> deleted file mode 100644
>>> index 0f4e5ab26477..000000000000
>>> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
>>> +++ /dev/null
>>> @@ -1,57 +0,0 @@
>>> -QCOM Secure Channel Manager (SCM)
>>> -
>>> -Qualcomm processors include an interface to communicate to the secure firmware.
>>> -This interface allows for clients to request different types of actions.  These
>>> -can include CPU power up/down, HDCP requests, loading of firmware, and other
>>> -assorted actions.
>>> -
>>> -Required properties:
>>> -- compatible: must contain one of the following:
>>> - * "qcom,scm-apq8064"
>>> - * "qcom,scm-apq8084"
>>> - * "qcom,scm-ipq4019"
>>> - * "qcom,scm-ipq806x"
>>> - * "qcom,scm-ipq8074"
>>> - * "qcom,scm-mdm9607"
>>> - * "qcom,scm-msm8226"
>>> - * "qcom,scm-msm8660"
>>> - * "qcom,scm-msm8916"
>>> - * "qcom,scm-msm8953"
>>> - * "qcom,scm-msm8960"
>>> - * "qcom,scm-msm8974"
>>> - * "qcom,scm-msm8976"
>>> - * "qcom,scm-msm8994"
>>> - * "qcom,scm-msm8996"
>>> - * "qcom,scm-msm8998"
>>> - * "qcom,scm-sc7180"
>>> - * "qcom,scm-sc7280"
>>> - * "qcom,scm-sdm845"
>>> - * "qcom,scm-sdx55"
>>> - * "qcom,scm-sm6350"
>>> - * "qcom,scm-sm8150"
>>> - * "qcom,scm-sm8250"
>>> - * "qcom,scm-sm8350"
>>> - * "qcom,scm-sm8450"
>>> - and:
>>> - * "qcom,scm"
>>> -- clocks: Specifies clocks needed by the SCM interface, if any:
>>> - * core clock required for "qcom,scm-apq8064", "qcom,scm-msm8660" and
>>> -   "qcom,scm-msm8960"
>>> - * core, iface and bus clocks required for "qcom,scm-apq8084",
>>> -   "qcom,scm-msm8916", "qcom,scm-msm8953", "qcom,scm-msm8974" and "qcom,scm-msm8976"
>>> -- clock-names: Must contain "core" for the core clock, "iface" for the interface
>>> -  clock and "bus" for the bus clock per the requirements of the compatible.
>>> -- qcom,dload-mode: phandle to the TCSR hardware block and offset of the
>>> -		   download mode control register (optional)
>>> -
>>> -Example for MSM8916:
>>> -
>>> -	firmware {
>>> -		scm {
>>> -			compatible = "qcom,msm8916", "qcom,scm";
>>> -			clocks = <&gcc GCC_CRYPTO_CLK> ,
>>> -				 <&gcc GCC_CRYPTO_AXI_CLK>,
>>> -				 <&gcc GCC_CRYPTO_AHB_CLK>;
>>> -			clock-names = "core", "bus", "iface";
>>> -		};
>>> -	};
>>> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>>> new file mode 100644
>>> index 000000000000..17d06e75b82b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>>> @@ -0,0 +1,131 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/firmware/qcom,scm.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> No quotes here.
>>
>>> +
>>> +title: QCOM Secure Channel Manager (SCM)
>>> +
>>> +description: |
>>> +  Qualcomm processors include an interface to communicate to the secure firmware.
>>> +  This interface allows for clients to request different types of actions.
>>> +  These can include CPU power up/down, HDCP requests, loading of firmware,
>>> +  and other assorted actions.
>>> +
>>> +maintainers:
>>> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
>>> +  - Robert Marko <robimarko@gmail.com>
>>> +  - Guru Das Srinagesh <quic_gurus@quicinc.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - qcom,scm-apq8064
>>> +          - qcom,scm-apq8084
>>> +          - qcom,scm-ipq4019
>>> +          - qcom,scm-ipq6018
>>> +          - qcom,scm-ipq806x
>>> +          - qcom,scm-ipq8074
>>> +          - qcom,scm-mdm9607
>>> +          - qcom,scm-msm8226
>>> +          - qcom,scm-msm8660
>>> +          - qcom,scm-msm8916
>>> +          - qcom,scm-msm8953
>>> +          - qcom,scm-msm8960
>>> +          - qcom,scm-msm8974
>>> +          - qcom,scm-msm8976
>>> +          - qcom,scm-msm8994
>>> +          - qcom,scm-msm8996
>>> +          - qcom,scm-msm8998
>>> +          - qcom,scm-sc7180
>>> +          - qcom,scm-sc7280
>>> +          - qcom,scm-sdm845
>>> +          - qcom,scm-sdx55
>>> +          - qcom,scm-sm6125
>>> +          - qcom,scm-sm6350
>>> +          - qcom,scm-sm8150
>>> +          - qcom,scm-sm8250
>>> +          - qcom,scm-sm8350
>>> +          - qcom,scm-sm8450
>>> +          - qcom,scm-qcs404
>>> +      - const: qcom,scm
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    maxItems: 3
>>> +
>>> +  clock-names: true
>> You should have constraints here - min/maxItems.
>>
>>> +
>>> +  '#reset-cells':
>>> +    const: 1
>>> +
>>> +  qcom,dload-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    items:
>>> +      - items:
>>> +          - description: phandle to TCSR hardware block
>>> +          - description: offset of the download mode control register
>>> +    description:
>>> +      Should be phandle/offset pair.
>> This description is not helpful. Should be something closer to "TCSR
>> hardware block".
>>
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,scm-apq8064
>>> +              - qcom,scm-mdm9607
>>> +              - qcom,scm-msm8660
>>> +              - qcom,scm-msm8960
>>> +    then:
>>> +      properties:
>>> +        clock-names:
>>> +          items:
>>> +            - const: core
>> Missing constraints (maxItems:2) for clocks.
> 
> Why 2? I would put `maxItems: 1` there
> 

Yes, of course, typo.

Best regards,
Krzysztof

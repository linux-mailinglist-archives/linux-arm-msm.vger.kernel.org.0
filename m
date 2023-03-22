Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334906C4CB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 15:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjCVOBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 10:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbjCVOBd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 10:01:33 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83BA1C5B3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 07:01:30 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id o32so5223536wms.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 07:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679493689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdaBh+EkAOExGAYG1kIJgzvzsGwXxIwpscMZopwJ/To=;
        b=JgYBD07IYx3H7CSGTPCkA2EEkK3emkdqzSYK7R1X4ESPtK0QBmcGXK0wmNOjobp05/
         Od8Y4XVKyeCtXwDdD8epIfGKFNsJIN9ETc3GilmKvTOQ1XHNyGKegDKYxNLOPp18pDXd
         yvcwRqnV5umq6FM3GffWMkjN6XnjZZRbA1l6KnQwwJQSw5OG4Urm+87MSJssEufCfZ81
         OxR365FZCUZLxpm+38YfqbuA4grFAwRJbxluwydgR8k5SEvok8iQoX+mLPmGp+lRu6Vh
         efFOGY5DecyUY4JlbZfp7upgpF+xM3D86ME9RRw0TVP6QIDIc2bWuXiFZ/yaFq0cLZHl
         GJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679493689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdaBh+EkAOExGAYG1kIJgzvzsGwXxIwpscMZopwJ/To=;
        b=1ykCOehLE1DOyncvuX24vOEg5dYb3ADSN4LSVcgd+JsiByHt70u7ZzJBj4H8QkEQjq
         YmyaO/zY60XvseKnU2cMOws4Oa6pqBOphSr9K4vBh0YN2tc4N4s2lRCp5HkoT3hHJUvw
         loE7CUga264d6X5RJgspxxEcpWXUKxao1/yfAyeUokmdA7LtVlInSQWfxua7B9wbKxkh
         ypAsIu2mFX9m8U3Fe1D6ZG4PoW/UEM5uDA193pa3l3S197uj6n0HV6HYAC6EIYpoPEDM
         3QyLRrc0ELfrv27a/fqjTySe0phRJ7H34A57cY+JiuwBCL2TO+D44G/4vAHU6jWCmM3/
         SRxQ==
X-Gm-Message-State: AO0yUKXU0h4VZNPuNMLHf1AJE1lr5x+7vUgx+vxuDwttYLG/cBdTnPwp
        7jhwZLWXMYJGKl7bCsDVOaqxgg==
X-Google-Smtp-Source: AK7set8F0zNfVeee9iXtd6PT1PE5EdkYNpKQ2oDuPt4us8MKkx83OhDqwN4FYr9StRklOMVnRiSksA==
X-Received: by 2002:a1c:7714:0:b0:3ed:cc22:23db with SMTP id t20-20020a1c7714000000b003edcc2223dbmr5765047wmi.3.1679493688785;
        Wed, 22 Mar 2023 07:01:28 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c05c500b003edf2ae2432sm9763879wmd.7.2023.03.22.07.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 07:01:28 -0700 (PDT)
Message-ID: <913ca622-60eb-3774-9148-3e56ffb7cd90@linaro.org>
Date:   Wed, 22 Mar 2023 14:01:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 04/18] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add port as an optional
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-5-bryan.odonoghue@linaro.org>
 <3f5efb36-f9be-0816-b9cc-dc87966552cc@linaro.org>
 <20230321204935.GA1506038-robh@kernel.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230321204935.GA1506038-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/03/2023 20:49, Rob Herring wrote:
> On Sun, Mar 19, 2023 at 12:45:13PM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2023 13:18, Bryan O'Donoghue wrote:
>>> port is required to instantiate a remote-endpoint which can receive
>>> orientation-switch messages from a Type-C mux.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   .../bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml           | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>>> index 52886cdb0e506..1c887e34b1223 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>>> @@ -65,6 +65,12 @@ properties:
>>>       description: Flag the port as possible handler of orientation switching
>>>       type: boolean
>>>   
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/properties/port
>>> +    description:
>>> +      A port node to link the PHY to a TypeC controller for the purpose of
>>> +      handling altmode muxing and orientation switching.
>>
>> Please extend the example as well.
>>
>> Don't you have there two ports? USB and DP?
> 
> Or 3: USB, DP, and connector.
> 
> Please make sure this all aligns with what Bjorn and I discussed
> recently. It was for glink specifically.
> 
> Rob

Hmm.

Thanks for mentioning this.

I had erroneously built the orientation endpoint into the connector 
during development and was just carrying that in my patches.

This

&pm8150b_typec {
         status = "okay";
         port {
                 usb3_role: endpoint {
                         remote-endpoint = <&dwc3_drd_switch>;
                 };
         };

         connector {
                 compatible = "usb-c-connector";

                 power-role = "source";
                 data-role = "dual";
                 self-powered;

                 source-pdos = <PDO_FIXED(5000, 3000,
                                          PDO_FIXED_DUAL_ROLE |
                                          PDO_FIXED_USB_COMM |
                                          PDO_FIXED_DATA_SWAP)>;

                 ports {
                         #address-cells = <1>;
                         #size-cells = <0>;

                         port@0 {
                                 reg = <0>;
                                 pmic_tcpm_ss_mux: endpoint {
                                         remote-endpoint = <&qmp_ss_mux>;
                                 };
                         };
                 };
         };
};


Should be this

&pm8150b_typec {
         status = "okay";
         ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

                 port@0 {
                         reg = <0>;
                         pmic_tcpm_ss_mux: endpoint {
                                 remote-endpoint = <&qmp_ss_mux>;
                         };
                 };

                 port@1 {
                         usb3_role: endpoint {
                                 remote-endpoint = <&dwc3_drd_switch>;
                         };
                 };
         };

         connector {
                 compatible = "usb-c-connector";

                 power-role = "source";
                 data-role = "dual";
                 self-powered;

                 source-pdos = <PDO_FIXED(5000, 3000,
                                          PDO_FIXED_DUAL_ROLE |
                                          PDO_FIXED_USB_COMM |
                                          PDO_FIXED_DATA_SWAP)>;
         };
};

---
bod

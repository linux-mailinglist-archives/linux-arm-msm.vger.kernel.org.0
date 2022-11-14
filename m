Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C1262876B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237643AbiKNRsX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236963AbiKNRsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:48:22 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408312338C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:48:21 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso8429848wmp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z69yhLKq74jw0Za73wjwiFzKRbPjBt/K4YlJ+yIKuQU=;
        b=evm2bsv3ZmfUd4O3EEUVICB4M5TmCUHN/MMEFNpA6GglgNRePUjJe0uMzLMLmxDdba
         HeEFIgkTCkM9KeUQJw8act4XI/1ylmsRKAUWw5eqybhsjPcch+0Tm9U5S2fU/NYXWhQD
         JejbFHYh5cmhp7K9wdM1yf/sMjw8jQv9pPpXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z69yhLKq74jw0Za73wjwiFzKRbPjBt/K4YlJ+yIKuQU=;
        b=dZcd1aSrtOiOrHR/AExVcTSN3lAvI78RrzXThWCAmr+2UVdP/Tmm5aAxdjSk+jPcNs
         8uFRromRp+EUqve67UaC02MINc/i3ovkUJbgSgL5WHYaT0wxeWqKOY0OqVPD9YsZOoZz
         QTpMBsxxCXERQy/21juWiJIS+X8LU5dDBZ9rCjc0tPgObWZxByuIoFyBMwqTDSbhITwQ
         K9B7ejiJw3VnbdvA97A2+eZOqYxHizdn9zqL645jQhXgUmzqBARVAvLj2Qvtyd+NyHCP
         PvxweOizi8WVF+xHY5pHzvz0peYZxy1MYewdFbPR6InhjlGGq19ncUg3WvrrS34bqsNc
         98TQ==
X-Gm-Message-State: ANoB5pkwUPE9dsMoEvZBTaM4O+8/dculaKA600n31gQ6/jZ8lDfZyG9V
        i8dDjbtI4cmbnm6/Uc9PwdJxWQ==
X-Google-Smtp-Source: AA0mqf6e0V5cyzuQVnmo3+VDdnyGXkJJQYSq2sazXpK3+UW/Q2Eyvend6VivEcYnbLjW/oERBYo79w==
X-Received: by 2002:a05:600c:4386:b0:3b4:6c36:3f59 with SMTP id e6-20020a05600c438600b003b46c363f59mr8494400wmn.100.1668448099676;
        Mon, 14 Nov 2022 09:48:19 -0800 (PST)
Received: from [10.211.55.3] ([167.98.215.174])
        by smtp.googlemail.com with ESMTPSA id n41-20020a05600c502900b003c65c9a36dfsm13340057wmr.48.2022.11.14.09.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 09:48:18 -0800 (PST)
Message-ID: <2f827660-ae9d-01dd-ded8-7fd4c2f8f8ae@ieee.org>
Date:   Mon, 14 Nov 2022 11:48:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net-next 1/5] dt-bindings: net: qcom,ipa: deprecate
 modem-init
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alex Elder <elder@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221112200717.1533622-1-elder@linaro.org>
 <20221112200717.1533622-2-elder@linaro.org>
 <de98dbb4-afb5-de05-1e75-2959aa720333@linaro.org>
Content-Language: en-US
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <de98dbb4-afb5-de05-1e75-2959aa720333@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/14/22 03:56, Krzysztof Kozlowski wrote:
> On 12/11/2022 21:07, Alex Elder wrote:
>> GSI firmware for IPA must be loaded during initialization, either by
>> the AP or by the modem.  The loader is currently specified based on
>> whether the Boolean modem-init property is present.
>>
>> Instead, use a new property with an enumerated value to indicate
>> explicitly how GSI firmware gets loaded.  With this in place, a
>> third approach can be added in an upcoming patch.
>>
>> The new qcom,gsi-loader property has two defined values:
>>    - self:   The AP loads GSI firmware
>>    - modem:  The modem loads GSI firmware
>> The modem-init property must still be supported, but is now marked
>> deprecated.
>>
>> Signed-off-by: Alex Elder <elder@linaro.org>
>> ---
>>   .../devicetree/bindings/net/qcom,ipa.yaml     | 59 +++++++++++++++----
>>   1 file changed, 46 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> index e752b76192df0..0dfd6c721e045 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> @@ -124,12 +124,22 @@ properties:
>>         - const: ipa-clock-enabled-valid
>>         - const: ipa-clock-enabled
>>   
>> +  qcom,gsi-loader:
>> +    enum:
>> +      - self
>> +      - modem
>> +    description:
>> +      This indicates how GSI firmware should be loaded.  If the AP loads
> 
> s/This indicates/Indicate/
> (or any other grammar without describing DT syntax but hardware/system)

OK.

>> +      and validates GSI firmware, this property has value "self".  If the
>> +      modem does this, this property has value "modem".
>> +
>>     modem-init:
>> +    deprecated: true
>>       type: boolean
>>       description:
>> -      If present, it indicates that the modem is responsible for
>> -      performing early IPA initialization, including loading and
>> -      validating firwmare used by the GSI.
>> +      This is the older (deprecated) way of indicating how GSI firmware
>> +      should be loaded.  If present, the modem loads GSI firmware; if
>> +      absent, the AP loads GSI firmware.
>>   
>>     memory-region:
>>       maxItems: 1
>> @@ -155,15 +165,36 @@ required:
>>     - interconnects
>>     - qcom,smem-states
>>   
>> -# If modem-init is not present, the AP loads GSI firmware, and
>> -# memory-region must be specified
>> -if:
>> -  not:
>> -    required:
>> -      - modem-init
>> -then:
>> -  required:
>> -    - memory-region
>> +allOf:
>> +  # If qcom,gsi-loader is present, modem-init must not be present
>> +  - if:
>> +      required:
>> +        - qcom,gsi-loader
>> +    then:
>> +      properties:
>> +        modem-init: false
> 
> This is ok, but will not allow you to keep deprecated property in DTS
> for the transition period. We talked about this that you need to keep
> both or wait few cycles before applying DTS cleanups.

My intention is expressed in the comment.  Is it because of the
"if .... required ... qcom,gsi-loader"?

Should it be "if ... properties ... qcom,gsi-loader"?

I believe I tested the deprecated cases also, but will do it again.
If I coded it wrong I'd like to fix it (even if "it works").

>> +
>> +      # If qcom,gsi-loader is "self", the AP loads GSI firmware, and
>> +      # memory-region must be specified
>> +      if:
>> +        properties:
>> +          qcom,gsi-loader:
>> +            contains:
>> +              const: self
>> +      then:
>> +        required:
>> +          - memory-region
>> +    else:
>> +      # If qcom,gsi-loader is not present, we use deprecated behavior.
>> +      # If modem-init is not present, the AP loads GSI firmware, and
>> +      # memory-region must be specified.
>> +      if:
>> +        not:
>> +          required:
>> +            - modem-init
>> +      then:
>> +        required:
>> +          - memory-region
>>   
>>   additionalProperties: false
>>   
>> @@ -196,7 +227,9 @@ examples:
>>           ipa@1e40000 {
>>                   compatible = "qcom,sdm845-ipa";
>>   
>> -                modem-init;
>> +                qcom,gsi-loader = "self";
>> +                memory-region = <&ipa_fw_mem>;
>> +                firmware-name = "qcom/sc7180-trogdor/modem-nolte/mba.mbn";
> 
> Isn't this example based on sdm845?

Yes, you're right.  I'll update it.  I just wanted to supply an
example that actually showed using all these properties.  I'll
make the whole example be for sc7180.

Thank you.

					-Alex

> 
>>   
>>                   iommus = <&apps_smmu 0x720 0x3>;
>>                   reg = <0x1e40000 0x7000>,
> 
> Best regards,
> Krzysztof
> 


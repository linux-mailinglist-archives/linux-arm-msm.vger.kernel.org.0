Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37207695343
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 22:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjBMVlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 16:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjBMVlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 16:41:23 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9834B6592
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 13:41:13 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id w3so7824911edc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 13:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXb2wBOT0LurWdGsoyTt17ekBKNUZrsqRtveFQNt4nQ=;
        b=z1v7IJ/L49vgAuqUVJCPTCh16RYIOgtH3JfOPSjlP7iw0RmPuutgOY/F6FqTkuEEG5
         Q9z0i7bJk3fbSz/QN+5noH1x8n9yQyRip8muvcDr810PHPV7+4+KjBinZZ38nD6piQ9K
         1utxwIiBdPSJrS7wFbD+h/+N3QvZbjP62ixkdYcFKEOnyEGMl95tpBUa3RKRa7KIpKB7
         12Dg4jEBDJLHvX8aIqFO5n4VQDZzuTbbxCXUIhX91hrm0LBRUMM7kQ06ddjkwKwJXhry
         sH9s68W1MKnA/6bIeBJ8U/Hne71xCtKVrvVvFszbeNXWG70UGgYznCOA2mNyWNu9ja4R
         nDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXb2wBOT0LurWdGsoyTt17ekBKNUZrsqRtveFQNt4nQ=;
        b=hcvOa/OllWWxVJ4eZTFAtRF6dY6LcdkXDplvyJs1mihhuay//i6klpYJLiW0DkPJPa
         oF/Pv8o6R+Pm2BXi+YXS+ao0A+e5RaoMjw2YR6ia7r3zptVK2UAYCUyPbkMUz+xtG8gB
         5OzjCYG7ON3u0hRITETn002HVlWmB7/dcEpdTQDkFzuMA2vo47rzV10H+wqP964y+J4j
         eEhUnMy0tEoYkaC2Fs/eYuYBJFvQCBT4iuAN6uu6x7pBTgPyCZHpdExdtWJC3U+S+zIF
         swT03WZS2bGMKwmq4FSrZoZBGDyqsopkIIiEjh7JvN6SAQLie+My4fT+dmzd0OOq/cTw
         T3yg==
X-Gm-Message-State: AO0yUKXcC/84Nbp92Ig2xtxGNWsx5PELMu7ebrcyew6dvqFbMlYzm29B
        V5Grvl5GJQGS8ztHn9C0fXtNFg==
X-Google-Smtp-Source: AK7set9aQzXbOVQSMzQenYRV6W4FxrtJ/vxZGkwXVcVSbKAUnD68l0E6Z8ccUd7qwBPKUVhGbIhExg==
X-Received: by 2002:a50:d617:0:b0:4ac:c29d:5c4a with SMTP id x23-20020a50d617000000b004acc29d5c4amr137942edi.29.1676324472163;
        Mon, 13 Feb 2023 13:41:12 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id m2-20020a509302000000b004aad8d2158dsm7157131eda.66.2023.02.13.13.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 13:41:11 -0800 (PST)
Message-ID: <83637cc7-21ae-7778-37b3-4522cc0a06c9@linaro.org>
Date:   Mon, 13 Feb 2023 22:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] dt-bindings: power: supply: pm8941-coincell: Don't
 require charging properties
Content-Language: en-US
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230213204950.2100538-1-konrad.dybcio@linaro.org>
 <20230213204950.2100538-2-konrad.dybcio@linaro.org>
 <20230213212733.rhvuzrshfrvzgo4a@mercury.elektranox.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230213212733.rhvuzrshfrvzgo4a@mercury.elektranox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.02.2023 22:27, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Feb 13, 2023 at 09:49:49PM +0100, Konrad Dybcio wrote:
>> It's fine for these properties to be absent, as the driver doesn't fail
>> without them and functions with settings inherited from the reset/previous
>> stage bootloader state.
>>
>> Fixes: 6c463222a21d ("dt-bindings: power: supply: pm8941-coincell: Convert to DT schema format")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
> 
> Please update the description of these properties to describe the
> default behaviour.
Not sure if there's any default behavior other than "go with
whatever was there previously, no matter how it got there".

Is it okay if I just add:

"If unspecified, inherit the bootloader configuration"

?

Konrad
> 
> -- Sebastian
> 
>>  .../devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml  | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml
>> index b7b58aed3f3c..d62e3af55560 100644
>> --- a/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml
>> +++ b/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml
>> @@ -43,8 +43,6 @@ properties:
>>  required:
>>    - compatible
>>    - reg
>> -  - qcom,rset-ohms
>> -  - qcom,vset-millivolts
>>  
>>  additionalProperties: false
>>  
>> -- 
>> 2.39.1
>>

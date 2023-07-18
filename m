Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2B47573A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 08:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjGRGJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 02:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbjGRGJ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 02:09:26 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB0110A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:09:25 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so8435844e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689660563; x=1690265363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86IjmM7p82pa8pS02wHCCMR8Mx3WqXRMqAhbbiD/ZKw=;
        b=jeWgMqzSlbZh6d2AUuYz7bI9PWQP5+iPZQ8T3yYMOKHmVNE6gtlJfeVAi921OgLY8I
         W5NxLvBpW7b0ast+6hb3RR2XFhUb5OJOPEI+Mmv8YFyI0syo3N30gi9xPagATuqmNscr
         StAFF83t38X9IpnspbxDp6FN11jvMFLAOqhW0ofqFAR6Rl5Rh42eNiZOZ6Oy0WcF+pkO
         knLT6VTWxVmP+faLb7/Zafzn89QdNQMZCI8EaLWlJHdQFXykaqSV8J33P4h2R1qXH/Q0
         MUwNsqK0Mvrqm3jiTLxdbkbYrC0klQoGTJ1y8s1HAJuHy5kbKmuL/IIQIQBP8Jbw9BMw
         FEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689660563; x=1690265363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86IjmM7p82pa8pS02wHCCMR8Mx3WqXRMqAhbbiD/ZKw=;
        b=OYdmmXw73jSK/qDDhIw7ohc8xh2Gq0hsI+kl4WKQ081IH+BUt3tgKXc+MF+R6a6bCm
         vNWPzuQJ5mYJtHzhcTLZTa+4Bze5zpkNVm/1xuqiD8MIur9yWhH40Ywrh/jaX7rwwdqB
         0dvSFCpJEBCSHhWhoq51naVVqxNfakqC0JuQsScCJT1j9chJahLGsaYJG++vP1/b+Tj2
         tPwghbcYI9vrAIKF1aJkMsAQjMX0N9NehxACAOtU9F0zl1WcXkNuO7fATQ6Yza5GI8I/
         fLANEw4pwbQ5Lu/Nl/qGHorqFR/qQAO9IHsiwymVN7Auep6hrbBtyk7eEP+sxktOuRl/
         Nj7g==
X-Gm-Message-State: ABy/qLYKZ/1oKuaZHzETA2hx/LTirDH/IDajBhNoBCC0yYtONwuWvljN
        iFyytcqk3ZPOrn6zcxbRFJAj9Q==
X-Google-Smtp-Source: APBJJlHT2Ay/ACQOrcVssQRBdrI8/dXrSUgLpM8js1Xu1/vXEBQyMHDJzgMOKvpnFQaxTJCiIJKeLA==
X-Received: by 2002:a05:6512:247:b0:4f8:7960:f72 with SMTP id b7-20020a056512024700b004f879600f72mr7914110lfo.44.1689660563436;
        Mon, 17 Jul 2023 23:09:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f4-20020ac251a4000000b004fcdea129basm277655lfk.94.2023.07.17.23.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:09:22 -0700 (PDT)
Message-ID: <3102d8a1-b89a-440e-7986-fc407d707676@linaro.org>
Date:   Tue, 18 Jul 2023 09:09:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 04/11] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add input and output ports
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        lujianhua000@gmail.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
 <20230515133643.3621656-5-bryan.odonoghue@linaro.org>
 <20230515195949.yemdw4n2pquive2r@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230515195949.yemdw4n2pquive2r@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2023 22:59, Bjorn Andersson wrote:
> On Mon, May 15, 2023 at 02:36:36PM +0100, Bryan O'Donoghue wrote:
>> Add a ports declaration which is optional containing two port@
>> declarations.
>>
>> port@0 to receive an orientation-switch message from the Type-C port or
>> redriver
>>
>> port@1 to subsequently transmit the orientation-switch on once the PHY has
>> finished doing its orientation turn-around.
>>
>> If ports is declared the input port port@0 is mandatory but the output
>> port@1 is optional.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 38 +++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>> index d307343388888..c370b9cd58c2e 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>> @@ -65,6 +65,25 @@ properties:
>>       description: Flag the port as possible handler of orientation switching
>>       type: boolean
>>   
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description: OF graph bindings that model incoming orientation-switch and
>> +      outgoing orientation-switch messages. An example of an incoming
>> +      orientation-switch message might come form a Type-C connector or a USB
>> +      redriver. An example of an output would be a DisplayPort controller.
> 
> Orientation switching is just one of the uses of this graph, and each
> port is both input and output of different signals (orientation switch,
> altmode switch, hot plug signals, signal path).
> 
> 
> How about aligning this version of the QMP binding with the proposed
> binding for 8280xp here:
> https://lore.kernel.org/linux-arm-msm/20230515032743.400170-2-quic_bjorande@quicinc.com/
> 
> Perhaps we could put some of this in a separate yaml and include that?

We are slowly moving towards removal of sc7180-qmp-usb3-dp-phy.yaml. 
Once that is done, this extra include file becomes included from a 
single source. So I'd suggest putting necessary properties into the main 
schema even if that looks like duplication.

-- 
With best wishes
Dmitry


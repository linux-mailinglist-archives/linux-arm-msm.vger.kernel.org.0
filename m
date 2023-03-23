Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEBF6C5FD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 07:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjCWGmo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 02:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjCWGmm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 02:42:42 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED2F2BECF
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 23:42:40 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id cn12so36608582edb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 23:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679553759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8N/XaeLLwIkdvDZKm8o78DXnGxcOUGR0NMOEEQz35z0=;
        b=lDxcvr5ATCpedu3VGnpb8banpvgsvL4WHvd3fdqEdDJDsZqHDcg7SCHK7jD3qBRH0Z
         3HZQvHnKMh+aweQcSYtBE7N/T+2qRPPNQ2KoND9LUsWyY+UL9e7xS+Ts0rZUocfTpOwA
         FkBt8c5WRvUCArdZpRQ7hePy/qmHZARcvgqEsZpUJZFTprDnMS316yoqY1gVWx0j4jY2
         ciR/wP0ABBT71+u6PwJsujNBXS2VUfFL9IWABhqrMsWho6sUaXQv7bAHM36a9+YF7+Bq
         N6uE4wU5DM9P22SquidRpNNCkjRIG86OMQQfhkL8xvSSjOGWHnxSkMehQWLNTgXvZVpG
         8meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679553759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8N/XaeLLwIkdvDZKm8o78DXnGxcOUGR0NMOEEQz35z0=;
        b=Pady1yGuOtbwsm6KhrNLiAnvVKJhr+i9+y2D+by0Wx1RVjZeApUIuzVmkZg2C18FXY
         7Xqm9LRAubswCx/UBJoRmvCV6VjO1njh12J1hZfZEIAUh3+mNNzSxE9oeILKNZf4q4rH
         HbVkx9euZCT3VitebZukgH2UDw5OAhCmw6ahG8Db89lgAf32I5MqFgkde+biB65T118H
         Z1ZCSrwAs+rhVoQ2nRTP6tzBa+foYSBiLaeff8mzljCqKL9kNHEfev5FdluFDHw79S2M
         sg8UPHkjD3x6WhzofR/CmhDIU2+lVxRX31yyNYkqzQAIXO770tRxPveAqddT/xxW2dju
         qXFw==
X-Gm-Message-State: AO0yUKVRFb//7TZeqm17gqNYOSjoLJhbzL0JavNgU7jdAD40CCRDyCbW
        viyDdjHjuJq3o49jmXQhCFYj0A==
X-Google-Smtp-Source: AK7set+yg1lsxvSZGJlZeaAPDUcWbsIyd9m6BF2xr2YnwB6qRVho+nRzalX5J6ERkOZevu0PVgHs2A==
X-Received: by 2002:a17:906:804e:b0:8af:4120:63a8 with SMTP id x14-20020a170906804e00b008af412063a8mr9388515ejw.68.1679553759082;
        Wed, 22 Mar 2023 23:42:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709064e0100b00931baabe36csm8146329eju.63.2023.03.22.23.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 23:42:38 -0700 (PDT)
Message-ID: <a8c3f324-0231-2180-8464-a3bfc663f743@linaro.org>
Date:   Thu, 23 Mar 2023 07:42:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/8] dt-bindings: phy: qcom,qmp-usb: Add IPQ9574 USB3
 PHY
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1679479634.git.quic_varada@quicinc.com>
 <e34d8eddc1dda8bb0ff840a7dd18ca4dd6c62d22.1679479634.git.quic_varada@quicinc.com>
 <c52a329d-8683-de82-9b55-209b99ac36c0@linaro.org>
 <20230323063705.GA19800@varda-linux.qualcomm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323063705.GA19800@varda-linux.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 07:37, Varadarajan Narayanan wrote:
> On Wed, Mar 22, 2023 at 10:52:44PM +0100, Krzysztof Kozlowski wrote:
>> On 22/03/2023 11:44, Varadarajan Narayanan wrote:
>>> Add dt-bindings for USB3 PHY found on Qualcomm IPQ9574
>>>
>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>>
>>> ---
>>>  Changes in v2:
>>> 	- Updated sections missed in previous patch
>>> ---
>>>  .../bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml    | 22 ++++++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
>>> index e81a382..beae44c 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
>>> @@ -21,6 +21,7 @@ properties:
>>>      enum:
>>>        - qcom,ipq6018-qmp-usb3-phy
>>>        - qcom,ipq8074-qmp-usb3-phy
>>> +      - qcom,ipq9574-qmp-usb3-phy
>>>        - qcom,msm8996-qmp-usb3-phy
>>>        - qcom,msm8998-qmp-usb3-phy
>>>        - qcom,qcm2290-qmp-usb3-phy
>>> @@ -204,6 +205,27 @@ allOf:
>>>          compatible:
>>>            contains:
>>>              enum:
>>> +              - qcom,ipq9574-qmp-usb3-phy
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          maxItems: 2
>>
>> toplevel defines minItems as 3, so are you sure this works? Did you test it?
> 
> Yes, this is tested. Able to do I/O.

Bindings do not impact on whether you can or can not do IO, so I meant
tested as DTS is compliant with bindings. I assume it was not, so please
test bindings and DTS before sending new version.
see Documentation/devicetree/bindings/writing-schema.rst for instructions

> We only have 2 items. Is it ok change the minItems to 2?

Yes, because you must update top level (and maybe other) constraints to
correct ones. Just test the code...


Best regards,
Krzysztof


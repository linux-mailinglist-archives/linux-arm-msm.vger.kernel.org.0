Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22B1270617C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 09:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjEQHm6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 03:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjEQHm6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 03:42:58 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D777C118
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 00:42:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9659e9bbff5so67559966b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684309375; x=1686901375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yo1I/1vDP3z13Q3ZEs/apavzcdIdkXn5Cb0/YZeUq7o=;
        b=KPBs9Hn8M/SBgyu7aMwH5VXCe4uD5a/cIVb3YGTROnrt2A0gJO0+6AZ4Jo6DDNtUgj
         eSza3U8S4yvl3xHxjllNps5yNPb+pc1oiJw63OeHecJnHcqUkJq7uozkIQv2G4oZqgc+
         KbCxMse40q4TbxWJhrX9gYY1NGtmIBvBf+mdgiMBYmeSHWZVpISG0TcBmY6A2li4L4j8
         Ojbqj6HrqXWeS+nALmACoPpSuIhO0iOqqsfBWDveCelIVb+cB5WonD9LholknQMXAK++
         J1+eeE4l6v3swThylhxGtLRzPI+lOF8a1fVp8vATmyGSfKlG+hu6I0RWmoSa9hrC44mU
         sW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684309375; x=1686901375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yo1I/1vDP3z13Q3ZEs/apavzcdIdkXn5Cb0/YZeUq7o=;
        b=j97h7/zmwXvWaaCnt/GXiF9fjepIAAB5+NhJx0MmAka97BitowrRwoFRfb6NnVV9jj
         3x+uxJM1XNVv8sA/9N8Sp77J6Ymw/gijdFpGDq/8qhpFyVvtOG1LmnG5HGA2QUAb24mH
         xg+kkrSV9droFhXemetrT7GAmRfNqC7vkWwp+ejSNqgxTj+E2eDixHA3TjW5BvkZPfzc
         1yG9GXzj0Ljm6smLGnrevFHP1Np9JQWM527bOyqKKQ/TkwcyT7oP4+Imqowv/DfLY+Jx
         h/YnggEQGCbgOfN6MNEoZZ0BVO5nCesN0aJCBYsY83cVo5TTdHoJcUX7UbSYSxk+/VRt
         yHGg==
X-Gm-Message-State: AC+VfDz+DAUcspBaK9cAeK/QHuxnuHoi9xhM4PkvCFb9SEXsZ297CzKa
        nPgtAFZZV7zD5POO+6KnrPLS8g==
X-Google-Smtp-Source: ACHHUZ5Qs9iRKS/sNuzWVap6xMTWzTWQ1o6tT4BpdUrV2MV5ZU1nHgdx0wUzTZSHIwlRIqSR9RJ/LQ==
X-Received: by 2002:a17:907:7da9:b0:966:538f:843b with SMTP id oz41-20020a1709077da900b00966538f843bmr32467875ejc.77.1684309375398;
        Wed, 17 May 2023 00:42:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id k18-20020a17090632d200b009661f07db93sm11841022ejk.223.2023.05.17.00.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 00:42:54 -0700 (PDT)
Message-ID: <10a0c64c-1b56-a1fe-0f4e-3185cce18d1c@linaro.org>
Date:   Wed, 17 May 2023 09:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 09/10] ARM: dts: qcom-mdm9615: specify clocks for the
 lcc device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
 <20230512211727.3445575-10-dmitry.baryshkov@linaro.org>
 <0954a80d-9151-4be3-dcee-e42ddc0b5300@linaro.org>
 <52005148-c0fb-8bf8-80b8-7c1077cced17@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <52005148-c0fb-8bf8-80b8-7c1077cced17@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 19:44, Dmitry Baryshkov wrote:
> On 13/05/2023 12:20, Krzysztof Kozlowski wrote:
>> On 12/05/2023 23:17, Dmitry Baryshkov wrote:
>>> Specify clocks used by the LCC device on the MDM9615 platform.
>>>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm/boot/dts/qcom-mdm9615.dtsi | 16 +++++++++++++++-
>>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
>>> index b40c52ddf9b4..556abe90cf5b 100644
>>> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
>>> @@ -39,7 +39,7 @@ cpu-pmu {
>>>   	};
>>>   
>>>   	clocks {
>>> -		cxo_board {
>>> +		cxo_board: cxo_board {
>>
>> Maybe it is possible now to change the node name to cxo-board-clk?
> 
> This would break compatibility with the possible drivers using 
> "cxo_board" sys name. It seems this is the last platform using old 
> bindings. Let's probably settle that for 6.6 I can go and rename all 
> fixed clock nodes. Would that work for you?
> 

Yes, sure.

Best regards,
Krzysztof


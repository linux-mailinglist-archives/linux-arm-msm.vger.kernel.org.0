Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D327C734F8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 11:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbjFSJWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 05:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbjFSJWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 05:22:43 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58530127
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:22:41 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-988e6fc41ccso29380366b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687166560; x=1689758560;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MdC/fMIPx6UA3s+DVlDK7Rnv9jD9kePiwHfMZxA0SPk=;
        b=f9ppezhmE9Pi/JXsCnVn+ji6HUVnzvck23GDW+NClY3hv86VkJfOdTZliBovaYc+bg
         lve8A18TaQV2VvAI+G8Gyu0QB115aWyNstmw4TP4XDnGQ7M38xh7ON3SAppxwWcsOtgT
         uX9yl54AQo5bvwM/N9UWauhMZw1elnZl0SDIYvcVry2rQJ/ZBHU1QzAX1HeYmRSNqA9R
         OOjxigEVjutT7R8xmF0nbtAr5KyVarT5G80r+2ctkrXmjONKzpvYqUlvEcJJXD1zXImS
         KCZ0k8pPDGYizsw3id7mWJLQxn/GSMYKr/W4stNsG6zMxiayuRHeXrCB2ofMFZZcXBGx
         ceZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687166560; x=1689758560;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdC/fMIPx6UA3s+DVlDK7Rnv9jD9kePiwHfMZxA0SPk=;
        b=LXRM9mpKmXaAxGPAinh2YNDhzkZi6xLm93sbkyjsQfFLkjPAagj3+YpU1fkkZqtXmh
         GPY/10LCSTnokk7TJxzRqs+feNRSdQOgP9R2zmAlstzxgpmsj1dp8+EwB2JINJgzca5E
         HIiFNDXhfTP6ybwQmLbPUiCk6GiNkB9UbIxcstHLyW8uLhVHoPF3n5oY4Va3KB+0vMkK
         WLwYKWsmaZBn/xv6J0ZPdWsgCXCAqZr1HyG4GA+HlaXJXyalE0VR3Jok81A/rx1tKjVq
         9P61/ELMdkQQn4MeGcqeWX9/yFNPNe/umXowQbsct4Y79fZ9xL5CVyM+Oc0JLvaCwHtX
         IUog==
X-Gm-Message-State: AC+VfDzK7JIgMAVr2USBsqd4ND74SQ+HCZy7r3AmJKBxRbfT7JsFBIus
        /L9SS8746A/oC1J5w/HhGChZRxORVDxDTVdV1Pk=
X-Google-Smtp-Source: ACHHUZ5oYBZDGcwLs5tXjzLOJ8wzi3FM5x+RriKV/eKNwxSYs11Uf3t1Fpw/w2jGBQykH6hGXQ5lgQ==
X-Received: by 2002:a17:906:974a:b0:94e:1764:b09b with SMTP id o10-20020a170906974a00b0094e1764b09bmr7786108ejy.45.1687166559810;
        Mon, 19 Jun 2023 02:22:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bg23-20020a170906a05700b0094e7d196aa4sm14309382ejb.160.2023.06.19.02.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 02:22:39 -0700 (PDT)
Message-ID: <c664a9c8-fe32-1c1b-cfe6-22dee4b7b803@linaro.org>
Date:   Mon, 19 Jun 2023 11:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] pinctrl: qcom: sm8350-lpass-lpi: add SM8350 LPASS
 TLMM
Content-Language: en-US
To:     neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230616185742.2250452-1-krzysztof.kozlowski@linaro.org>
 <20230616185742.2250452-2-krzysztof.kozlowski@linaro.org>
 <613aa197-62c7-5a4d-2495-b77d9fc902d8@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <613aa197-62c7-5a4d-2495-b77d9fc902d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/06/2023 10:55, Neil Armstrong wrote:
> On 16/06/2023 20:57, Krzysztof Kozlowski wrote:
>> Add driver for pin controller in Low Power Audio SubSystem (LPASS).  The
>> driver is similar to SM8450 LPASS pin controller, with difference in one
>> new pin (gpio14).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   drivers/pinctrl/qcom/Kconfig                  |  10 ++
>>   drivers/pinctrl/qcom/Makefile                 |   1 +
>>   .../pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c   | 167 ++++++++++++++++++
>>   3 files changed, 178 insertions(+)
>>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
>>
>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
>> index 634c75336983..9c43bc05c447 100644
>> --- a/drivers/pinctrl/qcom/Kconfig
>> +++ b/drivers/pinctrl/qcom/Kconfig
>> @@ -77,6 +77,16 @@ config PINCTRL_SM8250_LPASS_LPI
>>   	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>>   	  (Low Power Island) found on the Qualcomm Technologies Inc SM8250 platform.
>>   
>> +config PINCTRL_SM3550_LPASS_LPI
> 
> s/PINCTRL_SM3550_LPASS_LPI/PINCTRL_SM8350_LPASS_LPI/g

Indeed, thanks.

Best regards,
Krzysztof


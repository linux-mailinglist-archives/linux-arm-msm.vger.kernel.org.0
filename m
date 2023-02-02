Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0AA687FCB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 15:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbjBBOUd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 09:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjBBOUc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 09:20:32 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CECD90382
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 06:20:31 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h12so1833507wrv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 06:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pS0aPM16O7Kh75U1Y5eG1xLy7Ia3+ZONLmeYxbDLQxw=;
        b=W8L6rHoyhYb8/uzptG9nstvT9tFjCW7dAdnYdWk3R+3vriC6/WcjtgydUCs/UpJHs9
         83w295WZPiloCItyOgDizTHx6Mhcjgy54wC5Oj382f+dQQSXCN9IGl0VP7UsErGygUWX
         bQF+31ijE7hzZNtZFf6f67hOE2YiW0jXveZtSGQAB/KUOBubjGxQAXkeO7Wa/ffchtCX
         0LwjxRM7h1FxqsAN4bnu8ceh0ttIUOZySHqI93moqphgQCt5Tu16fqH5qfW2PwVViiw6
         as4CE9sY6DVVASRZ+4OW6RQ2DIMr9x9GNEg2q49ro8R0catjDJqEdr9zGwZna7GHDIqM
         xUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pS0aPM16O7Kh75U1Y5eG1xLy7Ia3+ZONLmeYxbDLQxw=;
        b=czZMrtJOYHWro5Q76tOfwwRq3Ye2GDxKq7oUBJE8fmf4mgoM07uuIQbR+pe6QdJevs
         P9Uch/debvbJ/lmGugqXtS015A7+IY+Ql0tGeMjHpEgu06eyzIjSWYjosEp6aeQpGEJJ
         gqOY3QNyIo8NBDyes00hOFnS2ti2tuO8ihOrWBg/Jv8As4Pufsg+H7BYjKZea4O6Z2oY
         90PjIZSSwTTZOenMw5vq37z0TgcQ3ENAY54r37IwHACqGBY8tdYATkFmXn2RivyaCmWI
         DCSj7Jx/e7IzaSuw+N8/RIuMpr/jEh9LrH8/EkDtUJ0A9Ha7k0dim0DcfCv+rvWyl/Jk
         UIbw==
X-Gm-Message-State: AO0yUKXiralZk8MFfH8Fl+B979F5dA4jySTWFxKoVZOKWzlcMbysxQJ7
        Gz4QDR5u6cUlnslQDt4GTLuKSQ==
X-Google-Smtp-Source: AK7set/2fzWE5H3pwszctXTS/+kBO/DehVcqPFQj+wCSAJtqqkCeuLR7c/Mn9fPkxuEK9SiplUwQIg==
X-Received: by 2002:a5d:678e:0:b0:2bc:aa67:28fb with SMTP id v14-20020a5d678e000000b002bcaa6728fbmr4837590wru.49.1675347629502;
        Thu, 02 Feb 2023 06:20:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p8-20020adff208000000b002423edd7e50sm20198198wro.32.2023.02.02.06.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 06:20:29 -0800 (PST)
Message-ID: <8cf36a4b-2070-2e79-c06d-b0ec06d8b9f7@linaro.org>
Date:   Thu, 2 Feb 2023 15:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 9/9] crypto: qce: core: Add new compatibles for qce
 crypto driver
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Jordan Crouse <jorcrous@amazon.com>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-10-vladimir.zapolskiy@linaro.org>
 <6577abf2-7717-b952-13d7-9143200f24fc@linaro.org>
 <397bcc25-dd5e-808f-a38b-15e6c18db669@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <397bcc25-dd5e-808f-a38b-15e6c18db669@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 15:15, Vladimir Zapolskiy wrote:
> Hi Krzysztof,
> 
> On 2/2/23 16:01, Krzysztof Kozlowski wrote:
>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>>
>>> Since we decided to use soc specific compatibles for describing
>>> the qce crypto IP nodes in the device-trees, adapt the driver
>>> now to handle the same.
>>>
>>> Keep the old deprecated compatible strings still in the driver,
>>> to ensure backward compatibility.
>>>
>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: herbert@gondor.apana.org.au
>>> Tested-by: Jordan Crouse <jorcrous@amazon.com>
>>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>> [vladimir: added more SoC specfic compatibles]
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>>   drivers/crypto/qce/core.c | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
>>> index 8e496fb2d5e2..2420a5ff44d1 100644
>>> --- a/drivers/crypto/qce/core.c
>>> +++ b/drivers/crypto/qce/core.c
>>> @@ -291,8 +291,20 @@ static int qce_crypto_remove(struct platform_device *pdev)
>>>   }
>>>   
>>>   static const struct of_device_id qce_crypto_of_match[] = {
>>> +	/* Following two entries are deprecated (kept only for backward compatibility) */
>>>   	{ .compatible = "qcom,crypto-v5.1", },
>>>   	{ .compatible = "qcom,crypto-v5.4", },
>>> +	/* Add compatible strings as per updated dt-bindings, here: */
>>> +	{ .compatible = "qcom,ipq4019-qce", },
>>> +	{ .compatible = "qcom,ipq6018-qce", },
>>> +	{ .compatible = "qcom,ipq8074-qce", },
>>> +	{ .compatible = "qcom,msm8996-qce", },
>>> +	{ .compatible = "qcom,sdm845-qce", },
>>> +	{ .compatible = "qcom,sm8150-qce", },
>>> +	{ .compatible = "qcom,sm8250-qce", },
>>> +	{ .compatible = "qcom,sm8350-qce", },
>>> +	{ .compatible = "qcom,sm8450-qce", },
>>> +	{ .compatible = "qcom,sm8550-qce", },
>> I did not agree with this at v7 and I still do not agree. We already did
>> some effort to clean this pattern in other drivers, so to make it clear
>> - driver does not need 10 compatibles because they are the same.
> 
> Here is a misunderstanding, the compatibles are not the same and it shall
> not be assumed this way, only the current support of the IP on different SoCs
> in the driver is the same.

They are the same for the driver. It's the same what we fixed for SDHCI
and other cases. Why this should be treated differently?

> 
> Later on every minor found difference among IPs will require to break DTB ABI,
> if all of the particular SoC specific comaptibles are not listed.

No, why? Why SDHCI and hundreds of other devices are not affected and
this one is?

Best regards,
Krzysztof


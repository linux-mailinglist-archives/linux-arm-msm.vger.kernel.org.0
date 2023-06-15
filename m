Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F1D7311FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 10:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244675AbjFOIVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 04:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244259AbjFOIUn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 04:20:43 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E5F26AD
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:20:38 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so9555802e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686817237; x=1689409237;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XMlsfgZLwaFXb+N9g5o4MdTI3z1v0qvGTnWntiOQBao=;
        b=oSIC7GffKE130lUEj4jrKtsYhelzdq6evUtya19QotqoHDz7V60LQyUuZIoYUCCDnN
         iCTeT9nwOGybArYq1Z9gt8KhsFMWgR6g4uyFQs7McQiY/Jvl/Kd/egY/9xFzeUzXeiYZ
         zHC+HHUos5I2qQr2t9EohcScyOtKhGFmxh1fUhYhYjXG+KkpQf5eaHTXKI7ahZLJVdz0
         3kNTxX1KXjScNjjbIQzSraeTnNubYv+rEjUfkJyhIbLYM+2Bmlp1SfKOS8qsOgFyiRZc
         sxKO7ERFEYXzMldGFJjibwPKPN2416w8YKmyQdAtbmIpxkSUPtO740gP7tNUpyc8+o8V
         IpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686817237; x=1689409237;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMlsfgZLwaFXb+N9g5o4MdTI3z1v0qvGTnWntiOQBao=;
        b=kh8pIXFgrbLEYw2UoZ9NGLGssUHSOszVUiEplGar/MWPvQ4JJ/81JbLkNn17T9sxk4
         l82MuFKqdZVMpHAyGiUXNzhLXYuQEV0P83/L0LTrSfk1P2G+MsEB4QqCJflIDSZKeNnv
         p97LdOH52rlKuask3BUexWgs1oeICtL6Vr1OfNtJdYEe1lnWZxQbxiIabbTDmSkD16Rn
         n9Mihqnul0+sGBekGh/+V5LdLJ4GsLRxpj3ZDwqHMxkmUR3ztFc1LL5DP43Oh9KMVTfj
         TBR+1UzuCSGplPndYihbZXdi4ab/nOZK+UHowiAwRLUHmlNOs2QWBA1xXWSXF5fKN9Hm
         9AUg==
X-Gm-Message-State: AC+VfDwsUj6m6BEIAX0maVuAQvuhHknuY1tBbW7yCTXxbV5udailxngO
        rFxpD42owKW39qNBZr1SxKIryw==
X-Google-Smtp-Source: ACHHUZ5Nj3PdGNxt6Ji0K419vClPI6VhoNUfiucjsLCBZbaYz1Dm29Yg3AjeJRc312tcPz4Gf4guSQ==
X-Received: by 2002:a19:770b:0:b0:4ec:a18e:f989 with SMTP id s11-20020a19770b000000b004eca18ef989mr7620536lfc.17.1686817237041;
        Thu, 15 Jun 2023 01:20:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f60a:f5e3:7ae:6745? ([2a01:e0a:982:cbb0:f60a:f5e3:7ae:6745])
        by smtp.gmail.com with ESMTPSA id t11-20020a7bc3cb000000b003f60eb72cf5sm19826825wmj.2.2023.06.15.01.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 01:20:36 -0700 (PDT)
Message-ID: <436d1428-9135-d207-7004-82713b015775@linaro.org>
Date:   Thu, 15 Jun 2023 10:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC 4/4] input: touchscreen: add SPI support for Goodix
 Berlin Touchscreen IC
Content-Language: en-US
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230606-topic-goodix-berlin-upstream-initial-v1-0-4a0741b8aefd@linaro.org>
 <20230606-topic-goodix-berlin-upstream-initial-v1-4-4a0741b8aefd@linaro.org>
 <ZIaRoTHar/s5yZAh@nixie71> <a87160e5-b895-3dae-bba0-94fc67c92679@linaro.org>
 <ZIdQ723G8/a0tNEZ@nixie71>
Organization: Linaro Developer Services
In-Reply-To: <ZIdQ723G8/a0tNEZ@nixie71>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/06/2023 19:07, Jeff LaBundy wrote:
> Hi Neil,
> 
> [...]
> 
>>>> +static const struct input_id goodix_berlin_spi_input_id = {
>>>> +	.bustype = BUS_SPI,
>>>> +	.vendor = 0x0416,
>>>> +	.product = 0x1001,
>>>
>>> After having seen these in the I2C counterpart; consider defining them
>>> in goodix_berlin.h.
>>
>> To be honest, I blindly copied it from goodix.c because the vendor
>> driver puts random values here.
>>
>> input_dev->id.product = 0xDEAD;
>> input_dev->id.vendor = 0xBEEF;
>>
>> So what should I set ?
> 
> If there is no explicit guidance from the vendor, I would simply leave
> these unassigned; in theory one would imagine that this controller would
> have a different product ID than other models.

I'll leave those unassigned for now, and perhaps we could find
some firmware info value that could be used here.

Neil
> 
> [...]
> 
> Kind regards,
> Jeff LaBundy


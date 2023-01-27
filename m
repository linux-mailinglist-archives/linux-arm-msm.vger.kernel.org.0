Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03CF167E7F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 15:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232573AbjA0OPX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 09:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233149AbjA0OOx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 09:14:53 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD35834B4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 06:14:52 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id m15so3537116wms.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 06:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GmftcvYGgsTLwwHPFZSM5zQlfuGend+HefHsYGlwVas=;
        b=vA2AtsxSRx1mVRv2cWQrE74AlwW+vCOvbaxlrxMMfAp7paDGDfVt8LNPcchtoZQpGP
         RibDVR6b3t1BVJkFU3nEyMG0FTnGf5+dcN99DGSxlOJAxmQDVI6772L3rrdz84GviUuQ
         8kjUkqANTNFeayDL2EhcPEUOHkcGck5H/RrHgsEVoAlH2ILVa4WLus2nF+TGgNpXFBMv
         Yp+EXY85PVtAg89xRFDW0R3e1h2JqukBPv0VDOyAHgaEoBRRKozzPgiDaWixmwsnP0ra
         HLMY2bYZr9hZczgIl0WAB6/MismzJxB4w8CY8nytsQYsJjpK3ksUmOF0g5CE8KcU474r
         nyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmftcvYGgsTLwwHPFZSM5zQlfuGend+HefHsYGlwVas=;
        b=tGvEXIlKvC5ejrweRjd3WwlZgxXD/D0PoXbAN2F/cfulMEYywCpCLyla/sz7EKEYQ0
         eVXSVB3VumZJ7S3Tt7cnkWGMtY0vuaux4YVIsNWFkeI2Qi2g/fAt6B8SMexk1X5naOgd
         kxECIhiG7Mpo1kaoUxTSHF4DofZ8l3TtQpjBN4XY5+DB8AXh+tI7hNnbclFhCTZYos0g
         IUFLDSPqv5yM2IY4OupqOMULCGoCynUZN8CTSxq6bYfgT9j3vPojoo9738MIpYof4Tyc
         +QJvwSMYu/K5D6IsG662dRxZhF1/pJmqD5P8qH5/ZFTD864QV4RDMQ+RV1cTmygIfY4p
         9btg==
X-Gm-Message-State: AFqh2kq71+cdBFHcr8ackaBumFG0I/SyU472+Yj3z9V8k8qeGP7UTtxj
        ITYy7inoQvE6HBHr7QXr++ePsA==
X-Google-Smtp-Source: AMrXdXvf3lVwseaqfAx6jIKQnZKHyd/vwFF7FkxsEOMN5Ny+GQEFanAZlAi2i396SL3OGw0OGlN77Q==
X-Received: by 2002:a05:600c:34d0:b0:3db:2647:a012 with SMTP id d16-20020a05600c34d000b003db2647a012mr31586839wmq.40.1674828891080;
        Fri, 27 Jan 2023 06:14:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c4e8900b003d990372dd5sm9195533wmq.20.2023.01.27.06.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 06:14:50 -0800 (PST)
Message-ID: <f52c832f-0522-5b3e-8267-cb3dc8da5374@linaro.org>
Date:   Fri, 27 Jan 2023 15:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 17/24] rtc: pm8xxx: add copyright notice
To:     Johan Hovold <johan@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230126142057.25715-1-johan+linaro@kernel.org>
 <20230126142057.25715-18-johan+linaro@kernel.org>
 <Y9Kk/AYBUfnoPCcP@mail.local> <Y9PL73mTJZ3hayur@hovoldconsulting.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y9PL73mTJZ3hayur@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/01/2023 14:04, Johan Hovold wrote:
> On Thu, Jan 26, 2023 at 05:06:20PM +0100, Alexandre Belloni wrote:
>> On 26/01/2023 15:20:50+0100, Johan Hovold wrote:
>>> Add a copyright notice for Linaro and add myself as a (primary) author
>>> of this driver.
>>>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>> ---
>>>  drivers/rtc/rtc-pm8xxx.c | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
>>> index 09816b9f6282..25bdd804b4d2 100644
>>> --- a/drivers/rtc/rtc-pm8xxx.c
>>> +++ b/drivers/rtc/rtc-pm8xxx.c
>>> @@ -1,5 +1,9 @@
>>>  // SPDX-License-Identifier: GPL-2.0-only
>>> -/* Copyright (c) 2010-2011, Code Aurora Forum. All rights reserved.
>>> +/*
>>> + * pm8xxx RTC driver
>>> + *
>>> + * Copyright (c) 2010-2011, Code Aurora Forum. All rights reserved.
>>> + * Copyright (c) 2023, Linaro Limited
>>
>> Is this really useful? The authoritative source is going to be git
>> anyway.
> 
> Sure, but in this case the driver ended up being almost completely
> reworked so I think it is warranted.

Copyright update is an effect of rework, not independent, thus it should
be squashed with the code doing the rework. Copyright updates on their
own do not make sense.

Best regards,
Krzysztof


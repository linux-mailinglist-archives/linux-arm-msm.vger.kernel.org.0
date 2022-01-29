Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABAB74A2DB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jan 2022 11:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiA2KeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jan 2022 05:34:22 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52282
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229866AbiA2KeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jan 2022 05:34:21 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 913C240012
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jan 2022 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643452460;
        bh=yJctG/WbEKzDt8UjZPmXGGg6sG2I4y+2xmJx4o9NfIM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=I3xRoTfxNDGsJcXo0szCLhBJfbVhMZ9iSkx0Yto1VvHYeQVMqyotVJ0dgI7icgPsi
         ziZjc1BFonMY5YXoZRoZfEtM+i8JxZJd8V6bXY0vShlDZ3YBZR0sYQ8Fpq6VajrW6G
         Er4INuKJHvmFdjtW6eCpgH4FW/lbcd/W6/YLCemxcd7FuwJMiGH68uqiPRM/+U9ajR
         4Ltg7tcXEeaUu4Y+0zFMKG6FEx0r7AyZyTd33+q4nzWqC/E5gSuVSgtQqP1305Q++4
         ztM0u/U5Ji/YinaMkwQ+Cz9UqiCgY+6txTwcbLBrZBpjr52sRtfE2STzpt9V7ejCg3
         eBftnpQFsU9tA==
Received: by mail-ed1-f69.google.com with SMTP id w3-20020a50c443000000b0040696821132so4310671edf.22
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jan 2022 02:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yJctG/WbEKzDt8UjZPmXGGg6sG2I4y+2xmJx4o9NfIM=;
        b=mtDzkiZJ/HtwnLm58Rfdd0rgf4VhQJRuQhqOZRNXzxVCqRMIE6sKCniweDwNYdENrU
         XE797Tu5e4CdtcHSBlrUwh4pMmqzUeM2jYXhv/vggExcRCyCR8nbD29oce5Auy5M4wdb
         0xtCg3QbzIVVllQ5v7YP4Gz6z7RzkRaRxS4f0OuF9f4/8nwAqWzFlK4A5CqiImRnniYk
         2p47GsH4kseYBnvfiJIoN076SRnK0pbjRbzvkMTVJCN7mZd8xoOglJZaSfMRHJ2m/FQ0
         zwltINXWiMM+jOTGxapQYLkLuBf5L6/TMtHSp8MliyYaou52P3ScGpXS6VPduzpfHO4s
         X1LA==
X-Gm-Message-State: AOAM532bXRoKuRPxeOym9fJwO9eiaoYpk7xUmV5tJRwcKjuzHEekQM6P
        1VGxaHIku5tDEiMjRQ4h6wCd3h57BJ/Zw7vcxzGkhKgdbKN3LlcnEFTS790PCnNpiQV2kOXoY2I
        KEi0I19uT+3cT0UcM1CvBRMh6G8U/EdJEipytrAw6HHA=
X-Received: by 2002:a17:907:8689:: with SMTP id qa9mr9922392ejc.512.1643452459812;
        Sat, 29 Jan 2022 02:34:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLKRoRavgodJJK+DL1mrgn10jry/0ThIdNitolXq/MH9rqOZ411eDCy2e115iUIrVY0gaEEQ==
X-Received: by 2002:a17:907:8689:: with SMTP id qa9mr9922375ejc.512.1643452459621;
        Sat, 29 Jan 2022 02:34:19 -0800 (PST)
Received: from [192.168.0.70] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id j25sm2104650edp.10.2022.01.29.02.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jan 2022 02:34:18 -0800 (PST)
Message-ID: <ef6c677b-422d-1bb9-385f-6be3d95fafa1@canonical.com>
Date:   Sat, 29 Jan 2022 11:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/8] dt-bindings: vendor-prefixes: add LG Electronics
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, Petr Vorel <petr.vorel@gmail.com>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Max Merchel <Max.Merchel@tq-group.com>,
        Hao Fang <fanghao11@huawei.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean THOMAS <virgule@jeanthomas.me>
References: <YfHlV13Zi4KV+bNT@pevik> <5883435.31r3eYUQgx@g550jk>
 <64ee2334-aa99-7226-8946-84c95676041a@canonical.com>
 <3398674.ElGaqSPkdT@g550jk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <3398674.ElGaqSPkdT@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/01/2022 10:45, Luca Weiss wrote:
> Hi Krzysztof,
> 
>>>>>
>>>>> Have we sorted this lg- vs. lge- ?
>>>>>
>>>>> There are both:
>>>>> arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
>>>>> vs
>>>>> arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
>>>>
>>>> Probably renaming/unifying/correcting prefix in existing compatibles is
>>>> not worth the effort. This would make a mess and affect other DTS users.
>>>
>>> If wanted I can send a patch renaming the Nexus 5 to just LG, this would
>>> adjust both compatible in the file (which shouldn't really affect
>>> anything) and the filename (which probably will affect various scripts
>>> and whatnot used by existing users of the dtb).
>>> Is this something that can be done in mainline or should we rather just
>>> let it be? I'm not sure what the policies there are.
>>
>> The "lge" compatible is already in the bindings, so it should not be
>> changed without valid reason. Imagine there is an user-space code
>> parsing compatibles to adjust some power-management settings to
>> different models. It would be broken now.
>>
>> What could be done is to mark it as deprecated and a add new one:
>> compatible = "lg,hammerhead", "lge,hammerhead", "qcom,msm8974";
>> This should be safe for user-space and allow transition to common "lg".
> 
> What can or should be done about the filename then?

I don't have an opinion on the filename. It does not matter to me. :)
You can change it to "lg" or keep "lge". I don't see much benefits of
changing it but I don't mind keeping it consistent.

Best regards,
Krzysztof

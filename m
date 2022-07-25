Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBD8F580365
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 19:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbiGYRO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 13:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiGYRO3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 13:14:29 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097F213E16
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:14:28 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a23so16699466lfm.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cCyJV9rYrLc8WcGxyE0A3hXgwqRxUfp4sXswGcv/of0=;
        b=mzolmwqyBIQNOyKvcFSzcEvPHmUiYV0Q5X3vWzbZRouR7+MqqsAGkwOVEKVf/S87hz
         IhXzKGWxhVfOA7JEOyd0Af1i1sHKiDUiesiU+xmdZUtbpCKJMF8i7dnWXPVJzInIVV4L
         f5mtbEQl/h6pnJY+KQ/Pct0/ElVpqPqH6JxfO67zMEm+FGIcJD6XCBYJi5WdSrS7VvIm
         OeXgyFe8tsV+8nfOnsc6vtdqMQT49qRgwG5Sx25whA92qmy+ZtfHYAfB4iog/4Y0GDWb
         B4c1xoRxL1GF9JqXykZgXx7mgVmvo5GWGpGhyfNH+dnqQ9Ebn4xYehhAxbOytTsex87B
         3qSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cCyJV9rYrLc8WcGxyE0A3hXgwqRxUfp4sXswGcv/of0=;
        b=gPo4a3yqmh7qJfbQ2eUkEPjSg/AfPVru4D8uw35rPXFHiFo5P8HSNfFmssp5S5Jwrc
         xUtWC4D/6iRXrzhMQTNF/LclwYywgCzzPph14FDPcddB9ymBNTkD75+0gFBXd+Tc8bV/
         qz/CX0PiFi7Li5WQPi6njbYBj1zpwXZaq8sR/l8KMTvpnvqNGUGBSDPSLjlOJ8lHxWj3
         OiPk3q1fdZvFUpYWNF11az75f5ykR3YJIJRUsr6VE05hbOv6Tt4bqiRsDi2i1gOXwP6O
         87LfrQglyH3dpj4ccjSMsEH481hkFyxzm5E5iEUxIY/yOqf4KjBvyS7QsQQEQlvuc550
         KZKg==
X-Gm-Message-State: AJIora+1Lkcb4Jd0ZQB5PpUZXK4EWWtP0C3iNTFAC0Mn3CmMUBqrnb1u
        LeZ8hLmRREHynzEKmDbzrEKd9AEsJcB7z66Q
X-Google-Smtp-Source: AGRyM1tx/itKaPwnZjEnhnkaA+1nu8zHcMselL91062VeqCxQKbBrncaPxrpgNSJceDzEB/FiMtFZQ==
X-Received: by 2002:a05:6512:31c6:b0:48a:7946:b9ec with SMTP id j6-20020a05651231c600b0048a7946b9ecmr4777806lfe.418.1658769266278;
        Mon, 25 Jul 2022 10:14:26 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id r18-20020ac25f92000000b00489d7b42844sm709527lfe.46.2022.07.25.10.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 10:14:25 -0700 (PDT)
Message-ID: <9e012a76-aaab-9525-f3d4-8d84e26325a9@linaro.org>
Date:   Mon, 25 Jul 2022 19:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org>
 <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
 <CAD=FV=WGtDMmB08py8D6jc0cv3xGsn5Rfc0MObQbEV=CiisBYg@mail.gmail.com>
 <76defcb3-8566-286a-d953-54c4a2b04782@linaro.org>
 <CAD=FV=XhYD0U=FAaGV0aLJhZ4LrULXrLptDV7=D8A91Kx=Qkgg@mail.gmail.com>
 <e3eb02f4-daf7-ed69-001f-72a275819af5@linaro.org>
 <CAD=FV=WYshw8tcDb7dRS-CRdH1q2BOp0g74_qKtvKa1Lzo+mcg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=WYshw8tcDb7dRS-CRdH1q2BOp0g74_qKtvKa1Lzo+mcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2022 19:09, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 25, 2022 at 10:08 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 25/07/2022 18:54, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Mon, Jul 25, 2022 at 9:41 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 25/07/2022 18:25, Doug Anderson wrote:
>>>>> Let's look specifically at the device tree file for the LTE board. One
>>>>> way to look at it is that the dts for the LTE board should have
>>>>> compatibles:
>>>>>   compatible = "lte", "wifi-only"
>>>>>
>>>>> The above matches the normal device tree mentality. It says: "hey, if
>>>>> you've got a lte driver for this board then use it; otherwise use the
>>>>> wifi-only driver".
>>>>>
>>>>> However, the above is actually broken for the bootloader use case. The
>>>>> bootloader is trying to pick a device tree and, to the bootloader, the
>>>>> above says "you can use this dts for either an lte board or a
>>>>> wifi-only board". That's bad. If the bootloader picks this device tree
>>>>> for a wifi-only board then the OS will try to initialize lte and
>>>>> things will crash. To go further, if you think about it things
>>>>> actually work fine if the wifi-only device tree says it's compatible
>>>>> with the LTE board. This is why I say it's opposite... ;-)
>>>>
>>>> This is not specific to "bootloaders" but your specific implementation
>>>> of entire chain. How you described it, you have dependent pieces -
>>>> user-space must use the same DTB as bootloader chosen, but bootloader
>>>> makes different choices than user-space. It's perfectly fine to make
>>>> these choices different, but then user-space should not depend on
>>>> something which was/was not initialized in bootloader.
>>>
>>> I think there's a misunderstanding here.
>>>
>>> Currently the ChromeOS bootloader doesn't use the device tree to
>>> control its flow at all. ...but the ChromeOS bootloader is in charge
>>> of picking the device tree to give to the kernel.
>>>
>>> Specifically I'm not aware of any mechanism in the kernel where you
>>> can give it a pile of device tree files and have it pick the right
>>> one. I believe that the official ABI says that it's up to the
>>> bootloader to provide the device tree to the kernel. This is right out
>>> of `Documentation/arm64/booting.rst`
>>>
>>> A FIT image is, as far as I'm aware, a standard way to bundle a kernel
>>> together with many device trees. The idea here is that the bootloader
>>> should grab the kernel out and whichever device tree it decides is the
>>> right one. It should then boot the kernel and give it the correct
>>> device tree.
>>
>> So that's the same case if you had a device called "Foo" (google,foo)
>> with a Qualcomm sdm845 processor (qcom,sdm845) and have a DTS like:
>> "other-company,bar", "qcom,sdm845"
>>
>> Bootloader on Foo sees "bar", ignores it. Then it sees "qcom,sdm845"
>> compatible and is all happy! It loads the DTS and passes to the kernel...
>>
>> You cannot do that...
> 
> The bootloader never falls back to just the SoC name.

There is no "SoC" part of compatible list. Only by convenience we put it
that way, but DT spec does not define first compatible to be for
platform because they all are[1], therefore following your earlier
description - bootloader should load BAR DTS on FOO device just because
qcom,sdm845 matches.

[1]
https://devicetree-specification.readthedocs.io/en/latest/chapter3-devicenodes.html#root-node

Best regards,
Krzysztof

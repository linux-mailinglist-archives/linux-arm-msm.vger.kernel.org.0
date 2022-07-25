Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6703C580351
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 19:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236622AbiGYRIH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 13:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236626AbiGYRIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 13:08:06 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777411EAD8
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:08:00 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id p21so6239621ljh.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DzveyPTY4hmiSmoyRfUu6e6tXXU3cn9CrLguiTRn+XU=;
        b=kGpBjoO/ep/utYbEuW9UMuLPmjvMBgVH72O19Nh+qjQtEmJ6Y/R4SsfuNE6+46NIBA
         fDk6yvD8uYUzRD40wc8Oj1WIiFoK7qRJhb45cDQJlJCSuzdddB47EBbi3er9bsEaXAZY
         KzZFmV4vS98IKZPGwzeiO/5KkVPmd+7aua4RzedaFTS58MFU1yeV/kfaZYn9SUPc2+hY
         adecsQ5alHogfwIvzw7nSchO6n2WxrGr6963WHq2MWjSV6x/cvjH55yObpCEg/mptHkg
         9RXGlXmPLAmm6LaexQeC6a5DFBI+DizpAmdxGw5ewwDgdRL9eSaT7AhbZZaCS7g38VkR
         jmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DzveyPTY4hmiSmoyRfUu6e6tXXU3cn9CrLguiTRn+XU=;
        b=kBy6umrmbCTfJd1Tgg7nuZAhXcX4qet9vJxN9bUeckp/h/H4Lqv79B3iMdLEiSuz5D
         Gk24FuI1O4WBe1KogpGbuupRJUM6nOUAZ4kR27ZX1s2xxfPVuO2gsTIP9o15nNARWHd/
         qk7UuVsG4FWwjiKXhCu1aqjwBMix2wXpN/T0waZOzrRk8qWALNWUyWri6zQ0bihdoMmI
         etb97IUMJWBN/oVKPv/qU3m+rheInMTSK4u3qlRuUjw4UVzr+BSvinX947ctbfkfopI+
         wWZ22JpJMWPg2n8NQKmCxeM5I55XjUHmSQUW6u0cIMqzhgRzD9NBBxSpGl23zwITj3uU
         INdg==
X-Gm-Message-State: AJIora8AoPN+iomd9Frm4R77sx36f0YRMVTnnAwQrWHW81LwZFIqiFI6
        nOPWXj0nmv2Yf0OhADZhFEOo9w==
X-Google-Smtp-Source: AGRyM1uUjiN3Z98xmBtuJv5XxnhG/iEN6ojTY0n7gXI/mHub97/I6iRit0bHYsefvUOQf9uUKBcMmw==
X-Received: by 2002:a2e:9e9a:0:b0:25d:8553:d794 with SMTP id f26-20020a2e9e9a000000b0025d8553d794mr4388106ljk.22.1658768878333;
        Mon, 25 Jul 2022 10:07:58 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id h1-20020a05651c124100b0025df2654179sm1980256ljh.36.2022.07.25.10.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 10:07:57 -0700 (PDT)
Message-ID: <e3eb02f4-daf7-ed69-001f-72a275819af5@linaro.org>
Date:   Mon, 25 Jul 2022 19:07:56 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=XhYD0U=FAaGV0aLJhZ4LrULXrLptDV7=D8A91Kx=Qkgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2022 18:54, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 25, 2022 at 9:41 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 25/07/2022 18:25, Doug Anderson wrote:
>>> Let's look specifically at the device tree file for the LTE board. One
>>> way to look at it is that the dts for the LTE board should have
>>> compatibles:
>>>   compatible = "lte", "wifi-only"
>>>
>>> The above matches the normal device tree mentality. It says: "hey, if
>>> you've got a lte driver for this board then use it; otherwise use the
>>> wifi-only driver".
>>>
>>> However, the above is actually broken for the bootloader use case. The
>>> bootloader is trying to pick a device tree and, to the bootloader, the
>>> above says "you can use this dts for either an lte board or a
>>> wifi-only board". That's bad. If the bootloader picks this device tree
>>> for a wifi-only board then the OS will try to initialize lte and
>>> things will crash. To go further, if you think about it things
>>> actually work fine if the wifi-only device tree says it's compatible
>>> with the LTE board. This is why I say it's opposite... ;-)
>>
>> This is not specific to "bootloaders" but your specific implementation
>> of entire chain. How you described it, you have dependent pieces -
>> user-space must use the same DTB as bootloader chosen, but bootloader
>> makes different choices than user-space. It's perfectly fine to make
>> these choices different, but then user-space should not depend on
>> something which was/was not initialized in bootloader.
> 
> I think there's a misunderstanding here.
> 
> Currently the ChromeOS bootloader doesn't use the device tree to
> control its flow at all. ...but the ChromeOS bootloader is in charge
> of picking the device tree to give to the kernel.
> 
> Specifically I'm not aware of any mechanism in the kernel where you
> can give it a pile of device tree files and have it pick the right
> one. I believe that the official ABI says that it's up to the
> bootloader to provide the device tree to the kernel. This is right out
> of `Documentation/arm64/booting.rst`
> 
> A FIT image is, as far as I'm aware, a standard way to bundle a kernel
> together with many device trees. The idea here is that the bootloader
> should grab the kernel out and whichever device tree it decides is the
> right one. It should then boot the kernel and give it the correct
> device tree.

So that's the same case if you had a device called "Foo" (google,foo)
with a Qualcomm sdm845 processor (qcom,sdm845) and have a DTS like:
"other-company,bar", "qcom,sdm845"

Bootloader on Foo sees "bar", ignores it. Then it sees "qcom,sdm845"
compatible and is all happy! It loads the DTS and passes to the kernel...

You cannot do that...

Best regards,
Krzysztof

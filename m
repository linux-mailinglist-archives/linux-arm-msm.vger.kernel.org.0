Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A663358037F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 19:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235791AbiGYRZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 13:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiGYRZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 13:25:28 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371FE63F2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:25:27 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id m9so13900157ljp.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8Cy5ZEzm4UosBkwWH9FPdMaEPIxgSh9u8IItSKilLHA=;
        b=rZZCyK3nhD4yuZwoBuELKirkQKTpqBiRTisy6z5I8dX3AH0h5xPcyGbVVcbDM5zR3f
         +0XaSQdsunH8lVSp2Sa4ZuhJGxhq8JoBE5U9FI9kp7Yf73v1+OBN90j0oks/IvGrq6Pl
         oQXtuUpRO/ElCp49GTk025cMCdtLYYzHx/UBFVNM/HZiOBn2y7sV+LzIX+ZHWlVkPC9z
         ZzinYgl/v/L2G4IAOQhbj0k4e2NN+Bcjar5/zo96M873M6JY4GaW8gMspE4z+bf5yDuh
         4FqD5QhvojOQuvPyv9ws3ahI+jRgizDD7ac+SN2e158nSnrKK6RiEFlKznuhjoQ23sh8
         ab4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8Cy5ZEzm4UosBkwWH9FPdMaEPIxgSh9u8IItSKilLHA=;
        b=28casqeeFXK5iUBZC9ONm1PA5x4xxxfgK1ZKCffylNTpjnNKQMd24EhdJivCscDwRK
         OlzbkNgGiv87dhekCRPKdVqrFlH6M3QHWOCHBRmjzSmuIxxDattAbcjcrPkMdXzyX8gY
         Qon5XosNlQiA6fhvOAiZMBs9umyUE3YbZstgrQ4E/mBkw+afJbmVilRqu+x8I/j3cwvx
         RQknox5qRvVCEtoxB+usYnebf64b+6o35RX4W2rzhSXUfjW8kIVnQZMwDZEy81fKyD9c
         RR7EG64trMvB5xBH6/5YDNSzFZrNgf09hKePnB85niBJ/Hi1qq42LOF56edSWSAg1nGF
         k+Tg==
X-Gm-Message-State: AJIora9T1Q4WGH5vQXpJM1U4y/zgqVD0n6lLCVcdGY9/NPNYa5EqQl0Y
        OYq/icN0x0PSnhzCLaz4MX9UFQ==
X-Google-Smtp-Source: AGRyM1sj/br5sY/87AKlW1/4dw+/URZ8z1DJpOWig9p+Y20Ltk5uIJ9iL0dVUlhovjrfOZkPziXw8w==
X-Received: by 2002:a2e:3c0a:0:b0:25d:f5fa:7b2c with SMTP id j10-20020a2e3c0a000000b0025df5fa7b2cmr4840555lja.233.1658769925416;
        Mon, 25 Jul 2022 10:25:25 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id s5-20020a05651c200500b0025dd8b42c64sm1316313ljo.79.2022.07.25.10.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 10:25:24 -0700 (PDT)
Message-ID: <91c01704-c3ef-06f3-ed6c-c35408c93b7c@linaro.org>
Date:   Mon, 25 Jul 2022 19:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org>
 <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
 <62982c58-2a06-0005-cb2f-ec78913da8e1@linaro.org>
 <CAA8EJpratkeg3wpHZxsXavDzO-Gq9wnumVw6dwy7Qa6+YRdhUg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpratkeg3wpHZxsXavDzO-Gq9wnumVw6dwy7Qa6+YRdhUg@mail.gmail.com>
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

On 25/07/2022 19:13, Dmitry Baryshkov wrote:
> On Mon, 25 Jul 2022 at 19:18, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 24/07/2022 00:50, Dmitry Baryshkov wrote:
>>> On Sat, 23 Jul 2022 at 20:48, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 23/07/2022 11:09, Dmitry Baryshkov wrote:
>>>>> Describing each compatible board in DT schema seems wrong to me. It
>>>>> means that each new board is incompatible by default, until added to the DT
>>>>> schema.
>>>
>>> s/incompatible/non-valid/
>>>
>>>>
>>>> The bindings do not document something because it is or it is no
>>>> compatible. They document the compatible. Your patch essentially removes
>>>> the documentation, so there is no point in having compatibles in board
>>>> at all...
>>>
>>> I do not quite agree here. Please correct me if I'm wrong.
>>> Schema defines which DT files are correct and which are not. Which
>>> properties are required, which values are valid, etc. So far so good.
>>
>> Schema is a tool, we create here bindings. The bindings document what
>> you wrote above, plus compatibles and any other pieces mentioned in DT spec.
>>
>>> For the device nodes it declares (or is willing to declare) all
>>> possible compatibility strings. There is a sensible number of on-chip
>>> IP blocks, external chips, etc. Each and every new chip (or new IP
>>> block) we are going to have a yaml file describing its usage. Perfect.
>>> For the machine compatibility lists the arm,qcom schema declares which
>>> machine compat strings are valid. And this looks like a problem. Now
>>> for the DT to be fully valid against DT schema, we have to define its
>>> machine compat string.
>>
>> Although one of goals is to have schema compliance, that is not the
>> reason why we document compatibles. Compatibles were documented long
>> time ago before DT schema came, because the bindings require it.
>>
>> Bindings define the interface between the DTS and software which uses
>> it. SW is kernel, bootloaders, user-space and some more.
> 
> I completely agree here.
> 
> From the point of HW/SW interfaces maybe the following compat lists
> would make more sense:
> - "xiaomi,msm8996-phone", "qcom,msm8996"
> - "qcom,qrb5165-iot-platform", "qcom,sm8250"
> - "qcom,sda845-iot-platform", "qcom,sdm845"
> - "inforce,sda660-sbc", "qcom,sda660"
> 
> etc. IOW, describing the kind of the device, not the exact name/model of it.

With a specific compatible (covered by pattern), this could work,
although not sure what would be the benefit. Other components, like some
user-space or bootloader might still need the specific compatible.

And if anyone needs a specific compatible, it means it should be documented.

>> To summarize, you propose to not document board compatibles. This is not
>> what we want, because then the next step is - let's don't document SoCs.
>> If you do not document it, means anyone can uniliteraly change it, e.g.
>> in kernel DTS, which will break all other users (e.g. user-space or
>> bootloaders) parsing the compatibles. And before you say - no one parses
>> the board compatibles - let me just say that several user-space
>> (embedded/closed) parse them, bootloaders parse them (U-Boot, Google's
>> Chromebooks and others)
> 
> Yes, I know. And in the case of e.g. Google ChromeOS bootloader it
> might make sense to declare compatibles using patterns rather than
> enumeration.

Patterns would simplify here a lot but also would allow (thus not
validate) incorrect combinations. Consider Ssytem-on-Modules:

oneOf:
 - items:
   - {}
   - foo,som-msm8996
   - qcom,msm8996
 - items:
   - {}
   - qcom,msm8996

what stops anyone to have a DTS:
"xiaomi,msm8996-phone", "foo,som-msm8996", "qcom,msm8996"
? even though it does not contain that SoM from company Foo?

For DT schema it would be a perfectly valid combination, even though it
would not make any sense. We document valid machines/compatibles as
documentation of the interface but the schema also allows us - with that
documentation - to actually check if DTS is correct.

One more use case are the the qcom,board-id and msm-id properties. They
might once be restricted to specific board compatibles, because maybe
only the closed-bootloader platforms need them. We don't want these
properties in general, thus we might decide to prohibit to use them in
open platforms (e.g. using open bootloader). Without board compatibles
we won't be able to do it.


> Anyway, thank you for your comments, let's continue with documenting
> all the devices until something changes.
> 


Best regards,
Krzysztof

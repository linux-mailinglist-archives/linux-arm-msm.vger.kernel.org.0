Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE455F21C5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Oct 2022 09:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiJBHvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Oct 2022 03:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiJBHvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Oct 2022 03:51:18 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438A12D1C5
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Oct 2022 00:51:16 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 10so12672870lfy.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Oct 2022 00:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=STJ01Gao9g5t8gnhH3jOtPDbuLYa5At8maC1m1k/RAg=;
        b=EK4840kCGWv0R2n+q8N7PKmpcvNeFViB+Boy4y8aPK2FFThtd0IcwJd6NjSpoBdvjr
         WUoTzXml6INMr5f8hdU79Pwv7z7pPYpI4NNh1qpdV3Be1wt3IBKnJ8K5CnCModK0oluB
         fXntHGmXVlYua2aGVKjHpYCPsrcwjtWIwC3RY051HyW5wX37q7XvSEfC5sbog7GjWzq3
         OnXdc5GLT6IPXq12d9T/8ll+dI+6SAAhyuu4yOpbWLcf2Bm72qjAucP5inE+emoADmiK
         0nOxZgqKN+aCRNixTPa2kDjUsLB7d0I8fj9BYCCUY3MmBmqGtoN79nnPj+ULURvX2Ta1
         +B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=STJ01Gao9g5t8gnhH3jOtPDbuLYa5At8maC1m1k/RAg=;
        b=mpI7dmfzUWwgwiurX4uRGe8GGVhLTNDAEVsRrOTVWqFvDZ7o8ar+juaoGuSxOQuuEr
         FDE5fpbsiU6X6BS7QkfJkaUSkilNKY6wOK3WuL0TOTnvYEqCnFP3B1y6GfSGMjuOu+U7
         N0n5xCmy/n1HBkUK/L91mw9djcwvX1izPSRhNfUTJtnwVViq6RImZcNq/juL0HAye6Ks
         GJoPXsL8eUNUXXwnEAGDA9fnid6xJadQxA/1FjoalzTLKIk87iZbNbMm62EOdSodyChZ
         tBnF1GN9Nn6As8OxNKDjW+GDh2MK6ffFFn19dbpKyjVh9qX0zS2DxiJLqDTNc/OmC7cb
         5hRg==
X-Gm-Message-State: ACrzQf0PAlYy1YnzvBQLeHic+hoYRUkpYRAu00cr6YpLgRXAkCdzg/Ox
        6y4/gzhRcU4UdUBFl69FGa/OYhL7CPAWJQ==
X-Google-Smtp-Source: AMsMyM5yoKyjkOuUSMerxT4cA/XdMS1H0df/M1VxMU7Hz3io7DKgXo79g1HZG/Du6+VJJIM0bSBlnQ==
X-Received: by 2002:a05:6512:10cf:b0:497:a97f:faf3 with SMTP id k15-20020a05651210cf00b00497a97ffaf3mr5324574lfg.60.1664697073893;
        Sun, 02 Oct 2022 00:51:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g19-20020ac25393000000b0049944ab6895sm1000689lfh.260.2022.10.02.00.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 00:51:13 -0700 (PDT)
Message-ID: <35d29103-98ff-cfb0-a354-90a36f52fb43@linaro.org>
Date:   Sun, 2 Oct 2022 09:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: msm8992-lg-bullhead-rev-101 resets in initramfs
Content-Language: en-US
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ilya <ilya.manyugin@gmail.com>
References: <CAB1t1CzwhBL3qu6GQZPwXBQG2YwFn9B+Aqi=81xgfA_2BCm=4A@mail.gmail.com>
 <CAB1t1CxNcKBQ8wFGQmSupA1ix0C9hOUYPN6Sa-ACFcG_b9mY3w@mail.gmail.com>
 <9acde2c8-ebd2-f603-c6df-98af9ba1c80d@linaro.org>
 <CAB1t1CwXh3t4xEL6DvRBVs1q8OX_dOwN2-bR_CWjMQhozSPC0Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAB1t1CwXh3t4xEL6DvRBVs1q8OX_dOwN2-bR_CWjMQhozSPC0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2022 19:10, Petr Vorel wrote:
> On Sat, 1 Oct 2022 at 10:52, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 30/09/2022 23:39, Petr Vorel wrote:
>>> I'm sorry, forget to add links.
>>> Petr
>>>
>>> [1] https://gitlab.com/-/snippets/2420133
>>> [2] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketos-mkinitfs/init_functions.sh#L514-523
>>> [3] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketos-mkinitfs-hook-debug-shell/20-debug-shell.sh
>>> [4] https://gitlab.com/-/snippets/2420128
>>>
>>> On Fri, 30 Sept 2022 at 23:30, Petr Vorel <petr.vorel@gmail.com> wrote:
>>>>
>>>> Hi all,
>>>>
>>>> [ sorry for sending mail twice, now as plain text. I should move away
>>>> from gmail.com to something which allows to use mutt... ]
>>>>
>>>> Some releases after 5.17 bullhead rev 1.01 started to reset.
>>>> I'm not sure which kernel version it started, because it might be
>>>> caused by kernel config or dts changes.
>>
>> I propose to try to bisect it to specific commit in Linux kernel.
> Hi Krzysztof,
> 
> thanks for a suggestion, that's what I do for a non-embedded kernel (e.g.
> x86_64, ppc64le, or even aarch64 used on server), because these works on
> defconfig. But on qcom bullhead and angler devices, last few months I've come
> across to few broken boots, although some of them were regressions others
> depends a lot on particular config.  And since last 2 or 3 kernel releases it
> does not even boot on defconfig. It's quite frustrating to bisect with cross
> compilation (takes time) to realize that it boots with custom config. Last time
> it took a week and I tried to find what actually caused phone reset,
> unsuccessfully. That's why I'm asking before wasting more time.
> 
> Of course with no suggestion I there is no other option than to do
> bisecting again.

I understand that false positives/negatives due to config changes are
frustrating, but what stops you from using all the time your custom
config? I was bisecting on embedded devices many times and the only slow
parts in my case was booting device over network and few builds (like 6
out of 12 steps, rest is fast due to ccache). There is basically no
difference (except that booting over network) when bisecting on VM or my
boards. Cross compilation does not take any more time than regular
build, so maybe your setup could be improved?


Best regards,
Krzysztof


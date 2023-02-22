Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1D069FAEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 19:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbjBVSVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 13:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbjBVSVg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 13:21:36 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987D23C78B
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 10:21:34 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o4-20020a05600c4fc400b003e1f5f2a29cso7250915wmq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 10:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsxS40ms5lLtNze6ykBVmbXz3ZFlmjf74kZVLXUdqOo=;
        b=TjWtYqGXTv/6K+iGSjdzptcbIWg9ggxlDhCvK1lRPbTz4RruOy/xRimoUb5gKGK39e
         C5i6cOxIizIfuMIm322MTGspLxnZ2awFH/OgYi28ZoCcfCzoIyyv+MxwlNDJZFyfEwU1
         0eB7U4TcOO9xt7oA//tfLWoJ/yhRYeJKzE5f6llFzq2+XDT39GCfF7b9p/oNWQEVCiTg
         HBjwNF6yY/qqvWEIGn8yy7Ut/vwsBqfBiRcw7wpigWctG2fdn9FYu9a2gXGKzDtDjjoq
         6juAHfP+zWnvALJeyDn8OLrnes+Xo+xK09oFUJJSSAETl2ukqkBrm6LqOs9d4TrNvRt0
         dSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsxS40ms5lLtNze6ykBVmbXz3ZFlmjf74kZVLXUdqOo=;
        b=JkhHvWSVpwFdR4KXGjYkMDP19wISs+VU9lwtX9RLCdqoAwEaSOuEcH4uVjnMyjMZx5
         fQVn+G3myyS5IpYf01TauvqhGNSAtkG3v9fkpiYqm17rcKt5f+VK410RujhYyooL7oi0
         UiDvBkZ7kv2gUUatWhcE7dj3iWA3jYschyISvi67ttT4XOMY3NAM7Clp8AJJbN6R2DeK
         EvpSDglY9BrTa0jjFIEVAAUogqGhfP0LjCaeQTb4WLtm4HqYHpqfj/T3Hwz7+i/+/1qY
         cLHMuvF7L3RT89z5w9Qg/81l96jZw4yGG55Rvbygy9jsl9mtU4QfGmEsFswFXPuaAVVU
         o9tw==
X-Gm-Message-State: AO0yUKVsO53Kjj3Hro5bGlJ0MsFpf1JRgdovl+xrPjLi+wCFOCLxUdDS
        +SALBP3Mw5Q2BPHEP3ix2xY5Rokbxht5KbFe
X-Google-Smtp-Source: AK7set9/uuNG1lfqck18++gqmHZacuZJybJu2bpKIj48EjVChC9Prtaw2A5zrJEk1ENNrZdyCR14LQ==
X-Received: by 2002:a05:600c:3c8e:b0:3db:1f68:28f with SMTP id bg14-20020a05600c3c8e00b003db1f68028fmr7148189wmb.24.1677090093070;
        Wed, 22 Feb 2023 10:21:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e6-20020a05600c4e4600b003e214803343sm8189008wmq.46.2023.02.22.10.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 10:21:32 -0800 (PST)
Message-ID: <23b0b20a-36fb-038a-4251-caeb1a838752@linaro.org>
Date:   Wed, 22 Feb 2023 19:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] clk: qcom: Add global clock controller driver for
 MSM8917
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
 <20230221174909.164029-3-otto.pflueger@abscue.de>
 <10b2ce9a-d838-6063-1646-90f91ce819e6@linaro.org>
 <Y/ZXdO67/9X5xabE@fluffy-mammal.metal.fwg-cag.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y/ZXdO67/9X5xabE@fluffy-mammal.metal.fwg-cag.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/02/2023 18:57, Otto Pflüger wrote:
> On Wed, Feb 22, 2023 at 09:51:21AM +0100, Krzysztof Kozlowski wrote:
>> On 21/02/2023 18:49, Otto Pflüger wrote:
>>> This driver provides clocks, resets and power domains needed for various
>>> components of the MSM8917 SoC and the very similar QM215 SoC.
>>>
>>> According to [1] in the downstream kernel, the GPU clock has a different
>>> source mapping on QM215 (gcc_gfx3d_map vs gcc_gfx3d_map_qm215).
>>>
>>> [1]: https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LF.UM.8.6.2-28000-89xx.0/include/dt-bindings/clock/msm-clocks-hwio-8952.h#L298
>>>
>>> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
>>> ---
>>>  drivers/clk/qcom/Kconfig       |    8 +
>>>  drivers/clk/qcom/Makefile      |    1 +
>>>  drivers/clk/qcom/gcc-msm8917.c | 3283 ++++++++++++++++++++++++++++++++
>>>  3 files changed, 3292 insertions(+)
>>>  create mode 100644 drivers/clk/qcom/gcc-msm8917.c
>>>
>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>> index 70d43f0a8919..3ef58b09385a 100644
>>> --- a/drivers/clk/qcom/Kconfig
>>> +++ b/drivers/clk/qcom/Kconfig
>>> @@ -196,6 +196,14 @@ config MSM_GCC_8916
>>>  	  Say Y if you want to use devices such as UART, SPI i2c, USB,
>>>  	  SD/eMMC, display, graphics, camera etc.
>>>  
>>> +config MSM_GCC_8917
>>> +	tristate "MSM8917 Global Clock Controller"
>>
>> I propose to add here:
>>
>> depends on ARM64 || COMPILE_TEST
> 
> Why should this driver only be enabled on ARM64 systems? In my opinion,
> this should also be supported on 32-bit ARM, just like the other clock
> drivers for the 64-bit SoCs. Users should be able to boot a 32-bit
> kernel if they have to, e.g. if their device has broken firmware that
> prohibits booting 64-bit kernels (there have been such cases with
> MSM8916) or if they think that 64-bit systems use too much memory (my
> QM215 device with 512MB RAM shipped with a 32-bit kernel for this very
> reason).

Are you going to upstream 32-bit DTS (wrapper actually)? If not, then
why would you care about anything out-of-tree? Why would we care about
anything out-of-tree?


Best regards,
Krzysztof


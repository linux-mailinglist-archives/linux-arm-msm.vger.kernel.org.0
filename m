Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE327BFAEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 14:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjJJMOw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 08:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbjJJMOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 08:14:51 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBB499
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 05:14:49 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c3f0c68e5dso14185401fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696940088; x=1697544888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2j2gqvVnme5rG0CHwsHrtEJij0IvlAVl1AXvsoev/Bo=;
        b=TnzpuSPEhP5QPGekbYpysPcH3yKxQzUSjQ5AqH+2YuHAdJxuYrnWMBybQhUvE8E3Pj
         89V2hrmx2VbFwtpN8XOu9uKBJhlhGWE6N2z3av8u2T6OEad76Q3T4FGYf3BKHCeMVtyp
         o1xVMFFOPAvbPg7b6D5v/klz123AybXpf5EbSNrrQYCroe5e2fmRcBh1SUtJCYA6nPF2
         LD8jnI1wXZ606amjM0SxoAfDbCQ5hHIOBPtshLNPSdX8I0krMIk9whhv9izQJ1RGl04t
         tsHBPxYidMiV8GyTgJJ+zSn7REa1/qWXJiMmuKTREZX0CeyQicEu2TFGXPSDvEcp6Ebm
         ysNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696940088; x=1697544888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2j2gqvVnme5rG0CHwsHrtEJij0IvlAVl1AXvsoev/Bo=;
        b=m59xF1AV7QrT98FPBXHx6CRaYPBqCKEsNGsb7Zohi0bnd05D6CUFOjEf5s4hSsP/O1
         GyJEmaa/WwSw7yb4W5FMy1SHPYmFqbwBuVs34+U9nKOkpBqWKX0VRsv6/7J6KU89oU8u
         hX/h9IM1L+IqmGkqsq0bXWRg0VU6mtNG7OyBvFhCo9SdxC3Xb639+0UUt5hz/aSkO5y0
         wWN9pgAdyt4EH0q1Fr3chj3QTKgIrui2xyOozeTxcoVgjpSrQOzCNzJLsaOFInXE21f2
         CZDCbU4zD7cULDHBaoID6GDp09xBnbQRM8DMNP9IuvCYKWAUJEFKISnbCpOrQRp98Wy6
         mnCA==
X-Gm-Message-State: AOJu0YzOsfV57SaCYKQgU5TRQ16kFk4hQnT4Becc6yDplOoGm/mY2qyv
        zwWZCAwdL/shsUJdbyJ7Hbuo8g==
X-Google-Smtp-Source: AGHT+IHKQtJ/PyxUz59Q//lIUB8vGVTstnP5AC6DnMvr8gMtNMyPLvKUkSvoFDKV9SoyqLPJNxXlwA==
X-Received: by 2002:a2e:9bd3:0:b0:2c0:2b1b:d14c with SMTP id w19-20020a2e9bd3000000b002c02b1bd14cmr14612568ljj.24.1696940087986;
        Tue, 10 Oct 2023 05:14:47 -0700 (PDT)
Received: from [172.30.204.192] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id e13-20020a2e818d000000b002c128900690sm2399715ljg.90.2023.10.10.05.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 05:14:47 -0700 (PDT)
Message-ID: <1a0b7d17-8f5e-4372-830a-da0a92f711ea@linaro.org>
Date:   Tue, 10 Oct 2023 14:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] regulator: core: Disable unused regulators with
 unknown status
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20231004-reg-smd-unused-v1-0-5d682493d555@kernkonzept.com>
 <20231004-reg-smd-unused-v1-1-5d682493d555@kernkonzept.com>
 <9b78cab5-d72f-469a-816d-6b3f86aecada@linaro.org>
 <ZSRg1H772gMTl-d3@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZSRg1H772gMTl-d3@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/9/23 22:21, Stephan Gerhold wrote:
> On Fri, Oct 06, 2023 at 11:11:48PM +0200, Konrad Dybcio wrote:
>> On 4.10.2023 16:17, Stephan Gerhold wrote:
>>> Some regulator drivers do not provide a way to check if the regulator is
>>> currently enabled or not. That does not necessarily mean that the
>>> regulator is always-on. For example, the regulators managed by the RPM
>>> firmware on Qualcomm platforms can be either on or off during boot but
>>> the initial state is not known. To sync the state the regulator should
>>> get either explicitly enabled or explicitly disabled.
>>>
>>> Enabling all regulators unconditionally is not safe, because we might
>>> not know which voltages are safe. The devices supplied by those
>>> regulators might also require a special power-up sequence where the
>>> regulators are turned on in a certain order or with specific delay.
>>>
>>> Disabling all unused regulators is safer. If the regulator is already
>>> off it will just stay that way. If the regulator is on, disabling it
>>> explicitly allows the firmware to turn it off for reduced power
>>> consumption.
>>>
>>> The regulator core already has functionality for disabling unused
>>> regulators. However, at the moment it assumes that all regulators where
>>> the .is_enabled() callback fails are actually off. There is no way to
>>> return a special value for the "unknown" state to explicitly ask for
>>> disabling those regulators.
>>>
>>> Some drivers (e.g. qcom-rpmh-regulator.c) return -EINVAL for the case
>>> where the initial status is unknown. Use that return code to assume the
>>> initial status is unknown and try to explicitly disable the regulator
>>> in that case.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
>>> ---
>>> Instead of -EINVAL we could also use a different return code to indicate
>>> the initial status is unknown. Or maybe there is some other option that
>>> would be easier? This is working for me but I'm sending it as RFC to get
>>> more feedback. :)
>>
>> -EOPNOTSUPP for "doesn't support getting is_enabled state"?
>>
> 
> The way it is implemented right now the Qualcomm SMD RPM regulator does
> actually support getting the .is_enabled() state. It is only unable to
> determine the initial state during boot. Once the regulator has been
> enabled by some consumer for the first time the .is_enabled() callback
> starts returning the expected results.
> 
> Typically -EOPNOTSUPP is used when the driver callback (or similar) is
> not implemented at all. I'm not sure if using -EOPNOTSUPP for the
> "temporarily unable to determine state" purpose would be misleading.
I'd say EOPNOTSUPP is fair here because calling is_enabled in that 
context is not supported, but I guess it's up to Mark.

Konrad

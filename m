Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E69FC6CD804
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 12:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjC2K7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 06:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjC2K66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 06:58:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B997C1FDA
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 03:58:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x17so19585067lfu.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 03:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680087535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CarlS/VU8aJv526dWxLfE21OLuYaolNHG12/rq9FVAw=;
        b=NiUPYCtAcly/5nLkHOTow4ELPXiCEO/Vv1E+6JMJX5H0Uvfi1E1Af86mDMyCyd/6Ek
         Lkmwr3PNug0NBRnKIC3HpzhznMeXYxgJYGRsjyqkMtU8UbZS8OFdWVnqF9JGQw2ksMBv
         6TiYVl/83h9LjpcYNwbzIQpgo8cN3SnsOAdUaSS+Pd7ISurPNxWqkQ3r4Vx16BhVQs5l
         u2xmnobKAdqgey8BDBN8uSRGVTghH6ptanbD216QbJ9QfjtRv8wGvxTaGeP1eWGtFhhD
         ntP1KMTer630EqjnYeiWTLeGOThrTPHnn8hpvVqONpM+UPQbQGKgKwMPjdWw5O0TGq2q
         Kikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680087535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CarlS/VU8aJv526dWxLfE21OLuYaolNHG12/rq9FVAw=;
        b=02YOFPFAsNqxXaxHMShAxwupixvWjlXak2DAlP3irO8i3Xt08cHwdZovNv6wgK3pUr
         /3wbKnAChFI8u3UYTKd+RrtLNv1dZEfOVIAI2FQbugvEUFzheP6/M8rBjM9b7MfZxDnK
         XXwMJZEYmfSJwauZZju/NLXfFRdVyZOp/EyVKMKc7lTWJn+1uBCwGeMqsVXLAMli2kOV
         j2UJhQgn9xWYrhq0m2I7bjlFzlW6VVa0Xi3DploNhILvz1VDxgG9Yf5ZrSFiMOf08NwS
         E3/NXlVxodQN7B7CSAR6edCujQrbx/eznF7Zj1rtjDoyCD8Va4p960MtZzqdC4gsPFx/
         0ftQ==
X-Gm-Message-State: AAQBX9cJtL7nvX1nVJzQotp4IQbqVA/L3JolsJy8bDa0w2sawBTbIr3h
        k0AMhTofU8BjnBVgqHnXPql3x2xoOp369EQL1Ag=
X-Google-Smtp-Source: AKy350Y+u+dwj4XIorHbUb/MvzHyow+z04caWsQCMU5XkmlzHEOkZqFoJmVsO3yb3D0ew9Y0eLXCgA==
X-Received: by 2002:ac2:5448:0:b0:4e8:485c:6a13 with SMTP id d8-20020ac25448000000b004e8485c6a13mr5732819lfn.21.1680087534896;
        Wed, 29 Mar 2023 03:58:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ac0c000000b004dda76fad5asm5429156lfc.218.2023.03.29.03.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 03:58:54 -0700 (PDT)
Message-ID: <5c232df5-fbce-21a4-6414-9522f70be087@linaro.org>
Date:   Wed, 29 Mar 2023 13:58:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250: drop incorrect domain idle
 states properties
Content-Language: en-GB
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>
References: <20230324073813.22158-1-krzysztof.kozlowski@linaro.org>
 <880c0932-117f-61cd-dd97-c36076869c3b@linaro.org>
 <CAPDyKFrnEwkS5p+vQ0htYTBLaZ8iFPnV0kckf6F65cacBB2k4w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAPDyKFrnEwkS5p+vQ0htYTBLaZ8iFPnV0kckf6F65cacBB2k4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/03/2023 12:45, Ulf Hansson wrote:
> On Wed, 29 Mar 2023 at 00:51, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 24/03/2023 09:38, Krzysztof Kozlowski wrote:
>>> Domain idle states do not use 'idle-state-name' and 'local-timer-stop':
>>>
>>>     sm8250-hdk.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes: 'pinctrl-[0-9]+'
>>>
>>> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Link: https://lore.kernel.org/all/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org/
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> index 79d67b466856..9cf2de87c632 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> @@ -354,12 +354,10 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
>>>                domain-idle-states {
>>>                        CLUSTER_SLEEP_0: cluster-sleep-0 {
>>>                                compatible = "domain-idle-state";
>>> -                             idle-state-name = "cluster-llcc-off";
>>>                                arm,psci-suspend-param = <0x4100c244>;
>>>                                entry-latency-us = <3264>;
>>>                                exit-latency-us = <6562>;
>>>                                min-residency-us = <9987>;
>>> -                             local-timer-stop;
>>
>> Hmm, so we support setting the broadcast timer when using plain PSCI
>> idle states, but not when using the domain-based idle states.
>>
>> Ulf, Rafael, Daniel, is that an omission for the domain-based idle
>> support? Or is it handled in some other way?
> 
> I am not sure that we need a DT binding specifically for this, or do we?
> 
> So far, the timer is managed from platform specific code. For some
> Qcom based platforms, the timer should be managed in
> rpmh_rsc_write_next_wakeup(), which makes use of
> dev_pm_genpd_get_next_hrtimer().

I'm not sure whether I fully follow this (I might lack some 
understanding here). I thought that with "local-timer-stop" (well, 
CPUIDLE_FLAG_TIMER_STOP), we were switching to the broadcast timer 
before a core/cluster goes into idle state with no local timer, while 
with  rpmh_rsc_write_next_wakeup() we write that only before shutting 
down the last core (see the comment at rpmh_flush()).

This might be an expected thing, I probably don't have enough 
understanding of the cpuidle internals to judge this.

> 
> [...]
> 
> Kind regards
> Uffe

-- 
With best wishes
Dmitry


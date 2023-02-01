Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 130A2686CA0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 18:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbjBARRE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 12:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbjBARQ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 12:16:59 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC831EB77
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 09:16:56 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id bk16so17972907wrb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 09:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wr38XRGgvFXUxHBa8d+Ks/KuiYTFOwvWM5h9IiFhLX8=;
        b=XmrfqOPtuCeetmyqGs/bH/G/sTEkeIo/6JvbD6Jlxn6Efu++VNVbR0GR7G8P6hjegQ
         128hLlvbYA91b6W7m94mBB+H0eks6nSQXjwXZHE3Jo+rdAxhGdkj4sWBmiMJPoaPyTJ0
         FcTIMzrcQNtaDK5qfsq/npKCzaIiiaABEpz7f11Zf0JsdZwu92vwt6cBcRqRcwlDCRRS
         Pl4bHeOsHFhy/KjxeyrlzeRdIrGmj0X6qz5hk57ofSuhWu/XHBEu3nC3IZ48B0WOcIzc
         1hp9Rpd3qRWZFqB+oNfk1bWiRleGQ2OakPGrRXpkZeMbdt7IlEy56/2Awo770Na/impT
         XrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr38XRGgvFXUxHBa8d+Ks/KuiYTFOwvWM5h9IiFhLX8=;
        b=GT4iL9cQXLQj/gqH92r6JHgjpL05Jmc8+tle26NzUjMkkS8r/8VWTDDb0tG1vgGaXK
         P+12wXWEuZMCYgGtB2ZgE8z18xLkgWlWD6Xr1LMjRYsB7IrwCsqgWLWlNp5yA3N8LFoL
         oyXXpsZzun2u4byY2Yb/NjqJ9Ivs4T9CPK6H6cVNH9it1AZ7lkL1fJGOKHcZSCa8ka3y
         zpYcLvY04m3uhhew8MzWNRHuEwyelir5rAJViCtSj2bfhRnL7WtCG6b83/pIxZKPWwtn
         iCllmbTwkcT5EhSBwbc2jBMTEIQphkuK1uSmpeNUiA8wIoujAVEcPgEalG6wUODLdNbL
         ApHQ==
X-Gm-Message-State: AO0yUKVa+kygyp+ZaaCgsMQMKaat+tc3o9yG82xY4hDQrOLon977qCet
        W8HMTNz+STW7Qwjhzaia8CtzSw==
X-Google-Smtp-Source: AK7set+N2m4euaJ1j3qjryKWqRm5bfdc9maiQA2BzwcJfWWO6xVi6bumDqUizwD0zDYDSblrrEd+mw==
X-Received: by 2002:a5d:4d84:0:b0:2bf:eb0e:ccb8 with SMTP id b4-20020a5d4d84000000b002bfeb0eccb8mr3197612wru.37.1675271815318;
        Wed, 01 Feb 2023 09:16:55 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f28-20020a5d58fc000000b002be5401ef5fsm18329544wrd.39.2023.02.01.09.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 09:16:54 -0800 (PST)
Message-ID: <8eb9ba9b-dce8-5ece-6c2a-7e7a758c75ab@linaro.org>
Date:   Wed, 1 Feb 2023 17:16:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] PM / devfreq: qcom: Introduce CCI devfreq driver
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jun Nie <jun.nie@linaro.org>, myungjoo.ham@samsung.com,
        kyungmin.park@samsung.com, cw00.choi@samsung.com,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230201080227.473547-1-jun.nie@linaro.org>
 <20230201080227.473547-2-jun.nie@linaro.org>
 <515f4e9e-2804-e03a-26f5-f2d3ac331109@linaro.org>
 <71ba0d05-6183-95ef-9e45-cc3dd512475f@linaro.org>
 <CAA8EJpqyqC5D+O=KJnuZnWN4BwBOKcquN11nJfEp2WMSmJobBg@mail.gmail.com>
 <58a5e856-3e8b-d660-09ee-7a18b184452f@linaro.org>
 <1d33eb58-95d1-643d-52cc-2888ff0cea43@linaro.org>
 <86478fbd-590a-f94f-6cc1-f4d06a96826e@linaro.org>
 <2a0ce32c-d100-d5c3-ac0c-ccd7100a2c06@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2a0ce32c-d100-d5c3-ac0c-ccd7100a2c06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 17:12, Dmitry Baryshkov wrote:
> On 01/02/2023 17:17, Bryan O'Donoghue wrote:
>> On 01/02/2023 14:58, Dmitry Baryshkov wrote:
>>> On 01/02/2023 16:45, Bryan O'Donoghue wrote:
>>>> On 01/02/2023 13:41, Dmitry Baryshkov wrote:
>>>>>>                           cci-cpufreq {
>>>>>>                                   target-dev = <&cci_cache>;
>>>>>>                                   cpu-to-dev-map-0 =
>>>>>>                                           <  200000  200000000 >,
>>>>>>                                           <  345600  200000000 >,
>>>>>>                                           <  400000  200000000 >,
>>>>>>                                           <  533330  297600000 >,
>>>>>>                                           <  800000  297600000 >,
>>>>>>                                           <  960000  297600000 >,
>>>>>>                                           < 1113600  297000000 >,
>>>>>>                                           < 1344000  595200000 >,
>>>>>>                                           < 1459200  595200000 >,
>>>>>>                                           < 1497600  595200000 >,
>>>>>>                                           < 1651200  595200000 >;
>>>>>>                                   cpu-to-dev-map-4 =
>>>>>>                                           <  200000 200000000 >,
>>>>>>                                           <  249600 200000000 >,
>>>>>>                                           <  499200 297600000 >,
>>>>>>                                           <  800000 297600000 >,
>>>>>>                                           <  998400 595200000 >,
>>>>>>                                           < 1113600 595200000 >;
>>>>> These should map to existing opp entries.
>>>>>
>>>>> I ended up doing the interconnect driver that maps a clock to the
>>>>> interconnect. Then I can use it in the cpu opp tables.
>>>>>
>>>>
>>>> Can you point us at what it is you are proposing ?
>>>
>>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20230120061417.2623751-9-dmitry.baryshkov@linaro.org/
>>>
>> Is there no driver code too ?
> 
> There are two parts, one is the 'CBF clock' driver, which just provides 
> a clock, another part actually connects the clock and interconnect. 
> Initially I implemented it as a part of the CBF driver (see 
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20230120061417.2623751-5-dmitry.baryshkov@linaro.org/), next revision will move the interconnect part to drivers/interconnect.
> 

Ah so just to be clear - discussing with Dmitry - CCI has its own set of 
fuses.

We have fusebin settings for clusterX and CCI.

So, I think we agree this means a separate driver for cci is warranted.

---
bod

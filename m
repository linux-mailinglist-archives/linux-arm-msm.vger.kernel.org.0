Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49B34A0446
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jan 2022 00:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349038AbiA1XiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jan 2022 18:38:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbiA1XiR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jan 2022 18:38:17 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21E0C061714
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 15:38:16 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id g11so7357943qvu.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 15:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=7wRBZt5CI3ZeAca698WwZ7sDuFxjioSMDDpWINhiMKs=;
        b=Ivq7kGBV+UbNvCSOZqCO2pWeDmlhuI1aka3qpMKInsQWlfPiRjKItMzNw3uE2EOnHA
         BIDTD1iyltFbp6fo/doS83i/8R2N07VA1vbQX80ZAA+rUk+/iR6dJWRcMp8DN5kLrrJO
         9iEXHM28e38LmV400rz7wUtFAH3wSFEssNlfhLoiIb42q0af6UcU+d16BDyLNNspYonX
         hk25oMYpmb+kcOPMMkwC1yZAS4n1ro/kIBdDF+rzTiBmHXr0k7vqLLkzQ9wszm8RNLdp
         gJ2S8BIyhf74MHHyeZ0X4WJv6z29mHTMLP5zVfNjpuBLW8UD3UUzkyyn0UZJ6BIUt7/x
         T+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=7wRBZt5CI3ZeAca698WwZ7sDuFxjioSMDDpWINhiMKs=;
        b=C9ab/+w8yQG7XarsO6/FJotCU88nIj8uSjHmM8lC7ORjMoYt1/fVyRxofk3LzmMK91
         9MDvGNMdy1eTBpAGIMhTUPiTmkua9HHZyg/Gh7+Dd9+6mHl7tI+ERh5XKVHgrc5GQkvL
         nJYzxUFsZxeSnb0UShn0LMH0ODQEhD1MRulm5s9B/DXL3kDcL86oiuVrgj10tiJ1LED3
         6m7PeWnQbvA9RP4ye/YCultAHpuYKij+Ew0FUaRObEADdDwrYJtxhOQJpJrNtSHQK2RN
         QRoBRr1RZULWkY45IGHyA48oJDbL79kcwRaI4nMSvps6f/dHNBPJRuSAWUFHYWTKuCpe
         jyuw==
X-Gm-Message-State: AOAM532/76iSxznIRcPjZLrjxkhau6zN6VW2K1IZE6EfpDWOXRCPukRA
        1orshw/019QtBH4p4LzCXcbIsg==
X-Google-Smtp-Source: ABdhPJyRDsqB2ppHeR+ZFCtvLSmvRXchUY+xeNwYuuG5cU+q2vl19W7pQV/fYwkeYLMIHbSvuqWIqg==
X-Received: by 2002:ad4:5c68:: with SMTP id i8mr9814041qvh.89.1643413095918;
        Fri, 28 Jan 2022 15:38:15 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q13sm3695351qtx.46.2022.01.28.15.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 15:38:15 -0800 (PST)
Message-ID: <5986cc2e-ca77-aed9-76d5-b0d04caaf828@linaro.org>
Date:   Fri, 28 Jan 2022 23:38:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 2/3] interconnect: qcom: msm8939: Merge snoc and snoc_mm
 into one
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     djakov@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        jun.nie@linaro.org, shawn.guo@linaro.org, benl@squareup.com
References: <20220128161002.2308563-1-bryan.odonoghue@linaro.org>
 <20220128161002.2308563-3-bryan.odonoghue@linaro.org>
 <CAA8EJpqvDqTH3+ATsdC2pwtfT-OWpLNSUgOPmeU_Tpu8Uqa1+g@mail.gmail.com>
 <251a8515-7f8d-2535-e222-17443266f275@linaro.org>
 <2acd53d0-c14e-a149-0708-d8ee4f33d15d@linaro.org>
In-Reply-To: <2acd53d0-c14e-a149-0708-d8ee4f33d15d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/01/2022 23:30, Bryan O'Donoghue wrote:
> On 28/01/2022 23:23, Bryan O'Donoghue wrote:
>> On 28/01/2022 22:24, Dmitry Baryshkov wrote:
>>> This would lead to higher frequencies being set on both 'normal' and
>>> mm snoc clocks, thus (possibly) increasing power consumption.
>>>
>> How so ?
>>
>> There are four clocks
>>
>> bus
>> bus_a
>> bus_mm
>> bus_a_mm
>>
>> The last two clocks
>>
>> SNOC performance points are
>> 0 | 19.2  | XO
>> 1 | 50    | GPLL0
>> 2 | 100   | GPLL0
>> 3 | 133.3 | GPLL0
>> 4 | 160   | GPLL0
>> 5 | 200   | GPLL0
>> 6 | 266.6 | GPLL0
>>
>> SNOC_MM performance points are
>> 0 | 19.2  | XO
>> 1 | 50    | GPLL0
>> 2 | 100   | GPLL0
>> 3 | 133.3 | GPLL0
>> 4 | 160   | GPLL0
>> 5 | 200   | GPLL0
>> 6 | 266.6 | GPLL0
>> 7 | 320   | GPLL0
>> 8 | 400   | GPLL0
>>
>> Its GPLL0 being set, the snoc_mm clocks really just map back to GPLL0
> 
> So taking an example
> 
> If venus
> interconnects = <&snoc_mm MASTER_VIDEO_P0 &bimc SLAVE_EBI_CH0>;
> 
> or mdp
> interconnects = <&snoc_mm MASTER_MDP_PORT0 &bimc SLAVE_EBI_CH0>,
>                  <&snoc_mm MASTER_MDP_PORT1 &bimc SLAVE_EBI_CH0>;
> 
> wants performance point #6 GPLL0 runs at 266.6 but for performance point 
> #7 it runs at 320 MHz
> 
> Since the points all map back to a GPLL0 frequency, how does aggregating 
> snoc and snoc_mm - result in higher power consumption ?

Anyway - thanks for the pointer to the virt clock.

I don't mind re-implementing the fix this way given there's an 
established upstream canon.

---
bod

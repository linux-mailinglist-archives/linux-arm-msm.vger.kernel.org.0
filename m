Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1A5654A5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 02:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbiLWBLG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 20:11:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiLWBK3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 20:10:29 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2095BAE59
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 17:06:41 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 1so5145126lfz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 17:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWNSN9gdeqB9vLjwyWwlgXwLAi8tUlsqoJc0gqDD7Kk=;
        b=WGQq2CzvRYhovMC41n2FY6Zui8oQFiC4cfoMs8nd5tsPGpkerNex/yXV4kz/HF0p+i
         Gz9SV5MODPw8waTc/H5MeGJKmQTTFrHFRgRR05gExy0sB+SXehYRB0GJ4AYx88ANUXg1
         8wt2BjHdpzscrQgZwWJpeFA+M9NDuHz308U0Yvt3ptax6pXL8iL1wBIx2MekC4LF4sPP
         O/qK30vgMNrKmKI6RQBC8MXOEsVwyKnDU59kYc6uBTyyo1PA8dYYUnA7L1pEWihuwAZ8
         p0m65LWqX1V+le3rGxtFC6pRxnOPn88g4b6lLOK1YhPwJAkBt8f/c5VcbPp3gfwS5K0H
         8SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWNSN9gdeqB9vLjwyWwlgXwLAi8tUlsqoJc0gqDD7Kk=;
        b=PJd356ykkES/bSa0jK4EYdfLQLwdo+HLTwr5ouQ4HyekvnVRKhJ+c3fzyfoQLVFKdi
         Abe2Uq0ias7ZYfNj07Mtd1QHqtol9dIZCY6Voti+Jw2ehFzH2G1jVSgMfZHqs1ePc6hZ
         Zgj9kpkfSz5bOWAXmWH/bi9XzXXP2B/OQZ5Z0SxTVkvOa/EAfywYTQGdA1zl6YLZe55n
         rUd6ovYUEihXvyys7gclFh9uNRAR90dCPNsuQI1l6DfSe14oEWlzpem+3NRjeZWa1fwx
         5rgOdKrbNrzZ46w4/H2Y2rNAabIsoVaXOF+ObqgwF7b8p3ZAT9XsxZ/vUZh+WOTB+eew
         7ftw==
X-Gm-Message-State: AFqh2kqUfZZqO6QqABc1ldogB90+n/lSCcGQE6oA2qU7Wmk8zMF7Es5G
        BIYDg8Mpm9oLawqc8TxvBJUmQw==
X-Google-Smtp-Source: AMrXdXvSlWMGCBzIRsY3qbzGd/ghlBMl7PlJMauArxugr7RDVD86TCHGJdy525cV/G5qjZf3Ji8HFQ==
X-Received: by 2002:a05:6512:21c6:b0:4af:e55a:dc69 with SMTP id d6-20020a05651221c600b004afe55adc69mr2651591lft.4.1671757599473;
        Thu, 22 Dec 2022 17:06:39 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id l28-20020ac24a9c000000b004b50b4f63b7sm277180lfp.170.2022.12.22.17.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 17:06:38 -0800 (PST)
Message-ID: <830f39a0-6a7c-52a4-2640-ba8564f072a9@linaro.org>
Date:   Fri, 23 Dec 2022 03:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/5] MSM8996 eMMC boot fix
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org
References: <20221210200353.418391-1-konrad.dybcio@linaro.org>
 <96c5212d-ddf8-48ba-27ca-234f6c9128b9@linaro.org>
 <0682e14a-2b15-2672-45e1-c05cb75ba22c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0682e14a-2b15-2672-45e1-c05cb75ba22c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/12/2022 02:54, Konrad Dybcio wrote:
> 
> 
> On 23.12.2022 01:19, Dmitry Baryshkov wrote:
>> On 10/12/2022 22:03, Konrad Dybcio wrote:
>>> In a very unfortunate turn of events, enabling interconnect on non-UFS
>>> devices (or more precisely devices-with-UFS-clocks-disabled-from-
>>> bootloader) crashes the device, as a memory read to an unlocked peripheral
>>> is attempted. This series tries to fix that with the least amount of
>>> casualties..
>>
>> Just to note. I had occasional boot issues with UFS on msm8996 even after these patches being applied. It seems I was able to fix them by enabling interconnect support in the UFS-qcom driver.
>>
> To be fair, we may be missing some more things (I have no concrete
> evidence, maybe things go south just because my ports of icc drivers
> all turn out to be garbage..):
> 
> - icc is not aware of what hardware is on from the bootloader
> and if we don't add interconnects= *everywhere*, *including* where
> downstream made (in their case) educated assumptions, things start
> falling apart real quick, as random bits of hw may stop working if
> they get a zero vote

I think most if not all drivers unvote their resources without picking 
up bootloader configuration. This includes icc, clocks, power-domains, etc.

>    - on other platforms, this is even a bigger mess, because
>      some hardware *"unvotes"* on reset, such as MDSS or PCIe..
> 
> - if some but not all connections are described, requested bus
> rate may be lower than expected, with effects ranging from subpar
> performance to things simply not working because of too much traffic
> 
> - it's really hard to test smd rpm icc drivers other than dumping
> reg writes and comparing them with downstream, sometimes things
> "work" by luck, other times it breaks booting..

Yeah, I have been debugging 8996 boot issue for quite some time...

> 
> Konrad
>>>
>>> Konrad Dybcio (5):
>>>     dt-bindings: interconnect: Add UFS clocks to MSM8996 A2NoC
>>>     interconnect: qcom: msm8996: Provide UFS clocks to A2NoC
>>>     interconnect: qcom: msm8996: Fix regmap max_register values
>>>     interconnect: qcom: rpm: Use _optional func for provider clocks
>>>     arm64: dts: qcom: msm8996: Add additional A2NoC clocks
>>>
>>>    .../bindings/interconnect/qcom,rpm.yaml       | 24 ++++++++++++++++++-
>>>    arch/arm64/boot/dts/qcom/msm8996.dtsi         |  6 +++--
>>>    drivers/interconnect/qcom/icc-rpm.c           |  2 +-
>>>    drivers/interconnect/qcom/msm8996.c           | 19 +++++++++++----
>>>    4 files changed, 42 insertions(+), 9 deletions(-)
>>>
>>

-- 
With best wishes
Dmitry


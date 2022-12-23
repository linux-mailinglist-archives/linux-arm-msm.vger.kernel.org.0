Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10F656549DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 01:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiLWAzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 19:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiLWAzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 19:55:00 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7888521259
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 16:54:59 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id g13so5099596lfv.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 16:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNhl9FvStpICNIBHSxOoe34YBMvc08RGk/C3Pc6oHRE=;
        b=BPiQtcGB44fhDCszS6UutK53eqOZA/GLGRHWb1FGrMzyEEzKQsrg9qYxHcOcYI6ce5
         OjACBOo+Jf6qmWXcoQO6dX+kzkcilU7hVVbpYmq3IwDdx033wr2g50SaWYuGrxXaKlj2
         /Ao+li7XyPlmC1E1dbU/o5YDQfmxF/AcvCl/KGFvEQ7hLxO+ZD5ce8HNdQGYwR51IZeo
         4cllp0Ex3Eun/w/5OYKTWdgBZOeLe2zTtK5MvzU9xzlDMK1zDreL9DHttW5FBsO2CeL2
         ZrT0lXxYvPDysOGWgKNT6PDvgDWzpPUwZfNJ/F4FjiIVPH4VwzTY22E684xyQlsj5T/E
         CMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNhl9FvStpICNIBHSxOoe34YBMvc08RGk/C3Pc6oHRE=;
        b=223a9e41shuhHvYWonC/Z9XfEq2e2T9SNpJ6tEzeRbr7dik7D2pE5DQknJZgJeF7mZ
         ZqPXTj4GkkSqJ9m1vkX/cjFCHAseA2563QjNlRiFNkLP4qXRvRde6FzzekW0wmM6IxZW
         0D7LyS+Y/aM76toFE7zNyZPD1YLVfcNoSmBKSlONCMLOjiIUYDbfAWfaeckOEdbNCBN0
         XNZW+gfBhUsU7nGjHyDQGMTXVhRWz6ruPg2VzfS5IwvR+rZr0HD/On3b6brudZXGS2zA
         rpqbdQqs2wJIHA6UoglUZktiLJvsp/KyUzJk7jpIdjx456uPAw5ifL1fCJDxHpyALF9u
         i88w==
X-Gm-Message-State: AFqh2koxa5YAV2se1YLNmE7Yg/49hBA47819glbD9DtHPlpMCu1zaNXZ
        Oj/UUjSD5Cson+8M5J6WDDQlq2WnqCwlsO5k
X-Google-Smtp-Source: AMrXdXt0h2pFLH9EXXkm6yPeAVYEjT/0KxfG2nT6vCWIwuUwPyzJbLtd/fv9PmFVjKReymtgjlDX2g==
X-Received: by 2002:a05:6512:b28:b0:4ca:f42f:c6a4 with SMTP id w40-20020a0565120b2800b004caf42fc6a4mr479433lfu.36.1671756897790;
        Thu, 22 Dec 2022 16:54:57 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id i189-20020a2e22c6000000b0027f84a807e0sm218782lji.22.2022.12.22.16.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 16:54:57 -0800 (PST)
Message-ID: <0682e14a-2b15-2672-45e1-c05cb75ba22c@linaro.org>
Date:   Fri, 23 Dec 2022 01:54:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/5] MSM8996 eMMC boot fix
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org
References: <20221210200353.418391-1-konrad.dybcio@linaro.org>
 <96c5212d-ddf8-48ba-27ca-234f6c9128b9@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <96c5212d-ddf8-48ba-27ca-234f6c9128b9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.12.2022 01:19, Dmitry Baryshkov wrote:
> On 10/12/2022 22:03, Konrad Dybcio wrote:
>> In a very unfortunate turn of events, enabling interconnect on non-UFS
>> devices (or more precisely devices-with-UFS-clocks-disabled-from-
>> bootloader) crashes the device, as a memory read to an unlocked peripheral
>> is attempted. This series tries to fix that with the least amount of
>> casualties..
> 
> Just to note. I had occasional boot issues with UFS on msm8996 even after these patches being applied. It seems I was able to fix them by enabling interconnect support in the UFS-qcom driver.
> 
To be fair, we may be missing some more things (I have no concrete
evidence, maybe things go south just because my ports of icc drivers
all turn out to be garbage..):

- icc is not aware of what hardware is on from the bootloader
and if we don't add interconnects= *everywhere*, *including* where
downstream made (in their case) educated assumptions, things start
falling apart real quick, as random bits of hw may stop working if
they get a zero vote
  - on other platforms, this is even a bigger mess, because
    some hardware *"unvotes"* on reset, such as MDSS or PCIe..

- if some but not all connections are described, requested bus
rate may be lower than expected, with effects ranging from subpar
performance to things simply not working because of too much traffic

- it's really hard to test smd rpm icc drivers other than dumping
reg writes and comparing them with downstream, sometimes things
"work" by luck, other times it breaks booting..

Konrad
>>
>> Konrad Dybcio (5):
>>    dt-bindings: interconnect: Add UFS clocks to MSM8996 A2NoC
>>    interconnect: qcom: msm8996: Provide UFS clocks to A2NoC
>>    interconnect: qcom: msm8996: Fix regmap max_register values
>>    interconnect: qcom: rpm: Use _optional func for provider clocks
>>    arm64: dts: qcom: msm8996: Add additional A2NoC clocks
>>
>>   .../bindings/interconnect/qcom,rpm.yaml       | 24 ++++++++++++++++++-
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi         |  6 +++--
>>   drivers/interconnect/qcom/icc-rpm.c           |  2 +-
>>   drivers/interconnect/qcom/msm8996.c           | 19 +++++++++++----
>>   4 files changed, 42 insertions(+), 9 deletions(-)
>>
> 

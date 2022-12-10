Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19E466490DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 22:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiLJVrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 16:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLJVrY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 16:47:24 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6DF13DDC
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 13:47:21 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id p8so12438471lfu.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 13:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lOj+iBOprdZuPZnR4bLKLDX0rEi4eOY/Pu2aNdn4UU=;
        b=oJ48naTxYiJoq/zYkL3EfInHnxPh59Ps+LaH03NE2eYeAe2aevDVocVnJS+IEns2JB
         W3qDtAYsxp1Thj0xbbGPvfRiRFgcbiEMQSK5o2vkfSAvjVAbO94oQQB3f4hbhFR6kZ2m
         fND1//LMfumoe10ytOvXMY6f7XrLfoBxOu3oP2xSZbweyTVdEswMMpgXTt435CjvTAHQ
         u+PX/4K34IRLxGE/cL93iZmhP2LOFVz3dfkFgWXp2LpWD4AJn+RcXmU0aFJcLOR16m9l
         JuCtJXLC/6zFoOYigHi2Q8t36A3a91Iix6Z2xGdfSb7w2yEQe3UTa8pXCN7SeDsGuIat
         LkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0lOj+iBOprdZuPZnR4bLKLDX0rEi4eOY/Pu2aNdn4UU=;
        b=nM0rNxO2AfFMdD6IOOyxB5hxZV92NKfi4wBlMLAf49KlNAbplocuSyJFUgwXEjlmsF
         XK/qCqScnOdSZliaTofWL0si/gpZ7UABy29RcghgZuwo3kLI/qIsFXG8wztd1y4HiKDz
         71/p9wCnbj+zGLLU0Tnz39tyRqAqb2SVnaZoHYD53SLv3YXFLKOba9KwTQ3wKmxiEmuJ
         yUk1LYoPApxly7wTQV398c+KfbSyY8dp4TpfXhi/Gno25aIVEqbH1BKWYNNlLqkEnS6w
         WEW+r6q/z/7O7xwbEs1Fghkiw5ce2fhjL7LfOxvUSrUFiLRbGwgwzN5Vb77e1H+mnDVr
         f7Ug==
X-Gm-Message-State: ANoB5pm0G/iAD8cVOIw9LHI5dmvvoGB/nGNzwcBiuED0kYq/aMki229f
        ETifohK+l0hi/6M7InhAEGIgpQ==
X-Google-Smtp-Source: AA0mqf6FQz4L6tIJMo6m/DdOUq4J900t9p+eRpiEghWWT5xsQstIeSmzk241IUV2vai/+ZCR8q+28w==
X-Received: by 2002:a19:ad06:0:b0:4b5:c10f:cb98 with SMTP id t6-20020a19ad06000000b004b5c10fcb98mr673396lfc.33.1670708839792;
        Sat, 10 Dec 2022 13:47:19 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id o21-20020ac24e95000000b004b55da14ba8sm873574lfr.291.2022.12.10.13.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 13:47:19 -0800 (PST)
Message-ID: <920f07d0-c90d-02f8-1706-9acd024ca953@linaro.org>
Date:   Sat, 10 Dec 2022 22:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/5] MSM8996 eMMC boot fix
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org
References: <20221210200353.418391-1-konrad.dybcio@linaro.org>
 <CAA8EJpoZjdOURyFEeO2umPrZp4WO=dRvhYK_3JPviGVOBJCfiA@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpoZjdOURyFEeO2umPrZp4WO=dRvhYK_3JPviGVOBJCfiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.12.2022 21:55, Dmitry Baryshkov wrote:
> On Sat, 10 Dec 2022 at 23:04, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> In a very unfortunate turn of events, enabling interconnect on non-UFS
>> devices (or more precisely devices-with-UFS-clocks-disabled-from-
>> bootloader) crashes the device, as a memory read to an unlocked peripheral
>> is attempted. This series tries to fix that with the least amount of
>> casualties..
> 
> I worked around the icc issues by disabling sync_state. But your
> change is definitely better. I'll have to check if there are any other
> omissions in the driver.
> Thanks for finding this!
sync_state failing is the greatest indicator of the icc driver
being incomplete/broken, I've learnt that the hard way multiple times! :P

Konrad
> 
>>
>> Konrad Dybcio (5):
>>   dt-bindings: interconnect: Add UFS clocks to MSM8996 A2NoC
>>   interconnect: qcom: msm8996: Provide UFS clocks to A2NoC
>>   interconnect: qcom: msm8996: Fix regmap max_register values
>>   interconnect: qcom: rpm: Use _optional func for provider clocks
>>   arm64: dts: qcom: msm8996: Add additional A2NoC clocks
>>
>>  .../bindings/interconnect/qcom,rpm.yaml       | 24 ++++++++++++++++++-
>>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  6 +++--
>>  drivers/interconnect/qcom/icc-rpm.c           |  2 +-
>>  drivers/interconnect/qcom/msm8996.c           | 19 +++++++++++----
>>  4 files changed, 42 insertions(+), 9 deletions(-)
>>
>> --
>> 2.38.1
>>
> 
> 

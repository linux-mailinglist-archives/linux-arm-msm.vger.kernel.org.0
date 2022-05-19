Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9969952D1D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 13:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237572AbiESLyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 07:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237553AbiESLyC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 07:54:02 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0F7B82F0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 04:54:01 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id d15so8687516lfk.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ynDwu8qGPWur+txmdTa4k/0YDzFSlIMmuvwA/VUCzcg=;
        b=jWqkmG8QV2PoxNQ+o66kt3qtyZtYpeRrP0rJugh+e9gH7kcVEzZP/yKcacr0y3PwnM
         p6GWvmgX/7czZPAsvDZ4xZjdAlAzssas+2F3n7NaeCxka+Qx6SVxBqHy74aV1LUSP8wE
         b78Aubz4phDjpsq/KvNzv5s6HoFZGaagE66QShjpuCgkg85VUbpimlSM6/iTU/awIcqd
         eVdvZ90WBF24MmzYWZdtQfbJMQF4l7BxFR33NPOKECuK1l/MNwaGxcNgOYkAgWQoclVh
         Ho+xvNP3G7uobjrmOL7i2LM3vbraoxMEUu3ldCiaf3dlfttj4WWpDkrWcDHg0i1HIxCa
         7oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ynDwu8qGPWur+txmdTa4k/0YDzFSlIMmuvwA/VUCzcg=;
        b=fwGhXf54ENHiiD4+3lb2VB+cI2TlCRzk14C7Y+PtqEy/TIHp9r8dZQWJ44PPU0ITcv
         r6Ips2ldMVmfg6cWAdafR+H26hIxdm/r5V2jb0/7KktGW0w7Sas2wPayRw3eVDoy0Byq
         nuycpMJUwMIGpSei425W2RJz88nX4C5n3omqTTGNCr3VZkWauC7I3tN6REkKGc1lY1lq
         LDixAByEKNNrV5O9NiFHJp7PGSM9cFofnnES0sbrZPBuDocqFsD4qf+0YJpTC9NJR/Bq
         10TTLlKC6hPWJKDHc92A8KPa75mkkvIyId2E//p+/IX81YPxcqkRuRsq3fp0XePZq16n
         FTEQ==
X-Gm-Message-State: AOAM5307FSfGcV1Rf/losJgaK9sSSGr9WGuNkgkumlusdTOhuwWLJHwe
        TywjTwfQNnIEqW2jlx51WEjKHQ==
X-Google-Smtp-Source: ABdhPJyy+batuU6U7KxzGS5lRyhCFXqpKpfzC73MofPOeIr+/BfU8dM/DOOI35JzL47clkdUE0q8CQ==
X-Received: by 2002:a05:6512:2397:b0:473:a6d9:5138 with SMTP id c23-20020a056512239700b00473a6d95138mr3117561lfv.332.1652961239433;
        Thu, 19 May 2022 04:53:59 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o22-20020a2e9456000000b0024f3d1dae84sm571111ljh.12.2022.05.19.04.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 04:53:58 -0700 (PDT)
Message-ID: <8a90ffbc-b376-9115-fb91-0b46d98873b7@linaro.org>
Date:   Thu, 19 May 2022 13:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Removal of qcom,board-id and qcom,msm-id
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
        Olof Johansson <olof@lixom.net>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a3c932d1-a102-ce18-deea-18cbbd05ecab@linaro.org>
 <35051bec-98ea-b4c5-f734-06b3f22f3562@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <35051bec-98ea-b4c5-f734-06b3f22f3562@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2022 13:39, Dmitry Baryshkov wrote:
> On 19/05/2022 13:44, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> There was an old effort of removal of qcom,board-id and qcom,msm-id
>> properties from Qualcomm SoC-based boards like [1].
>>
>> First approach was to document them, which (obviously) was not well
>> received [2] [3] [4].
>>
>> The solution from Stephen was to encode these in the board compatible,
>> so bootloader can extract that information. That seemed to receive
>> positive comments, at least from Rob. [5]
>>
>> It was 2015... ~7 years later we are still things doing the same way,
>> still with undocumented properties: qcom,board-id and qcom,msm-id.
>>
>>
>> I would like to revive that topic, but before I start doing something
>> pointless - any guidance on last patch from Stephen [5]? Was it ok? Some
>> early NAKs?
> 
> I do not quite fancy the idea of using extra tools to process dtb files. 
> At this moment it is possible to concatenate several kernel-generated 
> dtb files together. AOSP developers use this to have an image that boots 
> on both RB3 and RB5 boards.
> 
> I think that changing compat strings only makes sense if Qualcomm would 
> use such compat strings in future. Otherwise we end up in a position 
> where we have custom bootloaders for the RB3/RB5/etc, but the majority 
> of the board requires extra processing steps.

This was discussed in [2] [3] and [4] (previous links) and did not pass.

Do you have any new arguments for above objections from Arnd, Olof and
Rob? I don't think patch will get accepted if previous concerns during
review are not addressed...

> 
> So, I think, we should drop the unspecified usid aliases, document the 
> board-id/msm-id/pmic-id properties and stick with them. 

The existing properties need anyway documenting, probably as deprecated
so the schema can pass, because we cannot fix the bootloaders easly.

> They might be 
> ugly, but they are expected/processed by the majority of devices present 
> in the wild.

Any change in DTS affects only future devices, so not in the wild...

> 
>> [1]
>> https://elixir.bootlin.com/linux/v5.18-rc7/source/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts#L14
>>
>> [2] https://lore.kernel.org/all/7229476.C4So9noUlf@wuerfel/
>> [3]
>> https://lore.kernel.org/all/1450371534-10923-20-git-send-email-mtitinger+renesas@baylibre.com/
>> [4] https://lore.kernel.org/all/20151119153640.GC893@linaro.org/
>> [5]
>> https://lore.kernel.org/all/1448062280-15406-1-git-send-email-sboyd@codeaurora.org/
>>
>> Best regards,
>> Krzysztof
> 
> 


Best regards,
Krzysztof

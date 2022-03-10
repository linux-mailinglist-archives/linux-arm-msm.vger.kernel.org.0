Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6556C4D4D37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Mar 2022 16:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239316AbiCJPIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Mar 2022 10:08:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345536AbiCJPIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Mar 2022 10:08:20 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C41E02CA
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 06:59:32 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id t11so8397180wrm.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 06:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WfdM7IjnkQbW/GFyl7ZAZWNjxtALccG+KyqYcmtUGo8=;
        b=X782N19daHKUabLfmL0UoMX7eNDRn81afXG0CWoRE6Cz3LlTu8p8F0X5iacBU0vy/l
         LdoEuvB+D66xW13jaIyHfVFOcb56AcApZhf4Yrpu5YQEWuxTB5E21Pns7ldjDgvZjCps
         YHw5a8OpdFXiLOikzgKwqtmzqu5EFeYcgv3N8HY+zJ8g67TgeJrLOAGfp6daFfhQlzHY
         uu/Ig22PZG7a1ivhNepdqhjoISabu4Kfx5VPgaLPfO9KcImpAzpU9RXMj+xYeln9TdYT
         7DZO/P5OUnderhapxJpAUvOk4wpCA/HBCBhapeK6Y3g4VWCen058QniPzWQNPudYy271
         iaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WfdM7IjnkQbW/GFyl7ZAZWNjxtALccG+KyqYcmtUGo8=;
        b=34dIa365cQA5BUBYVr++tUNqLpl/RFsHXPZ0qapPCRcTSh+bmliREby8WtNVSxyE3p
         1clCmfphgqy0xinqC5mNeZZ9J/OHCAvAWX7cH+9Yhe4643E1n3fgK45F5IfLgUimSF3c
         MQra6RGkFfQASGBQhIg3B5Gnirn0Ul9job8t0NTUR9dgCQd/KLMIJugVj5b9FTLeLfMI
         hb0TnbrBp+KdzvibJ5Y80s/0l7IJ3s1oFN38UFohDseYf+47VWbG9eOoNp67qCIQ2Oex
         +ccuaKQqfWTrbLSEYBMSuLTeQgtXKoOZsfcoMR7he/Vtt1XiO8A8iaKVWYuc7ypGhMjV
         1mdg==
X-Gm-Message-State: AOAM530hovneWzE+PGKNQfwUau2Xhe/8ePpFZpI+9ODmPk3p/91I3gRj
        Uscv+BBI5u/Pcoznhl5YQFl4Fg==
X-Google-Smtp-Source: ABdhPJxf/wxaLrByJQKeLfO+RTYrRC8nU2ZTBjpj+9snBKtvZmDtOG0GOlbl0kzwhkTQ7TDx1Fp2DA==
X-Received: by 2002:a05:6000:188e:b0:1f1:f8f0:f75a with SMTP id a14-20020a056000188e00b001f1f8f0f75amr3714496wri.682.1646924371520;
        Thu, 10 Mar 2022 06:59:31 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id g11-20020a5d554b000000b001f0326a23ddsm4303394wrw.70.2022.03.10.06.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 06:59:31 -0800 (PST)
Message-ID: <c3e75761-e554-d8b1-f41d-f7bed5a0cce7@linaro.org>
Date:   Thu, 10 Mar 2022 14:59:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        alsa-devel <alsa-devel@alsa-project.org>
References: <20211224161334.31123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5ea7235-8642-6a89-f4ce-bd0861b6e4aa@linaro.org>
 <CA+V-a8tkhERx+8zDae5aWkNQ9Oxd1AamRL=i4TDC2X8RGgAo0w@mail.gmail.com>
 <5e13c1ba-0bf5-e360-c350-e7a1a1402350@linaro.org>
 <CAL_Jsq+CWKvkHMNhAa3o_rSLy_+AoHi6wkB3MRM8O3jJ5sG_Wg@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CAL_Jsq+CWKvkHMNhAa3o_rSLy_+AoHi6wkB3MRM8O3jJ5sG_Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/03/2022 14:14, Rob Herring wrote:
> On Thu, Mar 10, 2022 at 4:42 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 10/03/2022 10:23, Lad, Prabhakar wrote:
>>> On Thu, Mar 10, 2022 at 10:16 AM Srinivas Kandagatla
>>> <srinivas.kandagatla@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 24/12/2021 16:13, Lad Prabhakar wrote:
>>>>> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
>>>>> allocation of IRQ resources in DT core code, this causes an issue
>>>>
>>>> Are you saying that we should not be using platform_get_resource(pdev,
>>>> IORESOURCE_IRQ, ...) on drivers that support DT?
> 
> We should be using platform_get_irq(). (period, on all platform drivers)
> 

Thanks, I see why is it preferred.

Code as of now will not prevent drivers from calling 
platform_get_resource(..IORESOURCE_IRQ).

Are we planning to enforce this in any way?

>>>>> when using hierarchical interrupt domains using "interrupts" property
>>>>> in the node as this bypasses the hierarchical setup and messes up the
>>>>> irq chaining.
>>>>
>>>> Should this not be fixed in the DT core itself?
>>>>
>>> Yes the plan is to fix in the DT core itself (refer [0]).
>>>
>>> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>>>
>>>>>
>>>>> In preparation for removal of static setup of IRQ resource from DT core
>>>>> code use platform_get_irq().
>>>>
>>>> I would prefer this patch to be part of the series that removes IRQ
>>>> resource handling from DT core.
>>>>
>>> Since there are too many users (which are in different subsystems)
>>> getting this all in single series would be a pain. As a result it is
>>> split up into individual subsystems.
>> Am happy for this to be included in that series,
>> TBH, this patch make more sense along with that series than by itself.
> 
> No it doesn't. This is no different than converting to devm_* variants
> or other cleanups to match current preferred styles.
> 
> Treewide cross subsystem clean-ups are a huge pain to merge. Why would
> you ask for that when it is clearly not necessary?

Only reason for this ask was to understand how platform_get_resource() 
will change moving forward, if this is something that you are planning 
to include in your fix patches.

I can go ahead and apply the patch, if that helps.

--srini
> 
> Rob

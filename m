Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E19C664E9C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Dec 2022 11:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbiLPKtS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 05:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiLPKtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 05:49:15 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C612DF11
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 02:49:13 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j4so2965078lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 02:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJrdYERjytvAiWabhOlSQ3pR8NUoeJMAn6Y9ojqZmDw=;
        b=RyotZuUZKfhYRXKjw5sAvyIoIH7TB9HzWfI2n+SYFWBG2o97Cbldhn3mOdjn+hQlrn
         T5XVBhPNgLLuNOlYuqBlpNPS/FV8afM11n6klEZhMHQz/rElDDqbanGCKq7J6oX1S1K7
         UZUt1vqiRiw28z9t0gdm0pi7CdzQM3fpK5qJCk3Xru1qGhH1BMr/qVxmstmRvOAaNffZ
         +bxWPQKgGICehQpCiTXoIWsP0Ryh3/Kv5fr2Te01tDH/ZcNT0lDGSaIW0I0tj6g4OUn+
         ulqC5got+b7nhY64pFAXdpL1C7wL0O87k3vw2oXsQrpd8ceMjUKrn/I3O1AWydeoKS0j
         gr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJrdYERjytvAiWabhOlSQ3pR8NUoeJMAn6Y9ojqZmDw=;
        b=lSi4LywpunhTy7C4xhNGIZ39NYhJiQvNzAOSSGEcNRGZ/Wv2PBwiZ4kBLnCMRAM4Us
         4VLC4j+2Qh/3gYqop/qlvr/Bw6zZWNNUQ/hzAl31ghve62dOuLujIQ4EZgiCqbzXXM7v
         f4IYt3Lsb3q7gwyrhiWq6RyIzE5T7WcQZEy6QxKSOUGuhy8TI82owE8811/I9AS2MuhZ
         h3nO0ve5NqKCxBI7EhgFGf//k/gqpkLBytv/2qTGAquB3e07Ka5ShgFbihv9yV+FQSVV
         92nqnA9rVMpCtAuu4T5yDRENRHBzx7WlEJiRhFHcsbLFT4zEkGUH2ryaogiNh5H10TtT
         7guw==
X-Gm-Message-State: ANoB5pnjKKkFAibAKiym0Bt5iqqBWHtAoK9GxNf0ZIP7Aei0+lPdZX0Z
        ox9fiEmgx6UccIHcVPpufysRdQ==
X-Google-Smtp-Source: AA0mqf5jVA74oN0Pq/2lJHEHKh2SzMjC7jTYTydx07cdpgsWeMLv9dMW9U2TSdFWkO9cwV1XWLGv1w==
X-Received: by 2002:a05:6512:c0f:b0:4b5:6f7b:5076 with SMTP id z15-20020a0565120c0f00b004b56f7b5076mr10412574lfu.64.1671187751714;
        Fri, 16 Dec 2022 02:49:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v21-20020a056512349500b004a44ffb1050sm186858lfr.171.2022.12.16.02.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 02:49:11 -0800 (PST)
Message-ID: <49be7501-916a-8d84-9757-fd31fab991dd@linaro.org>
Date:   Fri, 16 Dec 2022 11:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH] arm64: dts: qcom: Use labels with generic node names
 for ADC channels
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209215308.1781047-1-marijn.suijten@somainline.org>
 <3d5b29f3-8d8d-93a7-a485-5261e2d8891d@linaro.org>
 <20221210165434.3hhen5mgtvflghks@SoMainline.org>
 <0bc1eba8-bc26-0bdb-16bf-78160c27c57b@linaro.org>
 <20221214205556.jdbcv3e4fkvm7f3y@SoMainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221214205556.jdbcv3e4fkvm7f3y@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/2022 21:55, Marijn Suijten wrote:
> On 2022-12-12 09:48:26, Krzysztof Kozlowski wrote:
>> On 10/12/2022 17:54, Marijn Suijten wrote:
>>> On 2022-12-10 12:02:03, Krzysztof Kozlowski wrote:
>>>> On 09/12/2022 22:53, Marijn Suijten wrote:
>>>>> As discussed in [1] the DT should use labels to describe ADC
>>>>> channels, with generic node names, since the IIO drivers now
>>>>> moved to the fwnode API where node names include the `@xx`
>>>>> address suffix.
>>>>>
>>>>> Especially for the ADC5 driver that uses extend_name - which
>>>>> cannot be removed for compatibility reasons - this results in
>>>>> sysfs files with the @xx name that wasn't previously present, and
>>>>> leads to an unpleasant file-browsing experience.
>>>>>
>>>>> Also remove all the unused channel labels in pm660.dtsi.
>>>>>
>>>>> [1]:
>>>>> https://lore.kernel.org/linux-arm-msm/20221106193018.270106-1-marijn.suijten@somainline.org/T/#u
>>>>>
>>>>>
>>>>>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>
>>>> The talk was in context of bindings, not about changing all
>>>> existing users thus affecting DTS.
>>>
>>> And as a consequence, DTS.  The already-merged transition from OF to 
>>> fwnode resulted in `@xx` to be included in the ADC channel name - and
>>> in the case of ADC5 even in sysfs filenames - so this seems like a 
>>> necessary change to make.
>>>
>>> At the very least I would have changed the bindings submitted or 
>>> co-authored /by myself/ since I initially decided to rely on this
>>> (now obviously) wrong behaviour, and should have used labels from the
>>> get go.
>>>
>>>> What's more, to me "skin-temp-thermistor" is quite generic name,
>>>> maybe "thermistor" would be more and reflects the purpose of the
>>>> node, so it was more or less fine.
>>>
>>> Are you suggesting to not use "adc-chan", but "thermistor" as node
>>> name (and still use skin_temp as label)?
>>
>> No, I am just saying that some of the names were correct, so the
>> reasoning in commit msg is not entirely accurate.
> 
> The commit msg doesn't state that any of these names was wrong, rather
> that the label property should be used to convey a name to the driver.

It stated: "with generic node names" and I said that some of the names
are generic. Anyway, I am fine with changing the node names if this is
coded in the bindings.

> 
> If you think multiple /node names/ are acceptable, please discuss in
> that direction.  Do we use a predetermined set of names (adc-chan@xx,
> thermistor@xx, ...) or do you have another suggestion?
> 
>>> Or to keep the fully-written-out "thermistor" word in the label?
>>
>> No, I don't refer to labels. Labels don't matter, they are being removed
>> entirely during DTS build.
> 
> Ugh, I knew this was becoming a problem, even in an earlier IIO
> discussions with Jonathan it was sometimes hard to keep apart:
> 
> I am /not/ referring to DTS labels, but to the `label =` node
> attribute/property, which is read by the driver (which isn't removed,
> how else would the driver fish this value out at runtime...).
> 
> After all none of this patch has any DTS labels, in fact a bunch of
> unused ones in pm660 have been removed... but this patch /does add/ the
> `label =` property to many nodes.
> 
>>>> Anyway I am against such changes without expressing it in the
>>>> bindings.
>>>
>>> As expressed in [1] I suggested and am all for locking this change
>>> in via bindings, and you are right to expect that to have gone paired
>>> with this patch.
>>
>> Yes, I expect such changes to have both binding and DTS change together.
>>
>>>
>>> I'll submit that as the leading patch to this in v2, with the
>>> wildcard pattern changed to adc-chan (or something else pending the
>>> discussion above), and should I then also require the label property
>>> via `label: true`?
>>
>> I don't think label is required.
> 
> My commit message explains why the ADC5/VADC driver should really
> receive a label property instead of using the node name.

The reason "unpleasant file-browsing experience" is usually OS specific,
so it does not justify requiring a label property. Label is just a
helper for the users.

Best regards,
Krzysztof


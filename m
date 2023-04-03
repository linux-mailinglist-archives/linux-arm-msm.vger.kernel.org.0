Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061D76D4188
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 12:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjDCKGy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 06:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbjDCKGi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 06:06:38 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981BA11E8F
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 03:06:34 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id b6so9685859ljr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680516393;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K3yzPzF9D9BEiHqsWo+FxrnZSOR2OvLC/xt8gom0tVE=;
        b=vZMB/nwLszxTDhawxNROtVEA8jD/Z5QHjF7F3iCHYvORmn1XMSQ/afAosMpJXStlE3
         KPVfF3xDA4UnfyvLNZgezk7HbNpDM2rZTvoXUV2az42VxrYPqbhzzzuLGTNoMNGllEWH
         zhiq/8GM9gvurlzRd6C8M/Al6p8hqnmqiej88aox3px7S4I2N+enI5qIg3kIdR7CpZ2G
         heCGbfPHWyjpizB+ru9in9Y7W5TkdBfO9Lj/Pnxp6tqJ6KySH1fvSxNlDowJJ8xs6UbG
         mJHqk6e1Mu3md6qu6hmvIB/aN9kBp1WFXayJeqAY0z9QO1T3OLc25gySeaBWNE8jZXX5
         kjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680516393;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3yzPzF9D9BEiHqsWo+FxrnZSOR2OvLC/xt8gom0tVE=;
        b=cUFHRlWjrMA6I5iky59n6Gh62lDsvhjkff6BZJJ0x2d45M1n+CeSDb9UcmXIFTKDGC
         s0n9vz0KH7u+gciIfhi2x2AW7xGEq121oswWFp1Y3J03zAhGD45EkU5fG9O9r5xE+5GQ
         LAhdMQmblUL35587AAa+9SGxjPJqaWOTzkWDPmnw6c+wsLbHinh4e3b4fOe1uIpiObGz
         X65NiEfkPkIvM9LgafZAKR+8HwIx1E+w1HRMqUZZLDhIoBhO8nX6NxbymyppprnHh04m
         GqMlQDug+gXK3JjA5o/xdH00WRLAdDsZ4e89u0YekbsF5Vz/YQ0/ypHoUokD93E1d0pP
         RCHA==
X-Gm-Message-State: AAQBX9c/+2ZrWRb1kEbB0n1L/PFTw7uT/Oxiaroq1sIXF+ihBWAUdoCA
        rjONyH2EiNZF58oD252R7jx7NwayeoCilL7JJO4=
X-Google-Smtp-Source: AKy350bVbB5+/aOlG9hHAtd4e3B6hkEsUM6lgxdA6c4rf6Le0HQLbNZEkjl1fkNjHI8V4Zb9VtrFKg==
X-Received: by 2002:a05:651c:22e:b0:2a1:2cb4:5f81 with SMTP id z14-20020a05651c022e00b002a12cb45f81mr9880295ljn.36.1680516392806;
        Mon, 03 Apr 2023 03:06:32 -0700 (PDT)
Received: from [192.168.1.101] (abxj135.neoplus.adsl.tpnet.pl. [83.9.3.135])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e824a000000b00295b1b6e063sm1642255ljh.34.2023.04.03.03.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 03:06:32 -0700 (PDT)
Message-ID: <d216f67b-80c9-d64b-787a-23535d7fb422@linaro.org>
Date:   Mon, 3 Apr 2023 12:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 03/22] arm64: dts: qcom: sc8280xp-pmics: use pmk8350
 specifics for pon device
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
 <20230401220810.3563708-4-dmitry.baryshkov@linaro.org>
 <0d7d1fcb-e914-907b-0ed5-44e104929766@linaro.org>
 <CAA8EJpqqnRvJJUJn3VoFaBncMz1mgn6_q4vHp6Pv2L9V4QOdKQ@mail.gmail.com>
 <f25647d0-2526-da0d-42fb-abbe5284d22c@linaro.org>
 <07b87a68-14ee-41d8-27dd-7067fc7c8fd6@linaro.org>
 <34bacd09-829b-9a29-d3a7-bea107072ebb@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <34bacd09-829b-9a29-d3a7-bea107072ebb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2.04.2023 13:12, Krzysztof Kozlowski wrote:
> On 02/04/2023 13:03, Dmitry Baryshkov wrote:
>>
>>>
>>>> region. I did not intend to have this patch backported (no Cc stable).
>>>> If I were, I could have also added a Cc stable # 5.19.x 03fccdc76dce.
>>>
>>> AUTOSEL will backport it anyway, if you do not mention otherwise.
>>
>> Is there a way to influence AUTOSEL to make it also pick up another commit?
> 
> Only via usual stable kernel patch rules/syntax.

Additionally, some patches submitted via Option 1 may have additional patch prerequisites which can be cherry-picked. This can be specified in the following format in the sign-off area:

Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
Cc: <stable@vger.kernel.org> # 3.3.x
Signed-off-by: Ingo Molnar <mingo@elte.hu>

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html


Konrad

> 
> Best regards,
> Krzysztof
> 

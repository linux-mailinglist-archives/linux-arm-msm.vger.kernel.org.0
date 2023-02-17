Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78BBA69B47B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 22:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjBQVQ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 16:16:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjBQVQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 16:16:58 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C174D5DE38
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:16:56 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id y20so2477955ljc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ak+8LJfZoxeGXvU223WgSUa5zrwLYuaf0G4KExhaBo=;
        b=WzEOsJAM51nZI+PuUQMFYxrbKH7Kjm8RcRectrj+YJYrBMe+/jr5G9W5GGLK273tAj
         gyjiRxoptN1RuyRNovdVWFp+ptTyoDHm529ypMikm1AiVSB5GDRWTDsMSOPt9EFaDz2E
         pQFdM4oRJUIWegWmV0VxOKzhP9sc5f8lirdFKrWE21JUKlh/tWSsWIrK5mqV4YmP0iry
         jOdqCvOeVogJ3hFYfAIi8tNUZOL0RqszwRCt3aaK0ZJCB0kRRZY0DgfyHNycj3SAnZyB
         LJUHYJK4iBf+vmfocarwLgTs7Logeygdg3qTkX5+At0uvcMB8dBYFrjcgD+dhuM0EmAF
         mSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ak+8LJfZoxeGXvU223WgSUa5zrwLYuaf0G4KExhaBo=;
        b=PVU3Zh2AZJC1jbqGCZRk0IuDDcbHzCYhzZKHlkCj0wTrYdq13dily36i4MRrZNjvCq
         GrsIN52hyi9LH5wbntqjXi9EuwJVyXG52QlMVlCZuKj1dD/MXgmmxGk9LtP70YsnMFSi
         CdvG+1gLaRwO3l1bqsdBOk69cWIt6kTnTgS257zDoqjAD5qFrgWDls0NaH/GJAoMv344
         /Lmc/KMAfBjMj4KwMuTHOz+N+YvQfAgLT4Wrn867J8rELOFW15o7qMdxWO5UOB7GUtDe
         0272HK5eKqxfJHL8RRQy3BjsPiV7DZYBFQWEWZfcJCnlEf3GwjkVOnThE//QCxOojUIH
         Y+lw==
X-Gm-Message-State: AO0yUKX2tIxNokbMBv0Ndnz1kIH9aaYUNWYfebYuWl/muMhlQwgFcm5Q
        RwcTDnrejWSsH4wmr23JqrXDHw==
X-Google-Smtp-Source: AK7set8VSoLlRuQGJZe18IhRYONY61gU+0TX2DkgH0lkoDkSvTfwelptN1tew4Wv5aXvT6asmBteAw==
X-Received: by 2002:a2e:7112:0:b0:293:4fff:9f0b with SMTP id m18-20020a2e7112000000b002934fff9f0bmr333071ljc.19.1676668615011;
        Fri, 17 Feb 2023 13:16:55 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
        by smtp.gmail.com with ESMTPSA id t13-20020a05651c204d00b0029571d505a1sm31133ljo.80.2023.02.17.13.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 13:16:54 -0800 (PST)
Message-ID: <76de00dc-f128-e609-7f0c-b53161036b97@linaro.org>
Date:   Fri, 17 Feb 2023 22:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
 <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.02.2023 22:13, Bryan O'Donoghue wrote:
> On 17/02/2023 12:24, Krzysztof Kozlowski wrote:
>> First, it would be nice to know what was the intention of Bryan's commit?
> 
> Sorry I've been grazing this thread but, not responding.
> 
> - qcom,dsi-ctrl-6g-qcm2290
> 
> is non-compliant with qcom,socid-dsi-ctrl which is our desired naming convention, so that's what the deprecation is about i.e. moving this compat to "qcom,qcm2290-dsi-ctrl"
> 
> Actually I have the question why we are deciding to go with "sm6115" instead of "qcm2290" ?
> 
> The stamp on the package you receive from Thundercomm says "qcm2290" not "sm6115"
Correct, but QCM2290 is not supported upstream yet.

SM6115 (a different SoC) however is, but it used the qcm2290 compatible
as it was a convenient hack to get the DSI host ID recognized based on
the (identical-to-qcm2290) base register without additional driver changes.
We're now trying to untangle that mess..

Konrad
> 
> ?
> 
> ---
> bod
> 
> 

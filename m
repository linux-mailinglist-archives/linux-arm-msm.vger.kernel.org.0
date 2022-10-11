Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CED005FBB47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 21:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiJKTVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 15:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiJKTVP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 15:21:15 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06404CA3E
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 12:21:13 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id i12so9601284qvs.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmEF+NGLF11jPqtgt2Pd4Z8enI9aLSuKQeY/WvYqRjs=;
        b=LibFoMgc48nlHlZ428E8aZbPq7/XknNj97vx6Cv9C2j900wmWIxaKdqhF2Yfj2r6i1
         wfKGku0x5Zc964sNjHVE2FIJCtmsJMEq+g3ynD3sq2Ew2i9W7WPa30+y0duyZad73uTk
         FiHldmwcEv7e0spGT+D51o+T+XpCXPeS89knzp89kn6cBoGiNAPB2uQCVYqaCoFZgyps
         cqoD4mpbBkvAUFwGN/6W5sMjdf5TUNyWFuwlZuj/F26raA+5zKnE2U2PDrcBP2Q475Nz
         f9NEpH3PqpxwaTscccr16q/x5JodLpYFcBwI4a2AnhsUurKCjbSy3oljr7N2Da028hkW
         DfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmEF+NGLF11jPqtgt2Pd4Z8enI9aLSuKQeY/WvYqRjs=;
        b=kHu6ZmMFvp9FUy9iFiAoGnfCK3t4Fk/lvG0PWnwb57nmEpUx9hVK0gT2pio/cY6dkx
         E0H1z0gqUYM1PNRwqbij+hr5t9eOSKXDqchzByKH4xf1YwWA1p8rPgS2361VGc5l4vYd
         juhIkDs/28uu4OlHpV/ajJWDjrMJlQl85opdVqeJftwdvuWHUjMSBGVRwDLoMhiLfnIS
         aRnv71epa6yibv/q9v6n0Y65PZxLFYk5AYI0pHFyfVkAps1dL2fmcDXtsXmS13jCeblR
         N/1bCCZHstT4+uys0J/SK+iT84OAlSH5C3DNO0IReAU8JADvUsnzHr/auCnJ9fRnBog0
         LTeg==
X-Gm-Message-State: ACrzQf3cAceLxOs4lqFa3+P4wTt85ZumyZNlSFkC3AAO2NwWyUfFGba1
        QzdoiPEUpSntOgeRzFafQyYe/ugeOHy2oA==
X-Google-Smtp-Source: AMsMyM5DUxIlpfZ6bqiFNuPrrfAew0wxvdSaoYn3nWXxqrjTp53xuByVBAfEkoeEGSO29IhHWKE4/g==
X-Received: by 2002:a05:6214:d8a:b0:4b1:9f67:450b with SMTP id e10-20020a0562140d8a00b004b19f67450bmr20415304qve.119.1665516072837;
        Tue, 11 Oct 2022 12:21:12 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id e124-20020a37b582000000b006ceb933a9fesm13684107qkf.81.2022.10.11.12.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 12:21:12 -0700 (PDT)
Message-ID: <4912f46c-e990-a886-cc2a-8684d61eed38@linaro.org>
Date:   Tue, 11 Oct 2022 15:19:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 03/19] arm64: dts: qcom: qdru1000: Add tlmm nodes
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221001030656.29365-1-quic_molvera@quicinc.com>
 <20221001030656.29365-4-quic_molvera@quicinc.com>
 <ad743621-8e2d-23f9-8c44-53f6681aa134@linaro.org>
 <7674b756-75d5-6ca3-d4fe-c54bd92a3fd7@quicinc.com>
 <ddb4566f-b420-6ee8-b3f5-3eeb83ad2d8b@linaro.org>
 <3885c1d1-ab6f-2b30-2950-f4dc0ec54152@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3885c1d1-ab6f-2b30-2950-f4dc0ec54152@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2022 15:05, Melody Olvera wrote:
> 
> 
> On 10/11/2022 11:57 AM, Krzysztof Kozlowski wrote:
>> On 11/10/2022 14:48, Melody Olvera wrote:
>>>
>>> On 10/1/2022 2:14 AM, Krzysztof Kozlowski wrote:
>>>> On 01/10/2022 05:06, Melody Olvera wrote:
>>>>> Add tlmm node for the QDU1000 and QRU1000 SoCs and the uart pin
>>>>> configuration.
>>>> The patchset should be squashed with previous. There is no point in
>>>> bringing support piece by piece. You can bring support in steps if you
>>>> submissions are separate in time. But if you have everything ready -
>>>> your patch must be complete and bisectable.
>>> To be clear, does it make more sense to submit the base dt first, then submit each
>>> driver with all the dt changes as one patchset?
>> No, because you have DTS ready. There is no incremental work here.
> Ah ok so just squash all these commits into one and submit.

Except the board DTS. Other bigger, self-contained pieces of work can be
also kept separate, but such work is not "add a DMA". Such work could be
- add display (with clocks, DMA, GPU, power domains) or sound (again
multiple separate devices added).

Best regards,
Krzysztof


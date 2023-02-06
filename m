Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2F868BD38
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 13:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjBFMry (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 07:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjBFMrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 07:47:53 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE80F659F
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 04:47:48 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id ee13so4919992edb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 04:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5DN2T+FoaYMxmg8TLDTDI4iU0ffTdNlMHvOCFsMyfhA=;
        b=bRWUQ7N/qBN8LD8Ox+U8aeVwyNqwgsMc45xpBMm95v3bysYfdrEUWMA5+W7U+PUPhG
         gIowsIi373/pWio6pbLv3yrLq7pyQAPqy6DxYwhWAbqSPKaZyyQxSO+u5EhJM6I3d1Zt
         b3CToYrBNA9TbiXpbqg1xsMLchER1BqE9PBk0oGL2TBC6jGfpaaWuLkM1rhlOZ2/cmYT
         gU4G4dE5GR1luTZipiv6h1gkqg6RyuLNA3r9duHOqXsbbdvw+UoeLjSaa2K3i6595o4c
         JsRzpkFlQReaGVGl2c74QL+xRE+yzlV2No0FN98CclQoUaJ1BN2bY0v3bfO0RFnO+8oJ
         Quog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5DN2T+FoaYMxmg8TLDTDI4iU0ffTdNlMHvOCFsMyfhA=;
        b=jdJNKAjv1ZGUKZ53wTntreXjEqD1Z3YtEBWWSrRsx5+cbI+l8uZ2ELAhjxShMzGEfU
         YcE6EA6JfGki7GVg5YGQgBCue6sQTf5rirD064slok8BGK+XusgMPM485Gmnqm9/ZsaT
         JufNmC3Rrs9O6KcPIOF43R5drYnJfgsupqRfR8R5nZN//7ffZ4lbnOttxAmpOP+P7jZl
         n+qfVrFPdDb0O6UaxCm8znfh+GHBLWIJJwo9noe5ahrrlq9ykT9qxistHHyy/IVQyUjz
         /3fW53AL2ZTnOwSRaC3CwcnawP501YoQC9tkafhdwsqX+iGsvX9UGIfD4gmIHMbhJxl9
         vMXw==
X-Gm-Message-State: AO0yUKXo5Mmg5Njg71ktDq3Tga97olJTRbaC2DIyjKlV2NjMJ0TYuxD4
        +nIt2r+7swWGpfpwpecyKPsFWw==
X-Google-Smtp-Source: AK7set91Xx8O+vjtfnvt4DKIlfdRGhoXBCDphUZkeom5ObV5xo0u74vxuyVNATJOjkEiuj38tEYK6w==
X-Received: by 2002:a50:aade:0:b0:4aa:b26f:1a0a with SMTP id r30-20020a50aade000000b004aab26f1a0amr4560602edc.27.1675687667457;
        Mon, 06 Feb 2023 04:47:47 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t1-20020a056402020100b004615f7495e0sm5092328edv.8.2023.02.06.04.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:47:47 -0800 (PST)
Message-ID: <45084181-966a-3d5b-3cc5-3170f2d404b8@linaro.org>
Date:   Mon, 6 Feb 2023 14:47:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8350: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-3-dmitry.baryshkov@linaro.org>
 <f563f3e9-2c50-4509-a44d-9406bc725a95@linaro.org>
 <a5635503-2d03-3996-a60f-f6255e407ca1@linaro.org>
 <20b91f29-b47d-3051-a84a-744b8b44f4e0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20b91f29-b47d-3051-a84a-744b8b44f4e0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 13:23, Konrad Dybcio wrote:
> 
> 
> On 6.02.2023 12:22, Dmitry Baryshkov wrote:
>> On 06/02/2023 12:44, Konrad Dybcio wrote:
>>>
>>>
>>> On 6.02.2023 01:27, Dmitry Baryshkov wrote:
>>>> Add another power saving state used on SM8350.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    include/dt-bindings/power/qcom-rpmpd.h | 1 +
>>> Wrong patch?
>>
>> And this patch is correct. sm8350 GPU OPP table uses this value (but as doesn't reference the rpmh's opp states, we don't have to add one there).
> Okay, but it's *just* a header entry, so the subject is
> misleading and you're not adding the dt part here.

Ack, I got your point now. Yes, it should be `dt-bindings: add 
RPMH_REGULATOR_LEVEL_LOW_SVS_L1'.

> 
> Konrad
>>
>>>
>>> Konrad
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>>>> index 4a30d10e6b7d..1bf8e87ecd7e 100644
>>>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>>>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>>>> @@ -211,6 +211,7 @@
>>>>    #define RPMH_REGULATOR_LEVEL_MIN_SVS    48
>>>>    #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1    56
>>>>    #define RPMH_REGULATOR_LEVEL_LOW_SVS    64
>>>> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1    80
>>>>    #define RPMH_REGULATOR_LEVEL_SVS    128
>>>>    #define RPMH_REGULATOR_LEVEL_SVS_L0    144
>>>>    #define RPMH_REGULATOR_LEVEL_SVS_L1    192
>>

-- 
With best wishes
Dmitry


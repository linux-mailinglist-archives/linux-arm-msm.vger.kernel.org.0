Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF9A968BB5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 12:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjBFLXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 06:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjBFLXi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 06:23:38 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0EB902F
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 03:23:30 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id dr8so33112053ejc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 03:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ox3sLMvy5JK6Q/gX+6AJCTV0Sr/EoCPVWT7KFDWPgWg=;
        b=yOMLpd8czAC6J1ZcVEbpS3ijmB5oKfB5VtKT+RLKhLBuhLjXssdx1J0oTKzgkEhqSr
         B8v0EJ5xHwIAkXkTbjedmC1iAsTvP40nEIAkktLfXnOS8EKlr1CRsLwLXYLyTNG7J5+6
         2lAQKLOde2lYL/hJiMoQJ92qjx/qLqr/yBZnuxQXMD6lQ6r3V5qwa5hniuZdw3gBtrJM
         SX6rWUbruFO/cfjyu6IkqqMLRkOMVkafwN2e92b0pJlVkMflVERNHJRSB09V+Th2QSnb
         likk8M4ZYQJhRnDSxr/mfCKOnKYwAm3KkTKE8BJ8zHc4IRdTn5niSY1b4Z3zI7uNeMPu
         ncKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ox3sLMvy5JK6Q/gX+6AJCTV0Sr/EoCPVWT7KFDWPgWg=;
        b=L+LPBr/RgzHKDuFdFcH6jHAKUoFGQsRpTd5WTFJUnPjxfhW8dvrWWMSn5As60icKEZ
         Vi6qM7LX0Q4Cblg59m9SlGjyPlfotsmsUZkuM01QncVoLAY4W6wQdfNuOcAO3rfSJIWH
         DC6aFS+SSfPnbLOqEcV+xie/P4PeND8BBTqT+zYwBpMI2vz4+FsoSRrFnrH5nhwWii4P
         hM0louSZ8dKV1+j1tLT+DmZWiWXtsk/5tG8e4W13Oe4kzYDieQj/VIi2xI7b/Yzh2dXL
         vFIVRmj3PJHovmvB5Fmy13a5Kibn3Uue7jbmNsGKuhBwaQAB5xhG9fV7nie9xqRC6CNu
         UtZg==
X-Gm-Message-State: AO0yUKXmAqmuV1Kb2lH0bbJ9NJYzM4dkjvz86jUvK5+e4NIUxiu50YKi
        ZC3CTwfRNV0YAY1mVSfMeu7x9A==
X-Google-Smtp-Source: AK7set+Ipi12ujUkGwXBVG19EHyv6UWyXlhzd4uEvFMQxrrgXjQAxrfRMv6ClUrW9ZI8GvM5FU6mLw==
X-Received: by 2002:a17:906:140a:b0:88e:e498:109b with SMTP id p10-20020a170906140a00b0088ee498109bmr15880643ejc.5.1675682608885;
        Mon, 06 Feb 2023 03:23:28 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id u21-20020a170906125500b0089b6fd89429sm2244298eja.10.2023.02.06.03.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 03:23:28 -0800 (PST)
Message-ID: <20b91f29-b47d-3051-a84a-744b8b44f4e0@linaro.org>
Date:   Mon, 6 Feb 2023 12:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8350: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a5635503-2d03-3996-a60f-f6255e407ca1@linaro.org>
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



On 6.02.2023 12:22, Dmitry Baryshkov wrote:
> On 06/02/2023 12:44, Konrad Dybcio wrote:
>>
>>
>> On 6.02.2023 01:27, Dmitry Baryshkov wrote:
>>> Add another power saving state used on SM8350.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   include/dt-bindings/power/qcom-rpmpd.h | 1 +
>> Wrong patch?
> 
> And this patch is correct. sm8350 GPU OPP table uses this value (but as doesn't reference the rpmh's opp states, we don't have to add one there).
Okay, but it's *just* a header entry, so the subject is
misleading and you're not adding the dt part here.

Konrad
> 
>>
>> Konrad
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>>> index 4a30d10e6b7d..1bf8e87ecd7e 100644
>>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>>> @@ -211,6 +211,7 @@
>>>   #define RPMH_REGULATOR_LEVEL_MIN_SVS    48
>>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1    56
>>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS    64
>>> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1    80
>>>   #define RPMH_REGULATOR_LEVEL_SVS    128
>>>   #define RPMH_REGULATOR_LEVEL_SVS_L0    144
>>>   #define RPMH_REGULATOR_LEVEL_SVS_L1    192
> 

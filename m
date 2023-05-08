Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0718F6FA819
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 12:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbjEHKhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 06:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234833AbjEHKhW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 06:37:22 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A9915695
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 03:37:20 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f24d4900bbso1284772e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 03:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683542238; x=1686134238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLguggw99xxqCuarIT3sUQKT9PSunZQtK0bgeU/RtAI=;
        b=RunXxGhCzpDGn6pLJ57TvtLicVHmUMuaTPbKVbMh0/Tl9TAlIu4XLnfDIFLE7yUIvg
         2wcEjjES8dC+9VZn9XG2o8EvAT54X2PfBY6juyi4PbQL1RR1svi5RqUt4QahhHkcH0TG
         6WynqtLL2k7KYSuVvjPSuBHhTbpEWX8od55JmoWnwimRyTmJt6S4ajivW+DNGVn2ZlWh
         EPRJ1ncyqYIo2j/z8Ebjztf+SDGYALhjoHycP+3I6hOSbFi9ePwITc1B5Xh5QU59wx8z
         yhnJWXJL2Vn2h98+cRPYHR+v1iGcEYZKs2K2J/9n+X/0IqGFjIc0h7fDp5sx785HgY+t
         Dzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683542238; x=1686134238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLguggw99xxqCuarIT3sUQKT9PSunZQtK0bgeU/RtAI=;
        b=ZgyrA32WojXARE/FllSPzn1lPVmykVXjayLPnlGDYNv/3dcJYUVkBV4qtMHUneHXQd
         pwuFhxRnU2UoB43NWhG/X2Op62P7z2+nXEafYpOMD/maEHQZPVhC+DFix0B5NBUIbBfm
         r8K+KdYw2HLuzprk5tAZ4ophVUaCiE9z8zJL9N3FKynUP6qVOr+MLsKUd5Nvth+D3DBv
         RPA1XA/Jn+BYItGWM6eSL1Xp8/1dJ/HQyfKqe/GWRNxTioRgf29SVjJzKkeV+YNCGTN9
         bn7D5gAarGtJlQPUrd+to8A5x535+pABHunXctvqK4zn97JLLGOMDLkfoKtAGO74GmQp
         6vIQ==
X-Gm-Message-State: AC+VfDxVddG0Cv3iFHBxXYG58KjYu+28KutnCGC2pZg8xHIz/Os5yRz5
        Wjngf/m2ktQl1GfN1d5X84carw==
X-Google-Smtp-Source: ACHHUZ5n18z4iUjRdX6K7JArdf1SKPjPwSsDbFmbRiDF7lAyFUSB4i9jw28FQgs11ZbpeZW1za5OPA==
X-Received: by 2002:ac2:5501:0:b0:4e8:5e39:6234 with SMTP id j1-20020ac25501000000b004e85e396234mr2228676lfk.16.1683542238452;
        Mon, 08 May 2023 03:37:18 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id u1-20020a056512094100b004edd3f011cfsm1251929lft.43.2023.05.08.03.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 03:37:18 -0700 (PDT)
Message-ID: <f2754e31-ce69-9426-a41e-2c58686f7f53@linaro.org>
Date:   Mon, 8 May 2023 12:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add ocmem clock to GPU
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-2-dmitry.baryshkov@linaro.org>
 <8cdecc51-2a42-4b82-9eb3-2ab77860c5d4@linaro.org>
 <c8144b21-d672-318e-2761-5d1daf384c30@linaro.org>
 <d357a6f9-d66b-0ba1-138c-4b541c3bebfb@linaro.org>
 <01fc4065-681f-daba-1c73-cc57768f880e@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <01fc4065-681f-daba-1c73-cc57768f880e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.05.2023 12:32, Dmitry Baryshkov wrote:
> On 08/05/2023 13:28, Konrad Dybcio wrote:
>>
>>
>> On 8.05.2023 12:24, Dmitry Baryshkov wrote:
>>> On 08/05/2023 11:30, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>>>>> To get GPU working with the OCMEM, the oxili_ocmemgx_clk clock should be
>>>>> enabled. Pass it to the GPU to get it to work on apq8074/msm8974 boards.
>>>>>
>>>>> Fixes: fe079442db63 ("ARM: dts: qcom: msm8974: add gpu support")
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>> Uhh.. this clock should be managed by RPM with:
>>>>
>>>> type = MEM
>>>> id = 2
>>>>
>>>> just like it's defined for 8994 today.
>>>>
>>>> Could you try adding it in rpmcc and confirming?
>>>
>>> There is an RPM_SMD_OCMEMGX_CLK clk already, it is a bus clock for the ocmemnoc.
>> It's wrong.
> 
> Can you possibly be more specific here?
> 
> On 8974 RPM_SMD_OCMEMGX_CLK is a core clock for ocmem and a bus clock for ocmemnoc.
The ocmemnoc bus is managed internally, the rpm clock is not used for scaling,
only to make sure the NIU is clocked for ocmem node access.

It's "scaled" with the ocmem-slv node, but the code never sets any rate,
only calls clk_get.

> 
> On 8994 this clocks is just a core clock for ocmem, there is no ocmemnoc.
It's there, named "fab-ovirt" and on 8994 it's actually used for scaling.

Konrad
> 
> 
>>
>> Konrad
>>>
>>>>
>>>> Konrad
>>>>>    arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>>> index 834ad95515b1..fb661c1bd3d5 100644
>>>>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>>> @@ -2104,8 +2104,9 @@ gpu: adreno@fdb00000 {
>>>>>                  clocks = <&mmcc OXILI_GFX3D_CLK>,
>>>>>                     <&mmcc OXILICX_AHB_CLK>,
>>>>> +                 <&mmcc OXILI_OCMEMGX_CLK>,
>>>>>                     <&mmcc OXILICX_AXI_CLK>;
>>>>> -            clock-names = "core", "iface", "mem_iface";
>>>>> +            clock-names = "core", "iface", "mem", "mem_iface";
>>>>>                  sram = <&gmu_sram>;
>>>>>                power-domains = <&mmcc OXILICX_GDSC>;
>>>
> 

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64AF6FA7AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 12:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbjEHKdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 06:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234762AbjEHKdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 06:33:16 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FFF24A99
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 03:32:26 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ac831bb762so41757531fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683541941; x=1686133941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ScXfOKBt81Z5zV2cG1662UPRXJFST6VZnBC6VouOjSc=;
        b=GrmDkGJvrRaoi7LAewDtfUAM0YYBpgUMUKRpSX8RbK2obuLwBwfJlk2QZkc/b7PuJo
         HYWBbWCm6V2TXoHPv+iyQppf1PoYXtBvLAsZFcz5WgJI/QqSZMMF/sXoRZRS7bYhTX7u
         WwtTxeGprytGUZBpLQVgODKMSnmy8v6+XsCbjnm8J1ZIdM6GP0mN3E6/WvSHAO2l0AWe
         sgYQkjyPLeHPI4DErBPWlFeYnfWDxB7oN+SGqAUhJRzN1kmhH4kHm55/TPs4VUZPBhBn
         wWV+Y/Fk3TjSwEnn4WENzWiF0nqRTD6pmpzZdeH9eLGTDKYDM2MpSVAm9Qp2xLqeIZOt
         wnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683541941; x=1686133941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ScXfOKBt81Z5zV2cG1662UPRXJFST6VZnBC6VouOjSc=;
        b=A7xXrMs6uoH4BmlP+wkV0ACrNzfUiqxMKktYoJCB4zTImHJxLZanL1US0M9lvXiwXU
         qTLpUVozwli0fGszMWjYzF6BXEjc3ldbYcN5gTsKZstzTZpXr30YhYX1ZL2FB1RsflrG
         uKUhWo7hTskPOxNpXJSMjsuM+IbZXmUsgs/l2Yv5QTkHl2WbWQdPympfu6RmdxqZ5sXy
         kctasRGgMepKiAa3bsIgnual2DcqonoqnHYlGztzPUl7HmEuh1oxC64eaEpRg8qcx852
         1ZS4vy99XC6aD97opbx46rfg0ZE0vYuf1FsBP6iJkaNj+Ak/7DMvDB4ZYFX3J2mk86ou
         46mA==
X-Gm-Message-State: AC+VfDyWJz50RrjPAI9zzn9G3VcqHXsSFeYyibrOa1vK7z/BSCJelpFT
        CyQEHIPICyjgHgGH9+K1Kr0Q0g==
X-Google-Smtp-Source: ACHHUZ4gpZuq2LgpGp2cEbClw5qjF/b0rPeJcLA8iwjKT4SpwOE0zQ62tK/5XBVkS0mkN6iyEv87UA==
X-Received: by 2002:a05:651c:236:b0:295:9be0:212b with SMTP id z22-20020a05651c023600b002959be0212bmr2763621ljn.8.1683541941628;
        Mon, 08 May 2023 03:32:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l11-20020a2e3e0b000000b002a8dce82cf6sm1127122lja.32.2023.05.08.03.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 03:32:21 -0700 (PDT)
Message-ID: <01fc4065-681f-daba-1c73-cc57768f880e@linaro.org>
Date:   Mon, 8 May 2023 13:32:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add ocmem clock to GPU
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d357a6f9-d66b-0ba1-138c-4b541c3bebfb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 08/05/2023 13:28, Konrad Dybcio wrote:
> 
> 
> On 8.05.2023 12:24, Dmitry Baryshkov wrote:
>> On 08/05/2023 11:30, Konrad Dybcio wrote:
>>>
>>>
>>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>>>> To get GPU working with the OCMEM, the oxili_ocmemgx_clk clock should be
>>>> enabled. Pass it to the GPU to get it to work on apq8074/msm8974 boards.
>>>>
>>>> Fixes: fe079442db63 ("ARM: dts: qcom: msm8974: add gpu support")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>> Uhh.. this clock should be managed by RPM with:
>>>
>>> type = MEM
>>> id = 2
>>>
>>> just like it's defined for 8994 today.
>>>
>>> Could you try adding it in rpmcc and confirming?
>>
>> There is an RPM_SMD_OCMEMGX_CLK clk already, it is a bus clock for the ocmemnoc.
> It's wrong.

Can you possibly be more specific here?

On 8974 RPM_SMD_OCMEMGX_CLK is a core clock for ocmem and a bus clock 
for ocmemnoc.

On 8994 this clocks is just a core clock for ocmem, there is no ocmemnoc.


> 
> Konrad
>>
>>>
>>> Konrad
>>>>    arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>> index 834ad95515b1..fb661c1bd3d5 100644
>>>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>> @@ -2104,8 +2104,9 @@ gpu: adreno@fdb00000 {
>>>>                  clocks = <&mmcc OXILI_GFX3D_CLK>,
>>>>                     <&mmcc OXILICX_AHB_CLK>,
>>>> +                 <&mmcc OXILI_OCMEMGX_CLK>,
>>>>                     <&mmcc OXILICX_AXI_CLK>;
>>>> -            clock-names = "core", "iface", "mem_iface";
>>>> +            clock-names = "core", "iface", "mem", "mem_iface";
>>>>                  sram = <&gmu_sram>;
>>>>                power-domains = <&mmcc OXILICX_GDSC>;
>>

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F74873DF52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 14:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjFZMeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 08:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjFZMeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 08:34:06 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82B210A
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 05:34:02 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b699284ff4so23105821fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687782841; x=1690374841;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8FOnv3gtQFJsCvmXDuYUpI+3WBXTjrzWw58By60ndY=;
        b=aPsCgqnHY9LpR6RbZBVMOGzI99IBgoIg+UqKz7B8CmtFbCeFb8KPFPHbPFVtLJXrRV
         O+HmEjWC7jsayOxJgDmWFHn4PHZX+XU5kgd8AmIc+8C86qwlswbuXa0rfC7IngOOzmwk
         dVxZTaLqNEM5HtZ6Z2l+4e15N3JrCa7qU1bTGYPlmN/lkLlJkI5M2F2CVkMZPPR+PS0L
         p2K3AfQsiWF0/c8Wdqlr+OCRkNtkqGEEYGI9ISV1+fn7UWW16nTOtZHZC5r3aGhvd/9D
         Cp0zVwj2car6BeAXZynyVp0tw+l6XOfqeqfIdTb2B1r4aDmHGKPNvVCrghUWG6CzzVPV
         1VmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687782841; x=1690374841;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8FOnv3gtQFJsCvmXDuYUpI+3WBXTjrzWw58By60ndY=;
        b=YIVeg1magS/MrWevhCT2xe/SBRd6ld/9XiqXD/GicJ1u8Gd7KJiOXdQfYnogwgI8jo
         TII3Z20QRKqp7bENrgZEkriqVcsKQH9yGpl3CYuMr2DW1aoiaNWGLGrba5QF0cnsW2J/
         KktI3LrYGXO9uwY4WhZm3EL8ZV2Thmo5Os5t8IOUufttdhrA57Pa8TTw+Tye/TTJZR8F
         iG6CMfNPmBMcol8f0JaeSUjSDmMh+Ft3Uwth63jGiPrE3Mh/hSObMEKFt9PN8EBiG7Cs
         ip0s+pJfUQxi9ON2L0P4JR+dzbTOUJoNitvQKeZRCbs/qdNd6/qnGN0ecGS5fG8GL7N5
         CqmA==
X-Gm-Message-State: AC+VfDx3hsvjXf+wsd4S4f1YPjhXQqGW7BUUGU9i6S76jddNOVUHbtwi
        d2m5lnHFasrLoqg77EDZ45SVRA==
X-Google-Smtp-Source: ACHHUZ4+N8TcEJs9qamJpwXe8cSYN3hg1vfPjOZIJ4AOBE2Rkjx/KxCj2PAaXbM09/9nIMMPJo227w==
X-Received: by 2002:a2e:7819:0:b0:2b4:7fc5:21ab with SMTP id t25-20020a2e7819000000b002b47fc521abmr13916835ljc.51.1687782840867;
        Mon, 26 Jun 2023 05:34:00 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id u22-20020a2ea176000000b002adb10a6620sm1167948ljl.107.2023.06.26.05.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 05:34:00 -0700 (PDT)
Message-ID: <e5c412a0-a3e9-9938-d767-96364cde0e7e@linaro.org>
Date:   Mon, 26 Jun 2023 14:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        andersson@kernel.org, broonie@kernel.org, agross@kernel.org
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, judyhsiao@chromium.org,
        quic_visr@quicinc.com,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <20230616103534.4031331-1-quic_mohs@quicinc.com>
 <20230616103534.4031331-9-quic_mohs@quicinc.com>
 <b2553058-bd78-6d9f-dcd0-d1c086b4fc3b@linaro.org>
 <20ec31b3-667a-0617-71d4-586789e2c2a4@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [RESEND v6 8/8] arm64: dts: qcom: sc7280: Add qcom,adsp-pil-mode
 property in clock nodes
In-Reply-To: <20ec31b3-667a-0617-71d4-586789e2c2a4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26.06.2023 13:17, Mohammad Rafi Shaik wrote:
> 
> On 6/16/2023 5:06 PM, Konrad Dybcio wrote:
>> On 16.06.2023 12:35, Mohammad Rafi Shaik wrote:
>>> From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>>
>>> Add "qcom,adsp-pil-mode" property in clock nodes for herobrine
>>> crd revision 3 board specific device tree.
>>> This is to register clocks conditionally by differentiating ADSP
>>> based platforms and legacy path platforms.
>>> Also disable lpass_core clock, as it is creating conflict
>>> with ADSP clocks and it is not required for ADSP based platforms.
>>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> ---
>>>   .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi    | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> index c02ca393378f..876a29178d46 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> @@ -197,6 +197,14 @@ q6prmcc: clock-controller {
>>>       };
>>>   };
>>>   +&lpass_aon {
>>> +    qcom,adsp-pil-mode;
>> That's a whole bunch of hacky bindings that makes no sense..
>>
>> What should have been done from the beginning is:
>>
>> - all clocks should be registered inside the clock driver, unconditionally
>>    as far as .c code is concerned
>>
>> - the regmap properties within should reflect the actual max register
>>    range within the hardware block
>>
>> - device-tree should contain protected-clocks, which omits registering
>>    specified clks (I guess in the ADSP-less case you could probably even
>>    register all of them and it wouldn't hurt)
>>
> For AR solution, it is required to add "qcom,adsp-pil-mode" flag to enable ahbm and ahbs clocks.
> Please refer: https://elixir.bootlin.com/linux/v6.4-rc7/source/drivers/clk/qcom/lpassaudiocc-sc7280.c
It does what I've just said, except in an implementation-specific way,
instead of using an existing, common DT property.

Konrad

>>> +};
>>> +
>>> +&lpass_core {
>>> +    status = "disabled";
>> status = "reserved";
>>
>> Konrad
> Okay, will change status flag.
> 
> Rafi
>>> +};
>>> +
>>>   &lpass_rx_macro {
>>>       /delete-property/ power-domains;
>>>       /delete-property/ power-domain-names;
>>> @@ -239,3 +247,7 @@ &lpass_va_macro {
>>>         status = "okay";
>>>   };
>>> +
>>> +&lpasscc {
>>> +    qcom,adsp-pil-mode;
>>> +};

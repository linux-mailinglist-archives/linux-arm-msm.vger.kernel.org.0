Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8826FC17A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 10:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbjEIIN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 04:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234544AbjEIIN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 04:13:27 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A64A10E0
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 01:13:23 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f22908a082so3199896e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683620001; x=1686212001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+a63huvHkNlgxbIA82jUFlFnVbRohtBnA/WfzIW4wD0=;
        b=qxF8cTGXstrZkvtOzXbsVSYyvI4CAjtu1dQdbvbZ/m5ALKUij7PiHBVy3P5d4gUEDD
         AjZnt7JU8tsTIj6M7NGdj8Cbvz3WxIL/5qzwFxfasUyxmSTAn88AgVzBP1n0GFV2or/z
         usUynnYjPy+zxHeR0hQ4EjFpu9FwJ3BG68MV6aEPPgvqn7fiuEnj3SylBhY8Pl1v9A5s
         SiQ1f1sRobaV0uq6F65WzTRyNfBtm5RNz1R9UUnErw4S6Lv7s+GeSgzLb+RUmbH2mCKm
         5waEF940CxElIkXmuQ/RssIsDiIoiBubGVUwfvgLB9V7cEyJ+6PyANkUjX/Gdmv4sBab
         6Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683620001; x=1686212001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+a63huvHkNlgxbIA82jUFlFnVbRohtBnA/WfzIW4wD0=;
        b=DXLkLOrAvC0PsAFHn91CQct0AYoCnsYc8+oaUv/UDVRdIOgA+0p0bRdQrIPqIRS//P
         ZSXTgd8QCX5pkFxDmaj875KXuIkrpaGPznQC5xEFZIYjzP5AjpyzX/LR+iEGMm8vfEY5
         evmcY1/hxy4g9/nFccNociTWp7B6IxSSSD/mt0MSncbVjO3OTskz1olzyQiFrq6JXRng
         +vwi8up5nNnn/iV99oCLbz27rCeuDdNB8stcNf+OgFFFF4Gk5FPRdURr2EXHku1OVRTe
         gm6CcjceSDiqrkm+MMwNhKN6nBQGyqShDRNPfvvMe/YUEwLdfkVZAFSLlonJ0hF03x/P
         TlJQ==
X-Gm-Message-State: AC+VfDy7/NrqvqtDA3FV4BNRkizvpfRtK4ORo680vUPeRiEUuz0re/IF
        B+eRNN4+ObMfzPiJTOiYTbPB0Q==
X-Google-Smtp-Source: ACHHUZ6Q9AwpgoXuzW6lEbqxALgpxFYaIBqIL97ZWrak++tcqNQ2ZwOlggV6brbiaxUZCynYRC0fJA==
X-Received: by 2002:ac2:48b8:0:b0:4ef:f509:1184 with SMTP id u24-20020ac248b8000000b004eff5091184mr559873lfg.3.1683620001224;
        Tue, 09 May 2023 01:13:21 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id f20-20020ac251b4000000b004f14fa44403sm256760lfk.283.2023.05.09.01.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:13:20 -0700 (PDT)
Message-ID: <2776ff92-29ce-4c08-c107-db962e2948a1@linaro.org>
Date:   Tue, 9 May 2023 10:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/4] ARM: dts: qcom: apq8074-dragonboard: enable adsp and
 MSS
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
 <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
 <a86cfa8b-c205-6887-a64e-d51241b74b15@linaro.org>
 <ca274ec9-81bf-c426-6ad6-93eb34b52b05@linaro.org>
 <11863653-84aa-8edf-676f-e55174fb4539@linaro.org>
 <7b90ed61-7789-275d-a743-6065ab6ecdbb@linaro.org>
 <c4775bde-9594-ab35-6765-5d2fe3e9f3b3@linaro.org>
 <CAA8EJppAkE8cBPc2ij8ax6VhsHKOzg1jCs51mSz_+x16oW8Tzw@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJppAkE8cBPc2ij8ax6VhsHKOzg1jCs51mSz_+x16oW8Tzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.05.2023 01:38, Dmitry Baryshkov wrote:
> On Mon, 8 May 2023 at 21:01, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 08/05/2023 13:49, Dmitry Baryshkov wrote:
>>> On 08/05/2023 13:38, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 8.05.2023 12:33, Dmitry Baryshkov wrote:
>>>>> On 08/05/2023 11:33, Konrad Dybcio wrote:
>>>>>>
>>>>>>
>>>>>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>>>>>>> Enable ADSP and Modem DSPs on APQ8074 dragonboard. The MSS region
>>>>>>> differs from the one defined in the msm8974, so it overriden locally.
>>>>>>>
>>>>>>> The modem is specified use mba.mbn instead of mbn.b00 (for the sake of
>>>>>>> similarity with other platforms). This requires a patch for remoteproc
>>>>>>> to be applied [1].
>>>>>>>
>>>>>>> [1]
>>>>>>> https://lore.kernel.org/all/20230507172041.2320279-1-dmitry.baryshkov@linaro.org/
>>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>    .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 28
>>>>>>> +++++++++++++++++++
>>>>>>>    1 file changed, 28 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>>>>>> b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>>>>>> index 6b047c679370..c893afc00eb4 100644
>>>>>>> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>>>>>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>>>>>> @@ -4,6 +4,8 @@
>>>>>>>    #include "qcom-pm8841.dtsi"
>>>>>>>    #include "qcom-pm8941.dtsi"
>>>>>>>    +/delete-node/ &mpss_region;
>>>>>>> +
>>>>>>>    / {
>>>>>>>        model = "Qualcomm APQ8074 Dragonboard";
>>>>>>>        compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
>>>>>>> @@ -17,6 +19,13 @@ aliases {
>>>>>>>        chosen {
>>>>>>>            stdout-path = "serial0:115200n8";
>>>>>>>        };
>>>>>>> +
>>>>>>> +    reserved-memory {
>>>>>>> +        mpss_region: mpss@ac00000 {
>>>>>>> +            reg = <0x0ac00000 0x2500000>;
>>>>>>> +            no-map;
>>>>>>> +        };
>>>>>>> +    };
>>>>>>>    };
>>>>>>>      &blsp1_uart2 {
>>>>>>> @@ -39,6 +48,25 @@ eeprom: eeprom@52 {
>>>>>>>        };
>>>>>>>    };
>>>>>>>    +&remoteproc_adsp {
>>>>>>> +    cx-supply = <&pm8841_s2>;
>>>>>>> +
>>>>>>> +    firmware-name = "qcom/apq8074/adsp.mbn";
>>>>>>> +
>>>>>>> +    status = "okay";
>>>>>>> +};
>>>>>>> +
>>>>>>> +&remoteproc_mss {
>>>>>>> +    cx-supply = <&pm8841_s2>;
>>>>>>> +    mss-supply = <&pm8841_s3>;
>>>>>>> +    mx-supply = <&pm8841_s1>;
>>>>>>> +    pll-supply = <&pm8941_l12>;
>>>>>> High time to move this to rpmpd!
>>>>>> I won't object to adding this though, as it obviously works
>>>>>> and is already used on other boards..
>>>>>
>>>>> I think the problem is that they are not level-voted on this
>>>>> platform, so they are regulators, not PDs.
>>>> They're corner-voted.
>>>
>>> Hmm. Indeed. In msm8974-regulators I see both voltage and corner entries
>>> for these regulators.
>>
>> Checked. Only CX and GFX (yes, MX not included) are enabled as corners
>> in vendor dtsi. So this probably doesn't gain us a lot.
> 
> I did a check. Implementing CX as a powerdomain here makes things
> worse for now. We should first teach mss/pas/etc drivers to properly
> handle the case when there is a single power-domain, which should be
> unbound after staring the DSP Consider e.g. ADSP and CDSP on sm8150 or
> CDSP on sm8250. But that's definitely a topic for a different patch
> series. After that we can consider landing msm8974_genpd.
Ack, thanks for looking into it.

Konrad
> 
>>
>>>
>>>>
>>>> Konrad
>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +    firmware-name = "qcom/apq8074/mba.mbn", "qcom/apq8074/modem.mbn";
>>>>>> Could you please keep it one entry per line?
>>>>>
>>>>> Sure.
>>>>>
>>>>>>
>>>>>> Otherwise,
>>>>>>
>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>
>>>>>> Konrad
>>>>>>> +
>>>>>>> +    status = "okay";
>>>>>>> +};
>>>>>>> +
>>>>>>>    &rpm_requests {
>>>>>>>        regulators-0 {
>>>>>>>            compatible = "qcom,rpm-pm8841-regulators";
>>>>>
>>>
>>
>> --
>> With best wishes
>> Dmitry
>>
> 
> 

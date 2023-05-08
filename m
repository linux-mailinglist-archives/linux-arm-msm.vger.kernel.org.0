Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8728E6FB62B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 20:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbjEHSCG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 14:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbjEHSCE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 14:02:04 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13214692
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 11:02:01 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ac90178fdaso31368501fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683568920; x=1686160920;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=srWpSA6PQvFq/EvQhPvuDCfFUZ4yDd/A9FonAYJLAMs=;
        b=FL0pBNUePly1uVBRYJUl3YDEQQgYqGZRGGcMsTyuQQM4k/z2gNuEdj0UZoeBj+IhcR
         R5CW1MiG9FVazGG5tD+vnR1LRVbR4OirYz9+xcNMpEk/Bb1xzaFlGPU5Z+hktCyt6cbo
         6OIXOO1SRKtgxJLFyheHDS94lHMmaI2AWLyE1I/o5UO9gdMdVXXYo76DWOENi7sLq6aQ
         Bkt31Ln0Zt6Mq3U7d6J1kLjbt9VC9N2hBdHUtI2R44Ss2ODwVelvty604tCwMAES6DSq
         JS2LTFrjYVm0DuK873z/rYGaPqUZEFJwt49g6YQZlfBEhTnPaC46XUT7S0rEbmph+4DK
         0iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683568920; x=1686160920;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srWpSA6PQvFq/EvQhPvuDCfFUZ4yDd/A9FonAYJLAMs=;
        b=RADfm/wkyZLFyNZz9f02EEGQtTyMbH7iz3Ws4OiCeHtAWFtqLFAzSpp6zzziTV7jFy
         EvntlwsXFm8epIO6sSN1oFdb8zVeUNBGC4ZeHm50Hi99ljiuSlQMs8kE/2ELWVNQTO0P
         eJ0HynonBidkjpI+4K0vOiCW6wdWyfPMV7QOoz53dFcDHKWquDHfQJe5/lKRimCxIzd2
         le9xLs+0TAA11mLRutRx8lZAs4c9pwNI4eMgvVIe/oTJt4iVoECdpzHGq7W5m8wcItcT
         8fj/ZTOzgcPnNv9MYxqkGm9DhzfSV9+ArWQchJOJfig243vbzOc0aU/UkT+wTbP7LwdX
         sGKw==
X-Gm-Message-State: AC+VfDyszCVIzuXusIppbICKMmHf1La1wl9QG1BG+AxudrfeqnkmjH3P
        hulNV4ECeHSPnV2B6IiJu22eO24tincw0su2+Xg=
X-Google-Smtp-Source: ACHHUZ4p/T5nbBw4TPBXo8mN0xn+DPOKvUfI0CuaD8GWmkK6eSAlX2ecNPT6pZCMcAH45YboIyysNA==
X-Received: by 2002:a2e:9e96:0:b0:2a8:ceef:e6cd with SMTP id f22-20020a2e9e96000000b002a8ceefe6cdmr2818088ljk.52.1683568919824;
        Mon, 08 May 2023 11:01:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8345000000b002ac88e29049sm1265967ljh.43.2023.05.08.11.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 11:01:59 -0700 (PDT)
Message-ID: <c4775bde-9594-ab35-6765-5d2fe3e9f3b3@linaro.org>
Date:   Mon, 8 May 2023 21:01:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/4] ARM: dts: qcom: apq8074-dragonboard: enable adsp and
 MSS
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
 <a86cfa8b-c205-6887-a64e-d51241b74b15@linaro.org>
 <ca274ec9-81bf-c426-6ad6-93eb34b52b05@linaro.org>
 <11863653-84aa-8edf-676f-e55174fb4539@linaro.org>
 <7b90ed61-7789-275d-a743-6065ab6ecdbb@linaro.org>
In-Reply-To: <7b90ed61-7789-275d-a743-6065ab6ecdbb@linaro.org>
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

On 08/05/2023 13:49, Dmitry Baryshkov wrote:
> On 08/05/2023 13:38, Konrad Dybcio wrote:
>>
>>
>> On 8.05.2023 12:33, Dmitry Baryshkov wrote:
>>> On 08/05/2023 11:33, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>>>>> Enable ADSP and Modem DSPs on APQ8074 dragonboard. The MSS region
>>>>> differs from the one defined in the msm8974, so it overriden locally.
>>>>>
>>>>> The modem is specified use mba.mbn instead of mbn.b00 (for the sake of
>>>>> similarity with other platforms). This requires a patch for remoteproc
>>>>> to be applied [1].
>>>>>
>>>>> [1] 
>>>>> https://lore.kernel.org/all/20230507172041.2320279-1-dmitry.baryshkov@linaro.org/
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>    .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 28 
>>>>> +++++++++++++++++++
>>>>>    1 file changed, 28 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts 
>>>>> b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>>>> index 6b047c679370..c893afc00eb4 100644
>>>>> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>>>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>>>> @@ -4,6 +4,8 @@
>>>>>    #include "qcom-pm8841.dtsi"
>>>>>    #include "qcom-pm8941.dtsi"
>>>>>    +/delete-node/ &mpss_region;
>>>>> +
>>>>>    / {
>>>>>        model = "Qualcomm APQ8074 Dragonboard";
>>>>>        compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
>>>>> @@ -17,6 +19,13 @@ aliases {
>>>>>        chosen {
>>>>>            stdout-path = "serial0:115200n8";
>>>>>        };
>>>>> +
>>>>> +    reserved-memory {
>>>>> +        mpss_region: mpss@ac00000 {
>>>>> +            reg = <0x0ac00000 0x2500000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +    };
>>>>>    };
>>>>>      &blsp1_uart2 {
>>>>> @@ -39,6 +48,25 @@ eeprom: eeprom@52 {
>>>>>        };
>>>>>    };
>>>>>    +&remoteproc_adsp {
>>>>> +    cx-supply = <&pm8841_s2>;
>>>>> +
>>>>> +    firmware-name = "qcom/apq8074/adsp.mbn";
>>>>> +
>>>>> +    status = "okay";
>>>>> +};
>>>>> +
>>>>> +&remoteproc_mss {
>>>>> +    cx-supply = <&pm8841_s2>;
>>>>> +    mss-supply = <&pm8841_s3>;
>>>>> +    mx-supply = <&pm8841_s1>;
>>>>> +    pll-supply = <&pm8941_l12>;
>>>> High time to move this to rpmpd!
>>>> I won't object to adding this though, as it obviously works
>>>> and is already used on other boards..
>>>
>>> I think the problem is that they are not level-voted on this 
>>> platform, so they are regulators, not PDs.
>> They're corner-voted.
> 
> Hmm. Indeed. In msm8974-regulators I see both voltage and corner entries 
> for these regulators.

Checked. Only CX and GFX (yes, MX not included) are enabled as corners 
in vendor dtsi. So this probably doesn't gain us a lot.

> 
>>
>> Konrad
>>>
>>>>
>>>>> +
>>>>> +    firmware-name = "qcom/apq8074/mba.mbn", "qcom/apq8074/modem.mbn";
>>>> Could you please keep it one entry per line?
>>>
>>> Sure.
>>>
>>>>
>>>> Otherwise,
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>
>>>> Konrad
>>>>> +
>>>>> +    status = "okay";
>>>>> +};
>>>>> +
>>>>>    &rpm_requests {
>>>>>        regulators-0 {
>>>>>            compatible = "qcom,rpm-pm8841-regulators";
>>>
> 

-- 
With best wishes
Dmitry


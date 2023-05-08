Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471E16FA958
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 12:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234968AbjEHKuR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 06:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235179AbjEHKtl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 06:49:41 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2548C29FD9
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 03:49:09 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f13ef4ad91so5003498e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 03:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683542948; x=1686134948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RXdMsRso+EPSoX8YY6azBZyMDBmxWt4xm3vxGwfWTQY=;
        b=wKp3ndVrukvtAw0SH+PdVLhZlcNjKc18oRP+1IXN69uXzoFXW2Mwbpfn5GTZN3c1B6
         yNLSeHKlgrmVLwhOVW0LalhBF/g9flIrFmjfr/DxkLYovekW5HAfyvGtG/HYD9mCKRo3
         50A7HdoRJ36hqJkFRwdESRJz2ia3nM8yyrKpRVt3dvcpA2ciZaUWWaItLliUpK1UD/36
         /Agg2glxjXNwINHQbbfGCeWL8qdRUWvkqww3xJYBqb+jqOes1lbS9tPtlp8q2buCsAcb
         i8vDvT7M2dY+ppYWn+KZCpQw3TEJlp+slyysVOfRGyd4GSZAFoz1Ga/O9PXcQx4DOJNZ
         e/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683542948; x=1686134948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXdMsRso+EPSoX8YY6azBZyMDBmxWt4xm3vxGwfWTQY=;
        b=iZtlT3EipaWA2lvVkKyKnAxC08vW2vD+RhWFjtmpbwCAxkcMFQa/QfwEx874SxB7fk
         bOQe2WjnoGTFA8lNfgDywGb1YQ76SFaUBvG8U3zoZRx4BPa8Vvvk9w/dK4HBRUMUGmTA
         HhsqGkkUhPU6QKPaXY2f6RfDh7ANRzyEUz2swF0fVNWL3quNWhExwyko/x9A4gNMxCnN
         OJPHA6jFT3kSLlJO9xIr/m2o/nvRG+KWCSxUH5tQzWfcnF020TpFJO3FZWvtxawBro2l
         yuXM8bvckhMkQNX/f6hxR8TAL2ZFjiARNgrHsAgQpNo3+1939mkrb83doS9pF1Eyo6Yo
         pevA==
X-Gm-Message-State: AC+VfDyo0JWha3KlvAfSK/Tk6UWKQ9hy24qOtlKndCJcJ+4o3ODju93O
        /oE90Gz3lb/ss5jyt381Vozn3A==
X-Google-Smtp-Source: ACHHUZ7kUdyG/5vN8yWIbaBSvV6k8WFUd5GtXPP7rwCKkMG3l2F8jyvQ7D4ToZng4qwebsgRzR0qOA==
X-Received: by 2002:ac2:530a:0:b0:4f1:3d5f:f54e with SMTP id c10-20020ac2530a000000b004f13d5ff54emr2313936lfh.27.1683542948187;
        Mon, 08 May 2023 03:49:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id 19-20020ac24833000000b004f0049433adsm1255552lft.307.2023.05.08.03.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 03:49:07 -0700 (PDT)
Message-ID: <7b90ed61-7789-275d-a743-6065ab6ecdbb@linaro.org>
Date:   Mon, 8 May 2023 13:49:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/4] ARM: dts: qcom: apq8074-dragonboard: enable adsp and
 MSS
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
 <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
 <a86cfa8b-c205-6887-a64e-d51241b74b15@linaro.org>
 <ca274ec9-81bf-c426-6ad6-93eb34b52b05@linaro.org>
 <11863653-84aa-8edf-676f-e55174fb4539@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <11863653-84aa-8edf-676f-e55174fb4539@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2023 13:38, Konrad Dybcio wrote:
> 
> 
> On 8.05.2023 12:33, Dmitry Baryshkov wrote:
>> On 08/05/2023 11:33, Konrad Dybcio wrote:
>>>
>>>
>>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>>>> Enable ADSP and Modem DSPs on APQ8074 dragonboard. The MSS region
>>>> differs from the one defined in the msm8974, so it overriden locally.
>>>>
>>>> The modem is specified use mba.mbn instead of mbn.b00 (for the sake of
>>>> similarity with other platforms). This requires a patch for remoteproc
>>>> to be applied [1].
>>>>
>>>> [1] https://lore.kernel.org/all/20230507172041.2320279-1-dmitry.baryshkov@linaro.org/
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 28 +++++++++++++++++++
>>>>    1 file changed, 28 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>>> index 6b047c679370..c893afc00eb4 100644
>>>> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>>> @@ -4,6 +4,8 @@
>>>>    #include "qcom-pm8841.dtsi"
>>>>    #include "qcom-pm8941.dtsi"
>>>>    +/delete-node/ &mpss_region;
>>>> +
>>>>    / {
>>>>        model = "Qualcomm APQ8074 Dragonboard";
>>>>        compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
>>>> @@ -17,6 +19,13 @@ aliases {
>>>>        chosen {
>>>>            stdout-path = "serial0:115200n8";
>>>>        };
>>>> +
>>>> +    reserved-memory {
>>>> +        mpss_region: mpss@ac00000 {
>>>> +            reg = <0x0ac00000 0x2500000>;
>>>> +            no-map;
>>>> +        };
>>>> +    };
>>>>    };
>>>>      &blsp1_uart2 {
>>>> @@ -39,6 +48,25 @@ eeprom: eeprom@52 {
>>>>        };
>>>>    };
>>>>    +&remoteproc_adsp {
>>>> +    cx-supply = <&pm8841_s2>;
>>>> +
>>>> +    firmware-name = "qcom/apq8074/adsp.mbn";
>>>> +
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&remoteproc_mss {
>>>> +    cx-supply = <&pm8841_s2>;
>>>> +    mss-supply = <&pm8841_s3>;
>>>> +    mx-supply = <&pm8841_s1>;
>>>> +    pll-supply = <&pm8941_l12>;
>>> High time to move this to rpmpd!
>>> I won't object to adding this though, as it obviously works
>>> and is already used on other boards..
>>
>> I think the problem is that they are not level-voted on this platform, so they are regulators, not PDs.
> They're corner-voted.

Hmm. Indeed. In msm8974-regulators I see both voltage and corner entries 
for these regulators.

> 
> Konrad
>>
>>>
>>>> +
>>>> +    firmware-name = "qcom/apq8074/mba.mbn", "qcom/apq8074/modem.mbn";
>>> Could you please keep it one entry per line?
>>
>> Sure.
>>
>>>
>>> Otherwise,
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> Konrad
>>>> +
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>>    &rpm_requests {
>>>>        regulators-0 {
>>>>            compatible = "qcom,rpm-pm8841-regulators";
>>

-- 
With best wishes
Dmitry


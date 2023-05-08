Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 534D46FA837
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 12:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234782AbjEHKiv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 06:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234869AbjEHKi1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 06:38:27 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210A123A28
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 03:38:25 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4eed764a10cso4790637e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 03:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683542303; x=1686134303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n6Di2NhvzypyyP20lkgTPAmlamzVMEgkZeHjb+rIQYA=;
        b=eoKV5ogG6efWCdptVtUHgwBkDBoKeOqX4lXfvBEMjqn6Yq0vfm1Wo0qHD1am/U6FFs
         94lfIkBbl1yYQN0i8tKBDVJVs/hDjBmqtGGef96dnisCMVuuL8PoAt4jQSdoPW4QjYE5
         +tIDLTl8y4v6kpIJVZ9iWAE+sQj1BBf195wkQGyDobooN0jRVLW3HTHXOnKi4Po4DYht
         3S/wjAsJtmMaB1EnPweCSfCOlc7rL5puFtnSvNoGiMUBQeTsBlukc0BTnRhzc8ByUA4M
         J3vKx8X63nPjxzPc44mW1kPlk9fpbx81r/oiX0lnUlYyxSpwQXgxun2Czv04XOmRTPxe
         7njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683542303; x=1686134303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6Di2NhvzypyyP20lkgTPAmlamzVMEgkZeHjb+rIQYA=;
        b=FzXLGhMU7GVdG6FdvYdtToiZmtPi9u+1ykYiTTjOwOpe+Wn0kDScvGYbBW42NOdX/6
         z/IpsjraM9rX6URWwUxEEljPw1QxtFYb+qYnhW3eyRzR+TLOV/mc/GEgUZIU12Ok4eqg
         NZ3+U/+6N7QeaahTtfHqeB4z/+Dcqa7YUOvAE4kTo3ipq9VoAYFZzoQa+33E1aX81MIJ
         pqDl569DaPjGM3Wf3uzAOvcqFablZOoYvTCe1S6RgwcOp6Vvv6sy0TEnsxWenapso8je
         cFxy6NcJT2ak8+qyAHk02QJo5jlIC2nmQZSTZG/0Wfbd9sQj5CDRfPo9QkEPcObDLQLX
         pEZA==
X-Gm-Message-State: AC+VfDzxrWwDjGSuvM3vNuk1MRZJb3bXP95qiv5qSP+WQZCYilLHYA3J
        H79nparRZBm4t65Bl/8dWv5O5A==
X-Google-Smtp-Source: ACHHUZ6ZXV887SREsnTp6T2NVjHCQ+2DiG2gk05itYDz6BB7cOwjs3VrBcLFZtH+vt94Iqwg/u5JgQ==
X-Received: by 2002:ac2:42c5:0:b0:4dc:84dd:eb91 with SMTP id n5-20020ac242c5000000b004dc84ddeb91mr2601767lfl.22.1683542303395;
        Mon, 08 May 2023 03:38:23 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id t14-20020ac243ae000000b004f2529c71c1sm99937lfl.260.2023.05.08.03.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 03:38:23 -0700 (PDT)
Message-ID: <11863653-84aa-8edf-676f-e55174fb4539@linaro.org>
Date:   Mon, 8 May 2023 12:38:21 +0200
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
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ca274ec9-81bf-c426-6ad6-93eb34b52b05@linaro.org>
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



On 8.05.2023 12:33, Dmitry Baryshkov wrote:
> On 08/05/2023 11:33, Konrad Dybcio wrote:
>>
>>
>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>>> Enable ADSP and Modem DSPs on APQ8074 dragonboard. The MSS region
>>> differs from the one defined in the msm8974, so it overriden locally.
>>>
>>> The modem is specified use mba.mbn instead of mbn.b00 (for the sake of
>>> similarity with other platforms). This requires a patch for remoteproc
>>> to be applied [1].
>>>
>>> [1] https://lore.kernel.org/all/20230507172041.2320279-1-dmitry.baryshkov@linaro.org/
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 28 +++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>> index 6b047c679370..c893afc00eb4 100644
>>> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>>> @@ -4,6 +4,8 @@
>>>   #include "qcom-pm8841.dtsi"
>>>   #include "qcom-pm8941.dtsi"
>>>   +/delete-node/ &mpss_region;
>>> +
>>>   / {
>>>       model = "Qualcomm APQ8074 Dragonboard";
>>>       compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
>>> @@ -17,6 +19,13 @@ aliases {
>>>       chosen {
>>>           stdout-path = "serial0:115200n8";
>>>       };
>>> +
>>> +    reserved-memory {
>>> +        mpss_region: mpss@ac00000 {
>>> +            reg = <0x0ac00000 0x2500000>;
>>> +            no-map;
>>> +        };
>>> +    };
>>>   };
>>>     &blsp1_uart2 {
>>> @@ -39,6 +48,25 @@ eeprom: eeprom@52 {
>>>       };
>>>   };
>>>   +&remoteproc_adsp {
>>> +    cx-supply = <&pm8841_s2>;
>>> +
>>> +    firmware-name = "qcom/apq8074/adsp.mbn";
>>> +
>>> +    status = "okay";
>>> +};
>>> +
>>> +&remoteproc_mss {
>>> +    cx-supply = <&pm8841_s2>;
>>> +    mss-supply = <&pm8841_s3>;
>>> +    mx-supply = <&pm8841_s1>;
>>> +    pll-supply = <&pm8941_l12>;
>> High time to move this to rpmpd!
>> I won't object to adding this though, as it obviously works
>> and is already used on other boards..
> 
> I think the problem is that they are not level-voted on this platform, so they are regulators, not PDs.
They're corner-voted.

Konrad
> 
>>
>>> +
>>> +    firmware-name = "qcom/apq8074/mba.mbn", "qcom/apq8074/modem.mbn";
>> Could you please keep it one entry per line?
> 
> Sure.
> 
>>
>> Otherwise,
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Konrad
>>> +
>>> +    status = "okay";
>>> +};
>>> +
>>>   &rpm_requests {
>>>       regulators-0 {
>>>           compatible = "qcom,rpm-pm8841-regulators";
> 

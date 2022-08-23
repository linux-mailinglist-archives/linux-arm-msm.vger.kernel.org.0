Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72AA959E8B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 19:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243878AbiHWRLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 13:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344693AbiHWRLM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 13:11:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551B8AF4A3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 06:58:53 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z6so19786373lfu.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ugPtOst+gLpZJQR02+MTbL6kxeFDQCrwBIYNfzgTMW0=;
        b=OdmWV/usOTRgtjWyfKSWJ5gpwqNBXcwwzDLHsJuldD6F09+7KTKHyxftEJNic4NyFO
         xLbWZ7zfkV6rnp6JfZlrJg0X/4QcHGugiZxQapzEcVL7is93htrrgWr5FWnwbqux8981
         B1nxPj/clEQ/34xzV7NcN4iv+O7I/bnlAvgUswPC5Mi1oHyybQGufHgWmVav2hTlit7d
         +Rw0oBlfrAuEiL/AWxPEL+nVscmbheKfx5gbHSNaYRe+MV8VymvtWjELTDv5cBO/lRPp
         V5UnQcQegoxRmvT7Uy1U4ZKQhEpBHX0j2ZbTsYuusUoIC4CO0vFXD4tw1yAA3G7OAzm3
         MXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ugPtOst+gLpZJQR02+MTbL6kxeFDQCrwBIYNfzgTMW0=;
        b=xbYi1IRTXi6DjCBiIKT2OjVhlTSWN9dd8iQ/NLzUILWg7Hbtp6ioYeJ4B+y9E5LHMt
         6DWcZDabuZDWoUWDv4VR1Ikb0wgLJUkZhs4d3E2YiKCJ2PHZWuMDswHe70KEBdVm5gxO
         mLzurQOB7wl7s6HO9ioZNgvIX5UyVnJ5EResMZhOODXo8KmuwfJhmS4OPr+38yLVFx87
         a7OD3C27dwTk0OYstCpCTRkXwfhCgcIPH3lxOcyf5ujWP+3g3qila2Gn2b2sfKv3DrRl
         m7rJLikJ23+BnuGpeHz+6iaX03/xeL2+jgiM/zYEgns8V15jUssNlym1DSo5+gS1sGEk
         am/g==
X-Gm-Message-State: ACgBeo0LxSiqXC0fOZ//tHFY/MJvqKS6RUbT21qnBbrn6n5D9DEcWW9a
        RVmgj8xsCRfMOWdEVjYhVQ9v/Q==
X-Google-Smtp-Source: AA6agR5YRCDHJZV9fwka4WUJwQpPXg4oOL49NNFkbxguuIIxK26IVUDhEwlLgM9SDp9ppTfLOYyXGA==
X-Received: by 2002:a05:6512:33c5:b0:48b:9c2f:938a with SMTP id d5-20020a05651233c500b0048b9c2f938amr8803954lfg.557.1661263131623;
        Tue, 23 Aug 2022 06:58:51 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id w29-20020a19491d000000b0048b0a5293ccsm2511505lfa.78.2022.08.23.06.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 06:58:50 -0700 (PDT)
Message-ID: <c1357037-a280-0104-2f92-54a689d269b3@linaro.org>
Date:   Tue, 23 Aug 2022 16:58:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: Fix pwm declaration
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220822120300.2633790-1-bryan.odonoghue@linaro.org>
 <9022126c-2cd7-44c9-28dc-338e36a3346d@linaro.org>
 <11e20195-1383-d1e3-4715-8a1f110ed344@linaro.org>
 <4e567599-90ba-c8bd-9774-1e34ae8f8ea3@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4e567599-90ba-c8bd-9774-1e34ae8f8ea3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/08/2022 16:34, Bryan O'Donoghue wrote:
> On 23/08/2022 13:23, Krzysztof Kozlowski wrote:
>> On 23/08/2022 15:12, Krzysztof Kozlowski wrote:
>>> On 22/08/2022 15:03, Bryan O'Donoghue wrote:
>>>> We need to define pwm@bc000 to stop dtbs_check from making the following
>>>> complaint, text pruned.
>>>>
>>>> pmic@1: 'pwm' does not match any of the regexes:  'pwm@[0-9a-f]+$'
>>>>
>>>> Fixes: e79a1385ab74 ("arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998")
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/pm8916.dtsi | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
>>>> index 606c2a6d1f0fc..d6922379729cb 100644
>>>> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
>>>> @@ -124,7 +124,7 @@ pm8916_1: pmic@1 {
>>>>   		#address-cells = <1>;
>>>>   		#size-cells = <0>;
>>>>   
>>>> -		pm8916_pwm: pwm {
>>>> +		pm8916_pwm: pwm@bc00 {
>>>>   			compatible = "qcom,pm8916-pwm";
>>>
>>> This does not look like proper fix.
>>> 1. It requires a reg.
>>> 2. reg is not allowed by pwm bindings.
>>>
>>> See also other wrong commit:
>>> https://lore.kernel.org/all/20220719205058.1004942-1-bhupesh.sharma@linaro.org/
>>>
>>
>> and this:
>> https://lore.kernel.org/all/20220721195502.1525214-1-bhupesh.sharma@linaro.org/
>>
>>
>> Best regards,
>> Krzysztof
> 
> Hmm OK.
> 
> So if I've understood this conversation properly instead of converting 
> "label: nodename" to "label: nodename@xxx" and adding reg, we would just 
> revert to "nodename {};"

One of two:
1. Yes and fix the bindings.

2. Change the bindings to accept multiple reg, add unit addresses and
multiple reg's to match real HW.

In any case, all in one patchset, so we see the impact. It seems we all
are fine with both approaches, so maybe let's choose less work?

Best regards,
Krzysztof

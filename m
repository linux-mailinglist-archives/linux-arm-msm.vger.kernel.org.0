Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA01E65B463
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 16:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236373AbjABPqy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 10:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbjABPqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 10:46:48 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0241BA45A
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 07:46:44 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id p36so42010786lfa.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 07:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amFwbOwCbIE5wsh262Fm82/EFmRSxgvjwX8Zag9QVuc=;
        b=BHG4S281o2WxiE8vjXhm2obxXaGPtcARubQLWwZ/AC0p5DcoxsSMySUVyGMj6NOATe
         Kt26cmvtURMfyFpV0R2m440tvteZxJbtL/YOckrR8JwILzut8eLsjwK0Y4E/34ByNk8E
         EDOH1c3A402Ix1y1FteuTmpzYaN4udvgzao0nXwt0eOHFt7eQ+ve1WtWawGfCtsfr7XE
         B3lTv58JK54ALREufQwTT1/HrnA89xPTfbfFBGq38YVOXkj1gQ1M67u/K8TXSRbYL7EA
         C3zoN5HasgqHT+iU9UcMPUoqcAtuIW8gTY5dzdivwtatP00atLQT4CT8X/Dc9/YKwjF4
         H/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amFwbOwCbIE5wsh262Fm82/EFmRSxgvjwX8Zag9QVuc=;
        b=CT741+e8C3ojbU23Zh4eBZIEp3yqaEDXJ/SSWmBJNAdTZxfYvowPYivlnVELrD/7MQ
         UWj985hj3rvMGNVZb/seJfQs2Bn7PP2+Ft57pd5daBASUeOTfr2hWc3lDw3pmjV5NZat
         FUy89VL1UBqC93cpZQ2lZPOQwwewvnQtHOTDeUY5L+zDTTYzsYt/MkHNsvIux/eWZfRU
         ur8KnzFHCXisReWJgIb1avMKc9kKoDsgRu1d2t68CRpOJxE+1u4ce6n8ZqXJR0aDaiLo
         pETH04HVRQRTUwWv1b3nH8/wPP7NTfjzYLaB8Vka/bpN3Am/GDBe19PCC2Wh+8+QjlbI
         YYrQ==
X-Gm-Message-State: AFqh2kpy8Wr7WAgUXeSPITvMn9Crq7LanHpEzqfogfUTwfzFCtpRyG5n
        M+bguw0BM6CJk3oeftjaSGC0RQ==
X-Google-Smtp-Source: AMrXdXuqs1rvEL+VswJRpCO4tAg7cOKi9x1pmaVx9CWkrdFe5G4/7APQv7zb9YE5hhlSnVd3HA8Llw==
X-Received: by 2002:a19:5218:0:b0:4bc:4ad0:4148 with SMTP id m24-20020a195218000000b004bc4ad04148mr11025019lfb.8.1672674402276;
        Mon, 02 Jan 2023 07:46:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c2-20020a056512324200b004cafa5f5ae3sm4053024lfr.42.2023.01.02.07.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 07:46:41 -0800 (PST)
Message-ID: <5de95075-ca62-3cae-ce07-d263ea3aa264@linaro.org>
Date:   Mon, 2 Jan 2023 16:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sc8280xp-x13s: disable soundcard
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230102105038.8074-1-johan+linaro@kernel.org>
 <20230102105038.8074-2-johan+linaro@kernel.org>
 <fc42801a-55d9-90b9-f7f0-48657ec7a373@linaro.org>
 <Y7LzJ+RRzDNRf3jR@hovoldconsulting.com>
 <81e3994e-49d9-ea5b-b055-cbcc737a6e37@linaro.org>
 <Y7L3OTs/u8FsH8o2@hovoldconsulting.com>
 <8bd6487a-3ae7-f7c1-e478-1effd68700d3@linaro.org>
 <Y7L6t3p57uTCECRy@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y7L6t3p57uTCECRy@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/01/2023 16:39, Johan Hovold wrote:
>>>>>>>  	wcd_tx: wcd9380-tx@0,3 {
>>>>>>>  		compatible = "sdw20217010d00";
>>>>>>> @@ -781,6 +787,8 @@ &vamacro {
>>>>>>>  	pinctrl-names = "default";
>>>>>>>  	vdd-micb-supply = <&vreg_s10b>;
>>>>>>>  	qcom,dmic-sample-rate = <600000>;
>>>>>>> +
>>>>>>> +	status = "disabled";
>>>>>>
>>>>>> That's a double disable.
>>>>>
>>>>> Yes, that's on purpose. We're temporarily disabling these nodes instead
>>>>> of reverting the series which should not have been merged.
>>>>
>>>> I don't get why disabling something twice is anyhow related to
>>>> "temporarily disable". One disable is enough for temporary or permanent
>>>> disables.
>>>
>>> It clearly shows that this was done on purpose and indicates which
>>> properties need to be changed to "okay" once we have actual support.
>>
>> No, it shows nothing clearly as from time to time we got duplicated
>> properties and it's a simply mistake. The double disable without any
>> comment looks like mistake, not intentional code.
> 
> It's not a mistake. It's intentional. And I don't want to spend hours on
> this because of someone else's cock-up.

To you it looks intentional, but for the reader of DTS which has
disabled node in DTSI and in DTS - so in two places - it looks like a
pure bug. Just because you know the reason behind the change does not
make the code readable.

> 
>>>>>
>>>>> Once we have driver support, these properties will be updated again.
>>>>
>>>> Linux kernel is not the only consumer of DTS, thus having or not having
>>>> the support in the kernel is not reason to disable pieces of it.
>>>> Assuming the DTS is correct, of course, because maybe that's the problem?
>>>
>>> Okay, let's revert these sound dts changes then until we have support.
>>> We have no idea if the dts changes are correct as sound still depends
>>> on out-of-tree hacks.
>>>
>>> People are using -next for development and I don't want to see them
>>> toast their speakers because we failed get the dependencies merged
>>> before merging the dts changes which is how we normally do this.
>>
>> If the error is in DTS, yeah, revert or disable is a way. But if the
>> issue is in the incomplete or broken Linux drivers, then these should be
>> changed, e.g. intentionally fail probing, skip new devices, drop new
>> compatible etc.
> 
> And how long does it take for that to propagate and isn't the response
> just going go to be "well then fix the driver".
> 
> I think you're just being unreasonable here.

I did not propose to fix the driver. I proposed to fail the driver's
probe or remove the compatible from it.

Such change propagate the same speed as DTS change.

> If Bjorn could rebase his tree, he could simply drop these for now as
> sound support was clearly not ready. Since that isn't the case we need
> to at least try to be constructive and figure out a reasonable
> alternative. While "Linux isn't the only consumer" is a true statement,
> it really is not relevant just because there are some dts changes in
> Bjorn's tree which should not be there.

The SC8280XP audio DTS looks in general correct, except some style
issues, redundant properties and never tested against DT bindings.
Therefore it looks as accurate and more-or-less correct representation
of the hardware, unless you have some more details on this.

Is the driver is to blame, focus there, not on DTS.

Best regards,
Krzysztof


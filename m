Return-Path: <linux-arm-msm+bounces-20770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0683A8D1CF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 386251C211C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B99016F0DB;
	Tue, 28 May 2024 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpkJaoKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840CC1DFDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902926; cv=none; b=AIWjDUje4JAdlu7ps1zuandC+BTBb1R1Ubp9U/Lcvh54TkWqF8SNYxU45ybE7wTCPd/Lj9vdaGhCdKOrmrSiV79aulE85SKTTjn8FEXy8RaQx1+AC1stCChLiIPC3TNiHKa+8rf/Vh0uX1YCDHXox8KXCV0/wklDio7AjqAKGtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902926; c=relaxed/simple;
	bh=gv4qXbse0+tppjc7JoxGjG2jeimv8fmDWABuQvijmb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqF9Lqu8NW7yieViiGSezs+JaNZQ2qBlRfIgQSaCgQvOAKsrVLM/mxtRpkN7QjM0SwkmL5bqWYKb/ZPwqpbPN0Ejr14ZpFvpLqBmrn827zeeNSqt+I5GpHHG19DACOI36eXLb+lSLJxv5XUmtve6Hjv00+WLDZiIG5/SJUNVrF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpkJaoKs; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e95a883101so9870341fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716902922; x=1717507722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YUkpwY9HSnv5pwDfWQg8oJzNUY3US9PT2xcgosaYgjw=;
        b=QpkJaoKsZw+v0mKr20hihz99IBYkUEl5oRaB16XqJls/Sf53dcFcr7/Ih6y9h6Liqn
         c2al1RNuQ9V7lPCDBLGtwMdMNV2LR0NwUsp6Jt1Iku0dY4aCBN+bBgPu0PevIwZBXCZY
         xIC8wTkc5uBqu8sMLRoDZYy1lmQAZ8E7YhYuUZqXWeD3jgJ+EQiRpELitiKxT1XUmJAC
         LJacF1xAS9HsLBRVXCH9D+xdqt7CbKuK1rKlqHgYdlruslhOdLrlSo2byOm8jhWhMUGg
         vU6HW0mbQDagV1EWPpwN62Lnz7gQMUzCAIEHAEdmoX9gIreBdWRE4LlQjOVF33FO2HUM
         PgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716902922; x=1717507722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUkpwY9HSnv5pwDfWQg8oJzNUY3US9PT2xcgosaYgjw=;
        b=d2+Dxbd3quz3CPOjG5kXJFI27eUbsF91j02p/EU2tu/Gbepn9FLOLFCOu/Cn40b3b2
         Mzv7YE9t9Kpv2X+CDg3Ho31cT/JNW1gbJzw6kkFxI5r5uI2uA7cyO5NEPkF/xAK+QxXF
         jSAgqvEG0OVM4kIltK/Lqi1o9spSQME7JbPzDWK511TcKYRWtpDOe4RiuQxasWJuRdRg
         lVeQfFLSAUpMnI+PE7nY+QGyr/LOXaPmlk6AWsL2gNN84hvQjFf4fh5K8c4Cs/YAOuhQ
         liANmHEHaancdg9gyN/pjF2hm+kGJ43S9QpZ0Q493o+v43aKE1zY3WOLLEEyVUHYRdcM
         D4YQ==
X-Gm-Message-State: AOJu0YzWSaGfVelXIfQi+gLPUcNAngFlLA2WS5CeB8WA8sJTPP7M6OfQ
	o+OnG5WtvaxUDzFLOsrMR6MT/NtSPqbdmhMihqrmqJkhxzOcbiP0UZ6V7lkjv78=
X-Google-Smtp-Source: AGHT+IE3dekc6Lsztuww8ue7HRQTAyhnH16r8hzZAigd7KWthsZqBFD7zHNZbC8qBsqegF/tuf2ZGA==
X-Received: by 2002:a2e:9c0b:0:b0:2e7:3224:9f51 with SMTP id 38308e7fff4ca-2e95b09a966mr89802871fa.18.1716902922647;
        Tue, 28 May 2024 06:28:42 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c97:23a9:35bc:df2e:d894:2c76? ([2a00:f41:c97:23a9:35bc:df2e:d894:2c76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcc48d3sm22545861fa.5.2024.05.28.06.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 06:28:41 -0700 (PDT)
Message-ID: <c84715f9-4137-40a0-a108-22d0d147c3dc@linaro.org>
Date: Tue, 28 May 2024 15:28:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
 <36f22383-79a3-427e-bf17-35ce2e1dd620@linaro.org>
 <c81feca0-3d56-4733-8eea-f8c574e99d9d@freebox.fr>
 <dcd695bb-1ba4-438a-91a6-7be4a6a55814@linaro.org>
 <3dadf1cf-5860-431d-bede-e24facb82004@freebox.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3dadf1cf-5860-431d-bede-e24facb82004@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/28/24 15:10, Marc Gonzalez wrote:
> On 28/05/2024 14:57, Konrad Dybcio wrote:
> 
>> On 5/28/24 14:45, Marc Gonzalez wrote:
>>
>>> On 28/05/2024 14:31, Konrad Dybcio wrote:
>>>
>>>> [...]
>>>>
>>>>> +			hdmi_cec_default: hdmi-cec-default-state {
>>>>> +				pins = "gpio31";
>>>>> +				function = "hdmi_cec";
>>>>> +				drive-strength = <2>;
>>>>> +				bias-pull-up;
>>>>> +			};
>>>>> +
>>>>> +			hdmi_cec_sleep: hdmi-cec-sleep-state {
>>>>> +				pins = "gpio31";
>>>>> +				function = "hdmi_cec";
>>>>> +				drive-strength = <2>;
>>>>> +				bias-pull-up;
>>>>> +			};
>>>>
>>>> It's super strange that both states are identical. Usually, the pull-up
>>>> is disabled and the GPIO is unmuxed (i.e. function = "gpio"). If that's
>>>> not the case for whatever reason, you can drop the sleep variants and
>>>> simply reference the leftover one from both pinctrl-0 and pinctrl-1.
>>>
>>> Patch is a direct translation of the vendor code:
>>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi#L2324-2400
>>>
>>> I suppose it wouldn't be the first time that vendor code
>>> is doing something odd.
>>>
>>> Though, I'm a bit confused why you would single out hdmi-cec
>>> when hdmi_ddc is the same?
>>
>> As in, me in the above message or the vendor devicetree?
>>
>> If the former, it's just an example
>>
>> If the latter, the muxing function differs so they must have their
>> own separate nodes
> 
> I meant:
> 
> You (rightly) point out that
> hdmi_cec_default & hdmi_cec_sleep nodes are identical
> in my patch.
> 
> I stated that, in fact,
> hdmi_ddc_default & hdmi_ddc_sleep nodes are ALSO identical
> in my patch.
> 
> And the reason they are identical in my patch is because
> they are identical in the vendor code downstream:
> mdss_hdmi_cec_active & mdss_hdmi_cec_suspend
> mdss_hdmi_ddc_active & mdss_hdmi_ddc_suspend
> 
> 
> If I understand correctly, you are saying I should delete
> hdmi_cec_sleep and hdmi_ddc_sleep nodes, and refer
> to the default nodes in the hdmi pinctrl-1 prop?
> 

yep :)

Konrad


Return-Path: <linux-arm-msm+bounces-20756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E68D1BD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE2AE1C2211C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDABC16DEA1;
	Tue, 28 May 2024 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJBTfU95"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2245416D4F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901048; cv=none; b=GM/AWaf1OZ+OVVAoelQExiAO4gCXdxZG3ngX+SrQi1zdY+KrZ66XJJ1vxs6iQW9DBeNWzFifIA9VKlI1zR5s9DUhsn4JK4rkxDEu9DxhG+ySl606eeJWLgw08qTdtVJWq4duqlkYEhOyufKw1Lrt3PZHesPT3nvkKBjiodXUsus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901048; c=relaxed/simple;
	bh=h7kyotS7cvC2SnFZimJPhnRCtUezF930cD1Ntc2RWO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/2he0qVZ9r3vvBNs8u7HpQBpMPhrne9eFIIGFdi/jxtwQacBNInzdghacGDqp9iLICDa78zPZOc82QgA5t6n9+kkYsoOB/kAhM9cWfmogTTta5DjyPamjSeBXRe8UVeGNKzGaa7Gdx4aQiINwUgRXpRUS8SkoJUZipR2gAdl1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UJBTfU95; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52742fdd363so908297e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716901045; x=1717505845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWN0MdHYyev0LyDTXN3QkWRwZx+gvLye/BNA5M5BoaY=;
        b=UJBTfU95qMMFXKBMq89jgws3DwZWRdIml2Wqy3uQ67ewhjx/xCJFWoasUd8dsVwkET
         KHlw9hp5gzmc2zzDPeaUWY+fmQa62hc2pmA44c5hnQtLZ/snVRXTSOkePhbUvxo5ek5I
         4odaQI6hPZaxlc5rCUtR+BGTGgxPncW7oPfkSQi8hyjTYNeNlE3AzXBxlYgk9euFn/kw
         zVf/9l7jM8GOs3Fo8VHQF3g30KGUSfbJfQeERNiMxR0xBz4ELrjTNle194B9dDa1E47D
         oOZoqZGT4yJhrz3rCt5jpShWsu17nL6yfQqViS6NIHs7zkCumSwYHlgblf3u8fL+Rtqx
         rwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716901045; x=1717505845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWN0MdHYyev0LyDTXN3QkWRwZx+gvLye/BNA5M5BoaY=;
        b=M5KxStiJ1Uq2YV/X6WsSbd5I817Q+EQICvIh8O0B2EMFNVkE4xc4M6+zAWwzNqTC2w
         b96dqEaIJhk4/trZ7rd3UeGdBl3cav3MGz23ayydz/kaGKRo/zvre0/kGZQgfJVgmPsP
         WDerZlJR6VnoBiwluN8bY1hQ3TMPJNNlOzB0WqbFRW3vVHS8KIyO+H/AYkjGsAzOEX3c
         C5legiaYtVSJsQ7K35K6UDD/+ooxTCXs+hiNadSoMU+ADXuWwVBRR3HgNghnx3usAW3L
         HInZ5S38HuIMLL2Ll6lAAls8/vQKm5nQFNVhazvoAUQYUspQL9R9OMEeOXzr2QahqfmU
         XwTQ==
X-Gm-Message-State: AOJu0YxATcWfR+laRRY6qZpQRgsdDJnuXA7lpUsvgz6xoxs2fSCyV49e
	TI3jNe4pyB+HGBcrlYLUkKGe66N/GU36/H13W9whWhA6JPYG+NP4ASR/r8rl1os=
X-Google-Smtp-Source: AGHT+IFxeiHTKYnAuXDGtBRhzUiOxKc8/Uavzv7W1V7/t3mgp4Sv3zFR15ZkcQhDDWALxiwbr1cIdQ==
X-Received: by 2002:a19:f613:0:b0:523:ef21:8e2c with SMTP id 2adb3069b0e04-529664dac67mr6460646e87.51.1716901045227;
        Tue, 28 May 2024 05:57:25 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c97:23a9:35bc:df2e:d894:2c76? ([2a00:f41:c97:23a9:35bc:df2e:d894:2c76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296ee4c76dsm948373e87.74.2024.05.28.05.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:57:24 -0700 (PDT)
Message-ID: <dcd695bb-1ba4-438a-91a6-7be4a6a55814@linaro.org>
Date: Tue, 28 May 2024 14:57:22 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c81feca0-3d56-4733-8eea-f8c574e99d9d@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/28/24 14:45, Marc Gonzalez wrote:
> On 28/05/2024 14:31, Konrad Dybcio wrote:
> 
>> [...]
>>
>>> +			hdmi_cec_default: hdmi-cec-default-state {
>>> +				pins = "gpio31";
>>> +				function = "hdmi_cec";
>>> +				drive-strength = <2>;
>>> +				bias-pull-up;
>>> +			};
>>> +
>>> +			hdmi_cec_sleep: hdmi-cec-sleep-state {
>>> +				pins = "gpio31";
>>> +				function = "hdmi_cec";
>>> +				drive-strength = <2>;
>>> +				bias-pull-up;
>>> +			};
>>
>> It's super strange that both states are identical. Usually, the pull-up
>> is disabled and the GPIO is unmuxed (i.e. function = "gpio"). If that's
>> not the case for whatever reason, you can drop the sleep variants and
>> simply reference the leftover one from both pinctrl-0 and pinctrl-1.
> 
> Patch is a direct translation of the vendor code:
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi#L2324-2400
> 
> I suppose it wouldn't be the first time that vendor code
> is doing something odd.
> 
> Though, I'm a bit confused why you would single out hdmi-cec
> when hdmi_ddc is the same?

As in, me in the above message or the vendor devicetree?

If the former, it's just an example

If the latter, the muxing function differs so they must have their
own separate nodes

Konrad


Return-Path: <linux-arm-msm+bounces-20763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F338D1C33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2CC41F23855
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFD416DED5;
	Tue, 28 May 2024 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="BcJl7hhh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C564216DEA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901818; cv=none; b=PUM76PEj8m7OjUTZfMSiim37MCRqAlzDnJdJP96nA/tkowmuTlVpfk1XQiBPu8Eeb1T46Yp5LrrWKqvwdFHXJvNVa0iBnd/Xx0DH1b42oxIEHSVdC9USEaQMqlHrdeJPHEeEa4zKKBKicsLLAzcFBwyc2CpFAN0nz4d3FpwXAo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901818; c=relaxed/simple;
	bh=cTlvu96+6BldpCT1C82whC3Wey7bqNjKh4l0KWF4cBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCOCF+tXF7asQJus45+NMr/uWH8i/3iVoOePMQduTP0Qidt/Ka8iBEVLv1sZILAMDHeJ41Tj3mz0d8YenbLHm6IMX93/jBqdK2ilvrfnZZrZGfGvV9IUm8BubIHZDll7KkQkBQbIWgXv4i/Kzi4Td3ElUwTNoYFTbiKU8m1cEnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=BcJl7hhh; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e719bab882so8055111fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716901814; x=1717506614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ra2FdwYej7W/Hgw9jsqCv4AKdhsqtfsWR4HokTcGuJ0=;
        b=BcJl7hhhq3Nf4BYTcl66fa4gYuZoahh2cK8Msgu0Z48fCPMh8HTdV0Voa2D8cCe6NN
         NLfDWQFn5TAJlwPW2lI3WPDUOYp+DWZJQrrfIVvLsRc3kJmoGrIb4YGhn1mErnDpV8Gr
         jPqP/Xqfdw9IpxFUBgSOwYyoPQT3S1BAOpX4GqCjsqgu97GXM69+RHLO3N3uNLL3Lvdy
         bnDF6LhEOzkMIcXL+n0aS4uysxrh/KF5yWuiaAhhzqUjSz5EESfC5CHb1GBOf2ehoMO6
         TkgAEMZ3TskygGRXsPwft2k5SWbFunmaaMvzn9WJAEM0MmybhHzr2kuichOx+9Q6X40g
         HCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716901814; x=1717506614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra2FdwYej7W/Hgw9jsqCv4AKdhsqtfsWR4HokTcGuJ0=;
        b=VM6vb5ekJHfQeyH7Xa04+swZDv+z9O4AIJkaxQRGzo3rPx/F2A3N6qNZAOneZfM8Jx
         dmgkweGQwiv5Wzq+PEwM+1THAeDpXlrFzJOez7n5UTEPbGm9iP+hd+ZWlWXiyuIABt7d
         HuavBmzGNCXRYZyBXVBH5mst5i52iiVrT8+qibKmeee3flYWF7AzNoQmQuyEDQxLJ5n5
         wEc/b5WV8QByna5brh0o/k36CDW+TvihtXWNOwxCU/UPONb1J5mIVGEzdMfH/a8yxHnv
         8hRkNw2bjQU8iR7/U+YFFcpFp626kVEJQ/rj1rwMdriENBl6bbCEHyDga0bi6mApzVuB
         veqA==
X-Gm-Message-State: AOJu0YwJkZYO1dByEwuBRYhLK6lpF+wCNgy8OUH6YkFY0H3BguyR+cJN
	Q93tjf7L8FByIp1U6kvbZVJcs6g5CT1ZHY34L/jIJjvYduGV3p8BJVdgDHrGDHg=
X-Google-Smtp-Source: AGHT+IFZzlt1sMDtZktVmHVc+8Cr2bF1XwXah6Oyj6JUtAXfbqz/W5OwEOl6JFtWkO/bYFCrferrRQ==
X-Received: by 2002:a05:651c:1549:b0:2df:8387:ab70 with SMTP id 38308e7fff4ca-2e95b0c228amr87607821fa.14.1716901813876;
        Tue, 28 May 2024 06:10:13 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f69850sm169831845e9.26.2024.05.28.06.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 06:10:13 -0700 (PDT)
Message-ID: <3dadf1cf-5860-431d-bede-e24facb82004@freebox.fr>
Date: Tue, 28 May 2024 15:10:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
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
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <dcd695bb-1ba4-438a-91a6-7be4a6a55814@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2024 14:57, Konrad Dybcio wrote:

> On 5/28/24 14:45, Marc Gonzalez wrote:
>
>> On 28/05/2024 14:31, Konrad Dybcio wrote:
>>
>>> [...]
>>>
>>>> +			hdmi_cec_default: hdmi-cec-default-state {
>>>> +				pins = "gpio31";
>>>> +				function = "hdmi_cec";
>>>> +				drive-strength = <2>;
>>>> +				bias-pull-up;
>>>> +			};
>>>> +
>>>> +			hdmi_cec_sleep: hdmi-cec-sleep-state {
>>>> +				pins = "gpio31";
>>>> +				function = "hdmi_cec";
>>>> +				drive-strength = <2>;
>>>> +				bias-pull-up;
>>>> +			};
>>>
>>> It's super strange that both states are identical. Usually, the pull-up
>>> is disabled and the GPIO is unmuxed (i.e. function = "gpio"). If that's
>>> not the case for whatever reason, you can drop the sleep variants and
>>> simply reference the leftover one from both pinctrl-0 and pinctrl-1.
>>
>> Patch is a direct translation of the vendor code:
>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi#L2324-2400
>>
>> I suppose it wouldn't be the first time that vendor code
>> is doing something odd.
>>
>> Though, I'm a bit confused why you would single out hdmi-cec
>> when hdmi_ddc is the same?
> 
> As in, me in the above message or the vendor devicetree?
> 
> If the former, it's just an example
> 
> If the latter, the muxing function differs so they must have their
> own separate nodes

I meant:

You (rightly) point out that
hdmi_cec_default & hdmi_cec_sleep nodes are identical
in my patch.

I stated that, in fact,
hdmi_ddc_default & hdmi_ddc_sleep nodes are ALSO identical
in my patch.

And the reason they are identical in my patch is because
they are identical in the vendor code downstream:
mdss_hdmi_cec_active & mdss_hdmi_cec_suspend
mdss_hdmi_ddc_active & mdss_hdmi_ddc_suspend


If I understand correctly, you are saying I should delete
hdmi_cec_sleep and hdmi_ddc_sleep nodes, and refer
to the default nodes in the hdmi pinctrl-1 prop?

Regards



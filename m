Return-Path: <linux-arm-msm+bounces-36611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0B69B8449
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0BD2B2491B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73AA1CBE86;
	Thu, 31 Oct 2024 20:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="UgpzEkf8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0088C1A2562;
	Thu, 31 Oct 2024 20:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730406204; cv=none; b=lfr9fmQV0BncfGrdcfeqlbI/Eb+iv6M6ufptLQTKHuVYIWyfBEwVjLuuQGlIownsqkbAMMo5CYUwvZdbNoUHFc7G8l1UTtNzNGwgjI4IrOxM910yOYBMhygNm3oIOFOeGm5N3U1zmat/QRdBMJAkHE4UG78NQXdleJMhzG+X4uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730406204; c=relaxed/simple;
	bh=0gHri73JxXQLKIznefuoF0DInf+P6LqeXuRxZkKjpy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3rS4jccYATingbbmlyX1WFaCuieB6Vk/4GL702LDTPFH5NjJe1UtyJ0Mf/H7LTu4qwzVOpCpqlbVp6OBnqZDhZnmbTQVPIgq9HU1mvBXVUQixVevWvaRKNkGuJK9yMue0fFnqidQm91QvcECAqnaFo5kk0YpUpcfR3/Voov9Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=UgpzEkf8; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1730406179; x=1731010979;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=jLI5KRJQSbDEC5WSLvIji4e/VUU2TikNoPPCsm/Q3Nw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UgpzEkf8gAw831l3ie5fTmDW1X5WdDKAK9EIezDfgLBFZwUdr+x6nhM8Q4lQF0zD
	 zLA6UGYENGd+ArcTe04RdUbnXconASwYmAXc5Glh1YKcCA7QY27PrsuKyGeKNM/Fu
	 +WvOUgKDavPdcYJS5N3lYV56WXMZVo0FdWDMHGHrDMHh9aDxuk9kEUdl6Xs6bkIEc
	 hnd6tu0uFWZYN/uPWgEOfziY4HIGjHMkiZHuoM3iJ8nRDBdEl94uU1J05y5V4PEQ/
	 J7F6+F0/r0VS98xIHxA7cf/j5ForlMNFlftTA59HW4Ou+uj/auFFHNJ5UU/+fh0bT
	 E7M5uHWxNk/m19rirw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([62.226.38.42]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mf0FY-1tlk0f13Ag-00cWky; Thu, 31 Oct 2024 21:22:59 +0100
Message-ID: <108c5fb7-fe36-4d07-979e-409cd4539879@oldschoolsolutions.biz>
Date: Thu, 31 Oct 2024 21:22:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>
References: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
 <20241030-jg-blackrock-for-upstream-v6-3-7cd7f7d8d97c@oldschoolsolutions.biz>
 <0bceeb9c-1604-408a-a465-e7ac4d05b3f3@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <0bceeb9c-1604-408a-a465-e7ac4d05b3f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oFPpdjyPlwQjU6bA5zVSYSk9O5UrZCQBiVVlckc/F3qjdV30xwK
 2btUsr5L0pb4yq20xoQZjm5JCH//qyW6paKE3fugSDEdfM0GFXgNbZNzk6cD5ZXiEpoOpI6
 hkXsegqucdHZKGvFnJGdbt71gjvfHnzcMWNPtINjPP3xtJ4H7E78yKzXPCfaQHrX6piFitM
 82xQbwRr6KBX2zo3nHmJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DXq5uMogUAM=;vm2abjfptZrIuC401zJTGqajEcH
 WA/EUAl1lplM66P/sojo2H5AOMpwuqu9SGkwGzVIaSGSJzlFBpFjRvPjuPmURZWtrTa5a826L
 Zj6JyJgbsrU811YRtJwPQHqvYVQUly5YwCcBS94hPlwjYxf4mFOZSX9L/UDXzDKaM7KSY/ZKW
 h/xOhtLqLbJGdUFFNfbFLvZTViEaVee0V4qXpSCYYSjOovEXR364AGZwkeapK25l3Tm7ltDgF
 acEVDJglw8tCQ+1+JSzbGIyT1vPeppHLnYUshztjSOjA2/FhwHvU3Sa1IIUp184DVJu9ZBRXl
 PebdVS7a4x3EL81v1d1ngQ9YQnGZMgBll/TlKAS2GrwOxA2dfqBb1vwZVQl0/j/bOst+F46C8
 BHsLm4zsZtCcjB3p8ZO3/f4/6l/DTKApgRdD6JgaQ3IL/wq/6NXHTDEHY80ronL3tKt7UjMf/
 s0WLtVOfODqoNpOoEeOAX0XLzgGlxXKxUr4hD0+QSI2C0MExQMphRgTkJSFh1aWb4o1SaKBH/
 Y1Vr9mfMjIzl/pCOJFiygI6eGNBb7m8Kc+hMKTcZShURWuJY1I3woP4+fGuVCDdzQsIwS0Y96
 gGrIIk4y4+7oBfzoFWo2H2w1ZVBoIe1WuDCVcSdVWSgHBSv0u2JbmN2WVuMrg6d/hagH+wxv1
 Cys1cNcJfiv2dqqX1HFEsHPmCXeX8Oi01emkLBuImSghafOHGk7Xl2Fcn61jTpfE0Ua6zAp/Z
 Bqm+8lJ1zYQxPvIKLYHWrFCZiWj+EV8lw==

On 31.10.24 21:15, Konrad Dybcio wrote:
> On 30.10.2024 12:02 PM, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> Device tree for the Microsoft Windows Dev Kit 2023. This work
>> is based on the initial work of Merck Hung <merckhung@gmail.com>.
>>
>> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-de=
v-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023=
.dts
>>
>> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
>> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
>>
>> Supported features:
>> - USB type-c and type-a ports
>> - minidp connector
>> - built-in r8152 Ethernet adapter
>> - PCIe devices
>> - nvme
>> - ath11k WiFi (WCN6855)
>> - WCN6855 Bluetooth
>> - A690 GPU
>> - ADSP and CDSP
>> - GPIO keys
>> - Audio definition (works via USB)
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
> [...]
>
>> +	wcn6855-pmu {
>> +		compatible =3D "qcom,wcn6855-pmu";
>> +
>> +		pinctrl-0 =3D <&bt_default>, <&wlan_en>;
>> +		pinctrl-names =3D "default";
>> +
>> +		wlan-enable-gpios =3D <&tlmm 134 GPIO_ACTIVE_HIGH>;
>> +		bt-enable-gpios =3D <&tlmm 133 GPIO_ACTIVE_HIGH>;
>> +
>> +		vddio-supply =3D <&vreg_s10b>;
>> +		vddaon-supply =3D <&vreg_s12b>;
>> +		vddpmu-supply =3D <&vreg_s12b>;
>> +		vddrfa0p95-supply =3D <&vreg_s12b>;
>> +		vddrfa1p3-supply =3D <&vreg_s11b>;
>> +		vddrfa1p9-supply =3D <&vreg_s1c>;
>> +		vddpcie1p3-supply =3D <&vreg_s11b>;
>> +		vddpcie1p9-supply =3D <&vreg_s1c>;
> Please update this atop
>
> <20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>
>
> most notably including a new supply (which will likely be identical)

okay, thanks

>> +	compatible =3D "qcom,sc8280xp-sndcard";
>> +	model =3D "microsoft/blackrock";
>> +	audio-routing =3D
> Please don't break the line, see e.g. x1e80100-crd.dts
>
>> +		"SpkrLeft IN", "WSA_SPK1 OUT",
>> +		"SpkrRight IN", "WSA_SPK2 OUT",
> Oh, this thing has a speaker!

Well, no. Will take another look at it. Interestingly, the SnapDragon
Dev Kit (x1e) has a panel for speakers. So, maybe they are there on an
unused panel.

> [...]
>
>> +&pmc8280_1_gpios {
>> +	edp_bl_en: edp-bl-en-state {
>> +		pins =3D "gpio8";
>> +		function =3D "normal";
>> +	};
>> +
>> +	edp_bl_reg_en: edp-bl-reg-en-state {
>> +		pins =3D "gpio9";
>> +		function =3D "normal";
>> +	};
>> +
>> +	misc_3p3_reg_en: misc-3p3-reg-en-state {
>> +		pins =3D "gpio1";
>> +		function =3D "normal";
>> +	};
> Sorting GPIOs by their number is preferred
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-=
of-nodes
>
> [...]
Will sort.
>> +&tlmm {
>> +	gpio-reserved-ranges =3D <70 2>, <74 6>, <125 2>, <128 2>, <154 4>;
> Do we know what these are for? If so, please describe it (also
> like in x1e80100-crd.dts)
>
> Konrad

Will check and amend if necessary.

with best regards

Jens



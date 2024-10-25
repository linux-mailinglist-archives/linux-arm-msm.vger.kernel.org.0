Return-Path: <linux-arm-msm+bounces-35782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D968B9AF92B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 07:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5811F22D34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5BE18E029;
	Fri, 25 Oct 2024 05:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="qJYW+iOO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0099176AAD;
	Fri, 25 Oct 2024 05:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729834571; cv=none; b=tgJOfm2/Mqs9Wm10Zxfm4qYW0JKgisPo6uhazsmkmzjRcP3S8t4VGMGnVsP9T4cw+Eov94hoG1aYtyfLJS9AuaWVuLfozEkyq6sLrQJdN+BqHUnH/Wi8t4G2RhS5HmHFJTuox9WPY1hnbbhI7zRLXAHT4udcv3Tfh3vn0GRBr6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729834571; c=relaxed/simple;
	bh=5cQYE3itCLtw4B7Mnmwawn1UhYNYor/nzbIUQJkUctA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0hshWPsks77zftklYvXrfr3tIxMLouiO2QRv9wwUMwGgSyIY3ONlb5zIy/aSzOXDK98sR7cToBmB0JeCWhPJ2+iXriGKy2t2pyVv66J9pJ56gOJQDXI6/PdLpazPFtTTKZ2EQjhPnGW603QzbB3J9evckglLYTDhwNRA89RmDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=qJYW+iOO; arc=none smtp.client-ip=217.72.192.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1729834546; x=1730439346;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=iOnZI9/LGvJNpc51JQit0QWac1Qcp/7J5ry8uArPeuA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qJYW+iOOYvNXmUvPa7HJUXzlNiKwaDToVx3Me05wzxPnD8N0pvgFvpfRhVZH4vPb
	 LvkKRE8DJSiN3SRHMMDINGMZyx1nJPfFtecnyPoBDmLHEnC2CHeb1MEdWu9NfjPjh
	 1mNnhGyfGFRkF8RqMt6JK8zZdZ2uq7N0A3AEgX8hP2mfnD/WkLfCyazNjYRhBoWBf
	 Q//iEotOiKk+XONQhKIHYld2wCqdi+tt4P9CQ78xzCssilbVJ1o+/R5kVIRWAWcFd
	 HXTIK22ihRJHieHs4n3iUCmhoQaUtxPQ1u2iOn16jTkLj2kMNJ7kcVUQpqMEIPvXq
	 N0XONbj5I/wfTYcW0w==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MIxBc-1tJ7F543I2-00Peoz; Fri, 25 Oct 2024 07:35:46 +0200
Message-ID: <61308a22-f63d-403f-bed7-c082bf716bce@oldschoolsolutions.biz>
Date: Fri, 25 Oct 2024 07:35:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>
References: <20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz>
 <20241013-jg-blackrock-for-upstream-v3-3-839d3483a8e7@oldschoolsolutions.biz>
 <f4dcebea-e2a7-41bb-bbd4-58e34bedee01@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <f4dcebea-e2a7-41bb-bbd4-58e34bedee01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:NpBxvCM1jn5VYcvCHcpKT9h+InSzRtAuH/kx8si9k7SAhpgcqHH
 a7jo7zBgsu9MZfeGfcaEpiVYZAKJ3Oneripe8pEJ2ISHyBtM68YbFd3Xm24kDPsxCeUj/2x
 diiN5lAGGXqucIWNIpWJZwBZFl52RssEDc3owFiJKl7BJyQ9kD3j3GSEibttyGZK3yEcaJz
 Fm+YNMV3oARybK5cJJ3bg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XH4eBlixWSA=;TU9ItA5x0OvmxQ7+jtEHKEW+183
 BWg93aO7Iy6iYEu+Wku5OAHqOr5+iiFn9brXiRjozZv9InTL24g442/cvZC0RoQeZayvvVuMO
 As/dozVWSRCjxJHquNSzbPb10Vnp0hRq7DbR4rlLn06VkeiCYym40C1wCuqy6U/w1xMrxT7Gk
 j+KSGZW/ONnkYA1Adx9GT0qDa94Jci5rrqRtPeW9OG8i/bIPgyndEWMTrcD0pmfstML9BqnVX
 CPe/eroP5rJbPKXjPAyFWShJm5mfe9wEViPK8bbvZG8BvGn2aOWskz9XAzH1OoZafpCtCeUMQ
 rXqLXxi7wW7oo/Qqsn+IL2DJPtdGL99LQ1V6ikMvVgUkJF/4igfKal89ANzX9u2TxZ5rpKFYJ
 H9qP+2BKx5t5VD04Uz8pMLch4R/4LH6qW2M2RvAPRs0JuVQE9X54ghS5rAZn3OGg0Fx6+TGx3
 phnvjcxRyjIBh21dEZNqBn0eMubC5+UQhzBKh/ymStt47Qg/cmpXpf+iOz4Xo3y/pJOxptF59
 pQjNQ7hgY1GhD36A8nCIffWvS72GH9s825MVN8UnFvcdOQOmt7A9sATMqYtteH3uGjSl461av
 Kwvp+hk70ZfZKyqJsGBE60E3jActFOIE1SIT/6Bzl5vNJZuRHwfxF8wiYhLF6VlfRqmaZ03f/
 nUT/O5nxLCyNUHbaT6/e89qEwjm8qYvN9sMdjhe1BW8or8lhLNAvLT2MeyCnptTCvvDG3NbSy
 z0Zp3mkVmJSrXQ9yvXDFV8HEUSTzgj1Zw==


On 18.10.24 16:38, Konrad Dybcio wrote:
> On 13.10.2024 1:54 PM, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> Device tree for the Microsoft Windows Dev Kit 2023. This work
>> is based on the initial work of Merck Hung <merckhung@gmail.com>.
>>
>> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
>> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
> [...]
>
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wcd_default>;
> property-n
> property-names
>
> (all throughout the file)
>
> [...]
>
>> +	pmic-glink {
>> +		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
>> +				    <&tlmm 49 GPIO_ACTIVE_HIGH>;
>> +
>> +		connector@0 {
> Could you add a comment describing which connector is which (see e.g.
> x1e80100-microsoft-romulus.dtsi)
>
> [...]
>
>> +&gpu {
>> +	status = "okay";
>> +
>> +	zap-shader {
>> +		memory-region = <&gpu_mem>;
>> +		firmware-name = "qcom/sc8280xp/MICROSOFT/blackrock/qcdxkmsuc8280.mbn";
> "microsoft" lowercase would be consistent with other DTs in arm64/qcom
Hmm what about Lenovo X13s. I'll change it to lower case.
>
> [...]
>
>> +&sound {
>> +	compatible = "qcom,sc8280xp-sndcard";
>> +	model = "MICROSOFT/blackrock";
>> +	audio-routing =
>> +		"SpkrLeft IN", "WSA_SPK1 OUT",
>> +		"SpkrRight IN", "WSA_SPK2 OUT",
>> +		"IN1_HPHL", "HPHL_OUT",
>> +		"IN2_HPHR", "HPHR_OUT",
>> +		"AMIC2", "MIC BIAS2",
>> +		"VA DMIC0", "MIC BIAS1",
>> +		"VA DMIC1", "MIC BIAS1",
>> +		"VA DMIC2", "MIC BIAS3",
>> +		"VA DMIC0", "VA MIC BIAS1",
>> +		"VA DMIC1", "VA MIC BIAS1",
>> +		"VA DMIC2", "VA MIC BIAS3",
>> +		"TX SWR_ADC1", "ADC2_OUTPUT";
>> +
>> +	wcd-playback-dai-link {
>> +		link-name = "WCD Playback";
>> +		cpu {
> Please add a newline between the property and the subnodes
>
> Konrad
>
Will do a v4 now with all the new input.

- Jens



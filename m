Return-Path: <linux-arm-msm+bounces-28237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9620694CE8B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 12:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B051F2240D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 10:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBE11917D0;
	Fri,  9 Aug 2024 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+IMYe4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D650141C6E;
	Fri,  9 Aug 2024 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723198972; cv=none; b=Yy++2Li2qFzTr+rMpHCajXzjhlJo+Xjgzp9S/49YM6Lml43Cx9Uc6yIQJtnV2k849E/6ETkrQ4FdllBqlP+8ti/WcCvtSCeR/PVuT4r4JYmUUDeIv2Nx89lnzgcQqMJcAxZ4iq5YzinzX1dx9HlYVQBsn3DrDzqXTcSA1jpoDtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723198972; c=relaxed/simple;
	bh=gcgWBVBawH5IjO4SAEjelxm+QiYxJsqkP+rvMhA7Kts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAUbvZdk6NHiExYmEDKQIqFyFuP6RnaB3vqCsb8RkEJz8aoucL+LtQcwxsxMg+0EBZNZAGwJQ0FjBVJfwCEwITUrcWgq8oYsfXY91hk1Zqe8jELupMiOdGXhe//ekQ19tBBHFbQswGZ4vOx9WJUh3q4W83Sa8mccdop/+9YnywQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+IMYe4Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C02C32786;
	Fri,  9 Aug 2024 10:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723198971;
	bh=gcgWBVBawH5IjO4SAEjelxm+QiYxJsqkP+rvMhA7Kts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e+IMYe4ZU/omSofbP+O6r2WeIC5w3KDxrPPtPyZHNai+tHaP4/CTl1DZvHgIM21PR
	 HSFW7rJ60A+pwv5Zv8N8JX6TrW6nTBOrHqK1nPwZ8wuwN3/3m+PQMl9vUSB/q3xS+h
	 D3fi7n0D01Pl3RBCm86aiEVOVOVgoqoLOve9bY9Kheo4zP8PihDMG2mmOxnyzoLOi5
	 5G87VH9uBSZDREwJ+MJH702jTtxAAqO4z6/8CDPR/x4Ht987IepMcfTzPwmYgOh2cv
	 6/sNPNsmg4Cg7OgzBGdqMyPXkYpIHvi1m2Y3BjUNwENGd9cLLQH7CHK2nyiqsUeIqp
	 LEh2WLom9RfyA==
Message-ID: <077566b6-83b0-41cb-8133-52a26aa05a8b@kernel.org>
Date: Fri, 9 Aug 2024 12:22:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add support for X1-based Surface
 Laptop 7 devices
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
 <20240809-topic-sl7-v1-4-2090433d8dfc@quicinc.com>
 <ZrXcbHWXPvVj-lQd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <ZrXcbHWXPvVj-lQd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.08.2024 11:07 AM, Stephan Gerhold wrote:
> On Fri, Aug 09, 2024 at 03:43:23AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
>>
>> Add support for Surface Laptop 7 machines, based on X1E80100.
>>
>> The feature status is mostly on par with other X Elite machines,
>> notably lacking:
>>
>> - USB-A and probably USB-over-Surface-connector
>> - SD card reader (Realtek RTS5261 connected over PCIe)
>> - Touchscreen and touchpad support (hid-over-SPI [1])
>> - Keyboard support (low-hanging fruit, works with pending Surface EC
>>   changes)
>> - Audio (a quick look suggests the setup is very close to the one in
>>   X1E CRD)
>>
>> The two Surface Laptop 7 SKUs (13.8" and 15") only have very minor
>> differences, amounting close to none on the software side. Even the
>> MBN firmware files and ACPI tables are shared between the two machines.
>>
>> With that in mind, support is added for both, although only the larger
>> one was physically tested. Display differences will be taken care of
>> through fused-in EDID and other matters should be solved within the
>> EC and boot firmware.
>>
>> [1] https://www.microsoft.com/en-us/download/details.aspx?id=103325
>>
>> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
>> ---

[...]

>> +	backlight: backlight {
>> +		compatible = "pwm-backlight";
>> +		pwms = <&pmk8550_pwm 0 5000000>;
>> +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>> +		/* TODO: power-supply? */
> 
> There seems to be something at <&pmc8380_3_gpios 10>, any idea what?

Yeah I looked at it, but switching it hi/lo made absolutely no difference

> 
>> [...]
>> +&pmk8550_gpios {
>> +	edp_bl_pwm: edp-bl-pwm-state {
>> +		pins = "gpio5";
>> +		function = "func3";
> 
> Can you add the power-source here to make this more complete?

The bootloader leaves it with power-source = <1>, I'll add it..

> 
>> +	};
>> +
>> [...]
>> +
>> +&uart2 {
>> +	status = "okay";
>> +};
> 
> Any idea what this UART is used for?

The EC :) Since I believe the required patches will get in promptly,
(and had to tear down my tree into something submittable), I didn't
add a comment here..

> 
>> [...]
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
>> index a5ca0fa4e5ae..5b54ee79f048 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
>> @@ -249,6 +249,14 @@ pmk8550_gpios: gpio@8800 {
>>  			interrupt-controller;
>>  			#interrupt-cells = <2>;
>>  		};
>> +
>> +		pmk8550_pwm: pwm {
>> +			compatible = "qcom,pmk8550-pwm";
>> +
>> +			#pwm-cells = <2>;
>> +
>> +			status = "disabled";
>> +		};
> 
> I don't mind personally but usually we would have this non-device
> addition in a separate patch. :-)

Yeah I can do that

Konrad


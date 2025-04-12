Return-Path: <linux-arm-msm+bounces-54093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 287F5A86BD6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 10:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14F688A0C34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 08:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A237019259A;
	Sat, 12 Apr 2025 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="N6kCjtyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4731AAC9;
	Sat, 12 Apr 2025 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744446883; cv=none; b=rIE5/CpYSCxdYVY6gcIFRn2FjZeuhkDhjR+lAjvsx4rqpfNGzcnY9zMEOD6bM+cYPiToVGHrA7jBFbw2+qmN+uPW4BWeFPLlyzS+9f2DAl32aUGsxw6tRKTxL5PoSArPmPkTF5s30C5/eRd+gzxApFakTF/9UNSZUbFgPwH75d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744446883; c=relaxed/simple;
	bh=uY1OzpWq1YuTlBMN+P0DZuRjCGRt3R3FZeEoAtM9qDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNq6izgA5E+gN8vWcrK8/S7j7AzTkqhfssvteiLRIwq8T7KWGLU6xXNgPBwSCcqdaxIy5hOPBtgStnHamEmBwonhKY1BjXlOvID04nT/NgIQBy6sr89wReHxUoTNKH24bdQwy9Gnj6HKCZ2UVHuhPoTZ+rWfT9C26JQmfLgZCkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=N6kCjtyW; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1744446873; bh=uY1OzpWq1YuTlBMN+P0DZuRjCGRt3R3FZeEoAtM9qDo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N6kCjtyW+zT3K6fq+BuZYYFMZXt6w1xHyupWm5kjViEZK+ojhu4Q5QRGZjjU8mo2Y
	 1cjsfC9ARNpXFpbdzP57sDq+V42GI5q1AV+ksHAEf648LqleWKBUwl/ysm5VLP1DuC
	 gQ2RrnLIUJ+LvY4lEkkTYAHUad8XdXa2iejhOFMs=
Message-ID: <cc84ef26-6c33-42d0-a11f-4d6b31d8beee@lucaweiss.eu>
Date: Sat, 12 Apr 2025 10:34:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8953: Add uart_5
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Felix Kaechele <felix@kaechele.ca>
References: <20250406-msm8953-uart_5-v1-1-7e4841674137@lucaweiss.eu>
 <e87220f1-bf8e-4014-834f-ae99c0b032ca@oss.qualcomm.com>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <e87220f1-bf8e-4014-834f-ae99c0b032ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/25 6:45 PM, Konrad Dybcio wrote:
> On 4/6/25 3:52 PM, Luca Weiss wrote:
>> From: Felix Kaechele <felix@kaechele.ca>
>>
>> Add the node and pinctrl for uart_5 found on the MSM8953 SoC.
>>
>> Signed-off-by: Felix Kaechele <felix@kaechele.ca>
>> [luca: Prepare patch for upstream submission]
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8953.dtsi | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> index af4c341e2533ef2cca593e0dc97003334d3fd6b7..3d6ab83cbce4696a8eb54b16fdb429e191f44637 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> @@ -767,6 +767,20 @@ spi_6_sleep: spi-6-sleep-state {
>>   				bias-disable;
>>   			};
>>   
>> +			uart_5_default: uart-5-default-state {
>> +				pins = "gpio16", "gpio17", "gpio18", "gpio19";
>> +				function = "blsp_uart5";
>> +				drive-strength = <16>;
> 
> This guy's strongly biased! But it looks like that's on purpose for
> these older SoCs..
> 
>> +				bias-disable;
>> +			};
>> +
>> +			uart_5_sleep: uart-5-sleep-state {
>> +				pins = "gpio16", "gpio17", "gpio18", "gpio19";
>> +				function = "gpio";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
>> +
>>   			wcnss_pin_a: wcnss-active-state {
>>   
>>   				wcss-wlan2-pins {
>> @@ -1592,6 +1606,24 @@ blsp2_dma: dma-controller@7ac4000 {
>>   			qcom,controlled-remotely;
>>   		};
>>   
>> +		uart_5: serial@7aef000 {
>> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>> +			reg = <0x07aef000 0x200>;
>> +			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&gcc GCC_BLSP2_UART1_APPS_CLK>,
>> +				 <&gcc GCC_BLSP2_AHB_CLK>;
>> +			clock-names = "core",
>> +				      "iface";
>> +			dmas = <&blsp2_dma 0>, <&blsp2_dma 1>;
>> +			dma-names = "tx", "rx";
> 
> Matches what the computer says
> 
> It's more usual to send these together with a user, but I don't mind

This seems to be used with the out-of-tree dts
apq8053-lenovo-cd-18781y.dts

I'm just sometimes trying to reduce the out-of-tree diff of the
msm8953-mailine tree on GitHub

Regards
Luca

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad



Return-Path: <linux-arm-msm+bounces-60840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C64AD3FB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 18:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD78E3A299E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F017C242D76;
	Tue, 10 Jun 2025 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="kKYZPsrC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A06D20EB;
	Tue, 10 Jun 2025 16:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574633; cv=none; b=T/VLWEvhuqZVDgw86sAtcQLIxry7s47mFAikNp3xdL6fErgZs4KK/JWuceOcsxvjfq1nUx0uBYeA2CaSOVbOXfvdrZjgfWqA4Bw3skwUdGt/15mR7mX95UEu/0jB5a6RJftz2Uakt02Fbu4MUL/jOBOBywQoPejfD1iRlnln8jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574633; c=relaxed/simple;
	bh=MftsZNiQbgGE0GcsfcImBHC7A8VKftL96OfEjX0rO7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lo49Wtb7+1xamlQECc90cRwgp+fYgvZPR7WBIzBCMUErYI9AmBgWLAb5ygr78s8PVd8LBwNbOYiuu0Upk7dlyd1A+vLLOCb3tZ3JNE9Xyb7+2hocWt6y82/5aphX95Zdtj8RO2pG6EoHdIvd57Tl32WE+hOXckm/eJozvjbT1Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=kKYZPsrC; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749574623; bh=MftsZNiQbgGE0GcsfcImBHC7A8VKftL96OfEjX0rO7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kKYZPsrCBLMNFDfduZ/WSYo/8JR5Vu00iQcLz12xAQVuYE3f+X7RiUELXLGr9Kogz
	 aYg9+gkIr1tvBJlzaAL24aeTOXACCLl3yuuCG0rbZZGSeywcWUg+Sp9iHJrNWPGMce
	 e1A9yYpCTyOaNt1Qrm9Af+w2REPodQ56gTRauwFE=
Message-ID: <28770566-ed85-4c8f-b01c-c4c14efee743@lucaweiss.eu>
Date: Tue, 10 Jun 2025 18:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>
References: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
 <1e7afaab-e050-4376-8dde-07f09fb01e51@oss.qualcomm.com>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <1e7afaab-e050-4376-8dde-07f09fb01e51@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-04-2025 9:43 p.m., Konrad Dybcio wrote:
> On 4/19/25 11:08 AM, Luca Weiss wrote:
>> From: Adam Honse <calcprogrammer1@gmail.com>
>>
>> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
>>
>> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
>> ---
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 45 ++++++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
>> index 903bb4d125135771504281df50aa11c9b6576a28..17d3e319941b8fd0363af600d93fc10127e4ab21 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
>> @@ -50,6 +50,34 @@ key-volume-up {
>>   		};
>>   	};
>>   
>> +	i2c-gpio-touchkey {
> 
> 'i2c'?

 From what I can tell, there's a few more i2c-gpio "busses" on this 
device, like most Samsung devices

https://github.com/LineageOS/android_kernel_samsung_msm8974/blob/lineage-18.1/arch/arm/boot/dts/msm8974/msm8974-sec-hlte-r09.dtsi#L109-L132

So I'd keep the name to not conflict with future with these other ones.

> 
>> +		compatible = "i2c-gpio";
>> +
>> +		sda-gpios = <&tlmm 95 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> +		scl-gpios = <&tlmm 96 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> +
>> +		pinctrl-0 = <&i2c_touchkey_pins>;
>> +		pinctrl-names = "default";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		touchkey@20 {
>> +			compatible = "cypress,midas-touchkey";
>> +			reg = <0x20>;
>> +
>> +			interrupts-extended = <&pm8941_gpios 29 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +			pinctrl-0 = <&touchkey_pin>;
>> +			pinctrl-names = "default";
>> +
>> +			vcc-supply = <&pm8941_lvs3>;
>> +			vdd-supply = <&pm8941_l13>;
>> +
>> +			linux,keycodes = <KEY_APPSELECT KEY_BACK>;
>> +		};
>> +	};
>> +
>>   	touch_ldo: regulator-touch {
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "touch-ldo";
>> @@ -149,6 +177,14 @@ touch_ldo_pin: touchscreen-ldo-state {
>>   		power-source = <PM8941_GPIO_S3>;
>>   		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
>>   	};
>> +
>> +	touchkey_pin: touchkey-int-state {
>> +		pins = "gpio29";
>> +		function = "normal";
>> +		bias-disable;
>> +		input-enable;
>> +		power-source = <PM8941_GPIO_S3>;
>> +	};
>>   };
>>   
>>   &remoteproc_adsp {
>> @@ -332,6 +368,9 @@ pm8941_l24: l24 {
>>   			regulator-min-microvolt = <3075000>;
>>   			regulator-max-microvolt = <3075000>;
>>   		};
>> +
>> +		pm8941_lvs1: lvs1 {};
> 
> LVS1 is unused by anything here - it's probably good to define it, so
> that the driver picks it up and regulator_ignore_unused is aware of it

Yes, did you mean here to put the addition of lvs1 into a separate commit?

Regards
Luca

> 
> Konrad



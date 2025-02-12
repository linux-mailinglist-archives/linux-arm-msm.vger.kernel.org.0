Return-Path: <linux-arm-msm+bounces-47828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48717A332BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBF96188903F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 22:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1460A2036F4;
	Wed, 12 Feb 2025 22:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="jAr2bHxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5FC1FFC59;
	Wed, 12 Feb 2025 22:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739399822; cv=none; b=RQSEwZRWacFKrqgym1SFItRPtkiQcS/HmvzDXhvkijgMcSnTn3Iuf3Epj/AQ0J5YWz0xOdZwq8GV+Wsaes7EK5SiMmklw3un6Qe9EZ5LAmIoeptasQsXV0OdEXRrznhn+aDppHHGlbqb1mphtjq0bZv4NtxvqyPHSNeY1f37nm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739399822; c=relaxed/simple;
	bh=cKI6iOzIMfA0rNKfSsAF/i1GDPKMHGcEWOZBDuLpg1E=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=tMF8KTBKsDfBEQQUHzw7Fibih1AAUjY1Pi46Ap+1WFXIAFBGHvFaue9gly1MkygnzCBXf31SMy4tompxzTlWsvxx+9BLzkYxoxfPtE0Ya6xUpzamCxSaRko4J6ulS1BjELpw5md75a+c2D+ty9EMlz+c1WoVNdxGUFHXzEku4LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=jAr2bHxl; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
	by mail.mainlining.org (Postfix) with ESMTPSA id 2708ABB837;
	Wed, 12 Feb 2025 22:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739399818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qdqWEqbVFWgWcKXIBp4Jh3qH6ciNVBQ+WPGChrj19ng=;
	b=jAr2bHxlTPJfEM6bh9gMeU82GrEWeDCkUhhgvCUW440q+y0BOUa5zYboG/sSG8v1BZhZBy
	PLAPA8kdfj/205uv5zL1kZ5y9aTJfPb0ya+aIMDz4Hd7Lg202g2l7RTuSwQnpH95qoGvPz
	HVA3IZzZ8DHo4d5Nn9fPua946BWtzPFppy5L2/wt6J438qdH4IL0FWhvfbJ67ohKxdx7AB
	RaBeTai6RtvrICBrtFFl9yuEl7g7fYOLTlOdokZX/vO2ZtqGeAsehM1o7S7xeZKcJyasDb
	/1rpywX/wFUsT/oYkNKX2it1mbLx43Y4W4/xV0HVu3Tb+lkVRYEK2CC+rljNwg==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 12 Feb 2025 23:36:58 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8917-xiaomi-riva: Add display
 backlight
In-Reply-To: <0d540105-1da7-459b-a812-dbc13097520e@oss.qualcomm.com>
References: <20250212-pm8937-pwm-v1-0-a900a779b4ad@mainlining.org>
 <20250212-pm8937-pwm-v1-2-a900a779b4ad@mainlining.org>
 <0d540105-1da7-459b-a812-dbc13097520e@oss.qualcomm.com>
Message-ID: <c299f30205b602031905ed972fc6ea9f@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-02-12 23:31, Konrad Dybcio wrote:
> On 12.02.2025 11:21 PM, Barnabás Czémán wrote:
>> Redmi 5A display uses pwm backlight, add support for it.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 25 
>> ++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts 
>> b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
>> index 
>> f1d22535fedd94467ba3f0a88b2110ce5360e7e1..8808306c989f54116052667887f9bf36b63c4c64 
>> 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
>> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
>> @@ -20,6 +20,14 @@ / {
>>  	qcom,msm-id = <QCOM_ID_MSM8917 0>;
>>  	qcom,board-id = <0x1000b 2>, <0x2000b 2>;
>> 
>> +	pwm_backlight: backlight {
>> +		compatible = "pwm-backlight";
>> +		pwms = <&pm8937_pwm 0 100000>;
>> +		brightness-levels = <0 255>;
>> +		num-interpolated-steps = <255>;
>> +		default-brightness-level = <128>;
>> +	};
>> +
>>  	battery: battery {
>>  		compatible = "simple-battery";
>>  		charge-full-design-microamp-hours = <3000000>;
>> @@ -131,6 +139,23 @@ bq25601@6b{
>>  	};
>>  };
>> 
>> +&pm8937_gpios {
>> +	pwm_enable_default: pwm-enable-default-state {
>> +		pins = "gpio8";
>> +		function = "dtest2";
> 
> Are you sure?
Yes, 
https://github.com/Mi-Thorium/kernel_devicetree_xiaomi-msm8937/blob/dts/mi8937/4.9/master/wingtech/msm8917/common/pm8937.dtsi#L24-L31
>> +		output-low;
>> +		bias-disable;
>> +		qcom,drive-strength = <2>;
>> +	};
>> +};
>> +
>> +&pm8937_pwm {
>> +	pinctrl-0 = <&pwm_enable_default>;
>> +	pinctrl-names = "default";
> 
> We normally put this under the backlight node, but I'm not sure which
> one is more correct.. it may be that this one is, given we're
> controlling the pin that the PWM signal is sent through

It is for enabling pwm and not backlight,
it should be placed here otherwise backlight will not work correctly.
> 
> Konrad


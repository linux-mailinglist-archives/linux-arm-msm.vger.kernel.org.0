Return-Path: <linux-arm-msm+bounces-29619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D98CB96088B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 13:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C722844B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 11:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E826719F495;
	Tue, 27 Aug 2024 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNmAfJPu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB97919E802;
	Tue, 27 Aug 2024 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758006; cv=none; b=BRsHuGaQfPCkbD46+GuCxYusWln78A5zvGS174VTGwcYdh0Rc8LZQzEeL0Jx2IS4LRedGyV40xBSLmPfs+zWsV00btsDV6WfR9ljO5L3E/qiRjzTBFFy9hv133xvIzXHUaEpsDalbDAci1Ni736rVv+1WvqngF+o5CS7ZIUPKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758006; c=relaxed/simple;
	bh=PUkphdTgX+m9PJYcH52LnfPvEospa2bT0O+ZL3jZWf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEoG9KChhAm3Wjj7rcxHRbVXUGgoRdw/ZeajrK+8h/zLsdjxMh+im8q1aLhcrGngCtouj+rtWMuVDmLlzolT7M0GkU1yUiXxYuEHpFDPkaQC42Nlxp0z9pR2uqzYQEiXI64Rns+NyHBxPXj+TsAfi+e9iy0P05sSXSNdAGBSDEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNmAfJPu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F343CC567EF;
	Tue, 27 Aug 2024 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724758006;
	bh=PUkphdTgX+m9PJYcH52LnfPvEospa2bT0O+ZL3jZWf0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kNmAfJPussNkjdsDXifEnCrpzpdeAi/Hb1xvmAGWcvtfDZZIsPKF3qJ4vj97HvL6E
	 lvRjR1XG+2uu+VqVy4siyH10fbW6rRT7oj8e2wcI0CD8al2taKIDDKnfh3SYFh/b14
	 ehT9DynG5rnkLdeDvp44R6zgNP2cl6/6s/PJLfUH5LdnGr4qEe5pC5adCp8J0pJTJj
	 b1e+OY2PLnC3grMcz4HbwZcE1ubTObZcomfsNp1FlUO+2+3tPyX6RIcTq2yI/4ZR9j
	 XimK7B8EdY+uCekWKbDc3tXEPicrWs65ZqToia+qdS7eRqkfDhL3WwTXSxgrE6eVph
	 mRoCxKr2t6MVg==
Message-ID: <62ac051e-f462-4a98-9c80-2229d1bf16be@kernel.org>
Date: Tue, 27 Aug 2024 13:26:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc8280xp-crd: enable wifi
To: Johan Hovold <johan@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240813190639.154983-1-brgl@bgdev.pl>
 <20240813190639.154983-2-brgl@bgdev.pl>
 <ZsdRrHK7kCYs7MJF@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <ZsdRrHK7kCYs7MJF@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2024 4:56 PM, Johan Hovold wrote:
> On Tue, Aug 13, 2024 at 09:06:36PM +0200, Bartosz Golaszewski wrote:
>> From: Konrad Dybcio <konradybcio@kernel.org>
>>
>> Add nodes for the WCN6855 PMU, the WLAN module and relevant regulators
>> and pin functions to enable wifi support on sc8280xp-crd.
> 
> What are you guys smoking? The Wi-Fi has been enabled on the CRD since
> 6.2 and commit d907fe5acbf1 ("arm64: dts: qcom: sc8280xp-crd: enable
> WiFi controller").

Smells like copypasta..

> 
>> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
>> [Bartosz:
>>   - write the commit message,
>>   - rebase Konrad's commit,
>>   - fix one of the supplies' name]
>> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 112 ++++++++++++++++++++++
>>  1 file changed, 112 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>> index 6020582b0a59..57efeefbc89e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>> @@ -177,6 +177,17 @@ vreg_misc_3p3: regulator-misc-3p3 {
>>  		regulator-always-on;
>>  	};
>>  
>> +	vreg_s10b: regulator-s10b {
>> +		compatible = "regulator-fixed";
> 
> I don't think this is a fixed regulator.

It effectively is

> 
>> +
>> +		regulator-name = "VREG_S10B";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>>  	vreg_wlan: regulator-wlan {
>>  		compatible = "regulator-fixed";
>>  
>  
>> +&pcie4_port0 {
>> +	wifi@0 {
>> +		compatible = "pci17cb,1103";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
>> +		vddaon-supply = <&vreg_pmu_aon_0p8>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
>> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
>> +
>> +		qcom,ath11k-calibration-variant = "LE_X13S";
> 
> This is not the right calibration variant either. In fact, Qualcomm has
> not yet released any calibration data for this CRD yet:
> 
> 	https://bugzilla.kernel.org/show_bug.cgi?id=216036
> 
> I use a patch like this locally, but we shouldn't merge this upstream.

Agreed

>  
>> +	wlan_en: wlan-en-state {
>> +		pins = "gpio134";
>> +		function = "gpio";
>> +		drive-strength = <8>;
> 
> Why increase the drive strength?

This is what's used on Windows, for lack of a better idea, not sure
if this is actually necessary

Konrad


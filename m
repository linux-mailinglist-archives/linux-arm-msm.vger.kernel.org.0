Return-Path: <linux-arm-msm+bounces-96374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JiQEdE7r2kPQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:29:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B10241AFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94EB33112BD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2821136214F;
	Mon,  9 Mar 2026 21:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KCJkrSX2";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MC0VjuVv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA7134D4CC;
	Mon,  9 Mar 2026 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091529; cv=none; b=HHoPR+BmY/Fd3itG+Yci/YdExWcBCGQRqV75vgLJwTafERf5DRkM0EIo/oMT7jao/PiJZ6uG9RkxmPK4Vpa6aQ8uRSGcJaYI3ryktmHDmcDLhgDMW6sosY+m9074cWO379FuRn2qczEeMRjECstNYC3qAf7G6dEfe583OtJcSJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091529; c=relaxed/simple;
	bh=MfTYYsBjuYjwkubIxnClz67/wJMFbeq5ZhlkbIa404g=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=gwlDQeMfbvtTe6jkc+DkwaQT2yIZGfWSH1LwEhuE8/mNKs3+j6tlueNPxgYGKgNQNnERQ9WHLeD2uaClzMpK57HXhc//e+JFrEGUP/TfQI78KKUtICHUvct+wZgOX+ygy0NSkB7L/lYNm6aZ6R7uUxI+3YkT8QEaOkm1F5pXr0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KCJkrSX2; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MC0VjuVv; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773091523; bh=6DwB0wP6j6EuiclIrWzl5Cb
	Ue7lYN55AgnaxEuuWBN4=; b=KCJkrSX2asQFXOJfZnCTShLc4V/2vfDYxBLkWsAosIyZsE15/2
	pRi/NOOPd0z5hVPkB7O3gjij0fV67z+NNTjthtOKwawhW66XOtUxCs418O5hinXol8xqBdSFJAO
	wc1sHBAOx+g3D8YbqXypWrL+4Do4spprsuh3jt/2LanxMpCBc3uXoQBtcJCwhwmFG/BASJpGno2
	xuiHVj6R2v8c4JcSpd1QFehx9Xedn2yCiSuXq/SgiBCUg0BrgeKc8Uc0HYokYKIdewuon/Foiuj
	jVp9UeOty5KtgUA/i3+92fcNxh7Va2/2FT+A0GnH8ZPT+R9D5BXcZlCNIqKEIpZ6rhw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773091523; bh=6DwB0wP6j6EuiclIrWzl5Cb
	Ue7lYN55AgnaxEuuWBN4=; b=MC0VjuVvtKDdztyQCQzxu3f+7vOGsGUIFEnwhzXPX7A3/EVnMu
	nuCzB7Fng46Qx9clMAtqh8AWynwMQN5zvDCQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 22:25:23 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Add Redmi 4A
In-Reply-To: <098cf81c-d3a4-4591-948f-0517b0430343@oss.qualcomm.com>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-3-436f1f4b7399@mainlining.org>
 <098cf81c-d3a4-4591-948f-0517b0430343@oss.qualcomm.com>
Message-ID: <d17c54c18af7734fbf218af399efa8ea@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D7B10241AFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96374-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.38:email,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,5d:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-03-09 13:52, Konrad Dybcio wrote:
> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>> Redmi 4A (rolex) is like Redmi 5A with small differences like 
>> charging,
>> fuel gauge, different speaker codec configuration and display.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile                     |  1 +
>>  .../boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi     | 16 
>> ++++++++++++++++
>>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts     | 19 
>> +++++++++++++++++++
>>  3 files changed, 36 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
>> b/arch/arm64/boot/dts/qcom/Makefile
>> index 6d87be639aac..20e161e843ed 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -82,6 +82,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= 
>> msm8916-wingtech-wt86528.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-rolex.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi 
>> b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
>> index f0a534106e11..50868c679693 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
>> @@ -104,6 +104,22 @@ edt_ft5306: touchscreen@38 {
>> 
>>  		status = "disabled";
>>  	};
>> +
>> +	goodix_gt911: touchscreen@5d {
>> +		compatible = "goodix,gt911";
>> +		reg = <0x5d>;
>> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
>> +		irq-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
>> +		reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-0 = <&tsp_int_rst_default>;
>> +		pinctrl-names = "default";
>> +		AVDD28-supply = <&pm8937_l10>;
>> +		VDDIO-supply = <&pm8937_l5>;
>> +		touchscreen-size-x = <720>;
>> +		touchscreen-size-y = <1280>;
>> +
>> +		status = "disabled";
>> +	};
> 
> I think an easier thing would be to just add a 'touchscreen' label
> to the original one, /delete-node/ &touchscreen from rolex.dts and
> add the new node there (seems like it's the only used) and do nothing
> in the other two using EDT_FT5306
There is focaltech variant from rolex, and there is goodix variant from 
riva and tiare,
maybe i should disable both node by default.
> 
> Konrad


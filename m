Return-Path: <linux-arm-msm+bounces-61921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CC6AE2840
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 11:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0F003AE1A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 09:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DC01EBA09;
	Sat, 21 Jun 2025 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="P1CUcCdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9086D433B1;
	Sat, 21 Jun 2025 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750498038; cv=none; b=JxQkV1NDmgBtOFu9alH20qAQvTuM4KkikF4kW4jcUR7m7e7UxGPUm1OiHwC6Tz5FRc2/NWAHL1Vyr0QlK1IlUrT09emz3C0CqChDRfKV5EUxABWz+gA8zd3+aWBpz5LMWn7jRnEjAMW5MiMvmi1YAo9jqIPARmMhXyU6CDR2oDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750498038; c=relaxed/simple;
	bh=suMIZysjQ6LF75eaZIfOnmKKmcSh2/4O7O+gcUFifpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFegd01h2oIQkK8rEhiBDcpuMDOdGF8EpiEun1iR8dgI0cE5JQLD/PProoiq8AG3j91XJpoNneHtjJrxQ34rvxYu0PraLXkgZWdF/4bBrxwdLW3rFmUt8idEXt1/Mo8h+6deZ0fVVOgyWTyzgmzHAjS59lMInPfR6LpHcDB4a1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=P1CUcCdm; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750498034; bh=suMIZysjQ6LF75eaZIfOnmKKmcSh2/4O7O+gcUFifpA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P1CUcCdmmh/ibZ9xTCWBp4nd1numB+H7FWARmaR6h6hAOlq63pdjyWfRNEoOyuGk8
	 msIrvqufovCzrN65F8kZz5kPmMx+YJUp7IfVS8dL4ZlQKB92BvLRZCYiICwhsztRG4
	 IwfALq7/vt3xUEvHslxwg4NSRiFaFAC675o5FSqo=
Message-ID: <ff29229c-5458-4500-9b11-8044a461cd36@lucaweiss.eu>
Date: Sat, 21 Jun 2025 11:27:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: cristian_ci <cristian_ci@protonmail.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "konradybcio@kernel.org" <konradybcio@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "~postmarketos/upstreaming@lists.sr.ht"
 <~postmarketos/upstreaming@lists.sr.ht>,
 "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
 <d4564d4b-9510-47f8-9930-65d3c4e90e6c@lucaweiss.eu>
 <bWiyUA5cF4NjzEaUwhpDvfeqs0hEizZKFKxQpsfj6htES5mPGO2Yf2AHZQcUEyR4x7Zx9kVvwenpc2djbCN148IbjtgLh7Gq_1HXicp8kms=@protonmail.com>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <bWiyUA5cF4NjzEaUwhpDvfeqs0hEizZKFKxQpsfj6htES5mPGO2Yf2AHZQcUEyR4x7Zx9kVvwenpc2djbCN148IbjtgLh7Gq_1HXicp8kms=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-06-2025 9:07 a.m., cristian_ci wrote:
> On Saturday, June 21st, 2025 at 00:20, Luca Weiss <luca@lucaweiss.eu> wrote:
> 
>>> +
>>> + reserved-memory {
>>> + qseecom@0 {
>>
>>
>> qseecom@84a00000 ?
>>
>>> + reg = <0x00 0x84a00000 0x00 0x1900000>;
>>> + no-map;
>>> + };
> 
> Looking at downstream devicetree, every reserved-memory nodes with "removed-dma-pool" compatible has unit address 0. OTOH, kernel documentation [1] says:
> "  Following the generic-names recommended practice, node names should
>    reflect the purpose of the node (ie. "framebuffer" or "dma-pool").
>    Unit address (@<address>) should be appended to the name if the node
>    is a static allocation."
> 
> In my case, downstream devicetree shows:
> 
> 		other_ext_region@0 {
> 			compatible = "removed-dma-pool";
> 			no-map;
> 			reg = <0x00 0x84a00000 0x00 0x1e00000>;
> 		};
> 
> which will be 'qseecom' reserved-memory node in mainline devicetree.
> 
> OTOH, 'qseecom' node in downstream devicetree also shows:
> 
> 		qseecom@84a00000 {
> 			compatible = "qcom,qseecom";
> 			reg = <0x84a00000 0x1900000>;
>                          ...
> 
> If you confirm what you suggest, 'qseecom' reserved-memory node will look like the following:
> 
> 		qseecom_mem: qseecom@84a00000 {
> 			reg = <0x0 0x84a00000 0x0 0x1900000>;
> 			no-map;
> 		};
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml

The name (qseecom@84a00000) mostly does not matter at runtime, it's just 
a nice label we give it. The reg is the important bit that gets used in 
reserved-memory.

But actually re-checking, I don't think your reserved-memory works right 
now, msm8953.dtsi has

	soc: soc@0 {
		#address-cells = <1>;
		#size-cells = <1>;

which means that you should only have one value for address, and one for 
size, so "reg = <0x84a00000 0x1900000>;". This is different to most 
other Qualcomm arm64 SoCs.

Same for cont-splash below.

> 
>>> + cont_splash_mem: cont-splash@90001000 {
>>> + reg = <0x0 0x90001000 0x0 (1080 * 1920 * 3)>;
>>> + no-map;
>>> + };
>>> + };
>>> +>>
>> Any ideas what's connected to these pins? If you do, good to document
>> this like in other devices.
>>
>> Regards
>> Luca
>>
> 
> Unfortunately, downstream devicetree's pinctrl (kernel sources not available) doesn't mention anywhere 'gpio0', 'gpio1', 'gpio2', 'gpio3', 'gpio135', 'gpio136', 'gpio137' and 'gpio138' (but, for example, 'gpio4' and 'gpio139' are shown, instead). So, I've no ideas what these reserved gpios are used for.
That's fine from my side then.

Regards
Luca


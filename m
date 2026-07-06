Return-Path: <linux-arm-msm+bounces-116651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oezsD55XS2rhPgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:22:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA73070D77D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:22:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=radxa.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116651-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116651-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0654030D3072
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0868442A781;
	Mon,  6 Jul 2026 06:44:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0584252CF;
	Mon,  6 Jul 2026 06:44:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320252; cv=none; b=a3JVWy1sZLuQIHZMG4j6MNMi+vFbQYP677Q9TQCn8Wwma+edaFdJ5j3UsyeIhbr5YD+Iu5Ea6JxxbUKoyD3CfcRPeOmrPUDbPN+kSyDOWQCbhH6g/ylkL2+37TX0L2ppyQIEHLDgk0a3Zdrmdfcn0Zgn7x3VM/dQBtZQgsGcE40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320252; c=relaxed/simple;
	bh=TlNY0EcGvrM0sj1hh7yuKBLj/ZVCWg7JlEkJjg1b3dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ME1wmDdPxT30170UimDom2z1vIOWk4cuyHYQDtvfT5iKs1z//6k/TmKUBrIOSjeUmkEk51Qv5o2tm3vgdpbTUgYwYkdWfCUpcoQcQIh8tgKoff+WLa0F3jZq4F4xrvOTn3rjlHZdZErOuH52gkLt8SnPbTueoBtslaBaidNHFSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
X-QQ-mid: zesmtpgz1t1783320208t3b13217e
X-QQ-Originating-IP: my94fDoV7dC/ybLuzi/EbUOU8875QnkU0y0oQbmSUmg=
Received: from [127.0.0.1] ( [119.98.234.251])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Jul 2026 14:43:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9542639158901383598
Message-ID: <10ACF07CBAE77BF1+7fa077d8-5041-456e-8c66-94248f253065@radxa.com>
Date: Mon, 6 Jul 2026 14:43:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
 <926681E76F71D6A7+5482f550-9a97-4a01-95dd-6d4083bcf5aa@radxa.com>
 <797bba33-17fa-4fbc-a4b1-55735b3b5d57@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <797bba33-17fa-4fbc-a4b1-55735b3b5d57@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MfJtHqZtrd+O26MDlUcoaXsQjh99TDxwbU5aLcv76wrVFptgKkEejERk
	eGtAEceT2nV3kqVrbWBfLEzoELoDK1tCpSWdW+9Uqh9QldH2oPprSX/UgMYNqRFv4B2WLzY
	o7XDihOnnsFaYrZ/q0GSLnbZVMk/odhh2Iggsj3MaABODmKKVfduy9M4azfyYtxUlRIKIVO
	OeKZFdyOqTkMafFHZPWZvIZmEkxAOTEvMHC/abjvwMAif60JKiSuBIwAFGIGSH8mydvz7hX
	aBWL7AtuD23EC/2vPu4Qih4wNMI3DcGuV2nRSn/48PXgUljTbxRmUvEKcIAGMfLzYZaHxra
	qrkv4kNbX86NUJcKljNfwscPh3TWW7f0T1LUrSLxxrjO44WQO4fXeyz1AuSmCyCTCLzNbR0
	8qaIED/gXdLNXYpse4W8hVr50aKUCynRUZGLFvqRAiga8kiiqYSOFQF1Y3+sb5TVFhFINQp
	azgfK1yPYrCHYYJ8HWnHvFkFs5D+jem0E0Xmf4EsNfNnBtjTGXhksYSdjyGckm1aKsP5lFH
	hpm/8vOLpELetIG5DlE7xyVFoPRHn3BM+t4eldi0OXGRMyGDfhl53b3r0EeB+GkI2/V/LcO
	VShfSdkQHZgdwVIFCa2HDwCmojkhrwkip9hLcBIBnbKp7eGvPjcITl++fEPADQ/DZOZyZDe
	rn+Mkke7H8Qtu9LgiiVJRK7WJxgafN0BfCG9n2MVwzaalJjKlb5od0CVi2EV757lOFsO3x5
	Q3XVSJDptqufAng2ahid81pjXnh6fS/HOhAL0iYjuBBlPrkA4FdcZgFIrZBbmS4BA68CnmO
	jWnf93rhhC1MpVDFGTsFhhbs/j0AULvLluFYdwKjN4qRXc+ja6oO0k1x1DRkHslkLuhcYsM
	bDVKc5FdYsF91+18+WG6Crcfax8kUTio+5vPhZ+V1EFkEmKsG4JzF3IHGGlwHkJVQ7NSUQb
	sM00KjRjlLm7euF0m1WUv2AXxATylHFbaYlHATXoVATchYjvt+v814AOC0OxTd4PeRELyfx
	gqKI6LVgZPkJrXLFLDv43GRcqWPgGEmiLXBysnhQ1bWCIhGg8N8dKqncVHgGixMuBLkygIU
	Q==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.35 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116651-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_MUA_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA73070D77D

On 7/6/2026 1:24 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/4/2026 9:37 AM, Xilin Wu wrote:
>> On 7/3/2026 8:38 PM, Krishna Chaitanya Chundru wrote:
>>> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
>>> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
>>>
>>> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
>>>
>>> Override the base iommu-map with the expanded set covering all the
>>> switch's downstream ports (0x1400-0x1408 SID range).
>>>
>>> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
>>> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
>>> from the PCIe controller.
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 141
>>> ++++++++++++++++++++++++++++++++
>>>    1 file changed, 141 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>>> b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>>> index ba41dbc34b81..c2afb8372ab7 100644
>>> --- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>>> @@ -12,6 +12,26 @@ chosen {
>>>            stdout-path = "serial0:115200n8";
>>>        };
>>>    +    vreg_0p9: regulator-0v9 {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "VREG_0P9";
>>> +
>>> +        regulator-min-microvolt = <900000>;
>>> +        regulator-max-microvolt = <900000>;
>>> +        regulator-always-on;
>>> +        regulator-boot-on;
>>> +    };
>>> +
>>> +    vreg_1p8: regulator-1v8 {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "VREG_1P8";
>>> +
>>> +        regulator-min-microvolt = <1800000>;
>>> +        regulator-max-microvolt = <1800000>;
>>> +        regulator-always-on;
>>> +        regulator-boot-on;
>>> +    };
>>> +
>>>        vreg_pcie_m_3p3: regulator-3p3 {
>>>            compatible = "regulator-fixed";
>>>    @@ -102,6 +122,104 @@ pcieport0_ep: endpoint {
>>>        };
>>>    };
>>>    +&pcie1 {
>>> +    pinctrl-names = "default";
>>> +    pinctrl-0 = <&pcie1_default_state>;
>>> +
>>> +    iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
>>> +            <0x100 &apps_smmu 0x1401 0x1>,
>>> +            <0x208 &apps_smmu 0x1402 0x1>,
>>> +            <0x210 &apps_smmu 0x1403 0x1>,
>>> +            <0x218 &apps_smmu 0x1404 0x1>,
>>> +            <0x300 &apps_smmu 0x1405 0x1>,
>>> +            <0x400 &apps_smmu 0x1406 0x1>,
>>> +            <0x500 &apps_smmu 0x1407 0x1>,
>>> +            <0x501 &apps_smmu 0x1408 0x1>;
>>> +
>>> +    status = "okay";
>>> +};
>>> +
>>> +&pcie1_phy {
>>> +    vdda-phy-supply = <&vreg_l1k>;
>>> +    vdda-pll-supply = <&vreg_l3k>;
>>> +
>>> +    status = "okay";
>>> +};
>>> +
>>> +&pcie1port0 {
>>> +    wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
>>> +
>>
>> Just wondering, is there any side effect if PERST# is described here as well?
> one of the driver will fail as both are different drivers both are requesting
> same GPIO.
> 
> - Krishna Chaitanya.

Ah the board is using the same GPIO for TC9563 RESX# and PERST#. I see. 
Thanks!

>>
>>
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


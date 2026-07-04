Return-Path: <linux-arm-msm+bounces-116474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OVkjN0WHSGo7rQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 06:08:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8537069AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 06:08:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=radxa.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116474-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116474-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 246A630442B0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 04:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEA8383987;
	Sat,  4 Jul 2026 04:08:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EFB382F1F;
	Sat,  4 Jul 2026 04:08:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783138106; cv=none; b=pkP3iKIgdc+VPf3Uf9z5Sv3gNuL9hnOWe+ykn4E4jQdIcvDrcp+ZK8PJC2gniRTb7qFoUxiXrIpNvm8b/Cplbi/e4TKmsubXtAxaal8jIxQZMf3juf5amawljSsYuk75PXtA6RJcAn6oye/qkYKKNi3Eo23qKvrOle/QSt5C63U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783138106; c=relaxed/simple;
	bh=nXymSW/VcDeMtmXhKW0zT1XxT85EAUSLbI6y+AmpCMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/oXpZ7+9S/awztvWwh9DGjrLyOVYpgfRQIZLABEBGYPcqwnMt3ohCxJ7d/xyJG5diI5oAA/7T8F1QRAzUL9RRVVlHonmhh/eNBW3gjGcy5bWyUDhWgA9m+UzklXRTIueNWvstLvcftksShWVJNAYE2g/sYyEB0vHE7Vu76dUrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
X-QQ-mid: esmtpsz10t1783138057t5d0dfb99
X-QQ-Originating-IP: Dagi/XUOgU2h5qBFe9Smlbn5jn2uD2jIEPlXcDV7yKU=
Received: from [127.0.0.1] ( [119.98.234.251])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Jul 2026 12:07:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6974827005784446003
Message-ID: <926681E76F71D6A7+5482f550-9a97-4a01-95dd-6d4083bcf5aa@radxa.com>
Date: Sat, 4 Jul 2026 12:07:34 +0800
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
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mnff/9wu0oJYqWtcVqD8otk0vkTiqqiNAovR6/gQr3QwaN0k7a3zlmLW
	VIZiiMS6l4M5wUxOYpGS1bBFuRlvgNj09EHpqjkyOhoNdysPfp1N654pJt2xBTKFaYqNfh2
	xMta4LEXJDu6faOl722wkHAyQU6Rtah+Q3FZnH67U83764RSbVgrDnkggy2UMllRVXZac8C
	iMlIgLyouM3dYjeGc/ddmUIae2PRmt6FVBPHFQKQ9V5OCtbG691Q70E52wRRpEvWBrAb6MY
	86TI7u0gPTnm0EVZOUpU63rwB2IoW/kYn19/WADTct+NEyxVaBK7n3Hl8wH6VNY4A1kub6b
	Nv5p55IuCC4NrrHuQvY2fK1qbc5r0JQTxoMGkOUas+tCUU+7Ed/0P/PqPLwP/xfaWm0yaad
	EQDK17w6TNZoWTB2XtOhv//vWxq8YloUJgFT0Y3oqaPMpA/rCm3+vUpICdFsMvjwoB2FEHn
	hRG9z1vX43B29svBOsI1F8l7RPwABWzOpQxTz/prxe8JA1549//o1KcuNFfx6T7l/u4uRBs
	ZAL0Ds09XT9RY/JGEz6FB0O4zzRt2dQfn4PSM2Gf9rsRGPccXfCyjrWyEnJbqOXWpDFTiUL
	aRExQrK/dHC7sninmQOhx9rcgzolfjhT4xVLRImXz8/maj27Xx/IMd87iFMsHiaZTSNxd1W
	Dj/2T5CGoGibX/PiR3UK5FBoHUOYF3eAt1MuAm57Na5aiT9jdD63EEKKD2UikZMyzVml1Nm
	ZtoDHxVNy6ZLj2cfaJytuE8CIt6i/nqqGqDHx1/XS9+4unpmZNTavgQ8Dw5CdSJUn7Mn7OW
	/cWpVWWMB8UKcTuPbCW68ypOMWoHFu8RSTSLJXZKKnbUNpNC91lPtS5yA6p7A6uPhYtiuPs
	XmN4Udaj9YFMSAfGl2a5JgfL4/YoW3pJt6odt9csPGOp1UG5sRJUropIj6r5VRbRow8I35D
	MjmAqKsz9I7hYgCIXmRHAV036DCgIo5Rp3nDIMsLdCUwvuzHRawDBmz5M6dDZcghSJp67Uy
	Q3Om1AS8O1t1YJZGfGcIcgqDUuUuY9ealNRUWhUchzqcMRPREi
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.35 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-116474-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,radxa.com:from_mime,radxa.com:email,radxa.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F8537069AB

On 7/3/2026 8:38 PM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 141 ++++++++++++++++++++++++++++++++
>   1 file changed, 141 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> index ba41dbc34b81..c2afb8372ab7 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> @@ -12,6 +12,26 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	vreg_0p9: regulator-0v9 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_0P9";
> +
> +		regulator-min-microvolt = <900000>;
> +		regulator-max-microvolt = <900000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_1p8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_1P8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>   	vreg_pcie_m_3p3: regulator-3p3 {
>   		compatible = "regulator-fixed";
>   
> @@ -102,6 +122,104 @@ pcieport0_ep: endpoint {
>   	};
>   };
>   
> +&pcie1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_default_state>;
> +
> +	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
> +		    <0x100 &apps_smmu 0x1401 0x1>,
> +		    <0x208 &apps_smmu 0x1402 0x1>,
> +		    <0x210 &apps_smmu 0x1403 0x1>,
> +		    <0x218 &apps_smmu 0x1404 0x1>,
> +		    <0x300 &apps_smmu 0x1405 0x1>,
> +		    <0x400 &apps_smmu 0x1406 0x1>,
> +		    <0x500 &apps_smmu 0x1407 0x1>,
> +		    <0x501 &apps_smmu 0x1408 0x1>;
> +
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply = <&vreg_l1k>;
> +	vdda-pll-supply = <&vreg_l3k>;
> +
> +	status = "okay";
> +};
> +
> +&pcie1port0 {
> +	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
> +

Just wondering, is there any side effect if PERST# is described here as 
well?


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


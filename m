Return-Path: <linux-arm-msm+bounces-36379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD649B5D5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 09:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23B29B21B3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC9D1DFE16;
	Wed, 30 Oct 2024 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="FCqK6955"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915B1990B3;
	Wed, 30 Oct 2024 08:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730275773; cv=none; b=t/JUoXRfPODnGs+y/s7jFSxvS95hSJAjOA1MrMTq3IpnFN4zKof5xUMLeIHiuvT88MnyiEnLvshWav7CFR29wGRd970Wb3yfoVI56iJkGva1pE4Kzp7eglswFHqs/Ep7cUDZkIGSMevoikqRHeMIaujThHXLFYH4Vv1HCrtpcaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730275773; c=relaxed/simple;
	bh=Hgq90Mi2xq1WygdUx6Jv674dZqV4mLdTkACqF5QjQmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gU+TO28FMv8GLSSyJck5qegv7688naCO9hoVxQbvvSnq/XN80n5UvDvvASkH3oRraUnypII9X9SgjCdgH7RvkWJdBh5ClesHSk76254R01Api+nS9XhlgpSfFhybWVegnELztt69ntOPzdyQ4IN9qN4I6J2h6XQIas99X5s+RVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=FCqK6955; arc=none smtp.client-ip=212.227.126.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1730275754; x=1730880554;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=ggSRrICdiwdMr2YdL9EDtoZ4FIhVMjh2oL4+lZPbHP8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FCqK6955Ea2BQ75YwkUJwx7ap05g0iSXVyUCtlu6TQKpjSESPJ4jCW4pJ1Vfydlf
	 e8ixDVGQj/5QTvpCZWHmJouAjIWt4k+Oc55LenZ8EX15vzN9AFfq808y2bfoW1/AM
	 oewiYDorv2GHPX1vqvkZyzpb61T2c/yrEx+s2w+ksDizmFWf3doN+0tC5JK7o3YOJ
	 yDfMH85WGFC3cQOsORfBXTHHG6dutLCpq6oP5H2EjbEB55tiMciZnd+w8NYOk1oKQ
	 TntwJFOO9Au6TKBQwT6LD93A/BvOAJAY9G5nl6e90Y0ROtup+Cy7SKo06KnxgS603
	 F0RjRL9Lb74T6g7Ugw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([62.226.38.42]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M9Wqa-1tBa4z46fk-00BOop; Wed, 30 Oct 2024 09:09:14 +0100
Message-ID: <1546c4f8-7d4e-41db-9ac6-ddb6284697e4@oldschoolsolutions.biz>
Date: Wed, 30 Oct 2024 09:09:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Merck Hung <merckhung@gmail.com>
References: <20241030-jg-blackrock-for-upstream-v5-0-830c938437ad@oldschoolsolutions.biz>
 <20241030-jg-blackrock-for-upstream-v5-3-830c938437ad@oldschoolsolutions.biz>
 <ZyHiGlDnC8uqk_LG@hovoldconsulting.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <ZyHiGlDnC8uqk_LG@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yCLLEEpQSYb4eJnXYvApfEHM6Md1lRr0/Nag0EeEeiGFDrAp/Gx
 OS9Im6qOndFpBgmGgfEDYlHn49Sc06VW3WW+cVcTmo2Tic9dEgNZQ1XYNS6je/YsYBJoLz4
 kX74pKOeZKltAs83hFa/gyjoy+49x2cgQry6MOaBwkIJEhU7jEYXmySc68Glc9f9Sro8DXp
 /BPpv3Ec33sDK4WiNiNVA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eo97IPTglpI=;QBvD+X1rSjgWzZzjntt/vUwQQbf
 yCzB6qm/Av9i4XShcqbLHNX3KoPtQ3IwIP6Gr6yP3DNHwY6puPK5/Gh+wajj4r2dtqHM9CeVr
 nmFrAcq7ajj79mVwbbiKatmsNjiNjv16fHO/rdY0lq/Uc5OvFPbuFwLQlIPGbNZWOagjwVw0b
 foGwCTY3fRBzkpGzBsY5Tca3+nrk9m13M3loQmKJLENfoedWkIXNZemuxhqDfhp9NSQhxJvrT
 Y1EHBuzBUUpNla0+flN5K8LHeohyakD+Y1sWidu2l+R0SVDkphAAAPI8/TxMIFvG06KxnqqAH
 rbby4ueVXz/Hz2vhsUnYsf7IaMdFjQgT0y8TzxfMT2Q5gxT+zgYiAdGud1Jl5Eep1DqqxC5zK
 rx5ngG8z96J3lTKBkDdeOaX1p/+dG5fCYLq9NL7cQFOMhrVTVR1WJz9fgrf8iKar3FWRZgX25
 A8Kh7ofehMy8amoP2eC6CsIMs8a+cdbJvc2j086+JL3wYtuh9oyUM0JupUxF59f2buDH9ye9M
 R0YKFS7sMGxFe3JPj1rOKzTFOoWVZUZSAN5DCMSLqFTLF0k5WrUMPKMljLjfH8oGxbaFcgmSQ
 KVkeotydCg6gBdy7iOAXF1XKVg8shGFvSfsVks5ORUnxM2iE2dxxZsHHA0dAwbyP8RpSW2nLc
 H/vM0e0rpxeYuweXZ1yeXyGcaie1V2whYEEQ2Bel8aBIB/rTSkb/lOpUoel94r+VPMoVhy/4M
 ooI1gmBpfv/2MAaa+ySc5qVTUPW5z9V4Q==

On 30.10.24 08:36, Johan Hovold wrote:
> On Wed, Oct 30, 2024 at 08:09:21AM +0100, Jens Glathe via B4 Relay wrote=
:
>
>> +&pcie2a {
>> +	aspm-no-l0s;
> There is no such property in the binding (or driver) and L0s is disabled
> for all controllers on sc8280xp.
>
> (I think I used a property like this in an early version of the patches
> that ultimately disabled L0s however).

will remove (all of them)

>> +	max-link-speed =3D <16>;
> That's pretty fast. And not supported as this would indicate PCIe
> Gen16...

oh oops. Future-oriented ;) Will change to <4>

>> +
>> +	perst-gpios =3D <&tlmm 143 GPIO_ACTIVE_LOW>;
>> +	wake-gpios =3D <&tlmm 145 GPIO_ACTIVE_LOW>;
>> +
>> +	vddpe-3v3-supply =3D <&vreg_nvme>;
>> +	vdda-supply =3D <&vreg_l7d>;
>> +
>> +	pinctrl-0 =3D <&pcie2a_default>;
>> +	pinctrl-names =3D "default";
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&pcie2a_phy {
>> +	vdda-phy-supply =3D <&vreg_l4d>;
>> +	vdda-pll-supply =3D <&vreg_l6d>;
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&pcie4 {
>> +	aspm-no-l0s;
> As above.
>
>> +	max-link-speed =3D <2>;
>> +
>> +	perst-gpios =3D <&tlmm 141 GPIO_ACTIVE_LOW>;
>> +	wake-gpios =3D <&tlmm 139 GPIO_ACTIVE_LOW>;
>> +
>> +	vddpe-3v3-supply =3D <&vreg_wlan>;
>> +	vdda-supply =3D <&vreg_l7d>;
>> +
>> +	pinctrl-0 =3D <&pcie4_default>;
>> +	pinctrl-names =3D "default";
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&pcie4_port0 {
>> +	wifi@0 {
>> +		compatible =3D "pci17cb,1103";
>> +		reg =3D <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +		vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn_0p8>;
>> +		vddaon-supply =3D <&vreg_pmu_aon_0p8>;
>> +		vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply =3D <&vreg_pmu_wlmx_0p8>;
>> +		vddpcie1p8-supply =3D <&vreg_pmu_pcie_1p8>;
>> +		vddpcie0p9-supply =3D <&vreg_pmu_pcie_0p9>;
>> +		vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p8-supply =3D <&vreg_pmu_rfa_1p7>;
>> +
>> +		qcom,ath11k-calibration-variant =3D "volterra";
> IIRC the other calibration variants use all upper case here. And is
> Volterra sufficient? No vendor prefix or similar needed?

Yes they are of the pattern VV_Mmmmm

V =3D Vendor (uppercase)

M =3D Model (Model name mixed case, no pattern visible)

> I think you need to get this acked by the ath11k maintainer (Kalle Valo)
> first.

I will cc him.

The current (?) behaviour of the ath11k driver is that when a board
string with a variant is not found, it will search again without the
variant and take the one it finds. So it will work with degraded
performance, but it will work.

>> +	};
>> +};
>> +&remoteproc_adsp {
>> +	firmware-name =3D "qcom/sc8280xp/microsoft/blackrock/qcadsp8280.mbn";
> Shouldn't these paths reflect the DMI values as on the X13s?

Will check. Names were changed in the last iterations of the patch.

dmidecode says:

Handle 0x0009, DMI type 1, 27 bytes
System Information
 =C2=A0=C2=A0 =C2=A0Manufacturer: Microsoft Corporation
 =C2=A0=C2=A0 =C2=A0Product Name: Windows Dev Kit 2023
 =C2=A0=C2=A0 =C2=A0Version: 124I:00097T:000M:0200000B:07
 =C2=A0=C2=A0 =C2=A0Serial Number: 0F01C4F22373F6
 =C2=A0=C2=A0 =C2=A0UUID: e4a4662c-8367-75d0-a54f-1d04bd404860
 =C2=A0=C2=A0 =C2=A0Wake-up Type: Unknown
 =C2=A0=C2=A0 =C2=A0SKU Number: 2043
 =C2=A0=C2=A0 =C2=A0Family: Surface

>
>> +&usb_0_hsphy {
>> +	vdda-pll-supply =3D <&vreg_l9d>;
>> +	vdda-phy-supply =3D <&vreg_l4d>;
> The binding does not include a vdda-phy supply (same for the other HS
> PHYs).
>
> Where did this come from?

 From my "research" on the ic block diagram where they were defined
(outer and inner block). Will remove to X13s levels.

with best regards

Jens

>> +	vdda18-supply =3D <&vreg_l1c>;
>> +	vdda33-supply =3D <&vreg_l7d>;
>> +
>> +	status =3D "okay";
>> +};
> Johan


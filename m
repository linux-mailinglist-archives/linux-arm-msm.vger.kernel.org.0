Return-Path: <linux-arm-msm+bounces-68235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB78B1FB59
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 19:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3B1C7A5302
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 17:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C85D26AAAA;
	Sun, 10 Aug 2025 17:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="Ke1LSGgI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D481FDA;
	Sun, 10 Aug 2025 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754846827; cv=none; b=CwM40lcYswDkzR+nbD61ogUrTEfK3diIl82h06PUxo/gzC0wpcDJWTsnYxSaHx2WMUQmTWO4vViSEWPHrSf5Pyd4vVn9PU0hvpGe59gJpheFZtlI8/LqKi0hcgyNdsPOWwRxWR7oyITNb/R377yHMs+O91Wc8P18kFFxLJQv6BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754846827; c=relaxed/simple;
	bh=tZ+s8JQbPBW5ehuh4GXxgwiUpWRbStJyI8NUwLrLNWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=df5SgndJKbJqXp3LU03YCTy+LsBAXHiQ3ldpNc3Bc+ppTWDAb9TBtsXBCHrs//ShfNsw4hNCr3epfNt4RMKZJ/CeO6MVY8Pn2ilVyK9cdGERYM60pKu1w2rsH3L7QRd3XegXbrS1HJneffS6brdnsrmGK2wM46nxX3/8KNAm5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=Ke1LSGgI; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1754846818; x=1755451618;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=bDbqECv/BYpLOEPWZXaftN2xpm2I0CQ5t0RJuK6mhz8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ke1LSGgI5odDISennJ9aCjZ7ZbWUrbBdeNieL3HjOpc56mEU+08jn/cdN4lz6/8O
	 RxA5mIRO1ET53buXBlHsWs3WmlKQ4mAPSutmLjQvB48G1dwcQWhII1iI5N5NJ9oKs
	 pQYFNMWxsFDYYc/nsDAW9M/ri0IjH6u+kah2irOPmK0wbJANN619OKppEm2BZJ94z
	 Tkc/3TP0Muit6LJhjE/lCMmQOTLdS6IKYQt9n6RtV6Knc3umLHKYzgI34QykFQv+f
	 OjaMr/kFD0WgT0ZA8msf+tdsg3sm+rAjul6CsRr+/WO90HG5HXvwVgsRqgihdgg4c
	 yG8PlBWVebMku1l3Wg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MFsAJ-1upJ022uh5-006KDA; Sun, 10 Aug 2025 19:13:13 +0200
Message-ID: <297c72d0-d09a-46bb-90f7-0506bc72ccc1@oldschoolsolutions.biz>
Date: Sun, 10 Aug 2025 19:13:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250701-tb16-dt-v9-0-7d9e280837b5@oldschoolsolutions.biz>
 <20250701-tb16-dt-v9-4-7d9e280837b5@oldschoolsolutions.biz>
 <cc139316-03da-41e9-8bf0-f792bfdf5bb3@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <cc139316-03da-41e9-8bf0-f792bfdf5bb3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1DLzY7dy5+ChyCiZhcQdjxLEujfazbzE82Ndks//TwzloeAlmG2
 uXvd3/wUPb78MmpHSy7u9mjKXuLhpQiRFFjeJwI5wBLDNGqCVuzfoDvD0WfaYQybS6EtGlL
 QLPZsJvv9V8CC1Lpexd1IB2nbG2+qcrWlggY8xUq6htOLI+yLhsf9tpW/aqKtj2eqWalrFF
 w5t2wy9xe+TXg3F3shcSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C0Tac3rmuqY=;vehdaz3BzapQPJAtWys8Ezv9Qn/
 py04yeseYH4Q8mYLe8/+lrCWIGg671wa+vxMlSx/1OxfIDgfQORdtEKN7SkkeHeh3mrx+jJ+t
 Ai3TizCh+LSQNw7QZIOl3WOzPYc32oc0KJ4Bz6+50sgHpIJRD23NWfyfE/IssnMjn1Z9+yPhb
 ekZpkqzYpnOclleQo2ufbKt7gcFMT9T/gv5OpMjwJ+1cs90MafGaWw9/00F985naQ24p+o+Yp
 saFLHF6cPGPq+bJicLW9RVbZxRT7/WP9VkLMjWp2MD4o9ioJarrOq2fzte5gcfgWomfov1k/W
 607Q+eeoBmij7kQZIREzG5Hhjk1buCHZ2oS4aPKxzfenlXpcRu1Kwnu9QeBz+HLDGfQWlAP3j
 ed/7u/Ggn8KmPvSpdeA6QN2cGIzVEZvJt2VI5HtBTaAZyd5VSi7HVpn4PHuCIdd3LxnNhxNYF
 T0jZVHdKmPpUcYKbi1QeJk7ZrYTa4B9yO5eYQ53RWgKYVJkqC578M8weQnP3NRIGogLhq/CCW
 BQilttCWPTB8agpxK/Ap2pSsENZ6BuTQjZREGncyJR64zandJMsq9Wj3hLI1z912rmMeTDI/m
 xbSZoOY6d61a3cjlwepsC3dopCJr1wm+Z2ONKpd4j7BatMl7zEqCSeVqdhlSTkK4NgIs8RWUd
 DnGiNck++OjRO0y6+YbKMPcjMhLzzx6ED/bLzxKNfVBe1p/bj4+SFgB9EA3M1dVZQtJehx5Ol
 6JjUeDZMv+Bw8r2xhFRcBsqMRojtV3SM80Mt0JXPvSLhn40zQW53KKC1mDggn6lz7UTlOgAC0
 lx1J/ZT82fKld166AG5pvVX80KpH/1qfC+c6VgTqYTDlQ4WVeSoGttL8DyfjnVeYrdKKASdRU
 h5BOmqL3MSDCMTElmR/Ey203Zut8DEcjAfOcdzxHbdsg/HvXv5kmN/kzK+Cdx1sRtvYBE+BVJ
 /4DoQxPp23p1f0DRGCZ1eLK4uTopzltxcgnifrlC5OmZV/4NwlyPIpZPjN/CZEqcDMf5KknVS
 Aw99fmksJWjn1oPg7cBXctIQbOheFloWmgHhsYDd1bXMoZJk4XrKeO6ZFcqPRJ/AzUmWvYl8G
 oPARs3tNvlJW8G5zW7KkySKpYK+VpBOiW3dooKZjigADQn35+3/Tz8Di1BwtnKhQiVRJvQu7z
 azcoZa10c7XUo3DS7ozqoiPJCxe8+hHm7/uOxAnq80VvTs38BAeUQ1J1fDwhyaezbG+NJZDSL
 7dzUMNGRzk1fxnzOGmqiPkOB5sIIal6bDfvQFcosGCqzPuHWjMp6QwsQ8TuiP+FggtLtsshG/
 +5YHi8CSazqRS9LmPF0LGowWVckBorEULtct2jYoteK5WQCxAzUquVyIjxiN+LGKlIP8i/ZcQ
 Pq8yl1St4SCuGGvk6sBOBJd2+Aypveoa8c60ImC0cxkbk+dMLACu5YtW8GHwlKiTxj6/FNs2i
 D55yksUyt5b6DMRo4Hoa1EU7uw3Ro/QrmsM6vMSeYI92WipXBNTt9ndVIt+ffh105IFHLfPrB
 Ubtq4JsakScQ/KpP2SiY/JU5cTyZf5xUng/4OUBjX2gCI72kdMGKA0f5O5571UWnsewajuALh
 YdjjuxB4ppjjYCwHRziKeg+A3tFqxnfdzAzlWutVqyTenT9j4UlKz3s/qpYOzYubx94uiIn6h
 w=

On 30.07.25 10:50, Konrad Dybcio wrote:
> On 7/1/25 7:02 PM, Jens Glathe via B4 Relay wrote:
>>  =20
>> -		pm8010-thermal {
>> +		pm8010_thermal: pm8010-thermal {
> Let's rebase on:
>
> https://lore.kernel.org/linux-arm-msm/20250701183625.1968246-1-alex.vina=
rskis@gmail.com/

Done.

>> +		wcd-playback-dai-link {
>> +			link-name =3D "WCD Playback";
>> +
>> +			cpu {
>> +				sound-dai =3D <&q6apmbedai RX_CODEC_DMA_RX_0>;
>> +			};
>> +
>> +			codec {
> 'co'dec < 'cp'u
>
Done and checked
>> +&i2c2 {
>> +	clock-frequency =3D <400000>;
>> +
>> +	pinctrl-0 =3D <&qup_i2c2_data_clk>, <&tpad_default>, <&kybd_default>;
>> +	pinctrl-names =3D "default";
>> +	status =3D "okay";
>> +
>> +	/* ELAN06FA */
>> +	touchpad@15 {
> 5 touchpad variants is a lot. Does DSDT give any clues as to whether
> all of them are plausibly present on production hw?
>
I took sort of a survey among users, and we got mostly @2c (CIRQ1080 or=20
SYNA2BA6) and one with @38=C2=A0 (FTCS0038). All the others are defined an=
d=20
look like wired up in the dsdt. There's also=C2=A0 3 display panel variant=
s=20
defined, all with the same totally odd pwm backlight mechanism according=
=20
to the dsdt-embedded xml structures for these. Survey showed all the=20
same panel as mine, except the one with the diverging touchpad. The=20
sample size is ~5, so not really representative.
>> +&mdss_dp0_out {
>> +	data-lanes =3D <0 1 2 3>;
>> +	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 8100=
000000>;
>> +};
>> +
>> +&mdss_dp1 {
>> +	status =3D "okay";
>> +};
>> +
>> +&mdss_dp1_out {
>> +	data-lanes =3D <0 1 2 3>;
> Does defining all 4 lanes not upset the driver without additional
> patches?
Yes, corrected, thank you.
>> +	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 8100=
000000>;
>> +};
>> +
>> +&mdss_dp2 {
>> +	status =3D "okay";
>> +};
>> +
>> +&mdss_dp2_out {
>> +	data-lanes =3D <0 1 2 3>;
>> +	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 8100=
000000>;
>> +};
>> +
>> +&mdss_dp2_phy {
>> +//	vdda-phy-supply =3D <&vreg_l3b>;
>> +// 	vdda-pll-supply =3D <&vreg_l6b>;
> The regulators are usecase-specialized, feel free to trust what
> is present on the CRD

Removed mdss_dp2 since it's not working reliably yet.

>> +	ports {
>> +		port@1 {
>> +			reg =3D <1>;
>> +
>> +			mdss_dp3_out: endpoint {
>> +				data-lanes =3D <0 1 2 3>;
>> +				link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 8=
100000000>;
>> +
>> +				remote-endpoint =3D <&edp_panel_in>;
>> +			};
>> +		};
>> +	};
>> +};
> Please rebase on:
>
> https://lore.kernel.org/linux-arm-msm/20250724-move-edp-endpoints-v1-3-6=
ca569812838@oss.qualcomm.com/
Done.
>> +&sdhc_2 {
>> +	cd-gpios =3D <&tlmm 71 GPIO_ACTIVE_LOW>;
>> +	pinctrl-0 =3D <&sdc2_default &sdc2_card_det_n>;
>> +	pinctrl-1 =3D <&sdc2_sleep &sdc2_card_det_n>;
>> +	pinctrl-names =3D "default", "sleep";
>> +	vmmc-supply =3D <&vreg_l9b_2p9>;
>> +	vqmmc-supply =3D <&vreg_l6b_1p8>;
>> +//	bus-width =3D <4>;
>> +//	no-sdio;
>> +//	no-mmc;
> Please either remove the '//' or remove the lines
>
Done. I have an idea which driver it should be (BayHubTech driver for=20
the PCI variant) since the Ideapad 5 has actually both variants - the=20
Slim 5x on pcie3, and the 2in1 on sdhc_2. The Windows driver supports=20
both interfaces.
>> +&tlmm {
>> +	gpio-reserved-ranges =3D <34 2>, /* Unused */
>> +			       <72 2>, /* Secure EC I2C connection (?) */
>> +			       <238 1>; /* UFS Reset */
> Try removing the UFS reset block and see if the platform still
> boots, this turned out to be a false flag on CRD
Done, still working.
> I'd also suggest removing voltage suffixes from regulator names (i.e.
> turn them to e.g. vreg_l6b).
>
I'm not really a fan of this. The X1E dtbs all have the voltage suffix,=20
and it is actually quite human-readable. Which of course is not the goal=
=20
of a dts, but well, as a human writing these I like some orientation help.

with best regards

Jens



Return-Path: <linux-arm-msm+bounces-61953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7FAE2B78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 21:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 580D0174552
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 19:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1EAE545;
	Sat, 21 Jun 2025 19:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="HduF9m21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DBC1361;
	Sat, 21 Jun 2025 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750534270; cv=none; b=mXxzhAkJU7w+WfXop83UcU4YmRFeDXRuqucMR8hHJB8rbCIY8bxjMwPSr/Og+73CqHDGFCcTsYBFvI0nVNErYMoIjhpPNs8acVMZh2qHVv0f4baVtbwqPxnV3hiX5wHI9GKfQv9nh0LI2CWBYfHC7azG/BQ0uTS1Vq1j2o4p5Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750534270; c=relaxed/simple;
	bh=8GUx0CFXgZvbQXHjRU4GIpNFxMcjxps2dflD5GrQv+g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EoDa5NXA3jkBM2G1V1uGZxbjx1MPI/mR2o143UBb+ZBQNtPd+LHqpYYOib2wGkvNfKyUM2yMvLlNqVJNQLWLaIS0utnZeEj+7AWSQVsZiabzfNMPLLm2o4FllRAkwkhi2lBCmZMNyYsBSObJjR6xAdtacc12dqZaOXc9ZvuQ2P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=HduF9m21; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1750534265; x=1750793465;
	bh=8GUx0CFXgZvbQXHjRU4GIpNFxMcjxps2dflD5GrQv+g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HduF9m21l/K79zE4ap77nzeXyKdalQiw6+opOnSaflFcjHm8nKdTYT2+rFFoaj4mW
	 ld1RU0SPZb44WH86P8Mws8AHvgIFoyLDx9inR+HqIDnI8grVo3AgklsHghAwUrNUz5
	 sL3F1tJlho634mWRjKJTtvhuqHr37a+GCIRgF+KfzK18Fnmlz6QsihL8ufuJvz4IIO
	 1WuoiQN0todaSE+Vr4R6TT7H4o/VALHlphnNMOk+YAlngAdFJmuXXqwfSUZ5xji/EH
	 /jWAJO0TTyrTctOefo3KI0yfaoohj2xyaWYjMavw6xAr4crZHiDbuE3ZhSIl+dEXIb
	 FhiRvrkAI7tLg==
Date: Sat, 21 Jun 2025 19:31:00 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for Billion Capture+
Message-ID: <Fp48ghZvedurtk8ta0jccDkZvg7whZFgX0Ra7_AQuMwS12QxAxHqgcOMP_SbXsnLNme2LWWz6ZshoGFTQT6nVvfe-4B_v-2hkRxpgcb9bq0=@protonmail.com>
In-Reply-To: <557166bd-cbe2-4a7b-bd6c-8daec1cecc3d@oss.qualcomm.com>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com> <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com> <557166bd-cbe2-4a7b-bd6c-8daec1cecc3d@oss.qualcomm.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 15bc67b8a7af4ebeea515c3c4e5f83471731488c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, June 21st, 2025 at 12:17, Konrad Dybcio <konrad.dybcio@oss.qua=
lcomm.com> wrote:
> > +
> > +&sdhc_1 {
> > + vmmc-supply =3D <&pm8953_l8>;
> > + vqmmc-supply =3D <&pm8953_l5>;
>=20
>=20
> you should add regulator-allow-set-load to these vregs

So, do you mean I should add 'regulator-allow-set-load' property to 'pm8953=
_l5' and 'pm8953_l8' regulators? If so, should I do that for 'pm8953_l11' a=
nd 'pm8953_l12' regulators too (sdhc_2)?

> [...]
>=20
> > +&tlmm {
> > + gpio-reserved-ranges =3D <0 4>,
>=20
>=20
> These GPIOs correspond to I2C/SPI_1
>=20
> <135 4>;
>=20
>=20
> And these correspond to I2C/SPI_7
>=20
> Without much more knowledge, I would guesstimate one of them is
> for a fingerprint reader and the other for NFC eSE
>=20
> Konrad

I made that check in past and, while it looks like 'gpio16' and 'gpio17' ar=
e assigned to nfc pinctrl (though, nfc appears not to be implemented in thi=
s device, considering also the lack of 'phandle' for such pinctrls) in down=
stream dts, the devicetree pinctrl still doesn't mentions the gpios associa=
ted with the fingerprint node (which is, instead, implemented in this devic=
e). So, I'm not able to verify if gpios 0-3 and gpios 135-138 are related t=
o fingerprint and secure element, respectively.


Return-Path: <linux-arm-msm+bounces-83187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8180AC83E48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C9DAD3466AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA882C3770;
	Tue, 25 Nov 2025 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="LNqH9EMA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C712230BD5
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058165; cv=none; b=FXXV5wG8HQJZ2jkkWd+Oy9I+uBSHJtSFEmTitIZ+Ow4dZnYtpHRD5l+osuR0LUjY/NEXnynTmHfxdHw4Q7fRuP1dFQkQsEgUxBWUnTqQJ1hQEpph7tFnidLB/cXYPmi2n7l/xS1/2Z3GXplnR1jKQ21iGN51XqYnWqzNd1MI+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058165; c=relaxed/simple;
	bh=2FiDWAy4dzApR6kN2gSsWRY9om4E1YgQis0mYlV1oaQ=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=s8qAVD7kR5e6XsGHsPz+A86yqNiauVUMRK/36EZqnQ64ikBT/SvxM4vOZlmvikBaPzFG70TxpnSYri6U9xKK/aekVXRoGOGvzvJGWeUcA5xUk4W9t4hWnXbTPoLuzz1vsYc2V7hOsOgfC3WxOHf/+PS0kYNWNzl17oh9tHbQoQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=LNqH9EMA; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZDmlYFu0TJ42/du0B4JgWp/3RyRXiT38keF1ISqat0=;
	b=LNqH9EMAEFF0AbUTH0YDt4XuZ+Mk1EbNqCT+HoYIgtP4gf/Sl3FTSATS2KYEwI8rTIZzrj
	PmZvY+iEvSxFv7nlJ5AccIDXsKW2zK8tMVgQ8ew1GdsiZ6uLVIyrvW/rgoIkr9c7uFLMCm
	QaWAAJQeR8MuIKg/vZk7B9z+aYJgqvtO+chVW58uDKYheXht4YmEtCN3xkylVNPKK2iAFv
	42qEC4em/MYa8OEAdlYAjHv0lcZFfZDgRbxsWl3aZSR4ZnPrb92ZmA7FFqF63zh6DdqhwR
	uFDJEB17PPD6zQUe5gYMgqypxrEz7akdNqyJUEZRdyZA9jRyJCF+hzoBfRn9Vw==
Date: Tue, 25 Nov 2025 08:09:12 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <151736b1b2fc3432ad19631ea359c1679e370259@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <38c70e06-f7bf-4ca6-8fe9-2a4012017cff@oss.qualcomm.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
 <38c70e06-f7bf-4ca6-8fe9-2a4012017cff@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

October 1, 2025 at 9:09 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.c=
om mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%3C=
konrad.dybcio%40oss.qualcomm.com%3E > wrote:


>=20
>=20On 9/29/25 7:05 AM, Paul Sajna wrote:
>=20
>=20>=20
>=20> These regulators seemingly help the lcd to work better
> >=20
>=20Electronics generally work better when the required power supplies
> are enabled..
>=20
>=20>=20
>=20> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> >  ---
> >  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >=20=20
>=20>  diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/=
arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> >  index 3106fdc9b679bc6a43a1a490c61b73a63003f7e1..9c3662a3d93e12466747=
4753e0f11d0e98698aa0 100644
> >  --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> >  +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> >  @@ -48,10 +48,27 @@ zap-shader {
> >  };
> >  };
> >=20=20
>=20>  +&ibb {
> >  + regulator-min-microvolt =3D <4600000>;
> >  + regulator-max-microvolt =3D <6000000>;
> >  + regulator-over-current-protection;
> >  + regulator-pull-down;
> >  + regulator-soft-start;
> >  + qcom,discharge-resistor-kohms =3D <300>;
> >  +};
> >  +
> >  &ipa {
> >  firmware-name =3D "qcom/sdm845/lg/judyln/ipa_fws.mbn";
> >  };
> >=20=20
>=20>  +&lab {
> >  + regulator-min-microvolt =3D <4600000>;
> >  + regulator-max-microvolt =3D <6000000>;
> >  + regulator-over-current-protection;
> >  + regulator-pull-down;
> >  + regulator-soft-start;
> >  +};
> >=20
>=20This patch will allow any values between 4.6 V and 6.0 V to
> be set on your phone, with the kernel defaulting to 4.6 V at
> boot and staying there until (if?) any driver requests that to
> change.
>=20
>=20Your panel probably expects a *very* specific pair of voltages
> and any deviation may cause unpredictable consequences, including
> magic smoke if you happen to go over a certain limit.
>=20
>=20You should most likely hardcode that specific expected voltage here
>=20
>=20Konrad
>

Here is the decompiled downstream dts.

qcom,ibb@dc00 {
						qcom,qpnp-ibb-init-voltage =3D <0x53ec60>;
						qcom,qpnp-ibb-init-amoled-voltage =3D "", "=3D\t";
						qcom,qpnp-ibb-soft-start =3D <0x3e8>;
						qcom,qpnp-ibb-use-default-voltage;
						qcom,qpnp-ibb-init-lcd-voltage =3D <0x53ec60>;
						reg-names =3D "ibb_reg";
						qcom,qpnp-ibb-slew-rate =3D <0x1e8480>;
						qcom,qpnp-ibb-en-discharge;
						qcom,qpnp-ibb-ps-enable;
						qcom,qpnp-ibb-limit-max-current-enable;
						interrupts =3D <0x03 0xdc 0x02 0x01>;
						qcom,qpnp-ibb-lab-pwrup-delay =3D <0x3e8>;
						phandle =3D <0x4ec>;
						qcom,qpnp-ibb-debounce-cycle =3D <0x10>;
						regulator-min-microvolt =3D <0x4630c0>;
						qcom,qpnp-ibb-limit-maximum-current =3D <0x60e>;
						reg =3D <0xdc00 0x100>;
						regulator-max-microvolt =3D <0x5b8d80>;
						qcom,qpnp-ibb-step-size =3D <0x186a0>;
						qcom,qpnp-ibb-full-pull-down;
						qcom,qpnp-ibb-switching-clock-frequency =3D <0x5c8>;
						regulator-name =3D "ibb_reg";
						interrupt-names =3D "ibb-sc-err";
						qcom,qpnp-ibb-min-voltage =3D <0x155cc0>;
						qcom,qpnp-ibb-pull-down-enable;
						qcom,qpnp-ibb-lab-pwrdn-delay =3D <0x7d0>;
					};
				};

Should I use the init-voltage for min and max microvolt?


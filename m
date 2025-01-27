Return-Path: <linux-arm-msm+bounces-46238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921CA1D6DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD1903A1BDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7E31FF7B3;
	Mon, 27 Jan 2025 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="4C/zL2ZF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462B41FF1DD;
	Mon, 27 Jan 2025 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984852; cv=none; b=foVAD6WD1dtwAhP6exi8fxEjSWoXAmzjWK/gRiMumbAZJkPCFa1oP43MIynknfLaBAkdx+enmn7lBi930X1SrUpm9EibuPJKT3h44i/U31FcHqPWP4h50kmRtZBGfoP3Rkr1mepfo9CBPyyD7XziKwWLCe7ieFcqDb9iDWT1kAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984852; c=relaxed/simple;
	bh=pu+twnQ09fT1+OR56Fzlqp4u+qfRzQi0cXq0ZIsbAcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QDimbpjW28Wi2KQOnBSdrUlrp35GuD/QFDLZOXgQabxf9rp8lY5g2QQJL94agtiwdZcIuN+3fEoMcBAIY8Dr4GtZ2mmt+3VKOrAyJm2SfzsCxF6uPn3znnW6jjk64ncmgtkR11pk8vn8gK4+24ADSJciOtp1XjxO/4Flpb6dB2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=4C/zL2ZF; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737984849; bh=pu+twnQ09fT1+OR56Fzlqp4u+qfRzQi0cXq0ZIsbAcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4C/zL2ZFnOXjH5R91W/rtheinwdKeIn12r8IIgshIeqvtuzDvCfJlmvnIw/H0m0e5
	 vDvXzV66rfv04BEfLLOMWaswn9Gs0hn0NO/TrbMs0uwI6Ndj0G4+++T6lAFei8+ZkH
	 vCScqtcGWvFleMuDf5AyiuOsLBY755t9QvQy9wfA=
From: Luca Weiss <luca@lucaweiss.eu>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Matti =?UTF-8?B?TGVodGltw6RraQ==?= <matti.lehtimaki@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 9/9] ARM: dts: qcom: msm8226-samsung-matisse-common: Enable
 modem
Date: Mon, 27 Jan 2025 14:34:08 +0100
Message-ID: <5638469.LvFx2qVVIh@lucaweiss.eu>
In-Reply-To: <Z5dVc9yTynAsPDcZ@linaro.org>
References:
 <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-9-e88d76d6daff@lucaweiss.eu>
 <Z5dVc9yTynAsPDcZ@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On maandag 27 januari 2025 10:44:19 Midden-Europese standaardtijd Stephan=20
Gerhold wrote:
> On Sun, Jan 26, 2025 at 09:57:28PM +0100, Luca Weiss wrote:
> > From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> >=20
> > Enable modem remoteproc on samsung,matisse-wifi & matisselte.
> >=20
> > Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi | 7 ++=
+++
++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-
common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dt=
si
> > index fbd568c7d6b7415d240aa1a2329d07cf9135274c..
4155bfb2136022f2a85d69451c34f06ed2a700ac 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> > @@ -225,6 +225,13 @@ &blsp1_uart3 {
> >  	status =3D "okay";
> >  };
> > =20
> > +&modem {
> > +	mx-supply =3D <&pm8226_l3>;
> > +	pll-supply =3D <&pm8226_l8>;
>=20
> Hmmmmm, so I was looking at msm8926.dtsi downstream and it seems to
> override the msm8226.dtsi modem/mss definition [1]:
>=20
>  1. ext-bhs-reg is dropped
>  2. vdd_mss-supply is added

That's the same what I found, and have working with more (currently hacky)=
=20
patches on msm8926-htc-memul. I decided against introducing it with this=20
series since these patches have been pending for too long and initially whe=
n I=20
was doing 8926, I wasn't sure how to make this into a proper patch. Now my=
=20
idea is to introduce a "static const struct rproc_hexagon_res msm8926_mss"=
=20
with the compatible qcom,msm8926-mss-pil which has these two differences.
I think that's a better idea than adding some extra conditionals around to=
=20
make the mss-supply optional and ext-bhs somehow optional in the driver bas=
ed=20
on dt.

>=20
> This common include seems to cover both apq8026 (matissewifi) and
> msm8926 (matisselte).

That's a very good point. I didn't think much about the matisse patches sin=
ce=20
they were introduced by Matti but yes... Either I add the msm8926 support i=
n=20
the same series already, or we just enable modem for matissewifi for now. I=
=20
think I'll opt for the latter since the series is already 9 patches long an=
d I=20
don't want to make it too complicated.

>=20
> Do we need to handle this difference?
>=20
> First time I see such a difference between variants of a single SoC.
> Looking at all the overrides in msm8926.dtsi, it seems like they made
> quite some rework for the "LTE variant".

Yeah, no clue what they did here. But also I think Qualcomm stopped making =
a=20
thousand different variants of the same SoC (*cough* msm8974), nowadays the=
y=20
"only" make different variants which get different letters and numbers=20
(sc7280=3Dqcm6490=3Dsm7325 etc).

>=20
> Thanks,
> Stephan
>=20
> [1]: https://github.com/GalaxyTab4/android_kernel_samsung_matissewifi/blo=
b/
45f97bab323176fead18c8ddc20dc57d979904a3/arch/arm/boot/dts/msm8226/
msm8926.dtsi#L32-L40
>=20






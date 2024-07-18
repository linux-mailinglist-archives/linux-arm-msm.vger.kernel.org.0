Return-Path: <linux-arm-msm+bounces-26569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 725B4934F78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 16:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 094FDB23DAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 14:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FF0143734;
	Thu, 18 Jul 2024 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALuzJ1og"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8EF142E9F;
	Thu, 18 Jul 2024 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721314588; cv=none; b=ut3rx4SWJZfrYhoOKBhJEyXRgbrIkAgdq1rPoVepNSybBHK0ta7SYm6YcRSDFU9EhaffSxGfTkI02lA0qt54WwkG6Zg+UHcrMFMtWOJenffAOloKnvXqdFKRZZMTYjhVgLL3TzFRMMJiI6L0sNptEEJqXDTFUANuQ8Uw3iXc6Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721314588; c=relaxed/simple;
	bh=tSgqzWNmJO+WCgofyEUACVT6HAG617pXetzG54A/Z6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaL0ITyTjG5D3+r0bWb1q2CC/RlExrfXS2OON/aofAsJ1siBsLfOKuM3qO6IAne8kcB56x6v+AAq8KpMP2s1Ls//eP2pr8O4GO9wnmZJU29Ee9eSOCfimrAmQf/H2uTV5Wh/6tmqGeDvnw8+8/del+Sd9+Gw2nlUm8eiMHujH/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALuzJ1og; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B2BC116B1;
	Thu, 18 Jul 2024 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721314588;
	bh=tSgqzWNmJO+WCgofyEUACVT6HAG617pXetzG54A/Z6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALuzJ1oggJxtH/KZEsTWCjeelDTTE2keK3kqYC7RAOd2nC6Ot+MAbBuLmb43D7DMS
	 f8tgQ5R0zAEBCyWCZTRst7SQLqDxHmGS9Znne/lZwayAihXz6aP3GsT33LBn/n5xQ5
	 D385VLNAzYoAWIcNX6Ww+9hLCj2lRwi+/f7xWxvrvLas/yB7lKl6Xw+H4ByrOv2VDX
	 zXXakVPDdzey//QKMzAwnbHlwldxdQeOGlClIzWUg7wbD0CLVGaYnFzbSkTexAU+uH
	 luVDf3WN+2I+hdfANGM9nU6hLCluTs9yXrljburJuji7pxd85KFVTHeGAgqH5nvPod
	 VpB3QvOlKBvoA==
Date: Thu, 18 Jul 2024 15:56:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
Message-ID: <20240718-frightful-naturist-a049ea7c0548@spud>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
 <20240715-scorn-canning-a7f23b9e2039@spud>
 <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
 <e017259b-bc62-4b57-9276-b834237225e1@kernel.org>
 <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D1ox+EeWBIBWunlR"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>


--D1ox+EeWBIBWunlR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 07:45:57AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Wed, Jul 17, 2024 at 11:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
> >
> > On 18/07/2024 02:21, Doug Anderson wrote:
> > > Conor (and/or) Krzysztof and Rob,
> > >
> > > On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@kernel.or=
g> wrote:
> > >>
> > >> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> > >>> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backli=
ght
> > >>> control over the DP AUX channel. While it works almost correctly wi=
th the
> > >>> generic "edp-panel" compatible, the backlight needs special handlin=
g to
> > >>> work correctly. It is similar to the existing ATNA33XC20 panel, jus=
t with
> > >>> a larger resolution and size.
> > >>>
> > >>> Add a new "samsung,atna45af01" compatible to describe this panel in=
 the DT.
> > >>> Use the existing "samsung,atna33xc20" as fallback compatible since =
existing
> > >>> drivers should work as-is, given that resolution and size are disco=
verable
> > >>> through the eDP link.
> > >>>
> > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > >>
> > >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Can you comment on whether you would consider this bindings a "Fix"
> > > since it's a dependency for later patches in this series (which are
> > > "Fix"es) to pass dtbs_check? See:
> > >
> > > https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro=
=2Eorg
> >
> > The patch itself is not a fix, for sure, but it might be a dependency of
> > a fix (which you wrote above), thus could be pulled to stable as a
> > dependency.
> >
> > I do not care about dtbs_check warnings in stable kernels, mostly
> > because dtbs_check warnings depend heavily on dtschema and dtschema
> > follows mainline kernel. Basically if you had warnings-free v6.8 but try
> > to run dtbs_check now with latest dtschema, your results will differ.
> >
> > At some point in the future, I could imagine "no new dtbs_check warnings
> > in stable kernels" requirement or at least preference, but so far I
> > don't think there is any benefit.
>=20
> In this case it's not about whether it makes it to the stable kernel
> but about which main kernel it goes through.
>=20
> If we land the bindings in drm-misc-next right now then it'll be a
> long time before it makes it into Linus's tree because of the way that
> drm-misc-next merges. It will make it to Linus's tree at 6.12. You can
> see the drm-misc merging strategy at:
>=20
> https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
>=20
> If we land the dts change (a fix) through the Qualcomm tree as a fix
> then it should target 6.11.
>=20
> This means that the 6.11 tree will have a dtbs_check error because it
> has the dts change (a fix) but not the bindings change (not a fix).
>=20
> One way to resolve this would be to treat this bindings as a "fix" and
> land it through "drm-misc-fixes". That would make the bindings and
> device tree change meet up in Linux 6.11.
>=20
> Did I get that all correct?

Is not not fairly established that a dependency for a fix can go onto a
fixes branch even if it is not a fix in and of itself?

--D1ox+EeWBIBWunlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpktFwAKCRB4tDGHoIJi
0l0hAP9oMgUCY0L0L+JXoet8nWv2zNgwIfTwZXavs+Iu/ca2qwD/Z1fYgBBK5XEW
GbXUIu/b+CkSuZDq65FI6d8WHUhECgg=
=5e8A
-----END PGP SIGNATURE-----

--D1ox+EeWBIBWunlR--


Return-Path: <linux-arm-msm+bounces-26201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B26F931796
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 17:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036501F219B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119411E528;
	Mon, 15 Jul 2024 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0kBacF9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC4A18FDCD;
	Mon, 15 Jul 2024 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721057304; cv=none; b=KWtCr4mp0fSqNksDHMWkeImH+zb3KoggSdSmlKEPGmj4nBnHrs73m6EIH+Fy2ZuwcGqcQqdJGhw13sMjm0biZ5odAk7X42jrsYzA+oVTu7w79297WCpeXCUB8AeKaf5vrBHlL0eR3ZrQzVQujjk6+lphi3dS1Jbw8G2A1Cc1OA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721057304; c=relaxed/simple;
	bh=wMcIDWrmGAfvryRlixL8w6f8KnHDW2Iqu7kAgZM/vXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UViUZd3+H3bDhxk/ZPPgZl2t7ZVjs0nIVDABmlUlC2HbsVFfKocE671Z71LbjO+6v82MYXtga7cPvKUTNWGDmnsdW2NHfV45CvPKa/wPqoBKMgBqp1NjGZIJnTGiDNyRdrDg/GnQTqENo5fLAxs4JbAJQkN8AK+zeNTff+a8IgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0kBacF9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1927C32782;
	Mon, 15 Jul 2024 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721057303;
	bh=wMcIDWrmGAfvryRlixL8w6f8KnHDW2Iqu7kAgZM/vXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0kBacF92LbdiCs93gFwNPY1FfabN+E68VMrZgdO82AA0zEKsj1TLZd4UbDYoezIz
	 UedRDekGi4ANFCCccOS5CIsByt5S+bYum5Llve43wrRgHD4LcELHl9TyvsjWXH5gqx
	 QNjhQpwpy3uJUN5j03dstiME0Ou3BFNmEEERIIBgnCmM0z66A08TzL2JPnW0h6MmaQ
	 aDGkhrggp3TEW3ZfNY8NUxwlieFOklBKDb3hHPpzUmxNN6ux2xf/Mk747654+EO2ey
	 HqIRw4o4nRRdzP0LCbJ818Aaj31dv3XojbfnhHEId7uDYvZ7aYePb040ggppbN5/z0
	 ScrqQPZTdJa4A==
Date: Mon, 15 Jul 2024 16:28:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v6 3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
Message-ID: <20240715-stable-popsicle-7c6e2fa76644@spud>
References: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
 <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>
 <20240715-trickery-spongy-c9d8e246b4cc@spud>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I/966nsfPxtlNaRp"
Content-Disposition: inline
In-Reply-To: <20240715-trickery-spongy-c9d8e246b4cc@spud>


--I/966nsfPxtlNaRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 04:26:12PM +0100, Conor Dooley wrote:
> On Mon, Jul 15, 2024 at 02:21:16PM +0200, Marc Gonzalez wrote:
> > Current driver already supports the msm8998 HDMI TX.
> > We just need to add the compatible string.
>=20
> Why is this required when the driver change suggests that this device is
> compatible with the existing 8974?

(I know I reviewed the binding already, just noticing this which
suggests a fallback would be appropriate, despite the differing clocks
etc)

>=20
> >=20
> > Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > ---
> >  drivers/gpu/drm/msm/hdmi/hdmi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi=
/hdmi.c
> > index 24abcb7254cc4..0bfee41c2e71a 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -549,6 +549,7 @@ static void msm_hdmi_dev_remove(struct platform_dev=
ice *pdev)
> >  }
> > =20
> >  static const struct of_device_id msm_hdmi_dt_match[] =3D {
> > +	{ .compatible =3D "qcom,hdmi-tx-8998", .data =3D &hdmi_tx_8974_config=
 },
> >  	{ .compatible =3D "qcom,hdmi-tx-8996", .data =3D &hdmi_tx_8974_config=
 },
> >  	{ .compatible =3D "qcom,hdmi-tx-8994", .data =3D &hdmi_tx_8974_config=
 },
> >  	{ .compatible =3D "qcom,hdmi-tx-8084", .data =3D &hdmi_tx_8974_config=
 },
> >=20
> > --=20
> > 2.34.1
> >=20



--I/966nsfPxtlNaRp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVAEAAKCRB4tDGHoIJi
0sU8AP4jM6fDhuBRN2MOUSxGHypHq+sAMObmuhoxsoBDNdo4awD/V9VWHT01TVJw
2JaoCyJhPin+XY9G0rHrT0tjTjiN4Ac=
=4QyH
-----END PGP SIGNATURE-----

--I/966nsfPxtlNaRp--


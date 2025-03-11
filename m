Return-Path: <linux-arm-msm+bounces-50909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA95A5BA77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E15653AFA7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F9822257B;
	Tue, 11 Mar 2025 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/h7PXgM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920242222C9;
	Tue, 11 Mar 2025 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741680433; cv=none; b=ofGbGI1njfo2s20cB4qXUm90SkrTMu0xyLY28PHmiZQCOhGHkPQkn9x+XUS6djnuykDX5toV91vc3z7Vqj+rd6HWc3fFw5/fClgIh9zyqTrn+6qRPkqMFwFu+Hgv9HA5yE4xLfjDU8qgijPQTDDXivWom0xRiKvuqlB1v5w5Vp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741680433; c=relaxed/simple;
	bh=ZtI3BPfxkUxUFIHbmyl6XFRwlrtyk7qksexHnsdaz0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXSzs7dsbDG/gtrR3QjvgXh+ccIg8ZEaLxjJX2X3HHPW9pSM48hceygaJ/f5TJzojOBAo5uIb8HpQrbYcSkAtHhMnt3mlcIKjHHmrGMEu5rRE6mWfa4auGqQ80llARVU8hvXLYAOwLO8BUaaqvBz6baX5omGW6C9VoykcTgBkiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/h7PXgM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951E6C4CEE9;
	Tue, 11 Mar 2025 08:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741680432;
	bh=ZtI3BPfxkUxUFIHbmyl6XFRwlrtyk7qksexHnsdaz0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/h7PXgMOSAGbndHGkKUKiEIJoiOTC00zUrB+InlOsaKJ9us1tQK8WaTVTYTX6/31
	 rvpED6HJyNuGG1rl9XU0wQy0IalgnzmWgqSRL3jDkJnA7nRTUAah3ImRMrh8aVUYuI
	 ZHDm5qFuFV85SFttR4Sxg82jSO18jmLS2XGUpP6lDWMfcsvpaN23VWwQ4rltpydqBZ
	 R3WBSwkOGmMBQvBUx5PjSIbTIPo7UZogIzN9tmEHX2Tl0FDnHvZFNugr3Oinv/IHXJ
	 r7zY67ZQrzN4yQZ6YvgEZg+GZ6EXm3JjtnoSGPg1my692rl9GFkVE/VWJBnPNIRCyP
	 6clygOGhD9QZw==
Date: Tue, 11 Mar 2025 09:07:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
Message-ID: <20250311-intrepid-obedient-lizard-64ad2c@houat>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
 <20250310-invisible-married-firefly-945c84@houat>
 <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dyye5w7y4dznz4ng"
Content-Disposition: inline
In-Reply-To: <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>


--dyye5w7y4dznz4ng
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
MIME-Version: 1.0

On Mon, Mar 10, 2025 at 10:18:04PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 10, 2025 at 03:51:53PM +0100, Maxime Ripard wrote:
> > On Sun, Mar 09, 2025 at 10:13:58AM +0200, Dmitry Baryshkov wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >=20
> > > Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
> > > values in the VC4 driver.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
> > >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> > >  2 files changed, 10 insertions(+), 7 deletions(-)
> > >=20
>=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4=
_hdmi.h
> > > index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0=
a2016555aefa81d7934 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > @@ -211,6 +211,13 @@ struct vc4_hdmi {
> > >  	 * KMS hooks. Protected by @mutex.
> > >  	 */
> > >  	enum hdmi_colorspace output_format;
> > > +
> > > +	/**
> > > +	 * @tmds_char_rate: Copy of
> > > +	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
> > > +	 * KMS hooks. Protected by @mutex.
> > > +	 */
> > > +	unsigned long long tmds_char_rate;
> > >  };
> >=20
> > This should be in drm_connector_hdmi if it's useful
>=20
> That would mean bringing the state to a non-state structure on the
> framework level. Is it fine from your POV?

Sorry, I'm changing my mind a little bit, but it's pretty much the same
case than for accessing the infoframes from debugfs: we want to get some
information stored in the state from outside of KMS.

What we did for the infoframes is that we're actually just taking the
connection_mutex from the DRM device and access the drm_connector->state
pointer.

I guess it would also work for ALSA?

Maxime

--dyye5w7y4dznz4ng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ8/vLQAKCRDj7w1vZxhR
xUTYAQDyuqn5t5cMpn/5BQvLfTTmRbB8sQbVEyGnQO76VRXLEgD8DIkV+06Aq3Wk
upcHhxdxp69/BSRmI5L12OmC4dqEywU=
=V2Cq
-----END PGP SIGNATURE-----

--dyye5w7y4dznz4ng--


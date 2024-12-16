Return-Path: <linux-arm-msm+bounces-42353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B619F337B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 15:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 950921638A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 14:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8E41DDEA;
	Mon, 16 Dec 2024 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/EnnraE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA16717FE;
	Mon, 16 Dec 2024 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734360447; cv=none; b=roSG0Qojv1PovUNCJeUX4O6s7bhYg0kW8TGMdef4eFQoqJ87uuFPPwmRQjXHZEEuusbO99DWn2/6RIbP5E7lYWq3azA4gLl01OgW9cxjL+tJKtYClBymv0rohHUR+Ytj0UtXIeWlfJca6p4tT5CnKLOaZJIM0aMfxxGSWIeSqro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734360447; c=relaxed/simple;
	bh=JQufBhYNhvxemBcGpIoxhHbHqphKAzJDmPsAsEkOhew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cO5wm8EFKXE3BwOkPNDjUKgzwUzJjh8Nfi27w9tWj6GtQNWpRtI+pN7NBmYXkmhG+/LerwXY3yu/No6Qh/Sb/6Nlfjs2fJ4a2CnDi9WQO+AKWNPq+YlVP9th1rDvxYgX66oA9J/q2QhX5M9kTPCabx0Lic/YZPUqw1ojnV3HoDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/EnnraE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BB8C4CED0;
	Mon, 16 Dec 2024 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734360446;
	bh=JQufBhYNhvxemBcGpIoxhHbHqphKAzJDmPsAsEkOhew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/EnnraE9mjVdIfzyMutxmv6JeMj6ZZa2SM1/70AWS9R01elsduJ/hUY0EoG+oofQ
	 /srgzi19y3pk0rUrLhWAbg/oeX9zUC/p1RRS1FYkR0g1CNJn1Nplcf6DUh6U6W+Z+X
	 8zVp3nNfjHYqb6TjOKc4EXf0sZO7Q5baDuZYyu4nCZLKlx4XCxDi/Yuq8J+USAXTX1
	 cxK80wiaw09FupuVy4ihLq64CoNO/88J/T1UBio85uOkJhBsThegelr2RK+VAy0Qxf
	 cm/pRpM8wGueJiBuDnxN9OQPq11x7bVl/jDW/Rmd1DS8zH+XUJqVj9XztwkT+5ZRXX
	 uDt9oNACU/uCA==
Date: Mon, 16 Dec 2024 15:47:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 02/22] drm: Add valid clones check
Message-ID: <20241216-elated-vagabond-numbat-14fe8f@houat>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>
 <20240925-hasty-bald-caribou-eedbf5@houat>
 <80d08449-71de-4a7f-8b2a-8af565d8d701@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bbi22kupiprxbtcg"
Content-Disposition: inline
In-Reply-To: <80d08449-71de-4a7f-8b2a-8af565d8d701@quicinc.com>


--bbi22kupiprxbtcg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 02/22] drm: Add valid clones check
MIME-Version: 1.0

On Fri, Dec 06, 2024 at 04:48:43PM -0800, Jessica Zhang wrote:
> On 9/25/2024 12:23 AM, Maxime Ripard wrote:
> > On Tue, Sep 24, 2024 at 03:59:18PM GMT, Jessica Zhang wrote:
> > > Check that all encoders attached to a given CRTC are valid
> > > possible_clones of each other.
> > >=20
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/drm_atomic_helper.c | 23 +++++++++++++++++++++++
> > >   1 file changed, 23 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/dr=
m_atomic_helper.c
> > > index 43cdf39019a4..cc4001804fdc 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -574,6 +574,25 @@ mode_valid(struct drm_atomic_state *state)
> > >   	return 0;
> > >   }
> > > +static int drm_atomic_check_valid_clones(struct drm_atomic_state *st=
ate,
> > > +					 struct drm_crtc *crtc)
> > > +{
> > > +	struct drm_encoder *drm_enc;
> > > +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state=
(state,
> > > +									  crtc);
> > > +
> > > +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_m=
ask) {
> > > +		if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=3D
> > > +		    crtc_state->encoder_mask) {
> > > +			DRM_DEBUG("crtc%d failed valid clone check for mask 0x%x\n",
> > > +				  crtc->base.id, crtc_state->encoder_mask);
> > > +			return -EINVAL;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   /**
> > >    * drm_atomic_helper_check_modeset - validate state object for mode=
set changes
> > >    * @dev: DRM device
> > > @@ -745,6 +764,10 @@ drm_atomic_helper_check_modeset(struct drm_devic=
e *dev,
> > >   		ret =3D drm_atomic_add_affected_planes(state, crtc);
> > >   		if (ret !=3D 0)
> > >   			return ret;
> > > +
> > > +		ret =3D drm_atomic_check_valid_clones(state, crtc);
> > > +		if (ret !=3D 0)
> > > +			return ret;
> > >   	}
> >=20
> > Pretty much the same comment, we should have kunit tests for this.
>=20
> Hey Maxime,
>=20
> I'm working on the kunit test for this and had a question on the design f=
or
> the unit test:
>=20
> Since this is a static helper that returns a pretty common error code, how
> would you recommend going about making sure that
> `drm_atomic_check_valid_clones()` specifically is returning the error (and
> not a different part of check_modeset) when testing the check_valid_clone=
s()
> failure path?

There's two ways to go about it. Either you can unit test it, prepare a
series of custom states and use
EXPORT_SYMBOL_FOR_TESTS_ONLY/EXPORT_SYMBOL_IF_KUNIT, or you can go the
integration test way and just test that drm_atomic_check is rejected for
unsafe combinations.

I guess I'd prefer the former, but the latter also makes sense and
eventually, it checks what we want: to make sure that we reject such a
state. What part of the code does or with what error code is less
important imo.

Maxime

--bbi22kupiprxbtcg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2A9dAAKCRAnX84Zoj2+
dvOyAYCJ4MTDUUUPjeWVnpgIpqjsSEwawghU1myFJzpEbTpc94o9ACzrWCGWDmrQ
w7jb6WsBfRa5TaXfLn7f5pbM7JonoSiDpJxURO/cLrxjGLw/MLU1eum1wk0zjKGS
hcULQUGaAw==
=wlD1
-----END PGP SIGNATURE-----

--bbi22kupiprxbtcg--


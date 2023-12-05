Return-Path: <linux-arm-msm+bounces-3444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 994A380535B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A4F7281632
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918C358AA8;
	Tue,  5 Dec 2023 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+0kkw9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7313659E2A
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 11:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93D1C433CC;
	Tue,  5 Dec 2023 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701776920;
	bh=rBWO7TR4O7ERppWjDYZhhaetJ6jH0W7EbO9klpyzT0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+0kkw9/ZVQ9D5AGBRVPYgUtv4X4NSVS3UZwRbqTsFf1qhnBEavbxcro3V0sD+wcZ
	 dVm31E7xUpEuk8cRxrpyA7EWYA5dBGoQoStrUy8rcEr96ydYHyS0KAZuwMKMyjnu3W
	 YM7N6EmbAGpbYPaD5Hbuh94/uo5RdTrNUMfOosMm0PWHJ69VuufG/jFFYLU0rg2meI
	 0tqRvJe0Q9w6KcMLdCYDh3BY8FYfiqzeh3RxpYPS9ME5Tlg2JtXz4VU4MDN447nHkg
	 xAqUgxwTsyKpukWgB31AsXcpfza8+H7lXB4JxDoCk/y39WXJoZsroQao+fJK6ZLQIK
	 HeWWg5A2qqTLQ==
Date: Tue, 5 Dec 2023 12:48:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Message-ID: <hfvttbhsztcbagsimvhoeqadwtcrxhcs5gt7ssjipszndqzxeg@co2jxo3smli6>
References: <20231201220843.2023117-1-dmitry.baryshkov@linaro.org>
 <uqrsl3gehpjybzb6cish7vpub3xznouomn4246b7j4i3qiiumv@enskrm5kpwa5>
 <ff89354d-c9d1-486a-982b-0bb976f6b699@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="43ej7zo32lbofe2g"
Content-Disposition: inline
In-Reply-To: <ff89354d-c9d1-486a-982b-0bb976f6b699@linaro.org>


--43ej7zo32lbofe2g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 03:37:15AM +0200, Dmitry Baryshkov wrote:
> On 04/12/2023 10:38, Maxime Ripard wrote:
> > On Sat, Dec 02, 2023 at 12:07:49AM +0200, Dmitry Baryshkov wrote:
> > > The drm_atomic_helper_check_wb_encoder_state() function doesn't use
> > > encoder for anything other than getting the drm_device instance. The
> > > function's description talks about checking the writeback connector
> > > state, not the encoder state. Moreover, there is no such thing as an
> > > encoder state, encoders generally do not have a state on their own.
> > >=20
> > > Drop the first argument and rename the function to
> > > drm_atomic_helper_check_wb_connector_state().
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >=20
> > > Resending, no reaction for two months
> > >=20
> > > ---
> > >   drivers/gpu/drm/drm_atomic_helper.c   | 10 ++++------
> > >   drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
> > >   include/drm/drm_atomic_helper.h       |  3 +--
> > >   3 files changed, 6 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/dr=
m_atomic_helper.c
> > > index 2444fc33dd7c..d69591381f00 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -795,8 +795,7 @@ drm_atomic_helper_check_modeset(struct drm_device=
 *dev,
> > >   EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> > >   /**
> > > - * drm_atomic_helper_check_wb_encoder_state() - Check writeback enco=
der state
> > > - * @encoder: encoder state to check
> > > + * drm_atomic_helper_check_wb_connector_state() - Check writeback co=
nnector state
> > >    * @conn_state: connector state to check
> > >    *
> > >    * Checks if the writeback connector state is valid, and returns an=
 error if it
> > > @@ -806,8 +805,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> > >    * Zero for success or -errno
> > >    */
> > >   int
> > > -drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> > > -					 struct drm_connector_state *conn_state)
> > > +drm_atomic_helper_check_wb_connector_state(struct drm_connector_stat=
e *conn_state)
> >=20
> > AFAIK, all the helpers take the object as first argument, so I'm fine
> > with the name change but it should take a drm_connector too. And ideally
> > a drm_atomic_state pointer instead of drm_connector_state too.
>=20
> I think we then might take even further step and pass
> drm_writeback_connector to this function. I'll send this as a part of v2.

=2E.. Which is still not the usual function prototype for atomic_check
helpers.

Maxime

--43ej7zo32lbofe2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW8OFQAKCRDj7w1vZxhR
xUmJAQCMZDPhgXcPLxiMxn3RlywPvVPndRCcvGUXtIB2RDPL4AEAlkAZxFUFcG6n
fXkca/UsUOJv1aMOlYPyGYyi2U63cQQ=
=mIiu
-----END PGP SIGNATURE-----

--43ej7zo32lbofe2g--


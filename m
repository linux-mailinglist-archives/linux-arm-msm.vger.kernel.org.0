Return-Path: <linux-arm-msm+bounces-3192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E9802DBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02C45280C17
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 09:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A482FBED;
	Mon,  4 Dec 2023 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWgSsA9r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBDCEAD8
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 09:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DF7C433C8;
	Mon,  4 Dec 2023 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701680441;
	bh=NHppATTzdQBKuC3hOQxnsiBMV4fyRqrL8p5HNiVQcps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWgSsA9rji0i+syjJ1FMaR5URFRP6mcka0q1wHVgE7RPFcqSxof/st2w8qfn0a6qG
	 3mvlHegu1S2+fVaP5C2pXSgYn8pLTO8AOcE3SRZmxwTX5DkRjPyhyVFINZ0SMd/V14
	 xlP8VOeOQ6jlAWE+9Zx0NcTgNqTYq78Kpug5b5ko0pAZHZtH/UbP7ZaHqadee4LBIZ
	 Qb+sZzzsfS8KYypN8WQMRUaKhyibq3xf+Q3gPgbn0gNjnTvpaPzDXj/8nXcENnVoPe
	 /b+A72Ozx49IoCiOighJzQy3rbKlgVPzuwoCrrpGPZsqQi6jNGbH6wmV9dMMwJylMN
	 rQff2873D5alw==
Date: Mon, 4 Dec 2023 10:00:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Simon Ser <contact@emersion.fr>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, quic_abhinavk@quicinc.com, ppaalanen@gmail.com, 
	laurent.pinchart@ideasonboard.com, sebastian.wick@redhat.com, ville.syrjala@linux.intel.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Harry Wentland <harry.wentland@amd.com>, 
	Sebastian Wick <sebastian@sebastianwick.net>
Subject: Re: (subset) [PATCH RFC v7 00/10] Support for Solid Fill Planes
Message-ID: <hinlseiuf2l4y2tbaoasx7slaoewnoil2fitavgarrekxhhzte@zood7lj6sbn5>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
 <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
 <CAA8EJpom-guy0p_u2kLhXgLZnJaVXCXaHAUGhv2EH=xyrHtL6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d7zlmb36ttt6m7sm"
Content-Disposition: inline
In-Reply-To: <CAA8EJpom-guy0p_u2kLhXgLZnJaVXCXaHAUGhv2EH=xyrHtL6A@mail.gmail.com>


--d7zlmb36ttt6m7sm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 03, 2023 at 08:10:31PM +0200, Dmitry Baryshkov wrote:
> On Sun, 3 Dec 2023 at 14:15, Simon Ser <contact@emersion.fr> wrote:
> >
> > On Saturday, December 2nd, 2023 at 22:41, Dmitry Baryshkov <dmitry.bary=
shkov@linaro.org> wrote:
> >
> > > On Fri, 27 Oct 2023 15:32:50 -0700, Jessica Zhang wrote:
> > >
> > > > Some drivers support hardware that have optimizations for solid fill
> > > > planes. This series aims to expose these capabilities to userspace =
as
> > > > some compositors have a solid fill flag (ex. SOLID_COLOR in the And=
roid
> > > > hardware composer HAL) that can be set by apps like the Android Gea=
rs
> > > > test app.
> > > >
> > > > In order to expose this capability to userspace, this series will:
> > > >
> > > > [...]
> > >
> > >
> > > Applied to drm-misc-next, thanks!
> >
> > Where are the IGT and userspace for this uAPI addition?
>=20
> Indeed. I checked that there are uABI acks/reviews, but I didn't check
> these requirements. Frankly speaking, I thought that they were handled
> already, before giving the ack. How should we proceed? Should I land a
> revert?

Yes

Maxime

--d7zlmb36ttt6m7sm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW2VNgAKCRDj7w1vZxhR
xRD9AP9L9eZW/RH/TvF7TEDGDHV3nZjFxt4l2zx4F6EAb9QfXQD/SjP0MhyZzZ+W
nqFhDLoXMhCDz5x+hbAy5SgVdjLrjwQ=
=wTnT
-----END PGP SIGNATURE-----

--d7zlmb36ttt6m7sm--


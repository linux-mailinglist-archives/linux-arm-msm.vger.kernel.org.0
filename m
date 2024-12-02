Return-Path: <linux-arm-msm+bounces-39852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D419E0129
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 13:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B69E0280E62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 12:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6D31FDE0B;
	Mon,  2 Dec 2024 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNJkDSvb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF531D95A9;
	Mon,  2 Dec 2024 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733140826; cv=none; b=kps4c3wUqYQ7EU1GV8KBv0D7nXmLaVPa7RH3H4JIJ7qY5cWNiJl4V5ucGBoAztTMp3ymi5chcb/tDYPfA7xLmNLFZ+UH7mKkJ4txvpeXIdlLi+f1SLWFYOjuxNPFHz4tmXQg/j2cLYsrbknc/wcXmZ+xCg69ApvmLt7isjr8VjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733140826; c=relaxed/simple;
	bh=uq6P50nPVqYzYznK6CDOgelQtYASy802lUz2VNa3X4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3M1kYLotY/66eZlesArPbYxVa+3zdMPLf4QmOHsC7BcIBRi1CoGo8aGx1qdvjv+fOZfjbfa3qFOisHOHXxln+6dFodx7mr4wn+5xsrCQ4nrT18VRUeQq+SnsZQ93mhaeL9ea6qWND37hcxLfhbmedGnPPq3InpxklVUjv/nGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNJkDSvb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89875C4CED2;
	Mon,  2 Dec 2024 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733140826;
	bh=uq6P50nPVqYzYznK6CDOgelQtYASy802lUz2VNa3X4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNJkDSvbo8lkY9GLqT/hIrlkLQ08AZHdWUxs5r6bl3m2EBQ5pBgHM/mjPWR+I6JMf
	 WHkFLn1IDnuQbsHQe0nadbr8vKz3xRW21XdUSdb4xT+i2Zor5fgGmzAoSEMfYcJPEX
	 fwGe0wsbkhNxUqOwQeGiP8NfPPrneSL6Q9Sw24mlIlLforIDucg4Oz6evGeFxOliV0
	 MWA8nqkra3Zn8VhWEpF06jAI0MaT8iKhzitPgCHIdv1qO0FwMpYUOE7uBvzD2uekk0
	 +LA/RyRMTlyePXs6iJYth+3uw/OLHT4f3rvhAG9K2jgL+C9JqGuyzaknOpMmRTdq0t
	 0COIRkOoz/T+w==
Date: Mon, 2 Dec 2024 13:00:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	David Airlie <airlied@gmail.com>, Harry Wentland <harry.wentland@amd.com>, 
	Inki Dae <inki.dae@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Leo Li <sunpeng.li@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Phong LE <ple@baylibre.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Xinhui Pan <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Message-ID: <20241202-hummingbird-of-hypothetical-aptitude-646def@houat>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <77545786331df8bfaf5fdcb309437358@kernel.org>
 <ohbtatnn33jj6y3q4milf4txi4n7yirnny2eefdjddlkn2dnhp@eqjedetct4q3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rf5ewnb7ayc4e2uu"
Content-Disposition: inline
In-Reply-To: <ohbtatnn33jj6y3q4milf4txi4n7yirnny2eefdjddlkn2dnhp@eqjedetct4q3>


--rf5ewnb7ayc4e2uu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 01:03:07PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 10:19:41AM +0000, Maxime Ripard wrote:
> > On Sun, 1 Dec 2024 01:55:17 +0200, Dmitry Baryshkov wrote:
> > > The connector->eld is accessed by the .get_eld() callback. This access
> > > can collide with the drm_edid_to_eld() updating the data at the same
> > > time. Add drm_connector.eld_mutex to protect the data from concurrenct
> > > access.
> > >=20
> > >=20
> > > [ ... ]
> >=20
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>=20
> Thanks!
>=20
> I'm going to post v2 to fix Jani's comment, but what should be the merge
> strategy? Merge patches 1-3, 5, 9-10 through drm-misc and the rest (AMD,
> i915, MSM, radeon) through the driver trees?

The easiest is probably to merge everything through drm-misc if everyone ag=
rees.

Maxime

--rf5ewnb7ayc4e2uu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02hVgAKCRAnX84Zoj2+
did2AYCKqjIX2aHftKtybJaUPI3aEKi2s1lRBLYyjb1Uwicsybws1tIK08t+OLLX
OfIShgYBfiJJHZ+4Gj/u8uuAs91T4EvzTss9Zo2aF+YDFdrV47edIsjbVE2McJQO
YLEiS8Wy0Q==
=Idbn
-----END PGP SIGNATURE-----

--rf5ewnb7ayc4e2uu--


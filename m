Return-Path: <linux-arm-msm+bounces-42357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D95E9F3469
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 16:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54A63188076A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 15:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B41D13B7BC;
	Mon, 16 Dec 2024 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8Qilrik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1FD137775;
	Mon, 16 Dec 2024 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734362669; cv=none; b=AWfo9/ojJQOnp6EooxwZsEJ91acZvPFqk9s29KSSRvTpGeETkRTYW1Bst8iu5on9VnTa/D+QMiMLUlUgKwx0g8VTQwqf1PWQ0j4Xflyqx8dJbZ0gQ6xhvIkXhT8gq/ZugWgyMlVZIjdWifJwB6liknYifCI0/uZbX1FoF5DC0/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734362669; c=relaxed/simple;
	bh=agePObKTKIqacVCU4rIa9k5erBpScbul3raudsvvu8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu9k9HaGq6Mg/YLjliq1VdKZmSGzu0/ZXXc1QAml56spnjV3e5bBsdfLSFCC4ALTzFqtYnp75psZBXvaBgvCV3X3VQg96Psf24iVZ8ZRQVui82+G3ryv5HdX0owrC9fJOfUVH49AXQVuTA4d51QZraox8Mt0ZQdV3M/7FXSXRjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8Qilrik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4224EC4CED0;
	Mon, 16 Dec 2024 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734362668;
	bh=agePObKTKIqacVCU4rIa9k5erBpScbul3raudsvvu8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b8QilrikF4NVH5daF8JcBRrPWW47IJcOfuBDqzAMfQm21R3U9vJi2tRp0R2CDW5KU
	 5PerJeZDcm3voWMl8+EWYdNddW85QuUfUafcbTx+kTzNF4sUCjQ04UEDh3ph0PXAK1
	 Z1NHTk8NagW8X10YnpCm7uKgRzHBWxsZCPpk+vfi7gkeip02Qs/Q8sl/IQN5ggPRnQ
	 tiHqOSurdrARlgyv2rqjrH4jQgTA3uj8xMbUR/Tvgx4pm5Yzx2pKbbGLHs+Ow+FAJU
	 9K5AFnij63nj1RL4yi2Lsp6+ZMP3PJrfPu/BXSpKNpcMrIG6YSDc/i3Kquo7nCV5DK
	 MNuZMdT+4DpXQ==
Date: Mon, 16 Dec 2024 16:24:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Message-ID: <20241216-observant-spiritual-wolf-564ee3@houat>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <xchjpeykkqwlpniaspbzitaozuoltoq7aturtu7jq6z4lcxh77@y7t5ge2sa4er>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="yj5x4y56pv6ag7wh"
Content-Disposition: inline
In-Reply-To: <xchjpeykkqwlpniaspbzitaozuoltoq7aturtu7jq6z4lcxh77@y7t5ge2sa4er>


--yj5x4y56pv6ag7wh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/10] drm/connector: add eld_mutex to protect
 connector->eld
MIME-Version: 1.0

On Mon, Dec 16, 2024 at 01:24:29PM +0200, Dmitry Baryshkov wrote:
> On Fri, Dec 06, 2024 at 11:43:03AM +0200, Dmitry Baryshkov wrote:
> > The connector->eld is accessed by the .get_eld() callback. This access
> > can collide with the drm_edid_to_eld() updating the data at the same
> > time. Add drm_connector.eld_mutex to protect the data from concurrenct
> > access.
> >=20
> > The individual drivers were just compile tested. I propose to merge the
> > drm_connector and bridge drivers through drm-misc, allowing other
> > maintainers either to ack merging through drm-misc or merging the
> > drm-misc into their tree and then picking up correcponding patch.
> >=20
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Also take the mutex in clear_eld() (Jani)
> > - Rebased on top of linux-next + drm-misc-next to solve build error
> > - Link to v1: https://lore.kernel.org/r/20241201-drm-connector-eld-mute=
x-v1-0-ba56a6545c03@linaro.org
> >=20
> > ---
> > Dmitry Baryshkov (10):
> >       drm/connector: add mutex to protect ELD from concurrent access
> >       drm/bridge: anx7625: use eld_mutex to protect access to connector=
->eld
> >       drm/bridge: ite-it66121: use eld_mutex to protect access to conne=
ctor->eld
> >       drm/amd/display: use eld_mutex to protect access to connector->eld
> >       drm/exynos: hdmi: use eld_mutex to protect access to connector->e=
ld
> >       drm/i915/audio: use eld_mutex to protect access to connector->eld
> >       drm/msm/dp: use eld_mutex to protect access to connector->eld
> >       drm/radeon: use eld_mutex to protect access to connector->eld
> >       drm/sti: hdmi: use eld_mutex to protect access to connector->eld
> >       drm/vc4: hdmi: use eld_mutex to protect access to connector->eld
>=20
> Granted the lack of reviews from AMD maintainers and granted that the
> rest of the series was reviewed and acked, is it suitable to leave those
> two patches out and merge the rest through drm-misc-next?

Sounds reasonable to me

Maxime

--yj5x4y56pv6ag7wh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2BGJAAKCRAnX84Zoj2+
dqCXAX9SjWwvOgFzh4mNa6iVP75JAzbqRH60uqV3o0fzLR0EpZr5ExXJlgdvDTJ1
pqDitiQBf0gV4LWjS6KxH0jldZncnMFDYupvJiMgktWoAluECsTRw5fKWW43ccUY
56/fJ5jxEg==
=4rTF
-----END PGP SIGNATURE-----

--yj5x4y56pv6ag7wh--


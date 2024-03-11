Return-Path: <linux-arm-msm+bounces-13854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D85ED878600
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 18:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A667D1C20D36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 17:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747D852F70;
	Mon, 11 Mar 2024 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laVLa5kB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9C652F61
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710176771; cv=none; b=Uyp1181/QKTsJTkYHxcpjMJjkt/Gs60Dd2VI1l0FcXmCOtMsAEa/U/ErsZ2oRnoRNDNJsfw9S+Ol1jf4aXVT2hx+Bxj2iNUArqaiNOWYVEoLYaLbWqwswtNgj84Nre2A1wp11Jn2b6yzg3ssgPawhWrblaPNdRr4LIAq0+5Ivio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710176771; c=relaxed/simple;
	bh=oyk91WGVV9QE/SZQalYzdA+Yot7JLCJGUd5KdoDcHCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCie5Zaq/WV6PxDryd4DuK5AlcaDq4a2PkcK3Wbkf4v7AGQi/VXKqEy/XYTjRZ2utHZKWlezospy9XbB6BIXs81NtR4ReOWK0uyG8+AZyTdnbdxr6xj5LXuiFQLZZovQuXWThfLLEut8LaC3ZEAINPQddYeNSfuvVbrPYm3DP1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laVLa5kB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECE9C433C7;
	Mon, 11 Mar 2024 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710176770;
	bh=oyk91WGVV9QE/SZQalYzdA+Yot7JLCJGUd5KdoDcHCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=laVLa5kB3jJDj+q6c3atc0JDrvP2q3XxigOhpI1ypYeVwv7PooH3bZ6ILanEP539Q
	 Ycu02MaUMU2rHiNs7RTMQRSyI+WoJk138Cm6147YxJIwDgZlMTOzrB0exeS3ppbhOr
	 jWeIJG1SWEZ5ZdzqUyEwHGZyd80RTsSywb0zSHgbpbOODKB7OA8IGcoEPNb3jC5SNG
	 KUj2BzrI3fKAYHk0J8LAl5MIDHB0Gp1jGMGLkw+fTdApRcVVV7Ukz5QTPb7fZe4ZA0
	 NZihxG6G8w5IsoVHwI78os3mSfYvZuRRs8BeqJkP/3Jqnln1wQS4+lSTggHA/PRyhT
	 e+qeL+7SsJrUg==
Date: Mon, 11 Mar 2024 18:06:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC v2 5/5] drm/msm/hdmi: make use of the
 drm_connector_hdmi framework
Message-ID: <20240311-offbeat-pogona-of-masquerade-3f40b6@houat>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
 <20240311-divergent-friendly-python-2c7d5d@houat>
 <CAA8EJpo-+qypK4gLrQGcCYi-AVtVzuCjh4HgJ6kRNsMTtNKKMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="prv67c2f5gfkdk4e"
Content-Disposition: inline
In-Reply-To: <CAA8EJpo-+qypK4gLrQGcCYi-AVtVzuCjh4HgJ6kRNsMTtNKKMA@mail.gmail.com>


--prv67c2f5gfkdk4e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 05:55:36PM +0200, Dmitry Baryshkov wrote:
> On Mon, 11 Mar 2024 at 17:46, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Sat, Mar 09, 2024 at 12:31:32PM +0200, Dmitry Baryshkov wrote:
> > > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > > atomic_check hook and of the provided Infoframe infrastructure.
> > >
> > > Note: for now only AVI Infoframes are enabled. Audio Infoframes are
> > > currenly handled separately. This will be fixed for the final version.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > I had a look at the driver, and it looks like mode_set and mode_valid
> > could use the connector_state tmds_char_rate instead of pixclock and
> > drm_connector_hdmi_compute_mode_clock respectively instead of
> > calculating it by themselves.
>=20
> Ack, I'll take a look.b
>=20
> >
> > We can probably remove hdmi->pixclock entirely if we manage to pass the
> > connector state to msm_hdmi_power_on.
>=20
> I'd like to defer this for a moment, I have a pending series moving
> MSM HDMI PHY drivers to generic PHY subsystem. However that patchset
> reworks the way the PHY is setup, so it doesn't make sense to rework
> msm_hdmi_power_on().
>=20
> >
> > And that's unrelated to this series, but we can also remove
> > hdmi->hdmi_mode for drm_display_info.is_hdmi.
>=20
> Yes, that's the plan, once I rework the audio infoframe handling.

Sure, if it makes more sense to defer it for now, then let's postpone it
:)

Maxime

--prv67c2f5gfkdk4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZe85/wAKCRDj7w1vZxhR
xWL8AP9xXrx1NvMIMlVpQysXWgMWn4G6TuRpDS9uDdlHvJR9YwEAjndzo3SkpyHT
mLV5V0nZltLrrNXN+Y6LTn+FEiywHgY=
=6fhQ
-----END PGP SIGNATURE-----

--prv67c2f5gfkdk4e--


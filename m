Return-Path: <linux-arm-msm+bounces-13839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EEB87841E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 16:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3BEA1C21508
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2337744C60;
	Mon, 11 Mar 2024 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWh83vEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A5544371
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171976; cv=none; b=VcAd+QwcrfA14O4hSkSPJfKTE85HpzU8qoeJFqLfPES7Rh2Mg5aaijiiJfurSpUV/y8oBxxybPfBjugy8Il3CmH5APoK5Ahg1UinUncW1TjGAdi9j+QTwD3S6SVmiB0PHU+t3t1MpxElfpqWIPfZV7iZkXNm6jycxBnQp3Wmklg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171976; c=relaxed/simple;
	bh=mhssB7lUZCuilumeGYEV+p2GuGFqIB/fiRUqdStbvd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MU2AGZF8BjBDlnTAnipA1/kS1s2DGlT2tXgfYW1WgP1+WY/BlNSOJFlSbwRZ8ZODJEtQWzZ4lJ1l37q+M8SB99LkR8DpFkmiThmqTgUW0vwbsmja29RUqBCOxAckL98joRA6Q98dz9QCVCeqM8vnslaevKindwxg18TOQ+wnhRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWh83vEh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E1AC433F1;
	Mon, 11 Mar 2024 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710171975;
	bh=mhssB7lUZCuilumeGYEV+p2GuGFqIB/fiRUqdStbvd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWh83vEhZO5pOUkik7cbnVy40m95xq6qYDx3yZgV3GJib0b1oqRMR528qg9aKSIe9
	 3koTaRoZkh+6zRPL7Sl5VfFMDpO40w+HKjG0n7FFm9ZCIvoJ7L9OTNblJyGWNSdiIT
	 xpsrkxOHOMTigH42lDmZ3M4ZPhN74Ts6a2hL/a0XelrIPTP3nMeu7QYepTnXiy4Q1s
	 CRPMWEP4Zehm90rwxHcsN2d1iXWjxnkuIQHjYKQXgxa+DuPkcmw3Tuft+0cq2tpBPp
	 Y1GLa5bGTfyrR8fUVagjCVDbNsOGthATeEojqcz0QbRyjSoOcYNFksBwGCRFr/kvZp
	 he3XDQeOT8Pzw==
Date: Mon, 11 Mar 2024 16:46:12 +0100
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
Message-ID: <20240311-divergent-friendly-python-2c7d5d@houat>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6uwovjrbotqevls7"
Content-Disposition: inline
In-Reply-To: <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>


--6uwovjrbotqevls7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 09, 2024 at 12:31:32PM +0200, Dmitry Baryshkov wrote:
> Setup the HDMI connector on the MSM HDMI outputs. Make use of
> atomic_check hook and of the provided Infoframe infrastructure.
>=20
> Note: for now only AVI Infoframes are enabled. Audio Infoframes are
> currenly handled separately. This will be fixed for the final version.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I had a look at the driver, and it looks like mode_set and mode_valid
could use the connector_state tmds_char_rate instead of pixclock and
drm_connector_hdmi_compute_mode_clock respectively instead of
calculating it by themselves.

We can probably remove hdmi->pixclock entirely if we manage to pass the
connector state to msm_hdmi_power_on.

And that's unrelated to this series, but we can also remove
hdmi->hdmi_mode for drm_display_info.is_hdmi.

Maxime

--6uwovjrbotqevls7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZe8nRAAKCRDj7w1vZxhR
xUbBAQCmwNtJw7PxMpMlX8Jf+1cEg3kX9FAzPXVZFO/8BbylUAD/apYGzmrcXY0X
SzTnma21Ua2e016qvVcB2nGCID6VjQU=
=lm3E
-----END PGP SIGNATURE-----

--6uwovjrbotqevls7--


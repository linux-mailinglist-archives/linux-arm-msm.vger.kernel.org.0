Return-Path: <linux-arm-msm+bounces-5730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E332181B2D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 10:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21C081C21B81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 09:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313E1224C7;
	Thu, 21 Dec 2023 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzlTHP+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAB2225D6;
	Thu, 21 Dec 2023 09:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14724C433C7;
	Thu, 21 Dec 2023 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703152094;
	bh=c2g5y6kiflVeNGhN8PpT0D5trQyz7k/JpEp8prWhHD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzlTHP+AeHmHs9xY452PnUZTHwFg60YYT0FJu680NOPj0v9145EzPbhwRRtmA1Esj
	 4ULy8sC4WkHmR9QGMMGTzXOluYJZMa2F+ndbnzGsF/OLd0hCRJOZgqe/XVTSGrniSK
	 pklfkmNpf9mXVFn/k3PNvymX39dITY+51a6wURsydk51TIeiJ7w90zDED7Yap0huVP
	 Nb7jFWRNpXWvKfLgyF1Oqr4EfpNwTVKPb7grehwdAHJcLjCaDUaYi1nw9CYKm9r1xw
	 jT8DJ7nl0AzN8oj6sglFzNTo+GidWcqcVKQ+tN4pwmrDbM42e4syVQSMZtaKm4g/rL
	 9/flXmtRsY6mQ==
Date: Thu, 21 Dec 2023 10:48:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-sound@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	Emma Anholt <emma@anholt.net>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] ASoC: hdmi-codec: drop drm/drm_edid.h include
Message-ID: <eexfqzmhm7z4gausmjqhqklidz7crfq3io4vwxsspfixkd4uqx@cayecc5z6uvg>
References: <20231214092856.4019251-1-jani.nikula@intel.com>
 <20231219121210.1076152-1-jani.nikula@intel.com>
 <8734vvuccx.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7o3xr7p4t4lcajc6"
Content-Disposition: inline
In-Reply-To: <8734vvuccx.fsf@intel.com>


--7o3xr7p4t4lcajc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 11:35:42AM +0200, Jani Nikula wrote:
> On Tue, 19 Dec 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > hdmi-codec.h does not appear to directly need drm/drm_edid.h for
> > anything. Remove it.
> >
> > There are some files that get drm/edid.h by proxy; include it where
> > needed.
> >
> > v2-v4: Fix build (kernel test robot <lkp@intel.com>)
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > ---
> >
> > I'm pretty sure I haven't compiled everything that might implicitly
> > depend on the include. However, the right thing to do is to include
> > drm_edid.h where needed, not from somewhat random intermediate
> > headers. I hope this uncovers anything I missed.
>=20
> The kernel test robot came back with clean results.
>=20
> Added a bunch more Cc's here. Ack to merge this via drm-misc-next,
> please?

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--7o3xr7p4t4lcajc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZYQJ2wAKCRDj7w1vZxhR
xSW0AQCJlH99BsxjepYQObIU2W6v087aYxO8BzYL4hwVes27CgEAvgEDL2E/HZHk
AfQBYylYm1Rf70+sI6J67z8P6Brc6QM=
=yy41
-----END PGP SIGNATURE-----

--7o3xr7p4t4lcajc6--


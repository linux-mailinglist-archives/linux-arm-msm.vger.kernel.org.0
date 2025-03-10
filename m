Return-Path: <linux-arm-msm+bounces-50861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D3AA59831
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 15:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1962516CF65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 14:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EDF22B59D;
	Mon, 10 Mar 2025 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7409yuq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F48A21E0BC;
	Mon, 10 Mar 2025 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741618316; cv=none; b=ACg82+HU1Z4sXKYVDKujdr80gdtAm6aD+D031tWhp3oai/xVlqW9HNcdVzhn4pSBIQ+QYUlClXurv9zWjrovJ9UgeUaq3Qfowrey26R66a1x8N0eLCnv3JBSUnoW+ODbInBJb1ehc/xcaNIgJzUXDdaWcYwk8Hj6AQA6txCqe60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741618316; c=relaxed/simple;
	bh=+cPLjXP4iMtW2gfETY5BkkAwJuMynf54n7/Iq22bkaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kk1ETzLamXVT8cagIof2/zoAfh7SLCVzYVPO2I1gwzYNBMhy9WeDm6X33OXOja8p0eNle2SuelOUgO9M0Q5TYVF3e9zXMk4AczbJh2q/C7E1t3iiZjsshriNWVYwNqBspSwunLv8RYFBOnQWcgjf/NPfJI/47legIz8XIUbvomM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7409yuq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB345C4CEE5;
	Mon, 10 Mar 2025 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741618316;
	bh=+cPLjXP4iMtW2gfETY5BkkAwJuMynf54n7/Iq22bkaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7409yuqWipbxdKZvkJga0dVijZa9ow0I0Os0thYD4d5XiCaB3xiMFxk3z2b5tw4f
	 4k5B7J2Ge1YICIkoIkp6kF855MjiBFqFF4Fg0kW1nK5IKkc+QQF7O6sA5RJDG6yceD
	 d0JygFpJlmjE+dUVtrGxznyBnZFeGaR0GjyMuWT1Wrv9PCOi2M/rEhwgtSdfSRdP6a
	 F5d5UDpbiT8MQJbJIMyaYmzT4S3Q5CwCXyI3BXw2CWPnIkX+D+AzEexzxB+lZxhjSg
	 kDrMDKMyoUvtoeb9VuX9nbZ1WeYHS68cafEMl+s2NdPz5kzxGAcmxptvt8jVgFGLdW
	 GVwsgM0sQqM9Q==
Date: Mon, 10 Mar 2025 15:51:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
Message-ID: <20250310-invisible-married-firefly-945c84@houat>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yetzpwkdskyj7s7k"
Content-Disposition: inline
In-Reply-To: <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>


--yetzpwkdskyj7s7k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
MIME-Version: 1.0

On Sun, Mar 09, 2025 at 10:13:58AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>=20
> Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
> values in the VC4 driver.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
>  2 files changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 37238a12baa58a06a5d6f40d1ab64abc7fac60d7..f24bcc2f3a2ac39aaea061b80=
9940978341472f4 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1637,6 +1637,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct=
 drm_encoder *encoder,
>  		      &crtc_state->adjusted_mode);
>  	vc4_hdmi->output_bpc =3D conn_state->hdmi.output_bpc;
>  	vc4_hdmi->output_format =3D conn_state->hdmi.output_format;
> +	vc4_hdmi->tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;
>  	mutex_unlock(&vc4_hdmi->mutex);
>  }
> =20
> @@ -1829,17 +1830,12 @@ static void vc4_hdmi_audio_set_mai_clock(struct v=
c4_hdmi *vc4_hdmi,
> =20
>  static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int s=
amplerate)
>  {
> -	const struct drm_display_mode *mode =3D &vc4_hdmi->saved_adjusted_mode;
> -	u32 n, cts;
> -	u64 tmp;
> +	unsigned int n, cts;
> =20
>  	lockdep_assert_held(&vc4_hdmi->mutex);
>  	lockdep_assert_held(&vc4_hdmi->hw_lock);
> =20
> -	n =3D 128 * samplerate / 1000;
> -	tmp =3D (u64)(mode->clock * 1000) * n;
> -	do_div(tmp, 128 * samplerate);
> -	cts =3D tmp;
> +	drm_hdmi_acr_get_n_cts(vc4_hdmi->tmds_char_rate, samplerate, &n, &cts);
> =20
>  	HDMI_WRITE(HDMI_CRP_CFG,
>  		   VC4_HDMI_CRP_CFG_EXTERNAL_CTS_EN |
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdm=
i.h
> index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0a201=
6555aefa81d7934 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -211,6 +211,13 @@ struct vc4_hdmi {
>  	 * KMS hooks. Protected by @mutex.
>  	 */
>  	enum hdmi_colorspace output_format;
> +
> +	/**
> +	 * @tmds_char_rate: Copy of
> +	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
> +	 * KMS hooks. Protected by @mutex.
> +	 */
> +	unsigned long long tmds_char_rate;
>  };

This should be in drm_connector_hdmi if it's useful

Maxime

--yetzpwkdskyj7s7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ878iQAKCRDj7w1vZxhR
xQseAQC+BQZnmiKndaggxmUm0sEkFhpfjicrrGoOt7H59orkFwD9EstW6eFlKDYW
8d1txYOJxyXd+JV9+7mb36x2tXEVOQg=
=xuB9
-----END PGP SIGNATURE-----

--yetzpwkdskyj7s7k--


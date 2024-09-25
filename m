Return-Path: <linux-arm-msm+bounces-32435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF13098541B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 09:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D35491C2097A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 07:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD83D15853B;
	Wed, 25 Sep 2024 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upcxZK6c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D94158534;
	Wed, 25 Sep 2024 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248990; cv=none; b=OrUQQo4jKiJNbuxmxQqFhWBS8YYRy5jQA7pb6cAKl+cbSWN0vQVATucHJCRzgduShMFCZagTtBCbJYENYG1QWYOhmSmmh4jNBZ07sIPK3jMGaJbXAVn2QqHmV19wvCqyau3YPyliml74kyLHykx4jXx8kcauB4kJuAevttPX9B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248990; c=relaxed/simple;
	bh=+MshezIUowXnhFogys8xJQLBrxENmFL5Y2dLYOhLzJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsarYP4EDQu9YIiPlzRRx1RufCTqAd6U+5gc1hPEqxFq7Elk0bPUetMlIiypdVNwqIJy/XwYrxOqTlFrs2fcwfRTPZWg3C3kkRSawbz+dgRWOCRn88C942yszvyo/HDElWcGu0r0CqRY+EHp9FwM3GvdMRhRc/MvBki44R9MOn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upcxZK6c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1327C4CEC3;
	Wed, 25 Sep 2024 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727248990;
	bh=+MshezIUowXnhFogys8xJQLBrxENmFL5Y2dLYOhLzJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upcxZK6cgfxo3wt/KjWFpciHZWnFtGjvzOWMqfmWALgvfAIeNqpETpb0kaVuFZeRe
	 8idI676mrJR1AZmdTrVp7uQV7B/xgIO8DF3UlyMGthwM0FdZg4Ty25sS2LRc63tX1v
	 rDo8tlIVQGkq5Zow2wjuVy8KTNOhT+cfOE1exG7pWUAkQq2ksUqNXOQROgn1n4wnMg
	 LuyTXy99OTOmMv/x5DGITs5ifUAl/bZum1baVzyjKwW6Cru9c7UO298Rq5a3BlSFQ8
	 8b83yM8JkAZGdiefoBzRcMHJgS2CvW6MSqL9mdHb5fRrxGp9RyXp+Ttoxh+rmSl4Cj
	 y94S3zIClEgeg==
Date: Wed, 25 Sep 2024 09:23:07 +0200
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
Message-ID: <20240925-hasty-bald-caribou-eedbf5@houat>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="tp2mdysvfttz7mch"
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>


--tp2mdysvfttz7mch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 03:59:18PM GMT, Jessica Zhang wrote:
> Check that all encoders attached to a given CRTC are valid
> possible_clones of each other.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 43cdf39019a4..cc4001804fdc 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -574,6 +574,25 @@ mode_valid(struct drm_atomic_state *state)
>  	return 0;
>  }
> =20
> +static int drm_atomic_check_valid_clones(struct drm_atomic_state *state,
> +					 struct drm_crtc *crtc)
> +{
> +	struct drm_encoder *drm_enc;
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
> +
> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)=
 {
> +		if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=3D
> +		    crtc_state->encoder_mask) {
> +			DRM_DEBUG("crtc%d failed valid clone check for mask 0x%x\n",
> +				  crtc->base.id, crtc_state->encoder_mask);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_atomic_helper_check_modeset - validate state object for modeset c=
hanges
>   * @dev: DRM device
> @@ -745,6 +764,10 @@ drm_atomic_helper_check_modeset(struct drm_device *d=
ev,
>  		ret =3D drm_atomic_add_affected_planes(state, crtc);
>  		if (ret !=3D 0)
>  			return ret;
> +
> +		ret =3D drm_atomic_check_valid_clones(state, crtc);
> +		if (ret !=3D 0)
> +			return ret;
>  	}

Pretty much the same comment, we should have kunit tests for this.

Maxime

--tp2mdysvfttz7mch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvO6WgAKCRAnX84Zoj2+
droGAYDSol3kgX7wkzSE1oluNc2+KTnfRFY6zafC8+pe813u+oXEix2JgVyztgXw
aPgARssBgIVCQkqjoD4G64sFreIbBdDVYhH6QcPY/DKdVoih5mbH1LB4c9jksnGD
3arX4CTVbg==
=pdXg
-----END PGP SIGNATURE-----

--tp2mdysvfttz7mch--


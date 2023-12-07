Return-Path: <linux-arm-msm+bounces-3663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BABE1808538
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 11:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E331F2260F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D382C36AEB;
	Thu,  7 Dec 2023 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKf2eFsn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B520D358A0
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 10:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8507C433C8;
	Thu,  7 Dec 2023 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701943803;
	bh=T/ShUQaMztJ97CmJ49sFmOfYjo5OS/dCBxONTsOlT3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKf2eFsnwrzknvGSYDewtFqEcVgRhnbp7QGpGoo+t/YQA8n+15WOsW2Bphg+CiZYC
	 ee6c2Rc+O9z1LqxSZht0huLasj0GAsSUGokE8uL9Ii8RmuvTBcM/3MK1NuMAuAaafa
	 xyl5NwPxhhdOboTvmoDqibjDgE+Q1Xyopa9oSLiCDO8yTvNA+pStq2qw/MovncDEzk
	 jSIJkw0Q4QwsIH/FK1iYQjcsH2ONq12r96gM8VCORTvUHoJWJCMY7OCAVZwRIQgfqQ
	 WLgvOLlhrX5tiNlHFJ3GkVJAKFf0djHTQ/8vh3m0Sa8K9OpyF0hKewKRLW3r3chgXI
	 MuEfhVbW7OlEA==
Date: Thu, 7 Dec 2023 11:10:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
	Melissa Wen <melissa.srw@gmail.com>, =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
	Haneen Mohammed <hamohammed.sa@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Message-ID: <ohka6xa4xf5zo2txpqlyipsjuafcmmvnvnlfci2hvuhvwagr4k@jqx3do2q3ug3>
References: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
 <20231206101455.1664463-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r5fjienqysgjbwz6"
Content-Disposition: inline
In-Reply-To: <20231206101455.1664463-2-dmitry.baryshkov@linaro.org>


--r5fjienqysgjbwz6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 06, 2023 at 01:14:54PM +0300, Dmitry Baryshkov wrote:
> The drm_atomic_helper_check_wb_encoder_state() function doesn't use
> encoder for anything other than getting the drm_device instance. The
> function's description talks about checking the writeback connector
> state, not the encoder state. Moreover, there is no such thing as an
> encoder state, encoders generally do not have a state on their own.
>=20
> Rename the function to drm_atomic_helper_check_wb_connector_state()
> and change arguments to drm_writeback_connector and drm_atomic_state.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
>  drivers/gpu/drm/vkms/vkms_writeback.c |  5 ++++-
>  include/drm/drm_atomic_helper.h       |  5 ++---
>  3 files changed, 15 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index c3f677130def..c98a766ca3bd 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -795,9 +795,9 @@ drm_atomic_helper_check_modeset(struct drm_device *de=
v,
>  EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> =20
>  /**
> - * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder =
state
> - * @encoder: encoder state to check
> - * @conn_state: connector state to check
> + * drm_atomic_helper_check_wb_connector_state() - Check writeback connec=
tor state
> + * @connector: corresponding connector
> + * @state: the driver state object
>   *
>   * Checks if the writeback connector state is valid, and returns an erro=
r if it
>   * isn't.
> @@ -806,9 +806,11 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>   * Zero for success or -errno
>   */
>  int
> -drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> -					 struct drm_connector_state *conn_state)
> +drm_atomic_helper_check_wb_connector_state(struct drm_connector *connect=
or,
> +					   struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *conn_state =3D
> +		drm_atomic_get_new_connector_state(state, connector);
>  	struct drm_writeback_job *wb_job =3D conn_state->writeback_job;
>  	struct drm_property_blob *pixel_format_blob;
>  	struct drm_framebuffer *fb;
> @@ -827,11 +829,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm=
_encoder *encoder,
>  		if (fb->format->format =3D=3D formats[i])
>  			return 0;
> =20
> -	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->=
format);
> +	drm_dbg_kms(connector->dev, "Invalid pixel format %p4cc\n", &fb->format=
->format);
> =20
>  	return -EINVAL;
>  }
> -EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
> +EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);

Thanks for updating the prototype ...

>  /**
>   * drm_atomic_helper_check_plane_state() - Check plane state for validity
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index d7e63aa14663..23c4f7b61cb6 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -34,6 +34,9 @@ static int vkms_wb_encoder_atomic_check(struct drm_enco=
der *encoder,
>  					struct drm_crtc_state *crtc_state,
>  					struct drm_connector_state *conn_state)
>  {
> +	struct drm_connector *connector =3D conn_state->connector;
> +	struct drm_writeback_connector *wb_conn =3D
> +		drm_connector_to_writeback(connector);
>  	struct drm_framebuffer *fb;
>  	const struct drm_display_mode *mode =3D &crtc_state->mode;
>  	int ret;
> @@ -48,7 +51,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_enco=
der *encoder,
>  		return -EINVAL;
>  	}
> =20
> -	ret =3D drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
> +	ret =3D drm_atomic_helper_check_wb_connector_state(wb_conn, conn_state-=
>state);

=2E.. but it looks like you forgot to update it here

Maxime

--r5fjienqysgjbwz6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXGZ+AAKCRDj7w1vZxhR
xZVKAP9nS5FbyvcmSMtQSnrLitcczEMQlT0AiqZPkMLp3PEGMgD+MI34sAz3mzdq
6Ed7sUpDQDhCqHTyW0l15cxTNrSJeAQ=
=pmD9
-----END PGP SIGNATURE-----

--r5fjienqysgjbwz6--


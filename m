Return-Path: <linux-arm-msm+bounces-3191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC766802DBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E00841C20974
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 09:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96259FBED;
	Mon,  4 Dec 2023 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6eudHG3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79580EAD8
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 09:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99424C433C8;
	Mon,  4 Dec 2023 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701680422;
	bh=kTk/FMT1KfBdMsUbh6k7mndZwOboypNrqNc3z0K4YIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6eudHG3xwv7ybQA6Yhz4IwzesZ+x398p11YdjUpW29XTnnA83IxQZTvC4sJMsFhf
	 vSsSf64j485RxRIS9s+tXrSwOgqcmEm55kNpak4pDE+lYbyNfpXEAYmjy3yk/W1ov/
	 pxGrPTyLoXwGQRec0xgCEzekgK0RI6j9vdw4LhMMvYQZn8PmHmHfOEes6IzY5M2u8c
	 WrPQCro3pH5YFpeTbFWhHVF84jTo2ffIUumdDRpsXDXGtOn8E+dKOBqjY0qEKsO2KM
	 FPJPHW7O2AGjS9hgF8/x8/b+BvQ0WnvbolsGJCh24x7PybswMQuf4BpJP7Pd6wnTi4
	 uFQww8ibYAJkw==
Date: Mon, 4 Dec 2023 10:00:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND v2 1/3] drm/encoder: register per-encoder debugfs
 dir
Message-ID: <2ldbif6vidsfj65gp2v5tkoobdsnget2w6q6o4mtie4mjcoxvu@uhllchrdrjs2>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
 <20231203115315.1306124-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="myqmtjw23q5jirb2"
Content-Disposition: inline
In-Reply-To: <20231203115315.1306124-2-dmitry.baryshkov@linaro.org>


--myqmtjw23q5jirb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Dec 03, 2023 at 02:53:13PM +0300, Dmitry Baryshkov wrote:
> Each of connectors and CRTCs used by the DRM device provides debugfs
> directory, which is used by several standard debugfs files and can
> further be extended by the driver. Add such generic debugfs directories
> for encoder.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_debugfs.c  | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/drm_encoder.c  |  4 ++++
>  drivers/gpu/drm/drm_internal.h |  9 +++++++++
>  include/drm/drm_encoder.h      | 16 +++++++++++++++-
>  4 files changed, 53 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index f291fb4b359f..00406b4f3235 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -589,4 +589,29 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>  	crtc->debugfs_entry =3D NULL;
>  }
> =20
> +void drm_debugfs_encoder_add(struct drm_encoder *encoder)
> +{
> +	struct drm_minor *minor =3D encoder->dev->primary;
> +	struct dentry *root;
> +	char *name;
> +
> +	name =3D kasprintf(GFP_KERNEL, "encoder-%d", encoder->index);
> +	if (!name)
> +		return;
> +
> +	root =3D debugfs_create_dir(name, minor->debugfs_root);
> +	kfree(name);
> +
> +	encoder->debugfs_entry =3D root;
> +
> +	if (encoder->funcs->debugfs_init)
> +		encoder->funcs->debugfs_init(encoder, root);
> +}
> +
> +void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
> +{
> +	debugfs_remove_recursive(encoder->debugfs_entry);
> +	encoder->debugfs_entry =3D NULL;
> +}
> +
>  #endif /* CONFIG_DEBUG_FS */
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 1143bc7f3252..8f2bc6a28482 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -30,6 +30,7 @@
>  #include <drm/drm_print.h>
> =20
>  #include "drm_crtc_internal.h"
> +#include "drm_internal.h"
> =20
>  /**
>   * DOC: overview
> @@ -74,6 +75,8 @@ int drm_encoder_register_all(struct drm_device *dev)
>  	int ret =3D 0;
> =20
>  	drm_for_each_encoder(encoder, dev) {
> +		drm_debugfs_encoder_add(encoder);
> +
>  		if (encoder->funcs && encoder->funcs->late_register)
>  			ret =3D encoder->funcs->late_register(encoder);
>  		if (ret)
> @@ -90,6 +93,7 @@ void drm_encoder_unregister_all(struct drm_device *dev)
>  	drm_for_each_encoder(encoder, dev) {
>  		if (encoder->funcs && encoder->funcs->early_unregister)
>  			encoder->funcs->early_unregister(encoder);
> +		drm_debugfs_encoder_remove(encoder);
>  	}
>  }
> =20
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index b12c463bc460..7df17e4b0513 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -194,6 +194,8 @@ void drm_debugfs_connector_remove(struct drm_connecto=
r *connector);
>  void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
> +void drm_debugfs_encoder_add(struct drm_encoder *encoder);
> +void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
>  #else
>  static inline void drm_debugfs_dev_fini(struct drm_device *dev)
>  {
> @@ -231,6 +233,13 @@ static inline void drm_debugfs_crtc_crc_add(struct d=
rm_crtc *crtc)
>  {
>  }
> =20
> +static inline void drm_debugfs_encoder_add(struct drm_encoder *encoder)
> +{
> +}

<- You need to insert a new line here.

Once fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--myqmtjw23q5jirb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW2VIwAKCRDj7w1vZxhR
xfjoAP4xvwxFS9poLETIETd2j+ZzM2DobxAsw6WVncGDt9Q/FAEAtcBT/3gZyO3W
Gvpo3+k88LvgJeH5LIhahdySxcawZQY=
=pyU4
-----END PGP SIGNATURE-----

--myqmtjw23q5jirb2--


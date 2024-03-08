Return-Path: <linux-arm-msm+bounces-13680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C557876122
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 10:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29BA8282B1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 09:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3BA53385;
	Fri,  8 Mar 2024 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyRkqWW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDEA3BBDE
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Mar 2024 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709891060; cv=none; b=ZnCHKj6WHRFXb96nUqoa5YS4HyF2r8GcRdvv5HxOCfTsQPV6E1CXXSwSyxfggKNPoYf75Z14HR7AKtDdUo08PpnwJcmfooCaoTwQT2rDwyRijDK/rypeuV+Je4Jvvb4ZN2UK270h6vhnvtirE7MHP+GjMzWskslf+LF2W6ahAmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709891060; c=relaxed/simple;
	bh=eEB+hAuKoNrPdDYaycXpcwfaebe90mW/HxdMYYDcttE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9102AEAVt7c75xEwecPkBKOY12wPV7d/2zMQ7TbZ2qe9Rz0DT4AFA207WYY8irYCUK8qx8g2OHCnsGv0pzZS4+NjrwIP15tQxDF7Ps4EZPOCk0ezMip02gtKJlb7P8f4kr2SpLbLdLrfR143c0DQm3Z7mFLdnBXpQIexLnoNKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyRkqWW+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F6BC43390;
	Fri,  8 Mar 2024 09:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709891059;
	bh=eEB+hAuKoNrPdDYaycXpcwfaebe90mW/HxdMYYDcttE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyRkqWW+LW/ke/gpuDynJ5AciE9MpGkSDO+pjM5vf7rr70ywN3xll5osPCpW1g1c5
	 KB2NuWOytozO6mFrt+mbQABZEF3GN4nb7aJD0unXr5gntfW3clFSUKGcImtML5dzU+
	 wJd7CQSjsE7JhZtO6vDRHfOvnYZU3eEOf/u9oVVWwFN8fgDmCXJ7f2rYdZA7z1W4Up
	 a/js87x1zldnfRFYAfqrPK0ci8Y7959harTJlzo1zTPUK6Hxe2mVeS/b0uzwY4uuqz
	 FgpUc0btEEv0U8/EA9IZJuLGIuMh5AAJqZcZQePNCTp9EE0tnvclEQ1iwUujHUl522
	 cR4W/k0eWgm+Q==
Date: Fri, 8 Mar 2024 10:44:16 +0100
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
Subject: Re: [PATCH RFC 3/6] drm/connector: hdmi: split setup code of the
 HDMI connector
Message-ID: <20240308-provocative-pumpkin-hoatzin-f9f31e@houat>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
 <20240308-bridge-hdmi-connector-v1-3-90b693550260@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwr34okuhqr4me67"
Content-Disposition: inline
In-Reply-To: <20240308-bridge-hdmi-connector-v1-3-90b693550260@linaro.org>


--rwr34okuhqr4me67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks a lot for working on that, it's greatly appreciated :)

On Fri, Mar 08, 2024 at 01:57:02AM +0200, Dmitry Baryshkov wrote:
> In order to use HDMI connector extensions from the bridge drivers, carve
> out the drm_connector_hdmi_setup() from drmm_connector_hdmi_init(). This
> way the drm_bridge drivers can call new function from their
> setup_connector callbacks.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 67 ++++++++++++++++++++++++++++++-----=
------
>  include/drm/drm_connector.h     |  5 +++
>  2 files changed, 54 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 427816239038..ba953eb45557 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -454,15 +454,11 @@ int drmm_connector_init(struct drm_device *dev,
>  EXPORT_SYMBOL(drmm_connector_init);
> =20
>  /**
> - * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> - * @dev: DRM device
> + * drm_connector_hdmi_setup - Init a preallocated HDMI connector
>   * @connector: A pointer to the HDMI connector to init
>   * @vendor: HDMI Controller Vendor name
>   * @product: HDMI Controller Product name
> - * @funcs: callbacks for this connector
>   * @hdmi_funcs: HDMI-related callbacks for this connector
> - * @connector_type: user visible type of the connector
> - * @ddc: optional pointer to the associated ddc adapter
>   * @supported_formats: Bitmask of @hdmi_colorspace listing supported out=
put formats
>   * @max_bpc: Maximum bits per char the HDMI connector supports
>   *
> @@ -477,18 +473,12 @@ EXPORT_SYMBOL(drmm_connector_init);
>   * Returns:
>   * Zero on success, error code on failure.
>   */
> -int drmm_connector_hdmi_init(struct drm_device *dev,
> -			     struct drm_connector *connector,
> +int drm_connector_hdmi_setup(struct drm_connector *connector,
>  			     const char *vendor, const char *product,
> -			     const struct drm_connector_funcs *funcs,
>  			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
> -			     int connector_type,
> -			     struct i2c_adapter *ddc,
>  			     unsigned long supported_formats,
>  			     unsigned int max_bpc)
>  {
> -	int ret;
> -
>  	if (!vendor || !product)
>  		return -EINVAL;
> =20
> @@ -496,8 +486,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	    (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
>  		return -EINVAL;
> =20
> -	if (!(connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> -	      connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB))
> +	if (connector->connector_type !=3D DRM_MODE_CONNECTOR_HDMIA &&
> +	    connector->connector_type !=3D DRM_MODE_CONNECTOR_HDMIB)
>  		return -EINVAL;
> =20
>  	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB=
)))
> @@ -506,10 +496,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	if (!(max_bpc =3D=3D 8 || max_bpc =3D=3D 10 || max_bpc =3D=3D 12))
>  		return -EINVAL;
> =20
> -	ret =3D drmm_connector_init(dev, connector, funcs, connector_type, ddc);
> -	if (ret)
> -		return ret;
> -
>  	connector->hdmi.supported_formats =3D supported_formats;
>  	strtomem_pad(connector->hdmi.vendor, vendor, 0);
>  	strtomem_pad(connector->hdmi.product, product, 0);
> @@ -531,6 +517,51 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL(drm_connector_hdmi_setup);

I guess it's more of a general comment on the whole design of things,
but this is the starting point I think.

None of the other DRM entities have the split between init and setup,
connectors included. So this creates a bit of oddity in the API which I
think we should avoid at all cost. API consistency is the most
important.

If I got the rest of your series properly, this all stems from the fact
that since connectors are disconnected from bridges nowadays, there's no
way to implement drm_connector_hdmi_funcs on an HDMI bridge, and
especially to get those hooks called with some sort of pointer to the
bridge private instance.

And so I assume this is why you split init in two here, and added a data
field to the HDMI part of drm_connector, so that you can init the
connector in drm_bridge_connector, and then call setup with your
drm_connector_hdmi_funcs and the private data pointer in setup so it all
works out. Right?

If so, I believe this doesn't only create an inconsistency at the KMS
core API level, but also in the bridge API. To me, bridges are meant to
fill the encoder gap, so we shouldn't special-case the core API to
accomodate the bridge design. And the bridge framework has been designed
that way too.

If you look at the way EDID or HPD handling, we fundamentally have the
same problem: the connector is supposed to implement it, but it really
is handled by the bridge driver that wants to operate with its private
instance data.

So I think we should go for a similar approach:

  - We keep the drm_hdmi_connector_init function only

  - If the drm_bridge_connector has an HDMI type, we can
    drm_hdmi_connector_init and call
    drm_atomic_helper_connector_hdmi_check() at atomic_check time.

  - We create a drm_bridge_* set of functions and associated hooks to
    handle HDMI TMDS char rate filtering and infoframes setup that gets
    called by drm_bridge_connector, and pass the bridge, connector and
    all the extra arguments we need.

Once we've done that, we're probably in a good position to support what
we want to support. The drm_connector_state is passed to the atomic set
of bridges hooks so they can just read the content from there and we
should be good?

What do you think?

Maxime

--rwr34okuhqr4me67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZerd8AAKCRDj7w1vZxhR
xT4HAP96uOnXBFe77jq9k6qT7BICRfTWa8xqDjmUkpdzJHgiVAD/YbxizR1gWQhX
Z/+a+RsSES7mly95bFAVEfekFHxIhQY=
=Y8xr
-----END PGP SIGNATURE-----

--rwr34okuhqr4me67--


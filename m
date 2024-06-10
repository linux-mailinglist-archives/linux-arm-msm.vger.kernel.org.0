Return-Path: <linux-arm-msm+bounces-22159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD72901C44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 10:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E27551C21114
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 08:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B3B55886;
	Mon, 10 Jun 2024 08:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qO42PDzo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C78F3CF5E;
	Mon, 10 Jun 2024 08:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718006683; cv=none; b=N7LmLyoJItrFU6efgCldt/WuDofN7yc6HAWIJB+Tq0ce+wTGNmT5I5S2fitw1zwS7UzKWUH5U2ENbYO1zxMem4boDzWsBJZbZ+hgWW3zuyAkioVoMgmIInFxsUgU7TznUBnN13agFQ9exxfPSW6XLmxrjGVp6iLnEVlby2rTutU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718006683; c=relaxed/simple;
	bh=PfWUeRhLyjLhAFqFtGc6KqYlFjjdNjw8O7JtmZzFAko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2Ul/5oIbVgg98qWuM4ktYmhJGXokMZRcS7wvdRbPWZJCT4CRTKW6pMFbIyqMgtgWVYkIBctTMYgELltFTlgTwcVyGO5Arhxa7Nr8vv5si8MEutcGE1koOGGVJ4cS/PxOheOo6Oc8x9sJQmRwpwLeUWMMG2KEhmLSMxcG8S/tCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qO42PDzo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E494C2BBFC;
	Mon, 10 Jun 2024 08:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718006682;
	bh=PfWUeRhLyjLhAFqFtGc6KqYlFjjdNjw8O7JtmZzFAko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qO42PDzoabkTGCXzdKgdk8myoHbUmsMiGKKU433H4x8Qjy353i403niBCKrmui3Lu
	 NUg3hZpaHfTMbV3ihO6GW21J2dWw2NMU/CsHXZVz3yspF+0alAxU/SzDdgZsIA/hJ7
	 GBGC459skTMfxoAFUtckXd/ebZkhF43R3w/0f+8QymrJhOteSi9W//nY4HQWS4PKiq
	 yw6PV+EtVhcBnIuHC1YzDwUrOHqh1gdq4JcxVmCgH19QAL4V+smyGgbH91TYbnkIUl
	 hPnzVHBmbDKEG5yJILQU/He//ghmdTmnz4///DkjI1+jjAUA77cK8crsSGjczimfhM
	 1NvFUFf9b/Iew==
Date: Mon, 10 Jun 2024 10:04:40 +0200
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
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] drm/bridge-connector: switch to using drmm
 allocations
Message-ID: <20240610-secret-rottweiler-from-asgard-132f75@houat>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-2-ab384e6021af@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ekqacobahrau4wvb"
Content-Disposition: inline
In-Reply-To: <20240607-bridge-hdmi-connector-v5-2-ab384e6021af@linaro.org>


--ekqacobahrau4wvb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 07, 2024 at 04:22:59PM GMT, Dmitry Baryshkov wrote:
> Turn drm_bridge_connector to using drmm_kzalloc() and
> drmm_connector_init() and drop the custom destroy function. The
> drm_connector_unregister() and fwnode_handle_put() are already handled
> by the drm_connector_cleanup() and so are safe to be dropped.
>=20
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm=
_bridge_connector.c
> index 982552c9f92c..e093fc8928dc 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
> =20
> @@ -193,19 +194,6 @@ drm_bridge_connector_detect(struct drm_connector *co=
nnector, bool force)
>  	return status;
>  }
> =20
> -static void drm_bridge_connector_destroy(struct drm_connector *connector)
> -{
> -	struct drm_bridge_connector *bridge_connector =3D
> -		to_drm_bridge_connector(connector);
> -
> -	drm_connector_unregister(connector);
> -	drm_connector_cleanup(connector);
> -
> -	fwnode_handle_put(connector->fwnode);
> -
> -	kfree(bridge_connector);
> -}
> -
>  static void drm_bridge_connector_debugfs_init(struct drm_connector *conn=
ector,
>  					      struct dentry *root)
>  {
> @@ -224,7 +212,6 @@ static const struct drm_connector_funcs drm_bridge_co=
nnector_funcs =3D {
>  	.reset =3D drm_atomic_helper_connector_reset,
>  	.detect =3D drm_bridge_connector_detect,
>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
> -	.destroy =3D drm_bridge_connector_destroy,
>  	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
>  	.debugfs_init =3D drm_bridge_connector_debugfs_init,
> @@ -328,7 +315,7 @@ struct drm_connector *drm_bridge_connector_init(struc=
t drm_device *drm,
>  	int connector_type;
>  	int ret;
> =20
> -	bridge_connector =3D kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
> +	bridge_connector =3D drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_K=
ERNEL);

So you make destroy's kfree call unnecessary here ...

>  	if (!bridge_connector)
>  		return ERR_PTR(-ENOMEM);
> =20
> @@ -383,9 +370,9 @@ struct drm_connector *drm_bridge_connector_init(struc=
t drm_device *drm,
>  		return ERR_PTR(-EINVAL);
>  	}
> =20
> -	ret =3D drm_connector_init_with_ddc(drm, connector,
> -					  &drm_bridge_connector_funcs,
> -					  connector_type, ddc);
> +	ret =3D drmm_connector_init(drm, connector,
> +				  &drm_bridge_connector_funcs,
> +				  connector_type, ddc);

=2E.. and here of drm_connector_cleanup.

drm_connector_unregister wasn't needed, so can ignore it, but you leak a re=
ference to
connector->fwnode since you don't call fwnode_handle_put anymore.

We should register a drmm action right below the call to fwnode_handle_get =
too.

Maxime

--ekqacobahrau4wvb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmazlwAKCRDj7w1vZxhR
xXdjAQCzoEg4/T8P/GxJ0eUBeqCJFzarpSs98ongo1PMSwx6aQD9H+jBBp4qbdgn
k73+39fpZOFL06SsGVHWH2Hxv379EwA=
=IHay
-----END PGP SIGNATURE-----

--ekqacobahrau4wvb--


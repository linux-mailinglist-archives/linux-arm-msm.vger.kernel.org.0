Return-Path: <linux-arm-msm+bounces-48005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B38C4A35B41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C613188F85F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 10:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C812566C9;
	Fri, 14 Feb 2025 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4nujvA2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E68024BBF6;
	Fri, 14 Feb 2025 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527964; cv=none; b=Kw6w90fAxwG+U7CE/2LflHU6+Nt7kHMR9x5WPg21NSQOYg8TXmrCcYYuFo1IPdIaO01kJTE2QV5OjcEYGGiyCC1IAH7rdwauv6T2nEYKqtEt4vBUUc6OH+bXU2dzErxF2h1/opbEfJBMK5xddwD7Ke49sup+LrSIuTjMAbwUVYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527964; c=relaxed/simple;
	bh=D0RFyQLP8OShhpCJcuNc0VYgW5PEny0WHgZKrBBt+E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOReOFcjBtZ95Wpx8bfAJDYziZhTk1RymjHHN07Sx6ABsTm/WTnVjIAl04RGl18k6gWT+EmIkHUHAkSSayJm82Irp8GyEn3JLSyz+p0xIqzV0jf7DlrKBYI0I5lZpksTXtsatSQctD8AF5X6kbmFIqqSl3A34KswKXgvhXmN1yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4nujvA2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3350FC4CED1;
	Fri, 14 Feb 2025 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739527963;
	bh=D0RFyQLP8OShhpCJcuNc0VYgW5PEny0WHgZKrBBt+E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4nujvA2+aB4B8IB1zFifPv7Ol0GHeKosxXrKWOfnXPbSrBjkJlpiDibwOte1amjw
	 mgKE8UApgQBlgB+rSAoCW3rfEjPW8Hag7D1ZuJOx1W0fnmXfkNMU9mwdtlVNezG2tu
	 V1D26kd0utNoKcLp4d9nGQunUWKklKhNi59EeP6vC1yN6EX15ZtixPDgQ+4uHqK0Zu
	 d1XyZkvd2pSE6v6kAS8iZ62GAwmCS28RXbN3DyGjVVl5SyMVMt67TAqK0jB1dsy7MU
	 3odemaZWS0MJnCdiakGWxsdQVYDYd1dYkSIH/iI850MNEp6ZKJgq+ogTlk0CD+KnB2
	 AZrSb2jnPoYqg==
Date: Fri, 14 Feb 2025 11:12:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Hermes Wu <Hermes.wu@ite.com.tw>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/display: bridge-connector: add DisplayPort
 bridges
Message-ID: <20250214-eggplant-oarfish-of-fame-7d8c06@houat>
References: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
 <20250209-dp-hdmi-audio-v2-1-16db6ebf22ff@linaro.org>
 <20250213235745.GA7688@pendragon.ideasonboard.com>
 <teokrp5lycipuchh6e64tvqabxzzf4ez7epuyrae5ahd7dqnjs@x7vyrjgzth2i>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zqtgsiq3woaybcbl"
Content-Disposition: inline
In-Reply-To: <teokrp5lycipuchh6e64tvqabxzzf4ez7epuyrae5ahd7dqnjs@x7vyrjgzth2i>


--zqtgsiq3woaybcbl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/display: bridge-connector: add DisplayPort
 bridges
MIME-Version: 1.0

On Fri, Feb 14, 2025 at 02:32:56AM +0200, Dmitry Baryshkov wrote:
> On Fri, Feb 14, 2025 at 01:57:45AM +0200, Laurent Pinchart wrote:
> > Hi Dmitry,
> >=20
> > Thank you for the patch.
> >=20
> > On Sun, Feb 09, 2025 at 03:41:18PM +0200, Dmitry Baryshkov wrote:
> > > DRM HDMI Codec framework is useful not only for the HDMI bridges, but
> > > also for the DisplayPort bridges. Add new DRM_BRIDGE_OP_DisplayPort
> > > define in order to distinguish DP bridges. Create HDMI codec device
> > > automatically for DP bridges which have declared audio support.
> > >=20
> > > Note, unlike HDMI devices, which already have a framework to handle H=
PD
> > > notifications in a standard way, DP drivers don't (yet?) have such a
> > > framework. As such it is necessary to manually call
> > > drm_connector_hdmi_audio_plugged_notify(). This requirement hopefully
> > > can be lifted later on, if/when DRM framework gets better DisplayPort
> > > ports support in the core layer.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/display/drm_bridge_connector.c | 66 ++++++++++++++++=
++++------
> > >  include/drm/drm_bridge.h                       | 14 +++++-
> > >  2 files changed, 65 insertions(+), 15 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers=
/gpu/drm/display/drm_bridge_connector.c
> > > index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..5e031395b801f9a1371dc=
b4ac09f3da23e4615dd 100644
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -98,6 +98,13 @@ struct drm_bridge_connector {
> > >  	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
> > >  	 */
> > >  	struct drm_bridge *bridge_hdmi;
> > > +	/**
> > > +	 * @bridge_dp:
> > > +	 *
> > > +	 * The bridge in the chain that implements necessary support for the
> > > +	 * DisplayPort connector infrastructure, if any (see &DRM_BRIDGE_OP=
_DisplayPort).
> > > +	 */
> > > +	struct drm_bridge *bridge_dp;
> > >  };
> > > =20
> > >  #define to_drm_bridge_connector(x) \
> > > @@ -496,6 +503,25 @@ static const struct drm_connector_hdmi_audio_fun=
cs drm_bridge_connector_hdmi_aud
> > >  	.mute_stream =3D drm_bridge_connector_audio_mute_stream,
> > >  };
> > > =20
> > > +static int drm_bridge_connector_hdmi_audio_init(struct drm_connector=
 *connector,
> > > +						struct drm_bridge *bridge)
> > > +{
> > > +	if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> > > +	    !bridge->hdmi_audio_spdif_playback)
> > > +		return 0;
> > > +
> > > +	if (!bridge->funcs->hdmi_audio_prepare ||
> > > +	    !bridge->funcs->hdmi_audio_shutdown)
> > > +		return -EINVAL;
> > > +
> > > +	return drm_connector_hdmi_audio_init(connector,
> > > +					     bridge->hdmi_audio_dev,
> > > +					     &drm_bridge_connector_hdmi_audio_funcs,
> > > +					     bridge->hdmi_audio_max_i2s_playback_channels,
> > > +					     bridge->hdmi_audio_spdif_playback,
> > > +					     bridge->hdmi_audio_dai_port);
> > > +}
> > > +
> > >  /* -----------------------------------------------------------------=
------------
> > >   * Bridge Connector Initialisation
> > >   */
> > > @@ -564,6 +590,8 @@ struct drm_connector *drm_bridge_connector_init(s=
truct drm_device *drm,
> > >  		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
> > >  			if (bridge_connector->bridge_hdmi)
> > >  				return ERR_PTR(-EBUSY);
> > > +			if (bridge_connector->bridge_dp)
> > > +				return ERR_PTR(-EINVAL);
> > >  			if (!bridge->funcs->hdmi_write_infoframe ||
> > >  			    !bridge->funcs->hdmi_clear_infoframe)
> > >  				return ERR_PTR(-EINVAL);
> > > @@ -576,6 +604,16 @@ struct drm_connector *drm_bridge_connector_init(=
struct drm_device *drm,
> > >  				max_bpc =3D bridge->max_bpc;
> > >  		}
> > > =20
> > > +		if (bridge->ops & DRM_BRIDGE_OP_DisplayPort) {
> > > +			if (bridge_connector->bridge_dp)
> > > +				return ERR_PTR(-EBUSY);
> > > +			if (bridge_connector->bridge_hdmi)
> > > +				return ERR_PTR(-EINVAL);
> > > +
> > > +			bridge_connector->bridge_dp =3D bridge;
> > > +
> > > +		}
> > > +
> > >  		if (!drm_bridge_get_next_bridge(bridge))
> > >  			connector_type =3D bridge->type;
> > > =20
> > > @@ -612,21 +650,21 @@ struct drm_connector *drm_bridge_connector_init=
(struct drm_device *drm,
> > >  		if (ret)
> > >  			return ERR_PTR(ret);
> > > =20
> > > -		if (bridge->hdmi_audio_max_i2s_playback_channels ||
> > > -		    bridge->hdmi_audio_spdif_playback) {
> > > -			if (!bridge->funcs->hdmi_audio_prepare ||
> > > -			    !bridge->funcs->hdmi_audio_shutdown)
> > > -				return ERR_PTR(-EINVAL);
> > > +		ret =3D drm_bridge_connector_hdmi_audio_init(connector, bridge);
> > > +		if (ret)
> > > +			return ERR_PTR(ret);
> > > +	} else if (bridge_connector->bridge_dp) {
> > > +		bridge =3D bridge_connector->bridge_dp;
> > > =20
> > > -			ret =3D drm_connector_hdmi_audio_init(connector,
> > > -							    bridge->hdmi_audio_dev,
> > > -							    &drm_bridge_connector_hdmi_audio_funcs,
> > > -							    bridge->hdmi_audio_max_i2s_playback_channels,
> > > -							    bridge->hdmi_audio_spdif_playback,
> > > -							    bridge->hdmi_audio_dai_port);
> > > -			if (ret)
> > > -				return ERR_PTR(ret);
> > > -		}
> > > +		ret =3D drmm_connector_init(drm, connector,
> > > +					  &drm_bridge_connector_funcs,
> > > +					  connector_type, ddc);
> > > +		if (ret)
> > > +			return ERR_PTR(ret);
> > > +
> > > +		ret =3D drm_bridge_connector_hdmi_audio_init(connector, bridge);
> > > +		if (ret)
> > > +			return ERR_PTR(ret);
> > >  	} else {
> > >  		ret =3D drmm_connector_init(drm, connector,
> > >  					  &drm_bridge_connector_funcs,
> > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..40f37444426b1b8ded25d=
a9ba9e2963f18ad6267 100644
> > > --- a/include/drm/drm_bridge.h
> > > +++ b/include/drm/drm_bridge.h
> > > @@ -811,9 +811,21 @@ enum drm_bridge_ops {
> > >  	 *
> > >  	 * Note: currently there can be at most one bridge in a chain that =
sets
> > >  	 * this bit. This is to simplify corresponding glue code in connect=
or
> > > -	 * drivers.
> > > +	 * drivers. Having both HDMI and DisplayPort bridges in the same br=
idge
> > > +	 * chain is also not allowed.
> > >  	 */
> > >  	DRM_BRIDGE_OP_HDMI =3D BIT(4),
> > > +	/**
> > > +	 * @DRM_BRIDGE_OP_DisplayPort: The bridge provides DisplayPort conn=
ector
> > > +	 * operations. Currently this is limited to the optional HDMI codec
> > > +	 * support.
> > > +	 *
> > > +	 * Note: currently there can be at most one bridge in a chain that =
sets
> > > +	 * this bit. This is to simplify corresponding glue code in connect=
or
> > > +	 * drivers. Having both HDMI and DisplayPort bridges in the same br=
idge
> > > +	 * chain is also not allowed.
> > > +	 */
> > > +	DRM_BRIDGE_OP_DisplayPort =3D BIT(5),
> >=20
> > The OP bits are not supposed to describe tbe type of bridge, but the
> > operations it implements. I see quite a bit of duplication between HDMI
> > and DisplayPort in this patch. Can we have a single bit named after the
> > feature that you want to support ? The bridge_hdmi and bridge_dp fields
> > should also be merged into a single one.
>=20
> In this case these ops actually describe the set of ops implemented by
> the bridge. DRM_BRIDGE_OP_HDMI implements hdmi_tmds_char_rate_valid(),
> hdmi_write_infoframe(), hdmi_clear_infoframe()

Those are required for HDMI bridges (using the common infrastructure).

> and hdmi_audio_*() callbacks.

But those are certainly not required.

If the OP enum is meant to list what a bridge implements, then we need
to have a different enum for video, audio, and CEC.

Maxime

--zqtgsiq3woaybcbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ68XGAAKCRAnX84Zoj2+
dvzRAYDc7JT95pMeWgcJP2mvbg0hMQ5cbWWmVle1mutQ19OoQzq+MLlHaEDpnZiZ
Gqw77Y8BgI9mJ+WTkLCKR43xOoKX0NgI8hhydtjhXq4To7Mdr6VUz+8LVns4Pufz
YOTvtrEouw==
=mkPe
-----END PGP SIGNATURE-----

--zqtgsiq3woaybcbl--


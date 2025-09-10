Return-Path: <linux-arm-msm+bounces-72947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F4B514CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1CC87BC1F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A673176FA;
	Wed, 10 Sep 2025 11:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GN+OSMOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80645316919;
	Wed, 10 Sep 2025 11:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502351; cv=none; b=fihtIdwwwt6K18k5Re9IeneINCFIq56bA9uvT/Ld26Dx+2W6cEDwea5IoNKwtKRr/ugDZZWj0YU6rhbzUhsNcVRf9PYowCUAxSIgBhluVpI94JwsI+iLUatLsulGTGZiUX18d7WGz+z5EQmB8+XCWaHroD3lxhS6p6Bd35R4cUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502351; c=relaxed/simple;
	bh=3vKUwDPyxY+sseiR8nmx7Ts9m3y+/etlfgrvBDkuze4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtBCOzERcF790ePnImRC15PniFJ405YcGEaWgF10Qn55CjA+ur+vDfKeaT89HEYXPwinQPdoZPGeEQ/jIisSD4CWnrYcvYprbo0lq6fyp7jjfBO7jEgmYoSXq1YwBz1Ngl6hzzSb9niamN3TkVulG82uBoMUPGuf4RaQljmATJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GN+OSMOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7297FC4CEF0;
	Wed, 10 Sep 2025 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757502350;
	bh=3vKUwDPyxY+sseiR8nmx7Ts9m3y+/etlfgrvBDkuze4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GN+OSMORf3Q12T8aH7Eft8BEU//JedXUgIkbxmsGUx58zRf9KX5PvOyrcBi0vbgyw
	 Pr89t4+LtMmnoiEWrNUrLMhgVSGgEVloMZegmdixkK4NShwrgW4+PVb/kVuW4IcA7l
	 Xorw2zDPzxGGf0ZCxeJqaNq8a/wY8uggmxrzvuzQzOoCMum5Pi+DFSEh/+SOoIoUgj
	 D2DeEykRtyj8suBVThYLqmCb79dYgeWkJyexyfE1xYlScYk8WzeWrIvB+bKuAHwKzz
	 MbBXnbDh5DOJt87aKD2uO4EuAurSyIJ48849AGijGDkHUm/cWOWrIVfdPGHosi0hVp
	 OyE0tSWrtAZdA==
Date: Wed, 10 Sep 2025 13:05:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 10/10] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
Message-ID: <20250910-magic-natural-saluki-4aca9d@houat>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-10-53fd0a65a4a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6mjdewn6swmhkqjp"
Content-Disposition: inline
In-Reply-To: <20250909-drm-limit-infoframes-v4-10-53fd0a65a4a2@oss.qualcomm.com>


--6mjdewn6swmhkqjp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 10/10] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 05:52:08PM +0300, Dmitry Baryshkov wrote:
> Sending Audio InfoFrames is mandatory for getting audio to work over the
> HDMI link. Warn if the driver requests HDMI audio support for the HDMI
> connector, but there is no support for Audio InfoFrames.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_audio_helper.c
> index 7d78b02c144621de528b40b1425f25e465edd1ae..35e0e79cb683a68af813344aa=
86c154c3a5531fe 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> @@ -10,6 +10,7 @@
> =20
>  #include <drm/drm_connector.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_print.h>
>  #include <drm/display/drm_hdmi_audio_helper.h>
> =20
>  #include <sound/hdmi-codec.h>
> @@ -178,6 +179,17 @@ int drm_connector_hdmi_audio_init(struct drm_connect=
or *connector,
>  	    !funcs->shutdown)
>  		return -EINVAL;
> =20
> +	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> +	    connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB) {
> +		unsigned long supported_infoframes =3D
> +			connector->hdmi.supported_infoframes;
> +
> +		if (supported_infoframes &&
> +		    !(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
> +			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFr=
ames\n");
> +	}
> +
> +

That's not what I suggested. What I suggested was that we tould check
the return code of write_infoframe, and warn if it is set by the
framework, but returns EOPNOTSUPP.

Maxime

--6mjdewn6swmhkqjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMFbiwAKCRAnX84Zoj2+
dirGAX4uKxTLTYBVNw7Full2UUa5VuWquXM6Yf9V75SJdwVH/LBdZKdEu2L5zcFu
4A/bxOwBfipkuEzUY5FfJt6YBzOLmgB9EMwhn/Z1a+okQD5MuPEy0LtOtwYYWOvQ
oQFyrwx8zg==
=PKSd
-----END PGP SIGNATURE-----

--6mjdewn6swmhkqjp--


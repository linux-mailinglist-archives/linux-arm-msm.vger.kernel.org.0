Return-Path: <linux-arm-msm+bounces-71359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164DB3DADD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F4A916D511
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C60264A77;
	Mon,  1 Sep 2025 07:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvRDcRrJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC989262FFF;
	Mon,  1 Sep 2025 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756710769; cv=none; b=qPgcpdpfeu4n+AqLBazPadBTgcFfi8rVB+NatXtvy3QQTjR72CyXRrD4RD8OX3aX2NMyHkMyY50OzlofrFeVneynK0/yyfkG1oh4tYKk5nN5TUJeOOmg34AvNpZ46tBEXxHphLiiuRTlsJ/3ZAFksa79B3O6bBI9YXalQnBFKQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756710769; c=relaxed/simple;
	bh=sqbENlpFH5Ccvd/AgXy87AdCw0HQL2r94DTlakLOXkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVe7NFEfifZ2yWJm7tBu2RHhIDbZgZyfs+Wy1F8A6gzSHUFaLV5J1zdUO8YP/hfH450egCgKfIoDY+qWcqemDUg1zbfTswcSYfrQM4Q463HgdsGrDbEiodMQxfTzpEo4ALUP9AidQWLudGa5DSA1SqVflxbxlHqz81kxbpFJx2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvRDcRrJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41B7C4CEF0;
	Mon,  1 Sep 2025 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756710768;
	bh=sqbENlpFH5Ccvd/AgXy87AdCw0HQL2r94DTlakLOXkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvRDcRrJ3D2orbIXD7WnuTXHeCCjdEyWTuDs2ehGvhH6g092TdwffObCqw6c3uPLj
	 /LyQnIM2gYrkY8DFOfIK0y8o9dXYqaB/y6NMyGkRxKvMlT3K9spwFFMDYRtxMCKJej
	 1wrFpvr9L++WHzsNl28uYkEvkhaQTo3ziwnt7z0yMtJCHEWdaOMCxn8TX4Jvo9oQPX
	 fYB3jIhQEdxqsmSzY+6qM25gbImIAMBuY2woXO5cFVs9o3SpRem6K0tuRgzRzeu/NI
	 DR/Ca/K5KgS2GLJQRe0egTW1bfKVOFXUd2fX+2D36zBgNZ0ccw7or48CslrIcmF8Or
	 A5QRwxc+l8WBw==
Date: Mon, 1 Sep 2025 09:12:45 +0200
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
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 02/11] drm/bridge: adv7511: declare supported
 infoframes
Message-ID: <20250901-tidy-auburn-tarsier-e7b1e7@houat>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="pqxavipok3t73ium"
Content-Disposition: inline
In-Reply-To: <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>


--pqxavipok3t73ium
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 02/11] drm/bridge: adv7511: declare supported
 infoframes
MIME-Version: 1.0

On Sat, Aug 30, 2025 at 03:22:58AM +0300, Dmitry Baryshkov wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface. Audio infoframe is handled separately.
>=20
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 26f8ef4824235a9a85b57a9a3a816fe26a59e45c..fe30567b56b4f600683f0545e=
d270665e692b12c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -904,7 +904,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct=
 drm_bridge *bridge,
>  		break;
>  	default:
>  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n",=
 type);
> -		break;
> +		return -EOPNOTSUPP;
>  	}
> =20
>  	return 0;
> @@ -938,7 +938,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct=
 drm_bridge *bridge,
>  		break;
>  	default:
>  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n",=
 type);
> -		break;
> +		return -EOPNOTSUPP;

We do need to document that it's what drivers must return though.

Maxime

--pqxavipok3t73ium
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLVHbQAKCRAnX84Zoj2+
dt3KAX0ZWp21D5I1WfwgyhTb7vH2ZBY8xOTpHJNqK0/JL81whZT+fJo0wz4+NRJx
iBLn7D4BfRsIiD6leCOIITTZsJxThT9rcAz5duWccxLZ5gpctOvKi1BZ0t0qCcPY
yc40IvF47Q==
=adUS
-----END PGP SIGNATURE-----

--pqxavipok3t73ium--


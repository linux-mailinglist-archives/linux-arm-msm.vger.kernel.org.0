Return-Path: <linux-arm-msm+bounces-75899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259E6BB6F41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 15:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B279C4A07E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 13:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E65C2F066D;
	Fri,  3 Oct 2025 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlgeRQrw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E287A83A14;
	Fri,  3 Oct 2025 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759496768; cv=none; b=rR98xqjMOdD4mI0yKk5VeZ+lx+lquLOvnarQD6VWXjsALbdpNMJE5cWDlVsxA6j/p9dH3z+9QumQnFlUkdK+/eTdHDDUiKFKJG1TB5DrS6QaWBvGZlqm4qodkCQGSS5OdXfMIOYMeI6mhnDWUPrhKZTTPreK1r0Dg4nIk1VyHxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759496768; c=relaxed/simple;
	bh=eNt1Gcmgl05avc3eJ3PssbmGBA5Ku1mD4+vRG6E3X5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXtRTrqob09XEPMA0YkGw2wJjzQ1wnrQeVCfl75/fb09xhCzSxANkK82a9ZGhZH0LwvBxy3eL33siFxMse/UlZmoi8yoW4/owbtHIWtW/jMrh0c/dqg/i+ZEjlX2rZ0d1UAxRpwnEHxMvCQA5FwkmOXBnpsgdpBFKM+2tcyQ7Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlgeRQrw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFE9C4CEF5;
	Fri,  3 Oct 2025 13:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759496767;
	bh=eNt1Gcmgl05avc3eJ3PssbmGBA5Ku1mD4+vRG6E3X5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlgeRQrw/M/6sxS4v8nGdyP6hV7p3O70yJjDCJGZFC+inkUh9Ps0AhfTa/nxa4X4s
	 c5mIsJuUAJ1SM0H9oXjZxh7YGRM0fyCx0t+3LKBkziJfXMEhm7gLUhLcGaJTjWaoNN
	 Mlv1UYzSydNzNCvXwtLHYaRJyf05IPnqemhWLsaqD3trgPH0KR96fz8GQ3D5/umi1j
	 cv975MVhvL4sCQuSvzk44+FKxYfrbhoC7/4kCt4eFd06r7NZnvcehFAifZTGNmodWS
	 RJBegdKK+9SK9eeGQVJcqhRkIKG0fRflr4hVRrx9fdmEjr4EGLHB1xtUD6tcxikWl4
	 D1iOe0AW6IoWA==
Date: Fri, 3 Oct 2025 15:06:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Samuel Holland <samuel@sholland.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/9] drm/bridge: adv7511: handle unsupported InfoFrames
Message-ID: <20251003-crystal-monkey-of-fantasy-ea4a1a@houat>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
 <20250928-limit-infoframes-2-v2-2-6f8f5fd04214@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="54ncbnvuigfo4z2w"
Content-Disposition: inline
In-Reply-To: <20250928-limit-infoframes-2-v2-2-6f8f5fd04214@oss.qualcomm.com>


--54ncbnvuigfo4z2w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/9] drm/bridge: adv7511: handle unsupported InfoFrames
MIME-Version: 1.0

Hi,

On Sun, Sep 28, 2025 at 11:24:47AM +0300, Dmitry Baryshkov wrote:
> Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
> return -EOPNOTSUPP for unsupported InfoFrames and make sure that
> atomic_check() callback doesn't allow unsupported InfoFrames to be
> enabled.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index b9be8654130758e69ac7ccbc73a82cc25d731a5c..241f02143f59322a814b4b277=
082637d59be7d5f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -906,8 +906,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct=
 drm_bridge *bridge,
>  		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
>  		break;
>  	default:
> -		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n",=
 type);
> -		break;
> +		return -EOPNOTSUPP;
>  	}
> =20
>  	return 0;
> @@ -966,19 +965,32 @@ static int adv7511_bridge_hdmi_write_infoframe(stru=
ct drm_bridge *bridge,
>  		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
>  		break;
>  	default:
> -		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n",=
 type);
> -		break;
> +		return -EOPNOTSUPP;
>  	}

I'm completely fine with that part.

>  	return 0;
>  }
> =20
> +static int adv7511_bridge_atomic_check(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state)
> +{
> +	/* should not happen, HDR support not enabled */
> +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
> +			     conn_state->hdmi.infoframes.hdr_drm.set))
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +

However, I'm not sure we need that boilerplate in any driver. I'd rather
expand the kunit test suite to make sure it never happens rather than
adding it to every driver.

Maxime

--54ncbnvuigfo4z2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN/KMwAKCRAnX84Zoj2+
dnyuAX42GfxKCL/3093it2n3uUpzK4IH9zfQ3SHTXOJGmhKXFE5M88bQKfBUgIh/
+g4R80YBf2MDvgokTCDsxDGAEu7jkpWUmqQgAkHrI1IDGnk4vLKev6hUVpls0k2z
ag0XePnvhw==
=iLh5
-----END PGP SIGNATURE-----

--54ncbnvuigfo4z2w--


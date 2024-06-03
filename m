Return-Path: <linux-arm-msm+bounces-21451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D998D7E26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B34D428004C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC755EE80;
	Mon,  3 Jun 2024 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T648A4jU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801154DA06;
	Mon,  3 Jun 2024 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717405783; cv=none; b=M4qvbCtIXrk5iYp1QjDCi8S/dgdWIVo5iRKRhk7R8y03mq71+7czsTbTbrjcrLl9R0Jqazq1wb71SwXXw0R2teXV3xQ8hVPGA75FrgacryR93h73sG2zFpVqh9u4N4mjvkyDZF7CCruARb9Xi19FEEdcH08Y6UybTLmEpoL4B1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717405783; c=relaxed/simple;
	bh=zts/QRsUM8k00Nfd4l4iKWD2XkKbZM/dD/eqgptURNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLi0TwBCml6yxAfelvfWHovUKPGLBq3t05BCuFDyAwEbHX7BRahymfCyjiHvPBozlqxv31JEAy4qKUIzMAzpynC0TvZNS/4UFnem8NGpvz9MZAEZqWm52SxnH9saUg6u3464IXJM9UZM71CAb/21vI13M5iFENcEr7fNZyv6Rsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T648A4jU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1C2C2BD10;
	Mon,  3 Jun 2024 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717405783;
	bh=zts/QRsUM8k00Nfd4l4iKWD2XkKbZM/dD/eqgptURNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T648A4jUN6PelkRNGIl7hxRPXuYGfhKc0w4IhBdXrxin6cs+UrZQ3iATqdbNlnwO/
	 KxPcKK6ZCShnQ+GaQC9n4ex2n28ltok8NIJ0V6EW3e5v0aeJ5IiClJmujEzx+TQ0+h
	 MdNWLKLm+Y90vuEh2SCvq/zRyhx6SMrakl0xnH5uxMsRGDdKPYTn1eXvCNhUCML2GX
	 Uw3VAizHiVNE0Di3sUDp6fp+o6LOQH/4uWYxowr8Cwj9t37ro+AAZMe665XGis/Zo/
	 3uVRKrB0nlv0jcHFZUcP9ITZznCVPZYLtDhwhYOUqjxAqrDTksyuEDzOUnq4TpKu3T
	 Wa/Ig9liJjoyw==
Date: Mon, 3 Jun 2024 11:09:40 +0200
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
Subject: Re: [PATCH v4 1/9] drm/connector: hdmi: accept NULL for Audio
 Infoframe
Message-ID: <20240603-therapeutic-warm-fox-890bee@houat>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
 <20240531-bridge-hdmi-connector-v4-1-5110f7943622@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="cjo537cz6gzry5k7"
Content-Disposition: inline
In-Reply-To: <20240531-bridge-hdmi-connector-v4-1-5110f7943622@linaro.org>


--cjo537cz6gzry5k7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for not answering your mail on the previous version sooner.

On Fri, May 31, 2024 at 11:07:24PM GMT, Dmitry Baryshkov wrote:
> Allow passing NULL as audio infoframe as a way to disable Audio
> Infoframe generation.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index ce96837eea65..5356723d21f5 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -681,7 +681,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update=
_infoframes);
>  /**
>   * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the =
Audio Infoframe
>   * @connector: A pointer to the HDMI connector
> - * @frame: A pointer to the audio infoframe to write
> + * @frame: A pointer to the audio infoframe to write or NULL to disable =
sending the frame

I'm still two-minded about this. I think I would like a separate helper
better, to also make things consistent with the HDMI helpers.

Most importantly, it looks like you're not using it at all in your series?

>   * This function is meant for HDMI connector drivers to update their
>   * audio infoframe. It will typically be used in one of the ALSA hooks
> @@ -704,10 +704,16 @@ drm_atomic_helper_connector_hdmi_update_audio_infof=
rame(struct drm_connector *co
> =20
>  	mutex_lock(&connector->hdmi.infoframes.lock);
> =20
> -	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
> -	infoframe->set =3D true;
> +	if (frame) {
> +		memcpy(&infoframe->data, frame, sizeof(infoframe->data));
> +		infoframe->set =3D true;
> +
> +		ret =3D write_infoframe(connector, infoframe);
> +	} else {
> +		infoframe->set =3D false;
> =20
> -	ret =3D write_infoframe(connector, infoframe);
> +		ret =3D clear_infoframe(connector, infoframe);
> +	}

We should probably clear infoframe->data here too

Maxime

--cjo537cz6gzry5k7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZl2ITQAKCRAnX84Zoj2+
dqkOAX9UmBzsHTKxHZS1nYELnt3AKt9186dxlneShEm4OxdrXK29/MwOCb+UL69k
SkvYtVkBfiYyBRgWMuoXlPMgdMZe/SKJIwO19JoO1q6utvRCW6k9RMmkiAFCjD1d
J6ZyAccWMA==
=wp6q
-----END PGP SIGNATURE-----

--cjo537cz6gzry5k7--


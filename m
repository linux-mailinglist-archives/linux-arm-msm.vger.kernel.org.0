Return-Path: <linux-arm-msm+bounces-21066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 068F38D4779
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DEA3B20D8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 08:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CC86F31A;
	Thu, 30 May 2024 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBSF5qn6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0616F318;
	Thu, 30 May 2024 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058969; cv=none; b=NEYvJINg4ZQcRW3AJDxbqMiXtW2F0T9o176eljkUmRwh5qWD9J1AAJayfj7tD3uHX3eaS4jGshBlOyqx5Skq/6GbvzcwL4DgEPMzHAx9UW8Ac6/Ou7zJPZfb3Qy1TzQPMApCPxY67gf8kwxEKytRTFAdQcjmuQpFl8ANW3Xnh3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058969; c=relaxed/simple;
	bh=RMlDUxJiGobRFguc3DRtHWTv7WiNMiDof+uoZrSLUA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fi3K37CEiwEN//WMPCmp1dkrGACIzw/0anDGrIKGvqdFkajx0IUvcKFObZF5XCZaTlmoQmD0pfCYMFY01jIlrgENa9kd4/wT+7UcK+7zRbj/3fjOmgxszkRKrXKWOUo0VgwCOMV/pjyOa8zZ5ATm3cUvYuIf415q6ETSVyahsz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBSF5qn6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF8BC3277B;
	Thu, 30 May 2024 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717058968;
	bh=RMlDUxJiGobRFguc3DRtHWTv7WiNMiDof+uoZrSLUA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBSF5qn63ZTxet3h/KgfI84iXyPbcZ7m5UVIGT4Zh94nALn7/QyNuPD566qQJSpK5
	 +j7sNiyUcFxomJhas0mIMXGD4wU7YBq4nefDAv6hrMcyG6D/I5uulEmMIElQnPrrlw
	 CPgQOb52Zg3a/Kq0j9RjknhjnLKzCEyUgyPBeEFSZW64HY2+nYJJpCJ2RM1Ro9dY14
	 3+hqt3XtD4GEqQFHT0v+c4IMSKpJeonXM7jWz6mC3UyEyDovCwxvWajQsz4UlqxkIO
	 qJR8XxIAf/QhhsBC66Ej7PaXU59n7GQJAfT1ET3FK1KcAb0w4CfmIr6kWZ8eTTR926
	 rATiKQfQzbyRA==
Date: Thu, 30 May 2024 10:49:26 +0200
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
Subject: Re: [PATCH v3 1/7] drm/connector: hdmi: accept NULL for Audio
 Infoframe
Message-ID: <20240530-daffy-satisfied-sheep-5b9e16@houat>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
 <20240530-bridge-hdmi-connector-v3-1-a1d184d68fe3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="takwrixyv5pp4e4s"
Content-Disposition: inline
In-Reply-To: <20240530-bridge-hdmi-connector-v3-1-a1d184d68fe3@linaro.org>


--takwrixyv5pp4e4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 30, 2024 at 02:12:24AM GMT, Dmitry Baryshkov wrote:
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
>   *
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

I'm not entirely sure your commit matches your commit log? It looks like
you follow the same pattern than the other infoframes and call
write_infoframe if there's one, or clear_infoframe if there isn't.

So we're never passing NULL to disable? clear_infoframe is called.

Maxime

--takwrixyv5pp4e4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlg9kQAKCRAnX84Zoj2+
dk3pAYCbS/9eXzTy0YlUFvQaOXrLJprI9gx8B2mCC+SSaUyqq6oITErczWwScJwQ
fgXhMFIBgJOU255qv1o/4bocu6tu2hF/D9FGax6f1ae+MKrdPFUmJ0PhyEX/zJY/
D+quLGMFQg==
=gGq3
-----END PGP SIGNATURE-----

--takwrixyv5pp4e4s--


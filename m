Return-Path: <linux-arm-msm+bounces-87888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7388CFDC38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD18730021F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EE531B839;
	Wed,  7 Jan 2026 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdtNBxpC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17DA314A65;
	Wed,  7 Jan 2026 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790254; cv=none; b=qHfXDCeNsP/n2ySsiGRp6OVWogDpJ11jcOtRGV0LpQsNJlb6+qnbLUHcV7OJRwAn74RZDAaqSH5+jnEgTVpSya+Qn3RunwTpEcT3H8JxJp06HaE2uf49B0YVP9TMrsdjnZEfP+nVk45FUCWHi3Zc/oe+DICF/yXt6ZI+WAVwX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790254; c=relaxed/simple;
	bh=Is5RjV5W1u9YGVarjcRU6ceNIN9IKqpKYrkNrDF/4MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hv69I5ulU4n4SWNNiZJjqEyPZOyOc1eY/U15LrXTg//6Bu3WRpOUNtv/0YVTKH8NVeDmiYt187kidkQ42jHM1hjTRCCOx5A5c2c5HmxRzO8Cj0GN56fICAyBq4sDwwqJBnlqLLaBr7i184+H55BdxSoLCeFhqOh0zw5a5vSYCWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdtNBxpC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F902C4CEF7;
	Wed,  7 Jan 2026 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767790253;
	bh=Is5RjV5W1u9YGVarjcRU6ceNIN9IKqpKYrkNrDF/4MQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdtNBxpCkcQ+J4H95qIr3QfX6X38re9VsczT9QDHJOelKLRMPw0ZAybPLWkJT/BYt
	 qBVIOG1TpBraZfpFcb9sHRYZD4hYsQX1YNB/c3DKoTsjfQ8h9gmu0pNFOsuOTp8pwd
	 6JnV3p1TlDu+25XdF8kWiT/pWdoNfwElGtGmMU+ThGuuuS43S2YuUg/sGfkw/3Tlj3
	 4eu40L+vU5uuxAtGViRQ5eXxP540CVDfAhCdnD5T562No2Z61O+CR4BPRaAdS0u201
	 xMJ72P80lwivWepjJ19FrxjJLpICrKdlq/TqB4fE0LbyeL/ASQDPdHCztqVjRHN1dy
	 YyrJCg8uezBOQ==
Date: Wed, 7 Jan 2026 13:50:51 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Message-ID: <20260107-fascinating-boa-of-fertility-1886a0@houat>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
 <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5jzjabvum6jmi43c"
Content-Disposition: inline
In-Reply-To: <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>


--5jzjabvum6jmi43c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
MIME-Version: 1.0

Hi,

On Wed, Dec 24, 2025 at 03:02:56AM +0200, Dmitry Baryshkov wrote:
> Updating the InfoFrame if it can not be sent over the wire makes no
> sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
> and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
> an error if Audio InfoFrame callbacks are not implemented.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

IIRC, audio infoframes are mandatory if you send audio over the cable,
so maybe we should do like you did for drmm_connector_hdmi_init and
error in drm_connector_hdmi_audio_init if we don't have the proper
write_infoframe hook set?

Maxime

--5jzjabvum6jmi43c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaV5WpQAKCRAnX84Zoj2+
dvQoAX0ZrPZ4Tvz4pn+WykRaXQmRL9fYSOrsCkdNU/U/YeDmV7idPNZOoovjGxhA
lol6AlQBgKrZOSgOR63zJZLAb5FVpUis1h8cxg8f+AZWDU9CuIucM8fJDumWT/jC
l8IATNMIWw==
=i55g
-----END PGP SIGNATURE-----

--5jzjabvum6jmi43c--


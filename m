Return-Path: <linux-arm-msm+bounces-21453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 324358D7E38
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB8EE1F24EFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7635E76F17;
	Mon,  3 Jun 2024 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaT8tNYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC858AA5;
	Mon,  3 Jun 2024 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406073; cv=none; b=jumGwkFmtWtc4Hg9uYKaqS95iCJn4EWJuqaj8cmrDqdFW1q66uv8yIpWfhBuihmWw4R3ivrmMX5KzXdrDSw0vJTnwNL0QGRYIyAxGd9QbdkAaH38KYVVNLBNypZa4GeBVVZCIPy9BOWUL0uoceZRHvFqIOJlZGyHi9MSl9t3KdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406073; c=relaxed/simple;
	bh=kRaKkGVAxc9uve0nW7HSdUn07QqNL4yoUYMpcu8Ag0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUU2tYyT49dhCLwqwFHAE+06xWg1dULDWkykJtrKTule/NFQl0k/fkDlePWLXlT9wMuhwYnQB4xvfOG/h2PSQ8/Duqk7Ebr37gJq4puSvKS9a3SI42L2XLQQCfiT7gfuR6aR4UStL7rA+f0t77guZptorvSOhuxRQ2dpPQmqtnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaT8tNYq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5334BC2BD10;
	Mon,  3 Jun 2024 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717406072;
	bh=kRaKkGVAxc9uve0nW7HSdUn07QqNL4yoUYMpcu8Ag0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JaT8tNYq6tChS62uoH5HkxxvhHNt0fq4UqSqXZ2BQ2WvvFHv8FDhVBKzak7GMUXZW
	 l5oYvRL15/zrdG+1W+v7aU/YY2gfPZu4GTJ272+854ztdXAADOBnuikBvgtfVl8A95
	 1Mc4udT/IXB2iDuvG/DTa7kP8dqHN/ZOTEmE7oWiSi/xCcjSTUG9D6pKh2L3AxkqnL
	 B65EAooMZ3t5HXfuCRFz7U329MIdWeTDw/PYVmXdmBKuK6ocIESTkaQ2WXRToAh+g7
	 7X9cBgt0BDBPmBr1WbeLrVwhX2mMXFO1O5Dc2b8f/aTY6wT3WTXT/DdJxXtPT6yKVQ
	 /3jcIQvCRvedw==
Date: Mon, 3 Jun 2024 11:14:30 +0200
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
Subject: Re: [PATCH v4 3/9] drm/bridge-connector: implement glue code for
 HDMI connector
Message-ID: <20240603-proud-caiman-of-fertility-ceb36a@houat>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
 <20240531-bridge-hdmi-connector-v4-3-5110f7943622@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="gko36zr2ozjx53lj"
Content-Disposition: inline
In-Reply-To: <20240531-bridge-hdmi-connector-v4-3-5110f7943622@linaro.org>


--gko36zr2ozjx53lj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, May 31, 2024 at 11:07:26PM GMT, Dmitry Baryshkov wrote:
> +static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
> +						enum hdmi_infoframe_type type)
> +{
> +	struct drm_bridge_connector *bridge_connector =
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge = bridge_connector->bridge_hdmi;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	if (bridge->funcs->hdmi_clear_infoframe)
> +		return bridge->funcs->hdmi_clear_infoframe(bridge, type);
> +	else
> +		return 0;
> +}
> +
> +static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
> +						enum hdmi_infoframe_type type,
> +						const u8 *buffer, size_t len)
> +{
> +	struct drm_bridge_connector *bridge_connector =
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge = bridge_connector->bridge_hdmi;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
> +}


Sorry, I didn't notice it before, but I think it would be good to try to
make clear_infoframe mandatory just like write_infoframe. It wasn't
possible for the main helpers because we didn't have enough info for
some drivers, but I think we should try to make it mandatory, and be
prepared to relax it if needs be.

With that fixed:
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--gko36zr2ozjx53lj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZl2JdQAKCRAnX84Zoj2+
dnx8AX9XGJKgzSr6M5O5oiSn0kjo+G4+uANEp9GROPwPZJXKhHgP5Cc1hApfYjTc
T5Sf7Z8BfR0cMmOS87bWO4k0zBEaJatMc7o2FVqt26H48mFflPAiip89PYJdUOZw
f+QP0ptGZA==
=D3hE
-----END PGP SIGNATURE-----

--gko36zr2ozjx53lj--


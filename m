Return-Path: <linux-arm-msm+bounces-51594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F712A647EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 10:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6A631891D70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 09:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DDA22A7F6;
	Mon, 17 Mar 2025 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vc5R1QmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAA61AAA32;
	Mon, 17 Mar 2025 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204719; cv=none; b=JbYXAkoYpnft99qeVP3Cdo+prehtAl6VeWijJnqur5GvMAejd/0OR7Q+MCP1WgCH3EW5kF5Rxw+ktC4VhWpnE31tMDQKW/oQdA2r6ycEagGWAH/EjaAST8OspJ2k8RJ4Qrfq41k0J5GajR3zRhHZpttlF8aES10qMc5S9e1bSTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204719; c=relaxed/simple;
	bh=IDfEO9ixbAv5kWVNwF8BvMXACU0glZwpuOKgM/NINyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYcQFKa3IjG4UOmYswWoGGSVnKqi7q2AJ8g1lSN3pDn64r/j7I36w8j2eW6kA52gBZWhUWE+0FyfPdwYeCTFhaiSUjSCUIhSgLdO4k8e2cuXWTd7SU1TlhwQtSyekxFZxighth7aTguMpXsi3tQnbucR11kbZ10EHCCDjp1wWaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vc5R1QmP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9377C4CEF0;
	Mon, 17 Mar 2025 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742204719;
	bh=IDfEO9ixbAv5kWVNwF8BvMXACU0glZwpuOKgM/NINyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vc5R1QmPHOTrhSdJtjbXjn3Q/pVsWLlIO/2wjHWiT71fsu3wrrUDlsbP/CPZXw+mc
	 xysGjRvhtSwfdQA7HGJt+RsKNKcxEBhM6/R8SmwI47z5/kKsgxaSoneE4b6337Kx/S
	 q29zb4BgGaWy9Qun1/SXXBOv4DEQWAk0xS038Xs+ce/2+w3rg3YTC20kityrcogz6z
	 YP6/VILT5UbbeNCTguFiYnXZ2Tpaqa/ZbTBIEViVGHFSJqOudQTjAM6x9yYNcJPurG
	 VLYLFVMq+ZIaNNcvvUNSE6050QM1p9nJenFIgDe2tf1Qp4VUnagqewQiw3BvpA4WHx
	 uGNkNd+wpqZVA==
Date: Mon, 17 Mar 2025 10:45:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Hermes Wu <Hermes.wu@ite.com.tw>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>, 
	Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
Message-ID: <20250317-dancing-loyal-malkoha-ad5a36@houat>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
 <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
 <otidtln4pjb47azr7zhllxkqmwocdnbdiay6xcg6psphz3436i@fn5hxgaflgv6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ixvl3eaawni5mk5e"
Content-Disposition: inline
In-Reply-To: <otidtln4pjb47azr7zhllxkqmwocdnbdiay6xcg6psphz3436i@fn5hxgaflgv6>


--ixvl3eaawni5mk5e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
MIME-Version: 1.0

On Fri, Mar 14, 2025 at 08:55:05PM +0200, Dmitry Baryshkov wrote:
> On Fri, Mar 14, 2025 at 05:54:14PM +0000, Maxime Ripard wrote:
> > On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> > > It is common for the DisplayPort bridges to implement audio support. =
In
> > > preparation to providing a generic framework for DP audio, add
> > > corresponding interface to struct drm_bridge. As suggested by Maxime
> > > for now this is mostly c&p of the corresponding HDMI audio API.
> > >=20
> > >=20
> > > [ ... ]
> >=20
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>=20
> You've sent two r-b's for patch 2. Is there a chance that one of those
> was for patch 3?

Did I? Sorry, it was indeed meant for patch 3

Maxime

--ixvl3eaawni5mk5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9fvJwAKCRAnX84Zoj2+
dnNVAYDhZWYDGXn7oAB0Fo0Lf64zRQfKXIpnqEHJYJiwjUC3bU8WN/EHUFxqFVpX
epcnHMkBf1TqVVJjt8AS9ICP0MFlT1pGgiaFWa2B8bah6LI77fyFdkT67q5xD9JQ
oz5+buRd4w==
=mQjr
-----END PGP SIGNATURE-----

--ixvl3eaawni5mk5e--


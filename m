Return-Path: <linux-arm-msm+bounces-46155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB51A1CCF6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 17:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE0BB1885114
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D361154C1D;
	Sun, 26 Jan 2025 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pee83AH9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F228BEE;
	Sun, 26 Jan 2025 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737909702; cv=none; b=G75I/j1aK31u8XrNbn+2bFcjpb7jcfVXf8mPBsyQGqhC2K0Jq9Cqx0TiqHJptR2d0NESIUwTUK83aO0hsykObzdsW55GQ+eGT2L69UchBmxMrXMJg6Ta2JpuLPWTSJi3dTq1F26tG5dmMjsinB8r/QnjZKQLPXOX4WPfhgRj7FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737909702; c=relaxed/simple;
	bh=/7J4enhP8qcoFPo60PM5Nw959dOsZCztnFfcr76/Vgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEelvE68M1ACrawHv/22jFuSVZsrCzJbxSn1s+6Monj1+KVspHWqVLeH5kSrgqyGkOYUWI+Mb/X4KiC1rE4ltlrEFOaPw80/wpyQa7F2sr9hlC9hO1R5mttEBtC5KhbmcodmG1DOOGUM7H/j/PhZc38XIdEbYjaeJHBeJA2bFKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pee83AH9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B742C4CED3;
	Sun, 26 Jan 2025 16:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737909701;
	bh=/7J4enhP8qcoFPo60PM5Nw959dOsZCztnFfcr76/Vgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pee83AH90NNXLz7BP6WhQh9IjMp8jfwGZ9tojv7gTNjTmNKW8WrYWQUAOMUS0kr5a
	 oJdi8GTMwp7KlcCzszEQObO/I6Bm/NAM41mNcUEaPT7MpzRJb6x2eJNmG5fQbYLP9x
	 ekDBQPQP27IjqZ5PdkdkTO2qqQq6kY/nl7u20h7obwyDZXVz40qWKHblmdRGbrJAkk
	 lkMMuHtjOyy1hYZ02sefxYoq4hZSFmWgNCN6T3XJwBqhDu3LX1NYsWt9ccRKgWrtpR
	 nIw6OBtHZX2lY+rDaUjFHsaweAcXz9YdkIL7NJCYvxhCYnxXlyL7DmmcmxQ/RliNbG
	 qpY/ENj0Sn0hg==
Date: Sun, 26 Jan 2025 17:41:35 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Message-ID: <l3f3xg4fjycx4uo66sfdbtke3g6ubf2lrtocys53ymseoi3g6q@z3642rvjy2fe>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vuxkawwxcu5moozb"
Content-Disposition: inline
In-Reply-To: <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>


--vuxkawwxcu5moozb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
MIME-Version: 1.0

On Fri, Jan 24, 2025 at 11:47:42PM +0200, Dmitry Baryshkov wrote:
> The mode_set callback is deprecated, it doesn't get the
> drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> that HDMI timings should be programmed after setting up HDMI PHY and
> PLL. Rework the code to program HDMI timings at the end of
> atomic_pre_enable().
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Maxime

--vuxkawwxcu5moozb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5ZlvwAKCRAnX84Zoj2+
dlsVAX9kVIzgidPAipVZkVtP9jTc1dPSHDr7Gekx/pQTRZV2pmWARlzDGnktKhFm
XBHtBLYBgL/agrjjEvCy6zK7KP5WCZYRuOl7LA1TUlRoYCLBKrezW3Vv6aYQULGO
IC2jUvOD8A==
=hxco
-----END PGP SIGNATURE-----

--vuxkawwxcu5moozb--


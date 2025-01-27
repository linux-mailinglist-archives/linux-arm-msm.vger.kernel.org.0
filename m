Return-Path: <linux-arm-msm+bounces-46220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E984AA1D422
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51CFA3A759D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397D41FDE2A;
	Mon, 27 Jan 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BC4HhShF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EC21FDE1A;
	Mon, 27 Jan 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737972657; cv=none; b=M3UJ63V+RsOBFW56zkCmt49vYzO1AV8to8aOeg0q1793dOf66VU+6zCEililiQG4whapSDtAjgFYdZyndsEndKPifNQ2CGS/IZVoCBWbMjTZ3FugM/9Qn9GSaly6pKs1zV83uJ549DvviJ+MXdkGl8FWiAKsDG8rdXLq1RhmCYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737972657; c=relaxed/simple;
	bh=agJ5S9bl4wmfQrtA3be1QnJSpq5ngoYn66pkWUpjpJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cx6aZg95UFSTX7zamnNTLnXkFxkJGkow66WvAYJ0MIn/4F46viRbqKVFiEKaVvfXji2yRytMe05vHpzDtZkieLun1UE8a/3u4UObYz5PfzfHfG0YnQMgAaf3uc96IxC45NpJRWM1D70oNib5L/bFwfWHy5BzhCP7Mlfc/fsWY0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BC4HhShF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56E1C4CED2;
	Mon, 27 Jan 2025 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737972656;
	bh=agJ5S9bl4wmfQrtA3be1QnJSpq5ngoYn66pkWUpjpJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BC4HhShF/g4jinRM39EfKcfX2tpvQMIDAHkehNMh8IRLiE/IrlvVjLJSTG3uu5STj
	 buToOX0r344ZkiusdUPDg7CqlFcqcX/aEBOEUSuhIIPj615drPE0+nyRUNHV/1KTnE
	 hIVQFbOg/sj6wOxuLIzOb217pwGuy0aC9YCpn/3kr6qfNqWU/fdWcLhTonukjBP98e
	 j0LFW02vGqhqgx73YbSWDDV1yRcRH3N5pH5Y+3IugGyqBCwG4G3zBy30VlTh1VDPj0
	 bNFndaaZmKO0W5H3eo2MTd488YSDPVqO3AmBXFlN5YVF+Xui/R6QY0FV5ocXNXZfPt
	 Hf1deZfAjMgQg==
Date: Mon, 27 Jan 2025 11:10:52 +0100
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
Subject: Re: [PATCH v6 7/7] drm/msm/hdmi: use DRM HDMI Audio framework
Message-ID: <jsm3rtju3r3nxb5wlar4wkvychcdf6lniluw4c3bxkaijfftpy@nsn5v37s3cmp>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-7-1592632327f7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="v43khfyyztducgj6"
Content-Disposition: inline
In-Reply-To: <20250124-bridge-hdmi-connector-v6-7-1592632327f7@linaro.org>


--v43khfyyztducgj6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 7/7] drm/msm/hdmi: use DRM HDMI Audio framework
MIME-Version: 1.0

On Fri, Jan 24, 2025 at 11:47:47PM +0200, Dmitry Baryshkov wrote:
> In order to simplify the driver even further and to remove the
> boilerplate code, rewrite the audio interface to use the DRM HDMI Audio
> framework.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--v43khfyyztducgj6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5dbpgAKCRAnX84Zoj2+
dhXYAX45o3735N1/kaKk5NCn2pqj0fKc+7jUoqxD+0dXoZX6+i7NcPgf322fOtRP
Ryy7+ggBf1jmuPDnSIkMIXnLg8ynUROzvy2AN0pISH0RpENCAQiivb5wdF7RYkhV
Mik42nMxew==
=lIVh
-----END PGP SIGNATURE-----

--v43khfyyztducgj6--


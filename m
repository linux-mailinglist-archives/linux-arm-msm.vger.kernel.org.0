Return-Path: <linux-arm-msm+bounces-74576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D41ECB99612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 12:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F37FA1889EC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 10:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08682DBF7C;
	Wed, 24 Sep 2025 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teAk/W34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB53596D;
	Wed, 24 Sep 2025 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758708760; cv=none; b=YtGF3BPKyaufYZxulF1l+HnxDz3sN28S2CyhdP9i8MXR6GoGmLIelltDn+iL2IWF/DYFCKuOQRPY50EZFpCaoeQ7sJi31JurOxu8nk7DmsMQrBmtGj+SF1uxaEl0j+X5+PtETKoRqbW/NTMgrno+sOILO+4eKSE5R5i9broHuAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758708760; c=relaxed/simple;
	bh=jb+RYxnvCgNCh4wlGf5pJ2xCgvY+hLEmDVthm8B/5V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFHzz8awgm0oXRmxL9k/nS3H98bABB8UXjQBx4+2XXBvUrXZi4lnLqZ+Lm74V4rOJ4lEDz8cbTc4h+mjRmL5eRpGqI711SjqtE5L1tQLyE3K0bbC+hqlTL54XlwP/bz3wDEFxxM57xvwxOQ367FVSVRdq+vWABb6yXSDKM1cgmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teAk/W34; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D047CC116C6;
	Wed, 24 Sep 2025 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758708760;
	bh=jb+RYxnvCgNCh4wlGf5pJ2xCgvY+hLEmDVthm8B/5V4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teAk/W349aB3IgcENEqQsRTrzyv6F6YvIztgVNuEvvJA203yt1GLQCJnVtLwiXRNU
	 2trMOFL01Z8owaIL4zRzulFIH+UKBG/YiLDEbGoq0f4c0qItr2CcFz56wPjSoA1coo
	 tVSmMVZx0CcAF1npEQFSyPFUpAX0mJDsABi5X7uWKnO3J0P3kUzXTHxQRHB7DLTC3g
	 hV4lyQbA8egEg4r1iZFMp96j8BfXzjDXGKErvHn5zKfXqrg2gbeHjr9uyGYAEqQMAa
	 BMocuXXl9R5ZiBKvKd9UTKj+TprBlW3iMpf8H/pK7n4ipE7AoACeQXZkV5yP7VM5zS
	 wvDMpjpUU6DoQ==
Date: Wed, 24 Sep 2025 12:12:37 +0200
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: soc: qcom: use sa8775p/ subdir for QCS9100 /
 QCS9075
Message-ID: <aNPEFQBexZF1fVZg@finisterre.sirena.org.uk>
References: <20250918-lemans-evk-topo-v1-1-9680600e62d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C+2j3+sNiN9FY548"
Content-Disposition: inline
In-Reply-To: <20250918-lemans-evk-topo-v1-1-9680600e62d4@oss.qualcomm.com>
X-Cookie: Oh Dad!  We're ALL Devo!


--C+2j3+sNiN9FY548
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2025 at 05:41:52AM +0300, Dmitry Baryshkov wrote:
> All firmware for the Lemans platform aka QCS9100 aka QCS9075 is for
> historical reasons located in the qcom/sa8775p/ subdir inside
> linux-firmware. The only exceptions to this rule are audio topology
> files. While it's not too late, change the subdir to point to the
> sa8775p/ subdir, so that all firmware for that platform is present at
> the same location.

This doesn't apply against current code, please check and resend.

--C+2j3+sNiN9FY548
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjTxBQACgkQJNaLcl1U
h9DPMQf/Z5xZtQRt9bifUQ8z/Zb/xbYTJEZz6O0PEd2J8iN7iXWWCgehITO9Ox+R
ADia43VjFlyBJhjEFaMozF8Dd/ccQ+VbJPnxo/FctCcGQ1Ssj3O1FbHtiGxf0NIJ
gHkS+6CKPxp/SHUFBW39oQOHEV46+Rd2QppK32KXXtHl6PmXHcU1Ub/JsGt4j1uw
3EtsFy0z8EZkJnArJ4ajjwJ7in7SYXShTSZdMEs4ZvyZosGKTWk9puuswQtKQm+X
3Vsd4ZJwjKddQyD5ySpf94RzP/N/Gcymhv4EuBm1tvJw+c6qzWRonUJQeZJWS3zB
RrxGpFqQfHzN8NbGNmi+BmrjG5C4Xg==
=kEEh
-----END PGP SIGNATURE-----

--C+2j3+sNiN9FY548--


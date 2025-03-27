Return-Path: <linux-arm-msm+bounces-52647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74020A732EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 14:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB4DD17DE75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC27F2153E8;
	Thu, 27 Mar 2025 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVzi7zPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878032153D5;
	Thu, 27 Mar 2025 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080486; cv=none; b=GUTUooAjIByJMoUuWKwo3wlJDASnFst5U3h4JAJ/U9XuPDHbw34+sc26E58Mcjlv4sLOMyou0tBqct5ZBPwtFRoZkPqy6WxSGaKRqa29Kpv6EEW2RDtJOzMZLKGe5tuWAzo+/HUj8ZxRX85Fl/ui/XEpHRNIYLdd02VlWLfFvQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080486; c=relaxed/simple;
	bh=1O1yKZ63fknWxD1PLDOG6cVDUidy0ndhXm1ekOteIFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5qX5fGj54S8In3lFrGlNnLHiOnRV55CmfNS2marGTDBK1FWB94CdhVWub4ggTZ+nm0fuRIdiueiPSDek8OB3xOxC0b/1OQuICfVd0YyrgGeqt2CnDbJzfYVlpM5n0XS6rPycagsZP0wRhBSCyZVi+TdYDo+J2YdMEFbv/fALGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVzi7zPf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93658C4CEDD;
	Thu, 27 Mar 2025 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743080486;
	bh=1O1yKZ63fknWxD1PLDOG6cVDUidy0ndhXm1ekOteIFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVzi7zPfGb4IYBTX0InZ0ctLOD5ULU0JNLLru5ShWJldOMZQlMa/EIsCy2PWzoYh/
	 TwDwO146dT6M/FkZM1z4+JCEWlEyWOgOzTBOP8i6H9ePyQ2zGcVJgJaOS21/5kGktk
	 gdySz4PGevNX7OKO4XFd1ykFNwLA418h7AFJ8SnSJlMVZqSxkO9mIR4lGjTwq2XQX8
	 W7XdykR1XADzOznvm+JXMiwS1VIuVPGA0gfM77JTmtiRvAqzZ4THFMp3YJbo84fntK
	 llIIW2P5e4prf3EbyIwLc/KapoFGF72FTdurzB1lC8jLaiPim/e0jvogKUTukNNglB
	 wL+Vx0cJyVF3A==
Date: Thu, 27 Mar 2025 13:01:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com,
	krzysztof.kozlowski@linaro.org, perex@perex.cz, tiwai@suse.com,
	jdelvare@suse.com, linux@roeck-us.net, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wsa883x: Implement temperature reading and
 hwmon
Message-ID: <51da9bbe-559a-43bb-9f1a-3cb9784cd7bd@sirena.org.uk>
References: <20250107114506.554589-1-alexey.klimov@linaro.org>
 <3e08b501-f8d0-4e68-874e-b578e7c82c47@sirena.org.uk>
 <D8R21NO1IN43.1E4FD7KG9Z4KI@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VstiSd6HitBx/O/R"
Content-Disposition: inline
In-Reply-To: <D8R21NO1IN43.1E4FD7KG9Z4KI@linaro.org>
X-Cookie: Multics is security spelled sideways.


--VstiSd6HitBx/O/R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 27, 2025 at 12:41:48PM +0000, Alexey Klimov wrote:
> On Sun Mar 16, 2025 at 11:33 PM GMT, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> Just for reference and for future, what should be the base for patches?
> linux-next or specific repo/branch in audio asoc?

For new code it's for-next in my tree, for fixes for-linus (or the
versioned branch for the targeted kernel version).

--VstiSd6HitBx/O/R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmflTB8ACgkQJNaLcl1U
h9BZFwf8DoSn9ZmzfQqDx+X0aYlXuocHr550N4aIGmMJ98fpi6OR9mW/2d1SZMGy
cohA95gwYdKjv+u1RoxnAUe6lHd9nRLATTwM2nLX5Hx/dtm1f/HSHMaNte15lUhO
+3VtezHR++ZGHvBa+Y2uAEbER0f1cVMcmWmSz8/Di0yBhglImhSR5Ob14BNnJEHh
nPj0J/OHa+KmmWhnCm8oDoowB2ZcJELEsnHVZtEF3eD8PQiLt9zb1DQXoP2BcJCt
vZ0y7Qa1KdZcRzZSJlLVvlg8c/l6GdzD97mXG/Fa6rxKkGXepoq8MlIKQ0VFpzzu
inCab64R79XxeVmBbepdVWC99GoXPg==
=DkBO
-----END PGP SIGNATURE-----

--VstiSd6HitBx/O/R--


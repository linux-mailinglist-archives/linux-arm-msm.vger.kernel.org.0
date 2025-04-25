Return-Path: <linux-arm-msm+bounces-55640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65915A9C8A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B43994C46CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E982459D7;
	Fri, 25 Apr 2025 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV9/P5OQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D276218EBA;
	Fri, 25 Apr 2025 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583158; cv=none; b=kYlsDZPUHT7KRBCEi0muYW5kwUNj13cuy4EqtftP/Jvxj+IZ01KyNVZgMqwV0ETu4ChJrKNMTsyAQI3ue11YUzPQvgULL7MnA6BkpGJb6sRJv75TVUFj0HRkZBPnRINErJ/dJJIK7m0oMhbFuDzvZ9nOucPHZVV5+/onpX/yu6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583158; c=relaxed/simple;
	bh=mf9pdvvsYkqmrnXi3WTmxVFAP8NlaZz95FYz18Bt7kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9Y6hSsXuYrMmFAsOqf3156L1a060j5ZtqNuihWOE8WBSI9d+PyV1M/OsotMtXjm+79408K5SaOmOLiOFoxBvv+ilRONeDBYOPSVDwYmuwKAOb3NkzrkFBZWscy0xMQ91THXLMeNc0YP/Y9eY5aMvYarr100VhWSBQtOyH6ikIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV9/P5OQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA7FC4CEEE;
	Fri, 25 Apr 2025 12:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745583158;
	bh=mf9pdvvsYkqmrnXi3WTmxVFAP8NlaZz95FYz18Bt7kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fV9/P5OQ5UYXhhxPU1pbTlnjCQm2RsVHd7ZfD6t/RmDvmnXI1BZg/rBDFIbbhhjwU
	 A7Wzo8kbm6YnUQF5grrCbbDK2iF7IEytof5IqO10DIGR2t9PiZS4s1bgtbaK4F2lxU
	 7VhDl7lsTQGif7seHpMFMhIqa8SJddnXrilvjLzOdBJHxy7QEr60WHtLQjFWdwMTzP
	 81sdv6VhGpTIe38hVj+ED6Q5klCiWO17qiqL5/duScPPfgecF0bU0lPEPvieefxTrg
	 w8KlRQwKPin/tIZNd6q2EGIj5Wd172A1Z48XBS2e8WMURZWYHiOcTBBCKGEE+XqqQw
	 YA35Lr0r3pzZA==
Date: Fri, 25 Apr 2025 13:12:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
Message-ID: <36904d64-68e1-43b2-baed-50b5fddc2bcb@sirena.org.uk>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yOP02cQ5XL5fxXCU"
Content-Disposition: inline
In-Reply-To: <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
X-Cookie: My vaseline is RUNNING...


--yOP02cQ5XL5fxXCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
> Sound machine drivers for Qualcomm SoCs can be reused across multiple
> SoCs. But user space ALSA UCM files depend on the card driver name which
> should be set per board/SoC.

This doesn't apply against current code, please check and resend.

--yOP02cQ5XL5fxXCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgLfC4ACgkQJNaLcl1U
h9CJJwf9FyfxB8FKyIfPm56zmMyOqrzsLC3SrHNmsQVsAZQB+rX//83ltMvZGR1k
8FETiGPTrmuvNc/JKIFH2BSZbwxWKUs8EHi7aPe4o9q/7bj8Jg3HW5IMukfuVQXe
PYLXMeR6Vf9k/FU27gDxCQgHGkZgGC+N5emST+Ph/3E2pbAUlCLuk1xhMbBstU5T
ZB5cmkX51LUTCNTHbDTpkMK6n9i70zsXLON9zUG0O7ccLyMI5RsNY9YGJauCeJ1l
aRSdfHZ/d3HcC3gNnEhKhNqQ4uK+xCbjKrI47irmoiVQEWCcJ54MbcxKbnioNqGG
qIju1+e9vuu0vb8sDyt7swxLpI4Afw==
=otAc
-----END PGP SIGNATURE-----

--yOP02cQ5XL5fxXCU--


Return-Path: <linux-arm-msm+bounces-76634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB840BC8D74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 13:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75EC13C4729
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 11:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF01A2DEA89;
	Thu,  9 Oct 2025 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+LDkEct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6E72750E1;
	Thu,  9 Oct 2025 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009788; cv=none; b=cGoMy2ZavTacgsIMK18NYFYgZNwRL5onvdugft1PsIina9hx8rXa2rhycjOfzEhsFr5l6l6ZsbRXVTj3whEBcN6R9ZVUy8jfB9RZXUWuVlCx6PF65wJ2Gc6YIfoJXEi5Sa17yVeiY7H3mfnofQjFzCpuuAHNs9CBS1Ck6CKmC1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009788; c=relaxed/simple;
	bh=LM2kR1/qlr8ZJiLJSckq1Nic36O9Dv79atR/L8G+TQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvkkxUKwe3OWSiW4tGkgBklM6Ua+CyjRFMiJH47XIrP0lpDKeV3nA3W56Gv84Y8UU2OU3AjoWOHJpVPNoNbixg6agf8XEbfWZY4wIkwVmOQzDFgSmFkncQ9lQulCDn+E93BO/3/Qt0b4+MQCMXA96cr/4pyk07GFHxkPqbSDm+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+LDkEct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2EBC4CEF5;
	Thu,  9 Oct 2025 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760009788;
	bh=LM2kR1/qlr8ZJiLJSckq1Nic36O9Dv79atR/L8G+TQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j+LDkEctQMOSOOgF/iDGMu8W+Qsqv6AsTdUB8znUcRt99m4PQIwzVTglWVd/glmyc
	 2Gz6yh0T2cZ1EjKdfhi2SMd5jBHSglFPr3UJ95hHQdWd9ya6jpl9WGOKzK/VEYd/r2
	 pWdRuZIqG7pTs8sOehuy2xzKUjrX7WpiIfLAiB3q3cY0zUkHCGzTlAkEYzXGDCsRRF
	 yiIlLJ1CeBBvELzoYHPFR74SFwBNVFN+60mQpLr73wKFyBsM1wS9n2XX8uwocRaFtU
	 HLbpnSOJC81dmWl+0Y8Wym9d4uzK4EfeKMeTDJHopSZEg8zwv6lrrUIOY/3NbVA+A4
	 Q8wdVNGSAC0bQ==
Date: Thu, 9 Oct 2025 12:36:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Le Qi <le.qi@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound
 card
Message-ID: <a4016b56-a997-45e9-aa5c-36a005362afe@sirena.org.uk>
References: <20251009023341.27277-1-le.qi@oss.qualcomm.com>
 <20251009023341.27277-2-le.qi@oss.qualcomm.com>
 <c469ad4b-9dc0-4ded-9736-1856e44d21e3@kernel.org>
 <93491a16-0585-4c24-8ba5-0e4222efb5da@oss.qualcomm.com>
 <b8b70358-7cca-458e-aeb9-fe9de8b51e03@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CQOyP8+wEwqLYXbo"
Content-Disposition: inline
In-Reply-To: <b8b70358-7cca-458e-aeb9-fe9de8b51e03@kernel.org>
X-Cookie: Today is what happened to yesterday.


--CQOyP8+wEwqLYXbo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 09, 2025 at 05:15:12PM +0900, Krzysztof Kozlowski wrote:
> On 09/10/2025 13:01, Le Qi wrote:

> > Yes "leqi" is my full legal name in latin transliteration.

> Heh, this email is addressed from "Le Qi", so I am confused now.

This is a relatively common thing with people who use scripts that don't
have spaces or capitalisation - they easily get dropped when converting
into a script where those things do matter, they often aren't that
important to the person who's name it is.

--CQOyP8+wEwqLYXbo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjnnjQACgkQJNaLcl1U
h9ANRAf+IQJHgSG9CAQ+IuFBFO+3jbKQF/2j+2lGT5HIzWHSZudnPydO7spmnsa8
KoSJR8RbHtiJmL1yvpFSpKCtNbR9t9oPxJN3S1sX3zdSEUDw2Oo8ErBQLADyZQ9J
4Dped8RDemfJtmjTt1D++3LiZfkUM0zjw9nRvUvvWfH11SfGLZ6FwSRPti9ymSUq
sT8gwHG/AEu3hVmzUls72QhR0nQMlnEqCGeg6vMfTg7hTj8rSpK9NYZ/dwediNF2
XL2/WlO3GcLyovEArYE6UYtq7ufF+jNR9ldndmzu27viE882+iOCx0emUZJGxBJj
8tZU8TSwXV1eZKYnM+FDamSAb2Fgkg==
=0hO3
-----END PGP SIGNATURE-----

--CQOyP8+wEwqLYXbo--


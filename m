Return-Path: <linux-arm-msm+bounces-40501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E479E5508
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 13:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26232810FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73DD217F21;
	Thu,  5 Dec 2024 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsXC9FTj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93849217728;
	Thu,  5 Dec 2024 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733400515; cv=none; b=jQ5JRhJHXFtWyiOXgrDRmOHbPIJF1UK/RJtymSDVpD4u+7lg34bGT0VW0pxpyaL6lyrTuGX7rUBD8hZVJXOlM+g9bg3YGKc73DCq08+Lt/O6ktlF3QBTSCer8NcPMw6cgFtK/hzoYNdPZXXrdg0EbGSZdqxMayfh3ELlDwLsRpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733400515; c=relaxed/simple;
	bh=CRcM8HcUGZ1oPIwRbpZsqpGz4Z4HyKs8jyTS9DrQqFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buN/Q0gIoUgGl+B6aTA7DaznU0d5aOaJzN+GSfYv8JgELTYkhFOq1Gs9+eLgL0Vbm5XpmsL5uv5+VZ6lK0XK1yH3zv7w4rsiKpvAB939xiWG4Vch/VUBPo1AhNl72OooMA/rY9uc3VKyKR/nEygngu76Yrk1MgMa5KUlFmLxqlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsXC9FTj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D92C4CED1;
	Thu,  5 Dec 2024 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733400515;
	bh=CRcM8HcUGZ1oPIwRbpZsqpGz4Z4HyKs8jyTS9DrQqFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BsXC9FTj59mVd/cXdbDHjJnxbAmrrgzaqOE6WEZBe8QpPBR/PubWyVUqZwy9fsnYg
	 MV0NVxDqzc9+M5B6lqvWUoSiC+TIlM01bsmLZRDjthLt4f82KkBs6S1GOAx2EKnzDa
	 7UUmrr62LzZ5mmk0c2Nl/x9S3I5wqq+nxcN/3Eb+1rR6U5xy+6Z9+UbFYgNEZ93Jij
	 H6rbhS6y6G3adjwBPm0Mg4quPykVSIuPEFy4Rpb8MmvS+bjElEHdeJvL6WRW/z7SCp
	 llMP/0nJAEuMutjoKF12nyQQ+u4Qalm2iNUPPDYAXAArAi6rimgS0N2CPOKdh1rL5w
	 RXHGdQVSb268g==
Date: Thu, 5 Dec 2024 12:08:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: konradybcio@kernel.org, andersson@kernel.org,
	srinivas.kandagatla@linaro.org, tiwai@suse.com, lgirdwood@gmail.com,
	perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] db845c/rb3: add i2s playback support
Message-ID: <ec802f7f-9570-468f-9c30-d5d460c5af28@sirena.org.uk>
References: <20241205023344.2232529-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wRRjdkdnfaBXCQ2x"
Content-Disposition: inline
In-Reply-To: <20241205023344.2232529-1-alexey.klimov@linaro.org>
X-Cookie: System checkpoint complete.


--wRRjdkdnfaBXCQ2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2024 at 02:33:41AM +0000, Alexey Klimov wrote:

> There are i2s signals provided in low-speed connector on such boards
> as required by 96boards spec. Looks like it is possible to actually
> playback something via these pins after adding missing parts here
> and there.

> I tested simple widely available cheap DACs like UDA1334 and PCM5102A
> and they works just fine without need for mclk. I guess any DAC that
> can handle 48 kHz and 16bit will do.

> In theory db845 can work without mezzanine board and this provides
> one more use-case to playback sound and not all mezzanines have cosy
> audio connectors.

I would expect that when something is connected to the DAI there would
also be a DT update describing that CODEC and it's parameters.

--wRRjdkdnfaBXCQ2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdRl7wACgkQJNaLcl1U
h9CXAgf/ZeQ2eD4OUMKGqs+7rlqAtvKdqGHABciEay3g4e8IhU/YTiE2HEW91wUa
NXQuVGCfqc2JkbbSrfprv6tBqjI5yqVYxd+aXA8/GzgLYhcRCJL11BvUCFnRjmZJ
ZpFwBWb3oOx5mXORS8ddovFEo8uZjkha3ZIX0GxLsncEARFu6nhpI0st+kPpHF3A
L4kTEFV7ww/89ajAhJRQ8qsOljN8uDyky43D0MmPeovQw0G9e8IVJthde/SXuFdo
o3puGIvl5q3LITaWhSH3NJkPbxHQYmXwsrhxrri4I8AYT5lXRazOVwn2ThXMcyN4
GIXoSHubXI+dMJoNV/qe7y8Kq2amcQ==
=j4hk
-----END PGP SIGNATURE-----

--wRRjdkdnfaBXCQ2x--


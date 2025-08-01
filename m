Return-Path: <linux-arm-msm+bounces-67347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4753AB18178
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67D587AC54E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 12:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688F82343B6;
	Fri,  1 Aug 2025 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LX2QbAFz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C27F2EB10;
	Fri,  1 Aug 2025 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754049939; cv=none; b=rNqBA9yU/2dw4lnofHVGIcatKD2418MD2881GEiIdtmpJ/gW/A6rm1cminUOjsFwacF8AZC6n3gAWD2ICZYm26QWFrT07pKHqoK+lvARzSdFMS0MPtDZ+2eKknvRTen+ALcJoSJzgNAetUSL6M2s0bY9as7lTq6p0B0KWNBliIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754049939; c=relaxed/simple;
	bh=GM7VspiuNJbWJfvQBErQDCx2bV8UH8sNG4aEdut/aes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nANwHoGm7axzMAYn5T6v2OZdAQzeByV2uz5Bm10/b6/qH66/qb6CpIn2dbxGMzhuMW6ZFuTNt0PyBlW1VjCC1LiBz5VE6BHiNh6Rq2QIfnsGfHbqV5cI7HZ1EnhAC4ZpwX7achRCa2VOpesm1Q89z0ovfYcCvjXfIGLA6brI5eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LX2QbAFz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF6DC4CEE7;
	Fri,  1 Aug 2025 12:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754049935;
	bh=GM7VspiuNJbWJfvQBErQDCx2bV8UH8sNG4aEdut/aes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LX2QbAFzWP4riFP/JJv51l2FyaX9fyPK28wMVGHcCfFKEtSFKVpZ0FgtSPOucSLlo
	 6F9mQvqm5SbUGEKvWIVf7NTkzhFFSQF2fpERwB3xIoq9+aJoX6tV0y0j2re+htZDca
	 4TQ/su42Nre4xrONdEbvGAZiJlHIUeul9jjsER/2v6tU+kfhy9CnqhrYZlssjmWglo
	 MCc+SQaTDvuVBDckvzUSTZz6AVRbpgDqBqAYpi/Vb85APyR5ixD4tqWKZ9AfeD/m7l
	 I7xHyotIH7HMM4PjyI7zDUo1D42nSzZfZ9OX1u3wkM/BCIfYQv1wRpF60Ua25tRbcc
	 Dg3O4I4BmkLTQ==
Date: Fri, 1 Aug 2025 13:05:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v4 1/3] ALSA: compress_offload: Add 64-bit safe timestamp
 infrastructure
Message-ID: <13ad9530-8e9a-4955-8844-aaf49146e988@sirena.org.uk>
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-2-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3hce4ALIJPGSBrPW"
Content-Disposition: inline
In-Reply-To: <20250801092720.1845282-2-verhaegen@google.com>
X-Cookie: Who messed with my anti-paranoia shot?


--3hce4ALIJPGSBrPW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 01, 2025 at 10:27:14AM +0100, Joris Verhaegen wrote:
> The copied_total field in struct snd_compr_tstamp is a 32-bit
> value that can overflow on long-running high-bitrate streams,
> leading to incorrect calculations for buffer availablility.

Acked-by: Mark Brown <broonie@kernel.org>

--3hce4ALIJPGSBrPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiMrYcACgkQJNaLcl1U
h9AdmAf+IBbNJ4JZ0K2alkJmSZ4ClSpvLsc0OJHhkr8kbAMrBOyFn67A/Hw95kxf
x3856yC73oTlON1VWQ1DCxThT1ubwy4iK9vnC8dmfKo7ZgkUVdY8dfcoVG7QPeab
ZySf3lBoPZ/S2gVGj6xJATKtWPD4llhjHtICjjKT9zhVCSZgHaY9W048zBrnEw00
vLxTiYQrYcDgygYjmfRkOBZw6z4n6C4jaesRnMUJfx5uUrb1kwDnPTsS+aIEA1MZ
uKirsvNKBuPvnxBbadHLFnuJfWHLBcKjGH5WkO8F5DFYMzW1UgzUpZJEhK0IZyMc
lP89DWksuDpwBsl8JcYJ4mW+VgxX0Q==
=8Yki
-----END PGP SIGNATURE-----

--3hce4ALIJPGSBrPW--


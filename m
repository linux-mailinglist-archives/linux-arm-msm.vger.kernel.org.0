Return-Path: <linux-arm-msm+bounces-40511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3783A9E572F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 14:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6EB928210C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 13:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B39218EB7;
	Thu,  5 Dec 2024 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXL2acNq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF745218EAF;
	Thu,  5 Dec 2024 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733405509; cv=none; b=VSKe50kuR6IpP4DfAf2EZdopjOGdYQvjLKyeyCh4RkGzQEw67esTqV+cMbTBmbm0yfuA7LXsSPiXSmLS07vc6WxaPeGFA9OpsHzEY4QtYOpRot3tuCvQk6dfizUVurJLgJ3YeVtuE+XiwNm8+EnSfnfbRCGDRu2zwf5YL4eaUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733405509; c=relaxed/simple;
	bh=WlgjCAS3F3ARAKZEAKQFnrIjg4AKSbxmMgw9Hy07CCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWFWiDMRUcunGNUoaPfn7JYbGuYANsWCSAOXRzMItB/fPcRDT+2/uK5+h+TYIM7P/InpvOiGLQNgeZRUp5KMy4qS1+E0eYe2y2pBR7XO77N4FnXYFseHR5NN2dpe9JLNbvJFU0t+TYF/cNTukjTSZEQNqSQ5bEQQsM4bkL8vLOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXL2acNq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E8BC4CEDC;
	Thu,  5 Dec 2024 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733405509;
	bh=WlgjCAS3F3ARAKZEAKQFnrIjg4AKSbxmMgw9Hy07CCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXL2acNq5+laWr1VhdgaBXuIKQ4YiJeo2ypPoNMc0niOp9v2TxSps34kFoGhXz+b1
	 nBjusCQ9hRRqM4+I64mLmuYVes585Rvbd2dSkQLst79TSGZPNKZT+dmRaCKO2Z5spG
	 G6WyHWCP8egps+ZwztSS80aa7EMXjgm0AEKgEGQ0xReZXAeKvxRXew6hHVLm9LNaKC
	 HqbVoCvzMFH4F83NAgdyajKdCsrzbEw8kSefIIYuPBWLYTubbdOKHMjS1tKnN4XObj
	 eFtSqYYi44Bnp/oOADtGFmPF1Pqyrwhbo1bDD0W6haoUKwwb7c6klLOFj6C9UwlDNt
	 4JJ7IXTar3fUg==
Date: Thu, 5 Dec 2024 13:31:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
Message-ID: <08e07421-8a9b-4535-9cd5-9383ca9024b3@sirena.org.uk>
References: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
 <c3d2477b-f12a-47dd-bf95-927e6c0d8fd5@sirena.org.uk>
 <CABTCjFA9DyRzca93qoS5_+sfc2RLfNVNqN14WVfKODjHykwGJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I3DviFfx2zdhxkGX"
Content-Disposition: inline
In-Reply-To: <CABTCjFA9DyRzca93qoS5_+sfc2RLfNVNqN14WVfKODjHykwGJQ@mail.gmail.com>
X-Cookie: System checkpoint complete.


--I3DviFfx2zdhxkGX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2024 at 04:29:45PM +0300, Dzmitry Sankouski wrote:

> This is the 1st patch in series, and NUM_CODEC_DAIS redefine from bindings
> is deleted in the 2nd one.

I know, that still means this change is broken.

--I3DviFfx2zdhxkGX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdRqz4ACgkQJNaLcl1U
h9Dcygf5ATT2STPmD4jp75AW1WldR0rtXa+QNBp3VmNI3O3U2tIDbpr4rVuICxiV
WdRUEb08sXFyWuHV4k294ySDbdl7umtfI0eHx4NCug915XsAzbzv0MzMFXITeV83
RC0NuOa05QdzhtVHfoRvvqBd89xJX6aoDQ+z1PKAkTy8a3iVwlQ4bMlnKJQ+HLk3
zlFYVAgXgBGRzXH78vJwUzx0D+KVjTFSt7atuxgRVekJCXEy5AnpRHgP3bwFMlSO
6eaUaJEiNpJydyukMrVLkOMr32R4+72Jax4mPZPVk/9ClJ0yo3d7jcpnztbO0KU+
Sg2CvQnNqtqYCrFaeKfx3v00NwPpvQ==
=dh68
-----END PGP SIGNATURE-----

--I3DviFfx2zdhxkGX--


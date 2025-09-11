Return-Path: <linux-arm-msm+bounces-73105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B30B53001
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A7CC1892103
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF618312817;
	Thu, 11 Sep 2025 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppYGLHOt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE053126BC;
	Thu, 11 Sep 2025 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757589537; cv=none; b=BL6qED+KUiNcT6ecvfketJIIK7hUIn5oNv0m4PrMPvA+eMnJ881aIeobqpHqDfxFwWxAnu2ie4NqPV6rUvqSah8PuupUR4R4IkVlIjPqREhRd3ApvMxFijIvny9U/+P2wxlRA2rQxTwOmbuJYrmKifwQpD+lLBVWN/QbMMrJf4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757589537; c=relaxed/simple;
	bh=1LxAfjPxuMG917X1MqeC+0Qq87gUbsh5VDPiGco/VFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePqsfCLFF6mlYCqtstedAC9uT1KwahRUtnoziU4qyndAD7FXrjbgER27oscmpB+oWJAJUfqGE7pHDa0iPWXg2Iy/5abbNkZSACjvTtImQciHqU9rHRQT3/dXbodIVPSR1ziJHb3uMIQNVXe6R9vMNnUWO5bQDVD0p1BNUbLRFYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppYGLHOt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183A5C4CEF0;
	Thu, 11 Sep 2025 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757589537;
	bh=1LxAfjPxuMG917X1MqeC+0Qq87gUbsh5VDPiGco/VFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppYGLHOtM2vaZSDkbqowuqB8hISfuuNHlxbPomXH57Io0KN8L48e4OW5xYK5ubaN2
	 OmlU5QG6oaeqPdILIafek7s+/UTg4fIoldzwfebkDpegsSAJy4pNlvu0cT+DkKEVAx
	 6ic+k/j88/6oEkM0o2Ztu32Uso7pcM5R4lz5FM4gcDXCeCXI6doljN1QomuknpgZBl
	 AkvnUgmUOUmnxlWeqCgj/BjaH0t0AIDC5tbcKczsasUqeSRyriRCQIjbM4HYcwxSCg
	 dMUoyI/cHhtx6Knom8kVFvRa/jFQfofVjmGL4I/BAljP5T/8Kxb/XkX57IhNfO6otX
	 uRQgl3AZC12KQ==
Date: Thu, 11 Sep 2025 12:18:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
	prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: Re: [RESEND PATCH v4 0/3] Fix lpaif_type and DAI configuration for
 I2S interface
Message-ID: <25cb27a9-f81b-4bf8-996c-03044425253e@sirena.org.uk>
References: <20250911063612.2242184-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nJ/Zyz6nZp2XFF/R"
Content-Disposition: inline
In-Reply-To: <20250911063612.2242184-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Cookie: Your domestic life may be harmonious.


--nJ/Zyz6nZp2XFF/R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2025 at 12:06:09PM +0530, Mohammad Rafi Shaik wrote:
> Fix the lpaif_type configuration for the I2S interface.
> The proper lpaif interface type required to allow DSP to vote
> appropriate clock setting for I2S interface and also Add support
> for configuring the DAI format on MI2S interfaces to allow setting
> the appropriate bit clock and frame clock polarity, ensuring correct
> audio data transmissionover MI2S.

You previously sent this on *Monday* - please allow reasonable time for
review.

--nJ/Zyz6nZp2XFF/R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjCsBoACgkQJNaLcl1U
h9C8Awf/VLSb1fxaHygc3SkZp87V4K5m8Wn9dfhp/6F0UZXkgADb4zj+jbWnsTe5
SgiyFisBobL8S7WnPdWsFallMXv8MdISm4YSsXxolFTb40+0BOwSpNLhUIN1VsaV
20Ry1PquKTnOJptQMdWPKEtKjhiryUCYw+z8g0J+crvg2PjhqpUoQ3xBcvXzqceD
pslC9wD06R+t0sMISOqoLrp5SbEm2uZAeQzsY6WxIviLQkz30kPccqjRzi7Zi5qx
IqXhNJveGNj7mAl8AB6eJfpb01hg59j3kv1DIRVX/67kThj1/7omk2T/R2Riy5Im
vwU0o3nvV+K7AsUWuJzepNpMp+i/Rg==
=jJb5
-----END PGP SIGNATURE-----

--nJ/Zyz6nZp2XFF/R--


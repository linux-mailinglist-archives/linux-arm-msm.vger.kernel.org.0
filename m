Return-Path: <linux-arm-msm+bounces-80637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C264C3C3A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 17:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D6AC64F2C71
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 15:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7AA2E6116;
	Thu,  6 Nov 2025 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9xd2BTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C443C217F2E;
	Thu,  6 Nov 2025 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444794; cv=none; b=WCYVuKYb495fa1v87/7kgbmhMRXL0NBGRvdGDU1Xv2Ll0logsSUISbrG+k4MoLX1MZSJAe+Q3Y8oPJAQsSQNXnusld4hVZLHQy0FmHbxDh6Li+y3TDdRjUoObvJNSwAO80EpuaHAD848fNEyJIwze3arDHDjGx0pqU+83ugLLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444794; c=relaxed/simple;
	bh=4TgorRHksvljH1YyBF/SSZyBPVzPnDsdVKYVlo5RHo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6ozILwdDufL7PVVTQ3LtIOF/QXhadr32QgVm+Y3fH0twRQtojpop/TRqQGErbuS7vT72x7Q7+bLiCwxQGsQk7woaMhysSf1ENCKWwaw3vLwTXeu+CRkqcYEhiBvAve1EtcaSo7Y8u9gh7281jTqY/fI3+I0ecJCQRKUAXlYYFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9xd2BTo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B92C4CEFB;
	Thu,  6 Nov 2025 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762444794;
	bh=4TgorRHksvljH1YyBF/SSZyBPVzPnDsdVKYVlo5RHo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9xd2BToJapqh+OpvYoBzdbEbx+duiGcEfThO9M6dBFqh9qe9RttyRmIVxAfytTvh
	 TEwVpNU/vXk8ObF2I4PxvNUa2Xnpm9af/vixDpp0Ej0oycz69w9d6oO9LfJ44bswpn
	 cVKbVBx89gKikCBY3VgR7tD3TIAJVMYJPIkxPwtqbLOuIk7yWaU1tWUgQ6OkYOjGa4
	 Y+7dxa1TL+uLQAs/o5TKsmVuJr2tYZMcn/A7Lct/LpZLjWQ94VH5qCW5m8NoLO4o4N
	 9rpp8BHIUezWH4qdFxWpHcZaVx2jr+VvaPFqlJ/KAXQFc9GdKaem3uZ9HEine1GzaP
	 lGDw2P7FWY/cg==
Date: Thu, 6 Nov 2025 15:59:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: codecs: va-macro: fix resource leak in probe
 error path
Message-ID: <aQzF9zOQcsupLKhT@finisterre.sirena.org.uk>
References: <20251106075055.555-1-vulab@iscas.ac.cn>
 <20251106143114.729-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ncTIgGJpmcgHvRwK"
Content-Disposition: inline
In-Reply-To: <20251106143114.729-1-vulab@iscas.ac.cn>
X-Cookie: If in doubt, mumble.


--ncTIgGJpmcgHvRwK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 06, 2025 at 10:31:14PM +0800, Haotian Zhang wrote:
> In the commit referenced by the Fixes tag, clk_hw_get_clk()
> was added in va_macro_probe() to get the fsgen clock,
> but forgot to add the corresponding clk_put() in va_macro_remove().
> This leads to a clock reference leak when the driver is unloaded.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--ncTIgGJpmcgHvRwK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkMxfYACgkQJNaLcl1U
h9ABIgf/QhXusdY6vysmdYD/HzBhHJsXVfkgw/cwMG4rRx7S0WBkTgyXjWt4c/To
bG2vWTt/VdPhpShF3OL0FqWzzOJ5QZrjdmHsiEXLMhupdTwNDDWND3U0G+6gmr0j
stSGjf6OzXB3mphvxz1YrWwRGjYiBntQxHIAFZXVGjAbyR/21vGYSLe/KWHf4lcy
ILvnstYfVlidzgXFbNyUOZuGEsrYYPV8bnZkEGb2kjhSctTzimIHjU7zujSb284K
mwk6gUd6yoFBhNwyjRLVfgweorhrgNIG6dThaH7gUTowpcqSVRaqvhBzBgrbYqvT
MHsAX6RoLUx4QXBA/RO468l4r7bYVw==
=AByG
-----END PGP SIGNATURE-----

--ncTIgGJpmcgHvRwK--


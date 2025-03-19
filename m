Return-Path: <linux-arm-msm+bounces-52014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C17CA69445
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 17:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72FC2460181
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D0C1DE884;
	Wed, 19 Mar 2025 16:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irUK4UUL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EC31DDA2F;
	Wed, 19 Mar 2025 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742400236; cv=none; b=Tmjg/i/93d7kwHHaQGBhy00i3k1xi3ywCcPmsFkS+r/JZWqYyYou7MhflRmzAF/NKzB1HdqDgATIMPe7nFD8L8dvKtUVYQgMDZe+Tw8DmrhE3ZrQSnzlEF8jYPQfsLcgk6/c8SNEsD+EoosbQ8FujlJGV+Ee/b7EPSsxfWIq0tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742400236; c=relaxed/simple;
	bh=Vf5UegY6RU2as6jwKvb45nmjBtXolykv1xNJq+F+exg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHLS4FcwcYL+9X7l6Kih8ry8huitHP1SGk3HzBKYvlqvhCyXXYRblLsZYP5tFqfQQl791euC2wz/EK4cfbuYvQZ2XX/1PpsWDJY3GFBeuPYBAOT226ax1LZOGtYueDjVw2utWG2pNpkiccatzsMUI8L7bNFTgYEop812TO4lETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irUK4UUL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F42C4CEEA;
	Wed, 19 Mar 2025 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742400235;
	bh=Vf5UegY6RU2as6jwKvb45nmjBtXolykv1xNJq+F+exg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irUK4UULhUYuw26TD/YmdQM94OxtCoe5o9PRu2Qm+NHTn1eEglxZv76u3edQA0LTb
	 P/vdztgWg9tU8vUAqFr37PPK5MBpAJ98Xyp/s7bi0JZBEt8z0p2JqEHfeIRIDh/E7Z
	 r51HLt5QEKzYqaDrityHaOxyyR9FIat0xxeqwxHlMu7wVrXUSvRUyoMci6gyx4mbAW
	 eTHo8nSPB+SItc1BTixDMNXQiPDAOVkhlcLT29GYQaSZv1jpM9FAbNzRDuEuaHtv/u
	 AIFvtPb18T/9fi3kh1t6HnQ+aefOFp9omjC1UJzyEbWfMRs92tnzyI9u5Xznozvidh
	 2LqOkho3ee1wQ==
Date: Wed, 19 Mar 2025 16:03:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	andersson@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
	perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: wcd93xx: add bindings for audio
 switch controlling hp
Message-ID: <51dd7cb2-0c22-4043-b3a1-fa8410903cbd@sirena.org.uk>
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
 <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
 <4ie22uuz5tpg77jto3c3hec6lhonr44hrjda7jk655axlaxvba@u3atd4gcyghn>
 <660115f1-d1fb-4fd7-a453-e8c177be9eed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q0oIHXznJOnjkPEP"
Content-Disposition: inline
In-Reply-To: <660115f1-d1fb-4fd7-a453-e8c177be9eed@linaro.org>
X-Cookie: Chairman of the Bored.


--q0oIHXznJOnjkPEP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 19, 2025 at 03:59:23PM +0000, Srinivas Kandagatla wrote:
> On 19/03/2025 10:01, Dmitry Baryshkov wrote:

> > Is this regulator supplying the codec or some external component? In the
> > latter case it's likely that it should not be a part of WCD bindings.

> This is regulator powering a mux that is driven by gpio which is part of
> codec binding. So I would assume this will fall into the codec.

> Where would we fit this if not part of codec?

> Unless we mark this regulator as always on.

I would expect that the mux would appear in the DT and consume both the
GPIO and the regulator.

--q0oIHXznJOnjkPEP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfa6uQACgkQJNaLcl1U
h9Do7gf9FTrhbwuWUqC7of9MeF5NqEmpBeo1duXfoN+W9aE8I3cy/f/fT2QyUQWm
FJkdZ056lxtJdoZsphOzxAJJpfnXVerUTvmK+ng2PHCBAfaXc8ubj2EuVDmarR25
JTn1GmkiLEm98tqvt/KCVkSU2WGtXkDpxjytyo8Tj5fM98xMtwSChPcSFBVsVznG
NSVa8uytrk0NvOGzi8TxSN70dCrD5G560pmbnVXGMWC4ZdEyV5kBsYTqE5j5MYwz
Hi30Lshw8epe5u9IFD+cddr7pE9kvSBDV1MFjY7B2+eZQBQ+w4DKQX+07mvsItiE
w6sY9eTqKWDZzTtz4dBxGUg0RIQHoQ==
=fpT7
-----END PGP SIGNATURE-----

--q0oIHXznJOnjkPEP--


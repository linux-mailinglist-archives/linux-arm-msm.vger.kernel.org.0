Return-Path: <linux-arm-msm+bounces-84109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA625C9C561
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 18:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E17F3A2D24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 17:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7350D2BE655;
	Tue,  2 Dec 2025 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhKfO2A8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407831A262A;
	Tue,  2 Dec 2025 17:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764695310; cv=none; b=FdtuPZOFHh/i8ldQfy5E5IMT5Pgut4LTr/ltyzjz4ESsqVvp9+wxTvG+Co72oWH0pnVC9X9tWkv7VbuUgzltC2wPnlt0wYDBWlEUq1BnLxVGlGbQLgI7b+I0HG+zhawiBLLUsOcO+84XNtRiey8VPS6g+AXVjn/onDth84f+0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764695310; c=relaxed/simple;
	bh=ieY+CarKhRxibM5rZwQkWt0RP9OzfnZZD5pQPMi4pSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZoFGyTEtpqHrcfMm05hvqlACtEb0cqHrtRJXf2qZXfZj59s5lC4EmogKDxWJ9y7cCULRsHB3/uf1T5N0XI1ubTk9KI6DvJ+HrF1rQYWlCM+LzqGSznA2MUutxylpcxLmz7nZrMMd9gqGXrHfd5S4eB8+GGNUy0VjKGB3+Cy9zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhKfO2A8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F78C4CEF1;
	Tue,  2 Dec 2025 17:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764695309;
	bh=ieY+CarKhRxibM5rZwQkWt0RP9OzfnZZD5pQPMi4pSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhKfO2A8z0jlkWR4WtisKmOc4DEvzyilvSPnCkn7sOivttiD4HnjRcw90FjxQcp77
	 WCkP7PuExyghmDlQINRfHfWgwokHtFQqXnSNk5yRFzLu6bGvNlz8GTKGgjtBOH8GmM
	 3jqNGAsCiZmOqtF5GvWKM8GBpZ0DghB/4qrawZL707o96/1cgNYb3p6JsA+zK5PEAV
	 PVoJWAile+s0QTMk+j/kzMUHBGhj8+xcNOaCQizxpDqxAiZ8VEWRUER+Gst6rR3bpL
	 K1Sth+IOSF4NsNZhm0S9SpsBy4dubhGPaf9aqJLAMeiyNESzYdAXyNIl/vmLCNJdf4
	 MF6NY2P7HfbqA==
Date: Tue, 2 Dec 2025 17:08:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/4] ASoC / soc/qcom: Constify APR/GPR callback response
 data
Message-ID: <3eef7aee-a3b2-481d-9aa2-262d717970ad@sirena.org.uk>
References: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sipniroWj3oprzj3"
Content-Disposition: inline
In-Reply-To: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
X-Cookie: Beware the new TTY code!


--sipniroWj3oprzj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 10:40:22AM +0100, Krzysztof Kozlowski wrote:
> Patch #1 and #3 touches also Qualcomm SoC file, so this could go either
> via Qualcomm SoC tree (with Mark's Ack) or via ASoC tree (with Bjorn's
> Ack).
>=20
> I propose to take it via ASoC tree (Bjorn's Ack), because I am
> constifying things there already, so less possible conflicts.

That works for me, Bjorn?

--sipniroWj3oprzj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkvHQcACgkQJNaLcl1U
h9BSaQf/W4lHVLb/ICcvRVRV4xEmZAvcE6KQGaFO3SZllGPMfcwp1goMKpjbKUzR
zbJPi5uDrDIpYqaUmV1TQdurHHQyJbvKqfjo58BhuHg0L/xNTBvnU4yk87gy6Xoq
xqoY84kSHiKcNqmCi3O8Lp7V4eU/m8jOAWHdxA6Xu5rFXU6ts/zWzt54n3ftnbxR
LHyPmh8GOf1IPs21c0h0csakmzhXMpdn9VE09/tOwkkkQ6DdTF0W+vuenF576ekN
7d8VwUPWjToQGc6yp5t2navxQdOegn7Bcn9DdxWGaSNh3uGk2ySR3M05MvQP+DAD
PBu/6p9X8HJDcoFBjSA9LoXcM/xkng==
=YjqS
-----END PGP SIGNATURE-----

--sipniroWj3oprzj3--


Return-Path: <linux-arm-msm+bounces-68055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A30B1DD5F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 21:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 342233AA0AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 19:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2997A267F48;
	Thu,  7 Aug 2025 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U72ma2+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34702222DA;
	Thu,  7 Aug 2025 19:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754593803; cv=none; b=HjkP8hBPBHQR4Dj2+NaHLcfWj4JbpK1j7CX+U61kpszk98m7S+7DFwhXxb7KtY6k8Qc7vmRjKPUVmq/CG5o6wqkDTbxsWRqzxCU6mKSQ/+umaW1pvIghqG9lNgxK/2z+3TNyv/i+RsrsUeLzpmdfUarWiOqGvyMfcKBjgjS8AJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754593803; c=relaxed/simple;
	bh=PcBVixaPhZIma1L0iYmSkiKVbdxAykP6NlB0vN5Hd9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHYIxgZVdvoeNwC9JgiPMZEB7iU+p94pfomeGyx09P58Axd61XE7BOh/KxcX0DeNnVtPaHaoG2dTWud6Wd0Xa7XR3a6PBwC1l9SF5MK9vEY9QBNgI/CcR7maiy3h2UmRBGvut7G/E1V/Ic+Y/y1JomzobedKQEEeBg4NKQ0g5Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U72ma2+j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846AEC4CEEB;
	Thu,  7 Aug 2025 19:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754593802;
	bh=PcBVixaPhZIma1L0iYmSkiKVbdxAykP6NlB0vN5Hd9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U72ma2+jatKX2tdaIBlq82L/EbRZmu4VJqzECPOaIGMb5HdtGfpvr5N3eTwQ/aPA5
	 9wWkvLV5pfDVm65CCodhw1kgGX0aYz5fqClorxgeFBdkHCikGQmwkeiwQEwF4euV8S
	 4Nvlsdhvl1AfgTrORb8wfiKAKCCkmyIDtqDj/l+YNlN1kmHaspMusfYyaqWXPWGba5
	 ao+uAIV7N8S681aPK4QJkdXgJ7FnrxsZ8maorziVw+xHXIzq3McR+7TB2che+XILW3
	 q+K6WCCPtcsUDzG1b2vHJykKq+VsiPeR5Dyd7SvthO+aIhzYI+3tCzJTKqnacUfO8o
	 NwzM41d68w/Iw==
Date: Thu, 7 Aug 2025 20:09:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
	kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
Message-ID: <14566f49-7f7b-4583-98b7-8a473054f7c3@sirena.org.uk>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
 <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
 <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
 <acf89420-743b-4178-ac05-d4ca492bfee3@sirena.org.uk>
 <599b8a4b-324a-4543-ba27-0451f05c3dfd@quicinc.com>
 <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
 <8c7f8cfc-2090-449e-b6ec-688a0021bac4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZQ/9gvUlZUpmI6Wa"
Content-Disposition: inline
In-Reply-To: <8c7f8cfc-2090-449e-b6ec-688a0021bac4@oss.qualcomm.com>
X-Cookie: Real Users hate Real Programmers.


--ZQ/9gvUlZUpmI6Wa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 07, 2025 at 07:43:15PM +0200, Konrad Dybcio wrote:
> On 8/7/25 7:26 PM, Mark Brown wrote:

> > Note that that's specifying OPPs which is different...

> The microamp properties are in the top-level, not under OPP if
> that's what you meant

I mean the OPPs use case is an existing well known one for dumping stuff
into DT.

> > That doesn't mean that it's a good idea to put that information in the
> > DT, nor if it is sensible to put in DT does it mean that it's a good
> > idea to define a generic property that applies to all regulator
> > consumers which is what I now think Konrad is proposing.

> Yeah, that's what I had in mind

> I was never able to get a reliable source for those numbers myselfe
> either.. At least some of them are prooooobably? chosen based on the
> used regulator type, to ensure it's always in HPM..

That's what set_mode() is for.  Like I say it's becoming less and less
relevant though.

> That said, our drivers cover a wide variety of hardware, built on a
> wide variety of process nodes, with different configurations, etc.,
> so it's either polluting the DT, or polluting the driver with
> per-compatible hardcoded data (and additional compatibles because
> fallbacks wouldn't work most of the time)

That's really not a persuasive argument for adding a genric property
that applies to all regulator consumers...

My instinct with this stuff is generally to avoid putting it in the DT,
we see far too many instances where someone's typed some numbers in
wrongly or discovers the ability to drive the hardware harder and needs
to tune the numbers - once something is ABI you're stuck just trusting
the numbers.  That said I'm not going to stop you putting something
specific to this driver in there, I just don't think this is a good idea
as a generic property.

--ZQ/9gvUlZUpmI6Wa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiU+gQACgkQJNaLcl1U
h9A6+Qf+P9rMcaISs2p5ORHNQ/KdH3BurrkFhaK5oNZcLsN/cOuTcSjAMt7Ln8rw
Nj+TKRTJ/mByw4x7wgCunOwGRcUVJ840ilAA1jAsHIQZMKUCDqTNfLRc1PmeqG/e
pdTpE+It81dpY5XpoulAhwu8h8fc9GX1YFw3/43/NWYX4NkGh94r8sLDtjv8jHwX
enIET9goOxiiyfECGkBfpwXN8fjUVQX4Y9f5LeIiunXQk3/tRwzNqncI2m9+vAsB
aSXD7Jg9yvrIzgC97tLsAVuD8weoo4w9YBYWczMwvmvywLXPgzCIjx1tL/6tG2Cz
gJsPOQ9NajGkZ8Ud/Q5EPaqyiGb+hQ==
=V89y
-----END PGP SIGNATURE-----

--ZQ/9gvUlZUpmI6Wa--


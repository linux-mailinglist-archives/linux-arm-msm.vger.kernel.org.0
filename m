Return-Path: <linux-arm-msm+bounces-64513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BECDB0168F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 746D2170B30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 08:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2F3221F10;
	Fri, 11 Jul 2025 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ip9QS0q1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F611DED77;
	Fri, 11 Jul 2025 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752223077; cv=none; b=ARtBRD+GeWtHdcnyW5dO8Vlk/Mm9nzsJ+B1ACJPTb+TElSoNZnYatwr/yyv0gISlWEr1je4lonFMGyFxe871gAp4Di61d6gGfFzR3ka9Mi2UL2p4W3Vek85Zv3UBYeaPLu9c7uK+iOri9EKuG2hEhEIEe0NCLlVKcNI/hXofb3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752223077; c=relaxed/simple;
	bh=eyV4X++/VGEzxaguebcqSjDqRWFXr+hAR8/E84bBbo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjwoL0UYP08y3ftRM5fBeA1YXTr2PC/Q0xjC9v89E4uFw/4+9MjJzTcZP5cHufTFIyYgcaCWfNA/qOAGccY229tPeJKPhoo54syNXiwRVSI698ZeXE5z4uX+Yx+LQqIuRDJr1luGUb/OwLFGHp/rtxLzc2kliVXFf7Gtizms0kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ip9QS0q1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DA7C4CEED;
	Fri, 11 Jul 2025 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752223076;
	bh=eyV4X++/VGEzxaguebcqSjDqRWFXr+hAR8/E84bBbo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ip9QS0q1Oh7taDoQfGWcgwPMmN/hoN6SmTPcIcH9mZ1EjLwPjZC+5SxmrHICfI/Y+
	 Hkyqi9EQoNA0FOfl6OBmW8rgypMiyHSGB8wRoVCbljOJ6eoUOZU7n1sT90PP9KrqZB
	 akE6Oef7QNgRjYuqgumt3epv/VBaVmxVx3369AZqOM2t/5tmv/JsO3Z8EdkmIeD4tI
	 gwnmD1cc94RLaa6jS667Zh7lkwj44Hy0Xkk7dGc/rekbhlz+FKVgOw7W3GKrFbSMSr
	 4dATtbLHVxzxiS9Apilik6ayWhjZSVG62W50oTDV6NtWc95q2NycUTwM7nPoiLazlu
	 85FwllO+rm4Fw==
Date: Fri, 11 Jul 2025 09:37:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/6] sound: convert from clk round_rate() to
 determine_rate()
Message-ID: <aHDNYFdAefD0iiyM@finisterre.sirena.org.uk>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YnpWRE/TMlIzvZ9t"
Content-Disposition: inline
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
X-Cookie: Do not cut switchbacks.


--YnpWRE/TMlIzvZ9t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 10, 2025 at 11:51:06AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the rtc subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--YnpWRE/TMlIzvZ9t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhwzV8ACgkQJNaLcl1U
h9A6mQf+Mw4rOQ3YyKPyHMvM67lMhdwxJj81LDMaZnJrgOzRgYNwVehAF6z/3sjh
qE9RvCkeO6G1c5ngoFta8gB3Ba2chjtNsYln9QP8sxMhhzsQ/7hiiykf6NxALakJ
DR9tsOcL1vl2WKaCZ1HitICcSuWY6cLbTUpH0q85mv6rH1AJ0WdN8HHIw++p6m32
NMwkqwyG8z677hO9RdI1QwT4itEoh83UzLWoORxBTto7L/WnyP4uFrT2XefgEjE2
tBWfG9WPoG8Howvt2/8o+nnLbVwOnxeXkPE4TfC01MyK82f9voFg2EHSpuKiR9Gf
Gu40mCfxcvb/iKz7V9zpon/05BytBQ==
=OeRb
-----END PGP SIGNATURE-----

--YnpWRE/TMlIzvZ9t--


Return-Path: <linux-arm-msm+bounces-52880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1482A7673E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 16:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF592188A1C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 14:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699B81BDCF;
	Mon, 31 Mar 2025 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7QfCNsy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306D34A35;
	Mon, 31 Mar 2025 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743429659; cv=none; b=RlKcXPZeMkczPzCHLcCMMTl7LlOqJn77gPweGn8i6yS87KVmmAdaPhK7Nwqc1q8wiVjKVHfWypXMYiD9ao9ZQkOoBmf7IHTfStL7tvxAgLAcuA/66CDUr48nO56iZ6B2IOIOwie0uuJ1N0+n5XhdeQf5YqWVXMNb3m5Z2sF/PJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743429659; c=relaxed/simple;
	bh=qx7OAI2GDeAQiCeEnYoKh5egoJWKfbqbwDFIFemysCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwnqlXcrzR87088cgCVzaYNUnxqmWA6xRIrtup++Mh93f9c7vAaohKOv9JMUEjGENhV/ywHNyW1v/PKol7sXyeJcOT6PryJynke9yZ2sX0rhxI0q9BhkOUqxnNBXTNF5N+HD6jUCcc7zt2KeKI7iAXfd7DEGyGBMjXt/LBDL7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7QfCNsy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87872C4CEE3;
	Mon, 31 Mar 2025 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743429657;
	bh=qx7OAI2GDeAQiCeEnYoKh5egoJWKfbqbwDFIFemysCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7QfCNsyPSw46Yzt3ILIAsnJy/+D/Ntx2rchwd/Ao9AXqmMITXb42v65oVlJ1IexH
	 81Mr37M2bV5gzj/sBT5CC6Ve63CXhO8B6pdfzaoenI/iNkBqh4A/1ouAJrOB/pn4sj
	 C9NZisBfS2Rh0PQiCNCvNzeMk9icndFHLLmnZVawYJzHye1jaMun2H9ez+lO5ogeRQ
	 hb+oSgmPSBBMTFV0dnQygJm3EK5Zm6VAg91XX3au1X/78Vi1eFdJydKFC9pD+25/aF
	 J5G2SEzluyoaPkK/pP4RP/eOGUnqEI8m7N0jzVdZHtcbfXMBJhDBtarh5uPQZwnQDa
	 QFMhW7SNDkDxw==
Date: Mon, 31 Mar 2025 15:00:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: srinivas.kandagatla@linaro.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
Message-ID: <78e8c1c8-8539-4b91-88ad-c802cceb8579@sirena.org.uk>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
 <20250314174800.10142-4-srinivas.kandagatla@linaro.org>
 <74214537-ad4c-428f-8323-b79502788a66@sirena.org.uk>
 <Z-qXBfrZOEkOpMHK@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j0KmjnF/an9ogldR"
Content-Disposition: inline
In-Reply-To: <Z-qXBfrZOEkOpMHK@hovoldconsulting.com>
X-Cookie: The Ranger isn't gonna like it, Yogi.


--j0KmjnF/an9ogldR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 31, 2025 at 03:22:13PM +0200, Johan Hovold wrote:
> On Mon, Mar 31, 2025 at 01:32:36PM +0100, Mark Brown wrote:
> > On Fri, Mar 14, 2025 at 05:47:58PM +0000, srinivas.kandagatla@linaro.org wrote:

> > > Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")

> > This commit doesn't appear to exist.

> I think some tool (e.g. b4) incorrectly indicated that that may be the
> case here, but the commit does exist:

Oh, actually it's a parse error with the way the tag is written - not
quite sure why but for some reason adding the next digit to the hash
massages things enough.

--j0KmjnF/an9ogldR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfqoBQACgkQJNaLcl1U
h9Bjiwf/VUSr9Yd9KkaDlTgIuPlbwQt58f3t6htOYFLumOB6nikv3gbF46KVEFk5
4Jch+k1zO1ZdKpmXtXUEKEIYd70ywHFwMOj37NDKBMrFi4ytsdkAqDf46Mcs1hG7
T/Tbv9wwDOx8kjB73Rf+fh5yCFZa7k7S6M4ALJFFX6TKvW7ghhzCSVT1A6CI4Q7R
n4Q/jNymrMxhQhhODlRDYN5xLdlmL4+B+TZgWgaX9bpBt9OkDmzmXSsgRJ690Lu6
Z1iHemZT+1kdmbtscCPxvnZoLRlMeAzPkFK68W/8Y5yJs/FPXuAE7/4Sc6U5gnCB
Lvz1JEBUItNQLAPUzEX5wU/ChfT9gg==
=jJyr
-----END PGP SIGNATURE-----

--j0KmjnF/an9ogldR--


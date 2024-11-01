Return-Path: <linux-arm-msm+bounces-36747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 420D19B92C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 15:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0690328417F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 14:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A3F1A2C0E;
	Fri,  1 Nov 2024 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7F5s+pc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F6DEEC3;
	Fri,  1 Nov 2024 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730469795; cv=none; b=TJFvg5uIXU1UQHdNS10OdElmv7eBrUYmyyQJAfRwpMe9lnKVlDzh6gxtHMwAssGPGS5v4ZZUdG7lDG8xgFTUx2DfJ0By3esA9jVysIX2A6zpgKhPnJtyxa0FKnnX8GjSMMPWe65q4Db5tAqzDTKW5Mvu889IbYGI9/FUr0yqo98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730469795; c=relaxed/simple;
	bh=3fmiRRKv6CyjOzpAzqggovX+F7OPwg9bdZvteX5rG1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pd+Zv9Sfmc7/oDjT0QUxSlObKrHkUWvHP5yxJ4osZGNIdMntf1Rpet4Qjh2hXR5Hjjy5K1WZ7qEFSFg1Few76jgIt6V2NwIXJ2oC3DDRAreCjVnlRYajfMjLOgnymbVW9QqFyo3be8A9D/MMHbRQxg1ts+5TOsw/1GixM0IqOHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7F5s+pc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD78C4CECD;
	Fri,  1 Nov 2024 14:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730469795;
	bh=3fmiRRKv6CyjOzpAzqggovX+F7OPwg9bdZvteX5rG1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7F5s+pcJwDFUCCGvjpV44bzRyB/44CythA1SEDQ19u8xC9n1y54xkPzxhDQ3ZDHR
	 vJCtKkbSrc+g8JzzGs86F7gvMtkzBmz64moT1rmAFOx1Fv++aZsXBsrr+4AWXo6xPm
	 xRyYGeVh7x2679f0C3Yho3MzW7Oq0bJ3BuvNB2EQ9QbyaQYgXrqaLTyxfXYboVDBjS
	 N9JgQWi5vmrkbOlM4Ypn6zRruSHYdpeBEhzd5y8ie+MCHwGagUx+g5dmxsMpUfvsO6
	 cnOvb1TcFLNOZT5NFZh3qNiGksNq8kiMaLT9gKkttH2yCZSb7h6e6JL5aH+bomQZBO
	 6rmXSt0Dgnlrg==
Date: Fri, 1 Nov 2024 14:03:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
	srinivas.kandagatla@linaro.org, tiwai@suse.com, lgirdwood@gmail.com,
	perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 07/10] ASoC: codecs: add wsa881x-i2c amplifier codec
 driver
Message-ID: <f4c36da4-0e31-4fa8-9fb7-583824db9597@sirena.org.uk>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-8-alexey.klimov@linaro.org>
 <jqsa7lsypf62uqjydqbyspvtnt7iuwxclfwuyatgee2zgduwvd@4wwagvovam4k>
 <1b5a24ac-e4be-4cb9-8546-6e2c39b6f9ed@sirena.org.uk>
 <c6588be0-08ba-44b6-bcef-4f50e8bcb083@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hbyumtP7XUt/x27s"
Content-Disposition: inline
In-Reply-To: <c6588be0-08ba-44b6-bcef-4f50e8bcb083@kernel.org>
X-Cookie: We read to say that we have read.


--hbyumtP7XUt/x27s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2024 at 02:53:19PM +0100, Krzysztof Kozlowski wrote:
> On 01/11/2024 14:12, Mark Brown wrote:

> > Please delete unneeded context from mails when replying.  Doing this
> > makes it much easier to find your reply in the message, helping ensure
> > it won't be missed by people scrolling through the irrelevant quoted
> > material.

> Just like usual, I deleted quite a lot, trimming unnecessary context.

I had to page down about 10 times to find anything other than a quote,
including the whole change to wsa881x-common.h and all the includes and
defines in the C file.  That first comment was complaining that the one
line immediately above it was missing a const.

--hbyumtP7XUt/x27s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmck35oACgkQJNaLcl1U
h9Cjawf+K6umz7DbqI/UagsOztD24UD4DHuGODSAZoYUr3sH3vwE1QPaOdT1R1qY
rvEoqBU2+QkZWP6cvkJvCr9TPpwkA9urR+30B7EjPKhQfIu6qG9HIeSvz7UKtEO/
8UeodH89A01Ui9WR1thNC+g1RStq12enVkqWOrqnVhOexm+8s1C9aNapyfvjktEg
E1Yc7wI8spw57b+WsIu8bXsvLFsHvqFJxJ119sC5OprTcaERPpNDgIQPP2d99L3X
HnZWpZhw1z9o0UAv0HxHVL8TZDjnDyoPAj9uTYQXP1JBvmDuqie8YzQTGIaR936K
+dNOTOPK8hf/CUypwS2kmeJ/kia0vA==
=LEvi
-----END PGP SIGNATURE-----

--hbyumtP7XUt/x27s--


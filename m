Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16FA32C8447
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 13:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgK3Mr1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 07:47:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:43172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgK3Mr0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 07:47:26 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F6C820691;
        Mon, 30 Nov 2020 12:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606740406;
        bh=PoKaM+9VAqr74Km1DXBLBd3BN67RnM1YtLNRRtHIVdo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BFoB4OgHy31PKJuyUjNtKDRAhYEdTOV/gxVt7xwXLxzDqabs9/9WDyftYbpGzJQzK
         Wzy6c/ZVYEBe6ig5983BnoFfIUJLsKLHoV0G2yjyM8TJPsIkRjXmzHvPDkQAd9w6Pl
         jPvYmPyYVrze02gFfTa++62kzvpIbDSUXWu42Xrc=
Date:   Mon, 30 Nov 2020 12:46:17 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK
 and LRCLK in LPAIF invalid state
Message-ID: <20201130124617.GC4756@sirena.org.uk>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline
In-Reply-To: <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
X-Cookie: Space is limited.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2020 at 10:29:18AM +0530, Srinivasa Rao Mandadapu wrote:
> This reverts part of commit b1824968221c
> ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state")
>=20
> To identify LPAIF invalid state after device suspend and resume,
> made I2S and DMA control registers not volatile, which is not necessary.
> Instead invalid reg state can be handled with regcache APIs.
> The BCLK ref count is necessary to enable clock only it's in disable stat=
e.

Part of this commit message says that the problem was making the registers
non-volatile but both the change and the rest of the commit message say
that the issue was that the registers were made volatile.  I'm also
still unclear as to what the issue is either way - how does reading the
state of the registers from the hardware instead of the cache affect
things?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/E6ZgACgkQJNaLcl1U
h9CVJwf/cthAiDDzgCy+8jtekEtWgrAysykABOq/eTIZgtkirE582hD928n9uEGY
RiAsvBOiEFRnm4nQn9xLuCRw4XEKolqJyKL5cOJiQUQcqXDvuB8nOEejzC0RWRte
S88D2dEd4vm7X7MjyierwcwmuBHbT9WHKozi0e45bQJXjZCoSaEDw7Sq+h1kiUCy
z0RKAWIPOFpRl7AmkMu2hjonp/cM8/GiH0C2bYNMS0LN+nGt2+rLer+sX5P+jlev
gZuWWzTP7RCzaBub+xNVCZK2fmlIX/ePLDiXs0JAGFs0HFI+UMV1L0GVePlxsGgR
7JxoFBFJ7hKNfy4Dsn5RlwqwawcyfA==
=ueKi
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--

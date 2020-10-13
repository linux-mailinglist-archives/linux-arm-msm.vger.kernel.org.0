Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290E328D108
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 17:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730622AbgJMPPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 11:15:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:57592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730376AbgJMPPL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 11:15:11 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95D1B22280;
        Tue, 13 Oct 2020 15:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602602111;
        bh=VQiYIkv8JxDfMCqXetCvnsQqRv/qB9MbycuOck8T+Ao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jLfoZ6WqFkBvsSOi2DL42qgNuMVnWoeJJ1W684kMk61N+vmj/UKCQMqrOU+Aa+ht/
         D9uxHx9VrdLIDlJ2+r49BP3AUDyCtc0Zq3fTpLvyJEdSVB55hzVfiZ4nuDBBVsO5um
         ROs0AY2Z/8Gkt3m6S/l8/N5NgNjE25qvwsLVQTNw=
Date:   Tue, 13 Oct 2020 16:15:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH 1/2] Asoc: qcom: lpass-cpu: Fix clock disable failure
Message-ID: <20201013151505.GA7913@sirena.org.uk>
References: <1602596386-9886-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <1602596386-9886-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Great minds run in great circles.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 07:09:46PM +0530, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>=20
> Disable MI2S bit clock from PAUSE/STOP/SUSPEND usecase
> instead of shutdown time. Acheive this by invoking
> clk_disable_unprepare API from cpu daiops shutdown to
> cpu daiops trigger.

I'm missing patch 2 here?

> This Fix is update to the below patch.
> https://lore.kernel.org/patchwork/patch/1308101/

Fixes should be specified using tags like this:

  Fixes: commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhuget=
lbfs dependency")

in the changelog.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+FxHgACgkQJNaLcl1U
h9CSsQf6AgNY/ragXX+c9/6OMzAPmShAvnTqYcTGy6bV8AK+nCQjYvWCS789YO1q
bUzkSCTOMLQHtcHiUKSGB+mpn8djofZCg+rSsC1thvIzpcuTZKutgDOT36/EyCCV
u81NfxpjYVAajwjwfm010VLi2FaA5duXh8jsi3COrIO3z81ySMxK4ZTAo4BAAZDl
Glh8soX7WO3aE26ei4zrfPUYsq1ZR4eEzFJ7AVip3mvLeMajeOg8FLXJ8lPPgr1K
nd32a6EXpZEZGPYA6W0uyByMajSokRh4uXMQdT2NmdXVRuhnz4UyQsE3bEiGsuAe
2AhG0/MJQMi6amyafwZfTOpLHdfubQ==
=hBwr
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

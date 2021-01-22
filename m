Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A53300462
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 14:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbhAVNke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 08:40:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:56028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727527AbhAVNkV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 08:40:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A6B222D57;
        Fri, 22 Jan 2021 13:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611322780;
        bh=tgvZ/1z60JKkGwLoukFQodwUHj9JwIRRqSvQHwqBV9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M4e8NgCT88owiBCOeV9k/0Q0Ox9PBoBD5rNmeivWTx7paaCIEwA4fY0LquVc67OX6
         entDQsmwzFAPi5yma/J6/6xqnQzT6CxxTCyrVHgiYIzQMDWVmD+6CGYDumfvqZt3gk
         y4iq2U0PYRwrp38Gl/ZJGn1WSQ8IWw7DOi2l6pj5+Xb3j9pl16a1Sd180jSrek9MXT
         NpXRj15h1t3EpWY3h79924ulxmS8KgSzyzX8vRGivBI2dUV/XlM0JJq1GeY+r5VUqT
         XMR3+uetUuPEjZP8u0W5x2qRxpE1lau4aKikhOCsddQBkrcSV7Jawlga0hgiHumuf6
         M3ipsX2c643HA==
Date:   Fri, 22 Jan 2021 13:39:01 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Patrick Lai <plai@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
Message-ID: <20210122133901.GC6391@sirena.org.uk>
References: <20210115203329.846824-1-swboyd@chromium.org>
 <161125795422.35635.5979635189908672108.b4-ty@kernel.org>
 <89cc3dfb-35da-3498-b126-b440c91f9a45@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Content-Disposition: inline
In-Reply-To: <89cc3dfb-35da-3498-b126-b440c91f9a45@codeaurora.org>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 04:56:21PM +0530, Srinivasa Rao Mandadapu wrote:
> Hi Mark and Boyd,

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> Thanks for your time on this issue.
>=20
> In my opinion, It 's better not to apply this patch.
>=20
> I will post patch with changing size in sc7180.dtsi file.

We can always do both...  If you think the patch should be reverted then
please submit a patch doing that (including a changelog which will
explain why), but note that the DT is in theory an ABI and it's possible
that people won't upgrade their DTs if the fix is in there.

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAK1XQACgkQJNaLcl1U
h9Dcxgf/WSfKkfBrbINSVecpsf28YD9R64WjVLCVPS+pTZTU1ojywjwATUMT1iKK
y2j3OepqPKoFl1VDYIPuuVZ13aLmHvf/mRYp3nGBkEQ+czsnLnbwZIYJoSw4+whu
ndcJgU6jDQB7W98nkEHSxbe+V0xXxyZkEZry3MzYI5JtolF6eL9kEL17Am/9uYFc
8QyJHRL1pQcOjHQ6idZfO66yuOjk8Dib6QgJkEOw8FDSdDlUc1h+R/e1t8QirpC4
zIe5oPGVmtyLOjIfa1OTM5nHfxMWf9hS69JKK1rCvcFWaNI6wDzr2w3PESFcFm3k
OaSRVTzOxV85twthQdIb0MV2cGA3og==
=4DLb
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--

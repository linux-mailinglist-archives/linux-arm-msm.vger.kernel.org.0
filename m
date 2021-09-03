Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C03400216
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 17:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349723AbhICP0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 11:26:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:52596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349680AbhICP0a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 11:26:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2D0361101;
        Fri,  3 Sep 2021 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630682730;
        bh=g2WcH0dspliSUg3Upb5HzTWrYsmq0if/g0dlKECrmDo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lzkN6pwHRh14hV1nCbMtFE+7Ei/O9e4HHRRCd0hEDnSkPOLCxGd4gWddraZwJUWVx
         XCvoXwYyAKFNYugXDLICAW09gcZnc/W0VwJ4B+wL8Bsh69mQXzp/HKgOTen+rsYoq9
         kB5lzgQsex2ZS+PiZXxE8BiV/eejIbc8gbjYOkWzXY7pjd5pTO+gtYTt1bq0mItWEA
         cEdzkYyCwRnMT70pstdxEnnKHculfgnmO/vr7qY+VnwzY2vRfR9e+YZihMxEYvtxN6
         Qc4G/YFrDTE1bK9IH9b3oWf6iF6O4o6WR3dBnb0W1l6wy+VRx+N8xptxhTEQPLV8Xd
         xHpHrJykJP8mw==
Date:   Fri, 3 Sep 2021 16:24:56 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [RFC PATCH 0/2] PM6125 regulator support
Message-ID: <20210903152456.GL4932@sirena.org.uk>
References: <20210828115654.647548-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f54savKjS/tSNRaU"
Content-Disposition: inline
In-Reply-To: <20210828115654.647548-1-iskren.chernev@gmail.com>
X-Cookie: Darth Vader sleeps with a Teddywookie.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--f54savKjS/tSNRaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 28, 2021 at 02:56:52PM +0300, Iskren Chernev wrote:

>  drivers/regulator/qcom_smd-regulator.c  |  46 +++++++
>  drivers/regulator/qcom_spmi-regulator.c | 160 +++++++++++++++++++++++-
>  2 files changed, 204 insertions(+), 2 deletions(-)

You should also add the new compatible to the bindings documentation.

--f54savKjS/tSNRaU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEyPkgACgkQJNaLcl1U
h9C+wQf/dh31YevzvPxMwPCSISfojVL1NPvj5x4rsrMKFP94j2ojfCVRqVr9sB09
OXR+l0oPc8oUucxMKsMQy/2kqt/Cgf6Oq0Qwtufrc3/xhMk881+bWLhBzdO0VMFG
GrQgXmyaC6wNZc6Nxmvrziwte3r5IVCBlKEZOwm1FSga+CKYcXs8kuvjYbNIz+9u
3G2DO33hrUCeSFRlMqcVwAMfRZE6TtRxWKlRVQgdenAeh157Xxdi374FvfRZjFr0
UzXnbFr1UPYIeZcRZkgV4BbNNeDvEKyiaR2wBeoYaqATOmNBjY/FOuOwOucBlhU3
50VCkFO8Na+t2I0C+yCk9sf3FoqKxA==
=PjEe
-----END PGP SIGNATURE-----

--f54savKjS/tSNRaU--

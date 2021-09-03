Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94064001FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 17:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348122AbhICPZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 11:25:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:51590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239585AbhICPZF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 11:25:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D032E61101;
        Fri,  3 Sep 2021 15:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630682645;
        bh=5JWbM+rm5K9SRt6fH7Ab6A0AFfqoyqg1iT8W4q7Z4jY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qGPse1xU5zswPPlNxci4T+jHeR2yOKtOC9JtyVTG7RvIhkzlyc/OhwYlsU4u8ZBRh
         j6WbToxpUXRVEvgJY+xrGDTdQ1/UyHpnsQDKyAWQl3v1ilBX1CNtvd94ku+9p5UjWa
         nsUQBDvyRoq3+ACZJBPUYuTXFOOVxfWlbG6EqGg1tCO5iAoRztMmOvEU4cIkE372aA
         dq2+cjidNf+r4O2QVzgpzX07B+7SXxFBRKgXiRbdAD5CLsR1RZlJwp2qWf/Q1As3wV
         gD7JhB42E9Rw9dxr/sKsCsrNBa8OHe8bcQdr69NXFXC9Ah+RNd2Ij2QP9wtPKHXwpY
         i3PprOwi1Z7sw==
Date:   Fri, 3 Sep 2021 16:23:31 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [RFC PATCH 2/2] regulator: qcom_smd: Add PM6125 regulator support
Message-ID: <20210903152331.GK4932@sirena.org.uk>
References: <20210828115654.647548-1-iskren.chernev@gmail.com>
 <20210828115654.647548-3-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T4Djgzn3z2HSNnx0"
Content-Disposition: inline
In-Reply-To: <20210828115654.647548-3-iskren.chernev@gmail.com>
X-Cookie: Darth Vader sleeps with a Teddywookie.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--T4Djgzn3z2HSNnx0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 28, 2021 at 02:56:54PM +0300, Iskren Chernev wrote:

> NOTE: The sources haven't been determined, so currently each regulator
> has it's own source.

It would probably be safer to just leave them unspecified for now and
then add them as people figure out what's going on rather than putting
something incorrect into the DT bindings.

--T4Djgzn3z2HSNnx0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEyPfMACgkQJNaLcl1U
h9D+Mwf+Jw6GkTKjvzMXQsSvG9mLMLuac1uJD2ee/mpXd94pp0L2IScamJasbM9a
18oILKbstdqSVlIE7Pf6MuWeQ5+AaFC+dysnvxg2KgwZyK7tLxznI2GtGNnYUPdO
pkt9BWzpSiJO6Gvdq83BWwxg9aGfAL5M29kxXj3+hOVm77qs1loeibJrc47zuIE4
ohIB8efDdY+XJT3zO+sdh5v/GEbUPyvt5MLmZXJgqT32uc/KHNfiBFEA0YX5LsJN
I367NvqEAine4KaEup7oQw47SHZQB7HdYtPq1t23xGkWXkjhTplVntvuBwHas0sl
tkuZwFQoU3sFgOEO1g5zCilVJMrzDw==
=7+yU
-----END PGP SIGNATURE-----

--T4Djgzn3z2HSNnx0--

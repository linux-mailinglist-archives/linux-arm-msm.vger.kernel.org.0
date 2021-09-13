Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5F240967B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 16:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245730AbhIMOvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 10:51:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:35582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344829AbhIMOsJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 10:48:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CED4F60555;
        Mon, 13 Sep 2021 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631543580;
        bh=LlL+UEcL8QdwVkYcbQ0B6JqkI3z3wfY5/i2rd9muYgo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZHHgi9WWuwgZWISxqQOyF0tWPKvkbbNt3tXUeu9L5qxBR01cxzYdXFdq9rhuhHpLu
         Iepo0R8iKhBwLcWf1+yIEA4IhR5nsnAbZqmEqEtFcFbcONpO4QeGPaG2NAV0ge9cgb
         9HIoM7Esvmaiinz2Q7KMFtcxzw926msOrSFqy0esCq6HcCA/3t/As5gIo3somXFTkj
         yiTZPzlHnLdQ8wqCODNdCJJv/iYy5X7RfGm/HeHHctqJAlKvh/drwsgIR7ArAlGnR0
         PLVnM1D8/VtgVMyy48GMfD3q0WIa9Mm3ysFHsKjH/OeV/VNFvALV8eKacBfmGm1M4v
         CISFWwlS3HTmQ==
Date:   Mon, 13 Sep 2021 15:32:21 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [RFC PATCH 2/2] regulator: qcom_smd: Add PM6125 regulator support
Message-ID: <20210913143221.GG4283@sirena.org.uk>
References: <20210828115654.647548-1-iskren.chernev@gmail.com>
 <20210828115654.647548-3-iskren.chernev@gmail.com>
 <20210903152331.GK4932@sirena.org.uk>
 <b02e3ba5-b3fe-8963-8457-62304a39e100@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iAL9S67WQOXgEPD9"
Content-Disposition: inline
In-Reply-To: <b02e3ba5-b3fe-8963-8457-62304a39e100@gmail.com>
X-Cookie: Above all else -- sky.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--iAL9S67WQOXgEPD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 03, 2021 at 10:49:52PM +0300, Iskren Chernev wrote:
> On 9/3/21 6:23 PM, Mark Brown wrote:
> > On Sat, Aug 28, 2021 at 02:56:54PM +0300, Iskren Chernev wrote:

> >> NOTE: The sources haven't been determined, so currently each regulator
> >> has it's own source.

> > It would probably be safer to just leave them unspecified for now and
> > then add them as people figure out what's going on rather than putting
> > something incorrect into the DT bindings.

> I didn't expect this patch to be mergeable, so I didn't add the dt-bindings.

If you skip out on basic smell tests like having DT bindings that's
going to inhibit the amount of review you get, once things obviously
aren't going to be merged review tends to get a lot more high level.

> So should I add bindings and just ignore all the sources (add them later)?

Yes.

--iAL9S67WQOXgEPD9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE/YPQACgkQJNaLcl1U
h9DfmQf+LEQSFvSlXylnotKOPeYGqgofaL3EbkdZDLOzCJ8i1NXog9E0ADq4it5V
to8oYtTXoa2/d+GA5N0UvFnU+GPZNf3/Z6HMmdeyB+Qxgz7vX0pKVZ9qVetqCkYJ
L+UR9tWU0TudQ7vSOMuSeXJ2mvL0bmuayULj+gERN3EmCKl1yVeAchGI/5vLG2aD
wScIW3UXSktks3zx6k1frFDWTZTDifSDO1V0lWgxbTejWwt2Ya70AmRsDIeONf7b
1xFJA3C4Fx3HqavE4R10/e7J42FUsAV90JSlFyuuF5JMRwGMjzlHv68ZiaCJ/Uh7
I+tkyJ4mcXUjFmrQgrG4F3lW56zaGg==
=UcBp
-----END PGP SIGNATURE-----

--iAL9S67WQOXgEPD9--

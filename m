Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3072F5148
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 18:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbhAMRlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 12:41:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:57502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727198AbhAMRlY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 12:41:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4026E23370;
        Wed, 13 Jan 2021 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610559642;
        bh=8yOVzvugYKAaC/tjc5pFPVw9JmJZhfvsxaSRH5F+3Zs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QTHPw1Zb8Yk1vf7sNy6XJj2KhbPWiuB0ONvJxMhh0WOizzQSBDZy4OdTUBF1kGqMO
         PeRjSKHPayllWLengAsbxkWhPyPfKCLGJCA0wD+ERutiI0DNb7WrwNMdrQo1TwTRi1
         c+6hn/QEMjXnH6QdN8HPv1n2qVGCWIbe0/SfAC6u/03exnpWwdxTm1RRIAadMlFDoD
         Ct38GYr3HjhhxqdAMFsTnJVoBL5m8nR67XiTTFtfBXUNqGnQ6vt8NrWRVrGrvkrg+z
         g8CklRz8aBszuHQaLvpPMkPpHvkVAD6GB10MnCRnls4LWTNzYiy/Fo5kPGrdHK+l8P
         KdCPt2BynYIXw==
Date:   Wed, 13 Jan 2021 17:40:07 +0000
From:   Mark Brown <broonie@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH 5/7] regulator: qcom-labibb: Implement short-circuit and
 over-current IRQs
Message-ID: <20210113174007.GG4641@sirena.org.uk>
References: <20210109132921.140932-1-angelogioacchino.delregno@somainline.org>
 <20210109132921.140932-6-angelogioacchino.delregno@somainline.org>
 <20210111135745.GC4728@sirena.org.uk>
 <6dee36e4-fc78-c21b-daf8-120ee44535a3@somainline.org>
 <8115a574-ad43-d3c6-70d4-28c8a2f4a5f6@somainline.org>
 <09d70d24-5d0d-f1cd-d99e-5c213c8ea98c@somainline.org>
 <20210112172919.GD4646@sirena.org.uk>
 <e872bc39-a941-d552-5145-49f40d6fa657@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EDJsL2R9iCFAt7IV"
Content-Disposition: inline
In-Reply-To: <e872bc39-a941-d552-5145-49f40d6fa657@somainline.org>
X-Cookie: Ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--EDJsL2R9iCFAt7IV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 06:49:53PM +0100, AngeloGioacchino Del Regno wrote:

> I would go for keeping the current binding for the aforementioned reasons.
> Before I go on sending a V2, I would like to know your opinion.
> Do you agree?

Sure.

--EDJsL2R9iCFAt7IV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl//MHYACgkQJNaLcl1U
h9Clowf8CivDid8GP+sEfZILAYJv+b2figb0SJwgw/SiGtk5nrCYsqCGQoF/oqHg
Gi2skkFvpJNE87ZSdRaRXIGH8P6boLOwioxP2lvNDGjMA5k0oBZQqMiZ068s96XP
+dstLibEM9EugCwcWb4glxtEU2wijycJaJ8FD5su7d0geGQVNb+HYs/isdSQQ9w0
ZL4arp46cpej18ODy4jHzMv8jpfLwJjYrep1NuF8OJ4Lx0s3jRP7tEG8d0AKeGlO
PdpucFoFPtwxwzr5OyN7Qlt8PA7bBdiV5YL/usR7TPeRoDNhy4167OdUD7uFrzt/
LvwjXIxJjae0Fv2jdsTlZz3yk2pXHw==
=0h9C
-----END PGP SIGNATURE-----

--EDJsL2R9iCFAt7IV--

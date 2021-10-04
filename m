Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49023421920
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 23:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234918AbhJDVUv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 17:20:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:37784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234436AbhJDVUv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 17:20:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5636E613AC;
        Mon,  4 Oct 2021 21:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633382341;
        bh=RvwJaSm2IzBmay3+24hmVDZYFPmd8sn2wzbowb9Aao4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uq8OECIrjflYbJ9TP1tiOVFxXYacY66Rh/5iIprnwjrH2fL1u1g6QoXyjw8kXf7X3
         4DxeJ7TVo5s0LHkLDYT6PGY9lMiWCVC1Y/N10miC2qxmAEddLWTq77Wd0IW0HIwoWx
         1bxbdutXITLem1TBMMjWRELI1W2ySP/I0tO+vL0m5fqh3lqewM9BcFouaTODLYBUOA
         acpcpUQrJzxq7hBUK3mwj/J7yUg5fxxphrYw6uBUtZtTwsgSnFbSsmQpA02xeX91na
         Yy+6vQ3SrBCuL4NWmgNWatsEwRvHu1L1357zlYk0s0tq5Ec1W3WFSLjhWdME1I10oo
         4FegStatcRjzA==
Date:   Mon, 4 Oct 2021 22:18:59 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] regulator: qcom-rpmh: Add PM6350 regulators
Message-ID: <YVtvwy4egA3sEgBy@sirena.org.uk>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
 <20211003083141.613509-4-luca@z3ntu.xyz>
 <YVr1iymQo1hwQtW1@sirena.org.uk>
 <4777503.XO8xY86g4A@g550jk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DaWr1DfhDK1DbabH"
Content-Disposition: inline
In-Reply-To: <4777503.XO8xY86g4A@g550jk>
X-Cookie: If it heals good, say it.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--DaWr1DfhDK1DbabH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 10:44:25PM +0200, Luca Weiss wrote:
> On Montag, 4. Oktober 2021 14:37:31 CEST Mark Brown wrote:

> > If you don't know don't fix it into ABI, just don't specify anything
> > until someone figures out something accurate to put in there.

> The RPMH_VREG macro expects _supply_name so what should I put there inste=
ad?

NULL should do the right thing, or make a new macro.

> > > Additionally leave out configuration of smps3 - smps5 and ldo17 as th=
ese
> > > are not configured in the downstream kernel.

> > Just describe everything that's there - nothing will get touched if the
> > board doesn't explicitly enable doing so, otherwise everything is read
> > only.

> Problem is I do not know which types those regulators are, e.g. pldo or n=
ldo.=20
> The ones I described are experimentally verified because the wrong config=
uration=20
> makes the driver probe fail.
> So I can't really put anything there, unless there's another way to do th=
is.

That makes sense, please explain in the commit log that only are they
not initialized but also you don't know what types they are.

--DaWr1DfhDK1DbabH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFbb8IACgkQJNaLcl1U
h9CDxgf/cnDDgq3YrJyfk9Y+cWHSfUD+zS3JYMWNk7Ls9bqQLF785/UJfSDIXM90
AQLilcFnv1OpEb8L0e9BJ4tXnQskiV2QuX/itrB214rHJYIxzjnLaV5bUWcHMqDb
u35FEaeSGJaA2lGzNPx9Qq2L3Yvv/L6LCw4y+0FdKsu4WUg/KvtjJpO0eVTxd6iG
PlnlEe68ZSFdY+N2Do60Sy2eQnr4+UBtVZokg3g1x30BbN1lx9hKdoAmCY7EYONJ
rcC4NGUpaXWPIvtWvDNAXhH/cRi9ibvp6rQS6engFz9biQC3CUpmbNu0bsNnd/go
DEQdhIvsjuDsLO4CLZp1ktXqoljTNg==
=bM9F
-----END PGP SIGNATURE-----

--DaWr1DfhDK1DbabH--

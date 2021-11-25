Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFFEC45DE48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 17:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbhKYQJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 11:09:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:35480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229729AbhKYQH0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 11:07:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39F0C60200;
        Thu, 25 Nov 2021 16:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637856255;
        bh=KdhSkXjkdaP3MlPJHTn/Y5rldvqlD30vDk4OrRZDGKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lt0lqCFzS2OgfQbao/5lQKll2XYntB/PIV6jwUtWT0qBqf/hIz4IVt/mPVut2SyL9
         3A1gtB+ozJ4Ip4e7N4fCBK7aBbqGZljrGO7iCL71oMLftVpTrQsMxt63EQZjrakvI3
         EA4BB2njilar/v2O4ZYz6q2W1uppOkOC9RgeuoKMU3I4BLKL/N/gyI2OlxbIw3yBjR
         +LtAtY0Si3WewtPBtNh/R+diN370QEpwvlgPWLJi/7nvB2qwRf/bZimJltZj7E4G2m
         p1Qy9e92OFQGPIt4NEfNgECw4r66Ix4mXzTjmLMIXAFZuZElBD5sUQMyu0FSJvZXGp
         mcj3Zb7Rsq5Ww==
Date:   Thu, 25 Nov 2021 16:04:09 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Subject: Re: [PATCH v4 00/10] Add support for audio on SC7280 based targets
Message-ID: <YZ+z+XPyecvDJA88@sirena.org.uk>
References: <1635838265-27346-1-git-send-email-srivasam@codeaurora.org>
 <YZUT6BQKz00jXov9@sirena.org.uk>
 <e01729cd-0b2b-fe27-809b-c75ccbb6fac4@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4hRPBrvlJm1eOICO"
Content-Disposition: inline
In-Reply-To: <e01729cd-0b2b-fe27-809b-c75ccbb6fac4@codeaurora.org>
X-Cookie: This bag is recyclable.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--4hRPBrvlJm1eOICO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 03:35:46PM +0530, Srinivasa Rao Mandadapu wrote:
> On 11/17/2021 8:08 PM, Mark Brown wrote:
> > On Tue, Nov 02, 2021 at 01:00:55PM +0530, Srinivasa Rao Mandadapu wrote:
> >=20
> > > This patch set depends on:
> > > 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=3D57=
0161
> > > 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=3D57=
2615
> > > 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=3D55=
9677
> > None of those links seem to show any patches (or errors)?
>=20
> Sorry for Inconvenience Rob. I think due to it's status change patches are
> not being appeared on provided link.

I'm not Rob...

> With removing filter able to see patch set. Below are the links with view
> filter change.
>=20
> --=20
> https://patchwork.kernel.org/project/alsa-devel/list/?series=3D570161&arc=
hive=3Dboth&state=3D*

Please note this bit of the mail:

> > Please include human readable descriptions of things like commits and
> > issues being discussed in e-mail in your mails, this makes them much
> > easier for humans to read especially when they have no internet access.
> > I do frequently catch up on my mail on flights or while otherwise
> > travelling so this is even more pressing for me than just being about
> > making things a bit easier to read.

So it looks like we still depend on at least the sc7280 machine driver?

--4hRPBrvlJm1eOICO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfs/gACgkQJNaLcl1U
h9D8cwf7Bff6TgE+WAzqNt2VB/K+kGas4TbADTHreLi1oEV1ONDQb+aKeV5FQXbl
mQi1ps0bNGYak+GLne3wYLWe+H6xJKlPKh7SssQDqoSSEhKxJvf0ZVivuhTlcKK/
IUTPJJBcnh6ftPjn5u8XJN9JWm2HMj5LgkG6itJZcK+/Au7RfpPmrCGl/+UYmfZc
IXZGhdIkk/k3g6ZK/+UE/gAtDfsznLHDNKQMU/wygs+j4vjF5vUhkt5HBAnksnrK
tr1LWGjemENfMvsTRfXtokbL39lJ4Ej9t1qz7qknJc02ZSuhUJS/8JBamgJpbtTH
GpCeSMkLRDocDDSSAjs9EnDjCS9FnA==
=8KsA
-----END PGP SIGNATURE-----

--4hRPBrvlJm1eOICO--

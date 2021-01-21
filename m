Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22DB2FEF5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 16:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733215AbhAUPqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 10:46:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:49252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387493AbhAUPpi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 10:45:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99D1E2073C;
        Thu, 21 Jan 2021 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611243897;
        bh=+5gRibZkC6bk1wv39tmFyPEKELorKhefP3ySjz4oV7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=paOfH3uVrTWvohDqTqpIdqpX2ef5Ki07Df+QI0JomD1Z3Sd6xIxEgnbyPqqdPwJB2
         +IsZnsl++3nCaiS9+JmHzVWBZsGBW5bywW/LxtPgNH8XH0vAT8Safno/b6NBN6E0Pu
         3RFh3H11gbKk1X54ZMfmDYtW3lCbvtMx6HbWMA77zA8OhJmr5gBpJ3BCKLIyKOAPWr
         V4Vq+3HCiyYzwISCgV4voRb76fhGfBuNWNohRdmxqDyiBsTbs0JTXRWOcBhQEUO//d
         /rf7ynQ9XyTlPclKhATceuAqbZyWlfXTI5vFuZXKAjXpBDPP5IJTDu6xg/hfsg50R0
         er2sWL3RYnLAA==
Date:   Thu, 21 Jan 2021 15:44:18 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     David Collins <collinsd@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH] regulator: core: avoid regulator_resolve_supply() race
 condition
Message-ID: <20210121154418.GE4588@sirena.org.uk>
References: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
 <CGME20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d@eucas1p2.samsung.com>
 <e512ee85-7fa6-e5fe-eb30-f088bb83cf23@samsung.com>
 <20210118204958.GS4455@sirena.org.uk>
 <5f37ae96-c5f9-6619-d88f-21c5e483ff8e@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="orO6xySwJI16pVnm"
Content-Disposition: inline
In-Reply-To: <5f37ae96-c5f9-6619-d88f-21c5e483ff8e@samsung.com>
X-Cookie: Generic Fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--orO6xySwJI16pVnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 10:41:59AM +0100, Marek Szyprowski wrote:
> On 18.01.2021 21:49, Mark Brown wrote:

> > Does this help (completely untested):

> Sadly nope. I get same warning:

Try this instead:

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 3ae5ccd9277d..31503776dbd7 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1823,17 +1823,6 @@ static int regulator_resolve_supply(struct regulator=
_dev *rdev)
 	if (rdev->supply)
 		return 0;
=20
-	/*
-	 * Recheck rdev->supply with rdev->mutex lock held to avoid a race
-	 * between rdev->supply null check and setting rdev->supply in
-	 * set_supply() from concurrent tasks.
-	 */
-	regulator_lock(rdev);
-
-	/* Supply just resolved by a concurrent task? */
-	if (rdev->supply)
-		goto out;
-
 	r =3D regulator_dev_lookup(dev, rdev->supply_name);
 	if (IS_ERR(r)) {
 		ret =3D PTR_ERR(r);
@@ -1885,12 +1874,29 @@ static int regulator_resolve_supply(struct regulato=
r_dev *rdev)
 		goto out;
 	}
=20
+	/*
+	 * Recheck rdev->supply with rdev->mutex lock held to avoid a race
+	 * between rdev->supply null check and setting rdev->supply in
+	 * set_supply() from concurrent tasks.
+	 */
+	regulator_lock(rdev);
+
+	/* Supply just resolved by a concurrent task? */
+	if (rdev->supply) {
+		regulator_unlock(rdev);
+		put_device(&r->dev);
+		return ret;
+	}
+
 	ret =3D set_supply(rdev, r);
 	if (ret < 0) {
+		regulator_unlock(rdev);
 		put_device(&r->dev);
-		goto out;
+		return ret;
 	}
=20
+	regulator_unlock(rdev);
+
 	/*
 	 * In set_machine_constraints() we may have turned this regulator on
 	 * but we couldn't propagate to the supply if it hadn't been resolved
@@ -1901,12 +1907,11 @@ static int regulator_resolve_supply(struct regulato=
r_dev *rdev)
 		if (ret < 0) {
 			_regulator_put(rdev->supply);
 			rdev->supply =3D NULL;
-			goto out;
+			goto out_rdev_lock;
 		}
 	}
=20
 out:
-	regulator_unlock(rdev);
 	return ret;
 }
=20

--orO6xySwJI16pVnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAJoVEACgkQJNaLcl1U
h9Cf8wf/XDuOH0gnqkdF8ahweAnC2dYaUGZyEUY+81aGMyOlfAOg28Xm6qM0Epf5
eoNso/xFUG9If6M7wjFbidSEW8R9GuGvw6MqNEtW56Fi/OyvXQ79zvNaOkDoHxcT
n+Cc1p5XvjNpwo//JCrJklmdYT3qTB5Lk0hY05p3LTw+Q+soTwcUqYB5NieEhySA
v1XdrRZnCdiYw/usO05C2pdERQmt9YDem9oj8yfu2PcKza2zE1g3Eu8EJQcfQe9I
/3XeE2sLvLcjusTcH9DaiUOeOCFL4YWgnK5mB46dAuIE/fPqv48fUFMuyZ52PlN9
VQTkUxDM2/BrCf1GRByt4G5hRIhkvQ==
=Jbpl
-----END PGP SIGNATURE-----

--orO6xySwJI16pVnm--

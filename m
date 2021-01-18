Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A9F2FABE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 21:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394420AbhARUva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 15:51:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:57256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394500AbhARUvQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 15:51:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 514F922472;
        Mon, 18 Jan 2021 20:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611003035;
        bh=H6UA6H2/Zi55Qt8ytYHm/E7q9Vp1onaV0E/AF6oYJYQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CkmLWexmoNM7iPlrtWvRf55xgaUNPBhx7/k2XhbW86TVkljF2qhTHgM3VDUndPL8r
         LdkZ++eR/I/JL9F9EcfLTTyBuW3i+La/Wvru/ZbrT69zddCz9sHZKnvm3RSUFLJf9C
         SC2lF4H/ouOBMX1DaaiWYEsenI7YulPX7ZWig6XQ+26CsNr6olDtXRyRHo4Qe1101U
         7TN95vCrEI+2e4HUD62ZzDmkIiM1RRIPsDq0v5AEx4Q1WoIAxDkgsLrsaOdBmSQChV
         ypDJHmdWeN/9Hs8bS9Hvcz5MIlcyjSR/zXpBAkxswhBpHqYDGTMO6hUKrccRdPBFjH
         CevvUYW+zIzVw==
Date:   Mon, 18 Jan 2021 20:49:58 +0000
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
Message-ID: <20210118204958.GS4455@sirena.org.uk>
References: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
 <CGME20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d@eucas1p2.samsung.com>
 <e512ee85-7fa6-e5fe-eb30-f088bb83cf23@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GIP5y49pbaVPin6k"
Content-Disposition: inline
In-Reply-To: <e512ee85-7fa6-e5fe-eb30-f088bb83cf23@samsung.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--GIP5y49pbaVPin6k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 10:34:19PM +0100, Marek Szyprowski wrote:

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> WARNING: possible circular locking dependency detected
> 5.11.0-rc1-00008-geaa7995c529b #10095 Not tainted
> ------------------------------------------------------
> swapper/0/1 is trying to acquire lock:
> c12e1b80 (regulator_list_mutex){+.+.}-{3:3}, at:=20
> regulator_lock_dependent+0x4c/0x2b0

If you're sending backtraces or other enormous reports like this please
run them through addr2line first so that things are a bit more leigible.

> but task is already holding lock:
> df7190c0 (regulator_ww_class_mutex){+.+.}-{3:3}, at:=20
> regulator_resolve_supply+0x44/0x318
>=20
> which lock already depends on the new lock.

Does this help (completely untested):

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 3ae5ccd9277d..7d1422b00974 100644
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
@@ -1885,10 +1874,23 @@ static int regulator_resolve_supply(struct regulato=
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
+		put_device(&r->dev);
+		goto out_rdev_lock;
+	}
+
 	ret =3D set_supply(rdev, r);
 	if (ret < 0) {
 		put_device(&r->dev);
-		goto out;
+		goto out_rdev_lock;
 	}
=20
 	/*
@@ -1901,12 +1903,13 @@ static int regulator_resolve_supply(struct regulato=
r_dev *rdev)
 		if (ret < 0) {
 			_regulator_put(rdev->supply);
 			rdev->supply =3D NULL;
-			goto out;
+			goto out_rdev_lock;
 		}
 	}
=20
-out:
+out_rdev_lock:
 	regulator_unlock(rdev);
+out:
 	return ret;
 }
=20

--GIP5y49pbaVPin6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAF9HUACgkQJNaLcl1U
h9CSgQf/WxGUC0HwPneU+4CSzLkNnmCkeRj+XD5gX0Z/KEo/1EnY6cg10Cq3ZqBY
/OSiMjeamYYf8cALIMT8h5CGcOGiBtQL7AtDP8jtH7+F1hj382DT3wCQQDfjXFgq
Wl/NY99d44dNioksuJtz0nGrSOysUmk6UZPLUHSNE4yTZpa6H2m46JMYJ5iBeW44
pF1xsyxsrnPPuuYIY0yZw4CsNmxDAGo/83DWLV+UV9dmjWoL06l9yPWhynCdzcgL
LPVM45ZU4+De5CcRlFIH9oAaqzsKHV/Si57rxfdX57GoI/9VYmA2NQXmy0PnNI2h
zhUqUHMq71tzxt8AXknhhSk54oVjYw==
=1Wmm
-----END PGP SIGNATURE-----

--GIP5y49pbaVPin6k--

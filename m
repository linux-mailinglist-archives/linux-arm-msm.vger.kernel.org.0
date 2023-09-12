Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25A4779C737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 08:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjILGx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 02:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbjILGx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 02:53:58 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2019B
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 23:53:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qfxHP-0008Dx-E4; Tue, 12 Sep 2023 08:53:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qfxHO-005icu-Qx; Tue, 12 Sep 2023 08:53:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qfxHO-000uB8-5u; Tue, 12 Sep 2023 08:53:46 +0200
Date:   Tue, 12 Sep 2023 08:53:43 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] clk: qcom: cbf-msm8996: Convert to platform remove
 callback returning void
Message-ID: <20230912065343.neorcr5mksodbaod@pengutronix.de>
References: <20230911151548.672485-1-u.kleine-koenig@pengutronix.de>
 <8ec473b5b80d5fad8d76df6d88d2c1d0.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6srksz2gf3ekwjf2"
Content-Disposition: inline
In-Reply-To: <8ec473b5b80d5fad8d76df6d88d2c1d0.sboyd@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--6srksz2gf3ekwjf2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Mon, Sep 11, 2023 at 01:02:53PM -0700, Stephen Boyd wrote:
> Quoting Uwe Kleine-K=F6nig (2023-09-11 08:15:48)
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling by
> > returning an error code. However the value returned is ignored (apart
> > from emitting a warning) and this typically results in resource leaks.
> > To improve here there is a quest to make the remove callback return
> > void. In the first step of this quest all drivers are converted to
> > .remove_new() which already returns void. Eventually after all drivers
> > are converted, .remove_new() is renamed to .remove().
> >=20
> > qcom_msm8996_cbf_icc_remove() returned zero unconditionally. After
> > changing this function to return void instead, the driver can be
> > converted trivially to use .remove_new().
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
>=20
> Do you want to take this? Otherwise, I can apply it to fixes.

if "you" =3D=3D "Uwe Kleine-K=F6nig": Please take it via your tree. There is
still much to do before the next synchronous step, so there is no urge.
If the patch goes in during the next merge window that's fine, too.

> > @@ -266,7 +264,7 @@ static int qcom_msm8996_cbf_icc_register(struct pla=
tform_device *pdev,  struct c
> > =20
> >         return 0;
> >  }
> > -#define qcom_msm8996_cbf_icc_remove(pdev) (0)
> > +#define qcom_msm8996_cbf_icc_remove(pdev) { }
>=20
> It would be better if this was a static inline function.

Ack, but this applies to the state before my patch, too, and I think
this should be addressed separately. That's currently not in my focus,
so if someone else wants to address this, you're welcome.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6srksz2gf3ekwjf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUACvYACgkQj4D7WH0S
/k5i9ggAk0+9RuhJ45okO/zG4mX0dUQmIVJXi6eitU513w2CbLQRePSqcjMmGpy0
suqvqUSId6lP1nj6uJelQvwzzyqTCW5aEQcdQk7P/AdgxkP+5IAdgbX/n0pZxuBG
sV2iOHK8MgblAIIW5ay8mdvdLI6b4pE3j1sRhuhtyCzQqYiEbcIs52sKHhFcj2Jc
Hqpck20c0t3sWaaxGmhm1k+ZIrojfQZwKRF879+Nk/F6jT/5a9kUTnZb9dzePYpD
ZMr1YhgntI28YVz87tUMjgzsGdFFXQhur4VWXb+RNBgHfZ+BjFFFoXpkvlT48je3
c/B1hlzOPZF77Nocu56vUi9ZHQspKA==
=p39v
-----END PGP SIGNATURE-----

--6srksz2gf3ekwjf2--

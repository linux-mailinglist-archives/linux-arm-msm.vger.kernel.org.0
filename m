Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABA9E7D1325
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Oct 2023 17:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377787AbjJTPux (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Oct 2023 11:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377785AbjJTPuv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Oct 2023 11:50:51 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C42BBF
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Oct 2023 08:50:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtrls-0005vC-9b; Fri, 20 Oct 2023 17:50:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtrlr-0033hp-Lt; Fri, 20 Oct 2023 17:50:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtrlr-002bYY-CK; Fri, 20 Oct 2023 17:50:43 +0200
Date:   Fri, 20 Oct 2023 17:50:43 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>, kernel@pengutronix.de,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: cbf-msm8996: Convert to platform remove
 callback returning void
Message-ID: <20231020155043.kwjfagznxipipby6@pengutronix.de>
References: <20230911151548.672485-1-u.kleine-koenig@pengutronix.de>
 <8ec473b5b80d5fad8d76df6d88d2c1d0.sboyd@kernel.org>
 <20230912065343.neorcr5mksodbaod@pengutronix.de>
 <cghreaj25elndy3wfdqhetlpk3hswyu5hnvvzdhcoqbpj2kin7@lzfeshjoyxti>
 <3da62b36856cea690afd22d4c1500d2b.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qpvefstaa45zka7l"
Content-Disposition: inline
In-Reply-To: <3da62b36856cea690afd22d4c1500d2b.sboyd@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--qpvefstaa45zka7l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Oct 09, 2023 at 08:49:27PM -0700, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2023-09-20 10:29:58)
> > On Tue, Sep 12, 2023 at 08:53:43AM +0200, Uwe Kleine-K=F6nig wrote:
> > > On Mon, Sep 11, 2023 at 01:02:53PM -0700, Stephen Boyd wrote:
> > > > Quoting Uwe Kleine-K=F6nig (2023-09-11 08:15:48)
> > > > > The .remove() callback for a platform driver returns an int which=
 makes
> > > > > many driver authors wrongly assume it's possible to do error hand=
ling by
> > > > > returning an error code. However the value returned is ignored (a=
part
> > > > > from emitting a warning) and this typically results in resource l=
eaks.
> > > > > To improve here there is a quest to make the remove callback retu=
rn
> > > > > void. In the first step of this quest all drivers are converted to
> > > > > .remove_new() which already returns void. Eventually after all dr=
ivers
> > > > > are converted, .remove_new() is renamed to .remove().
> > > > >=20
> > > > > qcom_msm8996_cbf_icc_remove() returned zero unconditionally. After
> > > > > changing this function to return void instead, the driver can be
> > > > > converted trivially to use .remove_new().
> > > > >=20
> > > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > > ---
> > > >=20
> > > > Do you want to take this? Otherwise, I can apply it to fixes.
> > >=20
> > > if "you" =3D=3D "Uwe Kleine-K=F6nig": Please take it via your tree. T=
here is
> > > still much to do before the next synchronous step, so there is no urg=
e.
> > > If the patch goes in during the next merge window that's fine, too.
> > >=20
> >=20
> > @Stephen, should I just pick this in the Qcom tree for 6.7 then?
>=20
> Yes please.

This patch isn't in next yet. Is it still scheduled to go in for
6.7-rc1?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qpvefstaa45zka7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUyodIACgkQj4D7WH0S
/k4qcAf+JwpREvE+9FIEM/StFYV0xR/vnEcnl4GZS51yaxCTUfK3OWt/YI0qJP3w
QMjhejyWEVVPlg3Zjh70I1pXyXYkNZhutjC4T20gptiM/tLFz2vzhIaY8OP82kZK
ykfjVrKxJNFhl+NKpF94EzYFqPAD+W6sKb+N0bzEjTc6Voonpr7Po4uqsyjN2Ceu
sEH9QNZoGfe1dI/Pvjfzljtm60oQ3Ir0VAmB/SADRMjYA3pnBEDcuE98gz6j4wFS
ZiFhJKjuj/SKECQX1vunsc9fS9Hfsz3mksIGC577fi74ZSDJxA7zw7+X5Bq9IIdQ
xjF1ymBe2IIJgCVd2YhR6NViJDGvdQ==
=HEfE
-----END PGP SIGNATURE-----

--qpvefstaa45zka7l--

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80786FBF11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 08:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234762AbjEIGOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 02:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234729AbjEIGOO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 02:14:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3D793E6
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 23:14:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pwGbu-0004XM-Fr; Tue, 09 May 2023 08:14:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pwGbt-002Aap-NY; Tue, 09 May 2023 08:14:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pwGbs-002g6c-SK; Tue, 09 May 2023 08:14:04 +0200
Date:   Tue, 9 May 2023 08:14:04 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] soc: qcom: ramp_controller: Improve error message for
 failure in .remove()
Message-ID: <20230509061404.utjb654ykcgjqjd5@pengutronix.de>
References: <20230415201848.3779001-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2nsbkubkuvhtzgsq"
Content-Disposition: inline
In-Reply-To: <20230415201848.3779001-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--2nsbkubkuvhtzgsq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Apr 15, 2023 at 10:18:48PM +0200, Uwe Kleine-K=F6nig wrote:
> When a platform_driver's .remove() callback returns an error, the driver
> core emits
>=20
> 	remove callback returned a non-zero value. This will be ignored.
>=20
> . Replace this by a more specific error message. Then convert to
> .remove_new() which is equivalent to returning zero unconditionally in
> .remove(). See commit 5c5a7680e67b ("platform: Provide a remove callback
> that returns no value") for its rationale.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/soc/qcom/ramp_controller.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

This patch didn't make it into mainline as of v6.4-rc1 and isn't in next
either. Any volunteer to pick it up? The previous patches to this driver
went in via Bjorn Andersson?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2nsbkubkuvhtzgsq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRZ5KsACgkQj4D7WH0S
/k5sjAf/YtzjVExBijrVAFnbwwcr6OZTmBHjSSuJzQkQ53LMSKaG3cDIuJxvNE5X
6+Gz4gJClBmXOFE0155Q9FW8EBp4Ol+qxjHlN4Twi3BvTbVghtkQgUwZYA/IjQdJ
t+eRTFXaQtA1LNEPgznDNd7IO+wcYOXk1t7R756OMJf208Cl4PnSpmQPWBD+FIbg
3TM8Q3ly3V/k4vCmixDrawjmAGJlyxUyBEKcTW1a94h4yBeX8rOQFR9BEj0h8tDP
EN5IGIVLjR/VcARGILrvMM/Smi2sA54Q1KhTZ1TTKq7aN8i/zQcebXADzYFPYMzg
vAv2wmZZ6OcpylYui8vrQTwQVpTqeg==
=3fDH
-----END PGP SIGNATURE-----

--2nsbkubkuvhtzgsq--

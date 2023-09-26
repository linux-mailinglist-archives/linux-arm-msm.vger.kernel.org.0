Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9CB37AE895
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 11:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbjIZJDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 05:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbjIZJC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 05:02:57 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C7EDE
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 02:02:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ql3xt-0002jk-4F; Tue, 26 Sep 2023 11:02:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ql3xs-00946f-IY; Tue, 26 Sep 2023 11:02:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ql3xs-004v7K-9L; Tue, 26 Sep 2023 11:02:44 +0200
Date:   Tue, 26 Sep 2023 11:02:44 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] soc: qcom: llcc: Handle a second device without data
 corruption
Message-ID: <20230926090244.fudgzxzlsa6bmm5k@pengutronix.de>
References: <20230926083229.2073890-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ryqi6y4cccenfkua"
Content-Disposition: inline
In-Reply-To: <20230926083229.2073890-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--ryqi6y4cccenfkua
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Sep 26, 2023 at 10:32:29AM +0200, Uwe Kleine-K=F6nig wrote:
> the check added here is racy. To fix that race a lock would be needed to
> protect drv_data. Alternatively (and cleaner) drv_data could be stored
> using platform_set_drvdata(pdev, ...), but that cannot be done trivially
> because there is a global function (llcc_slice_getd) that needs drv_data
> but has no access to the platform device.
>=20
> I don't know what is sensible here, so I just added this 90% fix. If you
> want a more sophisticated solution, please create one yourself and just
> consider my patch a problem report.

if you consider this a fix, the corresponding tag line is:

Fixes: a3134fb09e0b ("drivers: soc: Add LLCC driver")

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ryqi6y4cccenfkua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUSnjMACgkQj4D7WH0S
/k7EnAgAi6sBM90lhb58fvszdyYOf4LtwUTWAegZ/+re3jS0rH5nTRFilQ327mFv
uE59fSG6T98MEJV9gTP1kDjK0Ueu4ndqJbVdJQv6MaZ89HAAZJa8T5tcPsYaNclB
3ehFdXuO0qX03boXKqCvf7T1y1wrsruzydtJKBc6CVh6OfN4/SOGQxEMNg3s2YcT
T/69E4BxcoYxe3ODAqOih4pqqoR/r1NaMVLqq6lMM3UP7hxJVFO/1HvWyp3DiKIB
hns6YSrw6lW7YeHvRYhi3Lh5e3wJutNe61V5/hISIsIouNtuQ+FiAUFz5IsTI8kI
zkBqR3ThpRvqQkKYfsw+wFQx98cyqQ==
=eTwV
-----END PGP SIGNATURE-----

--ryqi6y4cccenfkua--

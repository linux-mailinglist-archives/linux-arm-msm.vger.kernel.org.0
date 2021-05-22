Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A4738D78E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 23:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbhEVVig (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 May 2021 17:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbhEVVif (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 May 2021 17:38:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D727C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 14:37:10 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lkZIs-00082U-8f; Sat, 22 May 2021 23:37:02 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lkZIr-0002wn-Tp; Sat, 22 May 2021 23:37:01 +0200
Date:   Sat, 22 May 2021 23:37:01 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robert.marko@sartura.hr>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] pwm: driver for qualcomm ipq6018 pwm block
Message-ID: <20210522213701.vuf7bbqy7vo62xb7@pengutronix.de>
References: <70ced827689b7ab35d8f3b07db8d9ccd1489e3e2.1621410526.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xayoqgdqujksviej"
Content-Disposition: inline
In-Reply-To: <70ced827689b7ab35d8f3b07db8d9ccd1489e3e2.1621410526.git.baruch@tkos.co.il>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--xayoqgdqujksviej
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again,

for v2 please make sure to add linux-pwm@vger.kernel.org to Cc.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xayoqgdqujksviej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCpeXkACgkQwfwUeK3K
7AlBBwf/ZxkgNEp14123Qn46uc+uw278ENbkfdOMBSu8bp0m8Grl4vRB18D/wo+j
y29Sfh1uaxO/83AK+NpFK09Rph7ZE1+9L4r4xpGjI63l7livqP/9e1BlMdeEKKxf
EbQzYN+qqMxikLWVwONS9J+8Q0n0Ja3C6ychjglhtpUYla1/GqdTThfmyRW+dKH7
M6NzQRf/1PmhZ5uyI8HS2r7S0+EOMXy4o/lftr3W4SZOo45FTBcASrBT70FSSXC4
s/eAqphPt/GK1ks3y4fjoE23/zFLizJRqiP689G4gCSblw3NrKScdXG8ZVz6lP6H
P9SMwqch1xKxKPyDYzGheia70btcQg==
=ut9g
-----END PGP SIGNATURE-----

--xayoqgdqujksviej--

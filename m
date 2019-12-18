Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF93C1243A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 10:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbfLRJtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 04:49:12 -0500
Received: from sauhun.de ([88.99.104.3]:35354 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbfLRJtM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 04:49:12 -0500
Received: from localhost (p54B33260.dip0.t-ipconnect.de [84.179.50.96])
        by pokefinder.org (Postfix) with ESMTPSA id BFD992C2D9A;
        Wed, 18 Dec 2019 10:49:09 +0100 (CET)
Date:   Wed, 18 Dec 2019 10:49:09 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     manuel.lauss@gmail.com, ulf.hansson@linaro.org,
        khilman@baylibre.com, chaotian.jing@mediatek.com,
        matthias.bgg@gmail.com, nico@fluxnic.net, adrian.hunter@intel.com,
        agross@kernel.org, bjorn.andersson@linaro.org, ben-linux@fluff.org,
        jh80.chung@samsung.com, vireshk@kernel.org, mripard@kernel.org,
        wens@csie.org, wsa+renesas@sang-engineering.com,
        gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
        yamada.masahiro@socionext.com, tglx@linutronix.de,
        allison@lohutok.net, yoshihiro.shimoda.uh@renesas.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 06/13] mmc: sh_mmcif: convert to
 devm_platform_ioremap_resource
Message-ID: <20191218094909.GB1054@ninjato>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
 <20191215175120.3290-6-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <20191215175120.3290-6-tiny.windzz@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 05:51:13PM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Tested on a Lager board (R-Car H2), MMCIF gets recognized and the eMMC
is detected.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl359hQACgkQFA3kzBSg
KbaiBQ/+JDGkJA7UaNpOTGoVuiePH3IUpTMrJxM1MmEK8YzOLg2VtaawBlH85BhM
Ak/0IRYbspIV/cTS9KHqGuVTGzy7CBUZk0YzF+gVRKtzNc5YZarfxzJgcwdFprzw
MARgKLO3726eNMwbR4F9qguUj9bJkwC3ANzmp6/qxlQr1R+LhXOGfFMo8I3nZVIR
aVT4n9eYo/eNZhEZJIMJ+7BAW3v0rIXbBxHaJ2iCimRdFiOt5UnHHI+4NdRk2vQo
HKqrKedwVBZ6xj+Ufmu1jaRaUoD9hdFUIshiiNZ5dKqEf5OTUyWsXKqUynXCZ0wi
Dgjf6WRASYSG0CjGhMvyMS8LfWmWOy5u3jcTLvKDQeMhmGePZMchbQ4JlauUy+Vg
t7uETcZRJzwhHZvGsv4oThYe2ucZsPWSt+rGrvabPY93cfxm+PZhcSAy6bYf08U3
UjO3rGBaw2Ne563bPvPAduYx3gZ1hyF+mLk+SXeN7mnOdn0N/HK4BHmTeiS3RsuT
4Y5QmLH1ytXo/o3yy8BRUzb+gBoOqoYoaspnz44rYeo03iQyzpssJ3+DInP/Rb3o
Jz87kXD5TunphiWkHSSGeAcE5DMy/PJvz9m2VbrnDVwJkta7IZR57ypXXEhXWrnk
gqke2OekVI1rCUiL8w6bo3jHVGbKM4hCczuiOFKwbbRNKtbADtc=
=Qzgh
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--

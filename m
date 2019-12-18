Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89DE012439B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 10:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbfLRJsD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 04:48:03 -0500
Received: from sauhun.de ([88.99.104.3]:35298 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbfLRJsD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 04:48:03 -0500
Received: from localhost (p54B33260.dip0.t-ipconnect.de [84.179.50.96])
        by pokefinder.org (Postfix) with ESMTPSA id 192732C06A9;
        Wed, 18 Dec 2019 10:48:01 +0100 (CET)
Date:   Wed, 18 Dec 2019 10:47:57 +0100
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
Subject: Re: [PATCH 02/13] mmc: tmio: convert to
 devm_platform_ioremap_resource
Message-ID: <20191218094757.GA1054@ninjato>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
 <20191215175120.3290-2-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20191215175120.3290-2-tiny.windzz@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 05:51:09PM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

I am not a big fan of this new function, but oh well...

Tested on a Lager board (R-Car H2), SDHI gets recognized and SD cards
are detected.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl359cgACgkQFA3kzBSg
KbaFBw/+Np52ahaH5+TRKI/drXlFCXUL5HuWieFoxsd85DJHgxSXOTku4oSCDjSy
tQ305gyE97P963NpUtrU9V2uovdl27ko/jA8kC9z0fxx7+DoDdTqw13JjTTBLOW9
s3dELTr7BVx5j+UEWfFBGP0VbiM57oOm+qAiNMhjoY64Fkmkn/3oroDk9M7LY+kz
GjvwgLpiDXeOylLKpHQzk4+pO1X0aGqtTncveQ8Oa/CKytN9UCDfUH7gI1HgXLeM
FDqu3HGucRHbL52bLxnz71PrJWQ3Z6Cxm46Z8mKbWDFvnLJoCIegymSGdzawqzf0
wWmBUh+LocMl6reuTeD4s5I0HDyt+LAU1Kx1R0LQMflXe9KIVukga9W20B1eh6dH
r1PDsfj9Y0GQwyY9X7PEhV90B3t/rGHhmw/XMZAMqf2xkgkrD2rlLr1aO+xLv84D
asn6q8ZYfgKF9tmN6lUnJTpP8hXKG017MOk1jS5R+2iaXi5Fp3rSmX0DpQTHye+x
/wWU9IpJ1HBKTdGWZFnJwd1SCOVzYR4mlLwvOpjiw66ZbX00y5obr773NkgjG/iA
p1mbF7OO/5MFOAZgpyM0zzCTSaWjh/GfbGEOfEVhcXErCZhS4WmQjJ3k+rg8JBn8
Pwu2Sgz+1rwyeqOiHZJtY3QkffH3x1IsskLYbK2kSHs06L2t7O4=
=XhTS
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

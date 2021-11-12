Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C0544EF37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 23:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbhKLW0O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 17:26:14 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33902 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhKLW0O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 17:26:14 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9B70C1C0B76; Fri, 12 Nov 2021 23:23:21 +0100 (CET)
Date:   Fri, 12 Nov 2021 23:23:20 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Samsung Galaxy S III Neo Initial DTS
Message-ID: <20211112222320.GD2999@amd>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Content-Disposition: inline
In-Reply-To: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Enable booting of Samsung Galaxy S III Neo mobile phone with MSM8226 SoC.
> Implemented clocks are on top of MSM8974 GCC driver because there is real=
ly
> little difference between them. UART serial communication is
> working.

Thanks for support for a phone.

You may want to cc phone-devel@vger.kernel.org in future with
phone-related patches.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmGO6VgACgkQMOfwapXb+vLWWACdFm6f8kzCbsMwgtEQPnjHUxaz
gpYAoKt9O5ILLcdCeTmKH/F8QlZaLfrR
=TlUu
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--

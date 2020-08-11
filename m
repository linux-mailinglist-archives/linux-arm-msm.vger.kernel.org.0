Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DB5241DDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 18:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbgHKQJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 12:09:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728906AbgHKQJl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 12:09:41 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6CB6206B5;
        Tue, 11 Aug 2020 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597162181;
        bh=8jTFVmarRZLLRTfqotP58rz//cPI05u7z4Z4fPoK9ZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mhmVk4N7ydGphZMmV4huNncs+K5JbFMJHish1R9dGkgTYL6kwjf20Ear+JYinh9vw
         1iY2fdLQvpZ7mwxTFteKfpXr99Pt/ga5y+Eg2ClZP3ayBqChJ4UeMkKhZcp98SzAc9
         VS8D3yP7VivBmmiyeuHdrPazLiOUK0tETerRsx8Y=
Date:   Tue, 11 Aug 2020 17:09:13 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        Mayulong <mayulong1@huawei.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/33] Add driver for HiSilicon SPMI PMIC for Hikey 970
Message-ID: <20200811160913.GJ6967@sirena.org.uk>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AXxEqdD4tcVTjWte"
Content-Disposition: inline
In-Reply-To: <cover.1597160086.git.mchehab+huawei@kernel.org>
X-Cookie: Gravity is a myth, the Earth sucks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--AXxEqdD4tcVTjWte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2020 at 05:41:26PM +0200, Mauro Carvalho Chehab wrote:

> This patch series backport the OOT drivers from the Linaro's official
> tree for this board:

> 	https://github.com/96boards-hikey/linux/tree/hikey970-v4.9

> Porting them to upstream, cleaning up coding style issues, solving
> driver probing order and adding DT documentation.

> I opted to not fold all patches into a single one, in order to:
>=20
> - Preserve the authorship of the original authors;
> - Keep a history of changes.

Please don't do this, please send this as a normal upstream submission
like other MFD drivers - split things up per subsystem and fold any
fixes into the initial submission of the driver.

--AXxEqdD4tcVTjWte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8ywqgACgkQJNaLcl1U
h9Drcgf47oBDBjVvpLy10e9lrcilMI2JzHAypdkY4X1XY/G0vFSIROQ2rUrUJ7/k
M3cRmaTWtkUkodo499B1yKd6PgsCk3GbeHV/KOUMjEJTkDZrAby0EPGu3tqggJ+6
kh5Y768OqrCx68KN3RWcQH5cIch4+ewb7b89veaufmLcga8yI2sSWUsezKk1Z9D3
uZLImihVf2au7uQ27Y9lMHuN2g8xsVeR7F1Y6rmfSK75GvlPfzvNntHPfcs2aig+
hbXJR/mV6z8HhRBYiWOCaOturerbIYpRt/pfOaFN/OaQNB0FSi/C5M1Od4icg0UG
+ymksv0gSyzXpjNIj5NmPgp5Jqso
=2YNd
-----END PGP SIGNATURE-----

--AXxEqdD4tcVTjWte--

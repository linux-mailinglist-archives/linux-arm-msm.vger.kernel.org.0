Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5E61A78F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 12:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438773AbgDNK5a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 06:57:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438770AbgDNK52 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 06:57:28 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1A74206D5;
        Tue, 14 Apr 2020 10:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586861848;
        bh=HC/z7X/QOJ8n4Wel61R5j+aAnU/kKVm52z0JLKdp0dI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SzjGmVqJ/kf8kEdv3afqCuLT3+MrPHN0Fboi86rFJN8W8mAe9WXxfRJdn0vaU1Ad5
         LU49xOnYCFOPDfF5bu2fwWU2COv/EELobDLaumXwjNWBUGLVxmkrNScdekGPIVNb7G
         00wKGGh73UoT+IpvnTqKZanz2v6TGDRmdVBb6v2g=
Date:   Tue, 14 Apr 2020 11:57:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/3] regulator: max77826: Add MAX77826 support
Message-ID: <20200414105725.GB5412@sirena.org.uk>
References: <20200413164440.1138178-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline
In-Reply-To: <20200413164440.1138178-1-iskren.chernev@gmail.com>
X-Cookie: I've only got 12 cards.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2020 at 07:44:37PM +0300, Iskren Chernev wrote:
> The MAX77826 is a PMIC found on the Samsung Galaxy S5 (klte) and possibly=
 other
> devices. It is produced by Maxim Integrated and contains 15 LDOs a buck a=
nd
> a buck boost regulator.
>=20
> Iskren Chernev (3):
>   regulator: max77826: Add max77826 regulator driver
>   dt-bindings: regulator: Add document bindings for max77826

Aside from the compatible string and the subject prefix on the DT
binding patch this looks good to me.

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6VlxQACgkQJNaLcl1U
h9D46Af/SJxcfNXW9eOmfK1epWMpCJsjv6HU6xLEC+756AfV+YFPeduENlTju/oX
NCYmt5UxMC5JjjtTjdYgRhFQCUJfeyLxYP4GtMHLl3b11lzhykvkAyvBYw+/Pcim
du97gWPk/ELVGejGc2Dgjp3OeyHqCPf3P5v2/44vHEtqBIHBDr8xhbTwrS+zLNsF
sykjBqvvg1SdNFWrt1CXyuPzY9nePYDpiJw+vm/ePFg99EMWLUic6lYHhU3izbx0
oU/w9PVg2SYuBjtql2799kt4cGcqBlf+iohZCkaTBJ+cCoKC4rshi45t8nWoM3PF
QXXiMsXnT5SeQEs+pSByZ62t+I/8dQ==
=PcSI
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--

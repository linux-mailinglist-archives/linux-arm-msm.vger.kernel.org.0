Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEEA833FA0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 21:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbhCQUm3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 16:42:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:41274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233453AbhCQUmU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 16:42:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FD6964E74;
        Wed, 17 Mar 2021 20:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616013736;
        bh=r0TC3di/TlNjjD3qHhv8fnGNSa6YAjgH+x+eyoNbNFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YWqHJ190zlBJ2pZ04hs7NYZvZpxVNza5v0V2Z+gBVGcvgJpFB6+ITef3W6lw+lJJD
         WMAFrG4JvMsYSJ3yy4BgHgOMs4NzRSYQNFY3Ex0njNhoQ1Bd76BYah5P4fqR3Fsmee
         S3Io03BwVKqNGOgfvhBddz6kPn4wwoRTCMYtJUYiSIAzIewWSEHV2N57H2akckG2+Y
         mIMkegernVgQxUWjlg+lwZCKuTpXohc4whd6qbihT8/iUBCxYr8D2VJKHQQU9YNfHP
         cWcP/XVKqtowIUVuUOQ4bb9RQqvDOtyjeYAHc+to2HwwL+bRV875b981L3aF3bpybA
         14GJOe9BNpv8w==
Date:   Wed, 17 Mar 2021 20:42:12 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/3] regmap-irq: Add support for POLARITY_HI and
 POLARITY_LO config regs
Message-ID: <20210317204212.GE5559@sirena.org.uk>
References: <cover.1615423027.git.gurus@codeaurora.org>
 <4b77a308ccdabbe96ed68623bd6eead9510e1fc9.1615423027.git.gurus@codeaurora.org>
 <20210312121916.GE5348@sirena.org.uk>
 <20210315203336.GA8977@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline
In-Reply-To: <20210315203336.GA8977@codeaurora.org>
X-Cookie: Please ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 01:33:37PM -0700, Guru Das Srinagesh wrote:

> Since I do need to write to two extra registers, I'll need two
> register_base's and two buffers to hold their data. This can be
> generalized to "extra config registers" in the framework as follows:
>=20
> - Add these two fields to `struct regmap_irq_chip`:
>=20
> 	unsigned int *extra_config_base; /* Points to array of extra regs */
> 	int num_extra_config_regs;	 /* =3D ARRAY_SIZE(array above) */

I'm having a hard time loving this but I'm also not able to think of any
better ideas so sure.  I'd change the name to virtual (or virt) rather
than extra since that's what they are so it makes it a bit omre clear.

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBSaaMACgkQJNaLcl1U
h9BFDAf/UYAPrvexl9IIeo4Rn8K0QHNy4V5WXMEh1/H7ifjO709iyNuO8i3U+6iW
HFTxBw5Dycdzv7nMklFD3eWZCV5Cyt9LfPNgDZlWY0BdYdz7ZvhnFW/UDHT7bIfj
V5k9ekNtMz0+xi54Ee1K+SouaWkWB2Tte0h4YrX04Ci+DJniPEVT5Fzrq0CVTBWH
4WCmllhs1GlPuQUJsomJul+9UHcNQaPDRYiPr/e5jioDIe3rAzM5gyfhPGrfHiIR
hzTh9mzSqCE7iqCNlezRW2mKkbVPwyJVz48llc91V0fW26EKK5Tni/KRP4pw0+hZ
WIgJgZrnov6X2pcJD8TXs0TNKc7ujQ==
=u8q4
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--

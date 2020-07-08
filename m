Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045D0218A5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 16:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729932AbgGHOpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 10:45:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729595AbgGHOpe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 10:45:34 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9595820786;
        Wed,  8 Jul 2020 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594219534;
        bh=cP+F+wz6n3hVoP8aNvSk5AWUDQcuCoNcjaP+vD3mi0c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p8p1ggFGPnEJteeBB95WXlg92wIy14eUukTWMJ98rTrbqwYdZcJBZGUYN+pWuCINt
         XKR5p/f/qA4r7A8X87MfvonfgMpiHzjS6QYwHMdhNYNt4sQzTkKwBnR2ZBo6G1r8c6
         /yDXSsapFaQp6Elc81pa5Frm12+eTa/cFMtCgq50=
Date:   Wed, 8 Jul 2020 15:45:28 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rohit kumar <rohitkr@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajitp@codeaurora.org>
Subject: Re: [PATCH v3 4/8] include: dt-bindings: sound: Add sc7180-lpass
 bindings header
Message-ID: <20200708144528.GT4655@sirena.org.uk>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-5-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e7jIye1Ygp5H0AIi"
Content-Disposition: inline
In-Reply-To: <1594184896-10629-5-git-send-email-rohitkr@codeaurora.org>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--e7jIye1Ygp5H0AIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2020 at 10:38:12AM +0530, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
>=20
> Add header defining dai-id and mclk id for SC7180 lpass soc.
>=20
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> ---

This one is missing a signoff as well, and I can't seem to see any
reference to this header in the bindings document patches?

--e7jIye1Ygp5H0AIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8F3AgACgkQJNaLcl1U
h9CXIwf/dPOevjBguwkthEqzY8waDrI4Vr76oqQ/VwaDcPs5ms8WZBlIduTiQwHe
LvggZGwuNjq49n6Yx7+vu+/uOJaTTRf99NF8bJ4FuS4aJK0VaCdUwLwwYE6xuSPq
tGc5B3e4rzdzrs+FJMmRZZ+a55RNU8MXP3j5LuecI7xlxRMifHIx8Nmn52GSI4RD
7YtEODCmd4xSh4KAEIydg9yzn8o/zMPqwv/jL8MNOEUol5x20FU4tnD2iRJ6E5Fx
n+yak8arDbKsLRjZH4xtGxhTrl4pKyeGOVrN12XcbiZupG2dDzmJi6LOR9P3HXQ9
ElQHfFZxIRiHgX9scCPEWtn0DlKV6Q==
=qOBi
-----END PGP SIGNATURE-----

--e7jIye1Ygp5H0AIi--

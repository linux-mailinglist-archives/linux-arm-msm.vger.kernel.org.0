Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6F01A8070
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 16:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405216AbgDNOxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 10:53:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:46872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405178AbgDNOxE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 10:53:04 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8E7C20787;
        Tue, 14 Apr 2020 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586875984;
        bh=tv4R4Kv4g8B0l2zpuIbUZpyLwIuD0Vzz4VJWL+g5//E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DpQH9u4F0GF0tMVItK3pYSbL4NuklFrH04SaZxWwL5AaLEOkDQqGnqv5AeDBCTtWT
         XuHrv/YtN40Fd9wEkQCg0FD3SWkyPvpV20CaxnWKhQXK3sbOhaXTlgn2DDOUNHXx+f
         FWihgb2qQLFHpy8PgS1Y2iieb2PY4DNjqwaYMJu8=
Date:   Tue, 14 Apr 2020 15:53:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/3] regulator: max77826: Add MAX77826 support
Message-ID: <20200414145301.GE5412@sirena.org.uk>
References: <20200413164440.1138178-1-iskren.chernev@gmail.com>
 <20200414105725.GB5412@sirena.org.uk>
 <f167d50f-c0d7-f359-a167-2782040ae7c3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gDGSpKKIBgtShtf+"
Content-Disposition: inline
In-Reply-To: <f167d50f-c0d7-f359-a167-2782040ae7c3@gmail.com>
X-Cookie: I've only got 12 cards.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--gDGSpKKIBgtShtf+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 04:14:01PM +0300, Iskren Chernev wrote:

> > Aside from the compatible string and the subject prefix on the DT
> > binding patch this looks good to me.

> About the subject -- I guess you mean the suffix is wrong, it should be:

> =A0 dt-bindings: regulator: Document bindings for max77826

No, it should just be regulator:.

--gDGSpKKIBgtShtf+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6Vzk0ACgkQJNaLcl1U
h9ARMwf/bwHr+jF3xwnTh1E+/hYfYVM2pXxt7TKtP2olD6Yqbp3H993TrgzlUBvo
ZM04pDydRwUS9niN6fNyd5MfxIr7WWoFlRFNelqQil2aQUyF3RHPinsVb1xUoEgh
0CPMGfa/FzKpUZy4Wbact47MVqZ12hjKyg354p+de/VaFVuL2VP/qGVFY/x/96aG
QX4nkhiPqsmmES1kF6ofzAFfwBiTi1Ee1N9mMNeEgTTLc49dI3NKS/RVelp9vjFB
n9CpV268Oxgk6bd3KIpYC7m/7MIVaYpfLHxvx68F+BwDlKeKRbxDjxsQX67wqg5N
opnkynIRmQkTpRooSZN8hRZAxAeiwA==
=QVYH
-----END PGP SIGNATURE-----

--gDGSpKKIBgtShtf+--

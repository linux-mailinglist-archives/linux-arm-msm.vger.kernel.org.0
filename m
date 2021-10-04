Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5BB420AF7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 14:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233109AbhJDMjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 08:39:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:53170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233081AbhJDMjX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 08:39:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2BCD60F35;
        Mon,  4 Oct 2021 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633351054;
        bh=t5IxpxvjY+P55udXVsSes3PxFtg/oZ6g1Bfo7R109kw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sJhMZlSPj+aw0cQ9eMYuwt0kI3SMvdk5t/3VfziYnUIPnBKbZP/XfzTId5IOlwGjE
         UbTnCibRJDMLjBTMOFMdsI+tmnV75Hwj7yKzZk7C0NHHlmAk7PaYsDIvpO6mxwG/Cp
         chlsJMrYk1PR1xBcr9VROesqXdneW/Z6/lgj7yy6x1LbsYFjqjLmhOBFRuaOL9g+0D
         eiIfWMFOgIAqrKPWMaovvctjE1rmch3xQyJ5zEi1H5NKjg7pX9qkLwHmWANfsEhCUm
         ioagYraWZYor1ofeC+RvGoYJ+rdWsUgSJDUa9keX53KkmLH9rtR6EYuoQ36o5jC8zn
         KomNjVBFkLLKw==
Date:   Mon, 4 Oct 2021 13:37:31 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] regulator: qcom-rpmh: Add PM6350 regulators
Message-ID: <YVr1iymQo1hwQtW1@sirena.org.uk>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
 <20211003083141.613509-4-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MP9O3YLHqAFEWpT4"
Content-Disposition: inline
In-Reply-To: <20211003083141.613509-4-luca@z3ntu.xyz>
X-Cookie: If it heals good, say it.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--MP9O3YLHqAFEWpT4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 03, 2021 at 10:31:26AM +0200, Luca Weiss wrote:

> Add the configuration for pm6350 regulators. The supplies are not known
> so use dummy ones for now.

If you don't know don't fix it into ABI, just don't specify anything
until someone figures out something accurate to put in there.

> Additionally leave out configuration of smps3 - smps5 and ldo17 as these
> are not configured in the downstream kernel.

Just describe everything that's there - nothing will get touched if the
board doesn't explicitly enable doing so, otherwise everything is read
only.

--MP9O3YLHqAFEWpT4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFa9YsACgkQJNaLcl1U
h9BiFAf9GE5Kr3z9GSSg5W67JENUARdF8X1+WYkjZCWNGKK8szluvluwiRCACTTB
1iOc1byWSeRBdWKwPxyN7RWuSgkm7lDe6vhgjkgk9mqcMRNYSaENF+fPU11LbqpM
HrEJh8pxKsxae6mbahCH9ZrZIHpOckD7vfFag4swHOYm4Df19cBJNSYqs2AdzQdh
lAf3oYpE5ac0hMAMd+mjDszrIcvN6VeRbNze8Mxy0D0aaZW8Ze382eu73LJpc4nx
wivjz3agK3WO066piPoHagsDJ2jHd7ykVeZK3MfWgiFt2/hitSK0FisW5Izl0b8j
zR0IxLgE19sFx7nhQt9oO4le7O09/w==
=Ok4P
-----END PGP SIGNATURE-----

--MP9O3YLHqAFEWpT4--

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E512C1376
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 20:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgKWShX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 13:37:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:40178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728722AbgKWShX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 13:37:23 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADAE42078E;
        Mon, 23 Nov 2020 18:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606156643;
        bh=78pPQyMwUZI/r/LguLYUKBHkUN+QkDK0P+wUAZwjnFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nGixC6zr4P96sRQlCQivSgaJ/pI+Jx2+WBiRuw0DGbqw3kgMbLKxA6y2qCFfN6boT
         7Bgff+eRfBAtZ6mNPERGJCqbnwi3H3tTgjVn0zf8UkTN1oiXPfeFqZ2sBxsTVNkmJF
         HtAdTlDSquuvHc7YRrcWo3IpN5u02QP9xoB5Ej+I=
Date:   Mon, 23 Nov 2020 18:36:59 +0000
From:   Mark Brown <broonie@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] regulator: Kconfig: Fix REGULATOR_QCOM_RPMH dependencies
 to avoid build error
Message-ID: <20201123183659.GP6322@sirena.org.uk>
References: <20201121063302.84090-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5/6IVfYouxg+lu1D"
Content-Disposition: inline
In-Reply-To: <20201121063302.84090-1-john.stultz@linaro.org>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--5/6IVfYouxg+lu1D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 21, 2020 at 06:33:02AM +0000, John Stultz wrote:

>  config REGULATOR_QCOM_RPMH
>  	tristate "Qualcomm Technologies, Inc. RPMh regulator driver"
> -	depends on QCOM_RPMH || COMPILE_TEST
> +	depends on QCOM_RPMH

QCOM_RPMH || (QCOM_RPMH=n && COMPILE_TEST)
should do the trick IIRC.

--5/6IVfYouxg+lu1D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+8AUsACgkQJNaLcl1U
h9CjIAf/Va99tzFOoEs4cskAX8icHsnTw0fxMMluVVQudQHsjSHVM6EPj554b/Xr
bzEeVSotMIr2NYrwb4VszvG0Ijirpis4QHK/nfoc19GlTyTFe60PXjbRzj3NsASq
17anivA4TDgfg+HgeDGZFj7485IaOvVlkQ0iuzxtPjGhJN7qj/eepetcanDEWVBV
1h5Oe0tYrid1vEfgdOHKRbDc5vUztXUXeaLxh4Z8eBHEj3tYopyxl0dIWP3IHZad
xW7qeVBTivruD5WtQc7uBgecwBCsg1rkPPQ5y33wGDZ8lHoJMJJdaHRrdZ6KWUG7
iuM9rZuTHPwmeF+rcMamUmtUhOmSDA==
=Yn6j
-----END PGP SIGNATURE-----

--5/6IVfYouxg+lu1D--

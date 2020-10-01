Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C2F2805B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 19:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732917AbgJARo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 13:44:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:46744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732096AbgJARo0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 13:44:26 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADAB02065C;
        Thu,  1 Oct 2020 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601574266;
        bh=yDehtF4IizG1+bvClOPdQB5zgSjOKIK9WCbXY0EIn5g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kIoK3hPyMXLfqCl4RYmrAichf9X9xY3fW06b6UmbjsTQodwhu5sCbtKmD6LiRLyeL
         rTd9UHbAzeoRnafR1qEhmH1N0gYHJTXlbDZbDwLnu6Z0UamY7paZ/EZQ5l36DtDZDx
         9ExkCPdrYSy+9SZZpdyhrGwfC9Er6E7klsNt5FfU=
Date:   Thu, 1 Oct 2020 18:43:26 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] spmi: prefix spmi bus device names with "spmi"
Message-ID: <20201001174326.GT6715@sirena.org.uk>
References: <1600812258-17722-1-git-send-email-collinsd@codeaurora.org>
 <160151084091.310579.3876905878885019200@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zu8lIfFVzXMVnfzp"
Content-Disposition: inline
In-Reply-To: <160151084091.310579.3876905878885019200@swboyd.mtv.corp.google.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--zu8lIfFVzXMVnfzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2020 at 05:07:20PM -0700, Stephen Boyd wrote:
> Quoting David Collins (2020-09-22 15:04:18)

> > This helps to disambiguate SPMI device regmaps from I2C ones
> > at /sys/kernel/debug/regmap since I2C devices use a very
> > similar naming scheme: 0-0000.

> Can regmap debugfs prepend the bus name on the node made in debugfs?
> Does it do that already?

It doesn't do that.  I have to say that given the use of dev_name() in
logging it does feel like it'd be useful to have distinct names for
grepping if we're running into collisions, IIRC the reason I went with
dev_name() was that it's a commonly used human readable handle for
diagnostic infrastrucuture so it makes it easier to follow things around.

--zu8lIfFVzXMVnfzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92FT4ACgkQJNaLcl1U
h9BV1Af+MHzFhdcSfvkTGxz/dXRadwepqbGIk+mz66mK12LImXcyDjJP5Oc2D2FB
pyvuCNTctqZ5Bi+vaCuPaYeqTcXaiUYoHtTha7BqdRGnmDOWIeGAFbM8EKpvPgj/
uPR0Gqp7Aw6+naIL1GERAvp+S6m6edHUQ1aljaWndhln1shy1nbgIbMdKxY0PhiC
rzIXaMor8t14alJQBaeOIW/qOMUXYe1M+sIbou6/zVQJN0xJj91bSIutjd7kmZEP
EYnTC6v55apR3nRfGuIGpeoGoy4nIS1D/rVPGWhdlGpS6/JGWnRenoel7WhtmMu0
QZIqr3SLewuunBtZqLg4uXQuNvbfJg==
=1lGM
-----END PGP SIGNATURE-----

--zu8lIfFVzXMVnfzp--

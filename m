Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9CC5281A72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 20:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388337AbgJBSFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 14:05:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:34826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgJBSFb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 14:05:31 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 903BD206DD;
        Fri,  2 Oct 2020 18:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601661931;
        bh=K98AP66VVpH1sW1F+yuwy7UvFoxzrQ3z5eMj19KgSYo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qvDSd+47gVYYokPvzqNTa7CSC30B++lr99Jdav8wlM5KOdQXYtT06x6vUfOlSQkm/
         n7LwyKlj3q8R+YIl6R2A+SFA/2+/Oi8VlPLS4Cn3BACyVv5M/YZGgMex35RP8b4uHh
         g2J9kknn48cpGPEgy7kr5pjpStA82ksE/6JDOoI8=
Date:   Fri, 2 Oct 2020 19:04:30 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] spmi: prefix spmi bus device names with "spmi"
Message-ID: <20201002180430.GG5527@sirena.org.uk>
References: <1600812258-17722-1-git-send-email-collinsd@codeaurora.org>
 <160151084091.310579.3876905878885019200@swboyd.mtv.corp.google.com>
 <20201001174326.GT6715@sirena.org.uk>
 <160157827040.310579.12112194764912078296@swboyd.mtv.corp.google.com>
 <7c45b147-f1d2-4b32-9e51-71c5d2cb576f@codeaurora.org>
 <20201002160324.GE5527@sirena.org.uk>
 <160166091282.310579.8553391053258607173@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eVzOFob/8UvintSX"
Content-Disposition: inline
In-Reply-To: <160166091282.310579.8553391053258607173@swboyd.mtv.corp.google.com>
X-Cookie: Words must be weighed, not counted.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--eVzOFob/8UvintSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2020 at 10:48:32AM -0700, Stephen Boyd wrote:
> Quoting Mark Brown (2020-10-02 09:03:24)

> > ...and doing this in the dev_name() should help other diagnostic users
> > (like dev_printk() for example).

> Don't thinks like dev_printk() prefix the bus name? See
> dev_driver_string()? So I agree that having the bus name is useful, but
> confused why there are testing scripts and things on top of regmap
> debugfs

Not that I've ever noticed, eg on the console.

> Put another way, why not introduce something similar to i2c-dev where
> userspace can read/write registers for devices on the SPMI bus?
> Otherwise I presume the test scripts inside Qualcomm are just reading
> registers out of regmap?

I know some other vendors use the regmap debugfs for their diagnostic
tools (obviously not with SPMI).  It's generally so they can get the
benefit of the cache, it's a combination of allowing the state to be
inspected while the driver has the device powered down and for devices
on slower buses being much more performant.

--eVzOFob/8UvintSX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl93a64ACgkQJNaLcl1U
h9BaWAf/cFdBtjH6GQY9ZqGf9hPnOUU0nn9nOZGmbmyOE9nWblV57YRMn+RfN/KU
rpdN/51JdNRZBtCh6lQC4llsK41K6EGf/xiscHLcl2iz+8733AuSiEM3nwa9uq7Z
Bfb/w3SN1TrVV2XYeBdEgYDFCDlpCRjfdNr4MMvRtsVmb2gUpRLL7SOk8D4rvj2t
QD93bgb13uCfQRHR5z21r+Uzz4rL4Fkhh1Ip+POrTjbuuZPPsdgSzquyk0/0VsoD
04YJxq072QvA5r42XK3HeAIl0bItvR68F/OXXdW46isM4ybE8gJ/MZLtEgFRMa+m
2T/vXwIWUYK20s/aBxAg1lLphd+PAQ==
=te6r
-----END PGP SIGNATURE-----

--eVzOFob/8UvintSX--

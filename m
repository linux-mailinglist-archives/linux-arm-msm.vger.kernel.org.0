Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F55338C8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 13:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhCLMUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 07:20:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:57104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229487AbhCLMUa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 07:20:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0C9C64FDC;
        Fri, 12 Mar 2021 12:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615551630;
        bh=ZVgs1kmNVjnQsqEDVCuzfF7dYpaysi5rGISlw4yyvbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GstXbHtnkALqftowLoX9rsUeLfuhMMuJgJ1THSWVR3zUDNziK3b+QFcdqMw9olhlW
         LDakxbc/RVg1jzA7/4X2WHRtnx+nLZnPnFezfiF80iVJWm63uP5xQbJg8scLAjgT5i
         YzTyZm8KbHCcIm6JImUjEPgBbkLeOadvI19Ko3FBFVGTxX5l/5GU1ylJ+R59vhjL4B
         zCifhQUF1ludl7k8tBAddcAwNHJOrIn5za4wFIIHB1b/1JUalNEHXSwHAnIvavlK5u
         2TNdfA4sQXa1e1wU8K0z6bn1ksq/oGL3W/lkDf4t8IuEYh5rdI2IiylLVBBlu9SCzu
         DkCcvxk5h0mFg==
Date:   Fri, 12 Mar 2021 12:19:16 +0000
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
Message-ID: <20210312121916.GE5348@sirena.org.uk>
References: <cover.1615423027.git.gurus@codeaurora.org>
 <4b77a308ccdabbe96ed68623bd6eead9510e1fc9.1615423027.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline
In-Reply-To: <4b77a308ccdabbe96ed68623bd6eead9510e1fc9.1615423027.git.gurus@codeaurora.org>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 04:39:53PM -0800, Guru Das Srinagesh wrote:
> If an interrupt is already configured as either edge- or
> level-triggered, setting the corresponding bit for it in the POLARITY_HI
> register further configures it as rising-edge or level-high triggered
> (as the case may be), while setting the same bit in POLARITY_LO further
> configures it as falling-edge or level-low triggered.

I think you probably need to bring these three fields together into a
single virtual field and then map the values within that field using
the existing type stuff.

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLXEMACgkQJNaLcl1U
h9ArdAf/e8Qn2NUnswULmvDI6nNSEiPGDSCVIUYCGoEEmFNDAisrrF2kQt2dKYi/
VqSE8DbFkQSzpokfLGMlrTXld2oH/866ZwoeuWu/tlepL6XqSVG/ca/WjyHOjhcu
RwE4NT1+PuWJ0+dkEHc7hDJS9QltabZmZ8HyTEGrCPhWY4YrA7/neEi3cBNQcQFZ
rWi5ZNk6WMNH1VmUT/pWYQV75q8pRmlzptZnvnffdIlBnOW5gzULCAsBOb3yPAb5
J0JCG9gAGhxN3B1LBoC+HrrhM6qlbT0zM0FmWuM3eHFnUgRobP8I/fVx85Dokkp4
Wtrugocig62XoEm1LJxkp52OLwYwSA==
=qEWY
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--

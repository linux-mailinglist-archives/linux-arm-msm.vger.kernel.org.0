Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F9C1FCCC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 13:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgFQLrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 07:47:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:57952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725967AbgFQLrZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 07:47:25 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBFE5207DD;
        Wed, 17 Jun 2020 11:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592394444;
        bh=c3/QWnFt5iLGaQTofmcr61auxhK/9/ececAXtvcpTyw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=14UpedtYLNDUXYNj3lMDMpr6FtOfPmEKPZlQOxSOtExirPznMhHAzsBBji3hG3E8q
         pDpM3mgMknuYGDeMfKD0oV0r99P+fuXb+FGAAMfrxjzkNlGu1SKIqTRM8CISEwRq/m
         MKFMrWwVXuKcPBHZlBz5WQrUrWhGbz15wQHYbpks=
Date:   Wed, 17 Jun 2020 12:47:22 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v4 4/5] regulator: qcom: Add labibb driver
Message-ID: <20200617114721.GD4613@sirena.org.uk>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-5-sumit.semwal@linaro.org>
 <20200602113241.GE5684@sirena.org.uk>
 <CAO_48GGgNUGosN2PiL=U5JkR3Bh5wNK3N4xYYML1UwmdfDPRww@mail.gmail.com>
 <20200602122554.GG5684@sirena.org.uk>
 <CAO_48GFwEHBGmz0QvN+pXFSyHC9+7=0aoJLHF4uupGSx2TcSvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline
In-Reply-To: <CAO_48GFwEHBGmz0QvN+pXFSyHC9+7=0aoJLHF4uupGSx2TcSvA@mail.gmail.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2020 at 05:12:35PM +0530, Sumit Semwal wrote:

> I understand from a pure regulators' correctness point of view,
> ENABLE_CTL should be the one checked there, so I can change the patch
> as you suggested, but there seems to be some performance penalty
> there.

I thought the goal was to have the performance penalty to ensure that
the regulator had actually started?

> > > The WARN_ON? This was suggested by Bjorn to catch the case where the
> > > DT binding for a PMIC instantiates only one of the regulators.

> > No, this whole loop - why this whole match and get child stuff?

> This loop mechanism is what I saw in the other qcom regulators
> upstream, so thought it was an acceptable way.
> For the two children nodes, do you recommend another mechanism to get
> and validate both nodes?

I don't understand what you mean by "two children nodes" here?

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7qAskACgkQJNaLcl1U
h9CwHwf8D6plSnWpJBT6fOA9ZBPP/820nVYr3A+7su56CgW5U+Q0a0fYck3zmpG/
WbNQm/poaHawCTQsmd6YQGs7SnBaVIJs5xyLmEtsX65EjP4jo+sYuN1/RWio+KIs
3qupZj3mYWLAVYUrsVq0nKDlrjcorsbT3Kpe/Yzg1TIg2ZYU9kwIrDvDowKkwSvD
L3oj9fzDokGBGyl8PQd/xCGuM92IrGASoUZeWbYdXfMf0BZxZ0tXN53TmwLE1Ybg
P8k94OIRbwx4z4HyNxpsy0+mKBwd3kLRIhyAwCZT+HJH13V4OrF5NfoEt3+e58TN
17C2i1cB4rfV/cHQLvJ6zkqLykqrZw==
=DTZm
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--

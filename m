Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0574D324233
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 17:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234279AbhBXQfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 11:35:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:34414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234768AbhBXQdB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 11:33:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC22564EF5;
        Wed, 24 Feb 2021 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614184338;
        bh=SgA6Prg5KGQu5C/rtNVzPT1pYsqKWIjCeo7TMpNMyCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lJF4CpDZw2ki/nHmeNIdQoH9RZ0e47IfJQA0yFDeWy+37zMeQQfg2F+OF6P3OVXld
         +RXjMCDgbiDLGlsUaFYAOTgwtUoBieG1st2GgyAh029R97IIXJNQ9x2yeeRyusx4kg
         2Pmwm+rYB2P+q9SGJoyPdbRAZeibU95NclfQXhcX9qKyMmmMA/+/b82BP4LdepWDn0
         l3wyeOTkB9B8qTliZGr6t7qb/dgHjJOpL2J/tOxl9nwGl6VIdSTiXCVLwNN4kXk7x4
         eEzo3uOCpfposC6NL2fE8/PLITY4lqKY4X3u1jNLB0g6w/Ltg6mJ/sXididVn8YLX/
         2CuAbIr4aWXcA==
Date:   Wed, 24 Feb 2021 16:31:14 +0000
From:   Mark Brown <broonie@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH 6/7] regulator: qcom-rpmh: Use correct buck for S1C
 regulator
Message-ID: <20210224163114.GD4504@sirena.org.uk>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-7-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline
In-Reply-To: <1614155592-14060-7-git-send-email-skakit@codeaurora.org>
X-Cookie: He's dead, Jim.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 24, 2021 at 02:03:11PM +0530, satya priya wrote:
> Use correct buck, that is, pmic5_hfsmps515 for S1C regulator
> of PM8350C PMIC.

Fixes like this and patch 3 should be at the start of the series, this
ensures that they have no dependencies and can easily be sent to Linus
as fixes.

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA2f1IACgkQJNaLcl1U
h9BmHwf7ByG+rddUNrtsKiDejXUO7IHX3n8fF3Hu4q9FgjW+FmZrPBeUx9TJdUId
E0AkNmmZTlDBUf+2dM9tVWWsaOAuj1OzGXD8Ig7Sfya1MQhueKyiTYEVsKVhBH86
vxF2vyko4oYpDFckwOjaUW+UK4cP9ih+ALMAYQf8P5vMs2zVE7mlPzGGIT/asS4D
twLKn9vN6mmuypoZX0usIM7LixGEd2hTKuXCGX6PU3EcB/dSEaHRyk/ZxudBC3q4
ydXjb4Er7/dirW7UD6JBQ9Kba29cuQYEapDXdVutXtMF4H1qmOwHapda6satXlbb
YpJKhH+s5Za0tgovTNwYEUY1qvxDqw==
=+k3T
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--

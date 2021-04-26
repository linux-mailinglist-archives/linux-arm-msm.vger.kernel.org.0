Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2714536B295
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 13:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbhDZL5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 07:57:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:35724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232249AbhDZL47 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 07:56:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA64B61027;
        Mon, 26 Apr 2021 11:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619438178;
        bh=5CjUY9fCZv2gxLfj+Zyj664WOetGHXJHLy1ubgP62dw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C3Y/jz8lMJ0tMzskonQBfLVqgyWLufQEmfvwcPifpuAjgqTWo4FPWvzYcHP9qK/lv
         f3EQ+E4FkH5d8g+teWT7MLXlk/956xi39uiLYB8geY6LjFyssOBSxCB+g8UxFBIVV4
         76MetGtNiKY6t/MpaYqfTolFQ7PEzU1JBi9ZkBR5a6rUlXzElI85hb56iTwQgVsIqt
         uPUeCDqwmfzqTtCX/AN6NaSeF2GoNDypMh/zerqB0lC43brfIulAsQRvbzaro/KgCi
         RBsybFNV08sSp1bAI7vOEDsD+QaQRFrmYoc89KVOHE5SatvsfuaNxf788ijGLPUx2M
         noer8ACC0oKCg==
Date:   Mon, 26 Apr 2021 12:55:48 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [PATCH] regulator: Fix current limit for QCOM PMIC VBUS
Message-ID: <20210426115548.GA4590@sirena.org.uk>
References: <20210423160658.1542090-1-bryan.odonoghue@linaro.org>
 <20210423163203.GF5507@sirena.org.uk>
 <a2152494-4e8f-27ef-07e7-e575ce3ee653@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <a2152494-4e8f-27ef-07e7-e575ce3ee653@linaro.org>
X-Cookie: Zeus gave Leda the bird.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 23, 2021 at 09:24:53PM +0100, Bryan O'Donoghue wrote:

> For type-c 3 Amps at 5 Volts is correct or 1.5 Amps at 5 Volts, either way
> the default coming out of the bootloader at 2 Amps is wrong.

It may be out of spec for USB C (though I can see someone choosing a
limit of 2A to give headroom on a specified 1.5A limit, AIUI the limits
in USB are on the side drawing the current and there's no requirement
for the supplier to enforce the limit) but that doesn't mean that the
hardware has been designed in a way that makes it safe to just increase
the limit.

> This patch deals with the higher spec VBUS current that the pm8150b can
> drive, not the power-delivery protocol juice over VCONN.

What individual components can do here isn't important, what is
important is the constrainst that the system has.

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCGqkQACgkQJNaLcl1U
h9DyBQf/XFNEgMRFlPQCHLol4kGitO/z8H8839SJUDyKS7iQIhmdAAC4FLlHs99F
GMa7Z9iPYYC6qM2SS2gdVTILb4ItjxBlBzSwTj5WeJbVfnUAfDI+ISQ9gJf/E8pB
IQsWiR932pSgT3ljVrTFwEqeTV3yu6P/+6/ELYCYT4wLu+kTNPfi+hAGUxRpK73W
gzl5ry1M0HrVkdTl+ALofiDsw52m0LweTqZv4yxkpgLfthoToFcBRe+zk+6ItFZn
YPJsROUwlVJ0cwQFzmxD0OOzI2ec66Wx7J8BUVpElKHXNcIpEknA+g0M0m8Joq3N
zjPIWjdrvEWB2YPiYpwaIS0DJWLKmQ==
=ouab
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

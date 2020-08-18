Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7CC7248B67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 18:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgHRQV4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 12:21:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726398AbgHRQVz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 12:21:55 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF3452067C;
        Tue, 18 Aug 2020 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597767715;
        bh=a/qc8sKGVzucI+tPjmonRoZfMZYekRZQVZiiJ6iHNgU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nNTolVjCJLefNKkiemdj/TUfU71J75u84t+4A2LjtK3OgKVirGOk312pJ4ALtrcy1
         IsUgFtTJwSFEMDPMl1erejrfmKciBBpF7V+/VplNJa89N7sYeWLUykY6U7XQARfAK+
         FopFzjRMkaA8WJNBGcZpCbc9VpRx7qkigIUdRmWc=
Date:   Tue, 18 Aug 2020 17:21:24 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK" 
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] regulator: set of_node for qcom vbus regulator
Message-ID: <20200818162124.GD5337@sirena.org.uk>
References: <20200818160649.19585-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline
In-Reply-To: <20200818160649.19585-1-jonathan@marek.ca>
X-Cookie: You're at Witt's End.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2020 at 12:06:49PM -0400, Jonathan Marek wrote:
> This allows the regulator to be found by devm_regulator_get().
>=20
> Fixes: 4fe66d5a62fb ("regulator: Add support for QCOM PMIC VBUS booster")
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it.  For details on what Signed-off-by means and why it's important
please see Documentation/process/submitting-patches.rst.

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl88AAMACgkQJNaLcl1U
h9DeAwf5Af/qE91SneBvgtQLR3dbKCh2LfmRCZAzfRGRxcrVkMBifBHYzepJkqdX
/UxCndapJneUArnfJmIjJVJEsQIP3ac7syn6FuyLbA27h8pQTK+ApjA73+VmSzHa
ynhdB90pxG1DZEhXOMdawk37/v5hBjJZCDze+L+Du4iUM/BS/fWpAWGT1+ycl3hu
oJqBtgEpFVhhYmZ54fo9r7RoSLAWenJ0sSqw7p6xJGc3ItjMJMO+PQZMMjZBoCnt
SqtvH+E9kKSZD/abOUmL+jR0NYJElaqkYnf8rylttrLGg+NMhObJEwEBrZp0I6Gw
/dWjZkGW6l87owxa+Bbyl5maAj8Qmw==
=sMrH
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--

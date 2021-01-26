Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A660C304D13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 00:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731545AbhAZXCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 18:02:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:42746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392361AbhAZR7P (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 12:59:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9D2A22228;
        Tue, 26 Jan 2021 17:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611683915;
        bh=JqysvydwDUKj1yfhbxxNYxFV3o0GLYfGUQY0dhuSy8E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DKsiFyHZdKqd8yujcPLEsK5kbxR3hgBE+vDlm45CwddOk5jvn6QoIYatuDQWgvjGG
         +GLG9bAs7mzkpzWI5wmhx1THuHpc19n2qEZbau+ZmlR/t0rtRuWu5qFszGtdbxYZGV
         /U5bUTApJocxMtffqhaF2NJNlNXE3x91CsnQgBynPSD3wdQHNCSvMsROTE80JNZqGP
         scUmSTXHw1Ye9TDzRV/3iO7I5+0bLaXEL9gPobm2hPGCCn3s46OlysZLeZlA7xTfYL
         305JXjPGaz6zGYceaBz8LO3xEWtFBD9h8VNTS8tGxxsU4vbcoMldL41ZmVPJB5tOBb
         WIGedf1b3xszg==
Date:   Tue, 26 Jan 2021 17:57:52 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, Mayulong <mayulong1@huawei.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 00/21] Move Hisilicon 6421v600 SPMI driver set out of
 staging
Message-ID: <20210126175752.GF4839@sirena.org.uk>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
 <YBBXcdLbj92yMJhw@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FoLtEtfbNGMjfgrs"
Content-Disposition: inline
In-Reply-To: <YBBXcdLbj92yMJhw@kroah.com>
X-Cookie: I don't understand you anymore.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--FoLtEtfbNGMjfgrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 26, 2021 at 06:54:57PM +0100, Greg Kroah-Hartman wrote:

> I've applied the first 13 patches, except for patch 3, as that did not
> apply, to my tree, thanks.

Is there a branch we can pull from?

--FoLtEtfbNGMjfgrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAQWCAACgkQJNaLcl1U
h9DWLwf9GOwp0ilayT81yRRDzKHtM/R3iAuHhu+73HMAoE1RVse5WGuQJZdgfuzz
RGMUEVfOhxguPn/C6yzxTcPWJbrF7vlyfqR5a0wrD725Y4eVsVVCVvW7wsZW0Vcr
s1FnzFGzfgEhuL+EOWzvB8cJoW6G+mz/8Ddez5VIK/syAtarmrYHDqUH5Nuox914
R6FJD37IyTE3/P2ddv8jltJYaepL15MgI2A/5PqeI2jqRcZ1wshafliorZ0ISfnh
2IncyITNtZKJQAJ2+b3gHxr9UaW5kJeQL+fuUxKsQB8rAZ+m1ixiw97FmI4pMr+W
+M6SBEeOR7dwFi3RF9ip9vlyh2k5xg==
=4XGD
-----END PGP SIGNATURE-----

--FoLtEtfbNGMjfgrs--

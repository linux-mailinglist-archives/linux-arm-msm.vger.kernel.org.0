Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2FA306203
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 18:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236080AbhA0Ra1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 12:30:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:42902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235778AbhA0R3P (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 12:29:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 983C760187;
        Wed, 27 Jan 2021 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611768514;
        bh=mYtzn/q1nKLwQRM6vNVlonRfNKC+omR21A7650MMNT0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CKLLrmy0SIBF0Pgq2xxc/DQ6/f4dlPuS9Zy9L9R7QWYWZTZ8MX8KCsTNd/knGvUlb
         NPIUz0tP9l4ovfbrPTeakcW4TFWFDODq9KQ0JhxQC0ke6rDCAveaiY636aWUWZ99C2
         bi1254+7GWlcuh7FKK/dIW6lL42n907P2pr1V7DsfSMUtcMIBn6CVpMVkN6M+Pcj6k
         uC72+qecvtmy9MIOfgEGKbn/OHwY/Iue+XSO05HmanQB9B5jn1qOgyr545WDYtA8mu
         wQBWlvZDfRctMjgzLgGPpYTxrLFanj61fZXsEM6O/maN/BSLbUe/EBPPVIhyXc5psm
         I0L/a3xtHNYQw==
Date:   Wed, 27 Jan 2021 17:27:51 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Mayulong <mayulong1@huawei.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-arm-msm@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 00/21] Move Hisilicon 6421v600 SPMI driver set out of
 staging
Message-ID: <20210127172751.GF4387@sirena.org.uk>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
 <YBBXcdLbj92yMJhw@kroah.com>
 <20210126175752.GF4839@sirena.org.uk>
 <YBBZP9LjXPi/rzfP@kroah.com>
 <20210126181124.GG4839@sirena.org.uk>
 <YBErBByYD8lNIWAX@kroah.com>
 <20210127120426.GB4387@sirena.org.uk>
 <YBFrc/yk7uvh9HX8@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bGR76rFJjkSxVeRa"
Content-Disposition: inline
In-Reply-To: <YBFrc/yk7uvh9HX8@kroah.com>
X-Cookie: La-dee-dee, la-dee-dah.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--bGR76rFJjkSxVeRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 27, 2021 at 02:32:35PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 27, 2021 at 12:04:26PM +0000, Mark Brown wrote:

> > The whole reason the driver is in the staging tree is that Mauro has a
> > requirement to do things in a way that preserves history and so won't
> > send any non-incremental patches.

> Ok, should we wait until after 5.12-rc1 is out then?

Ah, turns out I actually need up to patch 14 anyway which updates the
MFD bits so may as well leave things for now and work out what to do
once that's reviewed.

--bGR76rFJjkSxVeRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmARopYACgkQJNaLcl1U
h9CALQf+LPgVavGx9La4+KJMbPR1EyEKu26jy8GRu6wk+6SwMFiQQUjbCZBZjEEs
UME4UHzjtdoiXx0RClRXBJVQ7C76CXNcKY4G4OaogtsmftOLxmR07ykhkoCLkIMx
xozYQjnmNgtQTFnUQjLJ4/RpVpVYAgLjQomEMROJetWtbMwEB4coiaWDuFGux8XZ
i1nhW51kyznvzezgUJnEfmmA66wToltj+R6Tx7cuwnpMLFll1oGtZNlgnHl9oxiQ
/Jge6+/XcFze/4N/jFa6YidUftYRM8mnyO89Y9Nzy+t9LnL++/K+od8CMHi7M8nI
yE+LH+Zv+1KtZa9szMsX0D/zDgOR7Q==
=qC2N
-----END PGP SIGNATURE-----

--bGR76rFJjkSxVeRa--

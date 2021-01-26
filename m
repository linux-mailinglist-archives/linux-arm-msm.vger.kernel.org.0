Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FF1304D17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 00:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731560AbhAZXCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 18:02:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:45524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394229AbhAZSMr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 13:12:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20A7820780;
        Tue, 26 Jan 2021 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611684726;
        bh=37j/jpNataYZFpVX890tq37uguJ0zy2E+OtjeAdyp2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J83Q2v41VJpXFMJIOWBdp4DJpkzdEYeoFYDsIp4a8KAYHxSgYYnep3uo6HcGZSA4L
         AY3zMhC3ZlacogVThGHaGC7SQcfdO3iOMc0f2LKBLCcSo4hZSCjlxD8Aa2l3zalngu
         QwEzYUs8sd5X3UtMjtaIfq9tHtGYfZBsNEHn3Yt/2mjs1rp6fkB/xEh9b5cGL35DjR
         lu9YOQUgEA2Pyq7ibf6hZgi7ZSOSpP6jIp6S1wZFKFu6uvNOBWLkZzAExQCu8Iifz5
         PAHlJiQPpoC/4+7smILuum5+EwZLHp1Ye1Y5ch56xmCMdVvx7vSulpmGZmPPl5XNaD
         okzdqScSd+wzw==
Date:   Tue, 26 Jan 2021 18:11:24 +0000
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
Message-ID: <20210126181124.GG4839@sirena.org.uk>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
 <YBBXcdLbj92yMJhw@kroah.com>
 <20210126175752.GF4839@sirena.org.uk>
 <YBBZP9LjXPi/rzfP@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lQSB8Tqijvu1+4Ba"
Content-Disposition: inline
In-Reply-To: <YBBZP9LjXPi/rzfP@kroah.com>
X-Cookie: I don't understand you anymore.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--lQSB8Tqijvu1+4Ba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 26, 2021 at 07:02:39PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 26, 2021 at 05:57:52PM +0000, Mark Brown wrote:

> > Is there a branch we can pull from?

> Once 0-day passes, you can pull from my staging-testing branch from
> staging.git on git.kernel.org if you want.  Give it 24 hours to pass
> before it hits that location.

Thanks.

> Do you need a tag to pull from?

It'd be nice but not essential.

--lQSB8Tqijvu1+4Ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAQW0sACgkQJNaLcl1U
h9DkuAf+I7C5HDi8sRGbQ5BB8gnyBQc1J1NvPGhgCZLqgcZ/C6kaERvIEIUx415Z
tKXNEW2y1+JCItwwxaggUZntczggAKTsttUr05nZLfggBZVfOaRlHTSocejd8ybT
8J1A5onhtDBcHHYfKOeET14kS4ie1HLWqIdOAnN/rsIcaQ+v7w+LFvJ6NxdbI1d3
LsiWeEPsfgqNZOtlP4h8cCvo2Oky2TbXFvKFz0mKa9iKb+QXfEPjdgTlJj9uJaG3
38HRI8sr652FqHQQAacySWVyKFELguBd+AOqDxTdpxrYod2vJuhgPYS+4j/eiYHp
MlLwWUv9cc+VvM2Hlx3f8g+5lWxcXQ==
=v1EX
-----END PGP SIGNATURE-----

--lQSB8Tqijvu1+4Ba--

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DAF305ADD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 13:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237571AbhA0MHp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 07:07:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:42234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237541AbhA0MFu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 07:05:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD01220781;
        Wed, 27 Jan 2021 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611749109;
        bh=3RBTVL1iF42NCBHvowP/tzdrAJTD7tRnl7zSmjKg/BU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RqiTxbZ+x1490GbJal6dfrK8j/avd6fsnOy+FrkbXMElpnrSd3nLHJDKtC2Mz5y6d
         ChtaV0tRp36ta2YMGyfuLXxdCdBmK96FpKGkW8mHtEdX371me5Mqwvpp4YXJhXdlEs
         OGTwXdUPK/SHwqWHUwxhI9XAkWhpAX9eSSpSb1NDQy5hFjqGVPleJDzUOatmguqZUI
         YolMtRHNDRPs4pdP5iOD2bSl5VuxPxkk1xjgxE76ykYL2BGXufO3Qw4QVweCnWb/1e
         nfvCxRX6ZKMZIHguB4ysQDYP8dyTaUn6Cp6wqLtlSKuj7p7Cj/ueKMFnIoQub6ITTP
         hApq6CKKK0jqg==
Date:   Wed, 27 Jan 2021 12:04:26 +0000
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
        linux-arm-kernel@lists.infradead.org,
        Colin Ian King <colin.king@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 00/21] Move Hisilicon 6421v600 SPMI driver set out of
 staging
Message-ID: <20210127120426.GB4387@sirena.org.uk>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
 <YBBXcdLbj92yMJhw@kroah.com>
 <20210126175752.GF4839@sirena.org.uk>
 <YBBZP9LjXPi/rzfP@kroah.com>
 <20210126181124.GG4839@sirena.org.uk>
 <YBErBByYD8lNIWAX@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <YBErBByYD8lNIWAX@kroah.com>
X-Cookie: La-dee-dee, la-dee-dah.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 27, 2021 at 09:57:40AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 26, 2021 at 06:11:24PM +0000, Mark Brown wrote:

> > > Do you need a tag to pull from?

> > It'd be nice but not essential.

> Why do you want/need this?  Having these changes in your tree is good,
> but what about other coding style cleanups that I will end up applying
> over time before the 5.12-rc1 merge window opens?  Are you wanting to
> take the moved driver in your tree, or something else?

I want to apply the regulator driver so I stop being sent this patch
series which will help keep my backlog more manageable.

> Traditionally moving drivers out of staging can be done 2 ways:
> 	- all happens in the staging tree, I take an ack from the
> 	  subsystem maintainer that this is ok to do.
> 	- A new driver enters the "real" subsystem tree, and then I
> 	  delete the driver in the staging tree.  This doesn't preserve
> 	  history as well (not at all), but can be easier for trees that
> 	  move quickly (like networking.)

The whole reason the driver is in the staging tree is that Mauro has a
requirement to do things in a way that preserves history and so won't
send any non-incremental patches.

> Which ever works for you is fine with me, but relying on the code to
> stay "not touched" in my tree after you pull it almost never happens due
> to the number of drive-by coding style cleanups that end up in the
> staging tree every week.

I'm sure someone can work out the conflicts if they're going to happen.

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmARVsoACgkQJNaLcl1U
h9CwZwf/Y4GV970+UoDmVlH4gvV6PpELe5BpI9sfABbfvY4sD+ozqjiJdzjRecw3
yn5O3nm62AX6VR3vEhua6wA8iZAg6ShI1kVX8u8atddzuPwPDYkIjjW0y94kI5j0
Fle7XbIJQpaSkFOykOaqKe6PoVl/CdGXp2dQ1Dvno6LecZnEkalJ47lSdLawUgax
9POSQ0pg5htrSwGfBSjsmtIO1szwkuJs2KTn/nwQR+EF9+HMZH/fdDOwoslB06cA
m+SM+rQyE7O/cbEZepBc1REC9ND4cpZPIQ9VmodaoqajQ89oSdGf3dhN8RaFpBWq
9j/SadeGlnCgk583W33vC5H3R73uZA==
=Voti
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA2A1CF390
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 13:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgELLo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 07:44:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:35654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbgELLo4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 07:44:56 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C96AA206CC;
        Tue, 12 May 2020 11:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589283895;
        bh=q7CeDCgeFWLtQ2pVmu7QUtCPdGgoF7Ine1hJnCzA+TI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sOQnMm5QEEkxQGEc0XhMom0YLJgMFWRbDd1OZbc4nvJgTW9dvJlvEe/H8uwRX8ZRu
         i3sxiaQLQJ7to6eXqAfUme3ryq//pv5dzlcVqgYvBBPzfbcD1xDjjR9KudGYQiQQof
         BXxDpDoHLMosu4nLP9vXdhfPAthHPo6N6EXhDWdw=
Date:   Tue, 12 May 2020 12:44:52 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, agross@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
Subject: Re: [v2 3/4] regulator: qcom: Add labibb driver
Message-ID: <20200512114452.GE5110@sirena.org.uk>
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
 <20200508204200.13481-4-sumit.semwal@linaro.org>
 <20200512021509.GF57962@builder.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Content-Disposition: inline
In-Reply-To: <20200512021509.GF57962@builder.lan>
X-Cookie: The only perfect science is hind-sight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 07:15:09PM -0700, Bjorn Andersson wrote:
> On Fri 08 May 13:41 PDT 2020, Sumit Semwal wrote:

> > +	int ret;
> > +	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
> > +
> > +	while (retries--) {

> Mark's suggestion of extending _regulator_enable_delay() to support
> polling is_enable() seems reasonable.

> The only complication I can see is that code path currently doesn't have
> any expectations of the regulator not being operational at the end -
> this seems to offer that possibility. So some care needs to be taken
> there.

Are we expecting that to happen in normal operation?  Generally this is
a pretty serious problem.  In any caser if we're adding checks of status
we'd need an error return if the status doesn't show the regulator is on
after some reasonable time.

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl66jDMACgkQJNaLcl1U
h9CdOggAgXP9kFKpXNgKVebfykSbXg94s/dvk5jSk4VzlFuvOt/R8fDWQtR2SedB
8VPyx7o8DFR1CbiVq20OnqfNn7cygyu9FeLyB1+/BZXfOXTALqYHnB+38EgVVN2u
k/HNUYRl8L7e8aI/+eSettgICpsN55xlY/SXu4bKhEgAOcCDFQVb3jAKE2bYR89L
tRSC1eDzIRbHlhaEg3Z/t5hOv2l+AiU5dzTBiVkHe0S34CHTmu8o3fuT2jOYgDdd
zi2R7S86GLo64+5SwbhY6jP76msta5BEvLisU5Dant8pwVBBQ6ExrRYdwiRHCOir
g7NGd1XsPqbxRW4l9Pb8Hhatnw2H+w==
=QxDp
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--

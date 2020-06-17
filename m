Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652FA1FCD06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 14:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgFQMGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 08:06:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:35652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgFQMGF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 08:06:05 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97EEA208B3;
        Wed, 17 Jun 2020 12:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592395564;
        bh=wpHNM7a0x9xh43O97ZXpEAK78b75Zk7jEhGLYKlTJYQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ll7bfANKE7WcYte8KIeK1ukCYwFoo48AwtZ1HGdpUHtGRxnlqJ0Vy9KptkkM6U/ph
         xw4MYy5mWWgb4OyA+JdM/j0r5o1zLRNuz37gjTXdqFxL/LudyWNWr4/DivCadDL2w6
         YweaNwqPeW8qgDvULXpPU2E9tw8wBKIEkFOu2QSo=
Date:   Wed, 17 Jun 2020 13:06:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v4 4/5] regulator: qcom: Add labibb driver
Message-ID: <20200617120601.GE4613@sirena.org.uk>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-5-sumit.semwal@linaro.org>
 <20200602113241.GE5684@sirena.org.uk>
 <CAO_48GGgNUGosN2PiL=U5JkR3Bh5wNK3N4xYYML1UwmdfDPRww@mail.gmail.com>
 <20200602122554.GG5684@sirena.org.uk>
 <CAO_48GFwEHBGmz0QvN+pXFSyHC9+7=0aoJLHF4uupGSx2TcSvA@mail.gmail.com>
 <20200617114721.GD4613@sirena.org.uk>
 <CAO_48GF9pKZCCof170TvB0ubOkecDzcGhtUUuY_Td78L1J338A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dzs2zDY0zgkG72+7"
Content-Disposition: inline
In-Reply-To: <CAO_48GF9pKZCCof170TvB0ubOkecDzcGhtUUuY_Td78L1J338A@mail.gmail.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Dzs2zDY0zgkG72+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2020 at 05:27:12PM +0530, Sumit Semwal wrote:
> On Wed, 17 Jun 2020 at 17:17, Mark Brown <broonie@kernel.org> wrote:
> > On Wed, Jun 17, 2020 at 05:12:35PM +0530, Sumit Semwal wrote:

> > > I understand from a pure regulators' correctness point of view,
> > > ENABLE_CTL should be the one checked there, so I can change the patch
> > > as you suggested, but there seems to be some performance penalty
> > > there.

> > I thought the goal was to have the performance penalty to ensure that
> > the regulator had actually started?

> IMHO, with the poll_enabled_time mechanism added, we would not need to
> wait for the full enabled_time time for the regulator to get enabled,
> but we could poll (and potentially know earlier) if the regulator is
> enabled.
> The performance penalty I was talking, is about how should we check if
> the regulator is really enabled or not - via reading the STATUS1
> register, which seems to tell the status a bit faster, or via reading
> the ENABLE_CTL register which we also use to enable/disable the
> regulator, but which seems to be slower in updating the status.

That seems...  interesting.  Are you sure the regulator has fully ramped
when STATUS1 starts flagging?

> > > > > The WARN_ON? This was suggested by Bjorn to catch the case where the
> > > > > DT binding for a PMIC instantiates only one of the regulators.

> > > > No, this whole loop - why this whole match and get child stuff?

> > > This loop mechanism is what I saw in the other qcom regulators
> > > upstream, so thought it was an acceptable way.
> > > For the two children nodes, do you recommend another mechanism to get
> > > and validate both nodes?

> > I don't understand what you mean by "two children nodes" here?

> The two 'lab' and 'ibb' regulator nodes that are part of the labibb node.

Use of_match and regulators_node like other regulator drivers.

--Dzs2zDY0zgkG72+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7qBykACgkQJNaLcl1U
h9A7jQf8CCs02e+A0GBFWNgeWSAN+m8AsYcegTecq5HlNIaIAoPNmoMLmLBUMdg/
qIc06CALDf0pE7/pTCbtmnbEqPUMpiliLrh63rhVG/MayYXLBDj9EbV74OpUtcdY
B6alKR7+hKr8PfYK3rAjOE/m+gUsn3ILj2KNwvfEfh4rccY77meIbvXnUvR24daa
R7mNCaE0Rws5qi8e76nNyOcFR7faFQZ1wswkJVhgsb115sfHfrdULpE7sTcJQA4v
fQR9oC32Xiw/b//8a7mj1ssIzGGmz460Vd7Ki6j68grBI+NUAH+KcSTf/g7ZFuQ5
0FH9xjbZZzA9VFpObtdgRaEv+pKOJA==
=oU23
-----END PGP SIGNATURE-----

--Dzs2zDY0zgkG72+7--

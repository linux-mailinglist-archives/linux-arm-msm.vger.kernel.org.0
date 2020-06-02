Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67DD41EBB98
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 14:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgFBMZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 08:25:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:60474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbgFBMZ5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 08:25:57 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 155142053B;
        Tue,  2 Jun 2020 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591100756;
        bh=KcXCds+C0vJpkzA4uQ5xZFjmf4+Ba/oTQaZUFFIdcYY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=usVEqLXx5n0/bxcD8PGqg5y3iYcEFxYLx8CTYThkjhKTo+wJYSbvPB+NBfXL1U3K9
         4+qqCcZ/lgBFYLBH1+jxeMdCZV2LQXouetoxFw1jsN8LLr1/HU+VfKJKSyS1DejPvn
         XpYI+UmHM8McGAdMNZpWUPP6oTyxhaKLy+wCQrdk=
Date:   Tue, 2 Jun 2020 13:25:54 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v4 4/5] regulator: qcom: Add labibb driver
Message-ID: <20200602122554.GG5684@sirena.org.uk>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-5-sumit.semwal@linaro.org>
 <20200602113241.GE5684@sirena.org.uk>
 <CAO_48GGgNUGosN2PiL=U5JkR3Bh5wNK3N4xYYML1UwmdfDPRww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gm5TwAJMO0F2iVRz"
Content-Disposition: inline
In-Reply-To: <CAO_48GGgNUGosN2PiL=U5JkR3Bh5wNK3N4xYYML1UwmdfDPRww@mail.gmail.com>
X-Cookie: We are not a clone.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--gm5TwAJMO0F2iVRz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 05:40:45PM +0530, Sumit Semwal wrote:
> On Tue, 2 Jun 2020 at 17:02, Mark Brown <broonie@kernel.org> wrote:
> > On Tue, Jun 02, 2020 at 03:39:23PM +0530, Sumit Semwal wrote:

> > This should be a get_status() callback...

> From my (limited) understanding of downstream code, it seemed like for
> this set of regulators, the 'enabled' check is done via the
> 'REG_LABIBB_STATUS1 reg; for some reason, not via the same enable_reg
> / enable_mask ones.  That's why I used it as is_enabled() callback.
> I will try and check with the QC folks to clarify this point about
> their hardware.

The way this is functioning at the minute the downstream code is just
buggy.

> > ...is_enabled() should just be regulator_is_enabled_regmap() and these
> > functions should just be removed entirely, you can use the regmap
> > operations directly as the ops without the wrapper.

> The 2 wrappers are a precursor to the next patch, where we keep track
> of regulator's enable status to check during SC handling.

Add the functions when they're useful, not before.  TBH if the register
is write only you're probably better off adding a register cache.

> > > +     match = of_match_device(qcom_labibb_match, &pdev->dev);
> > > +     if (!match)
> > > +             return -ENODEV;
> > > +
> > > +     for (reg_data = match->data; reg_data->name; reg_data++) {
> > > +             child = of_get_child_by_name(pdev->dev.of_node, reg_data->name);
> > > +
> > > +             if (WARN_ON(child == NULL))
> > > +                     return -EINVAL;
> >
> > This feels like the DT bindings are confused - why do we need to search
> > like this?

> The WARN_ON? This was suggested by Bjorn to catch the case where the
> DT binding for a PMIC instantiates only one of the regulators.

No, this whole loop - why this whole match and get child stuff?

--gm5TwAJMO0F2iVRz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7WRVEACgkQJNaLcl1U
h9Bcsgf+L757LfmrtbQBFRq6xc+oF9b4lRuul8tNZrGgcwIPLmtv7hnB/pgCJa1/
loIMHSdYxv0WOpI2c2TTM5IqRvNSes06fnqrfdvtMZLtuGXyShmgucUTSRo2RelJ
V0jTXBv6ts+87UKUJWB8MpC4mqK1dL4J8j/T06dk74MMpBROtG06A/RFBEI6iLkM
c8WcshwZE07wFZUBqBdTkDWtxtJC3bm7BDEOqbKzzX82ucv/bLYtRsHmZIReRz17
A7InguaSDI0zmLYHcu7beRgNOnECADi6IEQSU+sdnkFiqi+qitvWPG06kurLvxiQ
Mv2K+krQeXcWmWXBJTDvlHBJcU8M/A==
=R6kd
-----END PGP SIGNATURE-----

--gm5TwAJMO0F2iVRz--

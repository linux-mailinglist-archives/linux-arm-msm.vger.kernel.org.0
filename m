Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D6C1FCD88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 14:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgFQMim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 08:38:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:48206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgFQMil (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 08:38:41 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54ACC2098B;
        Wed, 17 Jun 2020 12:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592397520;
        bh=HOdAF9PkDDZt0fIlDrdVPJRCgbbRxePx4HnejZ5IJi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RSc8e+bo3qH0FA9g7o9sD5Y+XAj6jNCBNoyADskGoUaP0m4GuT9xKHmtbYQRG2yy8
         Vryrx9Y+EAeO7q4Gyh9xM/eZHTPdGrXzd/Si1l3Ca1l3sZ0kxzYW/1UhdrWInLq+Gb
         GBb8f0vcg4kwS3ogwe19Kddqvtv1ipFnx/H/lp/Q=
Date:   Wed, 17 Jun 2020 13:38:38 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v4 5/5] regulator: qcom: labibb: Add SC interrupt handling
Message-ID: <20200617123838.GF4613@sirena.org.uk>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-6-sumit.semwal@linaro.org>
 <20200602122205.GF5684@sirena.org.uk>
 <CAO_48GGY2TRVPXFVCvo9fEoknw65sz9BrL-mp+SZ=_EAo88t-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GLp9dJVi+aaipsRk"
Content-Disposition: inline
In-Reply-To: <CAO_48GGY2TRVPXFVCvo9fEoknw65sz9BrL-mp+SZ=_EAo88t-A@mail.gmail.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--GLp9dJVi+aaipsRk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2020 at 05:36:43PM +0530, Sumit Semwal wrote:
> On Tue, 2 Jun 2020 at 17:52, Mark Brown <broonie@kernel.org> wrote:
> > On Tue, Jun 02, 2020 at 03:39:24PM +0530, Sumit Semwal wrote:

> > > +
> > > +     ret = regulator_enable_regmap(rdev);
> > > +     if (ret >= 0)
> > > +             reg->enabled = true;

> > Can we not read the register we just wrote to here?

> As I mentioned in the other patch, it seems there is a (noticeable)
> delay in getting the value to reflect in this register for IBB.

This sounds like it may not actually have finished enabling fully?

> Also, from the notes from the downstream driver (also copied below),
> it seems like during short circuit there is another protection system
> that can cause the registers to be cleared, hence the need to track
> the current state in software.

If the regulator has been disabled underneath us in a way that means it
won't come back the driver should be reflecting that in the status it
reports.

> > > +      * Check if the regulator is enabled in the driver but
> > > +      * disabled in hardware, this means a SC fault had happened
> > > +      * and SCP handling is completed by PBS.
> > > +      */
> > > +     if (!in_sc_err) {
> > > +
> > > +             reg = labibb_reg->base + REG_LABIBB_ENABLE_CTL;
> > > +
> > > +             ret = regmap_read_poll_timeout(labibb_reg->regmap,
> > > +                                     reg, val,
> > > +                                     !(val & LABIBB_CONTROL_ENABLE),
> > > +                                     POLLING_SCP_DONE_INTERVAL_US,
> > > +                                     POLLING_SCP_TIMEOUT);

> > Why do we need a timeout here?

> IMHO, This seems to be the time required by the PBS to actually
> disable the regulator? If the PBS is not able to disable the
> regulator, then it points to a more serious problem?
> I'm sorry, that's just my understanding based on the downstream driver
> :/ - not much input is available from the QC teams about it.

So it might generate an interrupt but then take a long time to take the
actions associated with the interrupt that allow us to tell what the
interrupt was about?  That doesn't seem great.  Do you know if this code
has ever been exercised, the error handling code appears unusually
involved here?  Normally errors don't routinely occur in production.

> > > +                                             NULL);
> > > +             regulator_unlock(labibb_reg->rdev);
> > > +     }
> > > +     return IRQ_HANDLED;

> > This returns IRQ_HANDLED even if we didn't detect an interrupt source...
> > Especially given the need to check to see if the regulator was turned
> > off by the hardware it seems like there must be some false positives.

> Right - I'm not sure what else can I do here.

Only return IRQ_HANDLED if we actually managed to figure out an error to
report?

--GLp9dJVi+aaipsRk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7qDs0ACgkQJNaLcl1U
h9A4bwf/Rmar2mhyhznLpWbPuV2Pq9HgCst5AvtDPMP6QIQXwfhGid/yKU93ZZ3u
3+YYBNbWMl5Jww0o3wtzdZrYGaWMlwIf52RGqvJln4EMW+IKgLl1bzbLLP9Zqe63
t+/9kFse1b9ofK6jxxRLrVD4d+qe0lHmt+vmxx6+2hox+RE+SjztCjIbuHyNiC/g
65wVS2b/o6/N7x4Ff2eADLqAQlVXwqnAkXZpr+arZtPW5MCxQSVG3hovDL7jkBdf
xfPa+20W2cejsiV1s97+X974NVlqWrSDrz0gsi9obUEM4lda2kg+A3I2kfLed1k2
0EG1aUj/yF6bGGoeat+g4hwcXJ0VRQ==
=7Jub
-----END PGP SIGNATURE-----

--GLp9dJVi+aaipsRk--

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D911BBBFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 13:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgD1LJq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 07:09:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:32942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726416AbgD1LJp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 07:09:45 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A16920661;
        Tue, 28 Apr 2020 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588072185;
        bh=MGWunbA8swfXX7fdfm8HfW6mgSmyUonlAUB6TuoF+Jg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kpOvLK49PTFx1bL0adrxIRN7QJJKw5OLlWEjnKqAtoMgznGBL9n14T49UUJOfvvYi
         Qbrc8Ys2eY57Ye9gbLsyVdqKQ7359Jcrr3ir3j0M0nKdcKZRR9wY+kV5JfU+OdRvHv
         cdP+quDPGAJUgLGSCgYDZPuaKs+0CPeFyk/iWV4o=
Date:   Tue, 28 Apr 2020 12:09:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Nisha Kumari <nishakumari@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org, lgirdwood@gmail.com,
        mark.rutland@arm.com, david.brown@linaro.org,
        LKML <linux-kernel@vger.kernel.org>, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 4/4] regulator: adding interrupt handling in labibb
 regulator
Message-ID: <20200428110942.GC5677@sirena.org.uk>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-5-git-send-email-nishakumari@codeaurora.org>
 <20190613172738.GO5316@sirena.org.uk>
 <CAO_48GEYAWBgzeEKx1kjjmLJ+F0chSkRs0EUC86Y2q20kyqjkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline
In-Reply-To: <CAO_48GEYAWBgzeEKx1kjjmLJ+F0chSkRs0EUC86Y2q20kyqjkA@mail.gmail.com>
X-Cookie: Eschew obfuscation.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2020 at 10:46:52AM +0530, Sumit Semwal wrote:
> On Thu, 13 Jun 2019 at 22:57, Mark Brown <broonie@kernel.org> wrote:

> > > +     /*
> > > +      * The SC(short circuit) fault would trigger PBS(Portable Batch
> > > +      * System) to disable regulators for protection. This would
> > > +      * cause the SC_DETECT status being cleared so that it's not
> > > +      * able to get the SC fault status.
> > > +      * Check if LAB/IBB regulators are enabled in the driver but
> > > +      * disabled in hardware, this means a SC fault had happened
> > > +      * and SCP handling is completed by PBS.
> > > +      */

> > Let the core worry about this, the driver should just report the problem
> > to the core like all other devices do (and this driver doesn't...).

> I (and Bjorn too) looked to find the api that allows us to do this
> short circuit reporting and recovery in the core, but couldn't find
> anything except REGULATOR_ERROR_OVER_CURRENT which also looks like
> it's used only once in the code.

A short circuit will generate excessive current (and detection of a
short circuit is usually current based) so using the same notification
should be fine.  If you're concerned about this feel free to add a
specific notification, and add any handling you need in response to that
notification.  You certainly shouldn't be just reenabling the regulators
in your driver.

Mostly AFAICT people are fairly happy with the autonomous response of
the hardware to these issues, it's not like they're expected to happen
in normal operation or be recoverable.

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6oDvUACgkQJNaLcl1U
h9Bw1Af/eH2Xtc+Nb+wOnsuA/ECmwpfLa7PgrSXEc4oqAFvwrzgmGgzJVdGz2ZZv
nUDk70XTFKy0dHRIUxxeohZRJr/+lEXJOKUQx4LwHRuphGDWhbV63lAVJQJbkUbk
QABoJ/lj4WWEOsiAmY4BQVuQcEuZxcY6deyeA6s1/Ur0EaoKfQv3I8x2VJjECBDc
D+weiy/KgJg7OKzUtCPMufdVKwWzKoHqyW8CCEov3iozV9nJ+BoY2F3K8gGMqxEt
5GCo0EZ/uktvqCo6UroN701E+ne4zsBysVztRE39HTzWCk7nQ0Eg1c3m6C4sL9ki
DYnE9SroVq3mFjcEirN8Tj9azWExdA==
=jlOR
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--

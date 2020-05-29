Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B441E7AEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 12:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgE2Kum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 06:50:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:58004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgE2Kul (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 06:50:41 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66C4F2075A;
        Fri, 29 May 2020 10:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590749441;
        bh=FFlaEDQe1WSVtPriXu9N17aH3gGYEsIxBu9cKHxap5M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rmH+DuB3dCImc3xFqTryLv5euABMMjaeOyqol80TPCdjxzkm+hjnXcsWX8EFCJAaP
         Hqleu8YdIJoA1Y5yUXcI2p5eRqoOdkqAPUjeCEE5oYP9y7GEog8qI+bjmWNKD0tfUU
         uFc/TwTCNbV2WA5673egiIhRVXma0wjYrxqxvonY=
Date:   Fri, 29 May 2020 11:50:37 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, agross@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
Subject: Re: [PATCH v3 1/5] regulator: Allow regulators to verify enabled
 during enable()
Message-ID: <20200529105037.GD4610@sirena.org.uk>
References: <20200528154625.17742-1-sumit.semwal@linaro.org>
 <20200528154625.17742-2-sumit.semwal@linaro.org>
 <20200529013743.GL279327@builder.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Content-Disposition: inline
In-Reply-To: <20200529013743.GL279327@builder.lan>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--bajzpZikUji1w+G9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 06:37:43PM -0700, Bjorn Andersson wrote:
> On Thu 28 May 08:46 PDT 2020, Sumit Semwal wrote:

> > Some regulators might need to verify that they have indeed been enabled
> > after the enable() call is made and enable_time delay has passed.

> >  	_regulator_enable_delay(delay);

> My interpretation of "enable_time" (i.e. the value of delay) is that it
> denotes the maximum time it will take for the regulator to turn on, and

Right.

> the purpose of this patch is to be able to handle cases where we can
> poll the hardware to see if it completed earlier.

Is that it?  From the changelog it sounded like this was a workaround
for broken hardware not an attempt at optimization.=20

> So I think you should flip the meaning of your two variables around,
> making "delay" the total time to sleep and the newly introduced
> "poll_enabled_time" the interval at which you check if the hardware
> finished early.

Yes.

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Q6PwACgkQJNaLcl1U
h9CFNgf/ffXZ6CU+mAKj+pnzwCyLR9dhPs6POLPHWk6mcg5qGtFi40/RrDELzs1H
bKoPFS0FdQodoa2Eb+KlqZ2NdGYelnSUWaRplqSZDBo6yM5Zr3sWlRJcHISlEOZw
WpihosfvhQuG/FKP8aYslp+ttBgIgNiKZ6GMgdoXY94ezpsov6l4x2bcytu2iq1+
sXaHroC7vdf3JSB0OdnsBmKck5+ZoFRdFRTsh+cF6wXDO82mf76H10yUTX+Wco/1
9GoqW/0i/4r809F1jP+mAVNSqJ1185LESb/PEKOxTnW7CBOY7icIIUI7v5k6lMWY
8KabKuvGB5jCHVe4obTLIva/6Tpvuw==
=0lLv
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--

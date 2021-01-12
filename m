Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6680B2F3728
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 18:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392805AbhALRae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 12:30:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:34084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392771AbhALRad (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 12:30:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BCE222AED;
        Tue, 12 Jan 2021 17:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610472592;
        bh=/okVfTyIj/1mLwVi8GFdAvJo0sfLP8xwmTZIQcrLdeM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C2SF9Uqr2+SKWfy7pcG1YN9iKQ38GXT50DMyyDI2jNVqN34HNYQ67oYh5pcCW9DB7
         QDVpgd5uO1GTuiHMAuSLP0koYJ3Fqv6CsIuOT1JZaxvEmH8BCl27rDWEiiXvEmLP+D
         nQG2NoGqi7UxLXDkf0+1AzjAGCX0/Mp1jN0ScvW+36IHz0aWJIiKnuBqK3EvNpxdNk
         WZMuiXKwXeBCM+M0P5vc5HaTpFXqqZkaGMKK5m+15t8XaPfsM4gggwn37zVpRSXEyo
         XKHbn+F+h2muoqx+q9hClctvzD7lGQSlyZLrVsPZZPsvUO91hZQ8GEwmL3r3zQzxF0
         j1JHf5SR/UZKw==
Date:   Tue, 12 Jan 2021 17:29:19 +0000
From:   Mark Brown <broonie@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH 5/7] regulator: qcom-labibb: Implement short-circuit and
 over-current IRQs
Message-ID: <20210112172919.GD4646@sirena.org.uk>
References: <20210109132921.140932-1-angelogioacchino.delregno@somainline.org>
 <20210109132921.140932-6-angelogioacchino.delregno@somainline.org>
 <20210111135745.GC4728@sirena.org.uk>
 <6dee36e4-fc78-c21b-daf8-120ee44535a3@somainline.org>
 <8115a574-ad43-d3c6-70d4-28c8a2f4a5f6@somainline.org>
 <09d70d24-5d0d-f1cd-d99e-5c213c8ea98c@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n2Pv11Ogg/Ox8ay5"
Content-Disposition: inline
In-Reply-To: <09d70d24-5d0d-f1cd-d99e-5c213c8ea98c@somainline.org>
X-Cookie: Stay away from hurricanes for a while.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 10:06:18PM +0100, AngeloGioacchino Del Regno wrote:

> ...which was already a requirement before I touched it.
> Now, this leaves two options here:
> 1. Keep the of_get_irq way, or
> 2. Move the interrupts, change the documentation (currently, only
> pmi8998.dtsi) and also fix pmi8998.dtsi to reflect the new changes.

> I am asking before proceeding because I know that changing a schema that is
> already set sometimes gets "negated".

Well, if the binding isn't actually used changing it is a possibility.
If we keep the current binding you can still continue to use
of_get_irq() even from within the probe function, you know the name of
the node it's supposed to be in so you don't need to iterate or anything
to get it so not really any reason to use the callback.

--n2Pv11Ogg/Ox8ay5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/93G4ACgkQJNaLcl1U
h9CCJQf/XQpVoAeBxaPWks++Bdxf1rAlHECDuS/el7BrR98BEMGZ65QEz1Pi1fO7
4+abqstgMzY3phe3BzzS/Qf0FpwoSAW71k+L2RWNa1K+5an2uiCbQhW1UvXjqhwy
VRmurbOyG1RmmNfg9r+q3GnRwqmdZK7f2Uip0OQTQq/PRFZkW/cQfuFg6HWebaSb
trUCLU81jUQLuyBJF/Cc7na4+PaIbhNPIDfuxzcsV7fVVdebtXADHPU+7thHbnw5
3BgSpSBfYVdkHnEU1Zix/c67tJXRqOSAf5WujVnOXNG5XJL7eCGwUgrPOnjRo3sZ
xf7/xKVSKeZQhSNTgjcEbvasnE2GKw==
=sGHd
-----END PGP SIGNATURE-----

--n2Pv11Ogg/Ox8ay5--

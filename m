Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2278445DD2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 16:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349532AbhKYPW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 10:22:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:54002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349951AbhKYPU1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 10:20:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0140C610A2;
        Thu, 25 Nov 2021 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637853436;
        bh=dPEIAEOMHWLuakIY3MSI1QOJric9yi6N226AolqdLhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BbfxYCTks975D+rUrXPjf9YX0oLMt7qAHYr8RzD9jEpd+oimqulPV/c72KsnGRXOy
         zbdbJ9Umn2UL5a2DHuG9lkmOw9Gs+uljky4Lzfms0JjzQBVHd+URgDrZLT0EjPJR1G
         elfqalS5EQIEq3KBmTOeWOSH+ZXDCXs6mKGUUxPwzO8YVOdvAncGtmAJ7QEuVap3DJ
         y60xQ6eKDikir0Ne1QjJvdXyoytDVQgmyP60lE24tqQIQVOki5b9rkP12ejw5GhhqM
         JGYkEYneXwpsAeVSS8TOx2+UrjGliSp7SOqpQsEb81ALSrug1pzvPSiWmzjTvL/Fy1
         X0lkVzkSvutsQ==
Date:   Thu, 25 Nov 2021 15:17:10 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, swboyd@chromium.org,
        collinsd@codeaurora.org, subbaram@codeaurora.org,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 1/6] dt-bindings: regulator: Add
 "regulator-min-dropout-voltage-microvolt"
Message-ID: <YZ+o9sQpECZSrieN@sirena.org.uk>
References: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
 <1637314953-4215-2-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AUvJVmE/Uq40jQZU"
Content-Disposition: inline
In-Reply-To: <1637314953-4215-2-git-send-email-quic_c_skakit@quicinc.com>
X-Cookie: This bag is recyclable.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--AUvJVmE/Uq40jQZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 19, 2021 at 03:12:28PM +0530, Satya Priya wrote:

> +  regulator-min-dropout-voltage-microvolt:
> +    description: Specifies the minimum voltage in microvolts that the
> +      parent supply regulator must output, above the output of this regulator.

Usually this is a fixed property of the regulator rather than something
that varies per board - why have a DT property?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--AUvJVmE/Uq40jQZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfqPYACgkQJNaLcl1U
h9BnqQf/fCkxEFpBspvrs1Dfz0082VE2JMwJWaaczK5HOcvbmDy2TLz9ndOllyOO
D2KWB2le9tlimmNIxJgo+qNvNWr+TXcXo85B3JKHMDUW48EohvKwX/lRAeYvoc2C
Lxadrz73Gq1tEkWRKEpoggxmrTt+VABH8mPpSkwVQggkTONHhL4GREzyq+7pspLp
EBh1EDmFH8diqjVhs8FIqsUtWH0RHJick9+Bb7iaHSd21cpv+hPVRjVEQk5/Nheh
tQHRaVZyMySIt6G8kJgD9oS84+YpCb/mkMGCqKW/U+OwFY8rxAb6xPSlmlBeg7+Y
mA/Qurh2uMnWDKgQo/+EWkAvGr2zDw==
=L6I5
-----END PGP SIGNATURE-----

--AUvJVmE/Uq40jQZU--

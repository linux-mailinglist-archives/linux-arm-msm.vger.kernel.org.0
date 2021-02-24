Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1DF3241DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 17:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbhBXQN7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 11:13:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:57082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234539AbhBXP73 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 10:59:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3843264ED4;
        Wed, 24 Feb 2021 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614182326;
        bh=V7rlcQhSLNnPVI2Ed7xp8A/0e5OvqYK14ITPfoiHp5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tAsWIY4TrkTMO4kObyqGoIrvoteNKJUOvtXJ5QxwENEO/KpsmsyGySaeDWXANDc+C
         pCFWrcPgWSonpPn8+ZZktgc6vXgGtEGVLoOUnT24zXoZqoM1p0aGYQ/IhDfEFo9IR1
         2e+KvwYvHVGidOAUTIhOtTtPsWm2jPXz6XoIj6j8CPTgdrk2JEdVYcdFF87DqxhYs/
         ssG/7+keU8c68P3kKg8FHDb1disLnBAxElQ4ddbk379/CYhNlPJnql4YEDuGRHx/HK
         cv557H5AErdKJdqxfHxOidMeiuAHRyDA2Nsg1iK0yKSlsQg9oAt5pYYLQqtBGw4GwL
         vuAaGWNj1UWXQ==
Date:   Wed, 24 Feb 2021 15:57:43 +0000
From:   Mark Brown <broonie@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH 1/7] dt-bindings: regulator: Convert regulator bindings
 to YAML format
Message-ID: <20210224155743.GC4504@sirena.org.uk>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline
In-Reply-To: <1614155592-14060-2-git-send-email-skakit@codeaurora.org>
X-Cookie: He's dead, Jim.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 24, 2021 at 02:03:06PM +0530, satya priya wrote:
> Convert regulator bindings from .txt to .yaml format.

Please place any conversions of DT bindings to YAML at the end of patch
serieses, there is frequently a backlog on review of these conversions
which can hold everything else up.

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA2d3YACgkQJNaLcl1U
h9BShAf/SgYMZ8WvLi8NXafZXp3KgmNvyITtP2zBMOwLUjPfA0nVpvCGe/MTGO9w
f7NJjAztndQD9AsM2MBQmXHrsDqbLhl+QpqiNvv0k7yVvm1u4DbAQUFXP20GaV+6
OZ3+grab+JgLiNwhNrwXSbnpSIG06dTChnMEQwaTD/7Xar6SM8go/QtBk5T6atYj
xXGbF72jHV9OK7CFrHaRWMsrIstmVrkWLuN/5hHmPMgGxc3AjNjGS1PMRRaZj2G2
LhVy1lz7xH/sl5eqDYauw7T6pX0Oam2wKbR5DMu7R3gG9kl4K+632fVqMoMzPjSy
otunaBZ31wXGy5CBmAZVoloX08s68g==
=g0Pe
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--

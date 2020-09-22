Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE33274074
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 13:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgIVLJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 07:09:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:36642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726340AbgIVLJS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 07:09:18 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2263207C3;
        Tue, 22 Sep 2020 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600772958;
        bh=ZSSAAP/85iGefRVHL/IykQXPV1a4Qz4IdNot7umbpi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gc/gR5uK7fAi/tuxXnKfutxmdsMlMWwPPI20jb7txCEuDoEfpU/hsmev4dPpgZhG8
         OyT6i44vOYOVaadAtcblg40wjkXvIfoXoNxwbH79S8gqIVUzAxjGDWXNIUnqRWbqTO
         pBv4ua7oRkv48pGBUqP+R3OBikCYJJep1whX0cBc=
Date:   Tue, 22 Sep 2020 12:08:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH v6 3/5] Asoc:qcom:lpass-cpu:Update dts property read API
Message-ID: <20200922110825.GN4792@sirena.org.uk>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
 <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z3ovhOgMYmj8MRdq"
Content-Disposition: inline
In-Reply-To: <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
X-Cookie: Love thy neighbor, tune thy piano.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--z3ovhOgMYmj8MRdq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2020 at 10:20:22PM +0100, Srinivas Kandagatla wrote:
> On 18/09/2020 07:04, Srinivasa Rao Mandadapu wrote:

> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");

> Index is always preferred over name w.r.t device tree bindings, so lets
> stick with that for now!

It is?  That's not usually the case...

> Unless you have any strong reason to lookup resource by name?

Looking things up by name tends to make the DT easier to read (since
things are named).

--z3ovhOgMYmj8MRdq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9p2ygACgkQJNaLcl1U
h9DF0Qf+NkaL/z36OrHjNAgl5BRKBBwHT/DGQCQG5hEnssX4Y6iere3ZcmSC97uB
qE0ku9uCXnOZQmn0xfHl4ZZbyfiq9OsY/0DEgRtDqOoHMu8yWe3/CzPOZZyo8gaR
41jkAGEmbWMw15NfcoKNBsBp9FETFp9YmhrZGChL2XrcWPWJr3iZ2bVSm+PSvExM
haa6OYb8751uvliEjZaNkee0Wj4dnQDNhiV+Y9F5urAoxPbfkzG8QJbZlvhpC4Xg
mxuMfMK8sbZuWBi2eD6V/ZYvRYaGWyTM531HaVyfhCV4zA7g5+pKGMibMUNAnAsW
kJ++v+5t4EyVjeVYS52OpP6ZfQ5yLQ==
=+gQK
-----END PGP SIGNATURE-----

--z3ovhOgMYmj8MRdq--

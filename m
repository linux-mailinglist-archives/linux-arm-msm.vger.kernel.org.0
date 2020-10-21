Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE63294CD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 14:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408091AbgJUMj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 08:39:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:37990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394282AbgJUMjZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 08:39:25 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2EE1422249;
        Wed, 21 Oct 2020 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603283964;
        bh=mWU0XX6TP23oXRtNhUtKZR9PQ/87umOD4p89GJOQWxo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZkxgulnNF2NFH9jo07oDU4EUHcw6hfl48FCyYKMbN/fSIbwuhDeBZjNQiRP4WeJVn
         B8QXAA2jbjmKiJc96KJ/3h4MnZ5r7rEFwrOTx6tdj9oAJl7UOSCPeJ3t17BykafjTz
         Zzm1hizSASBgt/k0uj2D29o+8bUuTp2GI6pY/12Q=
Date:   Wed, 21 Oct 2020 13:39:13 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Cheng-yi Chiang <cychiang@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20201021123913.GD4497@sirena.org.uk>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
 <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
 <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
 <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline
In-Reply-To: <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org>
X-Cookie: That does not compute.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2020 at 01:00:54PM +0100, Srinivas Kandagatla wrote:

> This is totally not very useful w.r.t UCM2 and makes it very difficult to
> common up parts of the configs.

> My suggestions are.
> 1. set card->driver_name to something more sensible in your sound card
> driver.

> 2. set long name in model DT property and set it as card long name

It's also worth taking a look at what Intel are doing here with their
cards.

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+QK/AACgkQJNaLcl1U
h9BbUwf/eOnrTlDEbw+QGCrFiYUmnzBGx64NN4D6F6QHebJyBsYrT6PB95nEpzei
/il7qT8KENMbMgMUSN4N3vMUVWAkrFYjtI5TXCjDvYy1h790B9UIPXyrq+1+hr3U
+KuyJJ4+adkM1dYEH904ynqdFapjo8DfVcD0YNZ2DstV8UdOnegpQP06Fygn7Vm8
7diV0uAnJrtMX74ezClTiKcTB6/Nl0B/ve5m9o8usTa9H1LL9v6HgGrqjrFhMS/p
6h8MzEw2zJS6+kAU//U8MNVBYAmhR7Urw93XHEx7gisLq3STJgnW0580I4lLHd0i
9/H/UCdqrnIcE7b8lByvQDy/V2Ydhw==
=jQZx
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--

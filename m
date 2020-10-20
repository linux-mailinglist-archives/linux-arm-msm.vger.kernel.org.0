Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF97293ED7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 16:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408237AbgJTOhX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 10:37:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:51362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408135AbgJTOhX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 10:37:23 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9389B21534;
        Tue, 20 Oct 2020 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603204642;
        bh=f6kugA3U0QakUulP0txsV8BTYj/A5215gpbs4UZBY38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dsqyybu2MKInKfeRhYrW8vkb0ymsQrvurWgo03nA1Q5MVwC/kOLvNMmZ9Ed/8aRiL
         ya2rx+LZfiIkoLhgcYVnyIbRP1wd4AudxWlepqbUQDEjreJCGCBeJUqwlTALe6McPJ
         SM5qeM1oDBEh6KMnBudKKbJJ6ENN4MFTbDhuc4iM=
Date:   Tue, 20 Oct 2020 15:37:11 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Cheng-yi Chiang <cychiang@chromium.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
Message-ID: <20201020143711.GC9448@sirena.org.uk>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline
In-Reply-To: <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
X-Cookie: The people rule.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 09:37:05PM +0800, Cheng-yi Chiang wrote:

> May I know your suggestion on Ajye's patch "ASoC: qcom: sc7180: Modify
> machine driver for 2mic" ?

> https://lore.kernel.org/r/20200928063744.525700-3-ajye_huang@compal.corp-partner.google.com

> I think adding code in the machine driver makes the intent straightforward.
> If we want the machine driver to be fully configurable,
> we can always add more code to handle properties like gpio, route,
> widget (mux, text selection) passed in from the device tree.

If the device has both front and rear mics and only one can be active at
once that seems obvious and sensible.  If the devices only have one of
these then this seems like a bad idea.

> But I feel that we don't need a machine driver to be that configurable
> from the device tree.
> I think having the logic scattered in various dtsi files and relying
> on manual inspection to understand the usage would be less
> maintainable than only exposing needed property like gpio.
> Especially in the complicated case where we need to create a mux
> widget with callback toggling the gpio like this:

I don't understand what "logic scattered in various dtsi files" means,
sorry.

> Yes, that should work to describe the dailink we are using.
> But a more tricky issue is how to do calls like setting PLL in dai startup ops.

...

> I think that asking a generic machine driver to do configuration like
> this with only a limited interface of device property
> might be too much of an ask for the machine driver.

Richard was looking at some basic configuration for PLLs.

> Would you mind if I simplify the compatible string like Srinivas
> suggested, and send a v12?

> As for other two kinds of variations that I am aware of:

> 1. front mic / rear mic
> 2. replace alc5682 with adau7002

The CODEC change is going to be described in the DT no matter what -
you'll have a reference to the CODEC node but it may make sense if
there's enough custom code around it.  For front vs rear mic the
simplest thing would just be to not mention which if this is a hardware
fixed thing, otherwise a control.

> We can set different board names and different compatible strings to
> achieve such variation.
> So that it would make sense to describe configuration in compatible
> strings like you suggested, and also provides UCM a way to distinguish
> different boards.

I don't recall having suggested distinguishing these things with a
compatible string, especially not the microphones.  UCM can already use
the display names for the boards to distinguish things.

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+O9hYACgkQJNaLcl1U
h9CspAf/b7bFcvyQbodhwCE9GoK96aMXJ54K2Y9rG4bcavB0WJbLggXc4xYp/uUS
oDymKZzLQr+vEzU9gO/inLAIXfMd2QTgLQWrrY4K/Z/q6+Wo702H2r0kwEXIpj3E
nB2VjUldnpl0XYCmavYeVaZLep8+qTL6QixnsLQq6zrwirPeyNpfQ2iu/FLzSYX6
EayieZWxAGuFfZkIoPg38GQqW6bZeuc8Nom0OY4Yqu/uoz29ekHKWOQm03DZyRK9
bTCBvPjsigi/ABXue224l0WavpRxvvjRNeswkQasH9rM/OIhY4CKktbaNmUW/1mH
FIkwdq2b8lvHefF3atCnALr5tCyx1Q==
=1PAU
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--

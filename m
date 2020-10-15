Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2485E28F67B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 18:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389301AbgJOQM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 12:12:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:48910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388461AbgJOQM7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 12:12:59 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E68D421D7F;
        Thu, 15 Oct 2020 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602778378;
        bh=wYeGNA65xooghznt1NdP+AJ2P2uDRvjHr3QQlhRQdJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zv64p4zBHeZ3PPxAhPoimJW4wUmg5nR1YqruXK6ydTfrKj6gxgDs/npmBfiBUDRPJ
         nsmJobGaaDVM4rUT1Y/GTiitd3qgAuMtyxsJFK1Q7wbh8egz6TfyLLrxay9FmUCqOf
         RgqjlfejcNXGsg3/jrusuIfun2/skkP3Alzhz6xA=
Date:   Thu, 15 Oct 2020 17:12:51 +0100
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
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20201015161251.GF4390@sirena.org.uk>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pgaa2uWPnPrfixyx"
Content-Disposition: inline
In-Reply-To: <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
X-Cookie: Neutrinos have bad breadth.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Pgaa2uWPnPrfixyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2020 at 03:59:26PM +0800, Cheng-yi Chiang wrote:
> On Tue, Oct 13, 2020 at 6:36 PM Srinivas Kandagatla

> > > +properties:
> > > +  compatible:
> > > +    const: qcom,sc7180-sndcard-rt5682-m98357-1mic

> > This information can come from the dai link description itself, why
> > should compatible string have this information?

> I think dailink description is not enough to specify everything
> machine driver needs to know.
> E.g. there is a variation where there are front mic and rear mic. We
> need to tell the machine driver about it so
> it can create proper widget, route, and controls.

That sounds like something that could be better described with
properties (including for example the existing bindings used for setting
up things like analogue outputs and DAPM routes)?

> The codec combination also matters. There will be a variation where
> rt5682 is replaced with adau7002 for dmic.
> Although machine driver can derive some information by looking at dailink,
> I think specifying it explicitly in the compatible string is easier to
> tell what machine driver should do, e.g.
> setting PLL related to rt5682 or not.

These feel more like things that fit with compatible, though please take
a look at Morimoto-san's (CCed) work on generic sound cards for more
complex devices:

   https://lore.kernel.org/alsa-devel/87imbeybq5.wl-kuninori.morimoto.gx@renesas.com/

This is not yet implemented but it'd be good to make sure that the
Qualcomm systems can be handled too in future.

> You can see widget, route, controls are used according to the configuration.
> The alternative approach is to check whether "dmic-gpio" property
> exists to decide adding these stuff or not.
> But it makes the intent less easier to understand.

OTOH if you have lots of compatibles then it can get hard to work out
exactly which one corresponds to a given board.

--Pgaa2uWPnPrfixyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+IdQIACgkQJNaLcl1U
h9Cs0gf/aR5zd1VPFM/nOmIp2Or27oiqOMSopuxWeT8ZLdCC0srj7gRTUI8522lz
izypzvOW3riGLBh7X3uPWB5LyKHA80pa0yhNrAdJLBzmW0V5OlJ5Wt9VBz4V+qyq
oIfmqS/jhFQ4pPGdKQDPhV2NPLK7NT40qcSmCuqrCPR49XcqvTUt7PmETCp1LuqC
p5vUj1AqXOHLBRbmy6yc7svns2YEGkH3bxd5MED59nadECZl8QmCVWW+VHERFMnf
r5J8EW8FiPMaE6WRwmzf7KdPDHmfFJrRbCGjq9SiwS1qGre7qUdXm0lGagA3YUIq
KhE0K1VXxuMUGRohRmQ/sE555zuDBw==
=ZOAb
-----END PGP SIGNATURE-----

--Pgaa2uWPnPrfixyx--

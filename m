Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDBE29427E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 20:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437755AbgJTSwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 14:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437753AbgJTSwF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 14:52:05 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1385DC0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 11:52:04 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h5so3496244wrv.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 11:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYFdycc4cemOIaYFUQzd2hjpOFiC6YIkhXB4IeoEDOc=;
        b=dbg1dsucJfSwBHh00T6Mc9TxIy2cA3D0xo1Vm098iBuTl3wM9obmhlk2Rgw+3Fe9DE
         lhn/KcJI0CzGJ6oaNtkW3L2DYRWLDfMqxzbcRxS7Ipt1zizebN8Dh7Zxgafe7FBS9DOS
         DhU2QoyTkvFT2KdsWGAohFct9ghNqDtSzxfoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYFdycc4cemOIaYFUQzd2hjpOFiC6YIkhXB4IeoEDOc=;
        b=f8Xexyvve3cDlDVAEmrpDM/hM7sDnxvmZGU9MpcW5s+22u8Swe7XOApjBgGu97pZhi
         O/qUP61djKBomZjBpzyXmBo8in2SvOAaPd6rp/HTcQ5Wx5+wGeo1mnSHcwHN/AuJ2YD1
         poG2JkD7LF1JTCeqmETMT25KhUppSF28XICuw5dF6t6W9HhlYL2KYoDhUjXLJiLUbIgp
         ReGgNvt4vJMiiqsF1+lECrpj09z3sa+aQSmg7VHy9wixbKJC+0WdBqEjMhgyByOdfREg
         moFaLrmx/qNeoNW40+Iikk+nPMZthVh9+idNCy3rWoV/YEv4B3vXZd2EPYk58M+U1FOY
         Ap7w==
X-Gm-Message-State: AOAM533AGMbZvI1CPe2sNHqWnM7LxubrwOt+ntyPHs5h2WQkSBF8/WwX
        3xSKyAw8y5Cf+Mrd1jrekeoUKWDIvRVsiQeON25I1w==
X-Google-Smtp-Source: ABdhPJzwG1O5oS9ghCKoJUxg59+XPLW7h0AAeoCd9EgHF2nhb1cMfI/IvqKJePI2HX9vcvnVxX2frJft2ThKtBNDJrA=
X-Received: by 2002:a5d:4001:: with SMTP id n1mr5162648wrp.426.1603219922351;
 Tue, 20 Oct 2020 11:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org> <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk> <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
In-Reply-To: <20201020143711.GC9448@sirena.org.uk>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Wed, 21 Oct 2020 02:51:33 +0800
Message-ID: <CAFv8NwKuLjLeM1KLeV8Br2TZC8L7DO6KWHL=pXvhAUV5+wSBPg@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To:     Mark Brown <broonie@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 10:37 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Oct 20, 2020 at 09:37:05PM +0800, Cheng-yi Chiang wrote:
>
> > May I know your suggestion on Ajye's patch "ASoC: qcom: sc7180: Modify
> > machine driver for 2mic" ?
>
> > https://lore.kernel.org/r/20200928063744.525700-3-ajye_huang@compal.corp-partner.google.com
>
> > I think adding code in the machine driver makes the intent straightforward.
> > If we want the machine driver to be fully configurable,
> > we can always add more code to handle properties like gpio, route,
> > widget (mux, text selection) passed in from the device tree.
>
> If the device has both front and rear mics and only one can be active at
> once that seems obvious and sensible.  If the devices only have one of
> these then this seems like a bad idea.
>

trogdor board: only front mic.
pompom board: having both front mic and rear mic. Only one of them
will be used at a time. It is toggled by mixer control backed by a
gpio.

My proposed solution: instead of using compatible strings, expose only
dmic-gpio property.
When the machine driver sees this property, it uses the dapm widgets
and controls created in the machine driver.

> > But I feel that we don't need a machine driver to be that configurable
> > from the device tree.
> > I think having the logic scattered in various dtsi files and relying
> > on manual inspection to understand the usage would be less
> > maintainable than only exposing needed property like gpio.
> > Especially in the complicated case where we need to create a mux
> > widget with callback toggling the gpio like this:
>
> I don't understand what "logic scattered in various dtsi files" means,
> sorry.
>
I mean I don't want to use device property to pass in widget name,
type, text and callbacks.
Let me give an example:

- Board trogdor uses front mic, rt5682, and max98357a.
- Board pompom is based on board trogdor, but it has front mic and rear mic.
If we somehow managed to add the code to pass in widget, route, type,
text, and callbacks needed for dmic control, we will need to put a
bunch of properties in trogdor-pompom.dtsi file.
- Board ABC is based on trogdor as well, and it has front mic and rear
mic, but with a different speaker amp.

To use widget, route, type, text and callbacks for front mic and rear
mic, in trogdor-ABC.dtsi file we would copy some properties used in
trogdor-pompom.dtsi file. To support the different combination of
codec, we would need some modification of the route and widget.

Now the support of front mic and rear mic switch is scattered in
trogdor-ABC.dtsi and trogdor-pompom.dtsi files.
For example, when we change the code to parse or build the widget and
route, we need to fix both trogdor-pompom.dtsi and trogdor-ABC.dtsi.

Alternatively, if we only expose dmic-gpio property and put
surrounding code in the machine driver, we can use this dmic-gpio
property, plus the sound card name to identify the needed widget and
route.

> > Yes, that should work to describe the dailink we are using.
> > But a more tricky issue is how to do calls like setting PLL in dai startup ops.
>
> ...
>
> > I think that asking a generic machine driver to do configuration like
> > this with only a limited interface of device property
> > might be too much of an ask for the machine driver.
>
> Richard was looking at some basic configuration for PLLs.

That sounds promising. If we don't need to include the codec driver
header file explicitly, that can make machine drivers simpler.
Maybe for most of the simple cases we don't even need a dedicated
machine driver.

>
> > Would you mind if I simplify the compatible string like Srinivas
> > suggested, and send a v12?
>
> > As for other two kinds of variations that I am aware of:
>
> > 1. front mic / rear mic
> > 2. replace alc5682 with adau7002
>
> The CODEC change is going to be described in the DT no matter what -
> you'll have a reference to the CODEC node but it may make sense if
> there's enough custom code around it.  For front vs rear mic the
> simplest thing would just be to not mention which if this is a hardware
> fixed thing, otherwise a control.
>

Would you suggest checking whether the codec node is a rt5682 node,
and call required PLL calls accordingly ?

"For front vs rear mic the simplest thing would just be to not mention
which if this is a hardware fixed thing, otherwise a control."
Sorry I am not sure if I understand this correctly. Please correct me
if I am wrong.

- For default case having 1 mic: not mention this at all
- For front mic / rear mic case: see gpio property and use an
additional control.

> > We can set different board names and different compatible strings to
> > achieve such variation.
> > So that it would make sense to describe configuration in compatible
> > strings like you suggested, and also provides UCM a way to distinguish
> > different boards.
>
> I don't recall having suggested distinguishing these things with a
> compatible string, especially not the microphones.  UCM can already use
> the display names for the boards to distinguish things.

My apology that I made the wrong interpretation when I read your reply
"These feel more like things that fit with compatible" regarding
replacing alc5682 with adau7002. Please let me know which one solution
you prefer:
-  deriving this information from codec node
-  deriving this information from different sound card name

Thanks so much!

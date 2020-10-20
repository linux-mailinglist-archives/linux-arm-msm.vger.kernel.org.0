Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7703B293D6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 15:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407495AbgJTNhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 09:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407474AbgJTNhe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 09:37:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEDFC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 06:37:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h7so2182959wre.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dd/4tB1jhfJBU76uhWYvJK/M1Y4WZsbkyJFSG8k8QQo=;
        b=TPK9GUXwppf2mM1kCN3ve/x60CKUztqZ+989Nh8aqFSLGa+l7mbzE/LqA70BHIvGZz
         9t62mD+eV+mTcXERLQfsqGiscvH12E6jUFihaaN9G4Q/H5OP5vn/D7cAcdZLOAKnGAP4
         3CcOZMOSIaLcag5ahYLat4UtdM8iVyx44UW/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dd/4tB1jhfJBU76uhWYvJK/M1Y4WZsbkyJFSG8k8QQo=;
        b=TgH0JLHhywvc5w7dYCSBDK7sqNkoIykYz6tIBpup6Q/dU9lAoH8rFGKtD6Wj8g3a1o
         wgXqT5SHCNZYjBaZ9X3ETEsJISIrmnYZ4xHUdmNWqar4Z9KarjUztGPauBUAJDOJrNl5
         WW8OEqaVDz9uTREeEtaxEhipkpCTFqHY+iEMUBoKjVhDiNzCg/0bRHum/V2RG45tpMKI
         D41scPsP9ZFBfOFDW5XPwtk+fVFsZLaavuErH7QP2AjvX3dj0NBRaZDSiRhBtdp0rWzK
         lU+OKDKkQxRkKRQE31YsCt+Z5qB/AixONRkANwMjZPNEs3Cn2tR+KIUENPj/k3bfgcDF
         MGzw==
X-Gm-Message-State: AOAM531xn6DqqMNu4vEbFgn1krpeM7DZsqE1OkUvVuHQZFL6THxKnMot
        E6j2RIu62UKi3zYMNqJ1TYwp1/x09qNOIYOuQRZxQA==
X-Google-Smtp-Source: ABdhPJxbiebIvIYWJ8VjSbDQyhf4y6aT7O3DnC5CYOzHre4Bqv+imNt5qgF8Ub9UZZ8/En/AxSVEIthwU9StfwKT0vc=
X-Received: by 2002:adf:cc82:: with SMTP id p2mr3646265wrj.177.1603201052544;
 Tue, 20 Oct 2020 06:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org> <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com> <20201015161251.GF4390@sirena.org.uk>
In-Reply-To: <20201015161251.GF4390@sirena.org.uk>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Tue, 20 Oct 2020 21:37:05 +0800
Message-ID: <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
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

On Fri, Oct 16, 2020 at 12:13 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Oct 15, 2020 at 03:59:26PM +0800, Cheng-yi Chiang wrote:
> > On Tue, Oct 13, 2020 at 6:36 PM Srinivas Kandagatla
>
> > > > +properties:
> > > > +  compatible:
> > > > +    const: qcom,sc7180-sndcard-rt5682-m98357-1mic
>
> > > This information can come from the dai link description itself, why
> > > should compatible string have this information?
>
> > I think dailink description is not enough to specify everything
> > machine driver needs to know.
> > E.g. there is a variation where there are front mic and rear mic. We
> > need to tell the machine driver about it so
> > it can create proper widget, route, and controls.
>
> That sounds like something that could be better described with
> properties (including for example the existing bindings used for setting
> up things like analogue outputs and DAPM routes)?
>

Hi Mark, thank you for the comments.

May I know your suggestion on Ajye's patch "ASoC: qcom: sc7180: Modify
machine driver for 2mic" ?

https://lore.kernel.org/r/20200928063744.525700-3-ajye_huang@compal.corp-partner.google.com

I think adding code in the machine driver makes the intent straightforward.
If we want the machine driver to be fully configurable,
we can always add more code to handle properties like gpio, route,
widget (mux, text selection) passed in from the device tree.
But I feel that we don't need a machine driver to be that configurable
from the device tree.
I think having the logic scattered in various dtsi files and relying
on manual inspection to understand the usage would be less
maintainable than only exposing needed property like gpio.
Especially in the complicated case where we need to create a mux
widget with callback toggling the gpio like this:

+static const char * const dmic_mux_text[] = {
+       "Front Mic",
+       "Rear Mic",
+};
+
+static SOC_ENUM_SINGLE_DECL(sc7180_dmic_enum,
+                           SND_SOC_NOPM, 0, dmic_mux_text);
+
+static const struct snd_kcontrol_new sc7180_dmic_mux_control =
+       SOC_DAPM_ENUM_EXT("DMIC Select Mux", sc7180_dmic_enum,
+                         dmic_get, dmic_set);
+
+SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0, &sc7180_dmic_mux_control),

Passing all the logic along with the callback of dmic_get, dmic_set
from the device tree would be too hard to maintain.

> > The codec combination also matters. There will be a variation where
> > rt5682 is replaced with adau7002 for dmic.
> > Although machine driver can derive some information by looking at dailink,
> > I think specifying it explicitly in the compatible string is easier to
> > tell what machine driver should do, e.g.
> > setting PLL related to rt5682 or not.
>
> These feel more like things that fit with compatible, though please take
> a look at Morimoto-san's (CCed) work on generic sound cards for more
> complex devices:
>
>    https://lore.kernel.org/alsa-devel/87imbeybq5.wl-kuninori.morimoto.gx@renesas.com/
>
> This is not yet implemented but it'd be good to make sure that the
> Qualcomm systems can be handled too in future.

Yes, that should work to describe the dailink we are using.
But a more tricky issue is how to do calls like setting PLL in dai startup ops.

                /* Configure PLL1 for codec */
                ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
                                          DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);

I think that asking a generic machine driver to do configuration like
this with only a limited interface of device property
might be too much of an ask for the machine driver.

>
> > You can see widget, route, controls are used according to the configuration.
> > The alternative approach is to check whether "dmic-gpio" property
> > exists to decide adding these stuff or not.
> > But it makes the intent less easier to understand.
>
> OTOH if you have lots of compatibles then it can get hard to work out
> exactly which one corresponds to a given board.

Totally agree. Glad we have only three variations up to now.

Would you mind if I simplify the compatible string like Srinivas
suggested, and send a v12?

As for other two kinds of variations that I am aware of:

1. front mic / rear mic
2. replace alc5682 with adau7002

We can set different board names and different compatible strings to
achieve such variation.
So that it would make sense to describe configuration in compatible
strings like you suggested, and also provides UCM a way to distinguish
different boards.
What do you think ?

Thanks!

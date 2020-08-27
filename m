Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614E52540D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 10:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgH0I2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 04:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728063AbgH0I2g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 04:28:36 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC82C06121A
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 01:28:35 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h15so4466398wrt.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/rr2RX3o95b0Ikv1i6MkVJmhcP02y2lFmVvoCk9TCiI=;
        b=PoCOsQyuEZ2fkW31Xeou8qQbyALsZIt1UBaGO5Ouc7pNv8ST//8a7M33fgn4i48d7r
         ht/bjBhHWkCrx77z8zvEMWJ1Mh2h9erj1sakb2UVb2EA9EkOWVHdYNqo/KfdzlByTz5T
         9idHPO5q1ZkNANzX5CaIfbQRYVgVBqP8+OyvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/rr2RX3o95b0Ikv1i6MkVJmhcP02y2lFmVvoCk9TCiI=;
        b=CReHYCmM4yWqUj2NaZ7FkkxxqnlOxY9lYMMaoykcG3V0pSUUDZO/LSfqDcp/q1M4A+
         /0DgaheE3T4Nqdw9hmizrSnxJk69yWzQ2JwnTrAuxhQcpyZE88qsCJ1F3TyL1R+CT6y2
         KwGE3gStqTkZkJQxu23aqYD7ApqCRnxbo6eQJ2l9HNOa2ZOEvW1ZY234I94w0NHz/axu
         YGKuhtsK/zrpdQTUi5THLmIeCZ0hZWliUxwWZsPg3mtwJLN6Tlh8fNZs0AKCeeI9ZMWE
         /BBLjOrr8Hdj+N9YFkxLomsfyza/bYHxUxuIz8YFnJif5c0VLLN+yEoOrxOmCPqBvVDZ
         CgKA==
X-Gm-Message-State: AOAM531wBlhBxlCjbVprp53KxaBCQtwEYza8TQs7OcJkrfTGL829uRN2
        Jv1oPjWBVi4ebC65NNSHqsfzSBAfUF7KJ03SJiCOaw==
X-Google-Smtp-Source: ABdhPJyfEfOPABThH7sDugVKQ4ZePH0ZoIrkVGuTEJtm8uoyDpWG06hJQdwzivO08Tkw7hqE/iG193M8pwORHV279Vw=
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr19257830wrn.177.1598516913884;
 Thu, 27 Aug 2020 01:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200826110454.1811352-1-cychiang@chromium.org>
 <20200826110454.1811352-3-cychiang@chromium.org> <20200826144718.GA854@gerhold.net>
In-Reply-To: <20200826144718.GA854@gerhold.net>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Thu, 27 Aug 2020 16:28:07 +0800
Message-ID: <CAFv8NwKG9nKXLJY7L79qh=HxxPgY=h_xd8EoGN90uuXFQAz2QQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Taniya Das <tdas@codeaurora.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Andy Gross <agross@kernel.org>,
        Dylan Reid <dgreid@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Doug Anderson <dianders@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 26, 2020 at 10:48 PM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Wed, Aug 26, 2020 at 07:04:54PM +0800, Cheng-Yi Chiang wrote:
> > From: Ajit Pandey <ajitp@codeaurora.org>
> >
> > Add new driver to register sound card on sc7180 trogdor board and
> > do the required configuration for lpass cpu dai and external codecs
> > connected over MI2S interfaces.
> >
> > Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> > ---
> >  sound/soc/qcom/Kconfig  |  12 ++
> >  sound/soc/qcom/Makefile |   2 +
> >  sound/soc/qcom/sc7180.c | 244 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 258 insertions(+)
> >  create mode 100644 sound/soc/qcom/sc7180.c
> >
> > diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> > index a607ace8b089..63678b746299 100644
> > --- a/sound/soc/qcom/Kconfig
> > +++ b/sound/soc/qcom/Kconfig
> > @@ -116,4 +116,16 @@ config SND_SOC_SDM845
> >         SDM845 SoC-based systems.
> >         Say Y if you want to use audio device on this SoCs.
> >
> > +config SND_SOC_SC7180
> > +     tristate "SoC Machine driver for SC7180 boards"
> > +     depends on SND_SOC_QCOM
> > +     select SND_SOC_QCOM_COMMON
> > +     select SND_SOC_LPASS_SC7180
> > +     select SND_SOC_MAX98357A
> > +     select SND_SOC_RT5682
> > +     help
> > +       To add support for audio on Qualcomm Technologies Inc.
> > +       SC7180 SoC-based systems.
> > +       Say Y if you want to use audio device on this SoCs.
> > +
> >  endif #SND_SOC_QCOM
> > diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> > index 7972c9479ab0..0cdcbf367ef1 100644
> > --- a/sound/soc/qcom/Makefile
> > +++ b/sound/soc/qcom/Makefile
> > @@ -17,12 +17,14 @@ snd-soc-storm-objs := storm.o
> >  snd-soc-apq8016-sbc-objs := apq8016_sbc.o
> >  snd-soc-apq8096-objs := apq8096.o
> >  snd-soc-sdm845-objs := sdm845.o
> > +snd-soc-sc7180-objs := sc7180.o
> >  snd-soc-qcom-common-objs := common.o
> >
> >  obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
> >  obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
> >  obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
> >  obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
> > +obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
> >  obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
> >
> >  #DSP lib
> > diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> > new file mode 100644
> > index 000000000000..7849376f63ba
> > --- /dev/null
> > +++ b/sound/soc/qcom/sc7180.c
> > @@ -0,0 +1,244 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +//
> > +// Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > +//
> > +// sc7180.c -- ALSA SoC Machine driver for SC7180
> > +
> > +#include <dt-bindings/sound/sc7180-lpass.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <sound/core.h>
> > +#include <sound/jack.h>
> > +#include <sound/pcm.h>
> > +#include <sound/pcm_params.h>
> > +#include <sound/soc.h>
> > +#include <uapi/linux/input-event-codes.h>
> > +
> > +#include "../codecs/rt5682.h"
> > +#include "common.h"
> > +#include "lpass.h"
> > +
> > +#define DEFAULT_SAMPLE_RATE_48K              48000
> > +#define DEFAULT_MCLK_RATE            19200000
> > +#define RT5682_PLL1_FREQ (48000 * 512)
> > +
> > +struct sc7180_snd_data {
> > +     struct snd_soc_jack jack;
> > +     u32 pri_mi2s_clk_count;
> > +};
> > +
> > +static void sc7180_jack_free(struct snd_jack *jack)
> > +{
> > +     struct snd_soc_component *component = jack->private_data;
> > +
> > +     snd_soc_component_set_jack(component, NULL, NULL);
> > +}
> > +
> > +static int sc7180_headset_init(struct snd_soc_component *component)
> > +{
> > +     struct snd_soc_card *card = component->card;
> > +     struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> > +     struct snd_jack *jack;
> > +     int rval;
> > +
> > +     rval = snd_soc_card_jack_new(
> > +                     card, "Headset Jack",
> > +                     SND_JACK_HEADSET |
> > +                     SND_JACK_HEADPHONE |
> > +                     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> > +                     SND_JACK_BTN_2 | SND_JACK_BTN_3,
> > +                     &pdata->jack, NULL, 0);
> > +
> > +     if (rval < 0) {
> > +             dev_err(card->dev, "Unable to add Headset Jack\n");
> > +             return rval;
> > +     }
> > +
> > +     jack = pdata->jack.jack;
> > +
> > +     snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> > +     snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> > +     snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> > +     snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> > +
> > +     jack->private_data = component;
> > +     jack->private_free = sc7180_jack_free;
> > +
> > +     rval = snd_soc_component_set_jack(component,
> > +                                       &pdata->jack, NULL);
> > +     if (rval != 0 && rval != -EOPNOTSUPP) {
> > +             dev_warn(card->dev, "Failed to set jack: %d\n", rval);
> > +             return rval;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct snd_soc_aux_dev sc7180_headset_dev = {
> > +     .dlc = COMP_EMPTY(),
> > +     .init = sc7180_headset_init,
> > +};
> > +
>
> [...]
>
> > +static struct snd_soc_card sc7180_card = {
> > +     .owner = THIS_MODULE,
> > +     .aux_dev = &sc7180_headset_dev,
> > +     .num_aux_devs = 1,
> > +     .dapm_widgets = sc7180_snd_widgets,
> > +     .num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets),
> > +};
> > +
> > +static int sc7180_parse_aux_of(struct device *dev)
> > +{
> > +     sc7180_headset_dev.dlc.of_node = of_parse_phandle(
> > +                     dev->of_node, "aux-dev", 0);
> > +
> > +     if (!sc7180_headset_dev.dlc.of_node)
> > +             return -EINVAL;
> > +     return 0;
> > +}
> > +
>
> Thanks for noting that this conflicts with my patch set that adds the
> "aux-devs" property for the device tree [1], I didn't see this before.
>
> The use of aux-dev in this patch looks a bit weird to me...
>
> As I understand, the "auxiliary devices" of a sound card are intended to
> be used for components that should be probed even though they don't
> appear within one of the DAI links. Examples for that are especially
> analog amplifiers and other components that do not have digital audio
> input/output.
>
> On the other hand, in this patch it seems to be just a way to mark the
> DAI component that will provide the headphone jack detection. In your
> example, the component that provides the headphone jack then appears
> both as DAI component and as auxiliary device:
>
>         aux-dev = <&alc5682>;
>
>         dai-link@0 {
>                 link-name = "MultiMedia0";
>                 reg = <0>;
>                 cpu {
>                         sound-dai = <&lpass_cpu 0>;
>                 };
>                 codec {
>                         sound-dai = <&alc5682 0>;
>                 };
>         };
>
> Adding &alc5682 to snd_soc_card->aux_dev is kind of pointless in this
> case because it will already be probed as part of the DAI link.
>
> The only thing you gain is that you have the init() callback which gives
> you the component that provides the headphone jack. But if someone wants
> to add an actual auxiliary device later (e.g. an analog amplifier),
> they would run into trouble...
>
> I wonder if it would be better to just have some sort of phandle, e.g.
>
>         audio-jack = <&alc5682>;
>
> but instead of creating an auxiliary device for this you would e.g.
> iterate over the list of components to find the one the phandle refers to.

Hi Stephan,
  I can try this approach. Thanks for the suggestion. I think this
would also be better than the previous approach that the machine
driver set init for jack on certain DAI.


>
> Or maybe someone else can comment if using an auxiliary device for this
> does really make sense?
>
> Thanks,
> Stephan
>
> [1]: https://lore.kernel.org/alsa-devel/20200826095141.94017-1-stephan@gerhold.net/

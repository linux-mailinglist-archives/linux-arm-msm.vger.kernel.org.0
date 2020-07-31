Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE3923419F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 10:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732014AbgGaI4K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 04:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732011AbgGaI4J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 04:56:09 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C28C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:56:08 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y3so27272689wrl.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ocwn77yQB1J0FzcXE/rpom0l+qsZKDd4AGPdVt6IsDA=;
        b=GNLh2WVWkah1W9BwgLN5Ho/xkLg7SmhaDeigVYsZhOlIJrcmLG2CDRPB6GFt5E8ngk
         GDkBAS8n9wICufsVlm+pZvnCunGp+LLcoqVndHe/I2WIFwsabgPcFNy5V9QfuJOPzvJk
         1vCJljtrOX3nC6yDvXoqy+cnB2XKPhY0NSiKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ocwn77yQB1J0FzcXE/rpom0l+qsZKDd4AGPdVt6IsDA=;
        b=TKhO2ObVLsx/b5QXD1nMKn4Vig7o+Hhx9iWQd8mN0JUm3Xh+em6V8oU7xynZTGx6FI
         +13xjRTJX39K957u8AUEvUhQh4c5rpdXVRBUY2HaHGosIYXQbAED8IkU9H6vQtid7OdS
         csGl4lPC2PqYyiGqQWq5VlnCn+WByFh2WuUPrpAVuTf9iurtDfa52hnXfOKkfcW33tV7
         npoWraYFS/mjVRjvgPZe9nyEMX1fB/Q38Wvaq6yzPsRzHXY7WU5jMucg4/JGj9DsH6Uu
         TDlHl7x88LlOiVUCCYE1UT1xP54hLZiQLIUaHuk4bQMEN3qgnZdTbqMo/BkkoztUO/RM
         Llsw==
X-Gm-Message-State: AOAM531BvWa3scEL/MqM974MpIuLjhSzl2wQzDvSes2gXLmG4p1cwlAE
        h1+rpF+amxK/hkMdo5x0uTxAudvohlq18QNjCVZ8iw==
X-Google-Smtp-Source: ABdhPJwJ2dV9OR1X0Hjp8Y8Q0JQluisUMM3vIVFc/cyjqRpNEgnnAYpbf/E6yPSU+YQtLyaj+sWAU7GL/I8GEoyzbek=
X-Received: by 2002:a5d:43c4:: with SMTP id v4mr2669082wrr.426.1596185767319;
 Fri, 31 Jul 2020 01:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200721104422.369368-1-cychiang@chromium.org>
 <20200721104422.369368-3-cychiang@chromium.org> <ce029818-5082-643b-ff63-25aafea3de6c@linaro.org>
In-Reply-To: <ce029818-5082-643b-ff63-25aafea3de6c@linaro.org>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Fri, 31 Jul 2020 16:55:40 +0800
Message-ID: <CAFv8NwKsHC2DmOHz=1QUeyGrffiOOMF+gPCA6uj+nu5M_2M4Gw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
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
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, Ajit Pandey <ajitp@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 22, 2020 at 5:25 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Few comments apart from Tzung-Bi comments,
>
Thanks a lot for reviewing the patch!

> On 21/07/2020 11:44, Cheng-Yi Chiang wrote:
> > From: Ajit Pandey <ajitp@codeaurora.org>
> >
> > Add new driver to register sound card on sc7180 trogdor board and
> > do the required configuration for lpass cpu dai and external codecs
> > connected over MI2S interfaces.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >   sound/soc/qcom/Kconfig  |  11 ++
> >   sound/soc/qcom/Makefile |   2 +
> >   sound/soc/qcom/sc7180.c | 380 ++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 393 insertions(+)
> >   create mode 100644 sound/soc/qcom/sc7180.c
> >
>
> > diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> > new file mode 100644
> > index 000000000000..3beb2b129d01
> > --- /dev/null
> > +++ b/sound/soc/qcom/sc7180.c
> > @@ -0,0 +1,380 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +//
> > +//Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > +//
> > +//sc7180.c -- ALSA SoC Machine driver for SC7180
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
>
> What is that you are using from this header?
>
It is not used in v2, but will be used in v3.

> > +#include "lpass.h"
> > +
> > +#define DEFAULT_SAMPLE_RATE_48K              48000
> > +#define DEFAULT_MCLK_RATE            19200000
> > +#define RT5682_PLL1_FREQ (48000 * 512)
> > +
> > +static int sc7180_headset_init(struct snd_soc_component *component);
> > +
> > +static struct snd_soc_aux_dev sc7180_headset_dev = {
> > +     .dlc = COMP_EMPTY(),
> > +     .init = sc7180_headset_init,
> > +};
>
> Can you explain why can you not use snd_soc_component_set_jack() on the
> codec component from link->init() callback?
>
I am using snd_soc_component_set_jack, but only on aux device.
As Tzungbi suggested in his comment on v1 machine driver patch, the
current approach in other qcom driver like sdm845.c and apq8016_sbc.c
of setting jack is not clean.
For example, in sdm845.c, a bool jack_etup is needed in
sdm845_snd_data so that jack will be created once.
Also, the machine driver assumes that snd_soc_component_set_jack is
used when cpu_dai->id == PRIMARY_MI2S_RX, which is not easy to
understand.
In apq8016_sbc.c, apq8016_sbc_dai_init tries to set jack on every
codec_dai which does not make sense.
These downsides can be avoided by using aux-dev so that the logic of
setting jack is easy to understand, and dai_init function can be much
cleaner.
> > +
> > +struct sc7180_snd_data {
> > +     struct snd_soc_jack jack;
> > +     struct snd_soc_card *card;
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
> > +
> > +static unsigned int primary_dai_fmt = SND_SOC_DAIFMT_CBS_CFS |
> > +                                   SND_SOC_DAIFMT_NB_NF |
> > +                                   SND_SOC_DAIFMT_I2S;
> > +
> > +static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +     struct snd_soc_card *card = rtd->card;
> > +     struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +     struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> > +     int ret;
> > +
> > +     switch (cpu_dai->id) {
> > +     case MI2S_PRIMARY:
> > +             if (++data->pri_mi2s_clk_count == 1) {
> > +                     snd_soc_dai_set_sysclk(cpu_dai,
> > +                                            LPASS_MCLK0,
> > +                                            DEFAULT_MCLK_RATE,
> > +                                            SNDRV_PCM_STREAM_PLAYBACK);
> > +             }
> > +             snd_soc_dai_set_fmt(codec_dai, primary_dai_fmt);
> > +
> > +             /* Configure PLL1 for codec */
> > +             ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
> > +                                       DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
> > +             if (ret < 0) {
> > +                     dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> > +                     return ret;
> > +             }
> > +
> > +             /* Configure sysclk for codec */
> > +             ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
> > +                                          RT5682_PLL1_FREQ,
> > +                                          SND_SOC_CLOCK_IN);
> > +             if (ret < 0)
> > +                     dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> > +                             ret);
> > +
> > +             break;
> > +     case MI2S_SECONDARY:
> > +             break;
> > +     default:
> > +             dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> > +                     cpu_dai->id);
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +     struct snd_soc_card *card = rtd->card;
> > +     struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +
> > +     switch (cpu_dai->id) {
> > +     case MI2S_PRIMARY:
> > +             if (--data->pri_mi2s_clk_count == 0) {
> > +                     snd_soc_dai_set_sysclk(cpu_dai,
> > +                                            LPASS_MCLK0,
> > +                                            0,
> > +                                            SNDRV_PCM_STREAM_PLAYBACK);
> > +             }
> > +             break;
> > +     case MI2S_SECONDARY:
> > +             break;
> > +     default:
> > +             dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> > +                     cpu_dai->id);
> > +             break;
> > +     }
> > +}
> > +
> > +static const struct snd_soc_ops sc7180_ops = {
> > +     .startup = sc7180_snd_startup,
> > +     .shutdown = sc7180_snd_shutdown,
> > +};
> > +
> > +static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
> > +     SND_SOC_DAPM_HP("Headphone Jack", NULL),
> > +     SND_SOC_DAPM_MIC("Headset Mic", NULL),
> > +};
> > +
> > +static struct snd_soc_card sc7180_card = {
> > +     .owner = THIS_MODULE,
> > +     .aux_dev = &sc7180_headset_dev,
> > +     .num_aux_devs = 1,
> > +     .dapm_widgets = sc7180_snd_widgets,
> > +     .num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets),
> > +};
> > +
> > +static int sc7180_parse_of(struct snd_soc_card *card)
> > +{
>
> This code is getting duplicated in various places like
> apq8016_sbc_parse_of, it will be nice to common this up, if possible!
>
>
Thanks for the refactoring work of Stephan I can reuse qcom_snd_parse_of.

> > +     struct device_node *np;
> > +     struct device_node *codec = NULL;
> > +     struct device_node *platform = NULL;
> > +     struct device_node *cpu = NULL;
> > +     struct device *dev = card->dev;
> > +     struct snd_soc_dai_link *link;
> > +     struct of_phandle_args args;
> > +     struct snd_soc_dai_link_component *dlc;
> > +     int ret, num_links;
> > +
> > +     ret = snd_soc_of_parse_card_name(card, "model");
> > +     if (ret) {
> > +             dev_err(dev, "Error parsing card name: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     /* DAPM routes */
> > +     if (of_property_read_bool(dev->of_node, "audio-routing")) {
> > +             ret = snd_soc_of_parse_audio_routing(card,
> > +                                                  "audio-routing");
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     /* headset aux dev. */
> > +     sc7180_headset_dev.dlc.of_node = of_parse_phandle(
> > +                     dev->of_node, "aux-dev", 0);
> > +     if (!sc7180_headset_dev.dlc.of_node) {
> > +             dev_err(dev,
> > +                     "Property 'aux-dev' missing/invalid\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* Populate links */
> > +     num_links = of_get_child_count(dev->of_node);
> > +
> > +     /* Allocate the DAI link array */
> > +     card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link),
> > +                                   GFP_KERNEL);
> > +     if (!card->dai_link)
> > +             return -ENOMEM;
> > +
> > +     card->num_links = num_links;
> > +     link = card->dai_link;
> > +
> > +     for_each_child_of_node(dev->of_node, np) {
> > +             dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
> > +             if (!dlc)
> > +                     return -ENOMEM;
> > +
> > +             link->cpus      = &dlc[0];
> > +             link->platforms = &dlc[1];
> > +
> > +             link->num_cpus          = 1;
> > +             link->num_platforms     = 1;
> > +
> > +             ret = of_property_read_string(np, "link-name", &link->name);
> > +             if (ret) {
> > +                     dev_err(card->dev,
> > +                             "error getting codec dai_link name\n");
> > +                     goto err;
> > +             }
> > +
> > +             link->playback_only = of_property_read_bool(np,
> > +                                                         "playback_only");
> > +             link->capture_only = of_property_read_bool(np,
> > +                                                        "capture_only");
>
> Does this even work??
> You have replaced "-" with "_" for property name?
>
This does not work because of the typo. But it is not needed so I
removed it in v3.
soc_new_pcm already takes care of capability in non-dpcm case.
> > +
> > +             if (link->playback_only && link->capture_only) {
> > +                     dev_err(card->dev,
> > +                             "getting both playback and capture only\n");
> > +                     goto err;
> > +             }
> > +
> > +             cpu = of_get_child_by_name(np, "cpu");
> > +             codec = of_get_child_by_name(np, "codec");
> > +
> > +             if (!cpu) {
> > +                     dev_err(dev, "%s: Can't find cpu DT node\n",
> > +                             link->name);
> > +                     ret = -EINVAL;
> > +                     goto err;
> > +             }
> > +
> > +             ret = of_parse_phandle_with_args(cpu, "sound-dai",
> > +                                              "#sound-dai-cells", 0, &args);
> > +             if (ret) {
> > +                     dev_err(card->dev, "%s: error getting cpu phandle\n",
> > +                             link->name);
> > +                     goto err;
> > +             }
> > +             link->cpus->of_node = args.np;
> > +             link->id = args.args[0];
> > +
> > +             ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
> > +             if (ret) {
> > +                     dev_err(card->dev, "%s: error getting cpu dai name\n",
> > +                             link->name);
> > +                     goto err;
> > +             }
> > +
> > +             if (codec) {
> > +                     ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
> > +                     if (ret < 0) {
> > +                             dev_err(card->dev, "%s: codec dai not found\n",
> > +                                     link->name);
> > +                             goto err;
> > +                     }
> > +             } else {
> > +                     dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
> > +                     if (!dlc)
> > +                             return -ENOMEM;
> > +
> > +                     link->codecs     = dlc;
> > +                     link->num_codecs = 1;
> > +
> > +                     link->codecs->dai_name = "snd-soc-dummy-dai";
> > +                     link->codecs->name = "snd-soc-dummy";
> > +             }
> > +
> > +             link->platforms->of_node = link->cpus->of_node;
> > +             link->stream_name = link->name;
> > +             link->ops = &sc7180_ops;
> > +             link++;
> > +
> > +             of_node_put(cpu);
> > +             of_node_put(codec);
> > +     }
> > +
> > +     return 0;
> > +err:
> > +     of_node_put(np);
> > +     of_node_put(cpu);
> > +     of_node_put(codec);
> > +     of_node_put(platform);
> > +     return ret;
> > +}
> > +
> > +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> > +{
> > +     struct snd_soc_card *card;
> > +     struct sc7180_snd_data *data;
> > +     struct device *dev = &pdev->dev;
> > +     int ret;
> > +
> > +     card = &sc7180_card;
> > +
> > +     /* Allocate the private data */
> > +     data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     card->dapm_widgets = sc7180_snd_widgets;
> > +     card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
> > +     card->dev = dev;
> > +     dev_set_drvdata(dev, card);
> > +     ret = sc7180_parse_of(card);
> > +     if (ret) {
> > +             dev_err(dev, "Error parsing OF data\n");
> > +             return ret;
> > +     }
> > +
> > +     data->card = card;
> > +     snd_soc_card_set_drvdata(card, data);
> > +
> > +     ret = snd_soc_register_card(card);
>
> devm_snd_soc_register_card()??
>
Fixed in v3.

> > +     if (ret) {
> > +             dev_err(dev, "Sound card registration failed\n");
> > +             return ret;
> > +     }
> > +     return ret;
> > +}
> > +
> > +static int sc7180_snd_platform_remove(struct platform_device *pdev)
> > +{
> > +     struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
> > +
> > +     snd_soc_unregister_card(card);
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id sc7180_snd_device_id[]  = {
> > +     { .compatible = "qcom,sc7180-sndcard" },
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
> > +
> > +static struct platform_driver sc7180_snd_driver = {
> > +     .probe = sc7180_snd_platform_probe,
> > +     .remove = sc7180_snd_platform_remove,
> > +     .driver = {
> > +             .name = "msm-snd-sc7180",
> > +             .of_match_table = sc7180_snd_device_id,
> > +     },
> > +};
> > +module_platform_driver(sc7180_snd_driver);
> > +
> > +MODULE_DESCRIPTION("sc7180 ASoC Machine Driver");
> > +MODULE_LICENSE("GPL v2");
> >

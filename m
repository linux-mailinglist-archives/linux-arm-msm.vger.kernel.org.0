Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019EF2665EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 19:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgIKRR5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 13:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgIKRPa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 13:15:30 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9570DC061786
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 10:15:29 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so12229704wrv.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 10:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IytQlyBm2J+C+0xQONWM1nAS/rbsPardD0SVB1HzZVE=;
        b=oAO+O+j6fCroBlWBpo9zT37KQA5EIqYtYqrdKq+o+Mp3A2uP3ZHCBksWAGt2yTKEs2
         ZrV0F+4rRjQ7XZn9OtgxWD/aQyczoV4iyMzXKXyFJC2fj1L7/3ChWtOOt9lMkUmxodAw
         jxPdCgj9yZ5oDuRDBbFVWDNeLuhnkjK5q9+ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IytQlyBm2J+C+0xQONWM1nAS/rbsPardD0SVB1HzZVE=;
        b=LWTjs/vO/SemUNhfVLVpQLKRarWnVFEccUTbXEYk0QHT0JmGFfoRIxVFBPk8PJsmwz
         f5taZ0DqlxAg/h6Iqu4OOcARU0QT/YvCdnXX7sS2CQWV2w3snD3cNGJ1OfM2SS8xaMdM
         XrILiWYAlRxUA6pV9/r4Xk82HBR4mideYHLpBQXXRlHA9B9RLwCNmJj3FHxBmjZuIpeV
         AnMnfCPkP3CaYc64VHtGSzBAsinuFflG/9kYlUPHfECDffczKMv5u5hY5ZfhKAHWPS/N
         zwN6URoSBUN/qaG/UFqcvgkEUr3StQ7JaCO/26cL3TZ7syjD3Z8eG78ASnOawVBsybV6
         Yl6g==
X-Gm-Message-State: AOAM530KyfqCuyuPR5dRqd2zHbsnQ3Q3ynTPteE5YKFBECHKf/mXr/0y
        qv1vtT4KRafbvtBCU3260xVKdEoQIknft7WcvYtBMw==
X-Google-Smtp-Source: ABdhPJxkL6ugQfLKjDoTaw8dYhcw8lds7rJ4YM1MA1f1c9zmEH9NT/CrVR+DG4P59XzhF5mw2fmzfpCEmZQtR4iUBKE=
X-Received: by 2002:a5d:61d2:: with SMTP id q18mr2984957wrv.404.1599844527125;
 Fri, 11 Sep 2020 10:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200911102259.3667381-1-cychiang@chromium.org>
 <20200911102259.3667381-4-cychiang@chromium.org> <4d25337d-3d23-9fca-9617-da54a4fdba97@linaro.org>
In-Reply-To: <4d25337d-3d23-9fca-9617-da54a4fdba97@linaro.org>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Sat, 12 Sep 2020 01:14:55 +0800
Message-ID: <CAFv8NwJe+Qi7roHRCnQf16YwC-wzPiwPugg=W-wvRrk0MV_v5A@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] ASoC: qcom: sc7180: Add machine driver for sound
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
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Ajit Pandey <ajitp@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 11, 2020 at 7:05 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 11/09/2020 11:22, Cheng-Yi Chiang wrote:
> > From: Ajit Pandey <ajitp@codeaurora.org>
> >
> > Add new driver to register sound card on sc7180 trogdor board and
> > do the required configuration for lpass cpu dai and external codecs
> > connected over MI2S interfaces.
> >
> > Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >   sound/soc/qcom/Kconfig  |  12 ++
> >   sound/soc/qcom/Makefile |   2 +
> >   sound/soc/qcom/sc7180.c | 267 ++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 281 insertions(+)
> >   create mode 100644 sound/soc/qcom/sc7180.c
> >
> ...
> >
> >   obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
> >   obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
> >   obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
> >   obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
> > +obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
> >   obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
> >
> >   #DSP lib
> > diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> > new file mode 100644
> > index 000000000000..40bc4fc98842
> > --- /dev/null
> > +++ b/sound/soc/qcom/sc7180.c
> > @@ -0,0 +1,267 @@
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
> Do you need this header?
>
Hi Srinivas, thanks for taking a closer look!
I will remove it in v10.
>
> > +#include <sound/soc.h>
> > +#include <uapi/linux/input-event-codes.h>
> > +
> > +#include "../codecs/rt5682.h"
> > +#include "common.h"
> > +#include "lpass.h"
> > +
> > +#define DEFAULT_SAMPLE_RATE_48K              48000
>
> Looks like ^ is Not used!
>
I will remove it in v10.

>
> Overall the driver looks much cleaner now!
>
> Also to make progress on this patch, may be you add define for HDMI with
> a comment!


After discussion with Srinivasa Rao, we plan to use a new name that is
more specific to lpass-sc7180 DP dai:

// This will be defined in include/dt-bindings/sound/sc7180-lpass.h
#define SC7180_LPASS_DP 2
Do you think it is okay ?
Thanks!

>
> Once unused remove, pl feel free to add !
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
>
> --srini
>
>
> > +#define DEFAULT_MCLK_RATE            19200000
> > +#define RT5682_PLL1_FREQ (48000 * 512)
> > +
> > +struct sc7180_snd_data {
> > +     u32 pri_mi2s_clk_count;
> > +     struct snd_soc_jack hs_jack;
> > +     struct snd_soc_jack hdmi_jack;
> > +};
> > +
> > +static void sc7180_jack_free(struct snd_jack *jack)
> > +{
> > +     struct snd_soc_component *component = jack->private_data;
> > +
> > +     snd_soc_component_set_jack(component, NULL, NULL);
> > +}
> > +
> > +static int sc7180_headset_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +     struct snd_soc_card *card = rtd->card;
> > +     struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> > +     struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> > +     struct snd_soc_component *component = codec_dai->component;
> > +     struct snd_jack *jack;
> > +     int rval;
> > +
> > +     rval = snd_soc_card_jack_new(
> > +                     card, "Headset Jack",
> > +                     SND_JACK_HEADSET |
> > +                     SND_JACK_HEADPHONE |
> > +                     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> > +                     SND_JACK_BTN_2 | SND_JACK_BTN_3,
> > +                     &pdata->hs_jack, NULL, 0);
> > +
> > +     if (rval < 0) {
> > +             dev_err(card->dev, "Unable to add Headset Jack\n");
> > +             return rval;
> > +     }
> > +
> > +     jack = pdata->hs_jack.jack;
> > +
> > +     snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> > +     snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> > +     snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> > +     snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> > +
> > +     jack->private_data = component;
> > +     jack->private_free = sc7180_jack_free;
> > +
> > +     return snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
> > +}
> > +
> > +static int sc7180_hdmi_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +     struct snd_soc_card *card = rtd->card;
> > +     struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> > +     struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> > +     struct snd_soc_component *component = codec_dai->component;
> > +     struct snd_jack *jack;
> > +     int rval;
> > +
> > +     rval = snd_soc_card_jack_new(
> > +                     card, "HDMI Jack",
> > +                     SND_JACK_LINEOUT,
> > +                     &pdata->hdmi_jack, NULL, 0);
> > +
> > +     if (rval < 0) {
> > +             dev_err(card->dev, "Unable to add HDMI Jack\n");
> > +             return rval;
> > +     }
> > +
> > +     jack = pdata->hdmi_jack.jack;
> > +     jack->private_data = component;
> > +     jack->private_free = sc7180_jack_free;
> > +
> > +     return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
> > +}
> > +
> > +static int sc7180_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +
> > +     switch (cpu_dai->id) {
> > +     case MI2S_PRIMARY:
> > +             return sc7180_headset_init(rtd);
> > +     case MI2S_SECONDARY:
> > +             return 0;
> > +     case HDMI:
> > +             return sc7180_hdmi_init(rtd);
> > +     default:
> > +             dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> > +                     cpu_dai->id);
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
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
> > +
> > +             snd_soc_dai_set_fmt(codec_dai,
> > +                                 SND_SOC_DAIFMT_CBS_CFS |
> > +                                 SND_SOC_DAIFMT_NB_NF |
> > +                                 SND_SOC_DAIFMT_I2S);
> > +
> > +             /* Configure PLL1 for codec */
> > +             ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
> > +                                       DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
> > +             if (ret) {
> > +                     dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> > +                     return ret;
> > +             }
> > +
> > +             /* Configure sysclk for codec */
> > +             ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
> > +                                          RT5682_PLL1_FREQ,
> > +                                          SND_SOC_CLOCK_IN);
> > +             if (ret)
> > +                     dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> > +                             ret);
> > +
> > +             break;
> > +     case MI2S_SECONDARY:
> > +             break;
> > +     case HDMI:
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
> > +     case HDMI:
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
> > +     .dapm_widgets = sc7180_snd_widgets,
> > +     .num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets),
> > +};
> > +
> > +static void sc7180_add_ops(struct snd_soc_card *card)
> > +{
> > +     struct snd_soc_dai_link *link;
> > +     int i;
> > +
> > +     for_each_card_prelinks(card, i, link) {
> > +             link->ops = &sc7180_ops;
> > +             link->init = sc7180_init;
> > +     }
> > +}
> > +
> > +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> > +{
> > +     struct snd_soc_card *card = &sc7180_card;
> > +     struct sc7180_snd_data *data;
> > +     struct device *dev = &pdev->dev;
> > +     int ret;
> > +
> > +     /* Allocate the private data */
> > +     data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     card->dev = dev;
> > +     snd_soc_card_set_drvdata(card, data);
> > +
> > +     ret = qcom_snd_parse_of(card);
> > +     if (ret) {
> > +             dev_err(dev, "Error parsing OF data\n");
> > +             return ret;
> > +     }
> > +
> > +     sc7180_add_ops(card);
> > +
> > +     return devm_snd_soc_register_card(dev, card);
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

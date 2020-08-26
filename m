Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B021F252C78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 13:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728955AbgHZLbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 07:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbgHZL3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 07:29:22 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4372DC061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 04:28:57 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o21so1417183wmc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ybt+qWVcIHEwZJBuhBd3IOPyVT0k3lI56vDvbb4o5cw=;
        b=Yfh5dehbopXu+TpD68HHFxpjNLnTfOZATVr7kneTONBeMeOoYUh3V5GtDqrKbyzKK5
         vCf/mCltYUDXtybdH7yebXfAfXoIti+bci9aI7fRwNHGcrQXZeCibvVSuH5gHHvfUGlJ
         VNrQR0GvGtjrmcsHDBX/WZFnOREgfRcre2YWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ybt+qWVcIHEwZJBuhBd3IOPyVT0k3lI56vDvbb4o5cw=;
        b=Ff4KCT59hQk6I0ywBQfmdaYRX1SII3wwmZvq5okckunTESXDljk7S9bpQ1dlKWhivj
         98/HQc8m550YSpmjsg3HfSFgbI1d+22G9lfwUOlKLULEx+1WQnUQ9MxzF42o/gheYZ09
         lUjKtOIyyXXAUvs0Mk2YnMgC/B0nMXNnaEqxrqJsF81lpnJjwAfDQP1dA5qYzue7jmew
         eCHJFRI0UHC7aO7rB4LNjtUhxIPtHJmVPMzgtSzc5l291wYLBeOK4laaGSpGworPxoYd
         tTd/FH/7KK8MNQNHU5SOJxfVp0qcZxZvJsbja237rxBRO0XtHgSXvkwOGBjRAmSrwgTn
         NkgQ==
X-Gm-Message-State: AOAM532/VHDXonj5Kv8MnS339maHzOt89SSYcK1Cut2AlwzXgnwSMBrz
        fI1HNJePpyb8R1UQeKf5sYwfJcVBj/8DySeUhuIyAA==
X-Google-Smtp-Source: ABdhPJy1GnVXRgJ+Dn+5Z03241a3emWmy4dHXLNuZ844z2MINEefJJ5ozTefR1JkVaxjtEKrTPXeCR1YhTubXosHhEc=
X-Received: by 2002:a1c:a1c7:: with SMTP id k190mr6367147wme.1.1598441335105;
 Wed, 26 Aug 2020 04:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200826110454.1811352-1-cychiang@chromium.org> <20200826110454.1811352-3-cychiang@chromium.org>
In-Reply-To: <20200826110454.1811352-3-cychiang@chromium.org>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Wed, 26 Aug 2020 19:28:28 +0800
Message-ID: <CAFv8NwLFeR-xSXdRXH-qGqbPS69NXV-fgqZ8-EXT_b-C0e1YvQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To:     linux-kernel <linux-kernel@vger.kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, Ajit Pandey <ajitp@codeaurora.org>,
        Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 26, 2020 at 7:05 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> From: Ajit Pandey <ajitp@codeaurora.org>
>
> Add new driver to register sound card on sc7180 trogdor board and
> do the required configuration for lpass cpu dai and external codecs
> connected over MI2S interfaces.
>
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  sound/soc/qcom/Kconfig  |  12 ++
>  sound/soc/qcom/Makefile |   2 +
>  sound/soc/qcom/sc7180.c | 244 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 258 insertions(+)
>  create mode 100644 sound/soc/qcom/sc7180.c
>
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index a607ace8b089..63678b746299 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -116,4 +116,16 @@ config SND_SOC_SDM845
>           SDM845 SoC-based systems.
>           Say Y if you want to use audio device on this SoCs.
>
> +config SND_SOC_SC7180
> +       tristate "SoC Machine driver for SC7180 boards"
> +       depends on SND_SOC_QCOM
> +       select SND_SOC_QCOM_COMMON
> +       select SND_SOC_LPASS_SC7180
> +       select SND_SOC_MAX98357A
> +       select SND_SOC_RT5682
> +       help
> +         To add support for audio on Qualcomm Technologies Inc.
> +         SC7180 SoC-based systems.
> +         Say Y if you want to use audio device on this SoCs.
> +
>  endif #SND_SOC_QCOM
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 7972c9479ab0..0cdcbf367ef1 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -17,12 +17,14 @@ snd-soc-storm-objs := storm.o
>  snd-soc-apq8016-sbc-objs := apq8016_sbc.o
>  snd-soc-apq8096-objs := apq8096.o
>  snd-soc-sdm845-objs := sdm845.o
> +snd-soc-sc7180-objs := sc7180.o
>  snd-soc-qcom-common-objs := common.o
>
>  obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
>  obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
>  obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
>  obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
> +obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
>  obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
>
>  #DSP lib
> diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> new file mode 100644
> index 000000000000..7849376f63ba
> --- /dev/null
> +++ b/sound/soc/qcom/sc7180.c
> @@ -0,0 +1,244 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020, The Linux Foundation. All rights reserved.
> +//
> +// sc7180.c -- ALSA SoC Machine driver for SC7180
> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <uapi/linux/input-event-codes.h>
> +
> +#include "../codecs/rt5682.h"
> +#include "common.h"
> +#include "lpass.h"
> +
> +#define DEFAULT_SAMPLE_RATE_48K                48000
> +#define DEFAULT_MCLK_RATE              19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
> +
> +struct sc7180_snd_data {
> +       struct snd_soc_jack jack;
> +       u32 pri_mi2s_clk_count;
> +};
> +
> +static void sc7180_jack_free(struct snd_jack *jack)
> +{
> +       struct snd_soc_component *component = jack->private_data;
> +
> +       snd_soc_component_set_jack(component, NULL, NULL);
> +}
> +
> +static int sc7180_headset_init(struct snd_soc_component *component)
> +{
> +       struct snd_soc_card *card = component->card;
> +       struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +       struct snd_jack *jack;
> +       int rval;
> +
> +       rval = snd_soc_card_jack_new(
> +                       card, "Headset Jack",
> +                       SND_JACK_HEADSET |
> +                       SND_JACK_HEADPHONE |
> +                       SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +                       SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +                       &pdata->jack, NULL, 0);
> +
> +       if (rval < 0) {
> +               dev_err(card->dev, "Unable to add Headset Jack\n");
> +               return rval;
> +       }
> +
> +       jack = pdata->jack.jack;
> +
> +       snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> +       snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +       snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +       snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +
> +       jack->private_data = component;
> +       jack->private_free = sc7180_jack_free;
> +
> +       rval = snd_soc_component_set_jack(component,
> +                                         &pdata->jack, NULL);
> +       if (rval != 0 && rval != -EOPNOTSUPP) {
> +               dev_warn(card->dev, "Failed to set jack: %d\n", rval);
> +               return rval;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct snd_soc_aux_dev sc7180_headset_dev = {
> +       .dlc = COMP_EMPTY(),
> +       .init = sc7180_headset_init,
> +};
> +
> +static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_card *card = rtd->card;
> +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +       int ret;
> +
> +       switch (cpu_dai->id) {
> +       case MI2S_PRIMARY:
> +               if (++data->pri_mi2s_clk_count == 1) {
> +                       snd_soc_dai_set_sysclk(cpu_dai,
> +                                              LPASS_MCLK0,
> +                                              DEFAULT_MCLK_RATE,
> +                                              SNDRV_PCM_STREAM_PLAYBACK);
> +               }
> +
> +               snd_soc_dai_set_fmt(codec_dai,
> +                                   SND_SOC_DAIFMT_CBS_CFS |
> +                                   SND_SOC_DAIFMT_NB_NF |
> +                                   SND_SOC_DAIFMT_I2S);
> +
> +               /* Configure PLL1 for codec */
> +               ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
> +                                         DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
> +               if (ret) {
> +                       dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> +                       return ret;
> +               }
> +
> +               /* Configure sysclk for codec */
> +               ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
> +                                            RT5682_PLL1_FREQ,
> +                                            SND_SOC_CLOCK_IN);
> +               if (ret)
> +                       dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> +                               ret);
> +
> +               break;
> +       case MI2S_SECONDARY:
> +               break;
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +                       cpu_dai->id);
> +               return -EINVAL;
> +       }
> +       return 0;
> +}
> +
> +static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_card *card = rtd->card;
> +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +       switch (cpu_dai->id) {
> +       case MI2S_PRIMARY:
> +               if (--data->pri_mi2s_clk_count == 0) {
> +                       snd_soc_dai_set_sysclk(cpu_dai,
> +                                              LPASS_MCLK0,
> +                                              0,
> +                                              SNDRV_PCM_STREAM_PLAYBACK);
> +               }
> +               break;
> +       case MI2S_SECONDARY:
> +               break;
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +                       cpu_dai->id);
> +               break;
> +       }
> +}
> +
> +static const struct snd_soc_ops sc7180_ops = {
> +       .startup = sc7180_snd_startup,
> +       .shutdown = sc7180_snd_shutdown,
> +};
> +
> +static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
> +       SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +       SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +};
> +
> +static struct snd_soc_card sc7180_card = {
> +       .owner = THIS_MODULE,
> +       .aux_dev = &sc7180_headset_dev,
> +       .num_aux_devs = 1,
> +       .dapm_widgets = sc7180_snd_widgets,
> +       .num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets),
> +};
> +
> +static int sc7180_parse_aux_of(struct device *dev)
> +{
> +       sc7180_headset_dev.dlc.of_node = of_parse_phandle(
> +                       dev->of_node, "aux-dev", 0);
> +
> +       if (!sc7180_headset_dev.dlc.of_node)
> +               return -EINVAL;
> +       return 0;
> +}
> +
> +static void sc7180_add_ops(struct snd_soc_card *card)
> +{
> +       struct snd_soc_dai_link *link;
> +       int i;
> +
> +       for_each_card_prelinks(card, i, link)
> +               link->ops = &sc7180_ops;
> +}
> +
> +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card = &sc7180_card;
> +       struct sc7180_snd_data *data;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       /* Allocate the private data */
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       card->dev = dev;
> +
> +       ret = qcom_snd_parse_of(card);
> +       if (ret) {
> +               dev_err(dev, "Error parsing OF data\n");
> +               return ret;
> +       }
> +
> +       snd_soc_card_set_drvdata(card, data);
> +
> +       sc7180_add_ops(card);
> +
> +       ret = sc7180_parse_aux_of(dev);
> +       if (ret) {
> +               dev_err(dev, "Failed to parse OF for jack device\n");
> +               return ret;
> +       }
> +
> +       return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static const struct of_device_id sc7180_snd_device_id[]  = {
> +       { .compatible = "qcom,sc7180-sndcard" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
> +
> +static struct platform_driver sc7180_snd_driver = {
> +       .probe = sc7180_snd_platform_probe,
> +       .driver = {
> +               .name = "msm-snd-sc7180",
> +               .of_match_table = sc7180_snd_device_id,
> +       },
> +};
> +module_platform_driver(sc7180_snd_driver);
> +
> +MODULE_DESCRIPTION("sc7180 ASoC Machine Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.28.0.297.g1956fa8f8d-goog
>

Hi Mark,
Since the LPASS driver has been merged, this driver is ready to go.
I noticed that there is a relevant patch by Stephan recently changing
how aud-dev is read from dts.

https://patchwork.kernel.org/patch/11737783/

If you plan to merge that one first, I can make changes based on that
so the aux-dev can get its init function.

And FYI, there will be a follow-up patch on this machine driver for
users to select between two different sound cards.
The new sound card will pick up a GPIO from dts to toggle front mic / rear mic.

Please let me know if you have any concerns.
Thanks!

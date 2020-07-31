Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B16B23419C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 10:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731989AbgGaI4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 04:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731946AbgGaI4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 04:56:00 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3E7C061575
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:56:00 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b6so27256206wrs.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QBHE4fKMCp+5Jv6t916ly0w3GcK657wBATaaYaxh1gY=;
        b=TNhS5V4Kk+yxheLlhpcZnfBkwhlgx8+ZAZxw2Ih5ksJHBysM9Oij6StSM1aFYAzFOe
         cisWFjkl4ypUTsEeonVS7nzrpNEbLIGOMP9+XwwD8NPry9WIVl8zYX8Vd5EuQpHJ8om0
         Dw23aX8K/tEr0biihIumiS/L2j+u0k7/qtbO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QBHE4fKMCp+5Jv6t916ly0w3GcK657wBATaaYaxh1gY=;
        b=Pz5XsaSz2NuguvEdCKYiTC2XdgwqXvXdrWd6aZc7UogFSxC9YMermxHtTxccrZ6Azb
         qMOeCnSYp9Z7GlTcyaEGhBChn/vlnl0AoESBf5Ui1m9M/VZS4sGPLpw6DmqubBp/kd6f
         uYMLK81QtlpX0TsW9YeeTnqRMX55OrbYldwc4bgTqPhCnci6rzp0Bae826giiRpwdJA8
         533qDhZQhkqepHuJlopznEaVdr5Q0hSKHNSRaOMeC+5kml4bQ6qFKivGa/Lqd28gmbKc
         d6tNpZKckbbsSZn4XH6jGufhMWu7fpe416XNs2UcEjIu4TYEJnw+DQ/MvBuag9vyP5ST
         FBgg==
X-Gm-Message-State: AOAM530RNANlzRBvY/JCqoyVa696SYViRlOnnYDAk1YZLQU7bJ1QH19H
        7+48SZS//bzUwqheFNrXhqm8akzd/gCj8ZR4YOZiAw==
X-Google-Smtp-Source: ABdhPJyGTqAhhgmPxuFWPKILcG7b7cETS/CyJEmEASBTALmXAIDy5oozTL7G+AC8j8/n4iSVyuth8NixAQgLERsxAkY=
X-Received: by 2002:a5d:5588:: with SMTP id i8mr2530132wrv.177.1596185758972;
 Fri, 31 Jul 2020 01:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200721104422.369368-1-cychiang@chromium.org>
 <20200721104422.369368-3-cychiang@chromium.org> <CA+Px+wUEQqe0dOeHBFxOEFG5QctTipj6egu94OD+LvYmSunaTQ@mail.gmail.com>
In-Reply-To: <CA+Px+wUEQqe0dOeHBFxOEFG5QctTipj6egu94OD+LvYmSunaTQ@mail.gmail.com>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Fri, 31 Jul 2020 16:55:31 +0800
Message-ID: <CAFv8Nw+HYUc5fHkJUe+Exsufyvve9ZHTxbzG0EukwiA7ugJwag@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
        Douglas Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        Ajit Pandey <ajitp@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 22, 2020 at 11:15 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Tue, Jul 21, 2020 at 6:44 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
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
> Insert an extra space between // and text to make it look better.
>
Fixed in v3.
> > +static int sc7180_headset_init(struct snd_soc_component *component);
> > +
> > +static struct snd_soc_aux_dev sc7180_headset_dev = {
> > +       .dlc = COMP_EMPTY(),
> > +       .init = sc7180_headset_init,
> > +};
> Move definition of sc7180_headset_dev after sc7180_headset_init( ) so
> that you don't need forward declaration of sc7180_headset_init( ).
>
Fixed in v3.
> > +static unsigned int primary_dai_fmt = SND_SOC_DAIFMT_CBS_CFS |
> > +                                     SND_SOC_DAIFMT_NB_NF |
> > +                                     SND_SOC_DAIFMT_I2S;
> > +
> > +static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> > +{
> > +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +       struct snd_soc_card *card = rtd->card;
> > +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> > +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> > +       int ret;
> > +
> > +       switch (cpu_dai->id) {
> > +       case MI2S_PRIMARY:
> > +               if (++data->pri_mi2s_clk_count == 1) {
> > +                       snd_soc_dai_set_sysclk(cpu_dai,
> > +                                              LPASS_MCLK0,
> > +                                              DEFAULT_MCLK_RATE,
> > +                                              SNDRV_PCM_STREAM_PLAYBACK);
> > +               }
> > +               snd_soc_dai_set_fmt(codec_dai, primary_dai_fmt);
> My comment on the previous thread may mislead.  My original intent:
> move the DAIFMT setting to DAI link->dai_fmt in sc7180_parse_of( ).
>
> If you need to keep it as is: inline the SND_SOC_DAIFMT_* into
> snd_soc_dai_set_fmt( ) (i.e. eliminate primary_dai_fmt).
>
Fixed in v3. Since in v3 I am reusing parse function in common.c, I
will keep the format setting in startup.

> > +static int sc7180_parse_of(struct snd_soc_card *card)
> > +{
> > +       struct device_node *np;
> > +       struct device_node *codec = NULL;
> > +       struct device_node *platform = NULL;
> The function doesn't use platform.
>

sc7180_parse_of is removed in v3.

> > +       struct device_node *cpu = NULL;
> > +       struct device *dev = card->dev;
> > +       struct snd_soc_dai_link *link;
> > +       struct of_phandle_args args;
> > +       struct snd_soc_dai_link_component *dlc;
> > +       int ret, num_links;
> > +
> > +       ret = snd_soc_of_parse_card_name(card, "model");
> > +       if (ret) {
> > +               dev_err(dev, "Error parsing card name: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       /* DAPM routes */
> > +       if (of_property_read_bool(dev->of_node, "audio-routing")) {
> > +               ret = snd_soc_of_parse_audio_routing(card,
> > +                                                    "audio-routing");
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       /* headset aux dev. */
> > +       sc7180_headset_dev.dlc.of_node = of_parse_phandle(
> > +                       dev->of_node, "aux-dev", 0);
> > +       if (!sc7180_headset_dev.dlc.of_node) {
> > +               dev_err(dev,
> > +                       "Property 'aux-dev' missing/invalid\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       /* Populate links */
> > +       num_links = of_get_child_count(dev->of_node);
> Eliminate num_links but use card->num_links directly.
>
> > +
> > +       /* Allocate the DAI link array */
> > +       card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link),
> > +                                     GFP_KERNEL);
> > +       if (!card->dai_link)
> > +               return -ENOMEM;
> > +
> > +       card->num_links = num_links;
> Ditto, eliminate it.
>
> > +       link = card->dai_link;
> > +
> Eliminate the blank line to make "link = card->dai_link" and the
> following for-loop "a whole thing".
>
> > +       for_each_child_of_node(dev->of_node, np) {
> > +               dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
> > +               if (!dlc)
> > +                       return -ENOMEM;
> > +
> > +               link->cpus      = &dlc[0];
> > +               link->platforms = &dlc[1];
> > +
> > +               link->num_cpus          = 1;
> > +               link->num_platforms     = 1;
> > +
> > +               ret = of_property_read_string(np, "link-name", &link->name);
> > +               if (ret) {
> > +                       dev_err(card->dev,
> > +                               "error getting codec dai_link name\n");
> > +                       goto err;
> > +               }
> > +
> > +               link->playback_only = of_property_read_bool(np,
> > +                                                           "playback_only");
> > +               link->capture_only = of_property_read_bool(np,
> > +                                                          "capture_only");
> > +
> > +               if (link->playback_only && link->capture_only) {
> > +                       dev_err(card->dev,
> > +                               "getting both playback and capture only\n");
> ret = -EINVAL;
>
> > +                       goto err;
> > +               }
> > +
> > +               cpu = of_get_child_by_name(np, "cpu");
> > +               codec = of_get_child_by_name(np, "codec");
> Move to below.
>
> > +
> > +               if (!cpu) {
> > +                       dev_err(dev, "%s: Can't find cpu DT node\n",
> > +                               link->name);
> > +                       ret = -EINVAL;
> > +                       goto err;
> > +               }
> > +
> > +               ret = of_parse_phandle_with_args(cpu, "sound-dai",
> > +                                                "#sound-dai-cells", 0, &args);
> I may overlook it but I failed to find "#sound-dai-cells" in the
> dt-binding example.  I think it should be in DTS?
>
> > +               if (ret) {
> > +                       dev_err(card->dev, "%s: error getting cpu phandle\n",
> > +                               link->name);
> > +                       goto err;
> > +               }
> > +               link->cpus->of_node = args.np;
> > +               link->id = args.args[0];
> I am not quite sure what it will be.  I guess one of the following
> comes from DTS node name.
> #define MI2S_PRIMARY 0
> #define MI2S_SECONDARY 1
>
> > +
> > +               ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
> > +               if (ret) {
> > +                       dev_err(card->dev, "%s: error getting cpu dai name\n",
> > +                               link->name);
> > +                       goto err;
> > +               }
> > +
>
> Move "codec = of_get_child_by_name(np, "codec");" to here.
> > +               if (codec) {
> > +                       ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
> > +                       if (ret < 0) {
> > +                               dev_err(card->dev, "%s: codec dai not found\n",
> > +                                       link->name);
> > +                               goto err;
> > +                       }
> > +               } else {
> > +                       dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
> > +                       if (!dlc)
> > +                               return -ENOMEM;
> > +
> > +                       link->codecs     = dlc;
> > +                       link->num_codecs = 1;
> > +
> > +                       link->codecs->dai_name = "snd-soc-dummy-dai";
> > +                       link->codecs->name = "snd-soc-dummy";
> > +               }
> > +
> > +               link->platforms->of_node = link->cpus->of_node;
> > +               link->stream_name = link->name;
> > +               link->ops = &sc7180_ops;
> > +               link++;
> > +
> > +               of_node_put(cpu);
> > +               of_node_put(codec);
> cpu = NULL;
> codec = NULL;
> In case of double of_node_put( ).
>
> > +       }
> > +
> > +       return 0;
> > +err:
> > +       of_node_put(np);
> I guess you don't need this.
>
> > +       of_node_put(cpu);
> > +       of_node_put(codec);
> > +       of_node_put(platform);
> Eliminate it, not used.
>
> > +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> > +{
> > +       struct snd_soc_card *card;
> > +       struct sc7180_snd_data *data;
> > +       struct device *dev = &pdev->dev;
> > +       int ret;
> > +
> > +       card = &sc7180_card;
> In this case, inline the initialization while declaration.
>
Fixed in v3.
> > +
> > +       /* Allocate the private data */
> > +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +       if (!data)
> > +               return -ENOMEM;
> > +
> > +       card->dapm_widgets = sc7180_snd_widgets;
> > +       card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
> Remove them.
>
Fixed in v3.
> > +       card->dev = dev;
> > +       dev_set_drvdata(dev, card);
> I guess you don't need this if using devm_snd_soc_register_card(...).
>
> Insert a blank line.

Fixed in v3.
> > +       ret = sc7180_parse_of(card);
> > +       if (ret) {
> > +               dev_err(dev, "Error parsing OF data\n");
> > +               return ret;
> > +       }
> > +
> > +       data->card = card;
> Looks like data->card is not used.
>
Removed in v3.
> > +       snd_soc_card_set_drvdata(card, data);
> > +
> > +       ret = snd_soc_register_card(card);
> > +       if (ret) {
> > +               dev_err(dev, "Sound card registration failed\n");
> > +               return ret;
> > +       }
> > +       return ret;
> Just return devm_snd_soc_register_card(...);
>
Fixed in v3.
> > +static int sc7180_snd_platform_remove(struct platform_device *pdev)
> > +{
> > +       struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
> > +
> > +       snd_soc_unregister_card(card);
> > +       return 0;
> > +}
> Can be removed if using devm_snd_soc_register_card( ).
>
>
Removed in v3.
> I didn't go through all the cases.  But it would be better if all "if
> (ret < 0)" can be replaced to "if (ret)".
Fixed in v3.

Thanks for the review!

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 489AF398FA2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 18:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhFBQKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 12:10:03 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:43757 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbhFBQKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 12:10:01 -0400
Received: by mail-ot1-f46.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso2868097otu.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YAZ7ZSfiugbOhQydoUaMJhIYB+bVGqv38BgoX6VqAHE=;
        b=j/5O522W9LSYYrKW9y59tk17EqPiEy6B3Mu6d/DngVNcdt76RphieNTFg+qkPe4exg
         iBRQnfM8P80qgcNaqPaWwfvPVjh6MlmlBCULycBD0OeICSAKNTxsgOiQ55CjE11/Cl+F
         qhHg+o4kbAQ2kNsd1RWdyTiprF2aXGBdBysLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YAZ7ZSfiugbOhQydoUaMJhIYB+bVGqv38BgoX6VqAHE=;
        b=kHrKzTjF7bjwTZTPTGzlEu9Ja5GatZ+e3/pKI3w3zdkRR9qGum62ZL3ef2ig3e1kfP
         Y8sH0429PSfXQlQFbgoKQHnOuQA/KIAAEX0sGeOWHTJFQZ8ViI2PwLEaKNc2YfyMMIMm
         fsPC2AqVCLWlklP3YqdsDNarH13um/7LqqKIswdLD9Apdp164TQtJOLv1wuwxHJ5LeG+
         dDELa9UdLcoe1oUAjUi5vqgtqQOVuYI3nyfKqCW1nJPmTo3ZNPtlnoDFBq+EkjdBWS9i
         hoTjO6dQcJpvuBgIFLSVGXQeU3ZP6At9iU61pBxme9NoSYi2gnMPpeIIywq8RalQZgZm
         yN+w==
X-Gm-Message-State: AOAM530H/GUYdcl1Q3eMFRs1IOEezu1QHmwYetsiuXtv1EAa2hqIqC+2
        MDXWtBXSylCHj3Y1BSdfHnIuVxbykHnvlw==
X-Google-Smtp-Source: ABdhPJzW/AkA3AWenYIHh1OkffO86xZOFAtr4mLhvs4lp7a+LSloc8zZqntqaTX3tr59wdqX4xN0qA==
X-Received: by 2002:a9d:131:: with SMTP id 46mr27087051otu.241.1622650038206;
        Wed, 02 Jun 2021 09:07:18 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id r83sm57740oih.48.2021.06.02.09.07.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 09:07:18 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id q9-20020a9d66490000b02903c741e5b703so1769972otm.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 09:07:17 -0700 (PDT)
X-Received: by 2002:ab0:c07:: with SMTP id a7mr21690857uak.120.1622650025634;
 Wed, 02 Jun 2021 09:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210602155312.207401-1-judyhsiao@chromium.org>
In-Reply-To: <20210602155312.207401-1-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Jun 2021 09:06:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V_-oV7A_YPOFnCqUk5o=LBvf6KP1tNyVXTp=eeRkPaYQ@mail.gmail.com>
Message-ID: <CAD=FV=V_-oV7A_YPOFnCqUk5o=LBvf6KP1tNyVXTp=eeRkPaYQ@mail.gmail.com>
Subject: Re: [v4] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
To:     Judy Hsiao <judyhsiao@chromium.org>
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
        Dylan Reid <dgreid@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 2, 2021 at 8:54 AM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>
> This patch fixes PoP noise of around 15ms observed during audio
> capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for
> introducing some delay before capture start and clock enable.
>
> Co-developed-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> (am from https://patchwork.kernel.org/patch/12276369/)
> (also found at https://lore.kernel.org/r/20210524142114.18676-1-srivasam@codeaurora.org)
>
> ---
> Chages Since V3:
>         -- Check BCLK is off before enabling it in lpass_cpu_daiops_prepare as
>            lpass_cpu_daiops_prepare can be called multiple times.
>         -- Check BCLK is on before disabling it in lpass_cpu_daiops_shutdown to
>            fix the WARN. It is because BCLK may not be enabled if
>            lpass_cpu_daiops_prepare is not called before lpass_cpu_daiops_shutdown.
>         -- Adds more comments.
> Changes Since V2:
>         -- Updated comments as per linux style
>         -- Removed unrelated changes.
> Changes Since V1:
>         -- Enableed BCLK and LRCLK in dai ops prepare API instead of startup API
>         -- Added comments
>
>  sound/soc/qcom/lpass-cpu.c | 83 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index af8cb64924a0..b572d7874554 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -93,8 +94,28 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
>                 struct snd_soc_dai *dai)
>  {
>         struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +       unsigned int id = dai->driver->id;
>
>         clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
> +       /*
> +        * To ensure LRCLK disabled even in device node validation
> +        * Will not impact if disabled in lpass_cpu_daiops_trigger()
> +        * suspend.
> +        */
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
> +       else
> +               regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
> +
> +       /*
> +        * BCLK may not be enabled if lpass_cpu_daiops_prepare is called before
> +        * lpass_cpu_daiops_shutdown. It's paired with the clk_enable in
> +        * lpass_cpu_daiops_prepare.
> +        */
> +       if (__clk_is_enabled(drvdata->mi2s_bit_clk[dai->driver->id]))
> +               clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);

Not a full review of this patch, but the above pattern is almost never
correct. There's a reason that the __clk_is_enabled() is only in
"clk-provider.h"--it's not intended to be called by clients.

Possibly a good solution (this is not code I've ever looked at) is to
just have a boolean in your structure like "was_prepared". Then if
"was_prepared" you can disable the clock. Also in the
lpass_cpu_daiops_prepare() function you should only enable the clock
if "!was_prepared" already.


> @@ -288,7 +321,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>
>                 ret = clk_enable(drvdata->mi2s_bit_clk[id]);
>                 if (ret) {
> -                       dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +                       dev_err(dai->dev,
> +                               "error in enabling mi2s bit clk: %d\n", ret);

Why is there an unrelated change to wrapping here? Seems like you
could drop this part of the change. If you really need to make this
change (you probably don't since the 80 column rule has been relaxed
and it's also existing code) then you could change it in a separate
patch.


> +       /*
> +        * Check BCLK is off before enabling it as lpass_cpu_daiops_prepare can
> +        * be called multiple times. It's paired with the clk_disable in
> +        * lpass_cpu_daiops_shutdown.
> +        */
> +       if (!__clk_is_enabled(drvdata->mi2s_bit_clk[dai->driver->id])) {
> +               ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +               if (ret) {
> +                       dev_err(dai->dev,
> +                               "error in enabling mi2s bit clk: %d\n", ret);
> +                       clk_disable(drvdata->mi2s_osr_clk[id]);

If the clk_enable() failed then you shouldn't call clk_disable().

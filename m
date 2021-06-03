Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6F339AE54
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 00:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhFCWoG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 18:44:06 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:45896 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhFCWoF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 18:44:05 -0400
Received: by mail-qk1-f169.google.com with SMTP id d196so2468450qkg.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 15:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MakzHmrhP8vAXjgFSVERlwbbPQz/I4RXtNHBxH/9Tqs=;
        b=VHKdAmXjQ4mWJlaUmDx/2T6K5khw/jG/8HRArFGaS5PZAhyt5H9ths7x65e9eiWwVy
         wVe7U4TCdZ4W9x+r1xnAzGyfLoKSkCOg8CL1xoqwU6s8AcHLMifmR/f714catM/cJHxP
         6Q9oafZgsflYNWsgqYoAyys8ALdxUI/Wg7hF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MakzHmrhP8vAXjgFSVERlwbbPQz/I4RXtNHBxH/9Tqs=;
        b=swP6F2jFu5znEdCxAdx0GsPEZhRwe+W0+MPfg53raMs6ro628wdZ7/Ue1DOqc2HC5k
         PVAbcm7Mqgqwh0WprzxADt4is3QD7WkqW+xOlaKuIy82ict3aA9CsDrhfXhH0nRAdoON
         AVi6lUX3Cl/fkFrgaC9u4IaEQT/p6zCsxItjGUhxDOZJCD8pdKHEQJ8wXtTfjwtsVPCY
         ifNKDQA9pF8GoTR9dyu/OGe+DlcO0MAwiK2Cd6yMwPVgXMZiJ5tSKUW0lnrSXa++7lRt
         wSLkaUWAo7/2/BxiKc8fih+ZmN3EZcJUSRkX/tEiaBRFlDRMMruAPipcaJWJrn1GE066
         zNAQ==
X-Gm-Message-State: AOAM532q5YO910KzVOBqbtLDhPkBcN+NPvjLJgy6qWGGcrItKU9BvSQB
        n442bbqIjS/KyhCHGdZRdtVj8b7PFr8biA==
X-Google-Smtp-Source: ABdhPJz3JB/3fYmIqZernSozfxKe3UHJOxcgVLICWfEoR3M14hHx08vghiP77Xs/vAXarVZZCj2S3A==
X-Received: by 2002:a37:6244:: with SMTP id w65mr1613438qkb.304.1622760069931;
        Thu, 03 Jun 2021 15:41:09 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id b5sm2806528qkn.129.2021.06.03.15.41.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 15:41:09 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id b13so11019747ybk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 15:41:09 -0700 (PDT)
X-Received: by 2002:a25:ab4b:: with SMTP id u69mr1137987ybi.276.1622760058683;
 Thu, 03 Jun 2021 15:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210603150830.229423-1-judyhsiao@chromium.org>
In-Reply-To: <20210603150830.229423-1-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Jun 2021 15:40:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VzBgbhhVQvG+UGD2yaLJkwiq0qQHdFNQ2Ey8RKmV+qTg@mail.gmail.com>
Message-ID: <CAD=FV=VzBgbhhVQvG+UGD2yaLJkwiq0qQHdFNQ2Ey8RKmV+qTg@mail.gmail.com>
Subject: Re: [v5] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
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

Judy,

On Thu, Jun 3, 2021 at 8:08 AM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> @@ -315,12 +353,54 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>         return ret;
>  }
>
> +static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
> +               struct snd_soc_dai *dai)
> +{
> +       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +       unsigned int id = dai->driver->id;
> +       int ret;
> +       /*
> +        * Ensure lpass BCLK/LRCLK is enabled bit before playback/capture
> +        * data flow starts. This allows other codec to have some delay before
> +        * the data flow.
> +        * (ex: to drop start up pop noise before capture starts).
> +        */

nit: there's usually a blank line between the variable declarations
and the first line of code, even if the first line of code is a
comment.


> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
> +       else
> +               ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
> +
> +       if (ret) {
> +               dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
> +               return ret;
> +       }
> +
> +       /*
> +        * Check mi2s_was_prepared before enabling BCLK as lpass_cpu_daiops_prepare can
> +        * be called multiple times. It's paired with the clk_disable in
> +        * lpass_cpu_daiops_shutdown.
> +        */
> +       if (!drvdata->mi2s_was_prepared[dai->driver->id]) {
> +               drvdata->mi2s_was_prepared[dai->driver->id] = true;
> +               ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +               if (ret) {
> +                       dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +                       clk_disable(drvdata->mi2s_osr_clk[id]);

Can you explain why this clk_disable() is here? Your function didn't
turn this clock on, so why should it be turning it off in the error
case?


> +                       drvdata->mi2s_was_prepared[dai->driver->id] = false;
> +                       return ret;
> +               }

Why not put the `drvdata->mi2s_was_prepared[dai->driver->id] = true;`
_after_ you check for errors. Then you don't need to undo it in the
error case. I presume that your prepare() function isn't reentrant and
can't be called at the same time as your shutdown (right?).

Other than that, I don't have any objections to this patch anymore. I
probably won't add a formal "Reviewed-by", though, since I _really_
don't know anything about the issue at hand or the code. I just
stumbled upon this because I was getting the clock splat at bootup. If
someone feels like this needs me to spin up enough to understand /
really review this patch then please yell.

-Doug

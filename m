Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E0938DD9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 00:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbhEWWzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 May 2021 18:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbhEWWzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 May 2021 18:55:43 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F26DC06138A
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 May 2021 15:54:16 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so23483972otp.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 May 2021 15:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=1K/Zf6qVFEuzf3LeeUWAQu7y8CgaCqs3dPr1inenPpI=;
        b=bYyk8FSfT1TV7UPs81TdtN0954QCJeCRzD7K0EVI+uGfyiPaYKGqlEg9VcNPFobDZT
         K7yUNwmnlXYrwbHLyx7KXSi0kufc2cCzDekTyd3wgQMi6NT4/zuHNPGL/5EumWXT2Lnr
         qtVK+3VcB4PdJWIvq5vjekqXuQzzkAXFQaoxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=1K/Zf6qVFEuzf3LeeUWAQu7y8CgaCqs3dPr1inenPpI=;
        b=pt4TnNl1sV8aHCoyLdZ8IYt1r+Vl+8v9sqxwLr5cX80evsm1EQt+rPxCyeS3OAOE19
         0dntnX9WLKSMjWPSXPiH5p7s/4mRjflHw/qaIML96pYFHAJN/XurhQy+nKdS+uzbLAog
         Gej9Tbbs8ti80s6DlbKCERfOIiI1OwXtyvN148rBJYfewTESl5ctBz8WCTtDRRv0yO5L
         urUgYXHhp1O6QKETTg6hu78qwr1pIoh/jhib7zQVwqkpo8jRgYIwNDDqICvbBtQnL3LA
         LXlmQgemZylREgeIIq5qTWx90uUlllqG87Ux9a5SFjq5b+pt68azKcLP/TOOHXWuqZjS
         5C/Q==
X-Gm-Message-State: AOAM530vB2xQ8gen7Tz5NLqoaA/SFB8a3ngnMDt8kyihWhPVtuEETvM7
        7njFzxzxg+C/7lWgKCxdVLKoRacH/y+c3BGOjYJjJQ==
X-Google-Smtp-Source: ABdhPJwoYoaR/C8nMh9n9rgeiaHd67jqnTMUKs8Z677FXDRZSbmeYGkUrXidIn9y95tLonGCJVOJSVXEF+TuV6VuoiA=
X-Received: by 2002:a05:6830:1f51:: with SMTP id u17mr3389243oth.25.1621810455819;
 Sun, 23 May 2021 15:54:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 23 May 2021 15:54:15 -0700
MIME-Version: 1.0
In-Reply-To: <20210520142432.29869-1-srivasam@codeaurora.org>
References: <20210520142432.29869-1-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sun, 23 May 2021 15:54:15 -0700
Message-ID: <CAE-0n50A18vru2bXQuQTq==J5bGQEzw4uUYv9qG7rNB5uk19jw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: Fix pop noise during audio
 capture begin
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-05-20 07:24:32)
> This patch fixes PoP noise of around 15ms observed during audio capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for introducing some delay
> before capture start and clock enable.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

The SoB chain is weird. If Judy is first then Judy should show up with a

From: Judy Hsiao <judyhsiao@chromium.org>

initially. Otherwise, it's a Co-developed-by: tag that should be after
the SoB line.

> ---
> Changes Since V1:
>         -- Enableed BCLK and LRCLK in dai ops prepare API instead of startup API
>         -- Added comments
>
>  sound/soc/qcom/lpass-cpu.c | 48 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index c62d2612e8f5..c5bb3f16d25f 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -93,9 +93,18 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
>                 struct snd_soc_dai *dai)
>  {
>         struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +       unsigned int id = dai->driver->id;
>
>         clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
> -       clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
> +       /* To ensure BCLK/LRCLK disabled even in device node validation.
> +         Will not impact if disabled in trigger suspend */

/*
 * Can you use proper kernel doc multi-line notation please?
 */

And also, can we point to the function that is not impacted by "trigger
suspend"? Is that lpass_cpu_daiops_trigger()?

> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
> +       else
> +               regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
> +
> +       clk_disable_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
>  }
>
>  static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
> @@ -275,6 +284,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>         case SNDRV_PCM_TRIGGER_START:
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               /* To ensure lpass BCLK/LRCLK is enabled during
> +                       device resume. Will not impact if enabled in prepare */
>                 if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>                         ret = regmap_fields_write(i2sctl->spken, id,
>                                                  LPAIF_I2SCTL_SPKEN_ENABLE);
> @@ -296,6 +307,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>         case SNDRV_PCM_TRIGGER_STOP:
>         case SNDRV_PCM_TRIGGER_SUSPEND:
>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +               /* To ensure lpass BCLK/LRCLK is disabled during
> +                       device suspend */
>                 if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>                         ret = regmap_fields_write(i2sctl->spken, id,
>                                                  LPAIF_I2SCTL_SPKEN_DISABLE);
> @@ -308,19 +321,50 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>                                 ret);
>
>                 clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
> -
> +               break;
> +       default:

It confuses me that we're adding 'default' now. Why? Is some define not
handled already? Why not use that define instead of 'default' so it is
explicit what is being handled? How is it even related to this patch?

>                 break;
>         }
>
>         return ret;
>  }
>
> +static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
> +               struct snd_soc_dai *dai)
> +{
> +       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +       unsigned int id = dai->driver->id;
> +       int ret = -EINVAL;

ret will be assigned in the else though? Why assign it and then reassign
it?

> +       /* To ensure lpass BCLK/LRCLK is enabled bit before
> +          playback/capture data flow starts */
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
> +       else
> +               ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
> +
> +       if (ret)
> +               dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
> +              ret);

Why do we keep trying here instead of returning an error?

> +
> +       ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +
> +       if (ret) {
> +               dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +               clk_disable(drvdata->mi2s_osr_clk[id]);
> +               return ret;
> +       }
> +       return 0;

Could be

	return ret;


> +}
> +
> +

Nitpick: Why two newlines?

>  const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
>         .set_sysclk     = lpass_cpu_daiops_set_sysclk,
>         .startup        = lpass_cpu_daiops_startup,
>         .shutdown       = lpass_cpu_daiops_shutdown,
>         .hw_params      = lpass_cpu_daiops_hw_params,
>         .trigger        = lpass_cpu_daiops_trigger,
> +       .prepare        = lpass_cpu_daiops_prepare,
>  };

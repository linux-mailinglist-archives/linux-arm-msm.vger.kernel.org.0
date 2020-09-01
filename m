Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368B1258952
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 09:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgIAHgi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 03:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgIAHgg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 03:36:36 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E067C061246
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 00:36:36 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 31so225533pgy.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 00:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=kB+SZnK0sJkXPueegsNdekLuZ/MjR9UpX90Irxxyzvk=;
        b=VnhVnWJCP27/mVmO155ONgdwRlS85VvnyJzWOT7jautIZGGqr3zliTS6J4SRsFI+3J
         sd+uwQ245EwDzVeb0Roq/gsPN09BWfu7bIcGYX+BrByvVqXdEJWtwtySa9erBzpCTdZ0
         4tIvtJ+5bT84mJLGYgPCLNPN5qHhTgNOwLOnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=kB+SZnK0sJkXPueegsNdekLuZ/MjR9UpX90Irxxyzvk=;
        b=K0hEBFW+61G5JV//OEawrNtPUX9Zfsb8a4FwqBCPwLD7HoRL1KlLXDm4VO1L8OUPmd
         0zgHVfNlMd39Y0UWywVSMbhinyCZ36k05jcxhmbh0iU20tz67X8jtsxkrHCdHLI1AVP4
         w2J5Jgcaaw8+zS84xtCG4iK4PZlpEjPnKuOKH6H3cO6aVCp/ZPr0eNKRCmO0pnTXkEB9
         +uImpwMY3enyjbhBwe8iNqrK1tVp9Knh3NbrczSHblxmYKrBQAKHJzH5olfV9tMfCljH
         y0wHHXo6g1Cyyfq9EU9AsqH0IpRCg1scVBXJhwDv3eeqwAaoE/pEmot3pZH8V0QowXF7
         AcEw==
X-Gm-Message-State: AOAM530QtPMoQYxwrxj1fyiQE9TET4SlBa37F+Xt6EeOnFx6ZXO35w1n
        M81OXeAZqVKYEdxuk36b92JXGg==
X-Google-Smtp-Source: ABdhPJzi+NLQOZhIdhFlcTmDLitfZg6ADPeHNPuMjIk1v4PT7eu3PAfHn2YnOHJeIOK0+6SWgm123g==
X-Received: by 2002:a63:cd57:: with SMTP id a23mr438823pgj.10.1598945796121;
        Tue, 01 Sep 2020 00:36:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id e124sm692938pfa.87.2020.09.01.00.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 00:36:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org> <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Date:   Tue, 01 Sep 2020 00:36:34 -0700
Message-ID: <159894579447.334488.1604209140945740724@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2020-08-30 23:39:22)
> diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
> new file mode 100644
> index 0000000..7e18113
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-hdmi.c
> @@ -0,0 +1,684 @@
> +// SPDX-License-Identifier: GPL-2.0-only
[...]
> +
> +static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substre=
am,
> +               struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
[...]
> +       data_format =3D LPASS_DATA_FORMAT_LINEAR;
> +       ch_sts_buf0 =3D (((data_format << LPASS_DATA_FORMAT_SHIFT) & LPAS=
S_DATA_FORMAT_MASK)
> +                               | ((sampling_freq << LPASS_FREQ_BIT_SHIFT=
) & LPASS_FREQ_BIT_MASK));
> +       ch_sts_buf1 =3D (word_length) & LPASS_WORDLENGTH_MASK;
> +
> +       ret =3D regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_=
CTL_RESET);
> +       if (ret) {
> +               dev_err(dai->dev, "%s error writing to softreset enable :=
 %d\n",

All of these strings bloat the kernel image. Can we just return ret
instead and if something goes wrong we can use a debug patch to figure
out which register write failed? Would a register write even fail to
begin with?

> +                                       __func__, ret);
> +               return ret;
> +       }
> +
> +       ret =3D regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_=
CTL_CLEAR);
> +       if (ret) {
> +               dev_err(dai->dev, "%s error writing to softreset disable =
: %d\n",
> +                                       __func__, ret);
> +               return ret;
> +       }
> +
> +       ret =3D regmap_field_write(drvdata->legacy->legacy_en,
> +                               LPASS_HDMITX_LEGACY_DISABLE);
> +       if (ret) {
> +               dev_err(dai->dev, "%s error writing to legacy_en field : =
%d\n",
> +                                       __func__, ret);
> +               return ret;
> +       }
> +
[...]
>  #define LPAIF_DMACTL_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, CTL)
>  #define LPAIF_DMABASE_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, BA=
SE)
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platf=
orm.c
> index df692ed..607f4c4 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -553,7 +702,21 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq,=
 void *data)
> =20
>         /* Handle per channel interrupts */
>         for (chan =3D 0; chan < LPASS_MAX_DMA_CHANNELS; chan++) {
> -               if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->substream[chan=
]) {
> +               switch (v->id) {
> +               case HDMI_INTERFACE:
> +                       val =3D LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan) |
> +                               LPAIF_IRQ_HDMI_METADONE |
> +                               LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan);
> +                       break;
> +               case I2S_INTERFACE:
> +                       val =3D 0;
> +                       break;
> +               default:
> +                       pr_err("%s: invalid  %d interface\n", __func__, v=
->id);

Any reason we can't use dev_err() here?

> +                       return -EINVAL;
> +               }
> +               if (irqs & (LPAIF_IRQ_ALL(chan) | val)
> +                       && drvdata->substream[chan]) {
>                         rv =3D lpass_dma_interrupt_handler(
>                                                 drvdata->substream[chan],
>                                                 drvdata, chan, irqs);
> @@ -644,15 +807,15 @@ int asoc_qcom_lpass_platform_register(struct platfo=
rm_device *pdev)
> =20
>         /* ensure audio hardware is disabled */
>         ret =3D regmap_write(drvdata->lpaif_map,
> -                       LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0);
> +                       IRQ_EN(v, LPAIF_IRQ_PORT_HOST), 0);
>         if (ret) {
>                 dev_err(&pdev->dev, "error writing to irqen reg: %d\n", r=
et);
>                 return ret;
>         }
> =20
>         ret =3D devm_request_irq(&pdev->dev, drvdata->lpaif_irq,
> -                       lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,
> -                       "lpass-irq-lpaif", drvdata);
> +               lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,

Can we use the irq flags from the firmware, i.e. whatever the DT or ACPI
tables say?

> +               pdev->name, drvdata);
>         if (ret) {
>                 dev_err(&pdev->dev, "irq request failed: %d\n", ret);
>                 return ret;

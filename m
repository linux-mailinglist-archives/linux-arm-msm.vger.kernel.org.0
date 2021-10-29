Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F684402E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 21:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhJ2TMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 15:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhJ2TMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 15:12:30 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4506EC061714
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:10:01 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id s23-20020a056830125700b00553e2ca2dccso10036083otp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=Kz/yTkFuE3j75lMFedbJ8K12mUe3O4G4qhqkBQktKHc=;
        b=UFJEf++Ob04pUNadKX3RxaS932qSamdLIXwAuxhbNpn3BB2KnBBLjpwjcNL0qImZbh
         DAa0IZiW6HAXTdHmNEnbdeXroN1d1n8Uv5T4cwKaUy5ICGxhrwETNK4uA72csTFinpF6
         vU4rQBEv9WpybF3axkmMVjFp87kM1PxrAR7WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=Kz/yTkFuE3j75lMFedbJ8K12mUe3O4G4qhqkBQktKHc=;
        b=5VQMtkYgVConftpWHKDJhNIycdikhY0GyK5sS05MAnUgWM2zH2amak5hDbshk1jddq
         1nObz6HdcVsI5FRHSHxkD9t1p//69dRDWUywnk/hVCpXucmTQCqK6yizm9CmCS4U3+ra
         Js9c5PxE1y/5nKkxWVIKKjrtPW/fnBcaT7FemyCWa0dsgwcP8lBw4QJmACYePF9ZHXUF
         vl69XDdRK8lPav6VNEpiFicmtfd+ijAov/ESJy+IX6vdfq8W872fT5hiamXrqzYOOoxj
         lBJ4b6+TzvidVpNnK7hxCKr8rtHh7f8cgQbp2fIZVjuMBdgyjtd7Syc7yIjNTbb9MI+u
         62Yw==
X-Gm-Message-State: AOAM530CVUEsvaU9s3aMMalLBMY7GiZ3qOlBsEBJ7jcxOcGleyCRzA4J
        qb/KGdlzGf/GkCXxBxS3W0OH9ol9dzRftLxzPwYqVg==
X-Google-Smtp-Source: ABdhPJwYWvHGaVfjF0bPaSopI+BHlYZPo+Y+4QZQuyIdj56QD9257KA3KDSh1QGEn0MlGq/ly7Nl6RbgJNxSlMAS3Z4=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr9926661otl.126.1635534600504;
 Fri, 29 Oct 2021 12:10:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:10:00 -0500
MIME-Version: 1.0
In-Reply-To: <1635519876-7112-3-git-send-email-srivasam@codeaurora.org>
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org> <1635519876-7112-3-git-send-email-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 14:10:00 -0500
Message-ID: <CAE-0n51zXLZiaB9aCdv=p_Wcxr5ZEdN-=b1hd5VATL6-CD0vRw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ASoC: qcom: SC7280: Add machine driver
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

Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:36)
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index cc7c1de..d9ffcb7 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -152,4 +152,16 @@ config SND_SOC_SC7180
>           SC7180 SoC-based systems.
>           Say Y if you want to use audio device on this SoCs.
>
> +config SND_SOC_SC7280
> +       tristate "SoC Machine driver for SC7280 boards"
> +       depends on I2C && SOUNDWIRE

Add || COMPILE_TEST so we can compile test this driver?

> +       select SND_SOC_QCOM_COMMON
> +       select SND_SOC_MAX98357A
> +       select SND_SOC_LPASS_RX_MACRO
> +       select SND_SOC_LPASS_TX_MACRO
> +       help
> +         To add support for audio on Qualcomm Technologies Inc.

Drop "To"?

> +         SC7280 SoC-based systems.
> +         Say Y if you want to use audio device on this SoCs.
> +
>  endif #SND_SOC_QCOM
> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
> new file mode 100644
> index 0000000..1d73b4f
> --- /dev/null
> +++ b/sound/soc/qcom/sc7280.c
> @@ -0,0 +1,343 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> +//
> +// sc7280.c -- ALSA SoC Machine driver for sc7280

Please remove filename from the comment as it's not useful and may
change.

> +
> +#include <linux/gpio.h>
[...]
> +
> +static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +       switch (cpu_dai->id) {
> +       case LPASS_CDC_DMA_RX0:
> +       case LPASS_CDC_DMA_TX3:
> +       case LPASS_CDC_DMA_VA_TX0:
> +               break;
> +       case MI2S_SECONDARY:
> +               break;
> +       case LPASS_DP_RX:
> +               break;
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id %d\n", __func__, cpu_dai->id);
> +               break;
> +       }

The function doesn't do anything though. Why do we care?

> +}
> +
> +static const struct snd_soc_ops sc7280_ops = {
> +       .startup = sc7280_snd_startup,
> +       .shutdown = sc7280_snd_shutdown,
> +       .hw_params = sc7280_snd_hw_params,
> +       .hw_free = sc7280_snd_hw_free,
> +       .prepare = sc7280_snd_prepare,
> +};
> +
> +static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
> +       SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +       SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +};
> +
> +static int sc7280_snd_platform_probe(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card;
> +       struct sc7280_snd_data *data;
> +       struct device *dev = &pdev->dev;
> +       struct snd_soc_dai_link *link;
> +       int ret, i;
> +
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       card = &data->card;
> +       snd_soc_card_set_drvdata(card, data);
> +
> +       card->owner = THIS_MODULE;
> +       card->driver_name = "SC7280";
> +       card->dev = dev;
> +
> +       ret = qcom_snd_parse_of(card);
> +       if (ret)
> +               return ret;
> +
> +       for_each_card_prelinks(card, i, link) {
> +               link->init = sc7280_init;
> +               link->ops = &sc7280_ops;
> +       }
> +
> +       return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static const struct of_device_id sc7280_snd_device_id[]  = {
> +       {.compatible = "google,sc7280-herobrine"},

Please add space after { and before }

> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, sc7280_snd_device_id);

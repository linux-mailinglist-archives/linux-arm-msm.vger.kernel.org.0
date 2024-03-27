Return-Path: <linux-arm-msm+bounces-15388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7796F88E674
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 15:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA30D1F30D48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 14:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5763D128369;
	Wed, 27 Mar 2024 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8BiU5MV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B5E15689B
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711545005; cv=none; b=Nw0A/MFhTowCsfNQkCzdqInpwzGakuTpGjVSnzP6p+j1uDG9muLF1kDWHAmO/PLhbbIujNTqqJtcsj5SjXnxzCE0B6U2PVswFTahgqWqWM77toerVqq5xQRQKK8uIibqAdgV621LLI3IWJE9ZpAuOL1elRTqHrtVxeW6l1+U2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711545005; c=relaxed/simple;
	bh=EIfAaG+8ChusQ7KuCbmqxqXGfMQafmgd9vGhe7mjxFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/H+S7FXnV3Euhi5N2pnFMXQ2Wi+oYTVSl71g3zSwQCyIsvP2wOQpJNZT/uY+G258yWpC3e3LwqBoFULIbTlsxeT73l6KTK+GCopXnq+/ZWdC34xsqc5i2iQsoMn+5X+0kMBmJ6XcpzDeEfP2OIhlxM3c3F7E1TBZtnIO3G69tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t8BiU5MV; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6114c9b4d83so31965247b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711545002; x=1712149802; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lzCuQ38z5tEvKes8luQhWNfmBRoi0Op2h6rKQaV0U3o=;
        b=t8BiU5MVQYeF/ET1h+1fgbuiRa1CN64fWsGnCfnRFskMyeZcQHF06TroG+fQIMe/4q
         DvH2yJoj/Erarf0oiJMcz5SAn3dy9r/9yg+aU/1IR2ZrkmRFR43uk+2m1Y90EBKDPJE0
         1M4T+l7nowAHuN7FaXqLjDnM+OMSe90ojtKiOOzBhPE4LDByzGneVrWVKfUyBQtGh8kq
         FBZqunfIa0GUDbo9KGaZgw3x6hwJk72Mh+qz0d0XJHKCB1ZRbAj0zw5WnnGS6g0fsFA4
         H+zMud+BfwAZQIVBc/TQOzh7caad9PUik7eeUZV3i4JPvffWb3SOayIuR8MlUQrtjiAi
         d5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711545002; x=1712149802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzCuQ38z5tEvKes8luQhWNfmBRoi0Op2h6rKQaV0U3o=;
        b=qY2G5oIE1jxLDWTiYIiacX2TAOwcPlEXAvMKMiA6l6C11IaGwVDU3vnWoNa6QPA7Qb
         jBYulIRgkaGn0W+EahYWp607GysSHY/bt3BWLLS3T3UvsSgsYSaZpuXVfG7JAfnTaDkO
         +9SZmHG15rTxBifd4kVxoEuJMAgK7F/nY7lfB/+FYA3FiF4kXC5Tyuk2VD3DZ2lb+U73
         NtnW05H0Kj38OG77rM83UFpoJlehRuAqpPSnQx2a1b1RrydGwzjoNHlBN9+3FnqLgNDP
         H8XcLNiyZCLqaIR99CfqT540PgcbDBD+Ob9J7O3v0GdT7wPfHRpT/uAWpASnZQ0wh0bZ
         vQGA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ24JJi8/At2eeSy/WNuMttdjlmeBYx3uyWPEfurZGZbcHq4y68PPMWsgR2JJANnlF90fjwH1yBRI9yywbdw/dOLhCd6XZOnY9AbgluQ==
X-Gm-Message-State: AOJu0Yz7jo5bkPTM/8vNa8m/renagM5mczr+C2S3YcdvDJfL04DtR15Y
	GmonyLX0IZGSsAsdhpqxsTnicvVE00VwA/+Nhs8hcJM4AVUVyYPNph13QkG4g3QsphjfSkFod4P
	TPaW7+FCbHnGl9/wwxxPWFimUxe9rpzM2f+Tyvw==
X-Google-Smtp-Source: AGHT+IFEFjTBVS4HBczGqVH75JCqDQR+t3W+i9jRyLyq5dNnFwQJkaqlnv27HDRa7w6hVneeKjVD/LRnNW7r5pdZrf0=
X-Received: by 2002:a25:ac10:0:b0:dcb:e82c:f7d with SMTP id
 w16-20020a25ac10000000b00dcbe82c0f7dmr3861776ybi.41.1711545002212; Wed, 27
 Mar 2024 06:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327113228.1706975-1-quic_mohs@quicinc.com> <20240327113228.1706975-3-quic_mohs@quicinc.com>
In-Reply-To: <20240327113228.1706975-3-quic_mohs@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 15:09:51 +0200
Message-ID: <CAA8EJpqh0emOFUPSj8rPaKr2hZRWwOh9NNTco8fyJCtwXe9sSA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: qcom: qcm6490: Add machine driver for qcm6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, broonie@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, lgirdwood@gmail.com, tiwai@suse.com, 
	quic_rohkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 13:34, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> Add machine driver for qcm6490 SoC.
>
> This initial supports which includes WSA883x Speakers with onboard DMIC
> connected to internal LPASS codec via VA macros respectively and also
> WCD937x based headset.
>
> Add compatible for sound card on Qualcomm qcs6490 boards.

Granted that qcm6490 is similar to sc7280, is there any reason why you
can not use one of the existing sound card drivers? Like sc7280.c or
sc8280xp.c?

>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  sound/soc/qcom/Kconfig   |  13 +++
>  sound/soc/qcom/Makefile  |   2 +
>  sound/soc/qcom/qcm6490.c | 173 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 188 insertions(+)
>  create mode 100644 sound/soc/qcom/qcm6490.c
>
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 762491d6f2f2..0bc536766872 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -151,6 +151,19 @@ config SND_SOC_MSM8996
>           APQ8096 SoC-based systems.
>           Say Y if you want to use audio device on this SoCs
>
> +config SND_SOC_QCM6490
> +       tristate "SoC Machine driver for QCM6490 boards"
> +       depends on QCOM_APR && SOUNDWIRE
> +       depends on COMMON_CLK
> +       select SND_SOC_QDSP6
> +       select SND_SOC_QCOM_COMMON
> +       select SND_SOC_QCOM_SDW
> +       help
> +         Add support for audio on Qualcomm Technologies Inc.
> +         QCM6490 SoC-based systems.
> +         To compile this driver say Y or M if you want to
> +         use audio device on this SoCs.
> +
>  config SND_SOC_SDM845
>         tristate "SoC Machine driver for SDM845 boards"
>         depends on QCOM_APR && I2C && SOUNDWIRE
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 34f3fcb8ee9a..feb2c164be69 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_SND_SOC_LPASS_SC7280) += snd-soc-lpass-sc7280.o
>  snd-soc-storm-objs := storm.o
>  snd-soc-apq8016-sbc-objs := apq8016_sbc.o
>  snd-soc-apq8096-objs := apq8096.o
> +snd-soc-qcm6490-objs := qcm6490.o
>  snd-soc-sc7180-objs := sc7180.o
>  snd-soc-sc7280-objs := sc7280.o
>  snd-soc-sdm845-objs := sdm845.o
> @@ -34,6 +35,7 @@ snd-soc-x1e80100-objs := x1e80100.o
>  obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
>  obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
>  obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
> +obj-$(CONFIG_SND_SOC_QCM6490) += snd-soc-qcm6490.o
>  obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
>  obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
>  obj-$(CONFIG_SND_SOC_SC8280XP) += snd-soc-sc8280xp.o
> diff --git a/sound/soc/qcom/qcm6490.c b/sound/soc/qcom/qcm6490.c
> new file mode 100644
> index 000000000000..5b0dc95963f5
> --- /dev/null
> +++ b/sound/soc/qcom/qcm6490.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> +
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>
> +#include <sound/core.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/pcm.h>
> +#include <linux/soundwire/sdw.h>
> +#include <sound/jack.h>
> +#include <sound/pcm_params.h>
> +#include "lpass.h"
> +#include "qdsp6/q6afe.h"
> +#include "common.h"
> +#include "sdw.h"
> +
> +struct qcm6490_snd_data {
> +       bool stream_prepared[AFE_PORT_MAX];
> +       struct snd_soc_card *card;
> +       struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
> +       struct snd_soc_jack jack;
> +       bool jack_setup;
> +};
> +
> +static int qcm6490_snd_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct qcm6490_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +       switch (cpu_dai->id) {
> +       case TX_CODEC_DMA_TX_3:
> +       case LPASS_CDC_DMA_TX3:
> +       case RX_CODEC_DMA_RX_0:
> +               return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> +       case VA_CODEC_DMA_TX_0:
> +       case WSA_CODEC_DMA_RX_0:
> +               return 0;
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int qcm6490_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> +                                     struct snd_pcm_hw_params *params)
> +{
> +       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +       struct snd_interval *rate = hw_param_interval(params,
> +                                       SNDRV_PCM_HW_PARAM_RATE);
> +       struct snd_interval *channels = hw_param_interval(params,
> +                                       SNDRV_PCM_HW_PARAM_CHANNELS);
> +
> +       rate->min = 48000;
> +       rate->max = 48000;
> +       channels->min = 2;
> +       channels->max = 2;
> +       switch (cpu_dai->id) {
> +       case TX_CODEC_DMA_TX_0:
> +       case TX_CODEC_DMA_TX_1:
> +       case TX_CODEC_DMA_TX_2:
> +       case TX_CODEC_DMA_TX_3:
> +               channels->min = 1;
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int qcm6490_snd_hw_params(struct snd_pcm_substream *substream,
> +                                struct snd_pcm_hw_params *params)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +       struct qcm6490_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
> +
> +       return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
> +}
> +
> +static int qcm6490_snd_prepare(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +       struct qcm6490_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +       struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
> +
> +       return qcom_snd_sdw_prepare(substream, sruntime,
> +                                   &data->stream_prepared[cpu_dai->id]);
> +}
> +
> +static int qcm6490_snd_hw_free(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct qcm6490_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +       struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
> +
> +       return qcom_snd_sdw_hw_free(substream, sruntime,
> +                                   &data->stream_prepared[cpu_dai->id]);
> +}
> +
> +static const struct snd_soc_ops qcm6490_be_ops = {
> +       .hw_params = qcm6490_snd_hw_params,
> +       .hw_free = qcm6490_snd_hw_free,
> +       .prepare = qcm6490_snd_prepare,
> +};
> +
> +static void qcm6490_add_be_ops(struct snd_soc_card *card)
> +{
> +       struct snd_soc_dai_link *link;
> +       int i;
> +
> +       for_each_card_prelinks(card, i, link) {
> +               if (link->no_pcm == 1) {
> +                       link->init = qcm6490_snd_init;
> +                       link->be_hw_params_fixup = qcm6490_be_hw_params_fixup;
> +                       link->ops = &qcm6490_be_ops;
> +               }
> +       }
> +}
> +
> +static int qcm6490_platform_probe(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card;
> +       struct qcm6490_snd_data *data;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
> +       if (!card)
> +               return -ENOMEM;
> +       card->owner = THIS_MODULE;
> +       /* Allocate the private data */
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       card->dev = dev;
> +       dev_set_drvdata(dev, card);
> +       snd_soc_card_set_drvdata(card, data);
> +       ret = qcom_snd_parse_of(card);
> +       if (ret)
> +               return ret;
> +
> +       card->driver_name = of_device_get_match_data(dev);
> +       qcm6490_add_be_ops(card);
> +       return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static const struct of_device_id snd_qcm6490_dt_match[] = {
> +       {.compatible = "qcom,qcm6490-sndcard", "qcm6490"},
> +       {.compatible = "qcom,qcs6490-sndcard", "qcs6490"},
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(of, snd_qcm6490_dt_match);
> +
> +static struct platform_driver snd_qcm6490_driver = {
> +       .probe  = qcm6490_platform_probe,
> +       .driver = {
> +               .name = "snd-qcm6490",
> +               .of_match_table = snd_qcm6490_dt_match,
> +       },
> +};
> +module_platform_driver(snd_qcm6490_driver);
> +MODULE_DESCRIPTION("qcm6490 ASoC Machine Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry


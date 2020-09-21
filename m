Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E852734C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 23:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgIUVUb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 17:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727237AbgIUVUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 17:20:31 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77274C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 14:20:30 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l15so804700wmh.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 14:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4xniVabn4CQG2JkC+A0hoBmBVaDkXJtQomYM+naYInE=;
        b=GtXG/n/mdklQBUzTSXdqddSt/Xh3fyWErZmGH1f60et3/UvhF1zvfWpr8hTqFLhIWw
         KVq29hpeWUdGzKnug8V01bAPmYck4BDfNVMtDbW/FS9He45ze+ztmPeTcvSJlro4M73y
         PmCEUpblhHgJ6BKiTA1IDT9Dq8TnPblbvdg1D3yMAuRPsMV0SE52MNQcOqK8WMeQ54sf
         /G1+RTH/ihdzz7yVc1wG7TgCgAvNoEb//swffaJUHlSN+wduR90BW0alYDwKYYnnA/Rt
         hVa78ZAMZyV46qlJ5NtAnT89Nx0iTHbDthw0dhiKbDEDbUyC4TM+qv4gTE1hDGjOB3jh
         bJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4xniVabn4CQG2JkC+A0hoBmBVaDkXJtQomYM+naYInE=;
        b=M3C0V/5Y7EeSxfUJPreIi0vTfUxxxjFS+2WEwzU//fkdaTpLKfn2XELIk0wS9FicGI
         gdcOD8E2mI2y2mytz59WD6zrvNU2jcHVCzAVKyx4rfNKHNsjUIbsVib5c4J3UcaQ79PR
         UaXHLAd59i9RWlzb6ng9D4SXUNF84xfsOB9dDbQdlZhp5/BuSz7pLZOnztnTAOyM/RWj
         1idLxzM2ye0ya4m7w9Jl4xV6O5Z/zfKb7xyVgQgdCQyTdrcoMcOuXhJ1jIXIDtEACXCL
         +mR8KXwPzqbHf4cm36o0AjW4Bq52oPnqAWnIa4GAyNhVuqgHAc3188dd19LexA/75LVW
         kkIA==
X-Gm-Message-State: AOAM530sDil8ujjrwkCymKPjZvDUlhtiQSItcbntaetFYEcID1+KIrCG
        HunrSDR+2lY2xyJI/69owo6Cpw==
X-Google-Smtp-Source: ABdhPJx+h0itL0KkrY4HQR5I8KpgKn5HXWpt2fCcWJHBfeUk04sdWQRHqVE0E+Xyoz9vGX+L8oM1Hg==
X-Received: by 2002:a1c:7302:: with SMTP id d2mr1220767wmb.133.1600723228801;
        Mon, 21 Sep 2020 14:20:28 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id f23sm2084515wmc.3.2020.09.21.14.20.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 14:20:28 -0700 (PDT)
Subject: Re: [PATCH v6 4/5] ASoC: qcom: Add support for lpass hdmi driver
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-5-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8de36a0c-99d2-29e6-f5f9-3a62dce5aab6@linaro.org>
Date:   Mon, 21 Sep 2020 22:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1600409084-29093-5-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/09/2020 07:04, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Upadate lpass cpu and platform driver to support audio over dp.
> Also add lpass-hdmi.c and lpass-hdmi.h.
> 
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> ---
>   sound/soc/qcom/Kconfig           |   5 +
>   sound/soc/qcom/Makefile          |   2 +
>   sound/soc/qcom/lpass-apq8016.c   |   4 +-
>   sound/soc/qcom/lpass-cpu.c       |  37 ++-
>   sound/soc/qcom/lpass-hdmi.c      | 596 +++++++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/lpass-hdmi.h      | 129 +++++++++
>   sound/soc/qcom/lpass-ipq806x.c   |   4 +-
>   sound/soc/qcom/lpass-lpaif-reg.h |  52 +++-
>   sound/soc/qcom/lpass-platform.c  | 466 ++++++++++++++++++++++++------
>   sound/soc/qcom/lpass.h           | 119 +++++++-
>   10 files changed, 1294 insertions(+), 120 deletions(-)
>   create mode 100644 sound/soc/qcom/lpass-hdmi.c
>   create mode 100644 sound/soc/qcom/lpass-hdmi.h
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index a607ace..509584c 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -12,6 +12,10 @@ config SND_SOC_LPASS_CPU
>   	tristate
>   	select REGMAP_MMIO
>   
> +config SND_SOC_LPASS_HDMI
> +	tristate
> +	select REGMAP_MMIO
> +
>   config SND_SOC_LPASS_PLATFORM
>   	tristate
>   	select REGMAP_MMIO
> @@ -30,6 +34,7 @@ config SND_SOC_LPASS_SC7180
>   	tristate
>   	select SND_SOC_LPASS_CPU
>   	select SND_SOC_LPASS_PLATFORM
> +	select SND_SOC_LPASS_HDMI
>   
>   config SND_SOC_STORM
>   	tristate "ASoC I2S support for Storm boards"
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 7972c94..0bd90d7 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -1,12 +1,14 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Platform
>   snd-soc-lpass-cpu-objs := lpass-cpu.o
> +snd-soc-lpass-hdmi-objs := lpass-hdmi.o
>   snd-soc-lpass-platform-objs := lpass-platform.o
>   snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
>   snd-soc-lpass-apq8016-objs := lpass-apq8016.o
>   snd-soc-lpass-sc7180-objs := lpass-sc7180.o
>   
>   obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
> +obj-$(CONFIG_SND_SOC_LPASS_HDMI) += snd-soc-lpass-hdmi.o
>   obj-$(CONFIG_SND_SOC_LPASS_PLATFORM) += snd-soc-lpass-platform.o
>   obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
>   obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 5c8ae22..0aedb3a 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -125,7 +125,7 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
>   };
>   
>   static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
> -					   int direction)
> +					   int direction, unsigned int dai_id)
>   {
>   	struct lpass_variant *v = drvdata->variant;
>   	int chan = 0;
> @@ -151,7 +151,7 @@ static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
>   	return chan;
>   }
>   
> -static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
> +static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, unsigned int dai_id)
>   {
>   	clear_bit(chan, &drvdata->dma_ch_bit_map);
>   
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 5d84f63..41a2470 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -589,13 +589,33 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   						variant->wrdma_channel_start);
>   
>   	drvdata->lpaif_map = devm_regmap_init_mmio(dev, drvdata->lpaif,
> -			&lpass_cpu_regmap_config);
> +								&lpass_cpu_regmap_config);

change not related to this patch!

Have you run checkpatch on this patch

>   	if (IS_ERR(drvdata->lpaif_map)) {
>   		dev_err(dev, "error initializing regmap: %ld\n",
>   			PTR_ERR(drvdata->lpaif_map));
>   		return PTR_ERR(drvdata->lpaif_map);
>   	}
> +#ifdef CONFIG_SND_SOC_LPASS_SC7180
No, this is not the right way to do it!
We can not have any ifdef with in the code, we should be able to cope up 
with finding if hdmiif resources are available or not!

You should proably look at variant data to see which resources are 
required or not! That should work and also get rid of this #ifdef



> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-hdmiif");
>   
> +	drvdata->hdmiif = devm_ioremap_resource(dev, res);
> +	if (IS_ERR((void const __force *)drvdata->hdmiif)) {
> +		dev_err(dev, "error mapping reg resource: %ld\n",
> +				PTR_ERR((void const __force *)drvdata->hdmiif));
> +		return PTR_ERR((void const __force *)drvdata->hdmiif);
> +	}
> +
> +	lpass_hdmi_regmap_config.max_register = LPAIF_HDMI_RDMAPER_REG(variant,
> +				variant->hdmi_rdma_channels);
> +	drvdata->hdmiif_map = devm_regmap_init_mmio(dev, drvdata->hdmiif,
> +				&lpass_hdmi_regmap_config);
> +	if (IS_ERR(drvdata->hdmiif_map)) {
> +		dev_err(dev, "error initializing regmap: %ld\n",
> +		PTR_ERR(drvdata->hdmiif_map));
> +		return PTR_ERR(drvdata->hdmiif_map);
> +	}
> +
> +#endif
>   	if (variant->init) {
>   		ret = variant->init(pdev);
>   		if (ret) {
> @@ -606,6 +626,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	for (i = 0; i < variant->num_dai; i++) {
>   		dai_id = variant->dai_driver[i].id;
> +		if (dai_id == LPASS_DP_RX)
> +			continue;
> +
>   		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(dev,
>   					     variant->dai_osr_clk_names[i]);
>   		if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
> @@ -625,10 +648,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   				"error getting %s: %ld\n",
>   				variant->dai_bit_clk_names[i],
>   				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
> +

change not related to this patch!

>   			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>   		}
>   	}
> -

change not related to this patch!


>   	/* Allocation for i2sctl regmap fields */
>   	drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
>   					GFP_KERNEL);
> @@ -636,10 +659,18 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   	/* Initialize bitfields for dai I2SCTL register */
>   	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
>   						drvdata->lpaif_map);
> -	if (ret) {
> +	if (ret)
>   		dev_err(dev, "error init i2sctl field: %d\n", ret);
> +
> +#ifdef CONFIG_SND_SOC_LPASS_SC7180
> +	ret = lpass_hdmi_init_bitfields(dev, drvdata->hdmiif_map);
> +	if (ret) {
> +		dev_err(dev, "%s error  hdmi init failed\n", __func__);
>   		return ret;
>   	}
> +#else
> +	return -EINVAL;
> +#endif
>   
>   	ret = devm_snd_soc_register_component(dev,
>   					      &lpass_cpu_comp_driver,
> diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
> new file mode 100644
> index 0000000..7cb2ba3
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-hdmi.c
> @@ -0,0 +1,596 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
> + *
> + * lpass-hdmi.c -- ALSA SoC HDMI-CPU DAI driver for QTi LPASS HDMI
> + */
> +
> +#include <linux/clk.h>
Do you need this header?

> +#include <linux/kernel.h>
> +#include <linux/module.h>
<<<
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
 >>>
Do you need these headers?

> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <linux/regmap.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include "lpass-lpaif-reg.h"
> +#include "lpass.h"
> +#include "lpass-hdmi.h"
> +
> +int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	unsigned int i;
> +	struct lpass_hdmi_tx_ctl *tx_ctl;
> +	struct lpass_hdmitx_legacy *legacy;
> +	struct lpass_vbit_ctrl *vbit_ctl;
> +	struct lpass_hdmi_tx_parity *tx_parity;
> +	struct lpass_dp_metadata_ctl *meta_ctl;
> +	struct lpass_sstream_ctl *sstream_ctl;
> +	struct lpass_hdmi_tx_ch_msb *ch_msb;
> +	struct lpass_hdmi_tx_ch_lsb *ch_lsb;
> +	struct lpass_hdmitx_dmactl *hdmi_tx_dmactl;
> +
> +	drvdata->tx_ctl = devm_kzalloc(dev, sizeof(struct lpass_hdmi_tx_ctl),
> +					GFP_KERNEL);
> +	if (drvdata->tx_ctl == NULL)
> +		return -ENOMEM;
> +
> +	tx_ctl = drvdata->tx_ctl;
> +	tx_ctl->soft_reset = devm_regmap_field_alloc(dev, map,
> +				v->soft_reset);
> +	tx_ctl->force_reset = devm_regmap_field_alloc(dev, map,
> +				v->force_reset);
> +	if (IS_ERR(tx_ctl->soft_reset) || IS_ERR(tx_ctl->force_reset))
> +		return -EINVAL;
> +
> +	drvdata->legacy = devm_kzalloc(dev, sizeof(struct lpass_hdmitx_legacy),

consider doing something like this to save uncessary long lines here! 
which makes code unreadable.


legacy = devm_kzalloc(dev, sizeof(*legacy), GFP_KERNEL);
if (!legacy)
	return -ENOMEM

drvdata->legacy = legacy;


use sizeof(*legacy) and same comment to other parts of the code!


> +					GFP_KERNEL);
> +	if (drvdata->legacy == NULL)
> +		return -ENOMEM;
> +
> +	legacy = drvdata->legacy;
> +	legacy->legacy_en = devm_regmap_field_alloc(dev, map,
> +				v->legacy_en);
> +	if (IS_ERR(legacy->legacy_en))
> +		return -EINVAL;
> +
> +	drvdata->vbit_ctl = devm_kzalloc(dev, sizeof(struct lpass_vbit_ctrl),
> +					GFP_KERNEL);
> +	if (drvdata->vbit_ctl == NULL)
> +		return -ENOMEM;
> +
> +	vbit_ctl = drvdata->vbit_ctl;
> +	vbit_ctl->replace_vbit = devm_regmap_field_alloc(dev, map,
> +					v->replace_vbit);
> +	vbit_ctl->vbit_stream = devm_regmap_field_alloc(dev, map,
> +					v->vbit_stream);
> +	if (IS_ERR(vbit_ctl->replace_vbit) || IS_ERR(vbit_ctl->vbit_stream))
> +		return -EINVAL;
> +
> +	drvdata->tx_parity = devm_kzalloc(dev,
> +		sizeof(struct  lpass_hdmi_tx_parity), GFP_KERNEL);
> +
> +	if (drvdata->tx_parity == NULL)
> +		return -ENOMEM;
> +
> +	tx_parity = drvdata->tx_parity;
> +	tx_parity->calc_en = devm_regmap_field_alloc(dev, map, v->calc_en);
> +
> +	if (IS_ERR(tx_parity->calc_en))
> +		return -EINVAL;
> +
> +	drvdata->meta_ctl = devm_kzalloc(dev,
> +		sizeof(struct lpass_dp_metadata_ctl), GFP_KERNEL);
> +
> +	if (drvdata->meta_ctl == NULL)
> +		return -ENOMEM;
> +
> +	meta_ctl = drvdata->meta_ctl;
> +	meta_ctl->mute = devm_regmap_field_alloc(dev, map, v->mute);
> +	meta_ctl->as_sdp_cc = devm_regmap_field_alloc(dev, map,
> +						v->as_sdp_cc);
> +	meta_ctl->as_sdp_ct = devm_regmap_field_alloc(dev, map,
> +						v->as_sdp_ct);
> +	meta_ctl->aif_db4 = devm_regmap_field_alloc(dev, map,
> +						v->aif_db4);
> +	meta_ctl->frequency = devm_regmap_field_alloc(dev, map,
> +						v->frequency);
> +	meta_ctl->mst_index = devm_regmap_field_alloc(dev, map,
> +						v->mst_index);
<<<<<
> +	meta_ctl->dptx_index = devm_regmap_field_alloc(dev, map,
> +						v->dptx_index);
> +
> +	if (IS_ERR(meta_ctl->mute) || IS_ERR(meta_ctl->as_sdp_cc) ||
> +		IS_ERR(meta_ctl->as_sdp_ct) || IS_ERR(meta_ctl->aif_db4) ||
> +		IS_ERR(meta_ctl->frequency) || IS_ERR(meta_ctl->mst_index) ||
> +		IS_ERR(meta_ctl->dptx_index))
> +		return -EINVAL;
 >>>>>

These type of code is allover the place, why not just add a simple macro 
to do this.

something like

#define QCOM_REGMAP_FILED_ALLOC(d, m, f)	\
	do { \
		f = devm_regmap_field_alloc(d, m, f); 	\
		if (IS_ERR(f))				\
			return -EINVAL; 		\
	} while (0)

and call
	QCOM_REGMAP_FILED_ALLOC(dev, map, meta_ctl->dptx_index);

this will make code much cleaner IMO.

Also we can consider adding some bluk  apis to allocate regmap field
or something 
like!https://git.linaro.org/people/srinivas.kandagatla/linux.git/commit/?h=wip/regmap&id=03551a6e2941d71b99e2e4a5035a9de5f0df6d5d

and call
devm_regmap_field_bulk_alloc(dev, map, &sstream_ctl->sstream_en, 
&v->sstream_en, 9);

this should work as long as order of reg_field and regmap_field are 
maintained, which in this case is true!


> +
> +	drvdata->sstream_ctl = devm_kzalloc(dev,
> +		sizeof(struct lpass_sstream_ctl), GFP_KERNEL);
> +	if (drvdata->sstream_ctl == NULL)
> +		return -ENOMEM;
> +
> +	sstream_ctl = drvdata->sstream_ctl;
> +	sstream_ctl->sstream_en = devm_regmap_field_alloc(dev, map,
> +						v->sstream_en);
> +	sstream_ctl->dma_sel = devm_regmap_field_alloc(dev, map,
> +						v->dma_sel);
> +	sstream_ctl->auto_bbit_en = devm_regmap_field_alloc(dev, map,
> +						v->auto_bbit_en);
> +	sstream_ctl->layout = devm_regmap_field_alloc(dev, map,
> +						v->layout);
> +	sstream_ctl->layout_sp = devm_regmap_field_alloc(dev, map,
> +						v->layout_sp);
> +	sstream_ctl->dp_audio = devm_regmap_field_alloc(dev, map,
> +						v->dp_audio);
> +	sstream_ctl->set_sp_on_en = devm_regmap_field_alloc(dev, map,
> +						v->set_sp_on_en);
> +	sstream_ctl->dp_staffing_en = devm_regmap_field_alloc(dev, map,
> +						v->dp_staffing_en);
> +	sstream_ctl->dp_sp_b_hw_en = devm_regmap_field_alloc(dev, map,
> +						v->dp_sp_b_hw_en);
> +
> +	if (IS_ERR(sstream_ctl->sstream_en) || IS_ERR(sstream_ctl->dma_sel) ||
> +		IS_ERR(sstream_ctl->auto_bbit_en) ||
> +		IS_ERR(sstream_ctl->layout) || IS_ERR(sstream_ctl->layout_sp) ||
> +		IS_ERR(sstream_ctl->dp_audio) ||
> +		IS_ERR(sstream_ctl->set_sp_on_en) ||
> +		IS_ERR(sstream_ctl->dp_staffing_en) ||
> +		IS_ERR(sstream_ctl->dp_sp_b_hw_en))
> +		return -EINVAL;
> +
> +	for (i = 0; i < LPASS_MAX_HDMI_DMA_CHANNELS; i++) {
> +		drvdata->ch_msb[i] = devm_kzalloc(dev,
> +			sizeof(struct lpass_hdmi_tx_ch_msb), GFP_KERNEL);
> +		if (drvdata->ch_msb[i] == NULL)
> +			return -ENOMEM;
> +
> +		ch_msb = drvdata->ch_msb[i];
> +
> +		ch_msb->msb_bits = devm_regmap_field_alloc(dev, map,
> +							v->msb_bits);
> +		if (IS_ERR(ch_msb->msb_bits))
> +			return -EINVAL;
> +
> +		drvdata->ch_lsb[i] = devm_kzalloc(dev,
> +			sizeof(struct lpass_hdmi_tx_ch_lsb), GFP_KERNEL);
> +		if (drvdata->ch_lsb[i] == NULL)
> +			return -ENOMEM;
> +
> +		ch_lsb = drvdata->ch_lsb[i];
> +		ch_lsb->lsb_bits = devm_regmap_field_alloc(dev, map,
> +					v->lsb_bits);
> +		if (IS_ERR(ch_lsb->lsb_bits))
> +			return -EINVAL;
> +
> +
> +		drvdata->hdmi_tx_dmactl[i] = devm_kzalloc(dev,
> +			sizeof(struct lpass_hdmitx_dmactl), GFP_KERNEL);
> +		if (drvdata->hdmi_tx_dmactl[i] == NULL)
> +			return -ENOMEM;
> +
> +		hdmi_tx_dmactl = drvdata->hdmi_tx_dmactl[i];
> +		hdmi_tx_dmactl->use_hw_chs = devm_regmap_field_alloc(dev, map,
> +						v->use_hw_chs);
> +		hdmi_tx_dmactl->use_hw_usr = devm_regmap_field_alloc(dev, map,
> +						v->use_hw_usr);
> +		hdmi_tx_dmactl->hw_chs_sel = devm_regmap_field_alloc(dev, map,
> +						v->hw_chs_sel);
> +		hdmi_tx_dmactl->hw_usr_sel = devm_regmap_field_alloc(dev, map,
> +						v->hw_usr_sel);
> +		if (IS_ERR(hdmi_tx_dmactl->use_hw_chs) ||
> +			IS_ERR(hdmi_tx_dmactl->use_hw_usr) ||
> +			IS_ERR(hdmi_tx_dmactl->hw_chs_sel) ||
> +			IS_ERR(hdmi_tx_dmactl->hw_usr_sel))
> +			return -EINVAL;
> +	}
> +	return 0;
> +
> +}
> +EXPORT_SYMBOL(lpass_hdmi_init_bitfields);
> +
> +static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substream,
> +		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	snd_pcm_format_t format = params_format(params);
> +	unsigned int rate = params_rate(params);
> +	unsigned int channels = params_channels(params);
> +	unsigned int ret;
> +	unsigned int bitwidth;
> +	unsigned int word_length;
> +	unsigned int ch_sts_buf0;
> +	unsigned int ch_sts_buf1;
> +	unsigned int data_format;
> +	unsigned int sampling_freq;
> +	unsigned int ch = 0;
> +
> +	bitwidth = snd_pcm_format_width(format);
> +	if (bitwidth < 0) {
> +		dev_err(dai->dev, "%s invalid bit width given : %d\n",
> +					__func__, bitwidth);
> +		return bitwidth;
> +	}
> +
> +	switch (bitwidth) {
> +	case 16:
> +		word_length = LPASS_DP_AUDIO_BITWIDTH16;
> +		break;
> +	case 24:
> +		word_length = LPASS_DP_AUDIO_BITWIDTH24;
> +		break;
> +	default:
> +		dev_err(dai->dev, "%s invalid bit width given : %d\n",
> +					__func__, bitwidth);
> +		return -EINVAL;
> +	}
> +
> +	switch (rate) {
> +	case 32000:
> +		sampling_freq = LPASS_SAMPLING_FREQ32;
> +		break;
> +	case 44100:
> +		sampling_freq = LPASS_SAMPLING_FREQ44;
> +		break;
> +	case 48000:
> +		sampling_freq = LPASS_SAMPLING_FREQ48;
> +		break;
> +
> +	default:
> +		dev_err(dai->dev, "%s invalid bit width given : %d\n",
> +					__func__, bitwidth);
> +		return -EINVAL;
> +	}
> +	data_format = LPASS_DATA_FORMAT_LINEAR;
> +	ch_sts_buf0 = (((data_format << LPASS_DATA_FORMAT_SHIFT) & LPASS_DATA_FORMAT_MASK)
> +				| ((sampling_freq << LPASS_FREQ_BIT_SHIFT) & LPASS_FREQ_BIT_MASK));
> +	ch_sts_buf1 = (word_length) & LPASS_WORDLENGTH_MASK;
> +
> +	ret = regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_CTL_RESET);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_CTL_CLEAR);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->legacy->legacy_en,
> +				LPASS_HDMITX_LEGACY_DISABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->tx_parity->calc_en,
> +				HDMITX_PARITY_CALC_EN);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->vbit_ctl->replace_vbit,
> +					REPLACE_VBIT);
> +	if (ret)
> +
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->vbit_ctl->vbit_stream,
> +					LINEAR_PCM_DATA);
> +	if (ret)
> +
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->ch_msb[0]->msb_bits, ch_sts_buf1);
> +	if (ret)
> +
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->ch_lsb[0]->lsb_bits, ch_sts_buf0);
> +	if (ret)
> +
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->use_hw_chs,
> +				HW_MODE);
> +	if (ret)
> +
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->hw_chs_sel,
> +				SW_MODE);
> +	if (ret)
> +
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->use_hw_usr,
> +				HW_MODE);
> +	if (ret)
> +
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->hw_usr_sel,
> +				SW_MODE);
> +	if (ret)
> +
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->meta_ctl->mute,
> +				LPASS_MUTE_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->meta_ctl->as_sdp_cc,
> +				channels - 1);
> +	if (ret)
> +		return ret;
> +
> +
> +	ret = regmap_field_write(drvdata->meta_ctl->as_sdp_ct,
> +				LPASS_META_DEFAULT_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->meta_ctl->aif_db4,
> +				LPASS_META_DEFAULT_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->meta_ctl->frequency, sampling_freq);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->meta_ctl->mst_index,
> +				LPASS_META_DEFAULT_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->meta_ctl->dptx_index,
> +				LPASS_META_DEFAULT_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->sstream_ctl->sstream_en,
> +				LPASS_SSTREAM_DISABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->sstream_ctl->dma_sel, ch);
> +	if (ret)
> +		return ret;
> +
> +
> +	ret = regmap_field_write(drvdata->sstream_ctl->auto_bbit_en,
> +				LPASS_SSTREAM_DEFAULT_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +
> +	ret = regmap_field_write(drvdata->sstream_ctl->layout,
> +				LPASS_SSTREAM_DEFAULT_DISABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->sstream_ctl->layout_sp,
> +				LPASS_LAYOUT_SP_DEFAULT);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->sstream_ctl->dp_audio,
> +				LPASS_SSTREAM_DEFAULT_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->sstream_ctl->set_sp_on_en,
> +				LPASS_SSTREAM_DEFAULT_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->sstream_ctl->dp_sp_b_hw_en,
> +				LPASS_SSTREAM_DEFAULT_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->sstream_ctl->dp_staffing_en,
> +				LPASS_SSTREAM_DEFAULT_ENABLE);
> +	if (ret)
> +
> +		return ret;
> +
> +	return ret;
> +}
> +
> +
> +
too many empty lines !

> +static int lpass_hdmi_daiops_prepare(struct snd_pcm_substream *substream,
> +		struct snd_soc_dai *dai)
> +{
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	int ret;
> +
> +	ret = regmap_field_write(drvdata->sstream_ctl->sstream_en,
> +					LPASS_SSTREAM_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(drvdata->meta_ctl->mute,
> +					LPASS_MUTE_DISABLE);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
> +static int lpass_hdmi_daiops_trigger(struct snd_pcm_substream *substream,
> +		int cmd, struct snd_soc_dai *dai)
> +{
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	int ret = -EINVAL;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +
unnecessary space!
> +		ret = regmap_field_write(drvdata->sstream_ctl->sstream_en,
> +					LPASS_SSTREAM_ENABLE);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_field_write(drvdata->meta_ctl->mute,
> +					LPASS_MUTE_DISABLE);
> +		if (ret)
> +			return ret;
> +
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +
> +		ret = regmap_field_write(drvdata->sstream_ctl->sstream_en,
> +					LPASS_SSTREAM_DISABLE);
> +		if (ret)
> +			return ret;
> +
> +
> +		ret = regmap_field_write(drvdata->meta_ctl->mute,
> +					LPASS_MUTE_ENABLE);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_field_write(drvdata->sstream_ctl->dp_audio, 0);
> +		if (ret)
> +			return ret;
> +
> +		break;
> +	}
> +	return ret;
> +}
> +
> +const struct snd_soc_dai_ops asoc_qcom_lpass_hdmi_dai_ops = {
> +	.hw_params	= lpass_hdmi_daiops_hw_params,
> +	.prepare	= lpass_hdmi_daiops_prepare,
> +	.trigger	= lpass_hdmi_daiops_trigger,
> +};
> +EXPORT_SYMBOL_GPL(asoc_qcom_lpass_hdmi_dai_ops);
> +
> +
> +
too many empty lines??


> +static bool lpass_hdmi_regmap_writeable(struct device *dev, unsigned int reg)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	if (reg == LPASS_HDMI_TX_CTL_ADDR(v))
> +		return true;
> +	if (reg == LPASS_HDMI_TX_LEGACY_ADDR(v))
> +		return true;
> +	if (reg == LPASS_HDMI_TX_VBIT_CTL_ADDR(v))
> +		return true;
> +
switch case should make this much cleaner.

> +	for (i = 0; i < v->hdmi_rdma_channels; i++) {
> +		if (reg == LPASS_HDMI_TX_CH_LSB_ADDR(v, i))
> +			return true;
> +		if (reg == LPASS_HDMI_TX_CH_MSB_ADDR(v, i))
> +			return true;
> +		if (reg == LPASS_HDMI_TX_DMA_ADDR(v, i))
> +			return true;
> +	}
> +
> +	if (reg == LPASS_HDMI_TX_PARITY_ADDR(v))
> +		return true;
> +	if (reg == LPASS_HDMI_TX_DP_ADDR(v))
> +		return true;
> +	if (reg == LPASS_HDMI_TX_SSTREAM_ADDR(v))
> +		return true;
> +
> +	if (reg == LPASS_HDMITX_APP_IRQEN_REG(v))
> +		return true;
> +	if (reg == LPASS_HDMITX_APP_IRQCLEAR_REG(v))
> +		return true;
> +
> +	for (i = 0; i < v->rdma_channels; ++i) {
> +		if (reg == LPAIF_HDMI_RDMACTL_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_HDMI_RDMABASE_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_HDMI_RDMABUFF_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_HDMI_RDMAPER_REG(v, i))
> +			return true;
> +
> +	}
> +	return false;
> +}
> +
> +static bool lpass_hdmi_regmap_readable(struct device *dev, unsigned int reg)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	if (reg == LPASS_HDMI_TX_CTL_ADDR(v))
> +		return true;
> +	if (reg == LPASS_HDMI_TX_LEGACY_ADDR(v))
> +		return true;
> +	if (reg == LPASS_HDMI_TX_VBIT_CTL_ADDR(v))
> +		return true;

Same here, use switch case
> +
> +	for (i = 0; i < v->hdmi_rdma_channels; i++) {
> +		if (reg == LPASS_HDMI_TX_CH_LSB_ADDR(v, i))
> +			return true;
> +		if (reg == LPASS_HDMI_TX_CH_MSB_ADDR(v, i))
> +			return true;
> +		if (reg == LPASS_HDMI_TX_DMA_ADDR(v, i))
> +			return true;
> +	}

> +
> +	if (reg == LPASS_HDMI_TX_PARITY_ADDR(v))
> +		return true;
> +	if (reg == LPASS_HDMI_TX_DP_ADDR(v))
> +		return true;
> +	if (reg == LPASS_HDMI_TX_SSTREAM_ADDR(v))
> +		return true;
> +
> +	if (reg == LPASS_HDMITX_APP_IRQEN_REG(v))
> +		return true;
> +	if (reg == LPASS_HDMITX_APP_IRQSTAT_REG(v))
> +		return true;
> +
> +	for (i = 0; i < v->rdma_channels; ++i) {
> +		if (reg == LPAIF_HDMI_RDMACTL_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_HDMI_RDMABASE_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_HDMI_RDMABUFF_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_HDMI_RDMAPER_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_HDMI_RDMACURR_REG(v, i))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned int reg)
> +{
> +	return true;

Are all the register range really volatile?

> +
> +}
> +struct regmap_config lpass_hdmi_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.writeable_reg = lpass_hdmi_regmap_writeable,
> +	.readable_reg = lpass_hdmi_regmap_readable,
> +	.volatile_reg = lpass_hdmi_regmap_volatile,
> +	.cache_type = REGCACHE_FLAT,

Any reason for using FLAT cache type ??

> +};
> +EXPORT_SYMBOL(lpass_hdmi_regmap_config);
> +
> +MODULE_DESCRIPTION("QTi LPASS HDMI Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/qcom/lpass-hdmi.h b/sound/soc/qcom/lpass-hdmi.h
> new file mode 100644
> index 0000000..f91f322
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-hdmi.h
> @@ -0,0 +1,129 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
> + *
> + * lpass_hdmi.h - Definitions for the QTi LPASS HDMI
> + */
> +
> +#ifndef __LPASS_HDMI_H__
> +#define __LPASS_HDMI_H__
> +
> +#include <linux/clk.h>
> +#include <linux/compiler.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define LPASS_HDMITX_LEGACY_DISABLE		0x0
> +#define LPASS_HDMITX_LEGACY_ENABLE		0x1
> +#define LPASS_DP_AUDIO_BITWIDTH16		0x0
> +#define LPASS_DP_AUDIO_BITWIDTH24		0xb
> +#define LPASS_DATA_FORMAT_SHIFT			0x1
> +#define LPASS_DATA_FORMAT_MASK			0x2
> +#define LPASS_FREQ_BIT_SHIFT			24
> +#define LPASS_FREQ_BIT_MASK			0xf000000

use GENMASK macro for all such masks.

> +#define LPASS_DATA_FORMAT_LINEAR		0x0
> +#define LPASS_DATA_FORMAT_NON_LINEAR		0x1
> +#define LPASS_SAMPLING_FREQ32			0x3
> +#define LPASS_SAMPLING_FREQ44			0x0
> +#define LPASS_SAMPLING_FREQ48			0x2
> +#define LPASS_TX_CTL_RESET			0x1
> +#define LPASS_TX_CTL_CLEAR			0x0
> +#define LPASS_SSTREAM_ENABLE			1
> +#define LPASS_SSTREAM_DISABLE			0
> +#define LPASS_LAYOUT_SP_DEFAULT			0xf
> +#define LPASS_SSTREAM_DEFAULT_ENABLE		1
> +#define LPASS_SSTREAM_DEFAULT_DISABLE		0
> +#define LPASS_WORDLENGTH_MASK			0xf
> +#define LPASS_MUTE_ENABLE			1
> +#define LPASS_MUTE_DISABLE			0
> +#define LPASS_META_DEFAULT_VAL			0
> +#define HW_MODE					1
> +#define SW_MODE					0
> +#define LEGACY_LPASS_LPAIF			1
> +#define LEGACY_LPASS_HDMI			0
> +#define REPLACE_VBIT				0x1
> +#define LINEAR_PCM_DATA				0x0
> +#define NON_LINEAR_PCM_DATA			0x1
> +#define HDMITX_PARITY_CALC_EN			0x1
> +#define HDMITX_PARITY_CALC_DIS			0x0
> +
> +
> +#define LPASS_HDMI_TX_CTL_ADDR(v) \
> +		(v->hdmi_tx_ctl_addr)
> +
> +#define LPASS_HDMI_TX_LEGACY_ADDR(v) \
> +		(v->hdmi_legacy_addr)
> +#define LPASS_HDMI_TX_VBIT_CTL_ADDR(v) \
> +		(v->hdmi_vbit_addr)
above three macros should be able to go in single lines!! Not sure why 
you are adding an extra break, which makes it very odd for reading.

> +#define LPASS_HDMI_TX_CH_LSB_ADDR(v, port) \
> +		(v->hdmi_ch_lsb_addr + \
> +		v->ch_stride * (port))
> +#define LPASS_HDMI_TX_CH_MSB_ADDR(v, port) \
> +		(v->hdmi_ch_msb_addr + \
> +		v->ch_stride * (port))
> +#define LPASS_HDMI_TX_DMA_ADDR(v, port) \
> +		(v->hdmi_dmactl_addr + \
> +		v->hdmi_dma_stride * (port))
> +#define LPASS_HDMI_TX_PARITY_ADDR(v) \
> +		(v->hdmi_parity_addr)
> +#define LPASS_HDMI_TX_DP_ADDR(v) \
> +		(v->hdmi_DP_addr)
> +#define LPASS_HDMI_TX_SSTREAM_ADDR(v) \
> +		(v->hdmi_sstream_addr)
> +
> +struct lpass_sstream_ctl {
> +	struct regmap_field *sstream_en;
> +	struct regmap_field *dma_sel;
> +	struct regmap_field *auto_bbit_en;
> +	struct regmap_field *layout;
> +	struct regmap_field *layout_sp;
> +	struct regmap_field *set_sp_on_en;
> +	struct regmap_field *dp_audio;
> +	struct regmap_field *dp_staffing_en;
> +	struct regmap_field *dp_sp_b_hw_en;
> +};
> +
> +struct lpass_dp_metadata_ctl {
> +	struct regmap_field *mute;
> +	struct regmap_field *as_sdp_cc;
> +	struct regmap_field *as_sdp_ct;
> +	struct regmap_field *aif_db4;
> +	struct regmap_field *frequency;
> +	struct regmap_field *mst_index;
> +	struct regmap_field *dptx_index;
> +};
> +
> +struct lpass_hdmi_tx_ctl {
> +	struct regmap_field *soft_reset;
> +	struct regmap_field *force_reset;
> +};
> +
> +struct lpass_hdmitx_dmactl {
> +	struct regmap_field *use_hw_chs;
> +	struct regmap_field *use_hw_usr;
> +	struct regmap_field *hw_chs_sel;
> +	struct regmap_field *hw_usr_sel;
> +};
> +
> +struct lpass_vbit_ctrl {
> +		struct regmap_field *replace_vbit;
> +		struct regmap_field *vbit_stream;
> +};
> +
> +struct  lpass_hdmitx_legacy {
> +	struct regmap_field *legacy_en;
> +};
> +
> +struct  lpass_hdmi_tx_parity {
> +	struct regmap_field *calc_en;
> +};
> +
> +struct  lpass_hdmi_tx_ch_lsb {
> +	struct regmap_field *lsb_bits;
> +};
> +
> +struct  lpass_hdmi_tx_ch_msb {
> +	struct regmap_field *msb_bits;
> +};
> +
> +#endif /* __LPASS_HDMI_H__ */
> diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
> index 72f09b3..832a916 100644
> --- a/sound/soc/qcom/lpass-ipq806x.c
> +++ b/sound/soc/qcom/lpass-ipq806x.c
> @@ -96,7 +96,7 @@ static int ipq806x_lpass_exit(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir)
> +static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir, unsigned int dai_id)
>   {
>   	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>   		return IPQ806X_LPAIF_RDMA_CHAN_MI2S;
> @@ -104,7 +104,7 @@ static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir)
>   		return -EINVAL;
>   }
>   
> -static int ipq806x_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
> +static int ipq806x_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, unsigned int dai_id)
>   {
>   	return 0;
>   }
> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
> index 5258e60..42aebd4 100644
> --- a/sound/soc/qcom/lpass-lpaif-reg.h
> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
> @@ -9,7 +9,8 @@
>   /* LPAIF I2S */
>   
>   #define LPAIF_I2SCTL_REG_ADDR(v, addr, port) \
> -	(v->i2sctrl_reg_base + (addr) + v->i2sctrl_reg_stride * (port))
> +	(v->i2sctrl_reg_base + (addr) + \
> +	v->i2sctrl_reg_stride * (port))
>   
>   #define LPAIF_I2SCTL_REG(v, port)	LPAIF_I2SCTL_REG_ADDR(v, 0x0, (port))
>   
> @@ -70,6 +71,14 @@
>   #define LPAIF_IRQSTAT_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0x4, (port))
>   #define LPAIF_IRQCLEAR_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0xC, (port))
>   
> +
> +#define LPASS_HDMITX_APP_IRQ_REG_ADDR(v, addr)  \
> +	((v->hdmi_irq_reg_base) + (addr))
> +
> +#define LPASS_HDMITX_APP_IRQEN_REG(v)			LPASS_HDMITX_APP_IRQ_REG_ADDR(v, 0x4)
> +#define LPASS_HDMITX_APP_IRQSTAT_REG(v)			LPASS_HDMITX_APP_IRQ_REG_ADDR(v, 0x8)
> +#define LPASS_HDMITX_APP_IRQCLEAR_REG(v)		LPASS_HDMITX_APP_IRQ_REG_ADDR(v, 0xC)
> +
>   #define LPAIF_IRQ_BITSTRIDE		3
>   
>   #define LPAIF_IRQ_PER(chan)		(1 << (LPAIF_IRQ_BITSTRIDE * (chan)))
> @@ -77,8 +86,22 @@
>   #define LPAIF_IRQ_ERR(chan)		(4 << (LPAIF_IRQ_BITSTRIDE * (chan)))
>   
>   #define LPAIF_IRQ_ALL(chan)		(7 << (LPAIF_IRQ_BITSTRIDE * (chan)))
> +#define LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan)	(1 << (14 + chan))
> +#define LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan)	(1 << (24 + chan))
> +#define LPAIF_IRQ_HDMI_METADONE		BIT(23)
>   
>   /* LPAIF DMA */
> +#define LPAIF_HDMI_RDMA_REG_ADDR(v, addr, chan) \
> +	(v->hdmi_rdma_reg_base + (addr) + v->hdmi_rdma_reg_stride * (chan))
> +
> +#define LPAIF_HDMI_RDMACTL_AUDINTF(id)	(id << LPAIF_RDMACTL_AUDINTF_SHIFT)
> +
> +#define LPAIF_HDMI_RDMACTL_REG(v, chan)		LPAIF_HDMI_RDMA_REG_ADDR(v, 0x00, (chan))
> +#define LPAIF_HDMI_RDMABASE_REG(v, chan)	LPAIF_HDMI_RDMA_REG_ADDR(v, 0x04, (chan))
> +#define	LPAIF_HDMI_RDMABUFF_REG(v, chan)	LPAIF_HDMI_RDMA_REG_ADDR(v, 0x08, (chan))
> +#define LPAIF_HDMI_RDMACURR_REG(v, chan)	LPAIF_HDMI_RDMA_REG_ADDR(v, 0x0C, (chan))
> +#define	LPAIF_HDMI_RDMAPER_REG(v, chan)		LPAIF_HDMI_RDMA_REG_ADDR(v, 0x10, (chan))
> +#define	LPAIF_HDMI_RDMAPERCNT_REG(v, chan)	LPAIF_HDMI_RDMA_REG_ADDR(v, 0x14, (chan))
>   
>   #define LPAIF_RDMA_REG_ADDR(v, addr, chan) \
>   	(v->rdma_reg_base + (addr) + v->rdma_reg_stride * (chan))
> @@ -103,17 +126,22 @@
>   #define	LPAIF_WRDMAPER_REG(v, chan)	LPAIF_WRDMA_REG_ADDR(v, 0x10, (chan))
>   #define	LPAIF_WRDMAPERCNT_REG(v, chan)	LPAIF_WRDMA_REG_ADDR(v, 0x14, (chan))
>   
> -#define __LPAIF_DMA_REG(v, chan, dir, reg)  \
> -	(dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
> -		LPAIF_RDMA##reg##_REG(v, chan) : \
> -		LPAIF_WRDMA##reg##_REG(v, chan)
> -
> -#define LPAIF_DMACTL_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, CTL)
> -#define LPAIF_DMABASE_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, BASE)
> -#define	LPAIF_DMABUFF_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, BUFF)
> -#define LPAIF_DMACURR_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, CURR)
> -#define	LPAIF_DMAPER_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, PER)
> -#define	LPAIF_DMAPERCNT_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, PERCNT)
> +#define LPAIF_INTFDMA_REG(v, chan, reg, dai_id)  \
> +		((v->dai_driver[dai_id].id ==  LPASS_DP_RX) ? \
> +		LPAIF_HDMI_RDMA##reg##_REG(v, chan) : \
> +		 LPAIF_RDMA##reg##_REG(v, chan))
> +
> +#define __LPAIF_DMA_REG(v, chan, dir, reg, dai_id)  \
> +	((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
> +		(LPAIF_INTFDMA_REG(v, chan, reg, dai_id)) : \
> +		LPAIF_WRDMA##reg##_REG(v, chan))
> +
> +#define LPAIF_DMACTL_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, CTL, dai_id)
> +#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, BASE, dai_id)
> +#define	LPAIF_DMABUFF_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id)
> +#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, CURR, dai_id)
> +#define	LPAIF_DMAPER_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, PER, dai_id)
> +#define	LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id)
>   
>   #define LPAIF_DMACTL_BURSTEN_SINGLE	0
>   #define LPAIF_DMACTL_BURSTEN_INCR4	1
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 35aead1..e2d1f25 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -23,7 +23,7 @@ struct lpass_pcm_data {
>   	int i2s_port;
>   };
>   
> -#define LPASS_PLATFORM_BUFFER_SIZE	(16 * 1024)
> +#define LPASS_PLATFORM_BUFFER_SIZE	(24 *  2 * 1024)
>   #define LPASS_PLATFORM_PERIODS		2
>   
>   static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
> @@ -62,41 +62,79 @@ static int lpass_platform_alloc_dmactl_fields(struct device *dev,
>   	if (drvdata->rd_dmactl == NULL)
>   		return -ENOMEM;
>   
> -	drvdata->wr_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
> -					  GFP_KERNEL);
> -	if (drvdata->wr_dmactl == NULL)
> -		return -ENOMEM;
> -
>   	rd_dmactl = drvdata->rd_dmactl;
> -	wr_dmactl = drvdata->wr_dmactl;
>   
>   	rd_dmactl->bursten = devm_regmap_field_alloc(dev, map, v->rdma_bursten);
>   	rd_dmactl->wpscnt = devm_regmap_field_alloc(dev, map, v->rdma_wpscnt);
>   	rd_dmactl->fifowm = devm_regmap_field_alloc(dev, map, v->rdma_fifowm);
> -	rd_dmactl->intf = devm_regmap_field_alloc(dev, map, v->rdma_intf);
>   	rd_dmactl->enable = devm_regmap_field_alloc(dev, map, v->rdma_enable);
>   	rd_dmactl->dyncclk = devm_regmap_field_alloc(dev, map, v->rdma_dyncclk);
> -
> +	rd_dmactl->intf = devm_regmap_field_alloc(dev, map, v->rdma_intf);
>   	if (IS_ERR(rd_dmactl->bursten) || IS_ERR(rd_dmactl->wpscnt) ||
> -	    IS_ERR(rd_dmactl->fifowm) || IS_ERR(rd_dmactl->intf) ||
> -	    IS_ERR(rd_dmactl->enable) || IS_ERR(rd_dmactl->dyncclk))
> +	    IS_ERR(rd_dmactl->fifowm) || IS_ERR(rd_dmactl->dyncclk) ||
> +	    IS_ERR(rd_dmactl->enable) || IS_ERR(rd_dmactl->intf))
>   		return -EINVAL;
> +	drvdata->wr_dmactl = devm_kzalloc(dev,
> +			sizeof(struct lpaif_dmactl), GFP_KERNEL);
> +	if (drvdata->wr_dmactl == NULL)
> +		return -ENOMEM;
>   
> -	wr_dmactl->bursten = devm_regmap_field_alloc(dev, map, v->wrdma_bursten);
> -	wr_dmactl->wpscnt = devm_regmap_field_alloc(dev, map, v->wrdma_wpscnt);
> -	wr_dmactl->fifowm = devm_regmap_field_alloc(dev, map, v->wrdma_fifowm);
> -	wr_dmactl->intf = devm_regmap_field_alloc(dev, map, v->wrdma_intf);
> -	wr_dmactl->enable = devm_regmap_field_alloc(dev, map, v->wrdma_enable);
> -	wr_dmactl->dyncclk = devm_regmap_field_alloc(dev, map, v->wrdma_dyncclk);
> +	wr_dmactl = drvdata->wr_dmactl;
> +
> +	wr_dmactl->bursten = devm_regmap_field_alloc(dev, map,
> +						v->wrdma_bursten);
> +	wr_dmactl->wpscnt = devm_regmap_field_alloc(dev, map,
> +						v->wrdma_wpscnt);
> +	wr_dmactl->fifowm = devm_regmap_field_alloc(dev, map,
> +						v->wrdma_fifowm);
> +	wr_dmactl->intf = devm_regmap_field_alloc(dev, map,
> +						v->wrdma_intf);
> +	wr_dmactl->enable = devm_regmap_field_alloc(dev, map,
> +						v->wrdma_enable);
> +	wr_dmactl->dyncclk = devm_regmap_field_alloc(dev, map,
> +						v->wrdma_dyncclk);

Can you explain what is happening here, these chagnes just look like 
spllitting one line into two!


I should stop reviewing at this point!
As I have seen some general issues with the patch like
- doing un-needed changes!
- removing #ifdef checks.
- try to come up with some api/macro to simplify field allocs as they 
seems to be all over the place!

thanks,
srini

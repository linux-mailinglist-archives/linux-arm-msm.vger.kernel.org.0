Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1119225D696
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 12:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730192AbgIDKlo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 06:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730204AbgIDKlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 06:41:13 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54639C061245
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 03:41:12 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w5so6243351wrp.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kyJg8idy+PjAE57kGmkS0ZoaAYxlqusadYf8SACjX04=;
        b=sYm0PXTPk5fJ6nKnctZpW0txiiXbd6A6TN9TxriYAGrOs7WULA6uKZ7UH7+eczEnWw
         aDHeYvfvAxsruBMjO2UMYARCy7RE8RFPwhAGzTrJ/hOvDp+kjwCOjsFsWlE/8AycPBmo
         mYiKosDA7Prf8L/E0GGH911LUE33CWluHR8hYYB4RhVXGgQuqKh5yU0TrOTbJCquL1lR
         4cq4H/XEG/3BnJmbOH3AsW7Q54PkO8C6HxY8W4GiPapu7rtxSAq3bUA218a7BlOiENJZ
         yYVTUHFmYhUjSklJ8pl4rEkxH5dHSInIZhEOXTspfcNPJaYqi1yQIc51LbA0G3/QLJHM
         0bAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kyJg8idy+PjAE57kGmkS0ZoaAYxlqusadYf8SACjX04=;
        b=fGTpdSEDbE5SNtQr4cOHlvtb0sNz1CIsrzUiZPHeca9BQrKqGs6loEvoA/pUc9yh4I
         DhQ94j24z59x7/9KnX7UKh0O+T/d68Uu54bASNxP7rd9hFOi3KI/ONMSA2M3rv71Etbg
         EtfN2KNb/5GcKUOC61MEkVjT4U7wizUYMEzmBzNrk9GFoNT0dQJTNHmcoelboYqiETIe
         T7ilnx6C7X+sb6GpvZ+mQwP6OhOF0RIAqIT2/eNhca5IlgiHZSwjvY4fpbisbm6vQo7p
         KW8Au/yvvV2XG8cAcX9tXYUHaeJCW4utFFMxFqa6iKnLqUR/xze4nh4Q5LONWb+hxHMO
         XwHA==
X-Gm-Message-State: AOAM530PnH8A/eR+W3E3hYp0QOfl8JpJQA9pakDKk68yr+cdUMxhOfVJ
        zU2pUrpqh6cEXtMzHX+CUb9oiw==
X-Google-Smtp-Source: ABdhPJwcM/mvRUa1x6LP8GowZ/iDgM47WaAX67i0UXgUblW5EME1WshkbRtkPmA9S3/tyM1Y/cvb9A==
X-Received: by 2002:a5d:4e44:: with SMTP id r4mr2651863wrt.338.1599216071002;
        Fri, 04 Sep 2020 03:41:11 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id q3sm19804440wmq.1.2020.09.04.03.41.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2020 03:41:10 -0700 (PDT)
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ac1f0b9a-8e07-464c-b0df-6b8e5665a632@linaro.org>
Date:   Fri, 4 Sep 2020 11:41:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31/08/2020 07:39, Srinivasa Rao Mandadapu wrote:
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
>   sound/soc/qcom/lpass-apq8016.c   |   1 +
>   sound/soc/qcom/lpass-cpu.c       |  64 ++--
>   sound/soc/qcom/lpass-hdmi.c      | 684 +++++++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/lpass-hdmi.h      | 129 ++++++++
>   sound/soc/qcom/lpass-ipq806x.c   |   1 +
>   sound/soc/qcom/lpass-lpaif-reg.h |  48 ++-
>   sound/soc/qcom/lpass-platform.c  | 287 ++++++++++++----
>   sound/soc/qcom/lpass.h           |  88 ++++-
>   10 files changed, 1225 insertions(+), 84 deletions(-)
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
> index 5c8ae22..a1bc7e2 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -289,6 +289,7 @@ static struct lpass_variant apq8016_data = {
>   	.exit			= apq8016_lpass_exit,
>   	.alloc_dma_channel	= apq8016_lpass_alloc_dma_channel,
>   	.free_dma_channel	= apq8016_lpass_free_dma_channel,
> +	.id			= I2S_INTERFACE,

Before going into detail review, I see real issue in the overall 
approach here to add new interface to exiting lpass!!

Intention of struct lpass_variant is to address differences between SoCs 
or different lpass versions. But you should not duplicate this and use 
it for addressing differences between each lpass interfaces!

All the dai related register offsets should still go in to this 
structure and driver should be able to know which dai its talking to 
based on snd_soc_dai_driver id and select correct register offset.

Also on the other note, can you please split the patch if possible so 
that it will be easy for review. Specially I would like to see header 
file changes specific to adding new interface to be separate then 
followed by the actual interface implementation  and then the user.

I also see some unrelated changes like changing buffer sizes, which 
should go into different patch!

--srini

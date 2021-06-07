Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8E939DF39
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 16:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhFGOwH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 10:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhFGOwH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 10:52:07 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C45C061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jun 2021 07:50:16 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id i94so12908502wri.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ByuWA/FeshPmLL8w1r+fuCOMh+rIc6tFaDLNfGOXkJ4=;
        b=Q+AUXH6Ozlo1bGcem9xyhXLx6p5zw2kfb5vmaOQlSrxbGpyKvoWKTpZpEJ5ldB0oIC
         wraYRcylqwrytpiW4zj62E+ZoZdSFWh9YWyk94dnSUGPFzkhJje3pzPp8uKaETDiapR0
         Mb/TEAdkpUcE2FLckZ4CeYBof1xyG3XTltANywQNINpLvY9IAycbT/nK0Q/cJO8JCWwp
         dgOYOMSDb46x69pcxr7dOkpt3YBLZBCvOo6vw7lelyJ5ZOAQHT+gHPnC3OZEH5M50zR0
         HKo5967qxi6xvh5n48XjRAnpZ7PSIFOKuqjMc9xcAWkXt5Fi6cNAwaJC+hr6n6KVpgtp
         RnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ByuWA/FeshPmLL8w1r+fuCOMh+rIc6tFaDLNfGOXkJ4=;
        b=gIBZ+hWYzOP8EClAOB9c42Vhs3m5cfeRm0fFTgbXPhiplNGPHmKucg0hbdBrsZ+l3z
         5wRZtxADEcpf/nJIOjDw5h4NhG5wPZxc/+5H+csMeZ+d/H1u/nEqsIkqPiwp68ZXSMxM
         t7UIGkn5tWDOEtkQ41Mj2Yl2nRBWjBVy3TrJbGyfY1IFPg1S9X0EwSZtcRqCC6BP4iar
         kT0lUcC0LDtnZt98Z6Ojpci5pmAPiTK9pDz5nOMbpIM7UDoz6jhYa3oWhLzV26RhdbS6
         QCZ3M3gn3yhzBPzdHdSvpt56SNDVk7Mc4J6/u8vWTDd4Ml4Sz/fdsPW+CdzpfrblOgYB
         TmHw==
X-Gm-Message-State: AOAM533Et5QR0U6l4+CKSqkrP8aFACdu7xFLDI1J8iR1AAE5MuXq8ZrO
        jl5tHYSz/vj0D/7gByi3FdqrXw==
X-Google-Smtp-Source: ABdhPJw59vawdwGj786iQvPc2EqyB2ILv3MVi/4BNcV3iN6RvaKPmAY4ReeZNQGuKy0QuV3behuSxg==
X-Received: by 2002:a05:6000:1803:: with SMTP id m3mr17161493wrh.257.1623077414589;
        Mon, 07 Jun 2021 07:50:14 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id x10sm5665619wrt.26.2021.06.07.07.50.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 07:50:13 -0700 (PDT)
Subject: Re: [PATCH v2] ASoC: qcom: Fix for DMA interrupt clear reg
 overwriting
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <20210605113809.26584-1-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ac3e70da-7d82-2021-3a25-08179aeb6b54@linaro.org>
Date:   Mon, 7 Jun 2021 15:50:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210605113809.26584-1-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 05/06/2021 12:38, Srinivasa Rao Mandadapu wrote:
> The DMA interrupt clear register overwritten during
> simultaneous playback and capture in lpass platform
> interrupt handler. It's causing playback or capture stuck
> in similtaneous plaback on speaker and capture on dmic test.
> Update appropriate reg fields of corresponding channel instead
> of entire register write.
> 
> Fixes: commit c5c8635a04711 ("ASoC: qcom: Add LPASS platform driver")
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-platform.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 0df9481ea4c6..f220a2739ac3 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -526,7 +526,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   			return -EINVAL;
>   		}
>   
> -		ret = regmap_write(map, reg_irqclr, val_irqclr);
> +		ret = regmap_update_bits(map, reg_irqclr, val_irqclr, val_irqclr);
>   		if (ret) {
>   			dev_err(soc_runtime->dev, "error writing to irqclear reg: %d\n", ret);
>   			return ret;
> @@ -650,7 +650,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	struct lpass_variant *v = drvdata->variant;
>   	irqreturn_t ret = IRQ_NONE;
>   	int rv;
> -	unsigned int reg = 0, val = 0;
> +	unsigned int reg, val, val_clr, val_mask;

minor nit here, variable name val_clr is pretty confusing to readers, It 
might be okay for irq clr register but we are using the same name of 
writing to other registers. So can I suggest you to reuse val variable.

other thing is val_mask, please rename this to mask and just set it in 
the start of function so you can avoid 3 extra lines below.

Other than that patch looks good to me!

--srini
>   	struct regmap *map;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> @@ -676,8 +676,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	return -EINVAL;
>   	}
>   	if (interrupts & LPAIF_IRQ_PER(chan)) {
> -
> -		rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
> +		val_clr = LPAIF_IRQ_PER(chan) | val;
> +		val_mask = LPAIF_IRQ_ALL(chan);
> +		rv = regmap_update_bits(map, reg, val_mask, val_clr);
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> @@ -688,7 +689,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	}
>   
>   	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
> -		rv = regmap_write(map, reg, LPAIF_IRQ_XRUN(chan) | val);
> +		val_clr = (LPAIF_IRQ_XRUN(chan) | val);
> +		val_mask = LPAIF_IRQ_ALL(chan);
> +		rv = regmap_update_bits(map, reg, val_mask, val_clr);
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> @@ -700,7 +703,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	}
>   
>   	if (interrupts & LPAIF_IRQ_ERR(chan)) {
> -		rv = regmap_write(map, reg, LPAIF_IRQ_ERR(chan) | val);
> +		val_clr = (LPAIF_IRQ_ERR(chan) | val);
> +		val_mask = LPAIF_IRQ_ALL(chan);
> +		rv = regmap_update_bits(map, reg, val_mask, val_clr);
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> 

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1073E3ACA1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 13:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbhFRLn0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 07:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233152AbhFRLnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 07:43:22 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42F8C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 04:41:12 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id n7so10450380wri.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=2+aVtjIZPMWAlSORuslJEgy3WIqb0GMm7Q4JpdPCkC0=;
        b=TId1KcZQnz4L0hbs4WelnUMqcvwWWi1WzMVQ5EOOM2NgW6Xi2Y9wwFhhDRFn7VX7hS
         uaWIZNTtdUL8kzuGdo494lwZEYt1+LEw4vydd790n69r7iz8DfD7JaO7PGii2coZFaFh
         yzwVf0YskKDyzKyEjLltHqA4Vr3uihuQDYJ5v7F8idCcAlrZHEyC9Rk7wz/4PGECRTZE
         SgiSuE0hgiaVyqmmRMmk/d0P4vWxXeuq86Z54X7DqS99MZDUg+GXaXmQbDbr09Ly71D3
         gJYwRPPhUaTgiZ7jpnwXEhGdJRcnZhSvRhyD6WxXpeNeVABMkSj9k00eauzED27LCSpn
         fejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2+aVtjIZPMWAlSORuslJEgy3WIqb0GMm7Q4JpdPCkC0=;
        b=FoT05Irp4Hm/EEvuCuGgXQQnrzPQg128VfuP46Vyb0NYtmWJK3v7Fta0MGxK7qoi94
         X5ypXer2dAENhRghwbvaWApJsoZNn0FoZ9sx1Gi9IYYMx3urdKxmV+9WoR1WpfAV92JR
         iHS4Ksh0p2dcfsm+VrBEvCPq2XIzK+p86j4hlkAvf5Y8SqcTrqOfXiLGrRmOF3Bl8lo+
         VG6KlUt/1e8C7C4x9XWfRSIwAEDpB51mG0HrEACKRDCIUtQghHLNZoLJT5fKbZFCMZit
         jtv60yDdE8+kJ5zu/edfthT8k1AeWcyWjPaDSCRQVFjI8dL4NB6TKLRVqljH56DEVjSE
         3CDQ==
X-Gm-Message-State: AOAM531j558uBub5f4ym79q9dsT8TC4Zpgd14TBr3gnVS6ETIRKrET/D
        vSu5/Ir1ftBDWBtBx6yo1f1yhw==
X-Google-Smtp-Source: ABdhPJwhkaQHejxBMQnTClcBCXFQ2/K58vup9P7+dj81rIrBztuammVJmK/4c3JNzjsIcgV4Cbj5PQ==
X-Received: by 2002:a5d:6849:: with SMTP id o9mr11612861wrw.44.1624016471416;
        Fri, 18 Jun 2021 04:41:11 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id u15sm8553491wmq.1.2021.06.18.04.41.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jun 2021 04:41:10 -0700 (PDT)
Subject: Re: [PATCH v3] ASoC: qcom: Fix for DMA interrupt clear reg
 overwriting
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <20210609072310.26099-1-srivasam@codeaurora.org>
 <CGME20210617193537eucas1p217b93d091ae8795581b30931ad8c7467@eucas1p2.samsung.com>
 <5ae06ccb-ffd4-ca9f-5a88-1f8bf8b48d37@samsung.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <83be2add-2fa7-a16e-4250-95520e80c514@linaro.org>
Date:   Fri, 18 Jun 2021 12:41:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5ae06ccb-ffd4-ca9f-5a88-1f8bf8b48d37@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marek,

Thanks for testing next and reporting this back.

On 17/06/2021 20:35, Marek Szyprowski wrote:
> Hi,
> 
> On 09.06.2021 09:23, Srinivasa Rao Mandadapu wrote:
>> The DMA interrupt clear register overwritten during
>> simultaneous playback and capture in lpass platform
>> interrupt handler. It's causing playback or capture stuck
>> in similtaneous plaback on speaker and capture on dmic test.
>> Update appropriate reg fields of corresponding channel instead
>> of entire register write.
>>
>> Fixes: commit c5c8635a04711 ("ASoC: qcom: Add LPASS platform driver")
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> This patch landed recently in linux-next as commit da0363f7bfd3 ("ASoC:
> qcom: Fix for DMA interrupt clear reg overwriting"). It breaks ALSA
> playback on DragonBoard 410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts).
> After applying this patch, running 'speaker-test -l1' never finishes.
> There is no error nor kernel warning message. Before that commit, the
> playback worked fine on that board.

TBH, I should have looked at the hw register description that is being 
updated in the patch. This is a software write only and hardware 
readable register for which update_bits really does not make sense at 
all. While digging out I found an issue with regmap_cache reads which 
should have reported an error while attempting to even do this. I sent 
out a patch to fix this.

Now for this patch itself, We should send a patch to revert it.


thanks,
srini


> 
>> ---
>> Changes since v2:
>> 	-- Removed redundant variables.
>> Changes since v1:
>> 	-- Subject lines changed.
>>    sound/soc/qcom/lpass-platform.c | 12 ++++++------
>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index 0df9481ea4c6..f9df76d37858 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -526,7 +526,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>>    			return -EINVAL;
>>    		}
>>    
>> -		ret = regmap_write(map, reg_irqclr, val_irqclr);
>> +		ret = regmap_update_bits(map, reg_irqclr, val_irqclr, val_irqclr);
>>    		if (ret) {
>>    			dev_err(soc_runtime->dev, "error writing to irqclear reg: %d\n", ret);
>>    			return ret;
>> @@ -650,10 +650,11 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>    	struct lpass_variant *v = drvdata->variant;
>>    	irqreturn_t ret = IRQ_NONE;
>>    	int rv;
>> -	unsigned int reg = 0, val = 0;
>> +	unsigned int reg, val, mask;
>>    	struct regmap *map;
>>    	unsigned int dai_id = cpu_dai->driver->id;
>>    
>> +	mask = LPAIF_IRQ_ALL(chan);
>>    	switch (dai_id) {
>>    	case LPASS_DP_RX:
>>    		map = drvdata->hdmiif_map;
>> @@ -676,8 +677,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>    	return -EINVAL;
>>    	}
>>    	if (interrupts & LPAIF_IRQ_PER(chan)) {
>> -
>> -		rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
>> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
>>    		if (rv) {
>>    			dev_err(soc_runtime->dev,
>>    				"error writing to irqclear reg: %d\n", rv);
>> @@ -688,7 +688,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>    	}
>>    
>>    	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
>> -		rv = regmap_write(map, reg, LPAIF_IRQ_XRUN(chan) | val);
>> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_XRUN(chan) | val));
>>    		if (rv) {
>>    			dev_err(soc_runtime->dev,
>>    				"error writing to irqclear reg: %d\n", rv);
>> @@ -700,7 +700,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>    	}
>>    
>>    	if (interrupts & LPAIF_IRQ_ERR(chan)) {
>> -		rv = regmap_write(map, reg, LPAIF_IRQ_ERR(chan) | val);
>> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_ERR(chan) | val));
>>    		if (rv) {
>>    			dev_err(soc_runtime->dev,
>>    				"error writing to irqclear reg: %d\n", rv);
> 
> Best regards
> 

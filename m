Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0730B39DFF2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 17:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhFGPGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 11:06:50 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:53120 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbhFGPGu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 11:06:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623078299; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=6OL88XHWl9ozHCq99izlFd+FKI5s0/oTrciQ/ohCW7A=; b=qOVN7OrMvYOzfEDeAhZQxjJ31zZqKKPEhI8vpr5kn3N3yEWHwTdiPvV1KXKenj/dKkZ3bFyz
 pvX9Pk27s+CSdrVYp8vnZDa2yiyyGB9uG7Np4J900G5XbKzJMrDZh25HgH5V/2fmXpvzeBsE
 MbVEtM+xnF+vK2wNTmAn+0nWuik=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60be356fed59bf69ccad05d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 15:04:15
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5DF88C43148; Mon,  7 Jun 2021 15:04:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.144.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37A76C433D3;
        Mon,  7 Jun 2021 15:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37A76C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v2] ASoC: qcom: Fix for DMA interrupt clear reg
 overwriting
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <20210605113809.26584-1-srivasam@codeaurora.org>
 <ac3e70da-7d82-2021-3a25-08179aeb6b54@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <8028139e-fe25-bb9e-3038-5180bc5f8ca3@codeaurora.org>
Date:   Mon, 7 Jun 2021 20:34:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ac3e70da-7d82-2021-3a25-08179aeb6b54@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Srini,

Thanks for your review comments!!!

On 6/7/2021 8:20 PM, Srinivas Kandagatla wrote:
>
>
> On 05/06/2021 12:38, Srinivasa Rao Mandadapu wrote:
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
>> ---
>>   sound/soc/qcom/lpass-platform.c | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-platform.c 
>> b/sound/soc/qcom/lpass-platform.c
>> index 0df9481ea4c6..f220a2739ac3 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -526,7 +526,7 @@ static int lpass_platform_pcmops_trigger(struct 
>> snd_soc_component *component,
>>               return -EINVAL;
>>           }
>>   -        ret = regmap_write(map, reg_irqclr, val_irqclr);
>> +        ret = regmap_update_bits(map, reg_irqclr, val_irqclr, 
>> val_irqclr);
>>           if (ret) {
>>               dev_err(soc_runtime->dev, "error writing to irqclear 
>> reg: %d\n", ret);
>>               return ret;
>> @@ -650,7 +650,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>       struct lpass_variant *v = drvdata->variant;
>>       irqreturn_t ret = IRQ_NONE;
>>       int rv;
>> -    unsigned int reg = 0, val = 0;
>> +    unsigned int reg, val, val_clr, val_mask;
>
> minor nit here, variable name val_clr is pretty confusing to readers, 
> It might be okay for irq clr register but we are using the same name 
> of writing to other registers. So can I suggest you to reuse val 
> variable.
>
> other thing is val_mask, please rename this to mask and just set it in 
> the start of function so you can avoid 3 extra lines below.
Ok will do accordingly and repost patch.
>
> Other than that patch looks good to me!
>
> --srini
>>       struct regmap *map;
>>       unsigned int dai_id = cpu_dai->driver->id;
>>   @@ -676,8 +676,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>       return -EINVAL;
>>       }
>>       if (interrupts & LPAIF_IRQ_PER(chan)) {
>> -
>> -        rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
>> +        val_clr = LPAIF_IRQ_PER(chan) | val;
>> +        val_mask = LPAIF_IRQ_ALL(chan);
>> +        rv = regmap_update_bits(map, reg, val_mask, val_clr);
>>           if (rv) {
>>               dev_err(soc_runtime->dev,
>>                   "error writing to irqclear reg: %d\n", rv);
>> @@ -688,7 +689,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>       }
>>         if (interrupts & LPAIF_IRQ_XRUN(chan)) {
>> -        rv = regmap_write(map, reg, LPAIF_IRQ_XRUN(chan) | val);
>> +        val_clr = (LPAIF_IRQ_XRUN(chan) | val);
>> +        val_mask = LPAIF_IRQ_ALL(chan);
>> +        rv = regmap_update_bits(map, reg, val_mask, val_clr);
>>           if (rv) {
>>               dev_err(soc_runtime->dev,
>>                   "error writing to irqclear reg: %d\n", rv);
>> @@ -700,7 +703,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>       }
>>         if (interrupts & LPAIF_IRQ_ERR(chan)) {
>> -        rv = regmap_write(map, reg, LPAIF_IRQ_ERR(chan) | val);
>> +        val_clr = (LPAIF_IRQ_ERR(chan) | val);
>> +        val_mask = LPAIF_IRQ_ALL(chan);
>> +        rv = regmap_update_bits(map, reg, val_mask, val_clr);
>>           if (rv) {
>>               dev_err(soc_runtime->dev,
>>                   "error writing to irqclear reg: %d\n", rv);
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


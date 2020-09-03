Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3143325BE76
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 11:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgICJa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 05:30:27 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:52612 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726268AbgICJa0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 05:30:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599125425; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=V17ZsaD5D2v/6h9zbhOSana048DQtYuDfWpBwCQbkzU=; b=B15W3vPXz638HDNlWPB07W12rIsweAAdsqZ/2h1lH5MaslPEWB2sh+5kpfsz5vFY6Nom1jzr
 G2Hb8DycBIIrac5vJ36r87YtnHA+lxQ9NsC1cIhOfLU/1tQG+92VIVxR56iZoI9zo3fj95Bj
 WJyf5fo5t2cVvTAygk8eTXIb9mA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f50b78d698ee477d1af4191 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 09:29:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3F15FC4339C; Thu,  3 Sep 2020 09:29:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.172.121] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 06E20C433C9;
        Thu,  3 Sep 2020 09:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 06E20C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
 <159894579447.334488.1604209140945740724@swboyd.mtv.corp.google.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <36672d15-78bf-ffe7-71a3-4a7ed8664149@codeaurora.org>
Date:   Thu, 3 Sep 2020 14:59:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <159894579447.334488.1604209140945740724@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen for your time for review!!!

On 9/1/2020 1:06 PM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2020-08-30 23:39:22)
>> diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
>> new file mode 100644
>> index 0000000..7e18113
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-hdmi.c
>> @@ -0,0 +1,684 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
> [...]
>> +
>> +static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substream,
>> +               struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>> +{
> [...]
>> +       data_format = LPASS_DATA_FORMAT_LINEAR;
>> +       ch_sts_buf0 = (((data_format << LPASS_DATA_FORMAT_SHIFT) & LPASS_DATA_FORMAT_MASK)
>> +                               | ((sampling_freq << LPASS_FREQ_BIT_SHIFT) & LPASS_FREQ_BIT_MASK));
>> +       ch_sts_buf1 = (word_length) & LPASS_WORDLENGTH_MASK;
>> +
>> +       ret = regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_CTL_RESET);
>> +       if (ret) {
>> +               dev_err(dai->dev, "%s error writing to softreset enable : %d\n",
> All of these strings bloat the kernel image. Can we just return ret
> instead and if something goes wrong we can use a debug patch to figure
> out which register write failed? Would a register write even fail to
> begin with?
Will remove wherever possible.
>
>> +                                       __func__, ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_CTL_CLEAR);
>> +       if (ret) {
>> +               dev_err(dai->dev, "%s error writing to softreset disable : %d\n",
>> +                                       __func__, ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = regmap_field_write(drvdata->legacy->legacy_en,
>> +                               LPASS_HDMITX_LEGACY_DISABLE);
>> +       if (ret) {
>> +               dev_err(dai->dev, "%s error writing to legacy_en field : %d\n",
>> +                                       __func__, ret);
>> +               return ret;
>> +       }
>> +
> [...]
>>   #define LPAIF_DMACTL_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, CTL)
>>   #define LPAIF_DMABASE_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, BASE)
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index df692ed..607f4c4 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -553,7 +702,21 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
>>   
>>          /* Handle per channel interrupts */
>>          for (chan = 0; chan < LPASS_MAX_DMA_CHANNELS; chan++) {
>> -               if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->substream[chan]) {
>> +               switch (v->id) {
>> +               case HDMI_INTERFACE:
>> +                       val = LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan) |
>> +                               LPAIF_IRQ_HDMI_METADONE |
>> +                               LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan);
>> +                       break;
>> +               case I2S_INTERFACE:
>> +                       val = 0;
>> +                       break;
>> +               default:
>> +                       pr_err("%s: invalid  %d interface\n", __func__, v->id);
> Any reason we can't use dev_err() here?

It's interrupt handler. Here dev variable is not available.

So we shall remove print as per your previous comment or keep as it is.

>
>> +                       return -EINVAL;
>> +               }
>> +               if (irqs & (LPAIF_IRQ_ALL(chan) | val)
>> +                       && drvdata->substream[chan]) {
>>                          rv = lpass_dma_interrupt_handler(
>>                                                  drvdata->substream[chan],
>>                                                  drvdata, chan, irqs);
>> @@ -644,15 +807,15 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>>   
>>          /* ensure audio hardware is disabled */
>>          ret = regmap_write(drvdata->lpaif_map,
>> -                       LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0);
>> +                       IRQ_EN(v, LPAIF_IRQ_PORT_HOST), 0);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "error writing to irqen reg: %d\n", ret);
>>                  return ret;
>>          }
>>   
>>          ret = devm_request_irq(&pdev->dev, drvdata->lpaif_irq,
>> -                       lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,
>> -                       "lpass-irq-lpaif", drvdata);
>> +               lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,
> Can we use the irq flags from the firmware, i.e. whatever the DT or ACPI
> tables say?
okay.
>
>> +               pdev->name, drvdata);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "irq request failed: %d\n", ret);
>>                  return ret;

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


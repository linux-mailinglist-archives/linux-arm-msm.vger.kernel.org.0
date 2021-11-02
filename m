Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905F4442C08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 12:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhKBLEv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 07:04:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:13821 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhKBLEn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 07:04:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635850929; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=qXzp9Dq3okeTeCCG2IPt/sqOPmtUhJPZ3qV0EbiFkQo=; b=Ouy0qSQBJEIGpYqO81R4pohGM95pPrdpUjSQLyIDN7pc/YOD9daVSkdB2/MKkANQV11GIaIk
 hzro0B593zYK9CFp74BTkzxtbhzt1DiAgC4+cIEAmKV3QAxVrSVj0+c2iX1H1OIhd2QJHi01
 thXqhvf8Hhl2EaCbDmsLaW2AlQE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61811a94c8c1b282a56f6d21 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 11:01:40
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25BD7C4360C; Tue,  2 Nov 2021 11:01:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76430C43616;
        Tue,  2 Nov 2021 11:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 76430C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v4 2/2] ASoC: qcom: SC7280: Add machine driver
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-3-git-send-email-srivasam@codeaurora.org>
 <CAE-0n51zXLZiaB9aCdv=p_Wcxr5ZEdN-=b1hd5VATL6-CD0vRw@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <ee81276a-0715-0e55-9944-6c021075911e@codeaurora.org>
Date:   Tue, 2 Nov 2021 16:31:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51zXLZiaB9aCdv=p_Wcxr5ZEdN-=b1hd5VATL6-CD0vRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/30/2021 12:40 AM, Stephen Boyd wrote:
Thanks for our time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:36)
>> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
>> index cc7c1de..d9ffcb7 100644
>> --- a/sound/soc/qcom/Kconfig
>> +++ b/sound/soc/qcom/Kconfig
>> @@ -152,4 +152,16 @@ config SND_SOC_SC7180
>>            SC7180 SoC-based systems.
>>            Say Y if you want to use audio device on this SoCs.
>>
>> +config SND_SOC_SC7280
>> +       tristate "SoC Machine driver for SC7280 boards"
>> +       depends on I2C && SOUNDWIRE
> Add || COMPILE_TEST so we can compile test this driver?
Okay. Will add it.
>
>> +       select SND_SOC_QCOM_COMMON
>> +       select SND_SOC_MAX98357A
>> +       select SND_SOC_LPASS_RX_MACRO
>> +       select SND_SOC_LPASS_TX_MACRO
>> +       help
>> +         To add support for audio on Qualcomm Technologies Inc.
> Drop "To"?
Okay.
>
>> +         SC7280 SoC-based systems.
>> +         Say Y if you want to use audio device on this SoCs.
>> +
>>   endif #SND_SOC_QCOM
>> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
>> new file mode 100644
>> index 0000000..1d73b4f
>> --- /dev/null
>> +++ b/sound/soc/qcom/sc7280.c
>> @@ -0,0 +1,343 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +//
>> +// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> +//
>> +// sc7280.c -- ALSA SoC Machine driver for sc7280
> Please remove filename from the comment as it's not useful and may
> change.
Okay.
>> +
>> +#include <linux/gpio.h>
> [...]
>> +
>> +static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
>> +{
>> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>> +
>> +       switch (cpu_dai->id) {
>> +       case LPASS_CDC_DMA_RX0:
>> +       case LPASS_CDC_DMA_TX3:
>> +       case LPASS_CDC_DMA_VA_TX0:
>> +               break;
>> +       case MI2S_SECONDARY:
>> +               break;
>> +       case LPASS_DP_RX:
>> +               break;
>> +       default:
>> +               dev_err(rtd->dev, "%s: invalid dai id %d\n", __func__, cpu_dai->id);
>> +               break;
>> +       }
> The function doesn't do anything though. Why do we care?
Okay. will remove 'sc7280_snd_startup' and 'sc7280_snd_shutdown'.
>
>> +}
>> +
>> +static const struct snd_soc_ops sc7280_ops = {
>> +       .startup = sc7280_snd_startup,
>> +       .shutdown = sc7280_snd_shutdown,
>> +       .hw_params = sc7280_snd_hw_params,
>> +       .hw_free = sc7280_snd_hw_free,
>> +       .prepare = sc7280_snd_prepare,
>> +};
>> +
>> +static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
>> +       SND_SOC_DAPM_HP("Headphone Jack", NULL),
>> +       SND_SOC_DAPM_MIC("Headset Mic", NULL),
>> +};
>> +
>> +static int sc7280_snd_platform_probe(struct platform_device *pdev)
>> +{
>> +       struct snd_soc_card *card;
>> +       struct sc7280_snd_data *data;
>> +       struct device *dev = &pdev->dev;
>> +       struct snd_soc_dai_link *link;
>> +       int ret, i;
>> +
>> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +       if (!data)
>> +               return -ENOMEM;
>> +
>> +       card = &data->card;
>> +       snd_soc_card_set_drvdata(card, data);
>> +
>> +       card->owner = THIS_MODULE;
>> +       card->driver_name = "SC7280";
>> +       card->dev = dev;
>> +
>> +       ret = qcom_snd_parse_of(card);
>> +       if (ret)
>> +               return ret;
>> +
>> +       for_each_card_prelinks(card, i, link) {
>> +               link->init = sc7280_init;
>> +               link->ops = &sc7280_ops;
>> +       }
>> +
>> +       return devm_snd_soc_register_card(dev, card);
>> +}
>> +
>> +static const struct of_device_id sc7280_snd_device_id[]  = {
>> +       {.compatible = "google,sc7280-herobrine"},
> Please add space after { and before }
Okay.
>> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(of, sc7280_snd_device_id);

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


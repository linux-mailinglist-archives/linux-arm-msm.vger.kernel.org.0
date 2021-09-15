Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9CC40C418
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 13:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbhIOLHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Sep 2021 07:07:06 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33157 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232477AbhIOLHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Sep 2021 07:07:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631703947; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=oFYOphu9er1kSJGp6Y6sVZhQq4tL7St6PiF6qEExbaw=; b=hg292BcKvD9Ugr5AmraxJBpGCWBIupLzchzJE1M10BL6skJpkKhmAA0QgkkPzoZVt/R3RSyE
 SSJj+Vn4XeWwiNBIZmlnj6apYlRZ+/69A38XpbB8qNntQKqrxN2rk8Y+/vnRz3Z0Mofw3JDS
 7DusptkUsv3EUV+OQOMmAOJ/AXQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6141d378bd6681d8ed6d4ad2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Sep 2021 11:05:28
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B02B5C43619; Wed, 15 Sep 2021 11:05:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.137.170] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54B07C4338F;
        Wed, 15 Sep 2021 11:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 54B07C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 2/2] ASoC: qcom: SC7280: Add machine driver
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
References: <1631539062-28577-1-git-send-email-srivasam@codeaurora.org>
 <1631539062-28577-3-git-send-email-srivasam@codeaurora.org>
 <CAE-0n50i9rm6fcuyjCCPXjtxTyXwAiRVx91dXT4BDpbGA-tKjg@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <7e179a64-2fe8-e761-c247-90ba55fcba82@codeaurora.org>
Date:   Wed, 15 Sep 2021 16:35:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n50i9rm6fcuyjCCPXjtxTyXwAiRVx91dXT4BDpbGA-tKjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/14/2021 1:19 AM, Stephen Boyd wrote:

Thanks for Your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2021-09-13 06:17:42)
>> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
>> new file mode 100644
>> index 0000000..906910c
>> --- /dev/null
>> +++ b/sound/soc/qcom/sc7280.c
>> @@ -0,0 +1,343 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +//
>> +// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> +//
>> +// sc7280.c -- ALSA SoC Machine driver for sc7280
>> +
>> +#include <linux/gpio.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <sound/core.h>
>> +#include <sound/jack.h>
>> +#include <sound/pcm.h>
>> +#include <sound/soc.h>
>> +#include <uapi/linux/input-event-codes.h>
> Looks like the include should be <linux/input.h> instead. I see that
> practically no other code in the kernel is including the uapi header as
> it's for userspace, not kernel. The uapi header is included in input.h
> though so it's not actually all that different.
Okay Will change accordingly!!!
>
>> +
>> +#include <dt-bindings/sound/sc7180-lpass.h>
>> +#include <dt-bindings/sound/qcom,q6afe.h>
>> +
>> +#include "../codecs/wcd938x.h"
>> +#include "common.h"
>> +#include "lpass.h"
>> +
> [...]
>> +static int sc7280_snd_platform_probe(struct platform_device *pdev)
>> +{
>> +       struct snd_soc_card *card;
>> +       struct sc7280_snd_data *data;
>> +       struct device *dev = &pdev->dev;
>> +       struct snd_soc_dai_link *link;
>> +       int ret, i;
>> +
>> +       /* Allocate the private data */
> This comment is worthless.
Okay. Will remove it.
>
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
> Nitpick: Newline here.
Okay.
>
>> +       return devm_snd_soc_register_card(dev, card);
>> +}
>> +

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


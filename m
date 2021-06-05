Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09C639C772
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jun 2021 12:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhFEKdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 06:33:32 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:61202 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhFEKdb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 06:33:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622889104; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=ibQev18T9V9fkVqRTgCod7cdmgA96I6rIWCsroTRfWI=; b=q2fcjChzC2jP33eUdh+Hxgt+zasYlUYoCCV5aZMwOtmX+csZ/3VPHOzYKS46VXLKssIUKeb4
 XDg8YMklrYMNO0MH3ydVfXHrwpSDd+l7SLWY+aquiIG11Mj2E6fmC/vFU8EYE5A/fPNqLDCC
 7RoCEatfqRREFV9H10W+RVnyuyM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60bb527bf726fa41889cfaa2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 05 Jun 2021 10:31:23
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2347C43145; Sat,  5 Jun 2021 10:31:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.212.90] (unknown [157.48.166.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE40FC433F1;
        Sat,  5 Jun 2021 10:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE40FC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
References: <20210603050530.15898-1-srivasam@codeaurora.org>
 <CAE-0n52CyZkRDForR7LumXL7Tcr=48UV7T-wxirMsxk7AJJsmg@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <bea7d3f4-057a-7070-f493-3e625273212c@codeaurora.org>
Date:   Sat, 5 Jun 2021 16:01:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAE-0n52CyZkRDForR7LumXL7Tcr=48UV7T-wxirMsxk7AJJsmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for Your Time for review comments!!!

On 6/3/2021 11:47 AM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-06-02 22:05:30)
>> This patch fixes the DMA interrupt registers overwriting
>   $ git grep "This patch" -- Documentation/process
Okay will change description.
>
>> issue in lpass platform interrupt handler.
> Can you describe the issue more?
Sure. will elaborate more.
>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
> Any Fixes tag?
>
>>   sound/soc/qcom/lpass-platform.c | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index 0df9481ea4c6..e02caa121fa4 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -650,7 +650,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>          struct lpass_variant *v = drvdata->variant;
>>          irqreturn_t ret = IRQ_NONE;
>>          int rv;
>> -       unsigned int reg = 0, val = 0;
>> +       unsigned int reg = 0, val = 0, val_clr = 0, val_mask = 0;
> Why assign to 0 and then overwrite it?
Okay. Will remove initialization.
>
>>          struct regmap *map;
>>          unsigned int dai_id = cpu_dai->driver->id;
>>
>> @@ -676,8 +676,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>          return -EINVAL;
>>          }
>>          if (interrupts & LPAIF_IRQ_PER(chan)) {
>> -
>> -               rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
>> +               val_clr = (LPAIF_IRQ_PER(chan) | val);
> Is the extra parenthesis useful?
Not exactly. Will remove it.
>
>> +               val_mask = LPAIF_IRQ_ALL(chan);
>> +               rv = regmap_update_bits(map, reg, val_mask, val_clr);
>>                  if (rv) {
>>                          dev_err(soc_runtime->dev,
>>                                  "error writing to irqclear reg: %d\n", rv);

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


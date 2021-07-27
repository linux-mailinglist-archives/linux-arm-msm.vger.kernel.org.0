Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936433D74F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 14:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236419AbhG0MUx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 08:20:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11105 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231890AbhG0MUw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 08:20:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627388452; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=k497hUNnWYgJi8CkGD/uCFog89DShQgUcSehYrCMmnY=; b=STN3RhCOQGa+Iee21/YTKxH1rAqGcoUj/lK1y8SvPppuXa1U0rlOGD7+nT7lU9Z58xkY16AW
 xgIjTUWUIIAHBi121ewiGd7CpgI4uNyRa/6sVmJ2nS1LEmffI187R4U1Ww0BVD4CttHAtGea
 fr4/7UYm4P6e/BgRr55aPo6GWD0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60fffa0d1dd16c878889fb58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Jul 2021 12:20:29
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3DBA7C43217; Tue, 27 Jul 2021 12:20:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.50.41.208] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C59E9C433F1;
        Tue, 27 Jul 2021 12:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C59E9C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 2/3] nvmem: qfprom: sc7280: Handle the additional
 power-domains vote
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
References: <1626931716-10591-1-git-send-email-rnayak@codeaurora.org>
 <1626931716-10591-3-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=VHP9GbyueqrM1pJ-ZjgndYWj9Q6883pDHnZmK2mMYN2Q@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <8a50aa2c-4468-078c-36f5-74dde6dda16e@codeaurora.org>
Date:   Tue, 27 Jul 2021 17:50:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VHP9GbyueqrM1pJ-ZjgndYWj9Q6883pDHnZmK2mMYN2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/23/2021 10:13 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jul 21, 2021 at 10:29 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> On sc7280, to reliably blow fuses, we need an additional vote
>> on max performance state of 'MX' power-domain.
>> Add support for power-domain performance state voting in the
>> driver.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/nvmem/qfprom.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
>> index 81fbad5..4d0a576 100644
>> --- a/drivers/nvmem/qfprom.c
>> +++ b/drivers/nvmem/qfprom.c
>> @@ -12,6 +12,8 @@
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/nvmem-provider.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/property.h>
>>   #include <linux/regulator/consumer.h>
>>
>> @@ -149,6 +151,11 @@ static void qfprom_disable_fuse_blowing(const struct qfprom_priv *priv,
>>          if (ret)
>>                  dev_warn(priv->dev, "Failed to set 0 voltage (ignoring)\n");
>>
>> +       if (priv->dev->pm_domain) {
>> +               dev_pm_genpd_set_performance_state(priv->dev, 0);
>> +               pm_runtime_put(priv->dev);
>> +       }
>> +
>>          ret = regulator_disable(priv->vcc);
>>          if (ret)
>>                  dev_warn(priv->dev, "Failed to disable regulator (ignoring)\n");
>> @@ -212,6 +219,16 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>>                  goto err_clk_rate_set;
>>          }
>>
>> +       if (priv->dev->pm_domain) {
>> +               ret = pm_runtime_get_sync(priv->dev);
>> +               if (ret < 0) {
>> +                       pm_runtime_put_noidle(priv->dev);
>> +                       dev_err(priv->dev, "Failed to enable power-domain\n");
>> +                       goto err_reg_enable;
>> +               }
>> +               dev_pm_genpd_set_performance_state(priv->dev, INT_MAX);
>> +       }
>> +
>>          old->timer_val = readl(priv->qfpconf + QFPROM_BLOW_TIMER_OFFSET);
>>          old->accel_val = readl(priv->qfpconf + QFPROM_ACCEL_OFFSET);
>>          writel(priv->soc_data->qfprom_blow_timer_value,
>> @@ -221,6 +238,8 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>>
>>          return 0;
>>
>> +err_reg_enable:
>> +       regulator_disable(priv->vcc);
>>   err_clk_rate_set:
>>          clk_set_rate(priv->secclk, old->clk_rate);
>>   err_clk_prepared:
>> @@ -420,6 +439,9 @@ static int qfprom_probe(struct platform_device *pdev)
>>                          econfig.reg_write = qfprom_reg_write;
>>          }
>>
>> +       if (dev->pm_domain)
>> +               pm_runtime_enable(dev);
>> +
> 
> Where is the matching pm_runtime_disable()? Should be one in
> .remove(), or use devm_add_action_or_reset() to wrap a call to it.

Ah, right, i need to handle that.

> 
> Also: do you really need to test for dev->pm_domain in your patch?
> Seems like it should always be fine to call pm_runtime_enable() and
> then always fine to call the get/put. ...and presumably always fine to
> even set the performance state?

Sure, i'll give it a try and see if that works or ends up throwing me
any warns, i'll repost with that or update if that does not work for
some reason. thanks for the review.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

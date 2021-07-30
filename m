Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4733DB305
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 07:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236850AbhG3Fzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 01:55:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30526 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237181AbhG3Fzm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 01:55:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627624538; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=lYaNhuLnlPpaN4fXth6X4xr4/sxqYzupM5XAMywBIyc=; b=v0qOEQoEhdkJyanhMZ6YeGYOEW4nzSevUcXjAeCWYBLBFz2exRTRMUrGqK4sdnwrmpSBlG6b
 ulf75p/HUfGynYiHxND3bo8ZOM5TQlcAl0BEseQ5/t+dysysa/u6nCnqKRB0CIrNMJRwolpv
 SmGtvhMfrxf9eYDmw5PNl42kOn4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61039454e31d882d18741911 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 05:55:32
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9B094C433F1; Fri, 30 Jul 2021 05:55:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.203.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CC915C433F1;
        Fri, 30 Jul 2021 05:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CC915C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 2/3] nvmem: qfprom: sc7280: Handle the additional
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
References: <1627560036-1626-1-git-send-email-rnayak@codeaurora.org>
 <1627560036-1626-3-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=Wy6iyrty0tmygY42GJdWSNqby9XePjpg6pKpce-9A7fg@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <b9e7f3b9-6046-b1b2-5e8a-7036d54b5995@codeaurora.org>
Date:   Fri, 30 Jul 2021 11:25:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Wy6iyrty0tmygY42GJdWSNqby9XePjpg6pKpce-9A7fg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/29/2021 9:37 PM, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jul 29, 2021 at 5:01 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> On sc7280, to reliably blow fuses, we need an additional vote
>> on max performance state of 'MX' power-domain.
>> Add support for power-domain performance state voting in the
>> driver.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/nvmem/qfprom.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
>> index 81fbad5..b5f27df 100644
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
>> @@ -139,6 +141,9 @@ static void qfprom_disable_fuse_blowing(const struct qfprom_priv *priv,
>>   {
>>          int ret;
>>
>> +       dev_pm_genpd_set_performance_state(priv->dev, 0);
>> +       pm_runtime_put(priv->dev);
> 
> To me it feels as if this should be at the end of the function rather
> than the beginning. I guess it doesn't matter (?), but it feels wrong
> that we have writes to the register space after we're don't a
> pm_runtime_put().

Right, I was confused with this too when I saw that the other resources
(regulator/clocks) were also turned off before we write into the
register space. And then looking into the driver I realized its perhaps because
the resources are needed only for the 'raw' writes and the 'conf'
read/writes can happen regardless. I'll just fix that up and put the register
writes before we really turn off any resources to avoid confusion.

> 
> 
>> @@ -420,6 +440,12 @@ static int qfprom_probe(struct platform_device *pdev)
>>                          econfig.reg_write = qfprom_reg_write;
>>          }
>>
>> +       ret = devm_add_action_or_reset(dev, qfprom_runtime_disable, dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       pm_runtime_enable(dev);
>> +
> 
> Swap the order of the two. IOW first pm_runtime_enable(), then
> devm_add_action_or_reset(). Specifically the "_or_reset" means that if
> you fail to add the action (AKA devm_add_action() fails to allocate
> the tiny amount of memory it needs) it will actually _call_ the
> action. 

Ah, I didn't know that, thanks, I'll fix the order up and repost.

> That means that in your code if the memory allocation fails
> you'll call pm_runtime_disable() without the corresponding
> pm_runtime_enable().
> 
> 
> Other than those two issues this looks good to me. Feel free to add my
> Reviewed-by when you fix them.

Thanks.

> 
> -Doug
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

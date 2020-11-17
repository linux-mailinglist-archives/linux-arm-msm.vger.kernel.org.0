Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11842B6F5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 20:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730628AbgKQTwp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 14:52:45 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:28809 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730334AbgKQTwn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 14:52:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605642762; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=WsdB/sygkwY69K8EUxR5sel252TRykGMrAFHmho0KQs=; b=AxShop4XjZxprbABtYVmB8pnJoPf3aqpGT6D2b4Bza1Q0M2fFo79+73uNkdWIi5vOHH1PwvF
 /xxSrW4qfsTy/RG2ognxqVW90d6sj93kLnoxDsATY0Fk3nmmfRpUHWdRcEOQzyxntvvQ/BZA
 8dB1qontgTGQps4tRGpR8OU/qoc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fb42a07d6e6336a4e1e354a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Nov 2020 19:52:39
 GMT
Sender: clew=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B00AC433C6; Tue, 17 Nov 2020 19:52:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.142.6] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: clew)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CB420C433C6;
        Tue, 17 Nov 2020 19:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CB420C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=clew@codeaurora.org
Subject: Re: [PATCH 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1604373541-12641-1-git-send-email-clew@codeaurora.org>
 <3ae3e00dd8a6c2aacd852fca1f343779@codeaurora.org>
From:   Chris Lew <clew@codeaurora.org>
Message-ID: <2d10c46c-19b9-d1c1-04b9-531570edd446@codeaurora.org>
Date:   Tue, 17 Nov 2020 11:52:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <3ae3e00dd8a6c2aacd852fca1f343779@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/11/2020 10:33 AM, Sibi Sankar wrote:
> Hey Chris,
> Thanks for the patch.
> 
> On 2020-11-03 08:49, Chris Lew wrote:
>> Not all upcoming usecases will have an interface to allow the aoss
>> driver to hook onto. Expose the send api and create a get function to
>> enable drivers to send their own messages to aoss.
>>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
>> ---
>>  drivers/soc/qcom/qcom_aoss.c       | 28 +++++++++++++++++++++++++++-
>>  include/linux/soc/qcom/qcom_aoss.h | 33 
>> +++++++++++++++++++++++++++++++++
>>  2 files changed, 60 insertions(+), 1 deletion(-)
>>  create mode 100644 include/linux/soc/qcom/qcom_aoss.h
>>
>> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
>> index ed2c687c16b3..8f052db1880a 100644
>> --- a/drivers/soc/qcom/qcom_aoss.c
>> +++ b/drivers/soc/qcom/qcom_aoss.c
>> @@ -8,10 +8,12 @@
>>  #include <linux/io.h>
>>  #include <linux/mailbox_client.h>
>>  #include <linux/module.h>
>> +#include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_domain.h>
>>  #include <linux/thermal.h>
>>  #include <linux/slab.h>
>> +#include <linux/soc/qcom/qcom_aoss.h>
>>
>>  #define QMP_DESC_MAGIC            0x0
>>  #define QMP_DESC_VERSION        0x4
>> @@ -222,12 +224,15 @@ static bool qmp_message_empty(struct qmp *qmp)
>>   *
>>   * Return: 0 on success, negative errno on failure
>>   */
>> -static int qmp_send(struct qmp *qmp, const void *data, size_t len)
>> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
>>  {
>>      long time_left;
>>      size_t tlen;
>>      int ret;
>>
>> +    if (!qmp || !data)
>> +        return -EINVAL;
>> +
>>      if (WARN_ON(len + sizeof(u32) > qmp->size))
>>          return -EINVAL;
>>
>> @@ -261,6 +266,7 @@ static int qmp_send(struct qmp *qmp, const void
>> *data, size_t len)
>>
>>      return ret;
>>  }
>> +EXPORT_SYMBOL_GPL(qmp_send);
>>
>>  static int qmp_qdss_clk_prepare(struct clk_hw *hw)
>>  {
>> @@ -515,6 +521,26 @@ static void qmp_cooling_devices_remove(struct qmp 
>> *qmp)
>>          thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>>  }
>>
>> +/**
>> + * qmp_get() - get a qmp handle from device tree node
>> + * @np: of node of qmp device
>> + *
>> + * Return: handle to qmp device on success, ERR_PTR() on failure
>> + */
>> +struct qmp_device *qmp_get(struct device_node *np)
>> +{
>> +    struct platform_device *pdev;
>> +    struct qmp *qmp;
> 
> Can we use this patch series to determine
> the binding the client are expected to use
> to point to the qmp phandle and have it
> parsed here? This would mean that qmp_get
> would take in device as input instead.
> Bjorn suggested that clients use "qcom,qmp"
> during an offline discussion. Let me know
> what you think.
> 

Hey Sibi,

Yea I think that's a better implementation. I'll upload a second 
revision using "qcom,qmp" as the binding.

>> +
>> +    pdev = of_find_device_by_node(np);
>> +    if (!pdev)
>> +        return ERR_PTR(-EINVAL);
>> +
>> +    qmp = platform_get_drvdata(pdev);
>> +    return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
>> +}
>> +EXPORT_SYMBOL_GPL(qmp_get);
>> +
>>  static int qmp_probe(struct platform_device *pdev)
>>  {
>>      struct resource *res;
>> diff --git a/include/linux/soc/qcom/qcom_aoss.h
>> b/include/linux/soc/qcom/qcom_aoss.h
>> new file mode 100644
>> index 000000000000..05fc0ed3a10d
>> --- /dev/null
>> +++ b/include/linux/soc/qcom/qcom_aoss.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef __QCOM_AOSS_H__
>> +#define __QCOM_AOSS_H__
>> +
>> +#include <linux/err.h>
>> +#include <linux/of.h>
>> +
>> +struct qmp;
>> +
>> +#if IS_ENABLED(CONFIG_QCOM_AOSS_QMP)
>> +
>> +int qmp_send(struct qmp *qmp, const void *data, size_t len);
>> +struct qmp_device *qmp_get(struct device_node *np);
>> +
>> +#else
>> +
>> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
>> +{
>> +    return -ENODEV;
>> +}
>> +
>> +struct qmp *qmp_get(struct device_node *np)
>> +{
>> +    return ERR_PTR(-ENODEV);
>> +}
>> +
>> +#endif
>> +
>> +#endif
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project

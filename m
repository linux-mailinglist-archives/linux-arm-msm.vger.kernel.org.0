Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558783FC9E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 16:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237433AbhHaOge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 10:36:34 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58006 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232916AbhHaOgc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 10:36:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630420537; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=KWzIP/i79P8FuEohQk2NZj3eWVOYMAnmPzNacpkJcfM=; b=enlTu/aORtwBo3QUUtsSMhv7J/2K5ica/EhmYodwPnNV9LSFF9vEuDVoJ5d2cUccgW/L9P6t
 q4PwK+PKlToLbCOSZ73Uk+YDgOvNstA58r+AYxJuEp5cNQfit4niBB+P5WS6lKgC5Tz40gLV
 sYbpzORogOK6sAkSgemtMV9Z3ds=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 612e3e38d15f4d68a2d6157a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Aug 2021 14:35:36
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AFFE8C4360D; Tue, 31 Aug 2021 14:35:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.3] (unknown [106.202.140.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B624C4338F;
        Tue, 31 Aug 2021 14:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4B624C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH V7 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, clew@codeaurora.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <1630323451-7160-1-git-send-email-deesin@codeaurora.org>
 <1630323451-7160-2-git-send-email-deesin@codeaurora.org>
 <YS1o0u16pWa6iwPh@yoga>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <99112658-0991-f0ed-290c-ddf4f2580463@codeaurora.org>
Date:   Tue, 31 Aug 2021 20:05:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YS1o0u16pWa6iwPh@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/31/2021 4:55 AM, Bjorn Andersson wrote:
> On Mon 30 Aug 06:37 CDT 2021, Deepak Kumar Singh wrote:
>
>> Not all upcoming usecases will have an interface to allow the aoss
>> driver to hook onto. Expose the send api and create a get function to
>> enable drivers to send their own messages to aoss.
>>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
>> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>   drivers/soc/qcom/qcom_aoss.c       | 54 +++++++++++++++++++++++++++++++++++++-
>>   include/linux/soc/qcom/qcom_aoss.h | 38 +++++++++++++++++++++++++++
>>   2 files changed, 91 insertions(+), 1 deletion(-)
>>   create mode 100644 include/linux/soc/qcom/qcom_aoss.h
>>
>> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
>> index 934fcc4..bf0a6280 100644
>> --- a/drivers/soc/qcom/qcom_aoss.c
>> +++ b/drivers/soc/qcom/qcom_aoss.c
>> @@ -8,10 +8,12 @@
>>   #include <linux/io.h>
>>   #include <linux/mailbox_client.h>
>>   #include <linux/module.h>
>> +#include <linux/of_platform.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/thermal.h>
>>   #include <linux/slab.h>
>> +#include <linux/soc/qcom/qcom_aoss.h>
>>   
>>   #define QMP_DESC_MAGIC			0x0
>>   #define QMP_DESC_VERSION		0x4
>> @@ -223,11 +225,14 @@ static bool qmp_message_empty(struct qmp *qmp)
>>    *
>>    * Return: 0 on success, negative errno on failure
>>    */
>> -static int qmp_send(struct qmp *qmp, const void *data, size_t len)
>> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
>>   {
>>   	long time_left;
>>   	int ret;
>>   
>> +	if (WARN_ON(IS_ERR_OR_NULL(qmp) || !data))
>> +		return -EINVAL;
>> +
>>   	if (WARN_ON(len + sizeof(u32) > qmp->size))
>>   		return -EINVAL;
>>   
>> @@ -261,6 +266,7 @@ static int qmp_send(struct qmp *qmp, const void *data, size_t len)
>>   
>>   	return ret;
>>   }
>> +EXPORT_SYMBOL(qmp_send);
>>   
>>   static int qmp_qdss_clk_prepare(struct clk_hw *hw)
>>   {
>> @@ -515,6 +521,51 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
>>   		thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>>   }
>>   
>> +/**
>> + * qmp_get() - get a qmp handle from a device
>> + * @dev: client device pointer
>> + *
>> + * Return: handle to qmp device on success, ERR_PTR() on failure
>> + */
>> +struct qmp *qmp_get(struct device *dev)
>> +{
>> +	struct platform_device *pdev;
>> +	struct device_node *np;
>> +	struct qmp *qmp;
>> +
>> +	if (!dev || !dev->of_node)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
>> +	if (!np)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	pdev = of_find_device_by_node(np);
>> +	of_node_put(np);
>> +	if (!pdev)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	qmp = platform_get_drvdata(pdev);
>> +
>> +	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
>> +}
>> +EXPORT_SYMBOL(qmp_get);
>> +
>> +/**
>> + * qmp_put() - release a qmp handle
>> + * @qmp: qmp handle obtained from qmp_get()
>> + */
>> +void qmp_put(struct qmp *qmp)
>> +{
>> +	if (!IS_ERR_OR_NULL(qmp))
>> +		put_device(qmp->dev);
>> +	/*
>> +	 * Match get_device() inside of_find_device_by_node() in
>> +	 * qmp_get()
>> +	 */
> Afaict this comment relates to the put_device() above, which typically
> would imply that the comment should be above or inside the if
> statement?
I think it will be good to put before if block. Moved comment before if 
block in V8.
>> +}
>> +EXPORT_SYMBOL(qmp_put);
>> +
> Regards,
> Bjorn
>
>>   static int qmp_probe(struct platform_device *pdev)
>>   {
>>   	struct resource *res;
>> @@ -610,6 +661,7 @@ static struct platform_driver qmp_driver = {
>>   	.driver = {
>>   		.name		= "qcom_aoss_qmp",
>>   		.of_match_table	= qmp_dt_match,
>> +		.suppress_bind_attrs = true,
>>   	},
>>   	.probe = qmp_probe,
>>   	.remove	= qmp_remove,
>> diff --git a/include/linux/soc/qcom/qcom_aoss.h b/include/linux/soc/qcom/qcom_aoss.h
>> new file mode 100644
>> index 0000000..3c2a82e
>> --- /dev/null
>> +++ b/include/linux/soc/qcom/qcom_aoss.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef __QCOM_AOSS_H__
>> +#define __QCOM_AOSS_H__
>> +
>> +#include <linux/err.h>
>> +#include <linux/device.h>
>> +
>> +struct qmp;
>> +
>> +#if IS_ENABLED(CONFIG_QCOM_AOSS_QMP)
>> +
>> +int qmp_send(struct qmp *qmp, const void *data, size_t len);
>> +struct qmp *qmp_get(struct device *dev);
>> +void qmp_put(struct qmp *qmp);
>> +
>> +#else
>> +
>> +static inline int qmp_send(struct qmp *qmp, const void *data, size_t len)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +static inline struct qmp *qmp_get(struct device *dev)
>> +{
>> +	return ERR_PTR(-ENODEV);
>> +}
>> +
>> +static inline void qmp_put(struct qmp *qmp)
>> +{
>> +}
>> +
>> +#endif
>> +
>> +#endif
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

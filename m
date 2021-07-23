Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133073D3813
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 11:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhGWJLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 05:11:38 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11626 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbhGWJLh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 05:11:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627033931; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=tYrSO2v1n28HiQyEKrtZZMF4Ts4S6j7d7SH0Fl55WOE=; b=QYW890jVReQxKtWRTaEIsNa5ZA2a/o58bQG9BDh/nK3NKR/B1jGxtxpg4Zlhht6DDzg/RoNP
 KjxmSN0kvRcxDrc0+D7PJ3G1jQPgy/x9CBgOIuaT1F2Pn2TpGefcu7+MHZbScayvICYWyz9m
 pktwBr2OZXI81/EeiCykdUR0XZY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60fa914ab653fbdadd74e329 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 09:52:10
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2CF2AC4360C; Fri, 23 Jul 2021 09:52:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.3] (unknown [106.202.252.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 83443C433D3;
        Fri, 23 Jul 2021 09:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 83443C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
Subject: Re: [PATCH v4 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        Chris Lew <clew@codeaurora.org>
References: <1623237532-20829-1-git-send-email-sibis@codeaurora.org>
 <1623237532-20829-2-git-send-email-sibis@codeaurora.org>
 <CAE-0n506v5cmyUb+Ge-H7t1HsqNatgxDmq28rqdyGZDbsM4pXg@mail.gmail.com>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <eaa90fa6-e7a4-169d-4ac0-42f8c9545a5b@codeaurora.org>
Date:   Fri, 23 Jul 2021 15:21:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n506v5cmyUb+Ge-H7t1HsqNatgxDmq28rqdyGZDbsM4pXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/21/2021 12:07 PM, Stephen Boyd wrote:
> Quoting Sibi Sankar (2021-06-09 04:18:51)
>> From: Deepak Kumar Singh <deesin@codeaurora.org>
>>
>> Not all upcoming usecases will have an interface to allow the aoss
>> driver to hook onto. Expose the send api and create a get function to
>> enable drivers to send their own messages to aoss.
>>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
>> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>
>> v4:
>>   * Fix compilation error due to missing qmp_put
>>   * Minor typos [s/tarcks/tracks]
>>
>>   drivers/soc/qcom/qcom_aoss.c       | 70 ++++++++++++++++++++++++++++++++++++--
>>   include/linux/soc/qcom/qcom_aoss.h | 36 ++++++++++++++++++++
>>   2 files changed, 104 insertions(+), 2 deletions(-)
>>   create mode 100644 include/linux/soc/qcom/qcom_aoss.h
>>
>> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
>> index 934fcc4d2b05..e8f48760bac8 100644
>> --- a/drivers/soc/qcom/qcom_aoss.c
>> +++ b/drivers/soc/qcom/qcom_aoss.c
>> @@ -522,13 +582,14 @@ static int qmp_probe(struct platform_device *pdev)
>>          int irq;
>>          int ret;
>>
>> -       qmp = devm_kzalloc(&pdev->dev, sizeof(*qmp), GFP_KERNEL);
>> +       qmp = kzalloc(sizeof(*qmp), GFP_KERNEL);
>>          if (!qmp)
>>                  return -ENOMEM;
>>
>>          qmp->dev = &pdev->dev;
>>          init_waitqueue_head(&qmp->event);
>>          mutex_init(&qmp->tx_lock);
>> +       kref_init(&qmp->refcount);
>>
>>          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>          qmp->msgram = devm_ioremap_resource(&pdev->dev, res);
>> @@ -569,6 +630,8 @@ static int qmp_probe(struct platform_device *pdev)
>>
>>          platform_set_drvdata(pdev, qmp);
>>
>> +       atomic_set(&qmp->orphan, 0);
>> +
>>          return 0;
>>
>>   err_remove_qdss_clk:
>> @@ -577,6 +640,7 @@ static int qmp_probe(struct platform_device *pdev)
>>          qmp_close(qmp);
>>   err_free_mbox:
>>          mbox_free_channel(qmp->mbox_chan);
>> +       kfree(qmp);
>>
>>          return ret;
>>   }
>> @@ -590,7 +654,9 @@ static int qmp_remove(struct platform_device *pdev)
>>          qmp_cooling_devices_remove(qmp);
>>
>>          qmp_close(qmp);
>> +       atomic_set(&qmp->orphan, 1);
> This looks odd. Why are we letting the device be removed while it is in
> use by other drivers? Can't we pin the device with get_device() so it
> can't be removed and then prevent the driver from being removed until
> all the consumer drivers drop the reference, i.e. suppress sysfs unbind?
>
> Otherwise it looks like a generic problem that all provider devices,
> clks, regulators, gpios, etc. have to deal with and thus this
> hand-rolled mechanism can't be right.

As per my earlier discussion with Bjorn, device could be unbound using 
sysfs, in which case

remove() is called irrespective of whether any client driver is holding 
struct device reference

or not. That's why i have added separate refcount for qmp handle and 
marking it invalid if

qmp_remove() is called.

>>          mbox_free_channel(qmp->mbox_chan);
>> +       kref_put(&qmp->refcount, qmp_handle_release);
>>
>>          return 0;
>>   }

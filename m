Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742CB3FC9D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 16:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238203AbhHaOex (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 10:34:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10918 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238212AbhHaOet (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 10:34:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630420434; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=suAP7OpI5mXef+eBKru8jM6cCh54dYm12uN9GdHVDkc=; b=LNoma6EALKks0PbJhkxO+JAs/15m9yKkGMtkoUbqrr2CpdG2LxqAsFXkgExBs4rdxUmdP44M
 pxtocG9QmYlIH8ceJ5UM8vtd+Bgtla4Q5tDnPIO3fOxgoj5IbYiMxSPek/FvnwblgPpBIlap
 0yhBc2r9C6Ww3TSYAZUdqyIDwcw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 612e3dcd4f8fcf7054296fb9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Aug 2021 14:33:49
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CBC9FC43618; Tue, 31 Aug 2021 14:33:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.3] (unknown [106.202.140.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19648C43460;
        Tue, 31 Aug 2021 14:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 19648C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH V7 2/2] soc: qcom: aoss: Add debugfs entry
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, clew@codeaurora.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <1630323451-7160-1-git-send-email-deesin@codeaurora.org>
 <1630323451-7160-3-git-send-email-deesin@codeaurora.org>
 <YS1nSP8kziOPaDld@yoga>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <6b1c4368-72e2-79e4-37c5-d333bb6bec5d@codeaurora.org>
Date:   Tue, 31 Aug 2021 20:03:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YS1nSP8kziOPaDld@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/31/2021 4:48 AM, Bjorn Andersson wrote:
> On Mon 30 Aug 06:37 CDT 2021, Deepak Kumar Singh wrote:
>
>> Some user space clients may require to change power states of various
>> parts of hardware. Add a debugfs node for qmp so messages can be sent
>> to aoss from user space.
>>
> I think this could be a useful tool while testing and developing client
> drivers or perhaps during bringup of new platforms.
>
> But your new commit message doesn't sound right, given that debugfs
> isn't mounted in your production builds.
>
> Regards,
> Bjorn
Updated commit message in V8.
>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
>> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
>> ---
>>   drivers/soc/qcom/qcom_aoss.c | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
>> index bf0a6280..4cd8670 100644
>> --- a/drivers/soc/qcom/qcom_aoss.c
>> +++ b/drivers/soc/qcom/qcom_aoss.c
>> @@ -4,6 +4,7 @@
>>    */
>>   #include <dt-bindings/power/qcom-aoss-qmp.h>
>>   #include <linux/clk-provider.h>
>> +#include <linux/debugfs.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/io.h>
>>   #include <linux/mailbox_client.h>
>> @@ -86,6 +87,7 @@ struct qmp {
>>   	struct clk_hw qdss_clk;
>>   	struct genpd_onecell_data pd_data;
>>   	struct qmp_cooling_device *cooling_devs;
>> +	struct dentry *debugfs_file;
>>   };
>>   
>>   struct qmp_pd {
>> @@ -566,6 +568,31 @@ void qmp_put(struct qmp *qmp)
>>   }
>>   EXPORT_SYMBOL(qmp_put);
>>   
>> +static ssize_t aoss_dbg_write(struct file *file, const char __user *userstr,
>> +			      size_t len, loff_t *pos)
>> +{
>> +	struct qmp *qmp = file->private_data;
>> +	char buf[QMP_MSG_LEN] = {};
>> +	int ret;
>> +
>> +	if (!len || len >= QMP_MSG_LEN)
>> +		return -EINVAL;
>> +
>> +	ret  = copy_from_user(buf, userstr, len);
>> +	if (ret) {
>> +		return -EFAULT;
>> +	}
>> +
>> +	ret = qmp_send(qmp, buf, QMP_MSG_LEN);
>> +
>> +	return ret ? ret : len;
>> +}
>> +
>> +static const struct file_operations aoss_dbg_fops = {
>> +	.open = simple_open,
>> +	.write = aoss_dbg_write,
>> +};
>> +
>>   static int qmp_probe(struct platform_device *pdev)
>>   {
>>   	struct resource *res;
>> @@ -620,6 +647,9 @@ static int qmp_probe(struct platform_device *pdev)
>>   
>>   	platform_set_drvdata(pdev, qmp);
>>   
>> +	qmp->debugfs_file = debugfs_create_file("aoss_send_message", 0220, NULL,
>> +						qmp, &aoss_dbg_fops);
>> +
>>   	return 0;
>>   
>>   err_remove_qdss_clk:
>> @@ -636,6 +666,8 @@ static int qmp_remove(struct platform_device *pdev)
>>   {
>>   	struct qmp *qmp = platform_get_drvdata(pdev);
>>   
>> +	debugfs_remove(qmp->debugfs_file);
>> +
>>   	qmp_qdss_clk_remove(qmp);
>>   	qmp_pd_remove(qmp);
>>   	qmp_cooling_devices_remove(qmp);
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

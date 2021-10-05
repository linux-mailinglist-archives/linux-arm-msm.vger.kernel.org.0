Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B4942215D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 10:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbhJEI6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 04:58:24 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:55056 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbhJEI6Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 04:58:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633424193; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ME6k5ppnQNHOtBFfmVbGGGL200n+G2K+4nbw1O/P4E0=; b=GO5eE8y9WkLuudQlKlSquWqg+Q/VrC6YZAIG9ddB30XDG80Y7a/8SdPiGK1+VJ9A5Z+U0BQa
 XMEbnqTDGWnUA2FPcWBovv1q6IGcFl7s0JALLSIzsFgjpoVL0IsXjAGFoVw2bePfWPSXtPid
 USA6yxEyI5ZS7mBRnJxdU3avPzQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 615c133bfc6e34f8cd74f028 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 08:56:27
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4915BC4360D; Tue,  5 Oct 2021 08:56:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.85.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F71CC4338F;
        Tue,  5 Oct 2021 08:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1F71CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v9 2/5] soc: qcom: Add SoC sleep stats driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
References: <1630906083-32194-1-git-send-email-mkshah@codeaurora.org>
 <1630906083-32194-3-git-send-email-mkshah@codeaurora.org>
 <YU5dUlscQzGXloKc@builder.lan>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <8f76552b-76c6-d4f7-22d2-1dd61d191c00@codeaurora.org>
Date:   Tue, 5 Oct 2021 14:26:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YU5dUlscQzGXloKc@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 9/25/2021 4:50 AM, Bjorn Andersson wrote:
> On Mon 06 Sep 00:28 CDT 2021, Maulik Shah wrote:
> 
>> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>>
>> Let's add a driver to read the stats from remote processor and
>> export to debugfs.
>>
>> The driver creates "qcom_sleep_stats" directory in debugfs and
>> adds files for various low power mode available. Below is sample
>> output with command
>>
>> cat /sys/kernel/debug/qcom_sleep_stats/ddr
>> count = 0
>> Last Entered At = 0
>> Last Exited At = 0
>> Accumulated Duration = 0
>>
>> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> [mkshah: add subsystem sleep stats, create one file for each stat]
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/soc/qcom/Kconfig           |  10 ++
>>   drivers/soc/qcom/Makefile          |   1 +
>>   drivers/soc/qcom/soc_sleep_stats.c | 241 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 252 insertions(+)
>>   create mode 100644 drivers/soc/qcom/soc_sleep_stats.c
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 79b568f..e80b63a 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -190,6 +190,16 @@ config QCOM_SOCINFO
>>   	 Say yes here to support the Qualcomm socinfo driver, providing
>>   	 information about the SoC to user space.
>>   
>> +config QCOM_SOC_SLEEP_STATS
>> +	tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver"
>> +	depends on ARCH_QCOM && DEBUG_FS || COMPILE_TEST
>> +	depends on QCOM_SMEM
>> +	help
>> +	  Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver to read
>> +	  the shared memory exported by the remote processor related to
>> +	  various SoC level low power modes statistics and export to debugfs
>> +	  interface.
>> +
>>   config QCOM_WCNSS_CTRL
>>   	tristate "Qualcomm WCNSS control driver"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index ad675a6..5f30d74 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -20,6 +20,7 @@ obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>>   obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>>   obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>>   obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
>> +obj-$(CONFIG_QCOM_SOC_SLEEP_STATS)	+= soc_sleep_stats.o
> 
> I know that the rest of the modules here does a bad job and have
> completely generic names, but could we rename this "qcom_sleep_stats"
> instead?

Sure renamed in v10.

> 
>>   obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
>>   obj-$(CONFIG_QCOM_APR) += apr.o
>>   obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
> [..]
>> +static int qcom_soc_sleep_stats_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res;
>> +	void __iomem *reg;
>> +	struct dentry *root;
>> +	const struct stats_config *config;
>> +	struct stats_data *d;
>> +	int i;
>> +
>> +	config = device_get_match_data(&pdev->dev);
>> +	if (!config)
>> +		return -ENODEV;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return PTR_ERR(res);
> 
> You no longer use this "res".

Thanks for catching this, removed in v10.

> 
>> +
>> +	reg = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>> +	if (!reg)
> 
> IS_ERR()

Updated in v10 to use IS_ERR().

> 
>> +		return -ENOMEM;
>> +
>> +	d = devm_kcalloc(&pdev->dev, config->num_records,
>> +			 sizeof(*d), GFP_KERNEL);
>> +	if (!d)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < config->num_records; i++)
>> +		d[i].appended_stats_avail = config->appended_stats_avail;
>> +
>> +	root = debugfs_create_dir("qcom_sleep_stats", NULL);
>> +
>> +	qcom_create_subsystem_stat_files(root);
>> +	qcom_create_soc_sleep_stat_files(root, reg, d, config->num_records);
>> +
>> +	platform_set_drvdata(pdev, root);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_soc_sleep_stats_remove(struct platform_device *pdev)
>> +{
>> +	struct dentry *root = platform_get_drvdata(pdev);
>> +
>> +	debugfs_remove_recursive(root);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct stats_config rpm_data = {
>> +	.num_records = 2,
>> +	.appended_stats_avail = true,
>> +};
>> +
>> +static const struct stats_config rpmh_data = {
>> +	.num_records = 3,
>> +	.appended_stats_avail = false,
>> +};
>> +
>> +static const struct of_device_id qcom_soc_sleep_stats_table[] = {
>> +	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data },
>> +	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data },
>> +	{ }
>> +};
> 
> MODULE_DEVICE_TABLE(of, qcom_soc_sleep_stats_table);
> 
> Otherwise the module doesn't load automatically.
> 
> Regards,
> Bjorn

Added MODULE_DEVICE_TABLE in v10.

Thanks,
Maulik

> 
>> +
>> +static struct platform_driver soc_sleep_stats = {
>> +	.probe = qcom_soc_sleep_stats_probe,
>> +	.remove = qcom_soc_sleep_stats_remove,
>> +	.driver = {
>> +		.name = "soc_sleep_stats",
>> +		.of_match_table = qcom_soc_sleep_stats_table,
>> +	},
>> +};
>> +module_platform_driver(soc_sleep_stats);
>> +
>> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) SoC Sleep Stats driver");
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation

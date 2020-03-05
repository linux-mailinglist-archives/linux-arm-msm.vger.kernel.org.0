Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79CE217A008
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 07:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgCEGhZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 01:37:25 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:12156 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725880AbgCEGhY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 01:37:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583390244; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EF+8M3YkWc0sKH/xiSisE+nDCg2DHtX+beC8NaZAuFo=; b=ibJ0QGOmEkfSA/QhXXthQmdtWzpJ50yE5HwonSc5JDpbXtLhnBjScKJvayk4/e1EYs/F/1jh
 MJD093GBNpLqtVSq08Hbji4H2DqxJ0aMi9kqUu3FCdNzlAvAOIMqRmy4EOpDwETt7LiO0T6I
 t9F4viw212CEH/Dl8qsuzR22P2w=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e609e14.7f0b9d0b0068-smtp-out-n05;
 Thu, 05 Mar 2020 06:37:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2920CC447A2; Thu,  5 Mar 2020 06:37:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.116.232] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82318C43383;
        Thu,  5 Mar 2020 06:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82318C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [RFC][PATCH] soc: qcom: rpmpd: Allow RPMPD driver to be loaded as
 a module
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <20200305054244.128950-1-john.stultz@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <9ff7b615-8b8f-d3ba-e6f3-e3cee6ff58b2@codeaurora.org>
Date:   Thu, 5 Mar 2020 12:07:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305054244.128950-1-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/5/2020 11:12 AM, John Stultz wrote:
> Allow the rpmpd driver to be loaded as a module.

The last time I tried this [1], I hit a limitation with pm_genpd_remove not cleaning up things right,
is that solved now?

[1] https://lkml.org/lkml/2019/1/17/1043

> 
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/soc/qcom/Kconfig | 4 ++--
>   drivers/soc/qcom/rpmpd.c | 5 ++++-
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index d0a73e76d563..af774555b9d2 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -123,8 +123,8 @@ config QCOM_RPMHPD
>   	  for the voltage rail.
>   
>   config QCOM_RPMPD
> -	bool "Qualcomm RPM Power domain driver"
> -	depends on QCOM_SMD_RPM=y
> +	tristate "Qualcomm RPM Power domain driver"
> +	depends on QCOM_SMD_RPM
>   	help
>   	  QCOM RPM Power domain driver to support power-domains with
>   	  performance states. The driver communicates a performance state
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 2b1834c5609a..9c0834913f3f 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -5,6 +5,7 @@
>   #include <linux/init.h>
>   #include <linux/kernel.h>
>   #include <linux/mutex.h>
> +#include <linux/module.h>
>   #include <linux/pm_domain.h>
>   #include <linux/of.h>
>   #include <linux/of_device.h>
> @@ -226,6 +227,7 @@ static const struct of_device_id rpmpd_match_table[] = {
>   	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(of, rpmpd_match_table);
>   
>   static int rpmpd_send_enable(struct rpmpd *pd, bool enable)
>   {
> @@ -421,4 +423,5 @@ static int __init rpmpd_init(void)
>   {
>   	return platform_driver_register(&rpmpd_driver);
>   }
> -core_initcall(rpmpd_init);
> +module_init(rpmpd_init);
> +MODULE_LICENSE("GPL");
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

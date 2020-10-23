Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD1D296B59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 10:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S460734AbgJWIlK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 04:41:10 -0400
Received: from z5.mailgun.us ([104.130.96.5]:52623 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S460731AbgJWIlJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 04:41:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603442469; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LCmeHCOs9qwn7TJnDdHFcNXrHG+f4BEo05MVSmdVyzw=;
 b=UXADcK1RpN2T2TSrLbWo3gWGFB3EqK8/O/fpyDo8lF1lWQizFs0a/QZ0qaiu2Iamu+rrmAKs
 QS2a3PZ18orTQwo4OrYUFHLxNWkHYeXg7B1MdDBUODKQtcxqkqANvarHlo0HPIIaoksvVlQV
 tLKgarSunU0J7B66swPxbnYr0qA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f92972457b88ccb56c80871 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Oct 2020 08:41:08
 GMT
Sender: hyiwei=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5CFA9C433F0; Fri, 23 Oct 2020 08:41:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hyiwei)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E07FFC433CB;
        Fri, 23 Oct 2020 08:41:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 23 Oct 2020 16:41:07 +0800
From:   hyiwei@codeaurora.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     jassisinghbrar@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, psodagud@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mailbox: qcom: Support building QCOM IPCC driver as
 module
In-Reply-To: <20201021055955.GA4223@Mani-XPS-13-9360>
References: <1603246552-23601-1-git-send-email-hyiwei@codeaurora.org>
 <20201021055955.GA4223@Mani-XPS-13-9360>
Message-ID: <38568f154ebe2fc049fb8e46f5256b20@codeaurora.org>
X-Sender: hyiwei@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-21 13:59, Manivannan Sadhasivam wrote:
> Hi,
> 
> Please CC the driver maintainer(s) for relevant patches. For this 
> driver,
> I've been listed as the maintainer in the MAINTAINERS file.
> 
> On Wed, Oct 21, 2020 at 10:15:52AM +0800, Huang Yiwei wrote:
>> Change CONFIG_QCOM_IPCC to tristate and add exit function to
>> support module build for QCOM IPCC driver.
>> 
> 
> This is not going to work, sorry! There was a reason to make this 
> driver
> built-in in the first place. This driver registers itself as an irqchip 
> and
> provides interrupts to be consumed by the client drivers. So if we want 
> to
> unload the driver, then we should make sure to dispose all irqs 
> consumed by
> the client drivers and that's not possible currently. If you look into 
> other
> irqchip drivers, they're all made as built-in.
> 
> Thanks,
> Mani
> 
Hi,

We need the module build of IPCC to meet the need of Android GKI, which
requires all vendor drivers to be modules.
After discussion, we think there are three ways to achieve the goal:
1. Remove the exit function, just change the Kconfig to make it a module
cannot be unloaded.
2. Add more checks to ensure the module can be unloaded safely. If user
try to unload when it is in use, return busy.
3. If unable to change the Kconfig, we will have to ask google to make
this driver built-in. This can be difficult because other vendors don't
need this driver.
We understood that mostly irqchip driver is builtin and not easy for
unload. So we prefer the first way, that's the easiest and most 
reasonable
way.

Thanks,
Yiwei

>> Signed-off-by: Huang Yiwei <hyiwei@codeaurora.org>
>> ---
>>  drivers/mailbox/Kconfig     | 2 +-
>>  drivers/mailbox/qcom-ipcc.c | 6 ++++++
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
>> index 05b1009..78f3006 100644
>> --- a/drivers/mailbox/Kconfig
>> +++ b/drivers/mailbox/Kconfig
>> @@ -245,7 +245,7 @@ config SPRD_MBOX
>>  	  you want to build the Spreatrum mailbox controller driver.
>> 
>>  config QCOM_IPCC
>> -	bool "Qualcomm Technologies, Inc. IPCC driver"
>> +	tristate "Qualcomm Technologies, Inc. IPCC driver"
>>  	depends on ARCH_QCOM || COMPILE_TEST
>>  	help
>>  	  Qualcomm Technologies, Inc. Inter-Processor Communication 
>> Controller
>> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
>> index 2d13c72..1ed9a87 100644
>> --- a/drivers/mailbox/qcom-ipcc.c
>> +++ b/drivers/mailbox/qcom-ipcc.c
>> @@ -280,6 +280,12 @@ static int __init qcom_ipcc_init(void)
>>  }
>>  arch_initcall(qcom_ipcc_init);
>> 
>> +static __exit void qcom_ipcc_exit(void)
>> +{
>> +	platform_driver_unregister(&qcom_ipcc_driver);
>> +}
>> +module_exit(qcom_ipcc_exit);
>> +
>>  MODULE_AUTHOR("Venkata Narendra Kumar Gutta 
>> <vnkgutta@codeaurora.org>");
>>  MODULE_AUTHOR("Manivannan Sadhasivam 
>> <manivannan.sadhasivam@linaro.org>");
>>  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. IPCC driver");
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

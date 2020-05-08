Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C8C1CA699
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 10:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgEHIxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 04:53:31 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:60984 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725774AbgEHIxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 04:53:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588928009; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=izonpifA+1EYd8UgQ+Vm38HVhqg6VLQAcixpWCMi9fg=;
 b=jp+a/QjsQnkrGls+yyLz/LXLdYsj4dg+cu5fgsP4AFJXzIrpHqiNd2VGr5/k/hJHmMNm2dLB
 l+tG6FOTIbndMkZcXAbCFcF9Zd0qGlPyddBHUezkwVBdNhMd4DFV3HfsAeU//G/lY390N4Rr
 VWFTLvR8gG56gyZgLD8VxJRVT6k=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb51e08.7fd92b47cae8-smtp-out-n05;
 Fri, 08 May 2020 08:53:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90D28C43636; Fri,  8 May 2020 08:53:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D608EC433F2;
        Fri,  8 May 2020 08:53:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 08 May 2020 14:23:27 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple
 connections
In-Reply-To: <b8c1cc35846d425a1677c73fddf5874d@codeaurora.org>
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com>
 <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
 <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com>
 <668ea1283a6dd6b34e701972f6f71034@codeaurora.org>
 <5b0f5d77c4eec22d8048bb0ffa078345@codeaurora.org>
 <759d47de-2101-39cf-2f1c-cfefebebd548@arm.com>
 <7d343e96cf0701d91152fd14c2fdec42@codeaurora.org>
 <CAJ9a7VgEiX19ukjwakNHBHDeZJ05f5Z7pAYG9iEnpXCuuDfBqg@mail.gmail.com>
 <a4bba03d41a2b0145b3c6c19d48698eb@codeaurora.org>
 <CAJ9a7Vj4eyv1n=RxuqfV=pdBN3SDG+ShYS5J4s40KJtqOnR7vw@mail.gmail.com>
 <ae0fe2050be01cc1403c7d53a0da8cb8@codeaurora.org>
 <b8c1cc35846d425a1677c73fddf5874d@codeaurora.org>
Message-ID: <eee1b9a90266eed9a9c75401f0679777@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki, Mike,

On 2020-05-06 13:05, Sai Prakash Ranjan wrote:
[...]

>>>> 
>>> OK - sorry I read your statement saying that replicator1 was 0 after
>>> the reset in probe(), rather than look at the logs.
>>> 
>>> From the logs it is working at the time probe() occurs, but by the
>>> time we come to enable the replicator later, something has reset 
>>> these
>>> registers / hardware outside the control of the replicator driver.
>>> 
>> 
>> Yes, I will try to get some more information from the firmware side if
>> there is anything messing up.
>> 
> 
> This turned out to be a clock/pm issue. To confirm, I just marked clk
> as critical
> so that it won't be gated and I saw the replicator1(swao_replicator) 
> registers
> intact after probe. Also alternatively, I tried to comment out 
> disabling pclk
> to check if there is something wrong in amba pm and this keeps the 
> registers
> intact as well.
> 
> @@ -288,7 +295,7 @@ static int amba_probe(struct device *dev)
>                 pm_runtime_set_suspended(dev);
>                 pm_runtime_put_noidle(dev);
> 
> -               amba_put_disable_pclk(pcdev);
> +               //amba_put_disable_pclk(pcdev);
>                 dev_pm_domain_detach(dev, true);
>         } while (0);
> 

I checked with the debug team and there is a limitation with
the replicator(swao_replicator) in the AOSS group where it
loses the idfilter register context when the clock is disabled.
This is not just in SC7180 SoC but also reported on some latest
upcoming QCOM SoCs as well and will need to be taken care in
order to enable coresight on these chipsets.

Here's what's happening -  After the replicator is initialized,
the clock is disabled in amba_pm_runtime_suspend() as a part of
pm runtime workqueue with the assumption that there will be no
loss of context after the replicator is initialized. But it doesn't
hold good with the replicators with these unfortunate limitation
and the idfilter register context is lost.

[    5.889406] amba_pm_runtime_suspend devname=6b06000.replicator ret=0
[    5.914516] Workqueue: pm pm_runtime_work
[    5.918648] Call trace:
[    5.921185]  dump_backtrace+0x0/0x1d0
[    5.924958]  show_stack+0x2c/0x38
[    5.928382]  dump_stack+0xc0/0x104
[    5.931896]  amba_pm_runtime_suspend+0xd8/0xe0
[    5.936469]  __rpm_callback+0xe0/0x140
[    5.940332]  rpm_callback+0x38/0x98
[    5.943926]  rpm_suspend+0xec/0x618
[    5.947522]  rpm_idle+0x5c/0x3f8
[    5.950851]  pm_runtime_work+0xa8/0xc0
[    5.954718]  process_one_work+0x1f8/0x4c0
[    5.958848]  worker_thread+0x50/0x468
[    5.962623]  kthread+0x12c/0x158
[    5.965957]  ret_from_fork+0x10/0x1c

This is a platform/SoC specific replicator issue, so we can either
introduce some DT property for replicators to identify which replicator
has this limitation, check in replicator_enable() and reset the 
registers
or have something like below diff to check the idfilter registers in
replicator_enable() and then reset with clear comment specifying it’s 
the
hardware limitation on some QCOM SoCs. Please let me know your thoughts 
on
this?

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c 
b/drivers/hwtracing/coresight/coresight-replicator.c
index e7dc1c31d20d..a9c039c944eb 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -68,6 +68,17 @@ static int dynamic_replicator_enable(struct 
replicator_drvdata *drvdata,
         int rc = 0;
         u32 reg;

+       /*
+        * On some QCOM SoCs with replicators in Always-On domain, 
disabling
+        * clock will result in replicator losing its context. Currently
+        * as a part of pm_runtime workqueue, amba_pm_runtime_suspend 
disables
+        * clock assuming the context is not lost which is not true for 
cases
+        * with hardware limitations as the above.
+        */
+       if ((readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0) == 0) 
&&
+           (readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1) == 0))
+               dynamic_replicator_reset(drvdata);
+
         switch (outport) {
         case 0:
                 reg = REPLICATOR_IDFILTER0;



Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

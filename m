Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360931C6A24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 09:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbgEFHfj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 03:35:39 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:25098 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728069AbgEFHfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 03:35:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588750537; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wrYpcoVK8IdDRtNBeHLzn6UFclCXY1INuT6aKv4B83U=;
 b=aF0DgDhlT8jz8g2jt37DqxPnOsE5ublK9Lr1n3czeC5/edj+Nk9O+TMz/qfllmO1z2VhjMhG
 VPQyaRwbIdqYvcidhGgd64vG+vsWHocAw/9zvpt2w7sLhQRBgtVmisweYQNWUMFcw+oMVZ8b
 xC6aOb7o6z7CeqVp/KUVMOJq2qE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb268ba.7fd5852e1880-smtp-out-n01;
 Wed, 06 May 2020 07:35:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 23F7AC4478F; Wed,  6 May 2020 07:35:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EFC3C433F2;
        Wed,  6 May 2020 07:35:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 06 May 2020 13:05:21 +0530
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
In-Reply-To: <ae0fe2050be01cc1403c7d53a0da8cb8@codeaurora.org>
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
Message-ID: <b8c1cc35846d425a1677c73fddf5874d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki, Mike,

On 2020-04-29 22:41, Sai Prakash Ranjan wrote:
> Hi Mike,
> 
> On 2020-04-29 22:28, Mike Leach wrote:
>> Hi,
>> 
> 
> [...]
> 
>>> >> > You need to find what is resetting the IDFILTERs to 0 for replicator1.
>>> >> >
>>> >>
>>> >> That is right.
>>> >>
>>> >
>>> > By default all replicators have the IDFILTER registers set to 0 out of
>>> > hardware reset. This ensures that programmable replicators behave in
>>> > the same way as non-programmable replicators out of reset.
>>> >
>>> > The  dynamic_replicator_reset() is of course a driver state reset -
>>> > which filters out all trace on the output ports. The trace is then
>>> > enabled when we set the trace path from source to sink.
>>> >
>>> 
>>> Thanks for these explanations.
>>> 
>>> > It seems to me that you have 2 problems that need solving here:
>>> >
>>> > 1) Why does the reset_replicator() called from probe() _not_ work
>>> > correctly on replicator 1? It seems to work later if you introduce a
>>> > reset after more of the system has powered and booted. This is
>>> > startiing to look a little like a PM / clocking issue.
>>> 
>>> reset_replicator() does work in probe correctly for both replicators,
>>> below logs is collected before and after reset in probe. It is later
>>> that it's set back to 0x0 and hence the suggestion to look at 
>>> firmware
>>> using this replicator1.
>>> 
>> OK - sorry I read your statement saying that replicator1 was 0 after
>> the reset in probe(), rather than look at the logs.
>> 
>> From the logs it is working at the time probe() occurs, but by the
>> time we come to enable the replicator later, something has reset these
>> registers / hardware outside the control of the replicator driver.
>> 
> 
> Yes, I will try to get some more information from the firmware side if
> there is anything messing up.
> 

This turned out to be a clock/pm issue. To confirm, I just marked clk as 
critical
so that it won't be gated and I saw the replicator1(swao_replicator) 
registers
intact after probe. Also alternatively, I tried to comment out disabling 
pclk
to check if there is something wrong in amba pm and this keeps the 
registers
intact as well.

@@ -288,7 +295,7 @@ static int amba_probe(struct device *dev)
                 pm_runtime_set_suspended(dev);
                 pm_runtime_put_noidle(dev);

-               amba_put_disable_pclk(pcdev);
+               //amba_put_disable_pclk(pcdev);
                 dev_pm_domain_detach(dev, true);
         } while (0);

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1451CDCE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 16:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730298AbgEKORB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 10:17:01 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:14161 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730158AbgEKORB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 10:17:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589206619; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FVAth4pYBtTXQqicR7pFM3iw/uwUViT59NQhEjjdoQ8=;
 b=adUozKznWeg8+Y90HPjL8fICq86bogR4mOiHFtv0Asgzm9bBobgXVh7LopD8qejUcdtaO2PW
 7MfHwZEPohVjimruaX4LIQ+UVKj3y4ojoUnb+Q+Tk50dqbrNHlVZmPLN8f2TiS/62StK21gp
 /lEjyDgpD5yUmD8Q2+f7i/9sHcM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb95e55.7f1bc9fd45a8-smtp-out-n05;
 Mon, 11 May 2020 14:16:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9C9C3C432C2; Mon, 11 May 2020 14:16:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D992BC433F2;
        Mon, 11 May 2020 14:16:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 11 May 2020 19:46:51 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple
 connections
In-Reply-To: <CAJ9a7Vjd0XG+rAvHptAAjGtE6xRhYsPaOSC_Bf9B-w-FZFu_Qw@mail.gmail.com>
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
 <eee1b9a90266eed9a9c75401f0679777@codeaurora.org>
 <CAJ9a7Vjd0XG+rAvHptAAjGtE6xRhYsPaOSC_Bf9B-w-FZFu_Qw@mail.gmail.com>
Message-ID: <47f6d51bfad0a0bf1553e101e6a2c8c9@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On 2020-05-11 16:44, Mike Leach wrote:
[...]

>> 
>> I checked with the debug team and there is a limitation with
>> the replicator(swao_replicator) in the AOSS group where it
>> loses the idfilter register context when the clock is disabled.
>> This is not just in SC7180 SoC but also reported on some latest
>> upcoming QCOM SoCs as well and will need to be taken care in
>> order to enable coresight on these chipsets.
>> 
>> Here's what's happening -  After the replicator is initialized,
>> the clock is disabled in amba_pm_runtime_suspend() as a part of
>> pm runtime workqueue with the assumption that there will be no
>> loss of context after the replicator is initialized. But it doesn't
>> hold good with the replicators with these unfortunate limitation
>> and the idfilter register context is lost.
>> 
>> [    5.889406] amba_pm_runtime_suspend devname=6b06000.replicator 
>> ret=0
>> [    5.914516] Workqueue: pm pm_runtime_work
>> [    5.918648] Call trace:
>> [    5.921185]  dump_backtrace+0x0/0x1d0
>> [    5.924958]  show_stack+0x2c/0x38
>> [    5.928382]  dump_stack+0xc0/0x104
>> [    5.931896]  amba_pm_runtime_suspend+0xd8/0xe0
>> [    5.936469]  __rpm_callback+0xe0/0x140
>> [    5.940332]  rpm_callback+0x38/0x98
>> [    5.943926]  rpm_suspend+0xec/0x618
>> [    5.947522]  rpm_idle+0x5c/0x3f8
>> [    5.950851]  pm_runtime_work+0xa8/0xc0
>> [    5.954718]  process_one_work+0x1f8/0x4c0
>> [    5.958848]  worker_thread+0x50/0x468
>> [    5.962623]  kthread+0x12c/0x158
>> [    5.965957]  ret_from_fork+0x10/0x1c
>> 
>> This is a platform/SoC specific replicator issue, so we can either
>> introduce some DT property for replicators to identify which 
>> replicator
>> has this limitation, check in replicator_enable() and reset the
>> registers
>> or have something like below diff to check the idfilter registers in
>> replicator_enable() and then reset with clear comment specifying it’s
>> the
>> hardware limitation on some QCOM SoCs. Please let me know your 
>> thoughts
>> on
>> this?
>> 

Sorry for hurrying up and sending the patch - 
https://lore.kernel.org/patchwork/patch/1239923/.
I will send v2 based on further feedbacks here or there.

> 
> 1) does this replicator part have a unique ID that differs from the
> standard ARM designed replicators?
> If so perhaps link the modification into this. (even if the part no in
> PIDR0/1 is the same the UCI should be different for a different
> implementation)
> 

pid=0x2bb909 for both replicators. So part number is same.
UCI will be different for different implementation(QCOM maybe different 
from ARM),
but will it be different for different replicators under the same 
impl(i.e., on QCOM).

> 2) We have used DT properties in the past - (e.g. scatter gather in
> TMC) where hardware compatibility issues have impacted on the
> operation of a coresight component. This is further complicated by the
> fact that an ACPI property would be needed as well.
> 

Yes, this was also one option which I had mentioned. But as you said we 
need
to have an ACPI property as well and these systems with limitations are 
DT based.

> 3) The sysfs access to FILTERID0/1 on this replicator is going to show
> different values than on a standard replicator (0x00 instead of 0xFF).
> Does this need to be addressed?
> 

I don't think we need to change this because its actually showing the 
right
values for the replicator.

> 4 ) An alternative approach could be to model the driver on the ETM /
> CTI drivers where the register values are held in the driver structure
> and only applied on enable / disable.
> 

This looks good to me since we really don't need to reset replicator in 
probe,
we need to reset it only in replicator_enable() and that ensures clocks 
are enabled
without having to assume things(from amba) about context being lost or 
not when
clocks are disabled since that is implementation defined anyways.

But, why can't we just move replicator_reset() from probe to 
replicator_enable()?
Anything wrong with it? Seems like right thing to do because we will be 
having
clocks enabled when we touch the replicator registers and only in the 
enable
path.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

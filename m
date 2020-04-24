Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413591B7115
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 11:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDXJkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 05:40:06 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:49951 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726489AbgDXJkG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 05:40:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587721204; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rekLU09/3Cv7LAWd7/5Px5rmTpuddbamtpPpCDzbFDw=; b=FrvIPRqYc0UIghHTPyopTMo610y2NanoQyNKaL1BAalZ8qsiKVUR/ZQW8proLYE0LOhzYyEv
 DE5IH8r8xZFhMTqx16ao+IToT9Gy6nk6/hF0NBvNPrHR2mSuqKbpv83/w8/WJI/3zvcN5c8s
 s3quluQuxqreE3r6krP3Ab1cL5c=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea2b3f3.7fc46c44c880-smtp-out-n03;
 Fri, 24 Apr 2020 09:40:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA355C433BA; Fri, 24 Apr 2020 09:40:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.151.218])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F7A7C433CB;
        Fri, 24 Apr 2020 09:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F7A7C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFC v3] irqchip: qcom: pdc: Introduce irq_set_wake call
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org
References: <1585586460-3272-1-git-send-email-mkshah@codeaurora.org>
 <1585586460-3272-2-git-send-email-mkshah@codeaurora.org>
 <158682455899.84447.8337952928773625866@swboyd.mtv.corp.google.com>
 <1f1322be-c93a-f2f2-c2fe-541f26d8682c@codeaurora.org>
 <158693796555.105027.4658047860202135403@swboyd.mtv.corp.google.com>
 <bddc11e0-8d9a-dd55-3aab-42aeb18204f4@codeaurora.org>
 <158755213744.163502.17257131401798918469@swboyd.mtv.corp.google.com>
 <7cb97940-18d6-75b1-f4d2-7a80a6fe68c8@codeaurora.org>
 <158769585826.135303.15159589318457908652@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <95ec19bb-0e94-4384-5cca-fb6dbd3607ea@codeaurora.org>
Date:   Fri, 24 Apr 2020 15:09:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158769585826.135303.15159589318457908652@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/24/2020 8:07 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-04-22 05:14:21)
>> We discussed this in RFC v2, pasting your reply from same.
>>
>>> That looks like a bug. It appears that gpiolib is only hooking the irq
>>> disable path here so that it can keep track of what irqs are not in use
>>> by gpiolib and allow them to be used for GPIO purposes when the irqs are
>>> disabled. See commit 461c1a7d4733 ("gpiolib: override
>>> irq_enable/disable"). That code in gpiolib should probably see if lazy
>>> mode has been disabled on the irq and do similar things to what genirq
>>> does and then let genirq mask the gpios if they trigger during the time
>>> when the irq is disabled. Regardless of this design though, I don't
>>> understand why this matters.
> Yeah. I'm saying that the gpiolib code that forces all gpio irqs to be
> non-lazy is broken. Please send a patch to fix gpiolib so that irqs can
> be lazy again.

Let me reiterate.

In below genirq code, if irq_chip did not choose to implement 
.irq_disable (and the mask argument is coming as false by default during 
first disable) from the caller of this,

Then yes control takes lazy path since it doesn't enter to  if 
(desc->irq_data.chip->irq_disable)  or else if (mask) case and the 
__irq_disable call simply returns  without executing anything.

This leaves IRQ enabled in HW during suspend even though driver done 
disable_irq()

static void __irq_disable(struct irq_desc *desc, bool mask)
{
         if (irqd_irq_disabled(&desc->irq_data)) {
                 if (mask)
                         mask_irq(desc);
         } else {
                 irq_state_set_disabled(desc);
                 if (desc->irq_data.chip->irq_disable) {
desc->irq_data.chip->irq_disable(&desc->irq_data);
                         irq_state_set_masked(desc);
                 } else if (mask) {
                         mask_irq(desc);
                 }
         }
}

With above understanding, we have two more points to consider

1. The gpiolib registers for .irq_disable for every gpio chip, making it 
unlazy for every gpio chip.

2. The irq_chip that registers with gpiolib (from pinctrl-msm.c, also 
has .irq_disable implemented, and its parent PDC also has .irq_disable 
implemented)

Even if we fix point (1), by making gpiolib replicating genirq code,
It still will call irq_disable (from replicated code in gpiolib now) 
since irq_chip that registers with gpiolib has chosen to implement 
.irq_disable.

For other irq_chip's which don't implement .irq_disable, it will help.
But since from point (2) we know that PDC irq_chip implements 
.irq_disable, and would disable in HW the moment .irq_disable call comes in.


> I thought it didn't matter before but now that I've
> learned more it sounds like we have to use lazy irqs here so that irqs
> stay enabled on the path to suspend while they're disabled but marked
> for wakeup.

The description for irq_disable() says...

  * If the chip does not implement the irq_disable callback, we
  * use a lazy disable approach. That means we mark the interrupt
  * disabled, but leave the hardware unmasked. That's an
  * optimization...

Since PDC irq_chip implements .irq_disable callback, IRQ gets disabled 
in HW immediatly.

The comment says that lazy approch will be used if .irq_disable callback 
is not implemented.

IMO, client driver's should not assume/expect that underlying irq_chip 
will take lazy path only,
As it depends on whether irq_chip implemented .irq_disable callback or not.

If a driver is relying on lazy disable approach till date, then the 
driver should get fixed.
(by removing the unnecessary disable_irq() during suspend)

i suspect this might be the case in EC driver, on the platforms where it 
worked fine till today,
irq may not have been disabled in HW (may be that working platform's 
irq_chip may not have implemented irq_disable
hence support lazy disable which leaves IRQ unmasked in HW even after 
disable_irq() and able to resume from suspend)


> Otherwise I don't know how to make this work.
There are 3 possible options to make it work

1. Fix the EC driver (to stop calling disable_irq() during suspend) / 
support unlazy disable in EC driver

2. Support lazy disable (requires fixes in gpiolib and irq_chip also 
should not implement .irq_disable callback)

With above explanation, The PDC irq_chip want to keep continue implement 
.irq_disable callback
(we have different functionality in .irq_mask and .irq_disable 
implementation)

so option 2 is ruled out IMO.

3. We use this patch

The current patch makes this work by re-enabling such IRQs in HW during 
suspend's very end point, and restores state during resume.

i can not think of any other option.

Let me know if you now agree to go with option (1)

Otherwise, for option (3),

i can post next revision after addressing some minor fixes/suggestions.
I have tried to make this further simpler by not operating on both 
PDC-GPIO and PDC irq domains,
but it seems we need to use both irq domains and take the action 
accordingly during pdc_suspend() and pdc_resume().

I have missed the default case in switch (noticed same during rpmh patch 
doug has posted :-)), as it can get called for CLUSTER notification.
Will fix in next revision.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

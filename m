Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77CE19816E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 18:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgC3Qla (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 12:41:30 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:39258 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726000AbgC3Qla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 12:41:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585586489; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=SJTDBgvtt/m4QfLexp01DuyvOrbFHv+2tAxA8lI3SCQ=; b=R7K+0jvTwRFuP9KqyoWpw8/waDmV18/25glbcypiKNPdSHtVSErdAAm+ZiA2AEcD4FYQ/W06
 SNyolhObWQfE8p0h6oiL8LsMJiAQGdyQtHJIZQ3HV9g79kDQxS2CLr+QyQJmmDG+FaJGWU5C
 7McuTLGYsaGHRoC7m7r+9KdxFf0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e822132.7f9da58dd458-smtp-out-n05;
 Mon, 30 Mar 2020 16:41:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA135C433BA; Mon, 30 Mar 2020 16:41:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0213EC433F2;
        Mon, 30 Mar 2020 16:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0213EC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [RFC v3] pdc: Introduce irq_set_wake call
Date:   Mon, 30 Mar 2020 22:10:59 +0530
Message-Id: <1585586460-3272-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v3:
- Add pm events notification to check if suspend started
- Add cpu pm notification to enable wake IRQs during deep/s2idle suspend
- Add pdc_pm_data structure as domain->host_data and as irq's chip_data
- Add changes to mark wakeup and enabled IRQs in respective domains
- Address Stephen's comments from v2.

Changes in v2:
- Drop pinctrl irqchip change and update in PDC irqchip change
- Include more details for .irq_set_wake introduction
- Address Stephen's comments for CPUidle need not call enable_irq_wake
- Update cover letter inline to add more detail on problem and solution

irqchip: qcom: pdc: Introduce irq_set_wake call

Some drivers using gpio interrupts want to configure gpio for wakeup using
enable_irq_wake() but during suspend entry disables irq and expects system
to resume when interrupt occurs. In the driver resume call interrupt is
re-enabled and removes wakeup capability using disable_irq_wake() one such
example is cros ec driver.

With [1] in documentation saying "An irq can be disabled with disable_irq()
and still wake the system as long as the irq has wake enabled".

In such scenario the gpio irq stays disabled at gpio irqchip but needs to
keep enabled in the hierarchy for wakeup capable parent PDC and GIC irqchip
to be able to detect and forward wake capable interrupt to CPU when system
is in sleep state like suspend.

The final status at PDC irq_chip should be an "OR" of "enable" and "wake" calls.
(i.e. same per below table)
|--------------------------------------------------|
| ENABLE in SW | WAKE in SW | PDC & GIC HW Status  |
|      0       |     0      |     0	           |
|      0       |     1      |     1	           |
|      1       |     0      |     1		   |
|      1       |     1      |     1	           |
|--------------------------------------------------|

Sending this as an RFC since this series attempts to add support for [1] by
introducing irq_set_wake call for PDC irqchip from which interrupt can be
enabled/disabled at PDC (and its parent GIC) hardware.

Note that *ALL* drivers using wakeup capable interrupt with enable_irq_wake()
and want to disable irq with disable_irq() need to call disable_irq_wake()
also if they want to stop wakeup capability at parent PDC irqchip.
Not doing so will lead to system getting woken up from sleep states if wakeup
capable IRQ comes in.

[1] https://www.spinics.net/lists/kernel/msg3398294.html

Maulik Shah (1):
  irqchip: qcom: pdc: Introduce irq_set_wake call

 drivers/irqchip/qcom-pdc.c | 271 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 256 insertions(+), 15 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

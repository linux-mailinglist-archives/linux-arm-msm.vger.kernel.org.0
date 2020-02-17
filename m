Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71610161294
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 14:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgBQNCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 08:02:00 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:60566 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728011AbgBQNCA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 08:02:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581944520; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=hvlF4xUDYEzHHoJCAPBP+F/CgU/i6FaiSI+ZjXd4Nw0=; b=fqn2RF289sJzPnAHSB9CexFL/RokWpwIJS0PuRSi6rmux/xCHjLC80i2liKWO14e6xBAefn/
 NB+Izhc3GCUUwIPR01uG7iETVSByVGY9GS/k4sticdXP8Ir1nOXe23HoXkFQiFAOPoSVVKfq
 w2cR7etF9jlNE2MO3AA2Dq7VfXI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a8e97.7fe112b84f10-smtp-out-n03;
 Mon, 17 Feb 2020 13:01:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C0B2C4479C; Mon, 17 Feb 2020 13:01:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 736C8C43383;
        Mon, 17 Feb 2020 13:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 736C8C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, Maulik Shah <mkshah@codeaurora.org>
Subject: [RFC 0/2] pdc: Introduce irq_set_wake call
Date:   Mon, 17 Feb 2020 18:30:06 +0530
Message-Id: <1581944408-7656-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Sending this as an RFC since this series attempts to add support for [1] by
introducing irq_set_wake call for PDC irqchip from which interrupt can be
enabled/disabled at PDC hardware. This also removes irq_chip_enable_parent
and irq_chip_disable_parent calls made from msmgpio irqchip to PDC since
enable and disable at wakeup capable irqchip is now done from irq_set_wake.

Note that *ALL* drivers using wakeup capable interrupt and want to disable
irq with disable_irq() need to call disable_irq_wake() also if they want
to stop wakeup capability at parent PDC irqchip. Not doing so will lead to
system getting woken up from sleep states.

[1] https://www.spinics.net/lists/kernel/msg3398294.html

Maulik Shah (2):
  irqchip: qcom: pdc: Introduce irq_set_wake call
  pinctrl: qcom: Remove forwarding irq_disable and irq_enable call to
    parent

 drivers/irqchip/qcom-pdc.c         | 27 ++++++++++-----------------
 drivers/pinctrl/qcom/pinctrl-msm.c |  7 +------
 2 files changed, 11 insertions(+), 23 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

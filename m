Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05F0A27A67C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgI1EcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:32:24 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:42529 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726412AbgI1EcY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:32:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601267542; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=iUP+9KAtVUdbqvkexYHbHi5BMbdndfT+RF8uBYA3JJY=; b=oJjjKtKelxF8ha+oD1KAwIGLbHEp7WL+g7gzzt9wx1ML5XCXufjyiz0NqvNC88FYvxmrU9g4
 ykOr/AVGh7LRiqzNN/uXhNmtZ6kBfGQyafdDebbZysKuwpdKW5eY1m6GCSROlSW0zARemosw
 BwcCfevEZG75Hlz8r/dxWoSvsN4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f716756e064df29c678f618 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 04:32:22
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 08E2EC433F1; Mon, 28 Sep 2020 04:32:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2897C433CA;
        Mon, 28 Sep 2020 04:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2897C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, maz@kernel.org,
        linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v6 0/6] irqchip: qcom: pdc: Introduce irq_set_wake call
Date:   Mon, 28 Sep 2020 10:01:58 +0530
Message-Id: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v6:
- Update commit message more descriptive in v5 patch 1
- Symmetrically enable/disable wakeirqs during suspend/resume in v5 patch 3
- Include Acked-by and Reviewed-by tags from v5 series

Changes in v5:
- Update commit subject in v4 patch 1
- Add more details to commit message in v4 patch 2
- Add change to enable wake irqs during suspend using new flag in irqchip
- Use this in PDC and qcom pinctrl driver to enable wakeirqs on suspend
- Make for loop more readable and add more details in commit in v4 patch 7

Changes in v4:
- Drop "Remove irq_disable callback from msmgpio irqchip" patch from v3
- Introduce irq_suspend_one() and irq_resume_one() callbacks
- Use the new callbacks to unmask wake interrupts during suspend
- Reset only pdc interrupts that are mapped in DTSI

Changes in v3:
- Drop gpiolib change (v2 patch 1) since its already in linux-next
- Add Acked-by Linus Walleij for v2 patch 2 and v2 patch 3.
- Address Stephen's comment to on v2 patch 3
- Address Stephen's comment to change variable to static on v2 patch 4.
- Add a new change to use return value from .irq_set_wake callback
- Add a new change to reset PDC irq enable bank during init time

Changes in v2:
- Fix compiler error on gpiolib patch

This series adds support to lazy disable pdc interrupt.

Some drivers using gpio interrupts want to configure gpio for wakeup using
enable_irq_wake() but during suspend entry disables irq and expects system
to resume when interrupt occurs. In the driver resume call interrupt is
re-enabled and removes wakeup capability using disable_irq_wake() one such
example is cros ec driver.

With [1] in documentation saying "An irq can be disabled with disable_irq()
and still wake the system as long as the irq has wake enabled".

The PDC IRQs are currently "unlazy disabled" (disable here means that it
will be masked in PDC & GIC HW GICD_ISENABLER, the moment driver invokes
disable_irq()) such IRQs can not wakeup from low power modes like suspend
to RAM since the driver chosen to disable this.

During suspend entry, no one re-enable/unmask in HW, even if its marked for
wakeup.

One solutions thought to address this problem was...During suspend entry at
last point, irq chip driver re-enable/unmask IRQs in HW that are marked for
wakeup. This was attemped in [2].

This series adds alternate solution to [2] by "lazy disable" IRQs in HW.
The genirq takes care of lazy disable in case if irqchip did not implement
irq_disable callback. Below is high level steps on how this works out..

a. During driver's disable_irq() call, IRQ will be marked disabled in SW
b. IRQ will still be enabled(read unmasked in HW)
c. The device then enters low power mode like suspend to RAM
d. The HW detects unmasked IRQs and wakesup the CPU
e. During resume after local_irq_enable() CPU goes to handle the wake IRQ
f. Generic handler comes to know that IRQ is disabled in SW
g. Generic handler marks IRQ as pending and now invokes mask callback
h. IRQ gets disabled/masked in HW now
i. When driver invokes enable_irq() the SW pending IRQ leads IRQ's handler
j. enable_irq() will again enable/unmask in HW

[1] https://www.spinics.net/lists/kernel/msg3398294.html
[2] https://patchwork.kernel.org/patch/11466021/

Maulik Shah (6):
  pinctrl: qcom: Set IRQCHIP_SET_TYPE_MASKED and IRQCHIP_MASK_ON_SUSPEND
    flags
  pinctrl: qcom: Use return value from irq_set_wake() call
  genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
  pinctrl: qcom: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
  irqchip: qcom-pdc: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
  irqchip: qcom-pdc: Reset PDC interrupts during init

 drivers/irqchip/qcom-pdc.c         | 14 +++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.c | 11 +++++----
 include/linux/irq.h                | 49 +++++++++++++++++++++++---------------
 kernel/irq/debugfs.c               |  3 +++
 kernel/irq/pm.c                    | 34 ++++++++++++++++++++++----
 5 files changed, 81 insertions(+), 30 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


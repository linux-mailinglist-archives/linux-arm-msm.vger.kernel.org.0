Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6567C16C5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfEGUkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:40:52 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52634 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbfEGUkw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:40:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C904160A24; Tue,  7 May 2019 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261650;
        bh=stcg8CzvSafuMT/P1RIQCG/y6ujXCmqbponKtEXZm8Y=;
        h=From:To:Cc:Subject:Date:From;
        b=pJmy6g7EwedqarmCGBv4Q4MbLuCLcnAb2ncrlgtnSiMCqp5o9XpsQe+M9Dg4NCXFd
         08LX8MlIKdKAUT/DCZ6XDkN4pKkhZHCy3A2RIMkfZcRDSCima7jUYg1OWQo0Thh1Xf
         /VhaGNGYuxHksenYJRFHon8o56Nt3GKl+SFH0NYs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22A43605A2;
        Tue,  7 May 2019 20:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261650;
        bh=stcg8CzvSafuMT/P1RIQCG/y6ujXCmqbponKtEXZm8Y=;
        h=From:To:Cc:Subject:Date:From;
        b=pJmy6g7EwedqarmCGBv4Q4MbLuCLcnAb2ncrlgtnSiMCqp5o9XpsQe+M9Dg4NCXFd
         08LX8MlIKdKAUT/DCZ6XDkN4pKkhZHCy3A2RIMkfZcRDSCima7jUYg1OWQo0Thh1Xf
         /VhaGNGYuxHksenYJRFHon8o56Nt3GKl+SFH0NYs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22A43605A2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v5 00/11] Support wakeup capable GPIOs
Date:   Tue,  7 May 2019 14:37:38 -0600
Message-Id: <20190507203749.3384-1-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

This is a re-spin of the wakeup capable GPIO support for QCOM SoCs.
The earlier version of the patch revision 4, was published [1] and had
some good discussions. The comments from the review have also been
addressed and the code rebased on top of 5.1 in this spin. There a few
changes in this spin:
	- Review comments from Stephen, Marc
	- Bug fixes in irqdomain-map
	- Fix invalid interrupt case
	- Update documentation
	- Attempt generalizing gpiochip_to_irq() for hierarchical domain

In patch v4, we were discussing about the IRQ type of GPIO defaulting to
IRQ_TYPE_NONE (as is was the custom for older implementation). In the
SDM845 SoC select GPIOs are routed to an always-on interrupt controller
called the PDC and then to the GIC.

Wakeup capabable:
	GPIO  --->  PDC  ------>  GIC

Requesting a GPIO as an interrupt through the gpio_to_irq() call would
setup an interrupt hierarchy as above and return the linux interrupt
number. However, since the trigger type of the GPIO is unknown at this
time, gpiolib defaults to IRQ_TYPE_NONE. This triggers a warning at the
GIC, which expects a valid trigger type be set correctly in the fwspec.
The solution to this problem is still at large and I would like to
solicit feedback on this.

Appreciate your time.

Thanks,
Lina

[1]. https://patchwork.kernel.org/cover/10851807/

Lina Iyer (9):
  gpio: allow gpio_to_irq to use OF variants for gpiochips
  irqdomain: add bus token DOMAIN_BUS_WAKEUP
  of: irq: document properties for wakeup interrupt parent
  drivers: irqchip: add PDC irqdomain for wakeup capable GPIOs
  dt-bindings: sdm845-pinctrl: add wakeup interrupt parent for GPIO
  drivers: pinctrl: msm: setup GPIO irqchip hierarchy
  arm64: dts: qcom: add PDC interrupt controller for SDM845
  arm64: defconfig: enable PDC interrupt controller for Qualcomm SDM845
  arm64: dts: qcom: setup PDC as wakeup parent for GPIOs for SDM845

Stephen Boyd (1):
  of: irq: add helper to remap interrupts to another irqdomain

Thierry Reding (1):
  gpio: Add support for hierarchical IRQ domains

 .../interrupt-controller/interrupts.txt       |  54 +++++++
 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  |  79 +++++++++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  88 +++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/gpio/gpiolib.c                        |  28 +++-
 drivers/irqchip/qcom-pdc.c                    |  98 +++++++++++--
 drivers/of/irq.c                              | 129 +++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.c            | 137 +++++++++++++++---
 include/linux/gpio/driver.h                   |   6 +
 include/linux/irqdomain.h                     |   1 +
 include/linux/of_irq.h                        |   1 +
 include/linux/soc/qcom/irq.h                  |  25 ++++
 12 files changed, 610 insertions(+), 37 deletions(-)
 create mode 100644 include/linux/soc/qcom/irq.h

--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5E22931D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 01:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388880AbgJSXRo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 19:17:44 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:22179 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728436AbgJSXRo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 19:17:44 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Oct 2020 16:17:43 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 19 Oct 2020 16:17:43 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id E832F199F; Mon, 19 Oct 2020 16:17:42 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Mark Brown <broonie@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [RFC PATCH RESEND v1 0/3] Add support for Qualcomm MFD PMIC register layout
Date:   Mon, 19 Oct 2020 16:17:30 -0700
Message-Id: <cover.1603148363.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a follow-up as promised [1] to the earlier attempts [2] [3] to upstream
the driver that has been hitherto used to handle IRQs for Qualcomm's PMICs that
have multiple on-board peripherals when they are interfaced over the I2C
interface.

This series is a rewrite of that driver while making use of the regmap-irq
framework, which needs some modifications to handle the register layout of
Qualcomm's PMICs. This is an RFC because I would like to get feedback on my
general approach before submitting as a patch per se.

Upon inspection of the regmap-irq framework, it was observed that the
downstream driver was essentially replicating the framework's IRQ handling
logic (such as adding an IRQ domain, and the interrupt handler thread that
reads sub-irqs from a main status register). It was also observed that the
framework could not be used as-is because:
- Qualcomm's PMIC peripheral register layout does not follow a fixed
  irq_reg_stride, and
- The "IRQ TYPE" configuration register takes one bit per interrupt, which when
  set configures that interrupt as Edge triggered, and when cleared sets it to
  Level triggered.
- There are two IRQ configuration registers in addition to "IRQ TYPE" that
  further configure the IRQ type as triggered by rising-edge/level high or
  alternatively, falling-edge/level low that have no support in the regmap-irq
  framework currently.

This patch series has been tested on an internal platform using PM8008 as a
test MFD PMIC chip. PM8008 is a PMIC that contains 7 LDOs, 2 GPIOs, temperature
monitoring, and can be interfaced over I2C.

Both the framework modifications as well as the chip driver
have been submitted here for review. Some details about the specific
differences between the framework and QCOM PMICs' register layout are provided
below using PM8008 as an example.

[PM8008 peripheral register layout]

Of all the peripherals in PM8008, only a few need IRQ support. They are laid
out at the following base addresses (only four are added at the moment for
simplicity):

	0x0900, 0x2400, 0xC000, 0xC100

Each peripheral is allocated a uniform size of 0x100 bytes and its IRQs are
configured through a set of registers that are located at fixed offsets from
the above base addresses, uniformly:

	Register name	       Addr	regmap-irq equivalent	Comment
	-----------------------------------------------------------------------
	INT_RT_STS_OFFSET      0x10	(no equivalent)		See #1 below
	INT_SET_TYPE_OFFSET    0x11	type_base 		See #2 below
	INT_POL_HIGH_OFFSET    0x12	(no equivalent)		See #3 below
	INT_POL_LOW_OFFSET     0x13	(no equivalent)		See #3 below
	INT_LATCHED_CLR_OFFSET 0x14	ack_base
	INT_EN_SET_OFFSET      0x15	unmask_base		See #4 below
	INT_EN_CLR_OFFSET      0x16	mask_base		See #4 below
	INT_LATCHED_STS_OFFSET 0x18	status_base

Comments (all registers are one bit per interrupt):
1. INT_RT_STS_OFFSET is not used by the regmap-irq, so it may be ignored.
2. INT_SET_TYPE_OFFSET: 1 for edge trigger, 0 for level trigger.
3. Support needs to be added for writing to INT_POL_HIGH_OFFSET and
   INT_POL_LOW_OFFSET correctly in the framework. Set to 1 or 0 to enable or
   disable rising-edge/level high or falling-edge/level low.
4. Even though INT_EN_SET_OFFSET and INT_EN_CLR_OFFSET map to unmask_base and
   mask_base in the regmap-irq framework conceptually, they are swapped in the
   chip driver because `unmask_offset` in the framework expects unmask_base to
   be larger than mask_base numerically. This has to be kept in mind while
   reviewing the "mfd: Add PM8008 driver" patch below.

[Summary of framework changes]

The main thrust of the changes is to introduce an array of peripheral offset
values, which are to be added to the *_base addresses in order to arrive at the
correct register addresses per peripheral. In order to get at the first
peripheral's addresses, the first element of this array must be zero.

Since there are two new registers (INT_POL_HIGH_OFFSET and INT_POL_LOW_OFFSET),
add support for storing the per-peripheral values and also writing to them.
These will be used only if peripheral offsets are specified.

[1] https://lore.kernel.org/lkml/20200519185757.GA13992@codeaurora.org/
[2] https://lore.kernel.org/lkml/cover.1588037638.git.gurus@codeaurora.org/
[3] https://lore.kernel.org/lkml/cover.1588115326.git.gurus@codeaurora.org/

Guru Das Srinagesh (3):
  regmap-irq: Add support for peripheral offsets
  dt-bindings: mfd: Add QCOM PM8008 MFD bindings
  mfd: Add PM8008 driver

 .../bindings/mfd/qcom,pm8008-irqchip.yaml          | 103 +++++++++++
 drivers/base/regmap/regmap-irq.c                   | 191 ++++++++++++++++----
 drivers/mfd/Kconfig                                |  14 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/qcom-pm8008.c                          | 197 +++++++++++++++++++++
 include/linux/regmap.h                             |   6 +
 6 files changed, 478 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
 create mode 100644 drivers/mfd/qcom-pm8008.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


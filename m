Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D46336907
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 01:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbhCKAkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 19:40:25 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:27978 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229546AbhCKAj5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 19:39:57 -0500
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Mar 2021 16:39:57 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 10 Mar 2021 16:39:56 -0800
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id B083919F4; Wed, 10 Mar 2021 16:39:56 -0800 (PST)
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
        devicetree@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [RFC PATCH v3 0/3] Add support for Qualcomm MFD PMIC register layout
Date:   Wed, 10 Mar 2021 16:39:51 -0800
Message-Id: <cover.1615423027.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes from v2:
- Split up framework changes patch for better comprehension.
- Dropped PM8008 driver example and converted it into example code in cover
  letter and commit text.
- Added more info in cover letter and commit message as per v2 feedback.

This is a follow-up as promised [1] to the earlier attempts [2] [3] to upstream
the driver that has been hitherto used to handle IRQs for Qualcomm's PMICs that
have multiple on-board peripherals when they are interfaced over the I2C
interface.

This series is a rewrite of that driver while making use of the regmap-irq
framework, which needs some modifications to handle the register layout of
Qualcomm's PMICs. This is an RFC because I would like to get feedback on my
general approach before submitting as a patch per se.

Qualcomm's MFD chips have a top level interrupt status register and sub-irqs
(peripherals).  When a bit in the main status register goes high, it means that
the peripheral corresponding to that bit has an unserviced interrupt. If the
bit is not set, this means that the corresponding peripheral does not.

The differences between Qualcomm's register layout and what the regmap-irq
framework assumes are best described with an example:

Suppose that there are three peripherals onboard an MFD chip: MISC, TEMP_ALARM
and GPIO01. Each of these peripherals has the following IRQ configuration
registers: mask, type and ack. There is a top level interrupt status register
and per-peripheral status registers as well (not shown below).

The regmap-irq framework expects all similar registers to be at a fixed stride
from each other, for each peripheral, as below (with stride = 1). 

	/* All mask registers together */
	MISC_INT_MASK		0x1011
	TEMP_ALARM_INT_MASK	0x1012
	GPIO01_INT_MASK		0x1013
	
	/* All type registers together */
	MISC_INT_TYPE		0x2011
	TEMP_ALARM_INT_TYPE	0x2012
	GPIO01_INT_TYPE		0x2013
	
	/* All ack registers together */
	MISC_INT_ACK		0x3011
	TEMP_ALARM_INT_ACK	0x3012
	GPIO01_INT_ACK		0x3013

In contrast, QCOM's registers are laid out as follows:

	/* All of MISC peripheral's registers together */
	MISC_INT_MASK		0x1011
	MISC_INT_TYPE		0x1012
	MISC_INT_ACK		0x1013

	/* All of TEMP_ALARM peripheral's registers together */
	TEMP_ALARM_INT_MASK	0x2011
	TEMP_ALARM_INT_TYPE	0x2012
	TEMP_ALARM_INT_ACK	0x2013
	
	/* All of GPIO01 peripheral's registers together */
	GPIO01_INT_MASK		0x3011
	GPIO01_INT_TYPE		0x3012
	GPIO01_INT_ACK		0x3013

As is evident, the different IRQ configuration registers are just (0x11, 0x12,
0x13) with offsets of (0x1000, 0x2000 and 0x3000) respectively in QCOM's case.
If the *_base registers fed to the struct regmap_irq_chip could be set to the
first peripheral (MISC in this example), then through the sub_reg_offsets
mechanism, we could add the offsets _to_ the *_base register values to get at
the configuration registers for each peripheral.

Hopefully this will help when reviewing the changes in this series.

[1] https://lore.kernel.org/lkml/20200519185757.GA13992@codeaurora.org/
[2] https://lore.kernel.org/lkml/cover.1588037638.git.gurus@codeaurora.org/
[3] https://lore.kernel.org/lkml/cover.1588115326.git.gurus@codeaurora.org/

Guru Das Srinagesh (3):
  regmap-irq: Extend sub-irq to support non-fixed reg strides
  regmap-irq: Add support for POLARITY_HI and POLARITY_LO config regs
  regmap-irq: Modify type_buf handling for IRQ_TYPE_LEVEL_*

 drivers/base/regmap/regmap-irq.c | 152 +++++++++++++++++++++++++++++++--------
 include/linux/regmap.h           |  11 +++
 2 files changed, 133 insertions(+), 30 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


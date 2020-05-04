Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74341C32AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 08:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbgEDGVA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 02:21:00 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:3330 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726906AbgEDGUe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 02:20:34 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 May 2020 23:20:31 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg05-sd.qualcomm.com with ESMTP; 03 May 2020 23:20:27 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 6D73C21737; Mon,  4 May 2020 11:50:26 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH V4 0/8] Add APSS clock controller support for IPQ6018
Date:   Mon,  4 May 2020 11:50:16 +0530
Message-Id: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The CPU on Qualcomm's IPQ6018 devices are primarily fed by APSS PLL and XO,
these are connected to a clock mux and enable block.

This patch series adds support for these clocks and inturn enables clocks
required for CPU freq.

[V4]
 * Re-written PLL found on IPQ platforms as a separate driver
 * Addressed stephen's comments on apss clock controller and pll
 * Addressed Rob's review comments on bindings
 * moved a53 pll binding from this series as it is not applicable, will send
   it separately.
[V3]
 * Fixed dt binding check error in patch2
   dt-bindings: clock: Add YAML schemas for QCOM A53 PLL
[V2]
 * Restructred the patch series as there are two different HW blocks,
   the mux and enable belongs to the apcs block and PLL has a separate HW
   block.
 * Converted qcom mailbox and qcom a53 pll documentation to yaml.
 * Addressed review comments from Stephen, Rob and Sibi where it is applicable.
 * Changed this cover letter to state the purpose of this patch series

Sivaprakash Murugesan (8):
  dt-bindings: mailbox: Add YAML schemas for QCOM APCS global block
  dt-bindings: clock: Add schema for QCOM IPQ apss pll
  clk: qcom: Add ipq apss pll driver
  clk: qcom: Add DT bindings for ipq6018 apss clock controller
  clk: qcom: Add ipq apss clock controller
  dt-bindings: mailbox: Add dt-bindings for ipq6018 apcs global block
  mailbox: qcom: Add ipq6018 apcs compatible
  arm64: dts: ipq6018: Add a53 pll and apcs clock

 .../bindings/clock/qcom,ipq-apsspll.yaml           |  49 ++++++++++
 .../bindings/mailbox/qcom,apcs-kpss-global.txt     |  88 -----------------
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |  99 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  16 +++-
 drivers/clk/qcom/Kconfig                           |  19 ++++
 drivers/clk/qcom/Makefile                          |   2 +
 drivers/clk/qcom/apss-ipq-pll.c                    |  97 +++++++++++++++++++
 drivers/clk/qcom/apss-ipq.c                        | 106 +++++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |  26 +++--
 include/dt-bindings/clock/qcom,apss-ipq.h          |  12 +++
 10 files changed, 414 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq-apsspll.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
 create mode 100644 drivers/clk/qcom/apss-ipq-pll.c
 create mode 100644 drivers/clk/qcom/apss-ipq.c
 create mode 100644 include/dt-bindings/clock/qcom,apss-ipq.h

-- 
2.7.4


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD331E4270
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 14:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbgE0MiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 08:38:21 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:54815 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728964AbgE0MiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 08:38:21 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 27 May 2020 05:38:20 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg04-sd.qualcomm.com with ESMTP; 27 May 2020 05:38:18 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id B772921800; Wed, 27 May 2020 18:08:16 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH 0/4] Add ipq6018 apcs mailbox driver
Date:   Wed, 27 May 2020 18:08:08 +0530
Message-Id: <1590583092-24290-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ipq6018 devices has apcs block for ipc interrupts, this block also
provides a clock controller which provides cpu clocks.

This series adds support for the apcs block found in ipq6018 devices.

This series was originally part of ipq6018 apss clock controller series
https://lkml.org/lkml/2020/5/27/637

The patch 4 has dtb dependency with apss pll driver which can be found in
https://lkml.org/lkml/2020/5/27/637

Sivaprakash Murugesan (4):
  dt-bindings: mailbox: Add YAML schemas for QCOM APCS global block
  dt-bindings: mailbox: Add dt-bindings for ipq6018 apcs global block
  mailbox: qcom: Add ipq6018 apcs compatible
  arm64: dts: ipq6018: Add support for apcs clk

 .../bindings/mailbox/qcom,apcs-kpss-global.txt     | 88 -------------------
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 99 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  8 +-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            | 23 +++--
 4 files changed, 118 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml

-- 
2.7.4


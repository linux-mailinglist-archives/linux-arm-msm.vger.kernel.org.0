Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35A80169D2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 05:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgBXEuW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Feb 2020 23:50:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:38052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727186AbgBXEuW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Feb 2020 23:50:22 -0500
Received: from localhost.localdomain (unknown [122.182.199.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CEEF320661;
        Mon, 24 Feb 2020 04:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582519821;
        bh=raLSkCsVsEsGVWKAl7s7CtI/m6bBykJgg2wahMZMTJA=;
        h=From:To:Cc:Subject:Date:From;
        b=Z+CPGI+ivK+KlgnAbdUQ9sbHqEVCzb5EXR1H0M1jtjH31mMDljeUtIqaMJ3O25YJK
         owXXj8jvzhCgC7pnesz/a6Sw7oqysc/WpdTosYl1fCENLi7f/gJqmoigMv+6w3juTz
         dRuRuxDdcGMTu38owzybyUgbAqcsj4UWircjTWXc=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        vnkgutta@codeaurora.org
Subject: [PATCH v4 0/5] Add clock drivers for SM8250 SoC
Date:   Mon, 24 Feb 2020 10:19:58 +0530
Message-Id: <20200224045003.3783838-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds clock drivers support for SM8250 SoC.  As part of the
device tree, the sm8250 dts file has basic nodes like CPU, PSCI, intc, timer
and clock controller.

Required clock controller driver and RPMH cloks are added to
support peripherals like USB.

All this configuration is added to support SM8250 to boot up to the
serial console.

Changes in v4:
 - Make qcom,gcc-sm8250.yaml license as dual GPL + BSD

Changes in v3:
- Dropped accepted patches by Steve
- Split the common rename patch to rename and refactor patches
- Rebase on clk/clk-qcom and move yaml binding to .../bindings/clock/qcom,gcc-sm8250.yaml
- Fix comments form Steve on gcc-sm8250 clk driver

Taniya Das (5):
  clk: qcom: clk-alpha-pll: Use common names for defines
  clk: qcom: clk-alpha-pll: Refactor trion PLL
  clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs
  dt-bindings: clock: Add SM8250 GCC clock bindings
  clk: qcom: gcc: Add global clock controller driver for SM8250

 .../bindings/clock/qcom,gcc-sm8250.yaml       |   72 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  264 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   12 +
 drivers/clk/qcom/gcc-sm8250.c                 | 3690 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8250.h   |  271 ++
 7 files changed, 4268 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8250.h

-- 
2.24.1


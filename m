Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32E72D23D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 07:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgLHGrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 01:47:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:57438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgLHGrz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 01:47:55 -0500
From:   Vinod Koul <vkoul@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Add clock drivers for SM8350
Date:   Tue,  8 Dec 2020 12:16:57 +0530
Message-Id: <20201208064702.3654324-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds rpmhcc and gcc clock controller drivers for the controllers found
in SM8350 SoC

Changes in v2:
 - Add r-b from Bjorn
 - Add the gcc_qupv3_wrap_1_{m|s}_ahb_clk and gcc_qupv3_wrap1_s5_clk

Vinod Koul (3):
  dt-bindings: clock: Add RPMHCC bindings for SM8350
  clk: qcom: rpmh: add support for SM8350 rpmh clocks
  dt-bindings: clock: Add SM8350 GCC clock bindings

Vivek Aknurwar (2):
  clk: qcom: clk-alpha-pll: Add support for Lucid 5LPE PLL
  clk: qcom: gcc: Add clock driver for SM8350

 .../bindings/clock/qcom,gcc-sm8350.yaml       |   68 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  223 +
 drivers/clk/qcom/clk-alpha-pll.h              |    4 +
 drivers/clk/qcom/clk-rpmh.c                   |   34 +
 drivers/clk/qcom/gcc-sm8350.c                 | 3996 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8350.h   |  261 ++
 include/dt-bindings/clock/qcom,rpmh.h         |    8 +
 10 files changed, 4605 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm8350.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8350.h

-- 
2.26.2


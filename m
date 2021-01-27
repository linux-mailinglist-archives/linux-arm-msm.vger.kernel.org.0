Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E0B305423
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 08:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbhA0HMx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 02:12:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:45486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232372AbhA0HJB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 02:09:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EACC20724;
        Wed, 27 Jan 2021 07:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611731300;
        bh=h6gEAcgIWOUdRrfszLr2SUwM5JmAGj8Uwzmk+TImk/k=;
        h=From:To:Cc:Subject:Date:From;
        b=J/VLsnQv2NxTJ/b7PYohkQlIkhAqXg+NGTBKP0FG/wwPjicHsHmSemC7vVBwqxBaG
         gdoacmVpQeDtFBLdv8nPQo2ap51vLUYrjw3mISwtbxHP4iVwbyVnLa3RNYc9QivaIw
         iKc0TixKK8BzLZs0qwSNAMUYc+jxYOn13Bd8tUljr1RQAFGyIgVhhtpZtfcTfMyXva
         51Y+TPTa+ItLarti5utcVWAnQvVsfESDNsYJ87SdDthm/B7UuhTIVVLPFa0bIH/7uq
         9mF8UYA7j6iCIXGmmC4zayO7R6Sof91h9WI1ppJSteB6Yl81Kmi1Rs06SX0qFG0f6L
         xwMwBlWsa9kzg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] Add clock drivers for SM8350
Date:   Wed, 27 Jan 2021 12:38:06 +0530
Message-Id: <20210127070811.152690-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds gcc clock controller drivers for the controller found
in SM8350 SoC

Changes in v5:
 - Add r-b from AngeloGioacchino and Bjorn
 - Removed unused clock indices
 - Initialize variable before use in regmap read

Changes in v4:
 - Add Ack from Rob on binding
 - modularize alpha_pll_trion_set_rate()

Changes in v3:
 - Drop rpmh clk patches applied
 - Add a new patch to replace regval with val as suggested by Stephen
 - Fix comments for new Lucid 5LPE PLL: sort new defines by BIT numbers, fix
   comments, use alpha_pll_check_rate_margin(), rework
   clk_lucid_5lpe_pll_postdiv_set_rate() logic
 - Add power domains and optional clocks in bindings
 - Fix comments for gcc sm8350 driver: clean includes used, use only
   .fw_name for clocks defined in DT, use floor ops for sdcc clocks, remove
   critical clocks and enable them in probe, add comments for clks using
   BRANCH_HALT_SKIP and BRANCH_HALT_DELAY

Changes in v2:
 - Add r-b from Bjorn
 - Add the gcc_qupv3_wrap_1_{m|s}_ahb_clk and gcc_qupv3_wrap1_s5_clk

Vinod Koul (3):
  clk: qcom: clk-alpha-pll: replace regval with val
  clk: qcom: clk-alpha-pll: modularize alpha_pll_trion_set_rate()
  dt-bindings: clock: Add SM8350 GCC clock bindings

Vivek Aknurwar (2):
  clk: qcom: clk-alpha-pll: Add support for Lucid 5LPE PLL
  clk: qcom: gcc: Add clock driver for SM8350

 .../bindings/clock/qcom,gcc-sm8350.yaml       |   96 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  209 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    4 +
 drivers/clk/qcom/gcc-sm8350.c                 | 3790 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8350.h   |  254 ++
 7 files changed, 4346 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm8350.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8350.h

-- 
2.26.2


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B587D2EAF4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbhAEPri (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:47:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:34566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728307AbhAEPrh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:47:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4342122BF3;
        Tue,  5 Jan 2021 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609861617;
        bh=QM0PNbL6zQp9vWGkUHxqfDJNae8+Wq35ku+Qa+rO3mQ=;
        h=From:To:Cc:Subject:Date:From;
        b=WBnhjteXRzovuldguMqi3552P5uZOIAcYDES3fRjzd5dAWHhfxXq64w5YOENhCWbq
         Rx64h1KDogDyI+A+E3O5D2qTePZenSr72X1oSZaTERJn7MeVs2974FRk1nRreG1Gdp
         FbiBzGjwQufEZ84CwaG/cZCe5ISFjirmGIH1hEQialmaV0k/b13ipxUpJPxyyAG7/Q
         50K8geXjMyjO0KPPfzUgRiDjztoiZeoMS5vXC0mfRU6AutFMbBZ94JgKFR9nob6BKe
         hGMJUWZRc5lRuKnAnMYw+ljB/syLtyo2UKZQEtFo7YQEcPuTaSR8W6zqHRZiBBGPms
         rBKCLU7f2DslA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4]  Add clock drivers for SM8350
Date:   Tue,  5 Jan 2021 21:16:41 +0530
Message-Id: <20210105154645.217998-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds gcc clock controller drivers for the controller found
in SM8350 SoC

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

Vinod Koul (2):
  clk: qcom: clk-alpha-pll: replace regval with val
  dt-bindings: clock: Add SM8350 GCC clock bindings

Vivek Aknurwar (2):
  clk: qcom: clk-alpha-pll: Add support for Lucid 5LPE PLL
  clk: qcom: gcc: Add clock driver for SM8350

 .../bindings/clock/qcom,gcc-sm8350.yaml       |   96 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  237 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    4 +
 drivers/clk/qcom/gcc-sm8350.c                 | 3790 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8350.h   |  261 ++
 7 files changed, 4387 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm8350.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8350.h

-- 
2.26.2


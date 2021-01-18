Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A78D2F98C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 05:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbhAREo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 23:44:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:56764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726350AbhAREo0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 23:44:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8F46224B0;
        Mon, 18 Jan 2021 04:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610945026;
        bh=AOeIzUAyMYJhagELJkXlIlVvJ3mEHHKHK6fP6TKYtC8=;
        h=From:To:Cc:Subject:Date:From;
        b=biAB2Xr2baQqdfX57k6P+JuluJ9hoMBlhuM5AbSN/d8zBkeYQwDgycILOlKLeunk+
         INei5/rkzqlXOColh0AoWysg7cnD8ksQQLRy56zXytltwnNSUH0QSXpbevkdpeKa4w
         Wk4j4pFjsEejs5OOfQPTwcVrdgb0BH2MHkb99tNVFYc3qI2V0QCSxA5XsDApqwzWET
         55m6SPLF02xR/U3PI7zgBofcDQV95zACLlXJaxmwvH7Z7wS5EGYvPyHZHBB3i5tGxp
         azfYeWGiOSBDx+wQGrBcNhEXGVJQyFw0qyOmUu3GJU3PBVS0cd/N0ijT6hmtf23Et1
         xki/6ww2aNxfw==
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
Subject: [PATCH v4 0/5] Add clock drivers for SM8350
Date:   Mon, 18 Jan 2021 10:13:16 +0530
Message-Id: <20210118044321.2571775-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds gcc clock controller drivers for the controller found
in SM8350 SoC

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
 include/dt-bindings/clock/qcom,gcc-sm8350.h   |  261 ++
 7 files changed, 4353 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm8350.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8350.h

-- 
2.26.2


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46ECF42091
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 11:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408702AbfFLJUi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 05:20:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:38564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406714AbfFLJUi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 05:20:38 -0400
Received: from localhost.localdomain (unknown [106.200.205.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51C3720874;
        Wed, 12 Jun 2019 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560331237;
        bh=NK48phJrRUNrbi0iWu66k5Gz34bzDthN5i0im4MU8qw=;
        h=From:To:Cc:Subject:Date:From;
        b=NJCrM79vqc4ovPSVq6kerBjbyO6jSvavvW4tuRPVGBEBcvLSjjT1yKwdkRHJ2s/Mi
         26XFmy3Gfvypha2nQKrZ4YSx5ktkQ1bS1Q0fjnx66aR5RpyQ/uEzp63wXLqWW6g1k+
         g7w839P9HG4zJwSWdXw7BWSL/aeiO4ClgQC0IZKU=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/5] clk: qcom: Add support for SM8150 GCC
Date:   Wed, 12 Jun 2019 14:47:17 +0530
Message-Id: <20190612091722.9377-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds suport for SM8150 GCC which requires Trion PLLs and adds
that as well.

Also fixed some minor nits seen in clk-alpha-pll code and module alias for
qcs404 gcc driver.

Changes since v2:
 - add more descripton on changes done on patches for upstreaming
 - fix comments by Stephen and convert clk driver to use modern way of
   specifying clk parent names.
 - Add 3 patches for issues seen in code

Deepak Katragadda (2):
  clk: qcom: clk-alpha-pll: Add support for Trion PLLs
  clk: qcom: gcc: Add global clock controller driver for SM8150

Vinod Koul (3):
  clk: qcom: clk-alpha-pll: Remove unnecessary cast
  clk: qcom: clk-alpha-pll: Remove post_div_table checks
  clk: qcom: gcc-qcs404: Add MODULE_ALIAS

 .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  247 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    7 +
 drivers/clk/qcom/gcc-qcs404.c                 |    1 +
 drivers/clk/qcom/gcc-sm8150.c                 | 3720 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8150.h   |  243 ++
 8 files changed, 4210 insertions(+), 17 deletions(-)
 create mode 100644 drivers/clk/qcom/gcc-sm8150.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8150.h

Thanks
-- 
2.20.1


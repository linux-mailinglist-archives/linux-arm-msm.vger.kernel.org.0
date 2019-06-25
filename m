Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4ACA5239A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 08:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfFYGfE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 02:35:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:41646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfFYGfE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 02:35:04 -0400
Received: from localhost.localdomain (unknown [106.201.40.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFD7920665;
        Tue, 25 Jun 2019 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561444503;
        bh=jaRZg8Lyv1gryWJtD9qHYk44ORaU/gzzn4DMHweDm0U=;
        h=From:To:Cc:Subject:Date:From;
        b=O2lyVNe1AxKaV0q2VFm6kJzUZM2vsIck+Ms1y7Tkgie55GHxldpkZGqclV7P8J46C
         zqdm/46jGXixI85WMbevwNjh5vkP9NS5uUPNMsE1asCoSTyxEW/3VahpRA00dTz50N
         GI0AzflGbCUPIaBGX5Oz2SG501KPeKpb0yiU49R0=
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
Subject: [PATCH v3 0/3] clk: qcom: Add support for SM8150 GCC
Date:   Tue, 25 Jun 2019 12:01:37 +0530
Message-Id: <20190625063140.17106-1-vkoul@kernel.org>
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

Changes in v3:
	- Drop the cast for DIV_ROUND_UP_ULL as that need s afix in macro,
	  so patch it up once core change in merged
	- Drop module alias patch and drop it from sm8150 driver
	- Add review tag by Bjorn

Deepak Katragadda (2):
  clk: qcom: clk-alpha-pll: Add support for Trion PLLs
  clk: qcom: gcc: Add global clock controller driver for SM8150

Vinod Koul (1):
  clk: qcom: clk-alpha-pll: Remove post_div_table checks

 .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  243 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    7 +
 drivers/clk/qcom/gcc-sm8150.c                 | 3719 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8150.h   |  243 ++
 7 files changed, 4206 insertions(+), 15 deletions(-)
 create mode 100644 drivers/clk/qcom/gcc-sm8150.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8150.h

-- 
2.20.1


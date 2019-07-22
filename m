Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BED796FA8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 09:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbfGVHpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 03:45:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:59764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbfGVHpQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 03:45:16 -0400
Received: from localhost.localdomain (unknown [223.226.98.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B1EF206DD;
        Mon, 22 Jul 2019 07:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563781514;
        bh=blJZQnL3zjC/Ylyb1/4CK7suE2Mz1qqUTcC8Wp+F2bE=;
        h=From:To:Cc:Subject:Date:From;
        b=jzW54M8jMZijPJ6Kxa47FE3bmTaj2/GsS0bX70oQ508RXtB+EmLzgxWhnY1YrDJdq
         1mnh3E40LScJJw7gBDUb8f3nMSF7mYhAdNd7dDQIbWyDI38StxszeCV89eE5gRKND0
         MLXfO6NNoSWk6S7DN+XXdWKQJTeHYK27kap+BBk8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v4 0/5] clk: qcom: Add support for SM8150 GCC
Date:   Mon, 22 Jul 2019 13:13:43 +0530
Message-Id: <20190722074348.29582-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds suport for SM8150 GCC which requires Trion PLLs and adds
that as well.

Also fixed some minor nits seen in clk-alpha-pll code

Changes in v4:
	- Bring back DIV_ROUND_UP_ULL patch as fix in merged upstream
	- Split binding to separate patch and add the gcc parent clock to it
	  (Didn't add Rob's ack as new clocks are added to patch, so need
	  review)
	- Fix the parent pointers for clock driver and add comments for
	  critical clocks and halt delay
	- Fix the trion pll enable and typo in patch
	- tested on v5.3-rc1

Changes in v3:
	- Drop the cast for DIV_ROUND_UP_ULL as that need s afix in macro,
	  so patch it up once core change in merged
	- Drop module alias patch and drop it from sm8150 driver
	- Add review tag by Bjorn

Deepak Katragadda (3):
  clk: qcom: clk-alpha-pll: Add support for Trion PLLs
  dt-bindings: clock: Document gcc bindings for SM8150
  clk: qcom: gcc: Add global clock controller driver for SM8150

Vinod Koul (2):
  clk: qcom: clk-alpha-pll: Remove unnecessary cast
  clk: qcom: clk-alpha-pll: Remove post_div_table checks

 .../devicetree/bindings/clock/qcom,gcc.txt    |   21 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  236 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    7 +
 drivers/clk/qcom/gcc-sm8150.c                 | 3588 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8150.h   |  243 ++
 7 files changed, 4086 insertions(+), 17 deletions(-)
 create mode 100644 drivers/clk/qcom/gcc-sm8150.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8150.h


base-commit: 5f9e832c137075045d15cd6899ab0505cfb2ca4b
-- 
2.20.1


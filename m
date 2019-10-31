Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2C74EAFFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 13:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfJaMVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 08:21:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37806 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaMV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 08:21:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6658E607EF; Thu, 31 Oct 2019 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524488;
        bh=Ki3aKynv1XZjEovrcTD2QZluVpFd7CgUvfnjPmWeN48=;
        h=From:To:Cc:Subject:Date:From;
        b=LhIKUufug+7s5Ssxfd7WneQNi6y0sHEAYTPCqle0BpIhE1wH6a+Lm//qCSVGgY5Ji
         hEg6bSKnskj8orFVhZcIcj/v9cD1mlTpGUaCqsAA44IZUI6+DLyQAOTDZmRPV98/jQ
         AtnHZUFYnG9pav9y5qLKEUHH971x35nJbxkvwHXQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 297F4601C4;
        Thu, 31 Oct 2019 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524487;
        bh=Ki3aKynv1XZjEovrcTD2QZluVpFd7CgUvfnjPmWeN48=;
        h=From:To:Cc:Subject:Date:From;
        b=VkO8QGUgWqrJeE5jMb3geNEIOw/9IeeledGAJosS5+ELY4zaeDSXgwotPQ8PDoW17
         /yTQ0kAq2aJw69fk2NeMFgdn4TH/eetDZoYPFhCluUvwuSnxqfkMQdwBOgoppvqu0z
         wlR9b8cRUk2Zhdlel2oEa2L2rZLRoCI3R6JdvOPo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 297F4601C4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 0/7] Add GPU & Video Clock controller driver for SC7180
Date:   Thu, 31 Oct 2019 17:51:06 +0530
Message-Id: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v1]
 * Fabia PLLs could fail latching in the case where the PLL is not
   calibrated, so add support to calibrate in prepare clock ops.

 * Add driver support for Graphics clock controller for SC7180 and also
   update device tree bindings for the various clocks supported in the
   clock controller.

 * Add driver support for Video clock controller for SC7180 and also
   update device tree bindings for the various clocks supported in the
   clock controller.

This change depends on below GCC clock driver series
https://patchwork.kernel.org/project/linux-clk/list/?series=187089

Taniya Das (7):
  clk: qcom: clk-alpha-pll: Add support for Fabia PLL calibration
  dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings
  dt-bindings: clock: Introduce QCOM Graphics clock bindings
  clk: qcom: Add graphics clock controller driver for SC7180
  dt-bindings: clock: Add YAML schemas for the QCOM VIDEOCC clock
    bindings
  dt-bindings: clock: Introduce QCOM Video clock bindings
  clk: qcom: Add video clock controller driver for SC7180

 .../devicetree/bindings/clock/qcom,gpucc.txt       |  24 --
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |  70 ++++++
 .../devicetree/bindings/clock/qcom,videocc.txt     |  18 --
 .../devicetree/bindings/clock/qcom,videocc.yaml    |  62 +++++
 drivers/clk/qcom/Kconfig                           |  16 ++
 drivers/clk/qcom/Makefile                          |   2 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  84 ++++++-
 drivers/clk/qcom/clk-alpha-pll.h                   |   4 +
 drivers/clk/qcom/gpucc-sc7180.c                    | 274 +++++++++++++++++++++
 drivers/clk/qcom/videocc-sc7180.c                  | 263 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sc7180.h      |  21 ++
 include/dt-bindings/clock/qcom,videocc-sc7180.h    |  23 ++
 12 files changed, 814 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,videocc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,videocc.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sc7180.c
 create mode 100644 drivers/clk/qcom/videocc-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc7180.h
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.


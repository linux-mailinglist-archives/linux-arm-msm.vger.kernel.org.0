Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD5CFDA76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbfKOKFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:05:21 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:35456 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfKOKFU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:05:20 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8E4EB617CB; Fri, 15 Nov 2019 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573812319;
        bh=XGTVUfdwEfTtaLkWyp7SQUqekT4GERDU54cFO0CncMQ=;
        h=From:To:Cc:Subject:Date:From;
        b=b9LLCo+VrawPJLr+tHPCLYGr/ZVEeQRRwVjRKad1QwDEZvUh+eVOs8qssHEbGYB3E
         2C27sQwxUtmOuyk7FNvKvcT5B2jz0cGxPh+8qCrJ2ePRonDo5LdoS3N+gjcFvVZ3W3
         oMNnjhqMqjSYRBHi/to03jlNtQ5mFC+tzPAbDyzU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A50B361802;
        Fri, 15 Nov 2019 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573812314;
        bh=XGTVUfdwEfTtaLkWyp7SQUqekT4GERDU54cFO0CncMQ=;
        h=From:To:Cc:Subject:Date:From;
        b=kb0HQXBmQJXzlFGSyLLPO387S1w1+YzwuvY1EEM9ffypJV7+Kapppa6x/M4JaR9Ls
         zecuv1Agl66Cg68l8TnH8lo8zk4KmAREjTbyg+TPgNG2cmHGACkIoIsJfKsr7G70eQ
         0TsFBnb3+R8TmYeSmJ32ADJ73Qofqc2kO74EsJ6M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A50B361802
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/8] Add GPU & Video Clock controller driver for SC7180
Date:   Fri, 15 Nov 2019 15:34:56 +0530
Message-Id: <1573812304-24074-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v2]
 * Split Fabia code cleanup and calibration code.
 * Few cleanups for GPU/Video CC are
    * header file inclusion, const for pll vco table.
    * removal of always enabled clock from gpucc.
    * compatibles added in sorted order.
    * move from core_initcall to subsys_initcall().
    * cleanup clk_parent_data for clocks to be provided from DT.

[v1]
 * Fabia PLLs could fail latching in the case where the PLL is not
   calibrated, so add support to calibrate in prepare clock ops.

 * Add driver support for Graphics clock controller for SC7180 and also
   update device tree bindings for the various clocks supported in the
   clock controller.

 * Add driver support for Video clock controller for SC7180 and also
   update device tree bindings for the various clocks supported in the
   clock controller.

Taniya Das (8):
  clk: qcom: alpha-pll: Remove useless read from set rate
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
 drivers/clk/qcom/clk-alpha-pll.c                   |  83 ++++++-
 drivers/clk/qcom/clk-alpha-pll.h                   |   4 +
 drivers/clk/qcom/gpucc-sc7180.c                    | 266 +++++++++++++++++++++
 drivers/clk/qcom/videocc-sc7180.c                  | 259 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sc7180.h      |  21 ++
 include/dt-bindings/clock/qcom,videocc-sc7180.h    |  23 ++
 12 files changed, 800 insertions(+), 48 deletions(-)
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


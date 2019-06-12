Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E43242F94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 21:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbfFLTKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 15:10:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43990 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbfFLTKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 15:10:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7E48D60DAD; Wed, 12 Jun 2019 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560366620;
        bh=PpXzJTcv8ItycyJTxzjx96xBpUQ+9JUzvtL8caAD2b4=;
        h=From:To:Cc:Subject:Date:From;
        b=jHsuUnH0IN/rWOzEPzsP4FTNnTIz2csMvFTh3+xmkJfaixp71MCv72/qMqILVOCzd
         1uJ3OF+DdY6ukGi7BMrWaKEBW6Ab0GDD9qMkbaEumPxjVqj1SKhFnBeFcg78RbH9+b
         oVVm6P0NdvNvJjTnOapBITnzDuW8JxGvXiA++OlE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B6C8C60DAB;
        Wed, 12 Jun 2019 19:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560366619;
        bh=PpXzJTcv8ItycyJTxzjx96xBpUQ+9JUzvtL8caAD2b4=;
        h=From:To:Cc:Subject:Date:From;
        b=huWUrGFlOUjsO4RjExq4Cy2hh+dNiS55XhKDTQriqE2QzSJyOmeF68j9fmh2IP3YD
         +XuZ8FonCYvyK3+oRct2dLHxGn4UAdzyZ1CKpT9PerngQ0nr016/GFbm3koSbrc+te
         HSPpRajmf0RpsdhcGPa+y6NvyoINQXtLbhaVCqTE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B6C8C60DAB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v5 0/6] MSM8998 Multimedia Clock Controller
Date:   Wed, 12 Jun 2019 13:10:00 -0600
Message-Id: <1560366600-5826-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The multimedia clock controller (mmcc) is the main clock controller for
the multimedia subsystem and is required to enable things like display and
camera.

v5:
-handle the case where gcc uses rpmcc for xo, but the link is not specified in dt
-have gcc select rpmcc

v4:
-fix makefile to use correct config item
-pick up tags
-fix ordering of clocks and clock-names in dt
-drop MODULE_ALIAS
-wait for xo in mmcc since that was found to be useful in some debug configs

v3:
-Rebase onto linux-next to get the final version of the clk parent rewrite
series
-Moved the bindings header to the bindings patch per Rob
-Made xo manditory for GCC to work around the lack of clk orphan probe defer
to avoid the uart console glitch

v2:
-Rebased on the "Rewrite clk parent handling" series and updated to the clk init
mechanisms introduced there.
-Marked XO clk as CLK_IGNORE_UNUSED to avoid the concern about the XO going away
"incorrectly" during late init
-Corrected the name of the XO clock to "xo"
-Dropped the fake XO clock in GCC to prevent a namespace conflict
-Fully enumerated the external clocks (DSI PLLs, etc) in the DT binding
-Cleaned up the weird newlines in the added DT node
-Added DT header file to msm8998 DT for future clients

Jeffrey Hugo (6):
  dt-bindings: clock: Document external clocks for MSM8998 gcc
  arm64: dts: msm8998: Add xo clock to gcc node
  clk: qcom: smd: Add XO clock for MSM8998
  dt-bindings: clock: Add support for the MSM8998 mmcc
  clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver
  arm64: dts: qcom: msm8998: Add mmcc node

 .../devicetree/bindings/clock/qcom,gcc.txt    |   10 +
 .../devicetree/bindings/clock/qcom,mmcc.txt   |   21 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |   16 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                |   24 +-
 drivers/clk/qcom/gcc-msm8998.c                |   29 +-
 drivers/clk/qcom/mmcc-msm8998.c               | 2915 +++++++++++++++++
 include/dt-bindings/clock/qcom,mmcc-msm8998.h |  210 ++
 9 files changed, 3214 insertions(+), 21 deletions(-)
 create mode 100644 drivers/clk/qcom/mmcc-msm8998.c
 create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h

-- 
2.17.1


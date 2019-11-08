Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBC96F594F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 22:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731490AbfKHVLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 16:11:05 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:33116 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfKHVLF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 16:11:05 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F279C60D51; Fri,  8 Nov 2019 21:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573247464;
        bh=gMzql+Ix2g0NxIDneQUQZiZH3kBmF6KyzpHa+IqKM94=;
        h=From:To:Cc:Subject:Date:From;
        b=RGuUvakd1kfgtcNvFquFLz8H9xKEocpsXph56HyjnYhoGW9GpMykKDJl2zZdU9wzl
         3y2cSUYy4mtHGzeuayqOc7jjBzDRZX/vC+kfLY7I2AqKq5tBAk64CF+0mxhthuugXd
         qM6fU80B0S3eAoBcQfZglxLeC8QlM6/+FVEedU3I=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E743E60D51;
        Fri,  8 Nov 2019 21:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573247463;
        bh=gMzql+Ix2g0NxIDneQUQZiZH3kBmF6KyzpHa+IqKM94=;
        h=From:To:Cc:Subject:Date:From;
        b=nHIXCDK3uVtepwNXZsxda7MsFEOjFXJ3/QVRJCXVdvwGrq5IL5HTzSqHP5OGMiR89
         EHoGjRedfI1cRqhTBumL8GIJLLIUldlLz4Ue9P1uANpRHxMXZ11TO42rB+O+7VURH/
         tC8LuCL0bqthYHqWxrfvZUXg3waIiBHsUBhHz/vo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E743E60D51
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     david.brown@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v7 0/6] MSM8998 Multimedia Clock Controller
Date:   Fri,  8 Nov 2019 14:10:50 -0700
Message-Id: <1573247450-19738-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The multimedia clock controller (mmcc) is the main clock controller for
the multimedia subsystem and is required to enable things like display and
camera.

v7:
-port to gcc.yaml.  Drop reviewed-by for DT changes as they got completely
rewritten
-drop "clk: qcom: smd: Add XO clock for MSM8998".  Will need to find another
solution and this is not blocking right now
-convert mmcc to yaml
-drop errant clk.h include
-use blank entries in the DT when no clock is available

v6:
-drop clk_get from mmcc clock provider

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
  dt-bindings: clock: Convert qcom,mmcc to DT schema
  dt-bindings: clock: Add support for the MSM8998 mmcc
  clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver
  arm64: dts: qcom: msm8998: Add mmcc node

 .../devicetree/bindings/clock/qcom,gcc.yaml   |   47 +-
 .../devicetree/bindings/clock/qcom,mmcc.txt   |   28 -
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |   96 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |   40 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/mmcc-msm8998.c               | 2913 +++++++++++++++++
 include/dt-bindings/clock/qcom,mmcc-msm8998.h |  210 ++
 8 files changed, 3302 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,mmcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
 create mode 100644 drivers/clk/qcom/mmcc-msm8998.c
 create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h

-- 
2.17.1


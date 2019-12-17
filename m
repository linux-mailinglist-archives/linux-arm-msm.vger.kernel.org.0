Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEA3B123000
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 16:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfLQPTi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 10:19:38 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:29358 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728238AbfLQPTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 10:19:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576595977; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rL62ogSm89mxzqo5jGWrbCifh9fRJzz4WrEa353v4VY=; b=uzCjJ9tXjDlWOQsvTCoS+U0Y9w0s8N5bFwZatJ1UyG6tz6kFqnFWMrAJrFu0kycSJYqTue2x
 OJ1hVz9+4jY16yLktidWud8iarvJYXgs8eccqVbXly8pBvY7WPK1xdxnHMSkRbLTifWDoHtA
 xuZPyvFuy3GuVf9iYmggFVBjqC8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df8f203.7f3c7a516e30-smtp-out-n03;
 Tue, 17 Dec 2019 15:19:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 259B5C433A2; Tue, 17 Dec 2019 15:19:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72CADC43383;
        Tue, 17 Dec 2019 15:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72CADC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     sboyd@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v11 0/4] MSM8998 Multimedia Clock Controller
Date:   Tue, 17 Dec 2019 08:19:14 -0700
Message-Id: <1576595954-9991-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The multimedia clock controller (mmcc) is the main clock controller for
the multimedia subsystem and is required to enable things like display and
camera.

v11:
-rebsed to 5.5-rc1
-picked up review tags

v10:
-Add Taniya Das as co-maintainer as she indicated a willingness to do so
-Add sleep clock
-Add a gcc example per request
-Pick up tags

v9:
-expand the commit text for the DT changes a bit more to explain some of the
extra changes

v8:
-drop dts changes from series per Stephen's request
-fix the mislabeled mmcc example
-drop Stephen as maintainer of the mmcc binding

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

Jeffrey Hugo (4):
  dt-bindings: clock: Document external clocks for MSM8998 gcc
  dt-bindings: clock: Convert qcom,mmcc to DT schema
  dt-bindings: clock: Add support for the MSM8998 mmcc
  clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver

 .../devicetree/bindings/clock/qcom,gcc.yaml        |   73 +-
 .../devicetree/bindings/clock/qcom,mmcc.txt        |   28 -
 .../devicetree/bindings/clock/qcom,mmcc.yaml       |   98 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/mmcc-msm8998.c                    | 2913 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,mmcc-msm8998.h      |  210 ++
 7 files changed, 3290 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,mmcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
 create mode 100644 drivers/clk/qcom/mmcc-msm8998.c
 create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h

-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

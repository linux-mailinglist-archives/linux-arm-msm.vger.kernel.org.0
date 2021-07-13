Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA833C72F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 17:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237029AbhGMPRG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 11:17:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55895 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237036AbhGMPRD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 11:17:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626189254; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=geWynaJJrC10VJR2i0AbaYFJW+GpDlbTGEZUL8tGP4U=; b=La+uBVub5s1jK9h3qQmxDtCh3pvc7cW9e3rXRWmIk9opNHrty+6xCGpVKksv22ftIqeHTWck
 e7eKqncIdD5O9U+GXOcxrnRn0almigGKIL4bEeJV7h1heqqXPti95bI5FoavGZZ/Pl3fA7ms
 drD1vyZmzZCWCFOor1qjQKuiHUQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60edad6706ea41c941b27b98 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 15:12:39
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 319FCC43460; Tue, 13 Jul 2021 15:12:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 95072C433F1;
        Tue, 13 Jul 2021 15:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95072C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 0/7] Add support for DISP/VIDEO/GPU CCs for SC7280
Date:   Tue, 13 Jul 2021 20:42:16 +0530
Message-Id: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for display, video & graphics clock controllers on SC7280
along with the bindings for each of the clock controllers.

[v3]
 * Update BSD license for Device Tree documentation and bindings for display,
   graphics, video and also global clock controller.
 * Update 'const' for all the VCO tables.
 * Remove critical video xo clock from video driver as the clock is enabled
   from HW and no SW modelled clock required.

[v2]
 * Use the .hws instead of clk_parent_data when the whole array is
   clk_hw pointers for all the clock drivers.

[v1]
 * Documentation binding for DISP, GPU, VIDEO clock controller for SC7280.
 * Add the DISP, GPU, VIDEO clock drivers for SC7280.

Taniya Das (7):
  dt-bindings: clock: qcom: Update license for GCC SC7280
  dt-bindings: clock: Add SC7280 DISPCC clock binding
  clk: qcom: Add display clock controller driver for SC7280
  dt-bindings: clock: Add SC7280 GPUCC clock binding
  clk: qcom: Add graphics clock controller driver for SC7280
  dt-bindings: clock: Add SC7280 VideoCC clock binding
  clk: qcom: Add video clock controller driver for SC7280

 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   6 +-
 .../bindings/clock/qcom,sc7280-dispcc.yaml         |  94 +++
 .../devicetree/bindings/clock/qcom,videocc.yaml    |   6 +-
 drivers/clk/qcom/Kconfig                           |  25 +
 drivers/clk/qcom/Makefile                          |   3 +
 drivers/clk/qcom/dispcc-sc7280.c                   | 908 +++++++++++++++++++++
 drivers/clk/qcom/gpucc-sc7280.c                    | 491 +++++++++++
 drivers/clk/qcom/videocc-sc7280.c                  | 325 ++++++++
 include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  55 ++
 include/dt-bindings/clock/qcom,gcc-sc7280.h        |   2 +-
 include/dt-bindings/clock/qcom,gpucc-sc7280.h      |  35 +
 include/dt-bindings/clock/qcom,videocc-sc7280.h    |  27 +
 12 files changed, 1972 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sc7280.c
 create mode 100644 drivers/clk/qcom/gpucc-sc7280.c
 create mode 100644 drivers/clk/qcom/videocc-sc7280.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sc7280.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc7280.h
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sc7280.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.


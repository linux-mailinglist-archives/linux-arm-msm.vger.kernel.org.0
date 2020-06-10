Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60BF1F5A14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 19:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgFJRSm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 13:18:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:22270 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728253AbgFJRSl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 13:18:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591809521; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=nxi/PGUd2Nz7sCq1j6UIB/PKdUyrLOXHbbMcUCzd5kU=; b=eKjc5fg/z+LMOZMX7s/me++CHC+W0yyToT1yzhU9zcnuo8JPuKcBtmqE2fpOkZI/CGTIp8b5
 wp8cO9HOfc25RTZU+LOsGADv2PJF4ZSrJjBtoWKzZtmurUajemC3D53fYoAAynmMXgwAmaiC
 A3tIHRIRgHvoQHkmjRI+n+9OqQo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ee115de5866879c7650cb05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Jun 2020 17:18:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26DDFC4339C; Wed, 10 Jun 2020 17:18:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CC2CC433CA;
        Wed, 10 Jun 2020 17:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8CC2CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
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
Subject: [PATCH v3 0/4] clk: qcom: Support for Low Power Audio Clocks on SC7180
Date:   Wed, 10 Jun 2020 22:48:03 +0530
Message-Id: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v3]
 * Update the clock-name to iface instead of gcc_lpass_sway.
 * Update the documentation with the reg descriptions and use maxItems.

[v2]
 * Update retention macro name.
 * Update the register description in the documentation.

[v1]
 * Add support for Retention of GDSCR.
 * Add YAML schema for LPASS clocks and clock IDs for LPASS.
 * Add clock driver for LPASS core clocks and GCC LPASS clock.

Taniya Das (4):
  clk: qcom: gdsc: Add support to enable retention of GSDCR
  dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7180
  clk: qcom: gcc: Add support for GCC LPASS clock for SC7180
  clk: qcom: lpass: Add support for LPASS clock controller for SC7180

 .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    |  98 +++++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-sc7180.c                      |  14 +
 drivers/clk/qcom/gdsc.c                            |  12 +
 drivers/clk/qcom/gdsc.h                            |   1 +
 drivers/clk/qcom/lpasscorecc-sc7180.c              | 478 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h        |   1 +
 .../dt-bindings/clock/qcom,lpasscorecc-sc7180.h    |  29 ++
 9 files changed, 643 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
 create mode 100644 drivers/clk/qcom/lpasscorecc-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.


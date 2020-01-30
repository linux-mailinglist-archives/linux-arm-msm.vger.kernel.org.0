Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63BEA14D58A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 05:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbgA3ETJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 23:19:09 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:52449 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727069AbgA3ETJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 23:19:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580357949; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9bR2g9tbVwKjs+QZ9HECb6QYigrlwi+UX4vqqyB1mIY=; b=bht9i79H68kqFr+gNk+Tc/LqiXKXcgLlti3U14j1eIf4YIp0ByOkZ6dGUPykwR93uWkdXbDL
 7zAhzAOIZYfETFTSLN4TVpMHEZbNr+GRuS/vjD0ozR63/Z8gtkOA0S4JOnwXVyuQf+xum2V4
 2NoZpTkMJM1qQ/zE9X05XFLB+yM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e32593a.7fbfea173d18-smtp-out-n02;
 Thu, 30 Jan 2020 04:19:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB2A8C4479F; Thu, 30 Jan 2020 04:19:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2A7DC43383;
        Thu, 30 Jan 2020 04:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2A7DC43383
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
Subject: [PATCH v3 0/3] Add modem Clock controller (MSS CC) driver for SC7180
Date:   Thu, 30 Jan 2020 09:48:40 +0530
Message-Id: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v3]
  * Add clocks/clock-names required for the MSS clock controller.
  * Add pm_ops to enable/disable the required dependent clock.
  * Add parent_data for the MSS clocks.
  * Update the GCC MSS clocks from _CBCR to _CLK.

[v2]
  * Update the license for the documentation and fix minor comments in the
    YAML bindings.

[v1]
  * Add driver support for Modem clock controller for SC7180 and also
    update device tree bindings for the various clocks supported in the
    clock controller.

Taniya Das (3):
  dt-bindings: clock: Add YAML schemas for the QCOM MSS clock bindings
  dt-bindings: clock: Introduce QCOM Modem clock bindings
  clk: qcom: Add modem clock controller driver for SC7180

 .../devicetree/bindings/clock/qcom,mss.yaml        |  58 +++++++++
 drivers/clk/qcom/Kconfig                           |   9 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-sc7180.c                      |  70 ++++++++++
 drivers/clk/qcom/mss-sc7180.c                      | 143 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h        |   5 +
 include/dt-bindings/clock/qcom,mss-sc7180.h        |  12 ++
 7 files changed, 298 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
 create mode 100644 drivers/clk/qcom/mss-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

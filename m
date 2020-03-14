Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9182318583A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2020 02:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgCOB6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Mar 2020 21:58:25 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:31358 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726853AbgCOB6Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Mar 2020 21:58:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584237504; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bab8s4tBbO8m9drWNuWpC59mcIOm3kFwBEnRSL7ZdyI=; b=lEe3pbo29e7kjgwQR+z+PZCL7XTWW5u+t1c0HPTVchhpHyiI+NCewUpQO4I8GtyjWt9ndjvd
 cAzkUXsUQnGOg3X/SO5Fd8boXCYh5omI/20OpVGe5TA++ZKuMn/YXBNViAE/iLQTgOaiuKsh
 e0kk428buUaquIU7NUDFqo+LMBw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6d2768.7f0a8051d0d8-smtp-out-n04;
 Sat, 14 Mar 2020 18:50:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CEA46C43636; Sat, 14 Mar 2020 18:50:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC741C433CB;
        Sat, 14 Mar 2020 18:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC741C433CB
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
Subject: [PATCH v6 0/3] Add modem Clock controller (MSS CC) driver for SC7180
Date:   Sun, 15 Mar 2020 00:19:55 +0530
Message-Id: <1584211798-10332-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v6]
 * Combine the Documentation YAML schema and clock IDs for GCC MSS and
   MSS clocks.
 * Remove a unnecessary header file inclusion, define the max_registers for
   regmap and also update the fw_name to remove _clk suffix.
 * Update the copyright year.

[v5]
 * Update the clock ID for GCC_MSS_NAV_AXIS_CLK to GCC_MSS_NAV_AXI_CLK

[v4]
 * Split the GCC MSS clocks and Modem clock driver.
 * Update mss_regmap_config to const.
 * Rename the Documentation binding as per the latest convention.
 * Minor comments of clock-names/clocks properties updated.

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
  clk: qcom: gcc: Add support for modem clocks in GCC
  clk: qcom: Add modem clock controller driver for SC7180

 .../devicetree/bindings/clock/qcom,sc7180-mss.yaml |  62 +++++++++
 drivers/clk/qcom/Kconfig                           |   9 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-sc7180.c                      |  72 ++++++++++-
 drivers/clk/qcom/mss-sc7180.c                      | 143 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h        |   7 +-
 include/dt-bindings/clock/qcom,mss-sc7180.h        |  12 ++
 7 files changed, 304 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
 create mode 100644 drivers/clk/qcom/mss-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

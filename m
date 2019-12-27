Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F2212B101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 05:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfL0EnI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 23:43:08 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:63878 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727047AbfL0EnH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 23:43:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577421787; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jjnGo5m0k2+Y839lX1GftsdU7nefXOeX3wW6IIf2kys=; b=jjAhTWgAtQ2knCdGMXovaUvBRFQaftqB2Tw8bu1dqFI/z7LUqiGLCcuH0XmufKmcUqWRlGjv
 uYo9Vzil1MNHo6fB9E6NVvNUAI++368D2tDx22L4myzqRF+qNkLW8S5Id6DTkO5UEtRd24eL
 YbK+2Z3I+hpsYaMSXMbqNP+yok4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e058bd1.7f4126e0a4c8-smtp-out-n01;
 Fri, 27 Dec 2019 04:42:57 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BDAF2C4479F; Fri, 27 Dec 2019 04:42:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E73E6C433CB;
        Fri, 27 Dec 2019 04:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E73E6C433CB
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
Subject: [PATCH v2 0/3] Add modem Clock controller (MSS CC) driver for SC7180
Date:   Fri, 27 Dec 2019 10:12:37 +0530
Message-Id: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

 .../devicetree/bindings/clock/qcom,mss.yaml        | 41 ++++++++++
 drivers/clk/qcom/Kconfig                           |  9 +++
 drivers/clk/qcom/Makefile                          |  1 +
 drivers/clk/qcom/gcc-sc7180.c                      | 70 ++++++++++++++++
 drivers/clk/qcom/mss-sc7180.c                      | 94 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h        |  5 ++
 include/dt-bindings/clock/qcom,mss-sc7180.h        | 12 +++
 7 files changed, 232 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
 create mode 100644 drivers/clk/qcom/mss-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

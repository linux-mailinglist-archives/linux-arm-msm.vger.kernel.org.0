Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF7117147B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 10:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbgB0Jz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 04:55:29 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:38118 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728713AbgB0Jz3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 04:55:29 -0500
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Feb 2020 01:55:28 -0800
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg03-sd.qualcomm.com with ESMTP; 27 Feb 2020 01:55:24 -0800
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 86954214E2; Thu, 27 Feb 2020 15:25:22 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sivaprak@codeaurora.org
Subject: [PATCH 0/2] Add APSS clock controller support for IPQ6018
Date:   Thu, 27 Feb 2020 15:25:16 +0530
Message-Id: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The APSS clock controller in ipq6018 based devices supports cpu with
frequencies above 800Mhz.

This patch series adds the support for the same.

Sivaprakash Murugesan (2):
  clk: qcom: Add DT bindings for ipq6018 apss clock controller
  clk: qcom: Add ipq6018 apss clock controller

 .../devicetree/bindings/clock/qcom,apsscc.yaml     |  58 ++++++
 drivers/clk/qcom/Kconfig                           |   8 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/apss-ipq6018.c                    | 210 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,apss-ipq6018.h      |  26 +++
 5 files changed, 303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
 create mode 100644 drivers/clk/qcom/apss-ipq6018.c
 create mode 100644 include/dt-bindings/clock/qcom,apss-ipq6018.h

-- 
2.7.4


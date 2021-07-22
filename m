Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF0353D2EC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 23:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhGVU3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 16:29:39 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:63516 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231154AbhGVU3f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 16:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626988210; x=1658524210;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zzVHvsy9guulRS91R6eWfP1dC1lWmabuPtdlztmGJNs=;
  b=fSkrF/fOb4SbXPzbQXApnCoNyGeWV2gVGCFHaDBKWII6nOqJJqxiOQv0
   JjxwbU0v1xj8jdxWZIhiaE8FPvebj7m+LUBQwHUGMHqaRg53M4Ns02e+S
   kWnCps2PYbfw04ix0MrziMZQY8M5ch1aYF8ITsT36qBRSfY89vC5cu2I8
   A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jul 2021 14:10:09 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jul 2021 14:10:09 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 22 Jul 2021 14:10:08 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v2 0/6] Add Pdc, GCC and RPMh clock support for SDX65 
Date:   Thu, 22 Jul 2021 14:09:37 -0700
Message-ID: <cover.1626986805.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

Changes from v1:
 - Addressed Bjorn's comments related to the GCC support patch
 - Collected Bjorn's and Rob's Reviewed-by for the dt-bindings patches

This patch series adds bindings and device driver changes for GCC, pdc and RPMh
clock support for SDX65 Platform.

Thanks,
Vamsi

Vamsi Krishna Lanka (2):
  clk: qcom: Add new PLL type for SDX65
  clk: qcom: Add SDX65 GCC support

Vamsi krishna Lanka (4):
  dt-bindings: clock: Add SDX65 GCC clock bindings
  dt-bindings: clock: Introduce RPMHCC bindings for SDX65
  clk: qcom: Add support for SDX65 RPMh clocks
  dt-bindings: clock: Introduce pdc bindings for SDX65

 .../bindings/clock/qcom,gcc-sdx65.yaml        |   79 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../interrupt-controller/qcom,pdc.txt         |    1 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  170 ++
 drivers/clk/qcom/clk-alpha-pll.h              |    4 +
 drivers/clk/qcom/clk-rpmh.c                   |   27 +
 drivers/clk/qcom/gcc-sdx65.c                  | 1597 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx65.h    |  122 ++
 10 files changed, 2010 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
 create mode 100644 drivers/clk/qcom/gcc-sdx65.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h

-- 
2.32.0


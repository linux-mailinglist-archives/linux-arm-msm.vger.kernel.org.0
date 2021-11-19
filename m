Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCDF4569FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 07:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbhKSGO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 01:14:57 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15185 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbhKSGO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 01:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637302316; x=1668838316;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yLibkCwwOUozNYKaIqem4036qsuB24KpYkk7La8iVcw=;
  b=gFTFh2Fzu08BjgnLNISikjqYI8K+YN9HXZfTaAKUFHqoMYPk6be0wBvN
   cICOPcMiNUKTXQvmOqpLqJSFdDRoLmj4f8TMfpxG7FV6Q2hGrlnucnqI8
   pnBGHjpwKw8kUgBkdhihylleZUFRd8lkPT2i1jXvSR0/Qfka+hEwkoDoY
   4=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 18 Nov 2021 22:11:55 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 22:11:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 22:11:52 -0800
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 22:11:52 -0800
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Subject: [PATCH v5 0/6] Add Pdc, GCC and RPMh clock support for SDX65 
Date:   Thu, 18 Nov 2021 22:11:32 -0800
Message-ID: <cover.1637302009.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

Changes from v4:
 - Fixed comments from vinod koul on Clock Alpha PLL and GCC driver support patches
 - Addressed Rob's comments related to GCC dt-binding patch  
 - Collected Vinod Koul's Reviewed-by for the dt-bindings patches

Changes from v3:
 - Fixed DTbindings and unused variables errors reported by kernel test bot
 - Rebased on top of v5.16-rc1

Changes from v2:
 - Addressed Taniya Das and Vinod Koul's comments related to adding LUCID_EVO
   PLL type and rpmh support patches
 - Collected Rob's Acked-by for the dt-bindings patches

Changes from v1:
 - Addressed Bjorn's comments related to the GCC support patch
 - Collected Bjorn's and Rob's Reviewed-by for the dt-bindings patches

This patch series adds bindings and device driver changes for GCC, pdc and RPMh
clock support for SDX65 Platform.

Thanks,
Vamsi

Vamsi Krishna Lanka (3):
  clk: qcom: Add LUCID_EVO PLL type for SDX65
  clk: qcom: Add SDX65 GCC support
  dt-bindings: clock: Introduce pdc bindings for SDX65

 .../bindings/clock/qcom,gcc-sdx65.yaml        |   80 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../interrupt-controller/qcom,pdc.txt         |    1 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  204 ++-
 drivers/clk/qcom/clk-alpha-pll.h              |    3 +
 drivers/clk/qcom/clk-rpmh.c                   |   25 +
 drivers/clk/qcom/gcc-sdx65.c                  | 1603 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx65.h    |  122 ++
 10 files changed, 2022 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
 create mode 100644 drivers/clk/qcom/gcc-sdx65.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h


base-commit: 4c388a8e740d3235a194f330c8ef327deef710f6
-- 
2.33.1


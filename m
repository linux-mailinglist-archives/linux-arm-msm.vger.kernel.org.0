Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEBA452C23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 08:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhKPHup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 02:50:45 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22136 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbhKPHup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 02:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637048868; x=1668584868;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wUi+LmWmWt7N0qIv/AFSpcpNjrr6d2HeC8ik8bKgGfI=;
  b=TZx7Q2qoO3u2atYYhP8h0kzmfhzvZIgyARL9wJVYRFwXNt8CN7lDJbra
   W21xiatuLiJqtEOSv27RdKtSiQI9CnQ9//zMhoPb3Gw/oWES3+nl8t5J0
   7uLBTjQtjsEk7TWKErB9rKZ9uxNnkuile/OKszesDtCHfk9uxdpEuGHZm
   s=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 15 Nov 2021 23:47:46 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 23:38:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 15 Nov 2021 23:38:27 -0800
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 15 Nov 2021 23:38:26 -0800
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Subject: [PATCH v4 0/6] Add Pdc, GCC and RPMh clock support for SDX65 
Date:   Mon, 15 Nov 2021 23:38:06 -0800
Message-ID: <cover.1637047731.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

Changes from v3:
 - Fixed DTbindings and unused varaibles errors reported by kernel test bot
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

 .../bindings/clock/qcom,gcc-sdx65.yaml        |   78 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../interrupt-controller/qcom,pdc.txt         |    1 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  171 ++
 drivers/clk/qcom/clk-alpha-pll.h              |    3 +
 drivers/clk/qcom/clk-rpmh.c                   |   25 +
 drivers/clk/qcom/gcc-sdx65.c                  | 1589 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx65.h    |  122 ++
 10 files changed, 1999 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
 create mode 100644 drivers/clk/qcom/gcc-sdx65.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h


base-commit: 8ab774587903771821b59471cc723bba6d893942
-- 
2.33.1


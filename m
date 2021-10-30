Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62484405FE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 02:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhJ3ADY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 20:03:24 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:14184 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231271AbhJ3ADY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 20:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635552055; x=1667088055;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=h93vLW2TLTafgwoTepYDQdgP3SwjiW+APNoViyK7yQc=;
  b=WEyfZUXVWY5did7YzmrGrtjQs6WSKz0cXwsxvJJpYyZFQfLZ5uVgyZhB
   BSh53fj4aaGuS7sSQhOopIHG7FCzDMYiv4W+ciASkSELoqYugACYQTj62
   FiWkFq8iC6juEe3M9Vtk63lf3P+JM47K8B0qfa6+6taik+IC2DeKAxELA
   4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Oct 2021 17:00:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 17:00:54 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:00:54 -0700
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:00:53 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v3 0/6] Add Pdc, GCC and RPMh clock support for SDX65 
Date:   Fri, 29 Oct 2021 17:00:36 -0700
Message-ID: <1635552042-16250-1-git-send-email-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

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

Vamsi krishna Lanka (3):
  dt-bindings: clock: Add SDX65 GCC clock bindings
  dt-bindings: clock: Introduce RPMHCC bindings for SDX65
  clk: qcom: Add support for SDX65 RPMh clocks

 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |   78 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/interrupt-controller/qcom,pdc.txt     |    1 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  171 +++
 drivers/clk/qcom/clk-alpha-pll.h                   |    3 +
 drivers/clk/qcom/clk-rpmh.c                        |   25 +
 drivers/clk/qcom/gcc-sdx65.c                       | 1597 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx65.h         |  122 ++
 10 files changed, 2007 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
 create mode 100644 drivers/clk/qcom/gcc-sdx65.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h

-- 
2.7.4


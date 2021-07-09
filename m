Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9633C29F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 22:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhGIUG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 16:06:59 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:45314 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhGIUG6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 16:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1625861055; x=1657397055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TXEmRj6c2Z2DMWwrtKF7LtWUScbHxh+quywEMervRf0=;
  b=qUvJJ7Cr5KvienoTW1VhfbpoBN8bnshjVt0LTQKrYk5oQ+1/DerMmFYV
   2UybkMP1Bo/rCDYGReTrSkt/3TAHPJ4sI2HuMQFvTAFnMWtrS8Qa9E+Na
   2ahqgMvX2zhj+PUZtBB9kf8R+P3aV8DJWgiDYbXyFGt4RD4fON7tUMnps
   k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 09 Jul 2021 13:04:14 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Jul 2021 13:04:13 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nalasexr03e.na.qualcomm.com (10.49.195.114) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 9 Jul 2021 13:04:12 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH 0/5] Add Pdc, GCC and RPMh clock support for SDX65
Date:   Fri, 9 Jul 2021 13:03:34 -0700
Message-ID: <20210709200339.17638-1-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03d.na.qualcomm.com (10.85.0.91) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

This patch series adds bindings and device driver changes for GCC, pdc and RPMh
clock support for SDX65 Platform.

Thanks,
Vamsi 

Vamsi krishna Lanka (5):
  dt-bindings: clock: Add SDX65 GCC clock bindings
  clk: qcom: Add SDX65 GCC support
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
 drivers/clk/qcom/clk-rcg.h                    |    4 +
 drivers/clk/qcom/clk-rpmh.c                   |   27 +
 drivers/clk/qcom/gcc-sdx65.c                  | 1648 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx65.h    |  122 ++
 11 files changed, 2065 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
 create mode 100644 drivers/clk/qcom/gcc-sdx65.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h

-- 
2.32.0


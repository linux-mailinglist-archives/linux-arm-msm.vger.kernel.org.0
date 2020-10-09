Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9463F288508
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 10:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732644AbgJIIR2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 04:17:28 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:63362 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732490AbgJIIR1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 04:17:27 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 09 Oct 2020 01:17:27 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Oct 2020 01:17:25 -0700
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 09 Oct 2020 13:47:06 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id E227B21C10; Fri,  9 Oct 2020 13:47:04 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        manivannan.sadhasivam@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
Cc:     sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH v4 0/3] Add board support for HK10 board variants
Date:   Fri,  9 Oct 2020 13:47:01 +0530
Message-Id: <1602231424-22288-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added support for HK10-C1 and HK10-C2 board variants based on IPQ8074 SoC.
Both these variants support dual QCN9000 PCIe cards that uses MHI communication
protocol over PCIe. In addition, HK10-C1 support on-chip radio.
Both these variants slightly differ in clock configuation for ethernet.

This series depends on below series:
[V2,0/7] Add PCIe support for IPQ8074
[v7,0/9] remoteproc: qcom: q6v5-wcss: Add support for secure pil

changes since v3:
 - Addressed build failure reported by test robot
   in patch 3

changes since v2:
 - In patch 3, Moved pcie0_rp and pcie1_rp nodes and
   removed unused members and subnodes

Gokul Sriram Palanisamy (3):
  dt-bindings: qcom: Add ipq8074 bindings
  arm64: dts: Add board support for HK10
  arm64: dts: Enabled MHI device over PCIe

 Documentation/devicetree/bindings/arm/qcom.yaml |   4 +
 arch/arm64/boot/dts/qcom/Makefile               |   2 +
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts    |  11 +++
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts    |  14 +++
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi      | 122 ++++++++++++++++++++++++
 5 files changed, 153 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi

-- 
2.7.4


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC483325F0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 09:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhBZIas (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 03:30:48 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60875 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhBZIap (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 03:30:45 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 Feb 2021 00:30:00 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Feb 2021 00:29:58 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 26 Feb 2021 13:59:33 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id E6D9720E0E; Fri, 26 Feb 2021 13:59:31 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org,
        sboyd@kernel.org, sricharan@codeaurora.org,
        Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Subject: [PATCH v5] Add board support for HK10 board variants
Date:   Fri, 26 Feb 2021 13:58:29 +0530
Message-Id: <1614328110-28866-1-git-send-email-gokulsri@codeaurora.org>
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
[v8,0/9] remoteproc: qcom: q6v5-wcss: Add support for secure pil

changes since v4:
 - Addressed review comments.
 - Addressing Kalle's comments, removed memory reservations in dts.
 - Addressing Manivannan's comments, removed dts entry for mhi

changes since v3:
 - Addressed build failure reported by test robot
   in patch 3

changes since v2:
 - In patch 3, Moved pcie0_rp and pcie1_rp nodes and
   removed unused members and subnodes


Gokul Sriram Palanisamy (1):
  arm64: dts: Add board support for HK10

 arch/arm64/boot/dts/qcom/Makefile            |  2 +
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts | 11 ++++
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts | 14 +++++
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi   | 76 ++++++++++++++++++++++++++++
 4 files changed, 103 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi

-- 
2.7.4


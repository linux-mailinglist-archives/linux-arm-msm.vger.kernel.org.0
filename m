Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12E131A49E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 20:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgDJS3x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 14:29:53 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:36512 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726671AbgDJS3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 14:29:42 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Apr 2020 11:29:41 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg02-sd.qualcomm.com with ESMTP; 10 Apr 2020 11:29:37 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 2C07521680; Fri, 10 Apr 2020 23:59:36 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH 0/3] Enable USB support in IPQ8074
Date:   Fri, 10 Apr 2020 23:59:29 +0530
Message-Id: <1586543372-13969-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 has two super speed USB ports, with QMP and QUSB2 PHYs.
This patch set enables the USB PHYs and USB dwc3 in IPQ8074.

This patch set depends on Sandeep's QMP PHY binding patch
https://patchwork.ozlabs.org/patch/1265442/

Sivaprakash Murugesan (3):
  dt-bindings: phy: qcom,qmp: Add ipq8074 usb dt bindings
  phy: qcom-qmp: Add USB QMP PHY support for IPQ8074
  arm64: dts: ipq8074: enable USB support

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml      |   2 +
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |  24 +++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 168 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 102 +++++++++++++
 4 files changed, 296 insertions(+)

-- 
2.7.4


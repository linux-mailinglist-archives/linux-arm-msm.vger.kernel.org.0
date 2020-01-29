Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 920AA14CBC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 14:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgA2Nwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 08:52:30 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:11989 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726240AbgA2Nwa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 08:52:30 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2020 19:22:26 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 Jan 2020 19:22:03 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id BE94A257F; Wed, 29 Jan 2020 19:22:02 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v4 0/8] Add QUSB2 PHY support for SC7180
Date:   Wed, 29 Jan 2020 19:21:51 +0530
Message-Id: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Converting dt binding to yaml.
Adding compatible for SC7180 in dt bindings.
Added generic QUSB2 V2 PHY support and using the same SC7180 and SDM845.

Changes in v4:
*Addressed Rob Herrings comments in dt bindings.
*Added new structure for all the overriding tuning params.
*Removed the sc7180 and sdm845 compatible from driver and added qusb2 v2 phy. 
*Added the qusb2 v2 phy compatible in device tree for sc7180 and sdm845. 

Changes in v3:
*Using the generic phy cfg table for QUSB2 V2 phy.
*Added support for overriding tuning parameters in QUSB2 V2 PHY
from device tree.

Changes in v2:
Sorted the compatible in driver.
Converted dt binding to yaml.
Added compatible in yaml.

Sandeep Maheswaram (8):
  dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml
  dt-bindings: phy: qcom,qusb2: Add compatibles for QUSB2 V2 phy and
    SC7180
  phy: qcom-qusb2: Add generic QUSB2 V2 PHY support
  dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning
    parameters
  phy: qcom-qusb2: Add support for overriding tuning parameters in QUSB2
    V2 PHY
  arm64: dts: qcom: sc7180: Add generic QUSB2 V2 Phy compatible
  arm64: dts: qcom: sdm845: Add generic QUSB2 V2 Phy compatible
  arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy params for SC7180 IDP
    device

 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 182 +++++++++++++++++++++
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 --------
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   6 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   4 +-
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 143 +++++++++++-----
 6 files changed, 291 insertions(+), 114 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


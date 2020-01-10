Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8EFF136CE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 13:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgAJMTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 07:19:13 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:23802 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728116AbgAJMTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 07:19:12 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Jan 2020 17:49:07 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Jan 2020 17:48:45 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 0355522B4; Fri, 10 Jan 2020 17:48:44 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v3 0/5] Add QUSB2 PHY support for SC7180
Date:   Fri, 10 Jan 2020 17:48:14 +0530
Message-Id: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added QUSB2 PHY support for SC7180.
Converting dt binding to yaml.
Adding compatible for SC7180 in dt bindings.

Changes in v3:
*Using the generic phy cfg table for QUSB2 V2 phy.
*Added support for overriding tuning parameters in QUSB2 V2 PHY
from device tree.

Changes in v2:
Sorted the compatible in driver.
Converted dt binding to yaml.
Added compatible in yaml.

Sandeep Maheswaram (5):
  phy: qcom-qusb2: Add QUSB2 PHY support for SC7180
  dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml
  dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning
    parameters
  phy: qcom-qusb2: Add support for overriding tuning parameters in QUSB2
    V2 PHY
  arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy tuning params for SC7180

 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 185 +++++++++++++++++++++
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 --------
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   6 +-
 drivers/phy/qualcomm/phy-qcom-qusb2.c              |  73 +++++++-
 4 files changed, 254 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


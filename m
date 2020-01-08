Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7581341BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 13:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbgAHMbG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 07:31:06 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:61022 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727884AbgAHMbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 07:31:05 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Jan 2020 18:00:19 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 Jan 2020 17:59:59 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 0A3F11AA2; Wed,  8 Jan 2020 17:59:57 +0530 (IST)
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
Subject: [PATCH v2 0/3] Add QMP V3 USB3 PHY support for SC7180
Date:   Wed,  8 Jan 2020 17:59:38 +0530
Message-Id: <1578486581-7540-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QMP V3 USB3 PHY entries for SC7180 in phy driver and
device tree bindings.

changes in v2:
*Remove global phy reset in QMP phy.
*Convert QMP phy bindings to yaml.

Sandeep Maheswaram (3):
  phy: qcom-qmp: Add QMP V3 USB3 PHY support for SC7180
  arm64: dts: qcom: sc7180: Remove global phy reset in QMP phy
  dt-bindings: phy: qcom,qmp: Convert QMP phy bindings to yaml

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 201 ++++++++++++++++++
 .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 227 ---------------------
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   5 +-
 drivers/phy/qualcomm/phy-qcom-qmp.c                |  38 ++++
 4 files changed, 241 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


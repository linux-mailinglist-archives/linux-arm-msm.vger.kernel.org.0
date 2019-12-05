Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D05DF113AEE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 05:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbfLEEnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 23:43:31 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:23182 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728132AbfLEEna (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 23:43:30 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Dec 2019 10:12:56 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 05 Dec 2019 10:12:35 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 6AAFF19B7; Thu,  5 Dec 2019 10:12:34 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v2 0/3] Add QUSB2 PHY support for SC7180
Date:   Thu,  5 Dec 2019 10:11:18 +0530
Message-Id: <1575520881-31458-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added QUSB2 PHY support for SC7180.
Converting dt binding to yaml.
Adding compatible for SC7180 in dt bindings.

Changes in v2:
Sorted the compatible in driver.
Converted dt binding to yaml.
Added compatible in yaml.


Sandeep Maheswaram (3):
  phy: qcom-qusb2: Add QUSB2 PHY support for SC7180
  dt-bindings: phy: qcom-qusb2: Convert QUSB2 phy bindings to yaml
  dt-bindings: phy: qcom-qusb2: Add SC7180 QUSB2 phy support

 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 -----------
 .../devicetree/bindings/phy/qcom-qusb2-phy.yaml    | 130 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qusb2.c              |  57 ++++++++-
 3 files changed, 186 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


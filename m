Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7ABC1D4396
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 04:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgEOCjz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 22:39:55 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:31696 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726176AbgEOCjz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 22:39:55 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 May 2020 08:09:52 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 May 2020 08:09:29 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 7422929A7; Fri, 15 May 2020 08:09:28 +0530 (IST)
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
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v7 0/4] Add QMP V3 USB3 PHY support for SC7180 
Date:   Fri, 15 May 2020 08:09:14 +0530
Message-Id: <1589510358-3865-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QMP V3 USB3 PHY entries for SC7180 in phy driver and
device tree bindings.

changes in v7:
*As per Matthias comments conversion to yaml and splitting out DP PHY bindings
 patches are separated.
*PATCH v7 1/4 is for coversion to yaml.
*PATCH v7 2/4 has splitting out DP PHY bindings and adding as separate yaml
 for DP PHY  bindings.
*No changes in PATCH v7 3/4 and 4/4.

changes in v6:
*Added separate yaml file for USB3 DP PHY bindings.

changes in v5:
*Addressed comments from Matthias in yaml file.
*Dropped PATCH 4/4 as it is landed in linux-next. 

changes in v4:
*Addressed comments from Matthias and Rob in yaml file.

changes in v3:
*Addressed Rob's comments in yaml file.
*Sepearated the SC7180 support in yaml patch.
*corrected the phy reset entries in device tree.

changes in v2:
*Remove global phy reset in QMP PHY.
*Convert QMP PHY bindings to yaml.

Sandeep Maheswaram (4):
  dt-bindings: phy: qcom,qmp: Convert QMP PHY bindings to yaml
  dt-bindings: phy: qcom,qmp-usb3-dp: Add dt bindings for USB3 DP PHY
  dt-bindings: phy: qcom,qmp-usb3-dp: Add support for SC7180
  phy: qcom-qmp: Add QMP V3 USB3 PHY support for SC7180

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 313 +++++++++++++++++++++
 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml         | 136 +++++++++
 .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 247 ----------------
 drivers/phy/qualcomm/phy-qcom-qmp.c                |  38 +++
 4 files changed, 487 insertions(+), 247 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


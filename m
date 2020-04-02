Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA00419BBD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 08:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgDBGkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 02:40:40 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:36996 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732537AbgDBGkk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 02:40:40 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Apr 2020 12:09:57 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Apr 2020 12:09:36 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 3238719F8; Thu,  2 Apr 2020 12:09:36 +0530 (IST)
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
Subject: [PATCH v5 0/3] Add QMP V3 USB3 PHY support for SC7180
Date:   Thu,  2 Apr 2020 12:08:51 +0530
Message-Id: <1585809534-11244-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QMP V3 USB3 PHY entries for SC7180 in phy driver and
device tree bindings.

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

Sandeep Maheswaram (3):
  dt-bindings: phy: qcom,qmp: Convert QMP PHY bindings to yaml
  dt-bindings: phy: qcom,qmp: Add support for SC7180
  phy: qcom-qmp: Add QMP V3 USB3 PHY support for SC7180

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 336 +++++++++++++++++++++
 .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 242 ---------------
 drivers/phy/qualcomm/phy-qcom-qmp.c                |  38 +++
 3 files changed, 374 insertions(+), 242 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


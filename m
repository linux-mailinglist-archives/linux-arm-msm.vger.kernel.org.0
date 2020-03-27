Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFC7195458
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 10:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbgC0Jo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 05:44:28 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:55216 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726804AbgC0Jo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 05:44:28 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Mar 2020 15:14:18 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Mar 2020 15:13:51 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id DC4772223; Fri, 27 Mar 2020 15:13:50 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v6 0/4] ADD interconnect support for Qualcomm DWC3 driver
Date:   Fri, 27 Mar 2020 15:13:19 +0530
Message-Id: <1585302203-11008-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This path series aims to add interconnect support in
dwc3-qcom driver on SDM845 and SC7180 SoCs.

Changes from v5 -> v6
  > [PATCH 1/4] Addressed comments from Rob.
  > [PATCH 2/4] Fixed review comments from Matthias in DWC3 driver.
  > [PATCH 3/4] Ignoring 80 char limit in defining interconnect paths.
  > Added [PATCH 4/4] in this series. Adding interconnect nodes for SC7180.
    Depends on patch https://patchwork.kernel.org/patch/11417989/.	

Changes from v4 -> v5
  > [PATCH 1/3] Added the interconnect properties in yaml. This patch depends
    on series https://patchwork.kernel.org/cover/11372641/.
  > [PATCH 2/3] Fixed review comments from Matthias in DWC3 driver.
  > [PATCH 3/3] Modified as per the new interconnect nodes in sdm845. Depends
    on series https://patchwork.kernel.org/cover/11372211/. 


Changes from v3 -> v4
  > Fixed review comments from Matthias
  > [PATCH 1/3] and [PATCH 3/3] remains unchanged

Changes from v2 -> v3
  > Fixed review comments from Matthias and Manu
  > changed the functions prefix from usb_* to dwc3_qcom_*

Changes since V1:
  > Comments by Georgi Djakov on "[PATCH 2/3]" addressed
  > [PATCH 1/3] and [PATCH 3/3] remains unchanged


Sandeep Maheswaram (4):
  dt-bindings: usb: qcom,dwc3: Introduce interconnect properties for
    Qualcomm DWC3 driver
  usb: dwc3: qcom: Add interconnect support in dwc3 driver
  arm64: dts: qcom: sdm845: Add interconnect properties for USB
  arm64: dts: qcom: sc7180: Add interconnect properties for USB

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   8 ++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   4 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   8 ++
 drivers/usb/dwc3/dwc3-qcom.c                       | 128 ++++++++++++++++++++-
 4 files changed, 146 insertions(+), 2 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


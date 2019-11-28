Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2D210C7F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 12:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfK1Ldf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 06:33:35 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:42005 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbfK1Lde (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 06:33:34 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Nov 2019 17:03:32 +0530
IronPort-SDR: sG1FeRQ0Lk0+DoU4EZoM9Lf32SU0seLjHXGUYX8mtiWE2BU/WtXYkiYM173wJUbBu4Mq6UtJie
 CZge8mcwtHUyiazo1F8ojp0ECbp7N54QFFuE4lH0AhlNqkvs6lxsp4rSWMyjzPnzrWYCyQ0CeT
 blrHBxxhU9mpt/7S2BTdStLzQ2GfYJwsK6DvdJILmI8xbRAMEbmfDYquuk+9xml8fDdTqHuQqb
 rFPpPT7wrbALKVkWag60e2Vj2NNvHlaQswFhFeV4gK8GUBv2c0I4CShqe5tpnc3K6enEQJjXqM
 ETBQiUz4MI2RomkHKGEoL2wC
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 Nov 2019 17:03:11 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 13E4E19B8; Thu, 28 Nov 2019 17:03:10 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v2 0/3] Add USB DWC3 support for SC7180
Date:   Thu, 28 Nov 2019 17:03:04 +0530
Message-Id: <1574940787-1004-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding compatible for SC7180 in USB DWC3 driver.
Converting dt binding to yaml.
Adding compatible for SC7180 in dt bindings.

Changes in v2:
Sorted the compatible in dwc3 driver.
Converted dt binding to yaml.
Added compatible in yaml.

Sandeep Maheswaram (3):
  usb: dwc3: Add support for SC7180 SOC
  dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings to yaml
  dt-bindings: usb: qcom,dwc3: Add compatible for SC7180

 .../devicetree/bindings/usb/qcom,dwc3.txt          | 104 --------------
 .../devicetree/bindings/usb/qcom,dwc3.yaml         | 156 +++++++++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c                       |   3 +-
 3 files changed, 158 insertions(+), 105 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


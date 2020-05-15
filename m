Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123591D4991
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 11:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgEOJaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 05:30:08 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:53577 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727869AbgEOJaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 05:30:07 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 May 2020 15:00:01 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 15 May 2020 14:59:35 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 3E6F428F7; Fri, 15 May 2020 14:59:34 +0530 (IST)
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
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v6 0/2] Add USB DWC3 support for SC7180  
Date:   Fri, 15 May 2020 14:59:18 +0530
Message-Id: <1589534960-6973-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Converting dt binding to yaml.
Adding compatible for SC7180 in dt bindings.

Changes in v6:
Addressed the comments from Stephen on interrupts.
Added ranges property and dropped maxItems field for assigned-clock-rates.

Changes in v5:
Addressed the comments from Stephen in yaml file.

Changes in v4:
Addressed the comments from Doug in yaml file.

Changes in v3:
Dropped the patch for adding the compatible in dwc3 driver from the series.
Addressed the comments from Doug in yaml file.

Changes in v2:
Sorted the compatible in dwc3 driver.
Converted dt binding to yaml.
Added compatible in yaml.

Sandeep Maheswaram (2):
  dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
  dt-bindings: usb: qcom,dwc3: Add compatible for SC7180

 .../devicetree/bindings/usb/qcom,dwc3.txt          | 104 -------------
 .../devicetree/bindings/usb/qcom,dwc3.yaml         | 163 +++++++++++++++++++++
 2 files changed, 163 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


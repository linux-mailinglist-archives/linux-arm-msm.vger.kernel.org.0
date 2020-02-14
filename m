Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9393A15D3BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 09:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbgBNIZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 03:25:42 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:45291 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728783AbgBNIZm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 03:25:42 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Feb 2020 13:55:35 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Feb 2020 13:55:06 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 6A7E625C0; Fri, 14 Feb 2020 13:55:05 +0530 (IST)
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
Subject: [PATCH v5 1/3] dt-bindings: usb: qcom,dwc3: Introduce interconnect properties for Qualcomm DWC3 driver
Date:   Fri, 14 Feb 2020 13:54:42 +0530
Message-Id: <1581668684-4182-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581668684-4182-1-git-send-email-sanm@codeaurora.org>
References: <1581668684-4182-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add documentation for the interconnects and interconnect-names
properties for USB.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 4a36ab5..236877e 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -68,6 +68,22 @@ properties:
   resets:
     maxItems: 1
 
+  interconnects:
+    description:
+      Pairs of phandles and interconnect provider specifiers
+      to denote the edge source and destination ports of
+      the interconnect path. Please refer to
+      Documentation/devicetree/bindings/interconnect/
+      for more details.
+
+  interconnect-names:
+    description:
+      List of interconnect path name strings sorted in the same
+      order as the interconnects property. Consumer drivers will use
+      interconnect-names to match interconnect paths with interconnect
+      specifiers. Please refer to Documentation/devicetree/bindings/
+      interconnect/ for more details.
+
   interrupts:
     items:
       - description: The interrupt that is asserted
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4773FBB43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 19:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238250AbhH3R4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 13:56:09 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61663 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238291AbhH3R4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 13:56:08 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 30 Aug 2021 10:55:14 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Aug 2021 10:55:12 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Aug 2021 23:24:41 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id DDD7F3D31; Mon, 30 Aug 2021 23:24:39 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings for dwc3 qcom
Date:   Mon, 30 Aug 2021 23:24:31 +0530
Message-Id: <1630346073-7099-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
References: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add multi pd bindings to set performance state for cx domain
to maintain minimum corner voltage for USB clocks.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index e70afc4..838d9c4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -41,7 +41,18 @@ properties:
 
   power-domains:
     description: specifies a phandle to PM domain provider node
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: optional,cx power domain
+      - description: USB gdsc power domain
+
+  power-domain-names:
+     items:
+      - const: cx
+      - const: usb_gdsc
+
+  required-opps:
+    description: specifies the performance state to cx power domain
 
   clocks:
     description:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


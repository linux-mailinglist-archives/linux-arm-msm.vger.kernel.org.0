Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFA44391FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 11:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbhJYJKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 05:10:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36225 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232402AbhJYJK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 05:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635152886; x=1666688886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=+lxKegXvS+9F21/eCMPAAOXUr+98ZOCrhEjp4t5oUTk=;
  b=ea1KH00+GRg9F5SZNuaQAlZxDv+f/XVDb/DwnWQrebgUwx8NPXi05btE
   CnibTxUb/4T1thkjolJVttieQ4KgBqsWfBNIAHByvsaSV70VugRJ1ls1V
   TN294Y9FCCcieSLYVlDFXxMGaDNJ2HtTeoMLLmYoYRXMP11Dx5oToRJYy
   c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 02:08:06 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 02:08:04 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 25 Oct 2021 02:07:59 -0700
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>
CC:     <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_ppratap@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings for dwc3 qcom
Date:   Mon, 25 Oct 2021 14:37:29 +0530
Message-ID: <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add multi pd bindings to set performance state for cx domain
to maintain minimum corner voltage for USB clocks.

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
---
v2:
Make cx domain mandatory.

 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 2bdaba0..fd595a8 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -42,7 +42,13 @@ properties:
 
   power-domains:
     description: specifies a phandle to PM domain provider node
-    maxItems: 1
+    minItems: 2
+    items:
+      - description: cx power domain
+      - description: USB gdsc power domain
+
+  required-opps:
+    description: specifies the performance state to power domain
 
   clocks:
     description:
-- 
2.7.4


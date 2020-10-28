Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C0329DA95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390366AbgJ1XZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:25:57 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:53231 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390354AbgJ1XZR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:25:17 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Oct 2020 00:18:57 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 28 Oct 2020 00:18:56 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 35CD61B4B; Wed, 28 Oct 2020 00:18:56 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>
Subject: [PATCH v4 2/3] bindings: pm8941-misc: Add support for VBUS detection
Date:   Wed, 28 Oct 2020 00:18:53 -0700
Message-Id: <6c6bd3601ec8f4c68f581452fca3ef96f2ae94f9.1603869292.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1603869292.git.gurus@codeaurora.org>
References: <cover.1603869292.git.gurus@codeaurora.org>
In-Reply-To: <cover.1603869292.git.gurus@codeaurora.org>
References: <cover.1603869292.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible string that adds support for reporting VBUS detection
status that can be detected via a dedicated PMIC pin.

Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
index e8eea83..15e3749 100644
--- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
+++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
@@ -15,18 +15,23 @@ description: |
 
 properties:
   compatible:
+    minItems: 1
     items:
       - const: qcom,pm8941-misc
+      - const: qcom,pmd-vbus-det
 
   reg:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   interrupt-names:
+    minItems: 1
     items:
       - const: usb_id
+      - const: usb_vbus
 
 required:
   - compatible
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


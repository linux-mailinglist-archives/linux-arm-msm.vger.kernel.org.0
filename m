Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E595C303463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbhAZFX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:23:56 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9011 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730559AbhAZBZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 20:25:04 -0500
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Jan 2021 16:38:43 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 25 Jan 2021 16:38:42 -0800
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 6CCEE1A7C; Mon, 25 Jan 2021 16:38:35 -0800 (PST)
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
Subject: [RESEND PATCH v6 2/3] bindings: pm8941-misc: Add support for VBUS detection
Date:   Mon, 25 Jan 2021 16:38:31 -0800
Message-Id: <f75e75985a06b38ba77c618e108d797b7de17f09.1611621365.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1611621365.git.gurus@codeaurora.org>
References: <cover.1611621365.git.gurus@codeaurora.org>
In-Reply-To: <cover.1611621365.git.gurus@codeaurora.org>
References: <cover.1611621365.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interrupt support for reporting VBUS detection status that can be
detected via a dedicated PMIC pin.

Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
index e8eea83..6a9c96f 100644
--- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
+++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
@@ -22,11 +22,14 @@ properties:
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


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893E023D88F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 11:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729201AbgHFJZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 05:25:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:29415 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729188AbgHFJZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 05:25:06 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 06 Aug 2020 02:25:02 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Aug 2020 02:25:00 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Aug 2020 14:54:40 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 143F0219E6; Thu,  6 Aug 2020 14:54:38 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH 1/3] dt-bindings: qcom: Add ipq8074 bindings
Date:   Thu,  6 Aug 2020 14:54:36 +0530
Message-Id: <1596705878-12385-2-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596705878-12385-1-git-send-email-gokulsri@codeaurora.org>
References: <1596705878-12385-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the new device-tree bindings for boards
HK10-C1 and HK10-C2 based on ipq8074 SoC.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 6031aee..7b294be 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -47,6 +47,8 @@ description: |
         cp01-c1
         dragonboard
         hk01
+        hk10-c1
+        hk10-c2
         idp
         liquid
         mtp
@@ -148,6 +150,8 @@ properties:
       - items:
           - enum:
               - qcom,ipq8074-hk01
+              - qcom,ipq8074-hk10-c1
+              - qcom,ipq8074-hk10-c2
           - const: qcom,ipq8074
 
       - items:
-- 
2.7.4


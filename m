Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC191A4E1F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 07:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgDKFCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Apr 2020 01:02:53 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:23290 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726047AbgDKFCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Apr 2020 01:02:53 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Apr 2020 22:02:53 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 10 Apr 2020 22:02:50 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id C571621503; Sat, 11 Apr 2020 10:32:48 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH V2 1/5] dt-bindings: phy: qcom,qmp: Add ipq8074 usb dt bindings
Date:   Sat, 11 Apr 2020 10:32:28 +0530
Message-Id: <1586581352-27017-2-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586581352-27017-1-git-send-email-sivaprak@codeaurora.org>
References: <1586581352-27017-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ipq8074 qmp phy device compatible for super speed usb support.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
[V2]
 * corrected typo in compatible
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 18a8985..924fac8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq8074-qmp-pcie-phy
+      - qcom,ipq8074-qmp-usb3-phy
       - qcom,msm8996-qmp-pcie-phy
       - qcom,msm8996-qmp-ufs-phy
       - qcom,msm8996-qmp-usb3-phy
@@ -166,6 +167,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq8074-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,msm8998-qmp-pcie-phy
               - qcom,msm8998-qmp-usb3-phy
-- 
2.7.4


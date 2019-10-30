Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F76EE96E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 07:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfJ3G7w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 02:59:52 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:46093 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725855AbfJ3G7w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 02:59:52 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Oct 2019 12:29:48 +0530
IronPort-SDR: zSWuT+0JZq1MYUiQNsfnEU/4FkWzAnSMfOglBqUHF/1gCCrElYwuSpR9WnKrNfgZr32gKmzpsH
 HH4SaXddqtuKx6LVI+xDncbGNveHomRjyn7FhycPkbe4jDtGKdjg6KL2OftwtdOIUNvA2V2jBJ
 etNFYcnnnSuqXbjNrzrFb/+x0yP6dyb0seEfciDm6hWVbnTn5S0+ohE2FizNScIVdcjV4Px/Jd
 jrw6BUgWOS4FE3qxN1W2JorL0PKfUsYGmQJ6jgkI/FgHcBYRyQlEt6vJ9XqvQQ13hvpkdDDkQf
 ZTyTt1Whi9cuBqP+7h4b+xdo
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 30 Oct 2019 12:29:36 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id A771219C4; Wed, 30 Oct 2019 12:29:35 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 2/2] dt-bindings: phy-qcom-qmp: Add SC7180 QMP phy support
Date:   Wed, 30 Oct 2019 12:25:44 +0530
Message-Id: <1572418544-11593-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572418544-11593-1-git-send-email-sanm@codeaurora.org>
References: <1572418544-11593-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QMP phy entries for SC7180 in device tree bindings.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index eac9ad3..369f5b7 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -15,17 +15,20 @@ Required properties:
 	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
 	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
 	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845,
-	       "qcom,sm8150-qmp-ufs-phy" for UFS QMP phy on sm8150.
+	       "qcom,sm8150-qmp-ufs-phy" for UFS QMP phy on sm8150,
+	       "qcom,sc7180-qmp-usb3-phy" for USB3 QMP V3 phy on sc7180.
 
 - reg:
   - index 0: address and length of register set for PHY's common
              serdes block.
   - index 1: address and length of the DP_COM control block (for
-             "qcom,sdm845-qmp-usb3-phy" only).
+             "qcom,sdm845-qmp-usb3-phy" and "qcom,sc7180-qmp-usb3-phy" only).
 
 - reg-names:
   - For "qcom,sdm845-qmp-usb3-phy":
     - Should be: "reg-base", "dp_com"
+  - For "qcom,sc7180-qmp-usb3-phy":
+    - Should be: "reg-base", "dp_com"
   - For all others:
     - The reg-names property shouldn't be defined.
 
@@ -60,6 +63,8 @@ Required properties:
 			"ref", "ref_aux".
 		For "qcom,sm8150-qmp-ufs-phy" must contain:
 			"ref", "ref_aux".
+		For "qcom,sc7180-qmp-usb3-phy" must contain:
+			"aux", "cfg_ahb", "ref", "com_aux".
 
  - resets: a list of phandles and reset controller specifier pairs,
 	   one for each entry in reset-names.
@@ -88,6 +93,8 @@ Required properties:
 			"ufsphy".
 		For "qcom,sm8150-qmp-ufs-phy": must contain:
 			"ufsphy".
+		For "qcom,sc7180-qmp-usb3-phy" must contain:
+			"phy", "common".
 
  - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
  - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


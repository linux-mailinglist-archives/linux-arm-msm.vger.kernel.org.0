Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73371EAA60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 06:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfJaFia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 01:38:30 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:64179 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726321AbfJaFia (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 01:38:30 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Oct 2019 11:08:26 +0530
IronPort-SDR: 7oSMJAqbq/7q/z204kj0sWW/gvBhSoufxEwgRElU6AswIXw9QQPPKfhziCIMBzlQl6P4vxCAwy
 fEDPFjI+7UTtVM41xnymCQwWAz3SK7qiNcHNKHZj+qdtQJZQn9VHJjOXw0v/QK30nchWjDrJHW
 3pip3wH869JiPW5b2dq0Wviwkm0FnS34sRQ1lROs0LO4NuLRAt0TqROT2vIdWRW3vdF34XbM37
 f5AwkdCCBkWv9i+iFgYztXkL2BeDdYtbwlDJ8DdOFjZheVJkR1LZx4cy1fIXl+zF+dlNY3LvVi
 uUnUvImNhS6FaosHuLQ/CICc
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 31 Oct 2019 11:08:14 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 5DB8119C4; Thu, 31 Oct 2019 11:08:13 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 2/2] dt-bindings: phy-qcom-qusb2: Add SC7180 QUSB2 phy support
Date:   Thu, 31 Oct 2019 11:08:07 +0530
Message-Id: <1572500287-21353-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572500287-21353-1-git-send-email-sanm@codeaurora.org>
References: <1572500287-21353-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QUSB2 phy entries for SC7180 in device tree bindings.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
index fe29f9e..d46fca7 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
@@ -8,6 +8,7 @@ Required properties:
 	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
 	       "qcom,msm8998-qusb2-phy" for 10nm PHY on msm8998,
 	       "qcom,sdm845-qusb2-phy" for 10nm PHY on sdm845.
+	       "qcom,sc7180-qusb2-phy" for 8nm PHY on sc7180.
 
  - reg: offset and length of the PHY register set.
  - #phy-cells: must be 0.
@@ -31,23 +32,23 @@ Optional properties:
  - qcom,imp-res-offset-value: It is a 6 bit value that specifies offset to be
 		added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
 		tuning parameter that may vary for different boards of same SOC.
-		This property is applicable to only QUSB2 v2 PHY (sdm845).
+		This property is applicable to only QUSB2 v2 PHY (sdm845,sc7180).
  - qcom,hstx-trim-value: It is a 4 bit value that specifies tuning for HSTX
 		output current.
 		Possible range is - 15mA to 24mA (stepsize of 600 uA).
 		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-		This property is applicable to only QUSB2 v2 PHY (sdm845).
+		This property is applicable to only QUSB2 v2 PHY (sdm845,sc7180).
 		Default value is 22.2mA for sdm845.
  - qcom,preemphasis-level: It is a 2 bit value that specifies pre-emphasis level.
 		Possible range is 0 to 15% (stepsize of 5%).
 		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-		This property is applicable to only QUSB2 v2 PHY (sdm845).
+		This property is applicable to only QUSB2 v2 PHY (sdm845,sc7180).
 		Default value is 10% for sdm845.
 - qcom,preemphasis-width: It is a 1 bit value that specifies how long the HSTX
 		pre-emphasis (specified using qcom,preemphasis-level) must be in
 		effect. Duration could be half-bit of full-bit.
 		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-		This property is applicable to only QUSB2 v2 PHY (sdm845).
+		This property is applicable to only QUSB2 v2 PHY (sdm845,sc7180).
 		Default value is full-bit width for sdm845.
 
 Example:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE39E4233F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 13:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438154AbfFLLBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 07:01:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38142 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438139AbfFLLBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 07:01:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DFB25602F4; Wed, 12 Jun 2019 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560337271;
        bh=pF5tEdJjTSzXSZFzMznbQSNtKzQXS8mKWWaqkb+6f1M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KQ13K8/45KO7h+IAJXYklvp+B96kfg0QmmPfEZYAxF8+CgFJSKGvioxSqMcAT/RmV
         mnSWZeQqta7+yWXZaHcdeMIFaVf8WD1fB5VsanbdNBKja1IvVPaXt2jhjq//3zor7p
         Vh6i84YJAeogDaEx5BfjKRLqddeNjLsQftsGOhV0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-288.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nishakumari@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 63CC860ADE;
        Wed, 12 Jun 2019 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560337269;
        bh=pF5tEdJjTSzXSZFzMznbQSNtKzQXS8mKWWaqkb+6f1M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jgSJR2/34+EbcGAoeNeDL0JfWc8hMKCDIIM6TszGqSva0HLCEsTIKvbQc0r0G4dke
         DiYTgf7MIXSuYAvMNZj2NokVeNhm2xDYuqIKQ6rrpDLG77JedclvERsJtGjM4AHMDi
         dQUK4etG8+3Yd/mhyqPL8mL3ZmD4MLVvywkDwPDk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 63CC860ADE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=nishakumari@codeaurora.org
From:   Nisha Kumari <nishakumari@codeaurora.org>
To:     bjorn.andersson@linaro.org, broonie@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org
Cc:     lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org,
        linux-kernel@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org, Nisha Kumari <nishakumari@codeaurora.org>
Subject: [PATCH 1/4] dt-bindings: regulator: Add labibb regulator
Date:   Wed, 12 Jun 2019 16:30:49 +0530
Message-Id: <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding the devicetree binding for labibb regulator.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
---
 .../bindings/regulator/qcom-labibb-regulator.txt   | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
new file mode 100644
index 0000000..79aad6f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
@@ -0,0 +1,57 @@
+Qualcomm's LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost) Regulator
+
+LAB can be used as a positive boost power supply and IBB can be used as a negative
+boost power supply for display panels.
+
+Main node required properties:
+
+- compatible:			Must be:
+				"qcom,lab-ibb-regulator"
+- #address-cells:		Must be 1
+- #size-cells:			Must be 0
+
+LAB subnode required properties:
+
+- reg:				Specifies the SPMI address and size for this peripheral.
+- regulator-name:		A string used to describe the regulator.
+- interrupts:			Specify the interrupts as per the interrupt
+				encoding.
+- interrupt-names:		Interrupt names to match up 1-to-1 with
+				the interrupts specified in 'interrupts'
+				property.
+
+IBB subnode required properties:
+
+- reg:				Specifies the SPMI address and size for this peripheral.
+- regulator-name:		A string used to describe the regulator.
+- interrupts:			Specify the interrupts as per the interrupt
+				encoding.
+- interrupt-names:		Interrupt names to match up 1-to-1 with
+				the interrupts specified in 'interrupts'
+				property.
+
+Example:
+	pmi8998_lsid1: pmic@3 {
+		qcom-labibb-regulator {
+			compatible = "qcom,lab-ibb-regulator";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lab_regulator: qcom,lab@de00 {
+				reg = <0xde00>;
+				regulator-name = "lab_reg";
+
+				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "lab-sc-err";
+			};
+
+			ibb_regulator: qcom,ibb@dc00 {
+				reg = <0xdc00>;
+				regulator-name = "ibb_reg";
+
+				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "ibb-sc-err";
+			};
+
+		};
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


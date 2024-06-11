Return-Path: <linux-arm-msm+bounces-22269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C58902E86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 04:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F23941F227A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 02:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000BE16F858;
	Tue, 11 Jun 2024 02:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufYhnMNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C5E15B0E2;
	Tue, 11 Jun 2024 02:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718073691; cv=none; b=YP0mFpOK5ygcq7bQvN30E3m7VfwymquT67eqybPVBW47M62JVcAM33PXxqkB11pcdoQWjVL0ctrK9J6EiepvoM2iPzUnQlpHQ0js0Ws/uIHMN/ihlqUmgJCabERINWgWwVmj0A7E759opeWc2H9g1uGUMwlHDXjQTkke0SqMa7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718073691; c=relaxed/simple;
	bh=ngSu0hl09RV+E8XRDs8cHoJzfg925aoWxQhKadjgzKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fMPgpFqFt0VQKJP3z6YgdtJYSBHvxLB7d63j/7z3Goi2a+xt05TR7IQ5sIkx/p9I0bC8WzdQeY5Gc2ORMfTxED2NlR5dUJQGqdYD8xFYtmJetV6b9p71G9f6QsW9mzGBlEBdxecpNtvRXWMXRsowqxhQw1LNNcFjMQim8BAc41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufYhnMNL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02361C2BBFC;
	Tue, 11 Jun 2024 02:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718073690;
	bh=ngSu0hl09RV+E8XRDs8cHoJzfg925aoWxQhKadjgzKo=;
	h=From:Date:Subject:To:Cc:From;
	b=ufYhnMNLWqbW9ijJzuDGnG6ObssMrGf/RmZVa8M7p5NRA14ZDAjH47XEipL/Iwr83
	 +1RERdjXcI/SM/NL4f2G98FIZ2PeRpclDue9teOQcFQHjyYbLUuWLB0pqGMgas0uMg
	 24S5C1UMIxgb+6VFnBMPvK8qgVvcSfsuWYYpruWOoUE2QAiF85GhX/g7Js3nGWnUEI
	 y4j8yaOpY7Ago1EnjzcY4MdRecGnvI8FHn+P7gWa+OTLxlKHx3pQvYQuHwwU4IZQAc
	 1gHpdv25JOdhL7VoXSs6NJFuGsVVl7rXskUW8yYQSdYn4APpRP4gyQuMDTSd6Pvq6n
	 ns743Nh3M5snw==
From: Bjorn Andersson <andersson@kernel.org>
Date: Mon, 10 Jun 2024 19:46:27 -0700
Subject: [PATCH v2] dt-bindings: usb: qcom,dwc3: Add SC8180X compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-sc8180x-dwc3-binding-compatible-v2-1-c7d5db9702a2@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAIK6Z2YC/z2NSw6CMBQAr0K69pl+EVx5D8OitAVeIgVbQAzh7
 lZMXM4sZjYSXUAXyTXbSHALRhx8An7KiOm0bx2gTUw45ZLmjEI0BSvoCvZlBNToLfoWzNCPesL
 64cA1SpRa8uaiLUmVMbgG1+NwrxJ3GKchvI/hwr7211Zc/dtzrKEfYWGgIKe6pFKUXIri9pzRo
 Dfn9CPVvu8fFQHElL8AAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=4pCsrXGH6ET4igc6QE7tpvtvcfisF38chpMSor9ddc8=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmZ7qGkjHz2zOVGsS8ukF12DSyki+wLYa2VsqpK
 DDaq6Ohr5aJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZme6hhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXBiA/+Lf9MkeQrm2AYlt4JU41fT+8HMz50a4oK2fHqcFp
 /7CCRd0+DBzNDeX4avL3rp5AVmw84pvluA2mMcsa+fbe/CxzOKoBhRWkiNBj2sR57LtzB1q3YcB
 MRQ5FvFmzDWv/ufEPvA2zTCSfrZmHSKsH9GeQ5SW8UALIWUsdXV2sbf0xGsFeejA/ND7Txl/alg
 zEfgoZyOljmpblzSkBReeypIhV8QTqvHmuBq8yB5QhTH34nZAW4Vl7LVu2FtT4dMV3rJAfISL31
 5j1C8D2dwGEDaEOxn2h6NgXnpdYID9rmrihuPHIoz00EEmzDLqTNc+LGx99IBnHSuL/cUbQy1mb
 VtLV3wVuTitXEZ56+hY2CqFLBGTCaIer3rvmipl+QKr74IYSGOWVWzWQP9ZB//1g7iENjmDgkxT
 crsSS45ZhaGkxauAeBnYSWvDjvxTjTKb6Bt0whie170wUD5PndggyNbHSl0tR/WVbSYtJCVyL58
 714T82eEqv00lpwcUMeM/6orMwn4KQi/E3oKB1L3LOVKGiVn2avfAVJmdY0aIVCZoZ8L/y11GwF
 lmOvU83C6hENUDSrk7VR38c0VsPpCwPw9Gv+NfVaVTuxbjiQ/4P9R6Abh3KBIvN9XkWxiX4Ss0k
 iSee0X9FwKSopwr5IadbYy9x7phcsRcK7TpoosKZw+QI=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X platform has two single port DWC3 instances and a two-port
DWC3 instance. Add compatibles for these to the binding.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
Changes in v2:
- Pick up Krzysztof's r-b and resubmit separate from the dts changes
- Link to v1: https://lore.kernel.org/r/20240525-sc8180x-usb-mp-v1-5-60a904392438@quicinc.com
---
 .../devicetree/bindings/usb/qcom,dwc3.yaml         | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index cf633d488c3f..efde47a5b145 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -30,6 +30,8 @@ properties:
           - qcom,sa8775p-dwc3
           - qcom,sc7180-dwc3
           - qcom,sc7280-dwc3
+          - qcom,sc8180x-dwc3
+          - qcom,sc8180x-dwc3-mp
           - qcom,sc8280xp-dwc3
           - qcom,sc8280xp-dwc3-mp
           - qcom,sdm660-dwc3
@@ -334,6 +336,8 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-dwc3
+              - qcom,sc8180x-dwc3
+              - qcom,sc8180x-dwc3-mp
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
               - qcom,sm8150-dwc3
@@ -448,6 +452,7 @@ allOf:
               - qcom,sa8775p-dwc3
               - qcom,sc7180-dwc3
               - qcom,sc7280-dwc3
+              - qcom,sc8180x-dwc3
               - qcom,sc8280xp-dwc3
               - qcom,sdm670-dwc3
               - qcom,sdm845-dwc3
@@ -475,6 +480,30 @@ allOf:
             - const: dm_hs_phy_irq
             - const: ss_phy_irq
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8180x-dwc3-mp
+    then:
+      properties:
+        interrupts:
+          minItems: 10
+          maxItems: 10
+        interrupt-names:
+          items:
+            - const: pwr_event_1
+            - const: pwr_event_2
+            - const: hs_phy_1
+            - const: hs_phy_2
+            - const: dp_hs_phy_1
+            - const: dm_hs_phy_1
+            - const: dp_hs_phy_2
+            - const: dm_hs_phy_2
+            - const: ss_phy_1
+            - const: ss_phy_2
+
   - if:
       properties:
         compatible:

---
base-commit: d35b2284e966c0bef3e2182a5c5ea02177dd32e4
change-id: 20240610-sc8180x-dwc3-binding-compatible-ef539a42f7ad

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>



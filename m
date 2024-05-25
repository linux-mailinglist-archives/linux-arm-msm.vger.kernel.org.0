Return-Path: <linux-arm-msm+bounces-20461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A038CF0CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E1311F2197D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000E512BE80;
	Sat, 25 May 2024 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFGUivNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C0C12B158;
	Sat, 25 May 2024 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659955; cv=none; b=KlR/U3+hOwEOW7T0NLTmUkjbkPnyoAlctIDjYw2WPc5qkYfQcPYSCgCg8sUKx8TBHC3PHkkAY+8Hz9CTuEBMODYEss5OhBtx7NJTBu33+dfIbYzACbcnWWTE71/itB+/O2gRiyzgiVdZpVDoZjO0yWOSMfMb/qIo5thpJrNfv5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659955; c=relaxed/simple;
	bh=kKBQ+V1STVv37u+gh6B1hIEDYj1HFZs8V021y3zgYSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kA+tSjj109p2VfS+eY9OTayP4v1sYm7pLhSnC+NPrzM/b+jAhUaiOBWL+IDBz6g1PIfAybjkdqrk3KSsuhFmtkwf5hgRxgLOm8tikqdG4QXHswIdwayaqVh7IDtRc4EZTQH6Y2t7sA+iMugsE4H1WXgdzllVvS3M743xqm7LKxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFGUivNp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CDCC4AF09;
	Sat, 25 May 2024 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659955;
	bh=kKBQ+V1STVv37u+gh6B1hIEDYj1HFZs8V021y3zgYSc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IFGUivNp34Ds1IMolxu/szdceAtScMwmHQFPS7gAUHPKHj36Bp8NO+DIfz0ft3Ngn
	 7uKWVUclffLp1CMQPF0Py02XATzB8e6gv5akJUzP57yw2pJtnD9JnzC0VnjvBoPpCs
	 AcY6cs+UY4Hz1+KM7yPb92ZbYkO2KBUX3GEkTPCMsky+lSxNGKtYrei0XJ4y/Q076y
	 kGqizQyePtGvfJEyh77wz0sNvkOorX01FlpY4Izug5VNHDXo47HuzTRdoJm4vjUYJy
	 SPxRF2WinXZYkTc7Pz55eWcvVGXgFYaa0KZhaFu8Pp9U/3JbWOHUkHPboMPBXD7Olz
	 HZDn4LT+fTP/A==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:03:58 -0700
Subject: [PATCH 05/10] dt-bindings: usb: qcom,dwc3: Add SC8180X compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-usb-mp-v1-5-60a904392438@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=N4n+wQsIpQ6gV1gQhqd7keI6q9G66m1V/hA0aZNldN4=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigM0Lq5y7erhHEHacXi1mEF7ZbJBeQz26gx4
 CwbduSiKCCJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUWTA//a4rL49W/cpkzoUoUaeirBQ2GbiNyJ7aGIMdO84d
 f7BRqJxfxocyw60D8AUMmj3lzbwm33XLivP8TNJ1DDXrJO7YNOAZZxq2kcP2+r7bD4qhOmwkxVi
 4xCs+nUGCH8uUVlUe65chk188BcFU4nIaHcSAEA88XiE9wWChY935FvvJIcbG09OnZs1wYRMAI0
 XrGXD8XzMFyPYWO7GSw5id9sAbohwsDIgYkdc8gt105q7JCUTHKlz650/09apLuL3x6DT6Qkutn
 iIWw8GFxWF8HwxoUQYrOhr4F5whjy0DkA2siuU+5AhH54m2gNa52C2VRYaetjOGHZpe87EcMHPN
 0SycDQgG6X9tk9QTjWqLH3sFEx7BXYkyutwlXOjpTDiToO7SLabUQ101cX9fYC+HLi8IFH1EFw1
 Qwn4VWUr+2iHUyihMvs4YTRysnP0dYaNCOpP3JyB6+oqgo4nroc3vMCsQTsU/sW2I5EXOJTy0bk
 kiyXMVP/LmW+mxeZBeY1TyUrkZ0XbOnuW+Xw+4zB4QrZyJD570wdLeTMuX1Uv1kU3h1HPjAIvRl
 HX/Y2HnnLvIUBtubM9Fyn5Q5u+hZoVfC7an4r4esXr39gk9GR70fl443CP3dLL9PWwt0ok450w3
 pAo2FzC9k+/UuQtR6kWRwa+RZ+JKYNzH1k8X3zErrLcE=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X platform has two single port DWC3 instances and a two-port
DWC3 instance. Add compatibles for these to the binding.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
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

-- 
2.43.0



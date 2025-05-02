Return-Path: <linux-arm-msm+bounces-56594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CBAA7C3E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 312947A447A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3553B21D3D0;
	Fri,  2 May 2025 22:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoLHwnG/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017151E5B97;
	Fri,  2 May 2025 22:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225504; cv=none; b=Ptmy8Ho3GmXDNElmiWPFLCSFF48DiRZ0a6RqAgmQtewr2iyorbip/EkLaIqNm61K8MOjOJZ+k2OizyZe3SldaGlQBg0qc+W+S3u2Vkxk20NVzFKYKFMDvLiqXztM2mxgUKbKv1yCLo2f8zL8D8q94eBQQAheXtCzhV6Ty58SBJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225504; c=relaxed/simple;
	bh=xzvM4v6bV7S7ZbZ4VakF5vvCatxUM3MT1eDZFcVMSjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sp4rg5gPuR6izO90vgnrSqisel58lN2hUIYFgGGgakwy3WQgLyLWy3eupZ0drODMbY7214Fvoj/xtTrJX1Lif0QB0PLzx5SRoZ0RH7kOxniFsydG6S39et2Hv9eGzLEQYZee2AgSO4lY/CXfo1fm8lc8puVGJP7And6JiQkfLs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoLHwnG/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41744C4CEED;
	Fri,  2 May 2025 22:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746225503;
	bh=xzvM4v6bV7S7ZbZ4VakF5vvCatxUM3MT1eDZFcVMSjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hoLHwnG/1ciN1ZFOWTmyEeDa5oQL0SXpFSC3/e5PX6+/3BpNeQdQK+uQ48FJRFBWx
	 dcYpm5QpRnPPP4xxK5Pz16Jm1pOGzPvRHH+Ta56m/fOIo2joery2711JAjjAmY1QnA
	 DC0TgVaiktcHuY4l7zjRvQMTjjQXokqrVPaYY7osp2T48k/IBi5Mg0ybm4t+nOEt6u
	 g60xTmMocwOxmDPB1SllA4Y6+vojqWxeVCcjlkOf7tBAav76+qN8AEYR2wJa62TGKT
	 7JSN8kEErswLsS9erLqdUOjcu8Rl6Ifpv+0GIU6wU1agBFHB72HqX7v8Rl3UBV+r5R
	 0rFIAIYs5GqFw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 03 May 2025 00:37:59 +0200
Subject: [PATCH 1/3] dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-topic-8280_slpi-v1-1-9400a35574f7@oss.qualcomm.com>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
In-Reply-To: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746225495; l=2866;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=luJWRq4V76R/ttAeoDO+p77i20LzK96hYKCcFunW7aM=;
 b=bZAUPtqhXQ/X89TwG59gu3C3mQ4rTkjewywtIhK+9gb/2lEU6RkmcLBFl8b2IhArPPcK5vIGV
 nmgHOwgBv7ZC6fkkgUo5uZXonoVsDNoT6kscLpk42a+18nXVETSZXCQ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

From the software POV, it matches the SM8350's implementation.
Describe it as such, with a fallback.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       | 54 ++++++++++++----------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index fd3423e6051bc8bb0e783479360a7b38e5fa1358..6d09823153fc8331f04d4657d9acba718533cce6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -15,16 +15,20 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sar2130p-adsp-pas
-      - qcom,sm8350-adsp-pas
-      - qcom,sm8350-cdsp-pas
-      - qcom,sm8350-slpi-pas
-      - qcom,sm8350-mpss-pas
-      - qcom,sm8450-adsp-pas
-      - qcom,sm8450-cdsp-pas
-      - qcom,sm8450-mpss-pas
-      - qcom,sm8450-slpi-pas
+    oneOf:
+      - enum:
+          - qcom,sar2130p-adsp-pas
+          - qcom,sm8350-adsp-pas
+          - qcom,sm8350-cdsp-pas
+          - qcom,sm8350-slpi-pas
+          - qcom,sm8350-mpss-pas
+          - qcom,sm8450-adsp-pas
+          - qcom,sm8450-cdsp-pas
+          - qcom,sm8450-mpss-pas
+          - qcom,sm8450-slpi-pas
+      - items:
+          - const: qcom,sc8280xp-slpi-pas
+          - const: qcom,sm8350-slpi-pas
 
   reg:
     maxItems: 1
@@ -61,14 +65,15 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sar2130p-adsp-pas
-            - qcom,sm8350-adsp-pas
-            - qcom,sm8350-cdsp-pas
-            - qcom,sm8350-slpi-pas
-            - qcom,sm8450-adsp-pas
-            - qcom,sm8450-cdsp-pas
-            - qcom,sm8450-slpi-pas
+          contains:
+            enum:
+              - qcom,sar2130p-adsp-pas
+              - qcom,sm8350-adsp-pas
+              - qcom,sm8350-cdsp-pas
+              - qcom,sm8350-slpi-pas
+              - qcom,sm8450-adsp-pas
+              - qcom,sm8450-cdsp-pas
+              - qcom,sm8450-slpi-pas
     then:
       properties:
         interrupts:
@@ -102,12 +107,13 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sar2130p-adsp-pas
-            - qcom,sm8350-adsp-pas
-            - qcom,sm8350-slpi-pas
-            - qcom,sm8450-adsp-pas
-            - qcom,sm8450-slpi-pas
+          contains:
+            enum:
+              - qcom,sar2130p-adsp-pas
+              - qcom,sm8350-adsp-pas
+              - qcom,sm8350-slpi-pas
+              - qcom,sm8450-adsp-pas
+              - qcom,sm8450-slpi-pas
     then:
       properties:
         power-domains:

-- 
2.49.0



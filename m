Return-Path: <linux-arm-msm+bounces-58265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF10ABAB5C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 769E57A7B52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E039920E30F;
	Sat, 17 May 2025 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/OeTPDP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37F20E005;
	Sat, 17 May 2025 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502884; cv=none; b=Sn+ZRRtIL4+a6sCTeGeLv0kEEByGiFlW5y5ehxWm64DDAgnF9GJdp7UP+EHahYN68onOlPGEHd8an64/e9SoUxkPN3FKz1K6HBh+o+sysL9S8UJ2o/GDjpLPii9mVhgzbdD+3/MaPvHCrBrD5ZtWY8UlBBwdVwV7VRcA6QvOTRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502884; c=relaxed/simple;
	bh=xzvM4v6bV7S7ZbZ4VakF5vvCatxUM3MT1eDZFcVMSjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fl8wgU7A4ARYDHpLh/jDFE6WPD+1dwWWThkCZTEOuC8d8F3tZXB6llcpgR5GchejPFqdTHJNZN6e3QfmFDgoapupfdkPcf52PfCIfv58kDJLdBd+p3dSv1ObBkfYUon7Qul6Zf7cB+ORF8jPo9QkhjxUGIoPIqSJT8ldlSmgkWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/OeTPDP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EC6C4CEEA;
	Sat, 17 May 2025 17:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747502884;
	bh=xzvM4v6bV7S7ZbZ4VakF5vvCatxUM3MT1eDZFcVMSjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F/OeTPDPELHfIZdsr4eIuoZOS+TlyuSoRRsAVdVEADxUHTNnqwQ6pOgJ6A++ILhWW
	 gYnxK5HgKTUfcwhqAKgJU2JBEw7jLy3j81Po230LHbyt/4w/ZRbPNQ/THZDYNsa8fy
	 CI4M8LXpP+eFqrMj1ljALgS4mEbXxLGHTEK/67cQicU+ljivYMcsGNJ+LHERo1n2VK
	 a93+qibRv2zlH6znT6WxlRsSP/Z0CVtTsN+IVoKqINNcE0f/0qHJhvBsoLZtAcXMiU
	 mS8WSEtfwzbxsM4cYYlFTW29iDiJ11fTVyD/+LP9cVZzNuub1aTHtS920nW2mbBSir
	 zheEPtYBBsrFw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:27:50 +0200
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: qcom,sm8350-pas: Add
 SC8280XP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-8280_slpi-v2-1-1f96f86ac3ae@oss.qualcomm.com>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
In-Reply-To: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747502874; l=2866;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=luJWRq4V76R/ttAeoDO+p77i20LzK96hYKCcFunW7aM=;
 b=HNayJ0TgitkDtJk3ubt45tvpeysaEKCdT7EwYGGakNXVlefVW8l3cgsjkCw0o+Bwphw22CIwO
 aAT7xSlqevIDigEzltFpTT7BI6HBizTefKuh9gJPbDGQ+T/71k6mXLE
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



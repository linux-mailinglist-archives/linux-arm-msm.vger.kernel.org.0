Return-Path: <linux-arm-msm+bounces-43042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 471CC9FA09A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 13:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1B921655E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 12:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD471F4E4B;
	Sat, 21 Dec 2024 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWRfawwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EFD1F4E29;
	Sat, 21 Dec 2024 12:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734784585; cv=none; b=dfjY6DXzuciV96LqERgk2SSeZJahWQy38JOAJk4kjAzeoaq8T4FHsk0WJ2pdZFhnmm+/OOFvN8tuF/16pvIg0DmPORjkpLttvBSlh88QXsqVCUZTL/w6jcx0Jac8Gol2nJFbzYkDCMU+PsV4qhZmyFp3Xeata7bCBTOWqsfMz/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734784585; c=relaxed/simple;
	bh=B863sScjd/q4/AnHN6FbgS4sUYi3SC+TcT2CQZ62eMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/KWGtyOp45eZnHzHQnWkJ0CShMWHqFh/vZpd1lgVuqIjwnAbf1YK6IUMj6IDreNPxe+yB+++KDN/C587HtJBC/nkNENl0CYrCUK8VGa48/DiIVV/tAIy5D36G1TdLGZG1eMuGmlGnsmVPq85fLbqfmunDi1RKzNLiMXuR4ucy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWRfawwg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E53C4CED4;
	Sat, 21 Dec 2024 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734784584;
	bh=B863sScjd/q4/AnHN6FbgS4sUYi3SC+TcT2CQZ62eMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OWRfawwgL2xZXdwmBBHGbQCji+cRxNzwzOgWnhzhee6pIdq5epdgrOwkHGen4ZwSQ
	 qbWEwF4XQNM+/uCFV77IyfUCndSgtLC+5BthQmCDzP5Hwh6s2lxgdWMDCnrl5gfIts
	 wx7+YPQwHXxrTh6FEEBS77AWJJnsr8AbJGGzPXmVOlgrfrBeUz/My2Bm4E+uPQzb8S
	 7jrFQPsjFALarZOnQHyjijMYWQ6mboKa5QA/915HdAsSgTgsOL4EQ4huvlDFoxtMZ+
	 AVSOjV5FecAM2zac0KUdwPfbmD0aTwxJl9fpucizQqdMnBNaDRwqmanHbEb9LyohD9
	 QjPaxu3rZ+/+g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 21 Dec 2024 13:36:00 +0100
Subject: [PATCH 1/4] dt-bindings: arm: qcom-soc: Extend X1E prefix match
 for X1P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241221-topic-x1p4_soc-v1-1-55347831d73c@oss.qualcomm.com>
References: <20241221-topic-x1p4_soc-v1-0-55347831d73c@oss.qualcomm.com>
In-Reply-To: <20241221-topic-x1p4_soc-v1-0-55347831d73c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734784578; l=2254;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=pdJxnti3DsyEypOYklolTWueEHpewLl8s/CZTgCjUBc=;
 b=sYoMC7F8Twv8rCTPt8dO//JPF0UXkCtIckrt9u00/PXTP3MPTmGn9+9wb7mJu3Z39qcN3TPqC
 EFY90QIiFDNBu8Lt7J5oa/3gWDwaflwOQ16Rq9KN1TXK6ht+XNm6Ob0
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The X1 series includes SoCs like X1P42100. Extend the pattern x1e match
to x1[ep] to also include these.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 2ea6d3f65478157a1a373a8d1fdf35497f30e7c3..a77d68dcad4e52e4fee43729ac8dc1caf957262e 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,7 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+.*$"
+      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
   required:
     - compatible
 
@@ -31,7 +31,7 @@ properties:
   compatible:
     oneOf:
       # Preferred naming style for compatibles of SoC components:
-      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+(pro)?-.*$"
+      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
 
@@ -40,9 +40,9 @@ properties:
       - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$"
+      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$"
+      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630

-- 
2.47.1



Return-Path: <linux-arm-msm+bounces-21973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0658FF25D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 18:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FFAF1C263F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 16:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF0219B3C1;
	Thu,  6 Jun 2024 16:18:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1F4197A85;
	Thu,  6 Jun 2024 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690686; cv=none; b=PPjlLHYvSTILMsIGQ5KEzd8jxXTKwS//5eoRL47kwaAX4O4B/IzpwJzZcFGRd0j8nqfnvYNWB1TfJwRoPGegXqfukM1UVzPaV03Jhd+yywHYcXEFNzP/ODciCJcxKh0liLmLqXtGN1TF18vuEgMftp0QQEPVrAnhPaSVi7jLeOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690686; c=relaxed/simple;
	bh=rGWg6IFXCFlqdag1WKcXlPscM8G/XFaDsZjBLEdOxSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XgBBU+EqHMbXT5zClRmu2A0V0JWMdHFHAjbkmQPryz84WKaAXH3ahQ1AhOg5fhdbg7Czt8X31c1LuSFo6lkGwXC0oP6pK3amulEaH6aIbeZtNfyCJYZyoX9v1KpbSa9ylRNZlQyGiwTqe4xzkn1/jb/CS6w5/OdYK4wQGA1zpww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id D9A16200AA;
	Thu,  6 Jun 2024 18:07:49 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id BD845201B7;
	Thu,  6 Jun 2024 18:07:49 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Thu, 06 Jun 2024 18:07:48 +0200
Subject: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
In-Reply-To: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

HDMI TX block embedded in the APQ8098.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 .../devicetree/bindings/display/msm/hdmi.yaml      | 28 ++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 47e97669821c3..d4a2033afea8d 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -19,14 +19,15 @@ properties:
       - qcom,hdmi-tx-8974
       - qcom,hdmi-tx-8994
       - qcom,hdmi-tx-8996
+      - qcom,hdmi-tx-8998
 
   clocks:
     minItems: 1
-    maxItems: 5
+    maxItems: 8
 
   clock-names:
     minItems: 1
-    maxItems: 5
+    maxItems: 8
 
   reg:
     minItems: 1
@@ -142,6 +143,7 @@ allOf:
       properties:
         clocks:
           minItems: 5
+          maxItems: 5
         clock-names:
           items:
             - const: mdp_core
@@ -151,6 +153,28 @@ allOf:
             - const: extp
         hdmi-mux-supplies: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-tx-8998
+    then:
+      properties:
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: iface
+            - const: core
+            - const: alt_iface
+            - const: extp
+            - const: bus
+            - const: mnoc
+            - const: iface_mmss
+
 additionalProperties: false
 
 examples:

-- 
2.34.1



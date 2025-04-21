Return-Path: <linux-arm-msm+bounces-54833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A17A94B5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 05:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C97377A66AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 03:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8742571DB;
	Mon, 21 Apr 2025 03:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eMihUr7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B808C155A25;
	Mon, 21 Apr 2025 03:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204971; cv=none; b=WTxbvcP4nEhgVsaB0CMNivHXL8jkoI3zWYdtpM7rojSHX/6lZF+XuiM+tyyhFUy+Vll4OgiWTg4WpeavUxezEfO8j/1jXU9sVnsd02aN8HnO/1i/dmREte05ViDbcUcSsdRDG5gFpHe3ymj3/gqVqPX/p4Mbr/tDCkS+NcVKROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204971; c=relaxed/simple;
	bh=lzeMZZicsr6WmBaXdWWx1KPxvF87FdOYn3YHNNuQLxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NhEWcfvzyrvFlaexiJhKeOiCqEmriLLrwlVoRlj0yLnaV6dP00nqtr9rkbjkk2Of3TRiNgZeQc1YPn+po+i45wXxxBHorbz6Y28xvhliCqO8/HkAdzfS0VBFB9jyoekXVhZTwZnJs4FjGlOwDP6YpzNYYALFJ7R9g/20cjlhUAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eMihUr7y; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C255A.nat.pool.telekom.hu [37.76.37.90])
	by mail.mainlining.org (Postfix) with ESMTPSA id 57442BBB01;
	Mon, 21 Apr 2025 03:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745204967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ad5/d+z8KrjjvmBmulUtL2f1YSp3eQSodvgRpnzSG8=;
	b=eMihUr7yApDlQ6zKtnskCUD75StFKbJsxxHtGKIyZ6sqlmFac9cbvFJQBYyQp344DoMigv
	vGUyYG/c76DjsBCxTW0WJDKb7EIynqMN7SUibFUANExJYH2nodTld/aBYUuJ4i6OB0dZ82
	BR7cs0GPv99rlWmXiLkPud4ui71WXqExACuMXnnfaQd5bK9hD7mbozh+2FiGVnE7lOwhKD
	c5W3sYtWJgE66zktEofNbc+Kg421+ngCEmEHQVctzDU1djfmef3WB/zbOdk0ZPKtXb5egA
	79hDC0ZIfZ1dfSSihnEMksEUEAva1K+syERdG/2dBU4kSDJJ9gkcLOSmIl4wBw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 21 Apr 2025 05:09:21 +0200
Subject: [PATCH 1/3] dt-bindings: display/msm/gpu: Document clocks of
 Adreno 505/506/510
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-a5xx-schema-v1-1-7d96b889322a@mainlining.org>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
In-Reply-To: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745204964; l=3292;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=lzeMZZicsr6WmBaXdWWx1KPxvF87FdOYn3YHNNuQLxg=;
 b=tpTCBV2ld4wi+iC5y1LQg1zJjT4UYKTwlyGTSfJJHgtp2E3G440aLQt098eR95/yPXQuAo2SC
 nZP4JP3Dy/XDOiIuDfLniEp7CtlgWSSd80KQcZPRVkzy/ycWKwM8+vo
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Adreno 505/506/510 have previously undocumented alwayson clock.
Document clocks for them and enforce their order.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 83 +++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 6ddc72fd85b04537ea270754a897b4e7eb269641..2bf562708f566018aff80b7b5e02f1dd7e0da26e 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -146,7 +146,19 @@ allOf:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-[3-5][0-9][0-9]\.[0-9]+$'
+            enum:
+              - qcom,adreno-305.18
+              - qcom,adreno-306.0
+              - qcom,adreno-306.32
+              - qcom,adreno-320.2
+              - qcom,adreno-330.1
+              - qcom,adreno-330.2
+              - qcom,adreno-405.0
+              - qcom,adreno-508.0
+              - qcom,adreno-509.0
+              - qcom,adreno-512.0
+              - qcom,adreno-530.2
+              - qcom,adreno-540.1
 
     then:
       properties:
@@ -180,6 +192,75 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-505.0
+              - qcom,adreno-506.0
+
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+
+        clock-names:
+          items:
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: alwayson
+              description: GPU Always-On clock
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+          minItems: 6
+          maxItems: 6
+
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-510.0
+
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+
+        clock-names:
+          items:
+            - const: alwayson
+              description: GPU Always-On clock
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+          minItems: 6
+          maxItems: 6
+
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:

-- 
2.49.0



Return-Path: <linux-arm-msm+bounces-107635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ISVOCnZBWpOcQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:16:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4000B542EF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D414131098C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEEB410D0C;
	Thu, 14 May 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2tJRYpN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BC7407583;
	Thu, 14 May 2026 14:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767764; cv=none; b=HdZdu3Jgtn6Q3WARqJf0ZI2VpXGALAuraPs+kLGWLz/iRRulGvBuQVV/S4n18ypdaMGnMGaKbAb4LSoaoHtEFO/VOm461+4eraerzSE7/D86F7HOKgnaP3utYapFFHfEpZ+9WUloD+1BxYao0f+EvA6F0D0k9lUDFr8Wp2sZViQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767764; c=relaxed/simple;
	bh=DzRDH4cbEVAi9XsADsayvcSyczdiqr82Oaapba9+ZrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/quG7ALjfF28IQdFCw0rCK+yh2HbQTHzZCcnfVlGJn2Lb4bQqn5MZ2EWHRaBWj047lDgstqB/m0DALzb2DrNw9VTBPp4WuA0kiAFhJp2sRvYtlw2rrAhxjVz0lPaYNSGDkDRvBKyqB9HYZXhvkcTSevjCcxQdTR9BoSZorFegI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2tJRYpN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97340C4AF0B;
	Thu, 14 May 2026 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767764;
	bh=DzRDH4cbEVAi9XsADsayvcSyczdiqr82Oaapba9+ZrQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O2tJRYpNA8HHVparbVybj/4WU816WvcOMBla0xpVOsPAskUS10eIBVC9hiG02RTLa
	 5zZES2TvVdUqRRjtHqEr9Q2Kuk5iOVHnjFFt9GqIpAEGNQpzSk8nRC/bwqUrk3/hdI
	 s8brPW1f/bqFZaU6mpBe+7k3/vmxa5WJ9aAT2GfxuOHsU8bY1NbZoRGaGYHcDOPy8b
	 GpuP0E3igw5c0l0Rcok+rmf9Lhavynlba2YgPpWdS1wj0T0LZV8BDsQx0oOhx8jHH2
	 Z82BL67FGDslfapZI+blt73PncBhKAeFky3ThmIFf8+dpeuQ1fYzyKVyaTftLrnPmJ
	 KNvNVQSin1VfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7637DCD4F3C;
	Thu, 14 May 2026 14:09:24 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Thu, 14 May 2026 21:08:30 +0700
Subject: [PATCH v2 01/10] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8960-wifi-v2-1-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
In-Reply-To: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767762; l=3572;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=yJDZ3oI+U0ik6kyM6Iek60rqNIUI/8S+jJgZ5v5/O/A=;
 b=fmmYh5Gfdbg3cKUMUc+qEkC8K+LYzBMP75QRB7sMRRyPnKn1OvhRcnnevzpEkce4S0UXKA8j2
 vqX/MP77qafDprIo0OWksbP+KA5IK26gDnql9Oc9WybYDhZ/TTLXWxq
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Rspamd-Queue-Id: 4000B542EF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107635-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,smankusors.com:mid,smankusors.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Document the qcom,rpmcc-msm8960 compatible.

The MSM8960 platform shares the same RPM clock definitions as
APQ8064, so extend the existing conditional schema to treat
qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      | 77 +++++++++++++---------
 1 file changed, 47 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8..32ef7d08e0bb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -21,35 +21,40 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,rpmcc-apq8060
-          - qcom,rpmcc-apq8064
-          - qcom,rpmcc-ipq806x
-          - qcom,rpmcc-mdm9607
-          - qcom,rpmcc-msm8226
-          - qcom,rpmcc-msm8660
-          - qcom,rpmcc-msm8909
-          - qcom,rpmcc-msm8916
-          - qcom,rpmcc-msm8917
-          - qcom,rpmcc-msm8936
-          - qcom,rpmcc-msm8937
-          - qcom,rpmcc-msm8940
-          - qcom,rpmcc-msm8953
-          - qcom,rpmcc-msm8974
-          - qcom,rpmcc-msm8976
-          - qcom,rpmcc-msm8992
-          - qcom,rpmcc-msm8994
-          - qcom,rpmcc-msm8996
-          - qcom,rpmcc-msm8998
-          - qcom,rpmcc-qcm2290
-          - qcom,rpmcc-qcs404
-          - qcom,rpmcc-sdm429
-          - qcom,rpmcc-sdm660
-          - qcom,rpmcc-sm6115
-          - qcom,rpmcc-sm6125
-          - qcom,rpmcc-sm6375
-      - const: qcom,rpmcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,rpmcc-apq8060
+              - qcom,rpmcc-apq8064
+              - qcom,rpmcc-ipq806x
+              - qcom,rpmcc-mdm9607
+              - qcom,rpmcc-msm8226
+              - qcom,rpmcc-msm8660
+              - qcom,rpmcc-msm8909
+              - qcom,rpmcc-msm8916
+              - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8936
+              - qcom,rpmcc-msm8937
+              - qcom,rpmcc-msm8940
+              - qcom,rpmcc-msm8953
+              - qcom,rpmcc-msm8974
+              - qcom,rpmcc-msm8976
+              - qcom,rpmcc-msm8992
+              - qcom,rpmcc-msm8994
+              - qcom,rpmcc-msm8996
+              - qcom,rpmcc-msm8998
+              - qcom,rpmcc-qcm2290
+              - qcom,rpmcc-qcs404
+              - qcom,rpmcc-sdm429
+              - qcom,rpmcc-sdm660
+              - qcom,rpmcc-sm6115
+              - qcom,rpmcc-sm6125
+              - qcom,rpmcc-sm6375
+          - const: qcom,rpmcc
+      - items:
+          - const: qcom,rpmcc-msm8960
+          - const: qcom,rpmcc-apq8064
+          - const: qcom,rpmcc
 
   '#clock-cells':
     const: 1
@@ -90,7 +95,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,rpmcc-apq8064
+            enum:
+              - qcom,rpmcc-apq8064
+              - qcom,rpmcc-msm8960
     then:
       properties:
         clocks:
@@ -164,3 +171,13 @@ examples:
             clock-names = "pxo";
         };
     };
+
+  - |
+    rpm {
+        clock-controller {
+            compatible = "qcom,rpmcc-msm8960", "qcom,rpmcc-apq8064", "qcom,rpmcc";
+            #clock-cells = <1>;
+            clocks = <&pxo_board>, <&cxo_board>;
+            clock-names = "pxo", "cxo";
+        };
+    };

-- 
2.34.1




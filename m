Return-Path: <linux-arm-msm+bounces-117303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y+iqGqLqTGossAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:01:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E46871B2C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:01:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ldZ5cxtd;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117303-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117303-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 930B030D82AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 11:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5B13FBB46;
	Tue,  7 Jul 2026 11:56:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EE73DDDD1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 11:56:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425386; cv=none; b=Tz2ws1Mn6jE5gjEH78jZ/y6gmoi0j26pZMCJd9SY9rj/SPygl/hb+brqTogerU5Ozo6bkUyGJeucrEIVflLaWeVYD4h//0q76x1lh6Xh7canx6+MhX5HTlIX+0Hz/6qIUf1fGlgbrMrYFh44Gk7EGNmW0aMlyZ4qXGRlXKTcndI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425386; c=relaxed/simple;
	bh=ZLTVpv9wJNbdOGR/YGPybRYtcHah3LwOyod0rOkZ0Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXyctQEvwBgt69VuFE9CrSY8uUF8s2jxgwzpnNbiiDn8dFE3htpTUVMl3nVoCN+5ERRk739k2BODmDcB4Ao3IJ4FJz+kx6na9fC1WvCnEumYzvSgTPtkvAOripWsQDj81l3gZ0iqI7sG4bI6hY9+2XdnRV2/8Okqn2qHwUuqPPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ldZ5cxtd; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c83474ddso36129105e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425383; x=1784030183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgMT9Upuh5KVAe4sPSM1sPIhFZuI5vEjoVoPpztrNMM=;
        b=ldZ5cxtd51/PBZYW3at6nGX45mmMgr9aUWBEMrJbRORVxJi3c/jo6hDxNeF6HfHgMH
         FSqhySe2alKfbHjj+Ul6numCtkz41G7b9an5n564SQ7tROr2dDzNTfAZHTvI6PnIRcPM
         TtLMa2y4lyXX5ReaXg4deQKRjWF31EHXIgugYnZJBixZc8oYQlDOrjEWqBGyLWNkVhgV
         OFRZ781mQcTnyBik9Szou33+sHXL63j9gjxePueJlYnFPyf2JgTC87kTbLFuBxdVD35K
         F7IAf9Puh/uPmcz+gRW0vyGyOayeyaT2SDnP4TkXExjDFB+IefvA4vw9Y56jcbu+Gyl2
         K+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425383; x=1784030183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgMT9Upuh5KVAe4sPSM1sPIhFZuI5vEjoVoPpztrNMM=;
        b=PZBPmZIfRqLCYDmzeCHg5Yj5Nm1dj/vCQoCaasFWGFYo/SzejO+oK3AYTCL8zewNto
         KVCSyArFABV34LBmivhNKf5BCKmXMLzC8CxNzOr2yGgtcEMxPTLOVLrt/uXoI5mQBL38
         TWaC0mVvQ225DxuqA2d6Bz3LryBXac/6wxqqPOXFpYVZbobyWfdZKc/JfkGn2UphRTXY
         4aX408L80HOahoVwSisM+3f/k2yn4RCF4Qb4NlPAGFQqoT1C4QoEx+7lgrl5HUV4PFFS
         UuDzqpV9HGFwyt4LnfBNTSOhMtpskFNdo68cslUXd5xHzBIEEr4WKpmJnssyCzhjlcbD
         jjcg==
X-Forwarded-Encrypted: i=1; AHgh+RpwxFAJPMP7QLDf4k8i9MEJtWF1CZO+sAAF6wVZkowTyEZWbSH9IPWm6OU+CWIG5XR/JO5lzMzl7aV/1Cl+@vger.kernel.org
X-Gm-Message-State: AOJu0YwtElAAQxcfPuzlcaMoUuUTnYtx6bziAcpgPijLthRhf3edonDI
	4IqiEq1KuD63u9uYOocurgo+WcJST+bY918jbU5EbNytcgjDOtbWofeYQNwJSjiwT6k=
X-Gm-Gg: AfdE7clIWjAnpblSpONr25VKsnJj8D0WD7kRf2TisH/ToBNxXShKnTBBozbUmI+xlnN
	N0ZxkhvfuXQj8CC9BLnrZuWe63+zCszdZqY72iq1Gjtc6q9dcZm5nkdECgdHi0b6zCy1pgv+klI
	eKzul54Ruo7Tqwa4+NEXxQIABMWUmZOMzzDeEuTDpsUPpn5V9cxvarD24VO5YL9DiBj1K8aRcHI
	Qyb94JVO4Z/xd7f9/+CZhnGF+b5GhyaKrBQhMnf4gIwH0mhNk1r+LmK0E3pjJEPIEVOQU9E/BhU
	FCSQuX4hhqtJkmD7IBcUl6D/Cp6QrkhQ7XWBHmR3DwcQIOlDyCYU3sdPL0lk1ASMvpv4X7yO3Pn
	6SMOijzjcxg4hGO2kTCBZ7jmLzE/fOGPAj3We0OF48yz159y3uPAeRkDMUGKO8g+/JH1y/zjk9O
	EALnQewNHEkZyoOo6kf9KN4DArLQ==
X-Received: by 2002:a05:600c:1d0c:b0:493:bed9:b53d with SMTP id 5b1f17b1804b1-493df09b330mr53502095e9.31.1783425382814;
        Tue, 07 Jul 2026 04:56:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 07 Jul 2026 13:56:01 +0200
Subject: [PATCH v2 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom-nandc-mdm9607-v2-1-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117303-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[mani.kernel.org:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E46871B2C9

Add the qcom,mdm9607-nand compatible for the QPIC NAND controller used
inside the MDM9607 SoC.

On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
(core, aon, ahb). However, access to these clocks is restricted to the RPM
firmware that controls the shared power resources for the whole SoC. The
clocks cannot be controlled separately, for the OS view of the hardware
there is only a single RPM_SMD_QPIC_CLK clock that implicitly enables all
of the 3 clocks. The only exception to this are some IPQ* SoC that are not
using RPM, there the clocks are directly controlled by the kernel via the
clock controller (GCC). Require only one clock in the dt-bindings for
MDM9607 to avoid having to define dummy clock entries.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 5511389960f0..a916cac53af6 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -22,17 +22,20 @@ properties:
               - qcom,ipq4019-nand
               - qcom,ipq6018-nand
               - qcom,ipq8074-nand
+              - qcom,mdm9607-nand
               - qcom,sdx55-nand
 
   reg:
     maxItems: 1
 
   clocks:
+    minItems: 1
     items:
       - description: Core Clock
       - description: Always ON Clock
 
   clock-names:
+    minItems: 1
     items:
       - const: core
       - const: aon
@@ -101,6 +104,27 @@ allOf:
           items:
             - const: rxtx
 
+  # On MDM9607, the OS can only control a single clock.
+  # The 3 hardware clocks (core, aon, ahb) are invisible to the OS.
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdm9607-nand
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+    else:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
   - if:
       properties:
         compatible:
@@ -121,6 +145,7 @@ allOf:
               - qcom,ipq4019-nand
               - qcom,ipq6018-nand
               - qcom,ipq8074-nand
+              - qcom,mdm9607-nand
               - qcom,sdx55-nand
 
     then:

-- 
2.54.0



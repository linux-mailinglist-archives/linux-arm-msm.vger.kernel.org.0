Return-Path: <linux-arm-msm+bounces-101635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDNKBV+tz2m5zAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:06:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC428393EB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51D94302BA28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 12:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78447372EF5;
	Fri,  3 Apr 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HgDvwEXR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C5369213
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217857; cv=none; b=Jf8XTPhomDaMVb5XHQTny5gAJTskAccIWOlyqHj2yUxB+fh8g5NcSBC/JJjK3cFvHklOBsfrpeqrSeeke855iktw7FH42GC8AlfE9NFKuH9NmYJOTY3lbAoXxheqpAjBZO5GPyeb6zfQw60/jHQ/d3Kc6SqCgKHyh8K6WXtqDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217857; c=relaxed/simple;
	bh=dKz6DwRy+I8HolN9zZODFxH6W/kWEV1820ON/rHuL/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=axcTNE9PDFcCu67mAp4gOuMskRpuzbc/fpsMlBURReKEFC81ydT9JV7bMgPHuK5FsSCPqtsGYUM1hXfK+YPEJbDAmUMcNNgKR+G8+cjhd4ZbfHpGxRyOt9o6UiJ+R/EpEAf7cH5BX9/JMoR0m3IWdWJnhNGYQN0zbvmSH6hmX+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HgDvwEXR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so18637155e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 05:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217854; x=1775822654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8kJFRzMGSbRY1rBaqmhzhvZeRD1mo+HmubUtJ2Qvyc=;
        b=HgDvwEXRExUust2zZs86mztSShxd0LFyHPl94bTuQWBOFlWeOgrdEulKpIpdWKK9da
         ChVZ8+io5woCySDeSVvHjVMU1u+p4SZpgq5u0GLHQV/1Yl1E/jI1B3RrJ+qioW5UOU4+
         Qy97CYF1SqQI307nazE3ptEfix/TDxEi25F61lFVVZivdwxmJ9Y/2q7/4amMP5tZmouv
         IPLrceW7sW1JX8uHLraU4SUAXSUej0elIs1JNOxiXuT8OvldkcWuyr2pbQq1NibBcGQR
         FxndASUFFc3OSfaibfk5ZrpkHEbggX4WBiPWsYW86m99IDGvFkar/r2XchTCYE3AcKil
         gIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217854; x=1775822654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o8kJFRzMGSbRY1rBaqmhzhvZeRD1mo+HmubUtJ2Qvyc=;
        b=rKNdQnPS2TxhBtjpfiSwF7mSPYwDXzToAvVfHzw5V09spwDey/PPBvJygVZXTalfU0
         h46J/7fhc4+52s3M9NgyTVveUO/EAXxG942VmjoGlD95QVScdcZI7cxzT9BGW1X1yctX
         fvWMZDv+zRC0ibAAFL1fbk7LYKr+UkER7VsrkNuBO8jugaYl8KQfIUicMvefMwGudXzx
         Sm07GoNKcq52ZqBhgp48hkp3cbRudWpg4fYMAkGWqigS8+q/NhVJC06TMWnxqj2fE2vG
         hLeuThhGF/rF4UbSl1eptnr451IqyYUkVbjAh/rBDBVU2/GkavNsKknvXnD7c+IqSocU
         o8LA==
X-Forwarded-Encrypted: i=1; AJvYcCXcPq7KviFXOUsbGC4o3ADC+rZ9pN+bE50WPZmfkz/ldOGF22RRK7cbg2qrw+zSXfYoTmkAZvyBgCa0680j@vger.kernel.org
X-Gm-Message-State: AOJu0Yzru0/VQNHsroY3wQrVU0AfnQKhlzSzDTFBjxGr14nOjvy7Mqyz
	eepvgr4gYkbgJgpXSy3hyQ9awhEBFKfEIzZ+eTzksDV2mfk/KfUjqZFeLRCCra2CGwI=
X-Gm-Gg: ATEYQzz7mTxapqK59/hocno4fR7zLA3V8r0R1MzxFrxRW+mwVSFZaaFiYBvXSALbZmV
	ZzsskBVtOLi34SifoyPviM0tPPRzP0H9/9wLgfvJRAZmFfKQCw6WlrlTrXrSdAySu9H5+LycmwY
	rqEuTaoTHBEljM8SSyIrbNQSttevb2jseKzyEqo2IkDiCWQ1dCX2aBb3kNKd4nTAgZJWDuzhsr7
	5effxR9YHwtXdC2zuvDlW5ZgWA1sWYfswBPgkJPSyiFiEWm4Ucmn4kEYHgcbHUy81dPSR9xXEf4
	JgI6VvzagW45z2V83kEa9MCs+ws4aphcpzsVkDp+Fx0MxoH2wrPDz9AvLqdYdftn3fBMRAal3V9
	f9G+0PIx8v3CaBC8VuJAdwN5CiRxCxeFLiejjkegDcgfrJPvWxT5z6jWHqqlvnyT8EE9W1KDMSJ
	SL0Oljc56or2Owi0zmkBm+RbJfWJm5SaSd5w==
X-Received: by 2002:a05:600c:1c12:b0:487:386:3714 with SMTP id 5b1f17b1804b1-488997b7020mr45285645e9.17.1775217854074;
        Fri, 03 Apr 2026 05:04:14 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 14:03:46 +0200
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-gxclkctl-v2-1-95eb94a7d0a4@fairphone.com>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
In-Reply-To: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=2653;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dKz6DwRy+I8HolN9zZODFxH6W/kWEV1820ON/rHuL/4=;
 b=ZWrhOaL/bOAb87rLQ6WBvjaaGxxQRMURRoHdO31wAzXyBY2so/9HvHQutRfD8Odap2pLgA5uS
 YZ8DVhiwCDmBrZqJSGHxM5RhQVJ3cwU+t7eu7IJpTv89P64tyy3nNtt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101635-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,3d64000:email,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: BC428393EB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Milos can re-use the qcom,kaanapali-gxclkctl.h header due to similarity
of the hardware block, and also re-use of the Linux driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
new file mode 100644
index 000000000000..3a9721abdd26
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-gxclkctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Power Domain Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
+  Power domains (GDSC). This module provides the power domains control
+  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+
+  See also:
+    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-gxclkctl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: GFX power domain
+      - description: GPUCC(CX) power domain
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - '#power-domain-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d64000 {
+            compatible = "qcom,milos-gxclkctl";
+            reg = <0x0 0x03d64000 0x0 0x6000>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&gpucc 0>;
+            #power-domain-cells = <1>;
+        };
+    };
+...

-- 
2.53.0



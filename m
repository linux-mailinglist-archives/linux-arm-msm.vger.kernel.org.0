Return-Path: <linux-arm-msm+bounces-95819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH3BJ+vcqmlqXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:55:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5B62222DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72DDA304890E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 13:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCE73A0EB6;
	Fri,  6 Mar 2026 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="z+axEiQK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF2C36C0AA
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804927; cv=none; b=QBP92AezSQYXFxWq8tDdry+phvS9nHUS9B9AJ0tXhny31z6LBQzA0IfErXtkDXtRQEtte+vKyF9WRI1M1aVoHbHAsRVSpul5XRWY2qJDVjGxKBeJQxptZfn8AN+8CDLPffpFqTtW1EPh4EKNx9EFPlUClkgisgUcYzvn0tKpml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804927; c=relaxed/simple;
	bh=S4AYyFcTsusx6JymB78ndk1LzxPjBUj/RxkWMGbPmis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdeGvYo/NfoFJaJtElI4YkG64fJZ2MSMKkbMKeYTSSBnbHVXK3QYFH5M/ocIz5Q2R1fPpcO/gP4zVcnufUOAm8eMlvgs+ioWCDJsAVtScnAZbI+PIl46BVRa/9ZTo85XkKkmX9Bif8kUnD3hlf9mVNiTSZA28OlLl7m3S+a6WVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=z+axEiQK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439c6fc2910so2244339f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 05:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804923; x=1773409723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix3uV33RQkJIwlvd9fVLf03DEoMJ43/Z6jDu2eagGtM=;
        b=z+axEiQKsxnQ517nvve/uhAJapQ7CMCQEyCeDQ3MdFAqjR++TUU1Q+woOwN/F6zEpN
         z8R0iJn+Hpor4agBzVj+ZfX5hOzhO1d/wfMswIjBKyIF47OZZdIGzhckPWucdMXJbkus
         P3yz/2qNiopibjBJDPkXQgKRo//Qxfx/RwXWS/1/Zvi8F8ujLgv5vmwpi6Fx35LvDV+0
         VLgwOkKpbsOixER+ZljUGEpaz1l0WrSAIZMqdnLpZ7L5KGjoJc/+BfucRMC8q9rmOgz5
         cdL5mblYSCRERnCqdj8HA+i5WhQggaGRnTZ+jJmoM4dhoo7nS9kbMxsKbQr+4Z+TmZSU
         nwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804923; x=1773409723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ix3uV33RQkJIwlvd9fVLf03DEoMJ43/Z6jDu2eagGtM=;
        b=iaFzy1ZnhGhgb6x0CRjyJs080Cd9RVwVIY0O5InktCFVu03svr0d69QumPYxy7ESQy
         TThunmsz6yL56iF/s85wdgygzM/mRxO1KFxCH44Eg/bmVDPfwZkDQ1HVzTyaqUCfrgta
         YAh5k42tvA37NM1MvN+dBUyY9i+vEW3BhvZJ5cN1K4Z9iVLzumY23+GoFOdyYnla2uhH
         Y54ZG1e2IwyUEnYaCqMnpL1TRRzom1Z015aiWoT+StfhGpslWg57oShQwG69CGIgd2Rj
         KSoKO0oEz2LbZhZ1gWECJnMcSc9gRS/r3RsiWC4OT1cCetJUXxYRspBgp0ENW15Uv9yc
         IxSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWBMT1c/NqhPbyKw1YTiJBVj7PH+vvYOUUwefvUpDHiQyIteK5Q4SDfilpmlivzg8UJFPZRGg1wSNd9aFj@vger.kernel.org
X-Gm-Message-State: AOJu0YwIb9ypgQBZs6RRYhImJfhEiGoiJuYABisvFth/m1wwDrG6uHJh
	m36TgoYrDinXxg+syQt9vuQLKAvlW7rX2XxMPhPfVsc+2qRgpl/YC4Gjq1ZLF8R6Z+k=
X-Gm-Gg: ATEYQzzLmFWFy7QAy0VrAgkRUBykFZwRjm2ivWRgNq/a6SmTxLehojzP3DybJQu6q3Z
	2crUgq1ZdmvVb5KT9S7cOoXhaJTBeHxMcGtFID6/ijU87UB7ZRlEkBc469Xautg0MSULQLmLlg4
	9MuLUDoqYNtbLBlWTi/a/7ZkJn8SSFORysnOe5m1zRIHT2U8WqYGYT2N7FyGn8T0YZgmxDI6fnm
	oO/chL1/YhdQn5pbtHgHMnvDnp3A+XKFANwWrgPNsjuxHXTswbJ1kSvpYvX34IYm6nz7vGc3F5z
	ZbZD2mDNog8kV+3TYBj4Fxnzk9DhgoIf4Pv+C+y2QhCFhKf9GSffhwTefmMRn15GYEOcxl2t14J
	/hnhHLiCnsbakVi45PyF6rB1BHvGyXox0bBH1Uz8T/z0rbN08uLVjKD4I0HHlNF+wiPsq5FIyOB
	NAbvutfvgmpcy2QzCTFaoc+p19NigHrLZO83DAz7GwJz0dywzMat0kYRBzkcdEHyP72WoozPNvX
	erKi5m8ioqetFU=
X-Received: by 2002:a05:6000:2911:b0:439:beee:43aa with SMTP id ffacd0b85a97d-439da351b41mr4056912f8f.16.1772804922768;
        Fri, 06 Mar 2026 05:48:42 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:42 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 14:48:37 +0100
Subject: [PATCH 1/3] dt-bindings: clock: qcom: document the Milos GX clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-gxclkctl-v1-1-00b09ee159a7@fairphone.com>
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=2517;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=S4AYyFcTsusx6JymB78ndk1LzxPjBUj/RxkWMGbPmis=;
 b=kTbKHsy8jRCEnPD2m5k97hP71fQLFbaGxDIxGv0EHdi8iyAguyE0P3/OXLbhWgeCUxmf6Letx
 C6vAaAw7wgHAHz6VS+U+eRiZmOrn0Q3QwZXfYemKr7ZsfwtKizk9pHi
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 9C5B62222DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95819-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,3d64000:email,devicetree.org:url,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Action: no action

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
new file mode 100644
index 000000000000..47dc6bb66120
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-gxclkctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics power domain Controller on Milos
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
+  reg:
+    maxItems: 1
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



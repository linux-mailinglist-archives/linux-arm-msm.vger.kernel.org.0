Return-Path: <linux-arm-msm+bounces-116980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FWyHFFHnS2oGcgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:35:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E243C713EFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:35:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=OSIed9tG;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116980-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116980-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CECD301ABA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726443B47CD;
	Mon,  6 Jul 2026 17:27:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396243AD520;
	Mon,  6 Jul 2026 17:27:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358846; cv=none; b=WdTF/xy1choZH4mnt7N7lRd6RseTo9z8pt0SafpIZ3QK5ql7J5KY9+9jff4EsKuJTeQFZQNPopSxYiV1FlMr0nWqL3XxR0c4NsW0I9nGbihzf5T6nOiNCrGAd4CUijnaCSQRBIDucHK7+hl58OaGUSU105PpWbws75xeDm9CFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358846; c=relaxed/simple;
	bh=yxTWtFU6X5LYhylAEqY8Y/GpmPDJczFMnReoQnWwz8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2BGm9dVQRkDAV5eOT0DjH0e1WlzdzObxVCMMmAbKyyhyUEHmQCIegnhGgg8QTYFBGWpHLjRPDWo8LfPe7ONd8LTPi6iAckMetQuZboSGF3u0MOdwiQU8XMRlH9xdPOvy9P75P4sCt5nveTMq9uNWOZTX29vgxa2vI3MGVh3utE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSIed9tG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB1D3C2BCF5;
	Mon,  6 Jul 2026 17:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783358845;
	bh=yxTWtFU6X5LYhylAEqY8Y/GpmPDJczFMnReoQnWwz8A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OSIed9tGTb4It3IGqNcEj81Lt+X1hc3Jn6NGiRctKyFXYETzrzQT7ENbloKEA5hLp
	 PR/R56x5fWzJHdVBLpob5BfuB4qurYXHBuevlqzDVRC5l2dQk3Ez05ScsrUGuOtNIC
	 dteeMky6k+TRnAaPLymh+G6Vq0d+RDBDrB+6l3uop+eNn/METNL+1pp+BLTkgIw9Df
	 CdaBr/GhjLHSiK2mraPnmBseYR3kPmUcZaXIIWq0/y27m2ro3cNI/eQE0aJnZJR5iY
	 /YYUI9hkOOhhOQnlatw3tIPggQfLz9BVFPG+XRyYm811gRfsSkij3sruLo4wn4SNAb
	 6+JVvkPNInG3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97C5C43602;
	Mon,  6 Jul 2026 17:27:25 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 06 Jul 2026 21:26:17 +0400
Subject: [PATCH v4 1/6] dt-bindings: net: bluetooth: Document Qualcomm
 IPQ5018 Bluetooth controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-ipq5018-bluetooth-v4-1-350262a30959@outlook.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
In-Reply-To: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783358843; l=2905;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=s2FH5Zs3zXDTFzKOcsGJK6QiBfuMp1ztcJeP5kbawPE=;
 b=f65pZZqMxN/MWaeANWePOiJweraURF5B7Ius3F0jALVKlOFlK5o5jfOWns0SzNvw7diBDbWjU
 X81FGfYKi9RBQYLF1HC34UVyiEABrj3e5l+f31NScTc7dwsMvAGsYw7
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116980-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:george.moussalem@outlook.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,outlook.com:replyto,outlook.com:mid,outlook.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E243C713EFB

From: George Moussalem <george.moussalem@outlook.com>

Document the Qualcomm IPQ5018 Bluetooth controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../bindings/net/bluetooth/qcom,ipq5018-bt.yaml    | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
new file mode 100644
index 000000000000..2119162994e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,ipq5018-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ5018 Bluetooth
+
+maintainers:
+  - George Moussalem <george.moussalem@outlook.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-bt
+
+  clocks:
+    items:
+      - description: Bluetooth Subsystem low power oscillator clock
+
+  clock-names:
+    items:
+      - const: lpo
+
+  firmware-name:
+    maxItems: 1
+
+  memory-region:
+    items:
+      - description: |
+          Reserved memory carveout for firmware loading and runtime data
+          transport between the host and the Bluetooth controller.
+
+  interrupts:
+    maxItems: 1
+
+  qcom,ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: syscon node representing the APCS registers
+          - description: offset to the register within the syscon
+          - description: IPC bit within the register
+    description: |
+      The outgoing IPC bit used for signaling the Bluetooth controller of a host
+      event or for sending an ACK if the remote processor expects it.
+
+  resets:
+    items:
+      - description: Bluetooth Subsystem reset
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - firmware-name
+  - interrupts
+  - qcom,ipc
+  - resets
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
+
+    bluetooth {
+      compatible = "qcom,ipq5018-bt";
+
+      firmware-name = "qca/bt_fw_patch.mbn";
+
+      clocks = <&gcc GCC_BTSS_LPO_CLK>;
+      clock-names = "lpo";
+      resets = <&gcc GCC_BTSS_BCR>;
+
+      qcom,ipc = <&apcs_glb 8 23>;
+      interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
+
+      memory-region = <&btss_region>;
+    };

-- 
2.53.0




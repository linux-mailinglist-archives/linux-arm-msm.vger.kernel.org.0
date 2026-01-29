Return-Path: <linux-arm-msm+bounces-91124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fjJdCXwQe2k9BAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:47:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69AACEF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A05E9301DEDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC3B37AA88;
	Thu, 29 Jan 2026 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G14Wln2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E854C379999;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769672823; cv=none; b=RhkYemEgX7xuHbNGuXgBHIr7ZgxPcsr+BCRHlDk7n4pBc+MwQeNJaq+Zo7yc9ZQ9839jYomPPH4PTKpdGCSz16DTDCOuWdQgpiZpWSaz25ZhONshUx2neUEqrvplsJlGA+9MV7GASRCzGdGyP40Gg/Zpib9vIQ+MmseSxu+CWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769672823; c=relaxed/simple;
	bh=dHy/JjEVZLZFs+JgjfT+iPpO5D7TU37odI3pKMF7TsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+2psDxZV8wXcbFDVbn6yxPJ3b1zCzquFrQ/mBrRvaWUMahvrTr+rGUbI6utJs0NnVjB0ecZpA1MGu/cUzKPsEaKr8W9xk23kN/ZTBUnQ1DMVixbmNjQwd6ylv8WqACIt1ZW17qupZ/m9tYvFBpSnMkaUsdmd0USVzf0EzXALGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G14Wln2m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83AF8C116D0;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769672822;
	bh=dHy/JjEVZLZFs+JgjfT+iPpO5D7TU37odI3pKMF7TsY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=G14Wln2m+eOfsIG7l3ISzARBqBsENG/CGk7tQDXnlrbCkiYAE2CucclIQt17vnBWh
	 q0EK/CsaVcN7MtdKJ4iCq7GREi+eJtUaq5Iljxi4sTt13CIyrict8NkpOD0z/F/5zp
	 tl0Kg1NXdz+LnYoujaAnj9MqmNfcwllKygS2dg2dsEuCckhnqt4ItzxNhasnw8T/Mm
	 ELWKa8PnOs8ZG8CyhN3MZiOWXxZf4hWfN4fI2geR5KlZgUe3hLHTlABk8IYTplQo7b
	 xofh02v3ld422OaEHI/55uQt/R3ueXKmgCIsUeOfA3QSzgdi1SdDkEwTf6Wv5nscTb
	 QvuvogIrsK3hQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75311D358D1;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 29 Jan 2026 01:46:30 -0600
Subject: [PATCH 1/3] dt-bindings: firmware: Add tz-log doc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-sm8550-abl-dtbo-v1-1-abca3be14024@gmail.com>
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
In-Reply-To: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kumar Sharma <quic_vksharma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Kuldeep Singh <quic_kuldsing@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769672821; l=2641;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=j4W6msnkMxX28xtcW8HkyUTEMXxzbIT7opeITn1uMGk=;
 b=PqAGvkhD9Zzy8UBReqL1jxcUtMVxygIkCcOIBcWYPM/8WiAI96j0BGWS5mdfpeMU45B2F2Eg/
 xz69tSs1LzcAvPgEMAylvdeQlGqqQMYaz3AqDk1LMJUX0b/h7X/HzOB
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91124-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,quicinc.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC69AACEF0
X-Rspamd-Action: no action

From: Kuldeep Singh <quic_kuldsing@quicinc.com>

Add device-tree bindings for qcom tz-log. Exposes a debug
interface for accessing and displaying diagnostic information
related to secure code(Trustzone/QSEE).

Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../devicetree/bindings/firmware/qcom,tz-log.yaml  | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,tz-log.yaml b/Documentation/devicetree/bindings/firmware/qcom,tz-log.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e5c67ca1546c2d10f4c3b5979bf7b8a1a7dd2132
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/qcom,tz-log.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/qcom,tz-log.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TZLOG (Trust Zone log)
+
+maintainers:
+  - Vikas Kumar Sharma <quic_vksharma@quicinc.com>
+
+description:
+  This exposes a debug interface for accessing and displaying diagnostic information
+  related to secure code (Trustzone/QSEE).
+
+properties:
+  compatible:
+    const: qcom,tz-log
+
+  reg:
+    maxItems: 1
+
+  qcom,hyplog-enabled:
+    type: boolean
+    description: Indicates(boolean) if driver supports HYP logger service.
+
+  hyplog-address-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Register offset to get the HYP log base address.
+
+  hyplog-size-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Register offset to get the HYP log size parameter.
+
+  rmlog-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Register offset to get resource manager log base address.
+
+  rmlog-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Register offset to get the resource manager log size parameter.
+
+  tmecrashdump-address-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Define tme crashump DDR region starting offset.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        qcom_tzlog: tz-log@146bf720 {
+            compatible = "qcom,tz-log";
+            reg = <0x0 0x146bf720 0x0 0x3000>;
+            qcom,hyplog-enabled;
+            hyplog-address-offset = <0x410>;
+            hyplog-size-offset = <0x414>;
+        };
+    };

-- 
2.52.0




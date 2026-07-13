Return-Path: <linux-arm-msm+bounces-118877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u0eEIhRFVWoxmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 22:05:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB5974EF26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 22:05:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=bxtzzwDR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118877-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118877-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35544303D731
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273F535BDB2;
	Mon, 13 Jul 2026 20:05:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A1352C52;
	Mon, 13 Jul 2026 20:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973134; cv=none; b=aYGvnpBG0b+RUwnQNP3UDwpQjahBOwgXNa6k8Dfe0/8vmX2o4dWg9BxuXZSWJRFWFuVpf+HE+D2oyJvfQWc8Y640gzUBxoADZlXvSl1b02jCFTQ7m7cLfEWP1Iv7IjHm0rNuS1YfmWZ6rZ9zccO58rwt4IzgpzuulPMxMsAlfYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973134; c=relaxed/simple;
	bh=J4U5ckGUKDpq/URapFQppuBePtObl8xHnE3TqwFFM6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nkhflz6ELW9Kiv6M7hDUM065hHt6lzIihKHCMXnjXCdlCNfLyL0Mw0OlWUhik1u1YEqeQVjrdK//MyF7hpEKSmXXt4pSDat3qYobLae5uxZULnYICmv9MRqR0cTsWUKK6OFw6FIp8BDbhUozq3nIsrXr27QKdwvQVnSPf4zmZo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxtzzwDR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F66AC2BCF4;
	Mon, 13 Jul 2026 20:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783973133;
	bh=J4U5ckGUKDpq/URapFQppuBePtObl8xHnE3TqwFFM6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bxtzzwDRJuZKs3HqAv3B5Ti5c5CgPtq0U1qiFhXQkT1qmWOj6d67DBUdYTLCDJlGo
	 7muKa27lKjopyHNU/PN5Zr3saigt0jiwsxf4aOOg9jGO5avlcGPzk4V1ZbKeYTnS4Y
	 2yPahQc4MTeEtC5ylaXviFslKPjdb2ECrq9uJkSJGqc5ZznRUqCHpWMFXi9jbI809n
	 U5eC1o1UfcM/2yhip9BKx/vyaqZO8AUas1GxPz6W79pEXsC6PYtLSLXC35ie0ExDzL
	 r88Y6Pd7ITfMXFpTbiEczoTlJdz4AsEe66hAQVOxMUtVK8R9KEJNp1td+6cW73wNZ3
	 /a/NXJOiIUVyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFF3C44507;
	Mon, 13 Jul 2026 20:05:33 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Jul 2026 01:35:32 +0530
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat
 pulse clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
References: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
In-Reply-To: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783973132; l=3495;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=RbD5mg4ILVqZOMn1H2IVY7wxyZAxnDGJwjZKThdsa64=;
 b=h3h+596bSMJnpGEJ84mEFcm+pQkY7CCeRfkm8dGQ24+MDwGMQ+Q1j/rhGLSiF1S6Ex07exWgr
 z3yrEBKvxqMASu4TBX0yutnTs3PWaOdG9ELJHnO5UzTRVgThETZXSpw
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118877-lists,linux-arm-msm=lfdr.de,sarath.ganapathiraju.oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:sarath.ganapathiraju@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[sarath.ganapathiraju@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DB5974EF26

From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Add Qualcomm LPASS VA CSR rate generator node that exposes
the lpass_heartbeat_pulse clock on hawi. Also extend the
qcom,lpass-va-macro binding to add qcom,hawi-lpass-va-macro with
its four-clock constraint (mclk, macro, dcodec, heartbeatpulse).

The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
start of the DMAs and Codec Interfaces for the audio usecase
and can serve as a periodic wakeup source for the DSP.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-va-csr.yaml          | 47 ++++++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml        | 18 +++++++++
 2 files changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
new file mode 100644
index 000000000..794da92ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-va-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS VA CSR heartbeat pulse clock provider
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+  - Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
+
+description:
+  The LPASS VA CSR block contains the rate generator hardware which
+  produces the heartbeatpulse consumed by the Bolero codec macros
+  (rx, tx, wsa, va). It is modelled as a clock provider
+  so consumers can reference it by name in their clocks list.
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-lpass-va-csr
+
+  reg:
+    maxItems: 1
+    description: Must cover the full VA CSR block (base 0x7EE0000, size 0xE000).
+
+  "#clock-cells":
+    const: 0
+    description:
+      Single clock output "lpass_heartbeat_pulse". Consumers reference
+      it by clock-name "heartbeatpulse" in their clocks list.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    va-csr@7ee0000 {
+      compatible = "qcom,hawi-lpass-va-csr";
+      reg = <0x0 0x07ee0000 0x0 0xe000>;
+      #clock-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbda..ae4df8967 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+          - qcom,hawi-lpass-va-macro
       - items:
           - enum:
               - qcom,eliza-lpass-va-macro
@@ -168,6 +169,23 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,hawi-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: heartbeatpulse
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1




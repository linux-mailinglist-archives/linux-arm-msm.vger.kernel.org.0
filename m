Return-Path: <linux-arm-msm+bounces-94999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHXjAUq4pWkiFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:18:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 104CF1DC97F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1778F30C17FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 16:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A763B421A0E;
	Mon,  2 Mar 2026 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBDO6xpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838D34219F4;
	Mon,  2 Mar 2026 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467138; cv=none; b=fGxkRJ/tLniUZkn1UMm84pqyqQrqYFhRtrsQbrbndwhBctPRvfveC58YA9gclaNNcibCZrHFzhQPWJXLdvwoICAjoAwnIAn5tN5fepGdOQ4Ari4DgDiyCC2/s1srZE5487yGIklauEMR3dDJFTGTPv/1hS4+CIgUxuZlDeM4Dx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467138; c=relaxed/simple;
	bh=9XAB1WkKG/tI/e5hODd4LVsH6dlMu4Pako5uxzY7r4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LUbjXkWahxVpmVbZcijX+B0+hAhFLnOEcSGeT38Z4poiFtO6Ta1VFA0yDyw501YAeDnpOlyopd+dBax5hbQKO2cAJ/o90kaNIadzJvkIHGnngrYfbAa+OF+DFoyF0APY1IbxqHMhZRnJoHIkexD1CnOZ49IAoLA2qvFATBCx28o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBDO6xpy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE525C2BC86;
	Mon,  2 Mar 2026 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772467138;
	bh=9XAB1WkKG/tI/e5hODd4LVsH6dlMu4Pako5uxzY7r4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BBDO6xpyUQKWL9UsEIKdAWsnIaFoWPIpLpD7uwMfZb0ivCt/fEvdD6n/A2jt4FSRw
	 egHhbfCogoP+omXjTBHhg9ClSMKEGnzbifHZMJg7rK57QeAZ59SM8D2gG9YjQX67vf
	 WfBM96nLV3IPp5dyWOU44aCNJx1c/5uj7QQAGsQX4BfLtJrUhS+L2DZsPFYpMbCWUO
	 2RCLx0Anp5mLKSg57g5NUu7nHpriYYf30uGjoyZP1tZe0uE5zx1jAKurY6gep9uyfr
	 /yfvLOGU1Q4o6kiiFoXLvLmFvtBJL0fOyV5vEnLFQz/nBbzoEuE79cddcGAqKbt6DB
	 /rH/mNzxoommQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Mar 2026 16:58:43 +0100
Subject: [PATCH net-next v6 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables subnode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-topic-ipa_imem-v6-1-c0ebbf3eae9f@oss.qualcomm.com>
References: <20260302-topic-ipa_imem-v6-0-c0ebbf3eae9f@oss.qualcomm.com>
In-Reply-To: <20260302-topic-ipa_imem-v6-0-c0ebbf3eae9f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772467127; l=1479;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=EkZkFoDGwWgx618F15NSBVvffYCMvU4Fbz6lmWps3uA=;
 b=TQjbvFSC2DWAlWeInoI/npkN46UsX+LvcBtHh6lhCy9MQXAQQGTIuham+mjaHG1luXLCbOQMb
 UZh0yhNyPCnBSAQSpXdPEZwnGmubVX7GY1P5ZMvMmxV/j191nkrirah
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 104CF1DC97F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94999-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,riscstar.com:email]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The IP Accelerator hardware/firmware owns a sizeable region within the
IMEM, named 'modem-tables', containing various packet processing
configuration data.

It's not actually accessed by the OS, although we have to IOMMU-map it
with the IPA device, so that presumably the firmware can act upon it.

Allow it as a subnode of IMEM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2f..c63026904061 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -67,6 +67,20 @@ properties:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
 
 patternProperties:
+  "^modem-tables@[0-9a-f]+$":
+    type: object
+    description:
+      Region containing packet processing configuration for the IP Accelerator.
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+    additionalProperties: false
+
   "^pil-reloc@[0-9a-f]+$":
     $ref: /schemas/remoteproc/qcom,pil-info.yaml#
     description: Peripheral image loader relocation region

-- 
2.53.0



Return-Path: <linux-arm-msm+bounces-111249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rFaFI9K6IWrkMgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 19:50:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C76DD642676
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 19:50:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=lftjjPC4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111249-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111249-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEA793011C49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 17:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567CA3B9D9B;
	Thu,  4 Jun 2026 17:42:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3242E35B650;
	Thu,  4 Jun 2026 17:42:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594935; cv=none; b=R6YMP/Hw6ORsLSO+37tICFqVvWbk38ZHzoCX1X5g4ow5oaHblm0vQ2B2ZemgcvOBj5LK+cMqH3uwS6ARKRDaqw5C7FhART0O36yM5JVXmI3t+RCxOBhvuf+lcmUrqWgqi9jWT3aTGDa0mweTG9HY7i1rV0JSVeREw54gH2+9vwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594935; c=relaxed/simple;
	bh=231xMYKGXDG7S0Y4pm6uU1IHjoIcdcBMgYM7hS6SwW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gdT6oXuKogKbPjR74JFvDADPgRnU/okpQ+n/GVCKsNR5wtLBEBulETwfTN1rInQRRCVvhFOidzR5gvV7Ytr3Fncgq4NAdz0A6jRhl/5WL4HJKE488dTxx1a4xdhzw8Qf79hodhMspna1DD5MUe2WXeLAGRij/mqB2CVFcG79FE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lftjjPC4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D73FC2BCB8;
	Thu,  4 Jun 2026 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780594934;
	bh=231xMYKGXDG7S0Y4pm6uU1IHjoIcdcBMgYM7hS6SwW0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lftjjPC43Bz1tsSd18xZvNjAigNWb0SKusouolA+Vm6re7n5a6OvKrQ/blKFzzzAv
	 0AuUw1vOpsCrOkT3W4OCgzpE2Uwa+c1auz2fFmnBzwxM+1GuRUBPZTUttRAdmcE8zd
	 Bag2mCzDntVEYEYNf98txpkim8aGbNzV0EEiwa+/zMP9c/6wWNDqAxxP3QzPfNxRXK
	 m5eCtcah4y6xlh5QKOVaCPCXw3zrNmxFJSsU30JQ9Y+ircHXzWexavb2TARxC93X8N
	 3XeO4Ng6i3Dst++qUUV0O4X4sDvKyal0r48kUQSBUagdGv4/wDEKzdbiE43hRGGDpI
	 ybqDE0FgzXeNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EA6CD6E75;
	Thu,  4 Jun 2026 17:42:14 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 04 Jun 2026 19:40:14 +0200
Subject: [PATCH RFC] arm64: dts: qcom: hamoa: Drop cluster_cl5 idle state
 from CPU clusters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-dc_zva_mitigation-v1-1-d1148c1c0259@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwMT3ZTk+KqyxPjczJLM9MQSoGpdIxPT1OQU0xRzS/M0JaC+gqLUtMw
 KsJnRSkFuzkqxtbUAfq78lGgAAAA=
X-Change-ID: 20260604-dc_zva_mitigation-245ecd5d797f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steev Klimaszewski <threeway@gmail.com>, 
 Icecream95 <ixn@disroot.org>, Marc Zyngier <maz@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780594933; l=3529;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=/rH8YcV139zvO6dOehQpAdl9iLkHcjBRC9U6y6wbGdg=;
 b=9nM7259tcv1rWqzpQGOxVIgH+Ja+KagwMrfG70GmEKBMtFuhyS9sZa2hxWLqYVfAl1CTu8T2h
 +GRKvt1wTwQA6FPWM8I3yihdh7YQ2ct+nGbWLHdWZuPR0gQUtMrsAr8
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111249-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:threeway@gmail.com,m:ixn@disroot.org,m:maz@kernel.org,m:jens.glathe@oldschoolsolutions.biz,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,disroot.org,kernel.org,oldschoolsolutions.biz];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C76DD642676

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The cluster_cl5 idle state triggers DC ZVA misbehavior that resets
X1 SoCs. Remove it from cluster_pd0/1/2 domain-idle-states for now.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
This is an RFC for a mitigation of a stability issue observed on
Snapdragon X1-based SoCs (Hamoa and Purwa).

Affected systems experience spontaneous resets under the following
conditions:
 - During intensive `git fetch` / `git pull` activity
 - During mostly idle periods (Bitburner and similar workloads were
   frequently mentioned)

Steev Klimaszewski first connected the crashes to git operations.
Subsequent discussion in #aarch64-laptops led icecream95 to isolate
DC ZVA as the triggering instruction and to create a reliable
reproducer [1].

Further debugging showed that the issue is strongly related to deep
cluster idle states. Marc Zyngier suggested removing the deepest
cluster state (`cluster_cl5`), which resolved the problem on all tested
consumer hardware.

This patch implements that change by removing `&cluster_cl5` from the
`domain-idle-states` of `cluster_pd0`, `cluster_pd1`, and `cluster_pd2`.

Testing:
 - Lenovo ThinkPad T14s G6 (X1E-78-100, Hamoa)
 - Lenovo ThinkBook 16 G7 QOY (X1P-42-100, Purwa)
 - Lenovo IdeaPad 5 2-in-1 14Q8X9 (X1P-42-100, Purwa)
 - Lenovo IdeaPad Slim 3x 15Q8X10 (X1-26-100, Purwa)

All consumer devices became stable with this change.

On the Snapdragon Dev Kit (X1E-001-DE, Hamoa) the situation is
different: the firmware does not advertise OSI mode. Even with this
patch the device still crashes with the x1e-crash reproducer. Stability
is only achieved by passing `cpuidle.off=1`, which of course increases
power consumption but makes the devkit a bit faster, so there's that.

The different behaviour correlates with PSCI mode:
- Consumer firmwares enable OSI mode
- Devkit firmware stays in platform-coordinated mode

This patch is therefore only a band-aid. All evidence points to a
firmware/microcode issue where DC ZVA can hit caches that have been
powered down by PSCI idle states. A proper fix would be either a
Qualcomm firmware update or a kernel erratum that disables DZE on
these SoCs.

[1] https://github.com/icecream95/x1e-crash
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142b..8ec39ba621946 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -442,19 +442,19 @@ cpu_pd11: power-domain-cpu11 {
 
 		cluster_pd0: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
+			domain-idle-states = <&cluster_cl4>;
 			power-domains = <&system_pd>;
 		};
 
 		cluster_pd1: power-domain-cpu-cluster1 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
+			domain-idle-states = <&cluster_cl4>;
 			power-domains = <&system_pd>;
 		};
 
 		cluster_pd2: power-domain-cpu-cluster2 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
+			domain-idle-states = <&cluster_cl4>;
 			power-domains = <&system_pd>;
 		};
 

---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260604-dc_zva_mitigation-245ecd5d797f

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>




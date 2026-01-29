Return-Path: <linux-arm-msm+bounces-91127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJX5OYEQe2nqAwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:47:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55725ACF15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8C5F3007223
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3602537B3F1;
	Thu, 29 Jan 2026 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRK9W+9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F00837A488;
	Thu, 29 Jan 2026 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769672823; cv=none; b=M1TnZDCaBxjRMoPIwfGS2j5c1DX2vuE+2VvpEqLLWivQw0OhBhFSFE00IUEU95vLMOXeI8QLuNgU6InyPsV8qWb7V3ai1CR+pqSR3QIK/nMaHI8dNSMDWqHg6te3FYjSpoU9XuN+F6L5cPxVAWT+JgeKOTjQOJDnIMXMH+M/DCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769672823; c=relaxed/simple;
	bh=owsztdqzx4ohcpFK/QIOsIKpzCL/45k24iSDAhG0Zlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lklPAwIyQHa0Lut+Qj/JRWLmMH/dI4zF74hreIWRmo4ssdKfSi80MN3syWCyYfb6ty6QWTi6uPwCXMz01vsf4egoB62S2q6ed9KbLTmiclVkkXOpKU3gLJgx2Z+Ofw5AeAlNtPyp0GbLJ9KMh+hfr+9nrsBlkq7FgLjmmwVwyhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRK9W+9G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A161FC2BC86;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769672822;
	bh=owsztdqzx4ohcpFK/QIOsIKpzCL/45k24iSDAhG0Zlc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NRK9W+9GMrWrFtWtEcpx6IVwxRacf1bZsgokoGsUJg8YNmURleRmDY0XgER9NkEHh
	 5K2jLelJSWAubatnFLmmEyncfgVQXcv/PlGUtYWcvvsiplvUQBMXCwZr4WR9bwaCc8
	 u/zNcORBp3H48XTp3v4k4nD9Ydd8/0NP9nPdnxvi0eFSABFQTlmzuAHExtYS5tM3Aj
	 Zv7RaMO9QB7uQu8rHObf9FfIXXUo5tQlv+aZrWYmOy3iihHVDLFXZr3Ozlxjt4hlbS
	 eMWF6i+pEKnBVLmPEs1dDPFTX6nY9xtWKAZecF58UXurHWORZxZcIY0pGtVIJwaLmf
	 Hvgxn4nLBvfpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7FBD358D8;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 29 Jan 2026 01:46:32 -0600
Subject: [PATCH 3/3] arm64: dts: qcom: sm8550: Fix DTBO boot failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-sm8550-abl-dtbo-v1-3-abca3be14024@gmail.com>
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
In-Reply-To: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kumar Sharma <quic_vksharma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769672821; l=1325;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=1QhN7qYUAYY4kDlWLSrCOTr9aoermzedi1sIaXcq8p8=;
 b=s5S4Ku95A0azWVC3DErKg8BiBODrzC+n9GJ2cMLZBE2m2txOGWZVoLMBpRm3txKTwBoahXtU3
 3woZ5ZOsH5JDSiEcOu8ukPN0r4omwB/GPWcL7HxkNZ0X/61v76Va44d
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91127-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 55725ACF15
X-Rspamd-Action: no action

From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>

ABL requires certain things in the base dtb to apply a dtbo. Namely:

* The scm node must be named qcom_scm
* The timer node must have a label named arch_timer

This aligns the sm8550 soc dtsi with those requirements. Without these
in the base dtb, when ABL attempts to apply any dtbo, it will fail to
the bootloader menu.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 740e3c238e8ed0f162dd168291f6e307ace66e80..d7cc20e1931904e7c603b800089f00955ecec3b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -329,7 +329,7 @@ cluster_sleep_1: cluster-sleep-1 {
 	};
 
 	firmware {
-		scm: scm {
+		scm: qcom_scm {
 			compatible = "qcom,scm-sm8550", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
@@ -6764,7 +6764,7 @@ trip-point2 {
 		};
 	};
 
-	timer {
+	arch_timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,

-- 
2.52.0




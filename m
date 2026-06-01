Return-Path: <linux-arm-msm+bounces-110541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAOQCfBJHWphYgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:59:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AD661BFAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29EB030707C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 08:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A18838E8DB;
	Mon,  1 Jun 2026 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGu0BOGZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD385384CDC;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304029; cv=none; b=s8OFTPO1t73D78YbDuMbQFLiyHt/N5M2f4K07SqHvjZq9mWoAeyjPjV2E+3/wfPuEfs4Tmp9f60UAL+uRlC1xAGhYW+jSruf48fgPP2FhhefTjaDf1aUO0yw/cdCe5GnoOI2QMVac9+VoA2Z12S19BlEMcZHnHVmuTPH8Gl8hqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304029; c=relaxed/simple;
	bh=wjdwTqZ5D5ZMAy32TwmJ5CTrlMm4QYSLdb5eI9NYIq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3ykyyrH0PEkJp5b/M0HOW7FrNkfdaEjO0fHxOZ1VLy5b+z4Er0pJPBUMsKwS69vcvbh89v6S8w6fVGGEkb0a+T8WR0An4s9LLsUtqPq2Li6R6y8GPISgpTWUsRg4SnVMjO4qvTbc2G/heXqgK9V3PZtsx1Ysmc1qrn1WGKB1V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGu0BOGZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F83CC2BCFB;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780304029;
	bh=wjdwTqZ5D5ZMAy32TwmJ5CTrlMm4QYSLdb5eI9NYIq0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kGu0BOGZ8BoSfUc2zB1DPdsRn3Pm5Jzoq+wIaRgNfSjAkfDxN4tVl1mhboVFBH0jW
	 hO1pwULLQhCWSSDeqYe7+ZSbL4WnYPNBgsoK2zSVTTNLnVHGO9WiONymEFFcd4h5+f
	 WeMmR465VibezSG8hOIYrGAGAiNsr9b7tStaTiRkxQxfrIGO2Avz/FBo3C8HjlszOv
	 G93eRf8yvimsYJgRyzx+HtRUeu1bx9ZM4xbVW77mFJDFnWe57hj58h2CuU4M/DTBr7
	 QdGGo81qcZodhrHpJYzHzBLMbTDeJDr9W9hYarfJxw5pczghMcsi8MUIR0r0GFFC8F
	 PfWrjiQLZZhsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D81CD6E62;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 01 Jun 2026 15:51:21 +0700
Subject: [PATCH v3 08/10] ARM: dts: qcom: msm8960: add SMSM & SPS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-msm8960-wifi-v3-8-fec6ac8dba02@smankusors.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
In-Reply-To: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
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
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780304027; l=1706;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=29iZiaPwFJy0KE3pkLEKwM4IFfOE4DRw/PBlrOR2g54=;
 b=fnXx5cV3h8+iTvA96iWudVfyXCnQS2jBKzvsX+hBfjOEbQy2W5PaLquj3sQe982atiJnMkBFW
 C8oMRr+Nb9LB0Zb9LiwCi2GFv2BSFFYBYFWYyIXtXASJmBEU0yzWrRX
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110541-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.185.218.32:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.61.9.0:email,0.184.161.160:email,0.0.0.0:email,qualcomm.com:email,smankusors.com:replyto,smankusors.com:mid,smankusors.com:email]
X-Rspamd-Queue-Id: 67AD661BFAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add the Shared Memory State Machine node to coordinate state transitions
between the Applications processor and the Riva subsystem.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index cb7199d0366e..662e2e45bbb8 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -109,6 +109,31 @@ smem {
 		hwlocks = <&sfpb_mutex 3>;
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		qcom,ipc-1 = <&l2cc 8 4>;
+		qcom,ipc-2 = <&l2cc 8 14>;
+		qcom,ipc-3 = <&l2cc 8 23>;
+		qcom,ipc-4 = <&sps_sic_non_secure 0x4094 0>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcnss_smsm: wcnss@3 {
+			reg = <3>;
+			interrupts = <GIC_SPI 204 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		ranges;
@@ -459,6 +484,11 @@ clock-controller@4000000 {
 				      "hdmipll";
 		};
 
+		sps_sic_non_secure: interrupt-controller@12100000 {
+			compatible = "qcom,msm8960-sps-sic", "syscon";
+			reg = <0x12100000 0x10000>;
+		};
+
 		sdcc3: mmc@12180000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			reg = <0x12180000 0x2000>;

-- 
2.34.1




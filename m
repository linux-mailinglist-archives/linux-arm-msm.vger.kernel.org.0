Return-Path: <linux-arm-msm+bounces-111236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1pxUI7inIWrNKgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:28:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3291641D6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:28:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=j2VDsh42;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111236-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111236-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A2BF31D0D95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 16:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97CD47ECFD;
	Thu,  4 Jun 2026 16:18:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DC447CC85;
	Thu,  4 Jun 2026 16:18:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589930; cv=none; b=fwM7p5seSR373tmcpM6omByAaUK9oWxDyhSKgVQIH0Mm3tr+i6JT6KyZS0NSIMeBEC0rDLPdGbMQknXI/M65edJyn9H67egBac5pyb/0fRUGe6CJcLmkpwlDSH0jt92BkaZJE9j/Bd+kRm8GSSB3XEvLQ3KeIws/EKohHZbvXGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589930; c=relaxed/simple;
	bh=X0zOt24J3sLrIGIinZCtXLDSVpvgs2y2mMhCx4gN+jQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tTIL7mVyaHEWNAF3dLnzKOvw+c97dmCfTQmg6SpHep21w4cMXywSxmPdm86HngKLyDXxfvI8w7XsabtnhYyET4ouunhFADvJsqiEdchKRovBK/Q5Z5aqk2qYJylzMByn8gD2iYzyD8HjdIoTkxlwp2VIXW+jgw3wAzqzIhhNfVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2VDsh42; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5857C4AF19;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780589929;
	bh=X0zOt24J3sLrIGIinZCtXLDSVpvgs2y2mMhCx4gN+jQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j2VDsh42j3pKhdmlkz2zK9qJ9pZIbv4C+4kJGGC4NB/n/3FBlZa4Oc76+BqbkrOAQ
	 79aDkCf7YeYrQYeYW9JsbaRYdqviD6yTs51BVWVRlUcSs0AiegU2+h1FzXTNwhNvUA
	 pzifwsvgst7fhs96/J1ojARUpSw68Y8xjMVVg1e+qs78LDX8Y64Hk4X28QvXUVQLJE
	 AA8NKji8CkStU2hxpaRLBA+GDFFspH8+0Ntg54NuZjoADvLDh9sqRDR/p3Swmtg8kY
	 LjuU0jqJo57BN2TqdYzsA9GuSGHPNTriCdOLMINdmnJeh0hVXsOn6FmjOOStel25bk
	 2Mi0FARY2P6fA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA585CD6E7B;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 04 Jun 2026 18:18:43 +0200
Subject: [PATCH v3 07/10] arm64: dts: qcom: sc8280xp-arcata: Add lid switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-surface-sp9-5g-for-next-v3-7-6aa6f6612c10@gmail.com>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780589927; l=1819;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=eXPIcn94S5Hm7RTrURBC+0aQj8vVybWb4S2yauykrIU=;
 b=DphoOuxM+EyG38lFfgp1eC5LzazcTjbJ4/fzWtnfg8HxlAVbNdQ5irubjS+qIRMsSJq525BE1
 5a3diwFmAg7DZ6as1cRm1gH5yilNbTr9ImwMXRmSvWEyvygHsxWUUKK
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.37 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.53)[subject];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:jerome.debretagne@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,m:jeromedebretagne@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111236-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3291641D6C

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Enable the lid switch for the Microsoft Surface Pro 9 5G using
GPIO pin 180.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 .../arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 4e601eb4165b1eea16d2772786ac0a18f6177e60..f92c37bfe9c72d1854ab9893747991da9cbf033e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -59,7 +60,7 @@ backlight: backlight {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&vol_down_n>, <&vol_up_n>;
+		pinctrl-0 = <&hall_int_n_default>, <&vol_down_n>, <&vol_up_n>;
 		pinctrl-names = "default";
 
 		key-vol-down {
@@ -79,6 +80,15 @@ key-vol-up {
 			linux,can-disable;
 			wakeup-source;
 		};
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
 	};
 
 	pmic-glink {
@@ -1010,6 +1020,13 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio180";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio135";
 		function = "gpio";

-- 
2.47.3




Return-Path: <linux-arm-msm+bounces-99508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFHfI8PzwWmPYQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:15:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DA530106E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 59B17304EDDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DE0373BEB;
	Tue, 24 Mar 2026 02:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="llZABWRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F207F387379
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318085; cv=none; b=B7is2JJdUmDN6Sbboz7qcC1QsQd6dQOnhbI9rfa2D/iGkweua81BE1y/+O5uzZLZafrbmp7PPlURcKT+JNy/vMtg3Bl8K04Si6yvpvR5OmR+OXXHbdjsxp8BlSQg3s/alPBKrYRoLFpmfcnfBpvECSIZIw8qD9Z+NiS8+zvzWxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318085; c=relaxed/simple;
	bh=lByz5oJB84uA1YtiHT7z2YmFcS+ccrY53jFU2X6bajM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sU/qsMSgPUJ00B+SRA4oVRkBUX1iiOutC23zRW5To7+4LBDVa+QZx3dOxR0mFnHjiU5Kedy8PRBu5CUytKG+tec8lKH7rCLwX6HuuP1k9Gxd7GnJLgbmaUIAb+kCf0v+azg/f6BiPOcQ9b/HS4TfM7B9FfJRb+DDMezzSsg8U1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=llZABWRP; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGHmDNlZkqk/B9ymzDdy/nd/8kG4QY0mqwL1FnpfS/k=;
	b=llZABWRPZGYHj0M+n9TUSYO7hT3s1JLDJ12TN5eVT74QFesrt+ylh02t5OonlXPu5Hazc3
	bjxEP2KZtoZcRmqhSQioQSzg38x0AoVTSZLZMDUvsWVkwPxI5Z9Q3UctqXPU1wT56TDCVX
	kVE1rwPBZPH3KaVMo2k8HqJToJGNE+6k+2hla1cf5ltGdzcoLDL466jIqWv1yZnjHSmqN3
	Kevo/LN3skSf592S4cV/bxAMhql0RHcpbeS+FXLd8837iKYxWM1MMP7TPQQvFoXE/oUmfs
	IZ1ebLFtpKN40jG31BPB0/nI4N+hfBH165/y+K2w5hRM0cK7esX4g1FjX0JRUQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:36 -0700
Subject: [PATCH v6 06/15] arm64: dts: qcom: sdm845-lg-common: Add LEDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-6-29d70ca1651c@postmarketos.org>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Amir Dahan <system64fumo@protonmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=1385;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=fBkqXijux7HJPlW4KeZsWnicQmGDO3c3ikJF3qAutj4=;
 b=y7FyZz1FlVkLlNXYMSJ8s+dRJ3D8kd+lj+6tRYNn6+zTW2WmCW/JN4FNfXhtyyChl7ZMbITGP
 E5EVOQNrNRoBqGlZ7wS6WUobdM67y+niLFnYKw36PEaO9Mx6ftKwAGt
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99508-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,postmarketos.org,protonmail.com,ucw.cz,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuta.io:email,0.0.0.5:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,protonmail.com:email,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid,qualcomm.com:email,0.0.0.3:email,ucw.cz:email]
X-Rspamd-Queue-Id: 94DA530106E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Amir Dahan <system64fumo@protonmail.com>

Add the multicolor status LED in the phone's notch.

Signed-off-by: Amir Dahan <system64fumo@tuta.io>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 57badeff16a5..7b0e14d3f57e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -489,6 +490,33 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_lpg {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+
+		led@4 {
+			reg = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@5 {
+			reg = <5>;
+			color = <LED_COLOR_ID_RED>;
+		};
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.53.0



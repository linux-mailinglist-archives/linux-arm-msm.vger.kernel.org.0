Return-Path: <linux-arm-msm+bounces-90373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAhaKEK7c2kmyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:17:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C769B7976B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B05630078DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60F33EBF27;
	Fri, 23 Jan 2026 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXgSpBDG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6CD1DC9B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192182; cv=none; b=PVw3Kf7wLKjXNLMrskrkWj/9PYlsbDUEf8YjQqlLCckraz+Q3B2vdkVTlNqpW86tKe+p+WIvBiHUny6Apg1S/XSxf3QnOrprlsYVMCs7YiVohEKymzb0T46WM25rhsXx29JnCFM7n8NZNBq8wh8ZHDhsa18r5p/fMuCBQdQ4Ffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192182; c=relaxed/simple;
	bh=YrvEfSD/FQaWoBQCBJYnesMKB6SqtunhQFFR5MFixr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iS6jlwSK1DoSRimcE7tOPD5uWZWMo+Eibv0oVcfH9YG8YVSuudzDb21iTygfn3EO+ut5rXUFnIRd+eVoIchcJ7qUXZ6tMsA7YaX78y94aw6VJ5JAgkp0SlzwfgwzvCaFsuXqjtxW00JNEZwuiUh9wKzEC/Ywlnay66WBeNDwVYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXgSpBDG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso25423635e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192180; x=1769796980; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fB34DkZTeq83fx/24zLXpPuRscQhBYQrDHPXCtTQLQ8=;
        b=FXgSpBDG4AAeHMKX1VueKeGEpLO6AMYoEZPh7wI6Rfe58NadTjPe9FTfVhHpHX2Vum
         ACw9QLqNZXV09L4+IZzm+YGfxYfrukJM2++muQWJn0GUuWdY2MA22PKc8t07DStRR8pa
         ezMKomAYETT/5XJhVR1RYNv4hhkoxL+7nLUB0o0hIEoth2en38KRVRG5O40/+TFr8sLx
         F9XmK4SfblpV2m2UjMnoJ8TLW3aqF0+GbtZbrud5vO20MHRB6fihdvligj5LgNNva8W+
         iKCrJdfhuCjt1Py0FVz/j9CtxVLkIo4WHSdr2VUp0z5tm5+PceCzhAhLcyb4ykWzSY8l
         3ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192180; x=1769796980;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fB34DkZTeq83fx/24zLXpPuRscQhBYQrDHPXCtTQLQ8=;
        b=my0LYgvDEDJ3S7DLePNRFGomQRQ4ecdnePIsEf9u9iCheCNEzeoYd3phHinTmHB06n
         5P+OhY4zLwxgzEddfCpURZxijeWtJb+ZUdhjguqWqhUMEHXB6ZOxXmHWz9ZIOa3kYj06
         LyMyexPFbBs/1928x6QAIxkMDrVcpdA6E+grItDFcM8vBxD8HQBpI3kamneOC8RpPBWq
         UsHPNJ7REpt9iUtxJmYJonk6GoP7C1PGfsB7tgWpe5HVceZhF5H10CmdUCU1X7j2zA2M
         Ws8T+Ti/W1vPSsk+LoqPj70uvhC3cNSfAvGHH2/voz86hYDKlSWrZNfo/edjrtTbrlUr
         juwA==
X-Gm-Message-State: AOJu0Yy6hoUgVPh6TVtPt3MGg7DqEsnAOOy1dWlYvD4lGWfu/XFty4dt
	lN82/+PXUbDc/urBZ0Xtw8Yjg975B2zYlLEdwnwdLkLPX50vV0TP7nE9
X-Gm-Gg: AZuq6aIvLSUPCKzh9OhJ/YqxnzKsQ/exuRHg8/sKs1eFdlznNIuCbBHkgMCBmhtfVdm
	4KwRuC79/AUFxyI6/vTwDu6w/2xhDtpvmEgqRR6h90jUjNNe/XQHxrK8HDvKdfoCGFVXkj29ZwA
	h9vHFCiG6KRGvLsMAbypjb8Sc+3QXY/7xiw2UIyUARXlQZBRlrlfwS53EDY6U9iCbuuYLaTkgTu
	v3zZwPW8vaCrWD9YCPjJqAutZB41YDLtge2TpKVDPnVVhHIIV4azJ0hjLvIjnjH92FT57OHRA/Z
	/eh8jG/U7j21uDAdCZHAGt8GmPI8hQLxIDC1LkVPztvWKk2b/aH8/OzLVIhyYIBmVNzZ5KiI4yd
	iNPkx7tMvoq6kB516YxTqnEIe3NI3FBiFOj2l9VKOkV36vugVRMwjUuoQgLlBNaKIWMPjiTfP1r
	dm0PlQHWw+ppLk0Yex52C5KeFLwwHXxls0P4gvPLHz
X-Received: by 2002:a05:600c:540f:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-480511e4ed6mr36023275e9.5.1769192179522;
        Fri, 23 Jan 2026 10:16:19 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4804db7b434sm28693425e9.4.2026.01.23.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:16:19 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 23 Jan 2026 19:16:05 +0100
Subject: [PATCH] arm64: dts: qcom: ipq9574: remove MP5496 regulator
 references from SoC dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-ipq9574-mp5496-cleanup-v1-1-9fa86f72b873@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOS6c2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3cyCQktTcxPd3AJTE0sz3eSc1MS80gLdxNRU46RUy+QUQ0sjJaD
 mgqLUtMwKsMHRsbW1APz8codoAAAA
X-Change-ID: 20260123-ipq9574-mp5496-cleanup-aee3be9cd192
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-90373-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.2:email]
X-Rspamd-Queue-Id: C769B7976B
X-Rspamd-Action: no action

The 'cpu-supply' properties in the IPQ9574 SoC dtsi are referencing to
a regulator provided by an MP5496 PMIC via the RPM firmware which's node
is defined  externally in the common RDP dtsi file.

Since the PMIC is not part of the SoC it should not be referenced from
the SoC specific dtsi, so remove the properties from there and define
those in the common RDP dtsi instead.

While at it, also change the prefix of the label from 'ipq9574' to
'mp5496' to keep it consistent with the labels of the l{2,5} regulators
provided by the same PMIC.

No functional changes. According to dtx_diff there are no differences
between the ipq9574*.dtb files built with and without the change.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 18 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            |  4 ----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index bdb396afb9922a4369b4e96a09d0789cef21c046..fb398857b73d259f218f871b003e53007eb2fdb2 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -88,11 +88,27 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&mp5496_s1>;
+};
+
+&cpu1 {
+	cpu-supply = <&mp5496_s1>;
+};
+
+&cpu2 {
+	cpu-supply = <&mp5496_s1>;
+};
+
+&cpu3 {
+	cpu-supply = <&mp5496_s1>;
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-mp5496-regulators";
 
-		ipq9574_s1: s1 {
+		mp5496_s1: s1 {
 		/*
 		 * During kernel bootup, the SoC runs at 800MHz with 875mV set by the bootloaders.
 		 * During regulator registration, kernel not knowing the initial voltage,
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index d7278f2137ac58305cc4e82c1d6c26c08bc7a405..8cc0098fc5e364f2535f3a2d403c1745d929cbc6 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -56,7 +56,6 @@ cpu0: cpu@0 {
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&ipq9574_s1>;
 			#cooling-cells = <2>;
 		};
 
@@ -69,7 +68,6 @@ cpu1: cpu@1 {
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&ipq9574_s1>;
 			#cooling-cells = <2>;
 		};
 
@@ -82,7 +80,6 @@ cpu2: cpu@2 {
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&ipq9574_s1>;
 			#cooling-cells = <2>;
 		};
 
@@ -95,7 +92,6 @@ cpu3: cpu@3 {
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&ipq9574_s1>;
 			#cooling-cells = <2>;
 		};
 

---
base-commit: 78c13dac18cf0e6f6cbc6ea85d4f967e6cca9562
change-id: 20260123-ipq9574-mp5496-cleanup-aee3be9cd192

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>



Return-Path: <linux-arm-msm+bounces-118577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1OCWEy6bU2rYcAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:48:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89093744DD0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:48:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=kzr7Fioa;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118577-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118577-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 397883028362
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C6B358D00;
	Sun, 12 Jul 2026 13:46:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DC93ACA5B
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 13:46:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863982; cv=none; b=suBUWF0cB2q5o2mHBeDaOv5vgVgKGjMWMK4ZusUpWmO6eaupLUhvAxiqxfG5WRLMv0VrOg03EEDBLHiVQBbFn5TQFzJSn6R8+8oH3HIhV6Quq10dT5jMxfG+/PPoHEVshFaYlB61sx94iacqdKFRZ5S368YGyEbFGWRrWNTgtw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863982; c=relaxed/simple;
	bh=87hn5TFUDcNPqNEFDrMHeJsAgwkmV6iykor7Fs/0wnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcjuyvg74yB3lAXVzNpfIXEqM8RHBZVJhN1GLpY6ob2q9AWX2pvFBWT4ZdXSvNP3SkSreBwreD6ims7T8iPM/0UZRNi6XdsmJSTLxzgRkmP/F7nx8HmsDFuYn6EX42qb298JWht+vUVt1QePvdMZir10PwLYLEaOTw3QIf6XeWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=kzr7Fioa; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2221486a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1783863981; x=1784468781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIM+uNh/QyNlbPgrqlOmJt4o8sZ8tvceUtl7h0dqrqk=;
        b=kzr7FioafEpNOkSGKDqXWf3Ql3KSTZMloHCfPu7aWKKUMro4cDIZj+CCPwteZKGDGZ
         1b248MameRptuTRQz21WcDRJWG5BiqCpcBemy9H0B3jw6YtZQ/jI12l4z/rjypv+NcfU
         bobcpFuRvL0tt191my4jF1bsG33vxLSvcqpZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783863981; x=1784468781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIM+uNh/QyNlbPgrqlOmJt4o8sZ8tvceUtl7h0dqrqk=;
        b=tXs0kTdgDJkFjVL3QeQDeGkCxsJCCPU4YjX9iGalUcZKYKgPzpBhafmE+ejOOjiujB
         iavyxhJBk405l+hqIvuRFNcVh1eOGb/MPgSsGcYy+nArBNhSCo2hKoT1XB5amS+aptLU
         tHo3IsU4S5o2nrXgfD0crxNu2cr4Uf3C7mY6TINiN7+UL/E0vnKlT3a8DFF93UN1Ed7n
         LEuhHvdQmE/G+wpDWgWTEt9nr7tFSQOvs9M9m6/QHa9HXM++hDoXA5teTODFAxWAExfr
         4ryq6KchdibZ1b1wyvWpLSN8pb/PX1R+UDLZI/uHjXMbZWDhUgS3vU17y6gBjA0yEyKM
         3fKg==
X-Gm-Message-State: AOJu0YycoIc2TP7OeOXi7EqjsY+/s4xFt334CW7iFNdQy7+U4JxFOdao
	e9n3kFwoT38nTgWBhkEIRJz6a6S7Ot2yikRUOR1JeixzRq5rRXYoGT1EajLb+LKDjFk=
X-Gm-Gg: AfdE7ckFvHxqX8syWoDrdTMvAGeoaYxh2T4Kczl9jrTokpiNHW0xtDZmgG3TJ07Ufkh
	Ia0zHjW4fBFUtW5fqX/IQH/b7mclmMgl8K1AuQ8auduzTPnPqn08hl4jpeAD+vUNxJ1RM593dPH
	Zu9NB6jVui1f8qtQ97tGB9pWo4a35NXaKCFMKiQJMP3Y1UMAzkekQSqrn/S/w5ibCrhr+PJ0kr5
	gBYBZ0aKnkzhirMHRCpUbGUImUfbzT/Nx06D6CJQi61bP6dkyaJ1XOBmWCNpYDo3Sw+aeTg1M/I
	1myPNcuPVorEaGi2Tl5ECL7luxOKzFgBMtIa/vNAAYGeQMnKnNMz45vsc8CR0QNGJkQqz5On67+
	FyJFycEnSOlQGqZ42vWWk0mS9GOenFNaPxVxfrjrkj1vcIkeS0PwNOlDQaffuqlmqmF9Jl0pIir
	fA8r1jVo4WjfHeWa3KxnFGr25Sw8dnNUGWyikz/Oh6k2NQ7ukoKCbxcsMWILsoTk/JIeuavKBKl
	VjCTGChP+XFfLys5gTBPaS35dTYavmqPxn6JFnNA9fWQQ15xqOY3+fDxRQs3zjZz9n3SQq7yNxd
	VwFFSwGZ9/oS/P1eaRFCyWMoYJF+Poo0IyHa2hmZqliRqqYXyTJevg==
X-Received: by 2002:a17:90b:4f81:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-38dc7775133mr5507488a91.35.1783863981052;
        Sun, 12 Jul 2026 06:46:21 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:6b00:edd2:3bb4:3b99:6291])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11b82d32sm2122434a91.0.2026.07.12.06.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:46:20 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	"Bjorn Andersson" <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v4 RESEND 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add Embedded Controller node
Date: Sun, 12 Jul 2026 21:45:56 +0800
Message-ID: <20260712134601.99191-2-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260712134601.99191-1-daniel@quora.org>
References: <20260712134601.99191-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118577-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hansg@kernel.org,m:rdunlap@infradead.org,m:bryan.odonoghue@linaro.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:maccraft123mc@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:daniel@quora.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[quora.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,infradead.org,linaro.org,gmail.com,quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quora.org:from_mime,quora.org:email,quora.org:mid,quora.org:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89093744DD0

The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
for fan control, thermal sensor and suspend behaviour.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v4:
- add reviews
v3:
- use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
v2:
- corrected DT compatible node

 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0..1ee2a2296129 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "lenovo,yoga-slim7x-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1352,6 +1368,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
-- 
2.53.0



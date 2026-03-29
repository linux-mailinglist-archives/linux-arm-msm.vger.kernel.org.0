Return-Path: <linux-arm-msm+bounces-100615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wExvKe0myWm/vAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 15:19:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC1C352314
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 15:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A48EF300F155
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5F031F98C;
	Sun, 29 Mar 2026 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIKgjKXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686DB280A5A
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774790362; cv=none; b=b3/6yzNSwnvrH6TEAGNeXdfoWwMQbR/GBdVqAmYu0+Sm9OF27eu0a29Q7+sIC5dw0ibCRqrWk5cc0V/eLqyAnpuMw2UrFZDCY/81yHW28/XazfShdFVr6bp98ptF279lNdYEP/Hdr2RZpnwk41lkxEuKP9SlvFM8yjiKW9TEEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774790362; c=relaxed/simple;
	bh=ZbKCcpdxc55m1Ibdev4LPtQYvc3SD9V0itDcYEtNo0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N4tEX/DCcnnZBeGnBMjTLg5AG6yR7tHRyZD2zN2qFrJcuuu5YT8+HlItG1MlF1ee4bfo9X8bUPepYtc/W66CSiZ4920mlzhnq2YbmJK20ZTkX3fBJDerYJRrDpAgdWuSnefGOA4G3O+dBCrY9eDZMRMsb1HO3Ymf1SdgR46BdeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GIKgjKXt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486b96760easo39710505e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774790359; x=1775395159; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ExCw+aMOyGYhHXagsRu0BWedvsICeJ3pZ8y8FKoBEE=;
        b=GIKgjKXtC1KeoBiP8emsvk3N8EsFiYCQ6/xjCSEu6n4yA+9p/unpZ+59BES/sogyek
         AQjnvXmLaKb8KaODWkZPwUIuw75yH1yAkIghk3Wh0SAiaZqrMnVCwjM4RUIjMJqikPUR
         6Q7i+mieXTCf6KvaeVLYMPmQd2/l+ugdR2DNTjsp0O7RwHU8OOciWmL1Np60PlEuCVjk
         Pc7ofO2gQuB2uV+CwDv9vcNQIFAgBYdCAEhMlJqO+P5iKAd4CMK9ZALkJbUAIkUPQuFS
         zTc16TvaJb8Y5CuMYsd12h0tkLHXAG4RRWWwTBA2/BUdJh0qyW8eR/P0nd6D1+xUErtq
         9l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774790359; x=1775395159;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ExCw+aMOyGYhHXagsRu0BWedvsICeJ3pZ8y8FKoBEE=;
        b=G4+Hu6Fu6ZSsOGK2B0OTvYMipCxJg8xtZCJMPszrQPXGwvatusChgE1383eQVD9AkV
         Ky2RkQQM302HKLnQpstGMeJHHUIg5eHfTadOJQNFAE7LSYsMOryRE4UfCXQTdrTUAMcL
         PnYrlGymlBh5kq+oWLaMVNriorM7YCYzi9thMYiaU8Kq8eDCzAH/OplhFAwB8jiHnQcI
         /FfnRYtfEgxeSlwx+YWaQlP9vrx+ULlZCRJa/5ZEOUOsgFYMfmB153vxzr5v04Pt/MUx
         FX+DgPuhrdv0FO1casVdAY1g6ExPFG4TUWpd3ZVsbLG1Fpt7oEKdM6YTPBtgHIOP3Rom
         Zi7A==
X-Gm-Message-State: AOJu0YyAAfXeM0twowaRmNzp/P650gRbXa48e5AabCaubpmBOPg9tyfZ
	K7ooLWcStGVasfGad10rOgKGMwzx/Wh/mswQd7/hT9g5bqwLrpM/UJFM+51ohIgPqsM=
X-Gm-Gg: ATEYQzytr2FeH1OduIdpXaPrQXp+pyCiLIkHRokizRJVBsoPysvKgU13kGpm4TZY7Nw
	RmbdJ/moF1/JubVuDiaG2ujZSXqjYZDxhrI1UvxWZgt98ezbTaA8TKEL1Tq5S4Kp1TQL3VeAmbG
	96tfwN6NzqBlgTFPgGZYKCSAeDu3y66dttmH4uDumlN+4kF/nsUZd7XV7T58VKxjGhmoJi+VV3G
	8YktgPjZa+M/sg9l0Vt3OEwT553a+6vXUcRwJ7b+h0GbONeO5oLUmRMewfAQ8CTmsZUPf1kcuh+
	+AGHU7Vyr2IAtAMX0JImhQWr62NDhuIU1xWaVGhZONsKODr3YFUfR4jnLUqh47DbjvUAI6wrbmC
	ZSrnOLRZOFUQuU1SaTvk8ynBXAEUcpp8Uffia5VZ8WtuarN2DPbm85qzWOEkzUm7LlgV/1tY1EU
	vhTw5an8tJV/8YJLfYNrZUD36lEl7hHZlNqckCX5erYXGoSDg2OlxEV6+5dTLOeMSR3UTQquV64
	gb2cwQZTr6B
X-Received: by 2002:a05:600c:a416:b0:485:3f38:3de3 with SMTP id 5b1f17b1804b1-48727d59c87mr126577255e9.3.1774790358751;
        Sun, 29 Mar 2026 06:19:18 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm376642055e9.11.2026.03.29.06.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:19:18 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 29 Mar 2026 14:19:15 +0100
Subject: [PATCH] arm64: dts: qcom: msm8996: add blsp2_spi4 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
X-B4-Tracking: v=1; b=H4sIANImyWkC/x3NTQqDMBBA4avIrB1Ix/gTryJFTJzWgaohA1UQ7
 97Q5bd57wLlJKzQFxck/orKvmU8ygLCMm1vRpmzgQw1piKHh0TcvZ/SHHDVtXOuQf/RSKNGsdh
 2jmxtQ21sgByJiV9y/gfD875/usZ0w3AAAAA=
X-Change-ID: 20260329-wip-obbardc-msm8996-blsp2_spi4-7892454c504c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=ZbKCcpdxc55m1Ibdev4LPtQYvc3SD9V0itDcYEtNo0E=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBpySbWvigl6jeoHobIK2+4Hhm+00OXLCHz1mVoP
 GsRt8o2yqeJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCackm1gAKCRBjTcTwaHBG
 +NMKD/41tgAcoO4nSt5jHaA3PmWRGh1E0I/Lnr3i5Txuc/IjEP09BfUgsiX8Fed8n3VwjYzWSM8
 ptF4AeNEb3NSEGHX8YAmTmojU4pqU75WpQPclQ44YxkNSgJgNbfz8KkPtRKYD9MP6bypR4QlKBB
 vd5RVQrsMMslDIIp9wjFgNGHj5WFbPRrp30NdXK6hjtAwaOcv4JZtvhHwUEjmj3jZic4AWO7wjB
 TcU8gUv8YIoPgr0kN9YaN1Ygg6lmSdDH5ZoFLZqquGyuiBPdPegSRvjjqAvNtcq3VEg5qaJtqMa
 r3eoFTeFad/KjYNk3l5tA2NWGrwmOpvwKPP/vRsl3e0153OH9XBabsysD7oefq+cEEdz8czTfEQ
 7WVD6yNaGWQquDTofzGEQ/RUba3ESIUztfwhxQy8P4m+5jOm6O0v4N9j2X/Uu3kcp/jqOyqGbl5
 +k7LfR4OpRV2qQcar6itFXf0oDi2FbiQlCgMf7tu9dqelVwTsmMfk5qXVePMTUYIz3VVtie3JKc
 yUFjqNLB+N0jEUh5i6SCoTbDa5NJViZKF+00w+cbg4YNdupUmt+AmLFaoVY0vQH3xqKWyOktgk6
 Vxnnaap/ti8Gbyn8UQKLXGwp2MSOq7IglqansNlQ2nmjQO+RE00i2RQk8c4y+fcnmzTIAEaGgA0
 v+lW7KqzpQNo/OQ==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-100615-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[75b7000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,75b9000:email]
X-Rspamd-Queue-Id: 1EC1C352314
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the BLSP2 SPI4 controller node together with its default and sleep
pinctrl states.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9d4ce47578fb4..7f920664a9d3b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1623,6 +1623,30 @@ blsp2_i2c1_sleep: blsp2-i2c1-sleep-state {
 				bias-disable;
 			};
 
+			blsp2_spi4_default: blsp2-spi4-default-state {
+				spi-pins {
+					pins = "gpio58", "gpio59", "gpio61";
+					function = "blsp_spi11";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs-pins {
+					pins = "gpio60";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			blsp2_spi4_sleep: blsp2-spi4-sleep-state {
+				pins = "gpio58", "gpio59", "gpio60", "gpio61";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			blsp2_i2c5_default: blsp2-i2c5-state {
 				pins = "gpio60", "gpio61";
 				function = "blsp_i2c11";
@@ -3417,6 +3441,23 @@ blsp2_i2c3: i2c@75b7000 {
 			status = "disabled";
 		};
 
+		blsp2_spi4: spi@75b9000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x075b9000 0x600>,
+				<0x07584000 0x2b000>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_QUP5_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_spi4_default>;
+			pinctrl-1 = <&blsp2_spi4_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp2_i2c5: i2c@75b9000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x75b9000 0x1000>;

---
base-commit: 54f966f63b379d0c62bb044b7903319776443a4a
change-id: 20260329-wip-obbardc-msm8996-blsp2_spi4-7892454c504c

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>



Return-Path: <linux-arm-msm+bounces-92761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIt7Ir74jmnbGAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:11:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956E134E86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E57E4306F963
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CF534FF5E;
	Fri, 13 Feb 2026 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="LmvyI+9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132DB34F490
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770977413; cv=none; b=P7XPLXbt5EefcVUhG/NafGexesIMHnmbZWZwUUwhb1c/x+0nnrk14WpfxnpuUG/ABQ8WqHvy8K0FWXOzVHpxpNNvPhMe78NLhFpcY4816Nx/18OehTZxViIKaWIj30HXJZS7/tSUoz1HxbmvYU2+tGUoIHz3Y9C79SPpoHKQru0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770977413; c=relaxed/simple;
	bh=K40Jn8tYljtr01ED46cokZ3h5U2XIJNBSOuO+gSbTDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qNlEbaI0Vx/nqQkti0N7T9TN+d7eBz8ZwbafGPMQgAeOqZ1ev/pTdHx9xMwsuFdF+M1CSkGTzEW+ge8skBPwzSyaV5NppaZNjTqjLn3VU1PMIdj5pdzgezRc3P51vMIhxc1ekAsyafYxDyrl3QqJYU8knFI5fi7D/4TRmhu8kg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=LmvyI+9c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48069a48629so6565575e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1770977410; x=1771582210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UjFEPZlwVwq2O90Xr0m3WmUSZp2yHJcZ26Xg1pCyquk=;
        b=LmvyI+9c2+3IrNAC1R5cpLAxRyRn9gV0+ZGRNtFkEPzIqu0RjdPMzKBsnHwajuQtnK
         Ceq084CnTJ3KjWcuvTIVgEwSWMAc8m+pnONsnFQCYUZ/rHgcgGhD+LEbQTa+42H2jFN7
         K7m+t2jWVngMbcfBbTIPoZV812ed6/SI6QYug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770977410; x=1771582210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjFEPZlwVwq2O90Xr0m3WmUSZp2yHJcZ26Xg1pCyquk=;
        b=HAhUuqiMTO4S1NOzLJxkwoaD/4lSp8dCv6zyX6INaqtsNkoDP/8gTCL4+tf0UXWMaD
         L6x+ZvHXI2zhP+Aoc+6yNMnphTBkDY6meLp1k7p/6mvYGDKTyYZOPJVNclfJyWSf4mIQ
         V7aBQmqCEC45ryss62wO/YcJ5Ix9VJYkheC64LHbB8ofqBv8mm9Lo1zbaSRu7vdLlvFz
         QbI2rofDvzFGLq8qUnh1qOYLgDiiGVeIHPYQb81Y7nJqVRH+yNfO6+S6i5cqypbTpE8R
         m2LBhcCvSRNGtuiXi+1kYXL36auSf84Ryb3zm/XxUicV/XlyP8GOG1bKEorwCHYW9dWn
         IOFg==
X-Gm-Message-State: AOJu0YxDSTITasyc5Dt5jGJuwVGnXeLN9RGTb4G1k8ufDFmLl6LPO58y
	tpZSTaokX/B11ZSrN2oBEQEUoFrUFUafgaS/EBVt4+GtiElg/0PnfURBNqfWkGYATOM=
X-Gm-Gg: AZuq6aLGb5a22Dek/kBss/UiN5lEywAM8V/ufNv5rvdnepuxtXsYmk/wDGy1fDjPBC1
	Os01cA4Bc3I2Y3KtL51DByk4tfVKTIlIYeWE0Ot+tPCPVJ6IQqP06TfmLA45LVx3fO9apaXCG16
	ReAoVy16F8R4apUdjlyZrIC4XmPLEmzPmjy19lzsnhimjT5F7rSfT3UR4eiAMW8pBszr5oIl+5t
	FDDlMizFOLNq7nTOcdL5qC7wRkx3aA5sLm0OgA+EoRmr9aIFA6aiEilOMjbyII8y6++0I0AW4gp
	SW1oJ37pgaKEfcQD7mEO9S7Wm0Yrr4GVbPY4Co40t826jIrK4QxTwE/QjVsr3wSdPUeN3MHEvXT
	q85/eHgkTlNFh6ay6juYrbMH3b1SFK8ADRz4RV9P6YqGu+DB0CbHhpE/NvtDUmBfNHyWnZ9QvzB
	CicBwDTZmYr7wq7co4YS27vEmytfGxMiy36RPk0zrlH5uu2NknWaqcpq8aCjcCKg==
X-Received: by 2002:a05:600c:8189:b0:483:6de6:37b8 with SMTP id 5b1f17b1804b1-48373a61afdmr19660345e9.34.1770977410369;
        Fri, 13 Feb 2026 02:10:10 -0800 (PST)
Received: from riccardo-work.local (c-55-192.cust.wadsl.it. [195.32.55.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d77b3sm279360205e9.2.2026.02.13.02.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 02:10:10 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org,
	srinivas.kandagatla@oss.qualcomm.com,
	m.facchin@arduino.cc,
	akucheri@qti.qualcomm.com,
	ndechesn@quicinc.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH V3] arm64: dts: qcom: arduino-imola: fix faulty spidev node
Date: Fri, 13 Feb 2026 11:10:02 +0100
Message-ID: <20260213101002.105238-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arduino.cc,quarantine];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92761-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[arduino.cc:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0956E134E86
X-Rspamd-Action: no action

From: Riccardo Mereu <r.mereu@arduino.cc>

CS pin added on pinctrl0 property is causing spidev to return -ENODEV
since that GPIO is already part of spi5 pinmuxing.

Fixes: 3f745bc0f11f ("arm64: dts: qcom: qrb2210: add dts for Arduino unoq")
Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---

Changes since V2:
	- Changed spidev@0 nodename to mcu@0.
	- Changed properties order in same node to match DTS coding
	  style.

 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index 197ab6eb1666..5ab605cc56c8 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -325,21 +325,13 @@ &sdhc_1 {
 &spi5 {
 	status = "okay";
 
-	spidev@0 {
-		reg = <0>;
+	mcu@0 {
 		compatible = "arduino,unoq-mcu";
-		pinctrl-0 = <&spidev_cs>;
-		pinctrl-names = "default";
+		reg = <0>;
 	};
 };
 
 &tlmm {
-	spidev_cs: spidev-cs-state {
-		pins = "gpio17";
-		function = "gpio";
-		drive-strength = <16>;
-	};
-
 	jmisc_gpio18: jmisc-gpio18-state {
 		pins = "gpio18";
 		function = "gpio";
-- 
2.53.0



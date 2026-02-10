Return-Path: <linux-arm-msm+bounces-92481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOrWKwYLi2kdPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:40:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F4C119B6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5FBA302D53C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6188D31690A;
	Tue, 10 Feb 2026 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="GsrEUQzX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296A3168FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720003; cv=none; b=ryoEgCpyBae2rAxXgBM1p6BaT2fbnGMbwNpz+8ItLKdYVcZdUZIPckrS8hwBV4Smxo+vwzibCgUn/xfnMmgN80iCbubTVY4XhDoXdsnMxOcetsjnNiW12n89FVM7z9sNPp4DO2a/+JjlEgKAheevtGN8orXSelCtlGCU7E3S+xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720003; c=relaxed/simple;
	bh=d0ljkEDQ1gGGwbbxFybeZxVmLfP8oWfMC9kjAC5355I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HP8iR2+sXncLIjJgbhWdUeSJY09WRMvSK1sHceNFSOJIvZofG8fM9dpKvDaeHeaAI0FggYxXqfkvpUPeNsj6oBRINIXBeK9GrL8W4XqYV7kxRLBX60KoMMQMEEpOF4STzoT56DB9RbaYVuCzAMkgoMNxBfosy+fvacrpcIYB80E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=GsrEUQzX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so51911115e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1770720000; x=1771324800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jaXWgPn4mF7i9yaiiPpLBPhR6O1+uuJeQxKfkWKqAJg=;
        b=GsrEUQzXGLKeMAXIePLZf9gxP4OrpMVFXbwfMrDPkOrOlGI81+25YlE01SBU7mqy3n
         rMivtckr6gDsMTCT4tDp2nIq7o/KyLb948JOT41vs6W3i63vR8U8JZNoKrPkNF1hK3AN
         dOY6KhjfHRWKRNnARXptBc1+OFPCcg8v8goLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720000; x=1771324800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaXWgPn4mF7i9yaiiPpLBPhR6O1+uuJeQxKfkWKqAJg=;
        b=HNxaJUNNjo82hsOlj8pgot8RVwwfXblJcZV5a4OWD+PAhNS/B4NlPPaYff+OOyR3hG
         tl+UeJHZVlT5vIhO2lFmHiAbftaNJuwmj00haRKvDAjZjRgc0P/fUEDVPe/mj06c+ksm
         oNLrlkMaxe+Hlw4BeOfrQUv/lIkF7d07uMS84scrDymir17J//5yT5/RZtB4g3lhUHk8
         niTynOLN8DFfX1iEH/IyBAw5tybOyqc/PAD5fH4JuGVw+1pqPEp8CFZzje+QWINmrKEZ
         VuUsoiOqlRhVjZi+CcQoFCyTAFcuILbPBuZicVi7HTKZz6VbMicbIbK03LlOR69F0FWr
         MgAQ==
X-Gm-Message-State: AOJu0Yz2Mf4cEJKZl9htNL6wy4U12UjSWsg4wuNdKasdNvxkPrvrQ93B
	G6t1j0K/GbN+L2sUjntCpiUS5eNDwyP4n2k1mf8y2kjJ1gqsIdQHVWW39CpNiweGliY=
X-Gm-Gg: AZuq6aJh9kbCxrno6/RVrOZ4ZAl9WPGcfc+DHEz3oHZw7Mew0D0tjySYW0WCAEgZhLV
	Yo2U73JKl4GnYkmetY7fLIAJimOHzAAo00vFl3KR/xrA9cSJ4XhpaDF9+oVUlhhM7N38BNCvKO+
	omX6myGh26UUugnFuJdnYYUcKHsGP8wtXavv9WpdQDQL2E1Pf/RE1qmJc26DCE+apLR8+RefUMb
	xK13HG7ndnKMimdkcCZPZGNg6n+Wm+PkMtWTo/C+FqKyREnB8qEv4HKwlK65T/PR1mO5l9w6dkf
	qB3U7nxEwiptrweMmcf87GTCEpTfWNZTp0cXAiA1+jSoTfiWhykb5wn4TlXyEYqhgdmg25nX/pB
	+kFRukKtmA8xG5deAdnsBV7kW7jIOPpgEPY6VA2XXlJoMivEGNqyCsHdB7azZS1ONsyb66RxnJL
	LG3eag5om/uxAuMJ1tgZhznk6ML0MD0mDfPrjs9BHRvSpqT9MNnehkjjGd9mVpJjilleQ74EQLU
	dTsgRPdmCfHcggU/t4=
X-Received: by 2002:a05:600c:12cc:b0:477:3fcf:368c with SMTP id 5b1f17b1804b1-4834fbc8f63mr16251015e9.9.1770720000337;
        Tue, 10 Feb 2026 02:40:00 -0800 (PST)
Received: from riccardo-work.fritz.box (host-79-41-222-66.retail.telecomitalia.it. [79.41.222.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d77f9sm54587935e9.3.2026.02.10.02.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 02:40:00 -0800 (PST)
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
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH] arm64: dts: qcom: arduino-imola: fix faulty spidev node
Date: Tue, 10 Feb 2026 11:39:33 +0100
Message-ID: <20260210103933.27228-1-r.mereu.kernel@arduino.cc>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92481-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arduino.cc:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arduino.cc:mid,arduino.cc:dkim,arduino.cc:email]
X-Rspamd-Queue-Id: 09F4C119B6D
X-Rspamd-Action: no action

From: Riccardo Mereu <r.mereu@arduino.cc>

CS pin added on pinctrl0 property is causing spidev to return -ENODEV
since that GPIO is already part of spi5 pinmuxing.

Fixes: 3f745bc0f11f ("arm64: dts: qcom: qrb2210: add dts for Arduino unoq")
Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index 197ab6eb1666..d2c3359dd814 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -328,18 +328,11 @@ &spi5 {
 	spidev@0 {
 		reg = <0>;
 		compatible = "arduino,unoq-mcu";
-		pinctrl-0 = <&spidev_cs>;
 		pinctrl-names = "default";
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



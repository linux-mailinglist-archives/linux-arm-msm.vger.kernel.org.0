Return-Path: <linux-arm-msm+bounces-92716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL9xMJDwjWlw8wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:24:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06A12EDE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FDFF3037F24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D656E1FBC8C;
	Thu, 12 Feb 2026 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="OaE0GZYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F32C21B9E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770909831; cv=none; b=UfY8MHmBCZg7dGxb1IL498zBDUOvHgxJDC6Jh9ydBk4PP87adjAifUnsXmVae//X8OLXq6LnGb7i/dvqpZzBwBHtEvCUlcyvqAp/xBr3Umj2TNGsBtdvV2dMDxDvGCZPxfnrbyvq1a4zfmE65ZA9jc46aRYJptLOUjpGj8XzC5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770909831; c=relaxed/simple;
	bh=qF6NDifjLT3HaOqfZqZswJXxDeTzMJhKHZooKrKRZzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cjccv3z6ZuFEIk5pDnH8rTNf2m9OlD+RJal0bS6APwCxN5s+eJr6h4avu7pVK3sJNDlWRTovku+0K88ZhjGUAKgZO47AregcxyNUFhaFfo/Xn8Wi5SNzo6GxMwVdEpqGxBEUUp1kJWMXzm0CxNcQx/iM64XYjd02xyYW5NpANUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=OaE0GZYP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-436317c80f7so1371415f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 07:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1770909829; x=1771514629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XIQ4sAYG04IW3b6JAxcu84indwbD6LDuA3v3O/2WtbM=;
        b=OaE0GZYPLrawBil5fPM56keNiwGoUJikR14n7fkqDy9WUOQctGE0e+FdxRRpu83Xzt
         Wp7tvvYCdqGaUWqx8ccDUvJkB3Y75tAuZtqE7Kwtx8NAQDhnJ2MXFW6TQz8c7tQwrjen
         p7uZsUyGYLEoBQkrjkvAoCsJ3c0kK9SDCyJeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770909829; x=1771514629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIQ4sAYG04IW3b6JAxcu84indwbD6LDuA3v3O/2WtbM=;
        b=o2Z6x5coL0kOu2FZ74VQJ708Vopst4+Fms0uG01wLoUSvVFiklEF+2w08G56Oyrc1j
         Fk/ITlOAFa2N146arFe3fx5+6dK2HfjEtY1AVs1hTBKTKhOceh+pmS7ddiISFmDToV7p
         y21Q+gXHhjw1Q2FL4AweLwVLX446EttdF4Bu0JxQmPWWZo2gXqJzAaYZA+jTjTet0MOH
         Vg7E/nBj9nSNQyhoiphZXEdyFfQphTqfkyRAZY+35ppraKi6RdQZiw1MdoTLSiGuKJzR
         +2+GwPDvJGYgMfNpVTI7Ha3EE0dndx14M6ZrrfyovHbB8FXlSi5+TPDOHdLUSxq5HQSh
         68sA==
X-Gm-Message-State: AOJu0YxrU5e3djksYtcZzf0CUOozOpabHCsol9+TqvuDM+PXEk67yfi2
	UdHvbq64GsOM/1zryz6NUpbHPYsKxEkDyiqUo917lUGSn/RyG8h8+E2RVTmYmyzQzQA=
X-Gm-Gg: AZuq6aL39VFCAdrC7iDOpPvWzbGGtQi4bqkBh3RQc1g/Ap78HZwg2Wh9FrPzHzWE2dh
	NgMZtYn5kAua6+0g13F7poj8oOvCjcubVDYLPT2zHxFyIKxUvdD/HLN1Udm2yzwN/FrDUHtkyzt
	0OYGPJAPlN/BvIEvCKElHk0bHhIXBj7p9WStPAaN3eGQu4MERS4R0/9Tdy1FKbbVt61kixp4n8X
	0NorIgSHqts6qoMJr/VA+nezAT0kaNBSJxjMKmyz+qBPGT95xTIsLZp3TgkZIgOYklhUqJWdTR8
	CW1POMdbLJNfAbqKKLL/GO+97E0X2sUQxxCnF63gTrd6pjvFTw/wNPDsyGIMt18uHPVd3xhvesI
	gkBtUJDruqX6CGn1+kVw7c0GRMLvAp1x4LjkINyAZTmDVzPdCxcgfJdO83WrKirYv6Gn654rjPO
	isdHhsgR3WSFN3rCeonF13dbLDfk1qTcCFtE0VGTGk4CQYlTGQJMc6DCn88xhyzbV+8KOq4b1DP
	nM9yk9K3oI2nrVgKXE=
X-Received: by 2002:a05:6000:1865:b0:435:db9b:5881 with SMTP id ffacd0b85a97d-4378e726705mr4757994f8f.25.1770909828405;
        Thu, 12 Feb 2026 07:23:48 -0800 (PST)
Received: from riccardo-work.fritz.box (host-79-41-222-66.retail.telecomitalia.it. [79.41.222.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d3464csm14808028f8f.5.2026.02.12.07.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 07:23:48 -0800 (PST)
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
Subject: [PATCH V2] arm64: dts: qcom: arduino-imola: fix faulty spidev node
Date: Thu, 12 Feb 2026 16:23:29 +0100
Message-ID: <20260212152329.134065-1-r.mereu.kernel@arduino.cc>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92716-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arduino.cc:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arduino.cc:mid,arduino.cc:dkim,arduino.cc:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 7A06A12EDE8
X-Rspamd-Action: no action

From: Riccardo Mereu <r.mereu@arduino.cc>

CS pin added on pinctrl0 property is causing spidev to return -ENODEV
since that GPIO is already part of spi5 pinmuxing.

Fixes: 3f745bc0f11f ("arm64: dts: qcom: qrb2210: add dts for Arduino unoq")
Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index 197ab6eb1666..796c1f7ff17c 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -328,18 +328,10 @@ &spi5 {
 	spidev@0 {
 		reg = <0>;
 		compatible = "arduino,unoq-mcu";
-		pinctrl-0 = <&spidev_cs>;
-		pinctrl-names = "default";
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



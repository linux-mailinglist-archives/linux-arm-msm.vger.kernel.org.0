Return-Path: <linux-arm-msm+bounces-92794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOPYF2czj2k+MQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:21:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F75137093
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81BF9301017B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F0835FF59;
	Fri, 13 Feb 2026 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uz+M8SLj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EBD30BF68
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770992473; cv=none; b=jMJ6g7GmG92aSTCuoZbQjJu187oeyqhLL1nV4s72KJGbOMLSrJ8ZqppFvDtJ7acPv/9gkeH26VYMYqwmRLxf8Xu8u+qS4nIUv+jP1aEZ9DhZqRgPWeGm0xd8ui0cV4hs75i2UYfs9uoe+7jizM1rLQfeHSewYGACOCPKpMxNeNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770992473; c=relaxed/simple;
	bh=PaJDyaKNMJRWk4L74IdB8CguRyGRaIr/tCoXLPzHYng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FIZrSS31FqVTKpmw5SOjgV0QUsFe3Mah0dkcIxxE6cKPUDbaW3t8lNTXJjs3dV5v9YxLgYg+a5bj0TezmYxyIv8AOHRdp4qmlAMaXjq9q7hYM+ac/3mqqOzNPAHQQ3K+xam49T7YR47Sbnxb8revo5CslDCzQZNGPn2at8Ufozw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uz+M8SLj; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b885e8c679bso123987666b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770992469; x=1771597269; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lNvGn/gAEy5rTVgtFUfiU9KyxO9dt/WiWx7gXnF/wQ=;
        b=uz+M8SLj3xATVu/YOYuhviEGC6ogRgqDnQbRDM6YdS9+vr9D0SvJlWteCKGBX+NYZ1
         MKRKH9b9d9ebU/jVj5OouZVhI3oEET7U60tmao/89BnCW4wkYLqhpRuukHs69qS77JUD
         caalCLlxP1e7wqdXB/L0f4NcIAfjYungjIq4/EgLjrlQ0oH129MPXIYCp3ZXMPutRgpP
         Thz5rovYvYnGC7XADkxnZFIXYJ3wPBVlfO2OnmOdQP+kAFLF52YnhRvxJZOcnlMTLXgL
         DX92X4zA1qyQX+ScBdRSwWNTWWC4ZO0N8H/ob7vGUGZcmXqGLPs44TI2v64OfKrtv9Hu
         nY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770992469; x=1771597269;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lNvGn/gAEy5rTVgtFUfiU9KyxO9dt/WiWx7gXnF/wQ=;
        b=c+ME1CJ+V5s7QKHl4fqD07bhqysvT3rb8Fe1T3W9dqWqA+HhzgFiY/iRrdNh2HGLiT
         nrjQp154H5UzcqmvLVSHhfpmxMVWW6doLheMiA8qWH19B0ATe3HBw6zRyyMNsEuYkplP
         8VuADEQYMkz/znBb+2FGbZK21bESy4hRGnTs8EWpw0EhkqiZk1wBRNEhxvcceEslEjOK
         bbUUyWv7OPFgHybVYYMUdGIbZFPRnpECCsBV/cWUtB2LCQwhFspMyh/j/QIWW9flsZZI
         IXIGMkQ/sRGpwxbSib8mCy5QjeeiqppNe6msjCWxJb7n3jflP8HpDFQDv4KJMGMgJgTG
         EmqA==
X-Forwarded-Encrypted: i=1; AJvYcCV1BYBCxvJ7ocxtvL0khpaRzkWznGQwJGvHSCytCdCX8jy1Vb3wP34gDDb1NeSHCm8asClBYOXZvCzQGD04@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZllZ4tOlWi6r0KkLmQEyLuZsV37ibv4jrOOhduK4XJdQcfzX
	A7cEbb43/gyJaetvYs1i2kYwFcjvr3NnLsqqp+ZoZtyGXIaOamYPp8t/HO/k0SM1V7Y=
X-Gm-Gg: AZuq6aK9ISuI50ck8RltSC43culSt6Zw3FvHtr43R6n6FyqdMrNLTrE8aXNFhlxMT8c
	5YMVL8kzNK1VFIzl2eUKmX5v6T+5vPaNFQW/t+q/8i2C/crN76G+4vEYzZBDuXCwwsd1qYqx+Cu
	M+ir9U/8/BxFiDzn42SpmFFeD4dA+cpnTcF4cJoq8ObYOrxmsJsKA5kT0jvvgj/j+nHDuqh4aPi
	fz5mX0+oWK5FnuY3Pd6VPFTtD7BsEVvhQ5eob+DwU9VMOvHJyV7neImwqEP45kOL3G+rb6BCr9P
	DIc7yvLaK1+c8cLTAvdwYBUBRN+WIuW1FfiE2dY1xtNyEXsH3a+dis8yyLnQZSD5lUMHExpTCYC
	8sPbnk8QCH2U5Xo9Bcvxp/AenkZ7wL81Z8uccuuls3oQrrDd312aH/E941MlDbZ0OJQbyF9hwXL
	XYMePdlWR8imst0lLmDbVpQLHbw5G9dbneNQ9SfVcl1oRRJlJDMi5hE7nBPNbfdSKECnw1XpqY1
	YAo
X-Received: by 2002:a17:907:9692:b0:b87:a0df:2f98 with SMTP id a640c23a62f3a-b8fb4672805mr106847666b.63.1770992469139;
        Fri, 13 Feb 2026 06:21:09 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f9d45e79asm130787166b.24.2026.02.13.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:21:08 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Feb 2026 15:21:06 +0100
Subject: [PATCH v2] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0Jm7RjaaAFX3sOwKGVqm0CLbSUYw
 t2tsHb5JnnvzwqRgqUIt2KFQLON1rsM/FSAMtI9CW2fGXjJRcmYQD0JNHIYMJKLPiArL43muq6
 4VJCtKZC2y158tAcHer1zOB1H6GQkVH4cbboVjpaEe5wzDj/B2Jh8+OwfzWw3/o7PDBmKhldXJ
 bq+Lpu7ljZMxjs65wVot237AnEmzH/jAAAA
X-Change-ID: 20260116-fp6-hall-sensor-1049f2f872ac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770992468; l=2287;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PaJDyaKNMJRWk4L74IdB8CguRyGRaIr/tCoXLPzHYng=;
 b=emdVErxPZvsDCPjFLjkK/Ib4DqAmZNg9hjAxRMoUzy1wy+86mc5SrhhyKAg08Rzttq9JlS+71
 djlXzxRZaZPAsK6yO5ZxWiEjMPHzgStUoYZyTtFkqODKDqxu9INg8G7
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92794-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5F75137093
X-Rspamd-Action: no action

Add a node for the Hall Effect sensor, used to detect whether the Flip
Cover is closed or not.

The sensor is powered through vreg_l10b, so let's put a
regulator-always-on on that to make sure the sensor gets power.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
As pointed out in v1, this would preferably go via some vdd-supply to
gpio-keys, but this support does not exist yet.
---
Changes in v2:
- Add pinctrl for gpio70
- Link to v1: https://lore.kernel.org/r/20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 7629ceddde2a..bba327cc7a38 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -29,9 +29,19 @@ aliases {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&volume_up_default>;
+		pinctrl-0 = <&volume_up_default>, <&hall_sensor_default>;
 		pinctrl-names = "default";
 
+		/* Powered by the always-on vreg_l10b */
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 70 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
 		key-volume-up {
 			label = "Volume Up";
 			gpios = <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
@@ -316,6 +326,8 @@ vreg_l10b: ldo10 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			/* Hall sensor VDD */
+			regulator-always-on;
 		};
 
 		vreg_l11b: ldo11 {
@@ -807,6 +819,13 @@ sdc2_card_det_n: sdc2-card-det-state {
 		bias-pull-up;
 	};
 
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio125";
 		function = "gpio";

---
base-commit: 3daf23347bb5f4a375d0101ed29c97ce1a99721b
change-id: 20260116-fp6-hall-sensor-1049f2f872ac

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>



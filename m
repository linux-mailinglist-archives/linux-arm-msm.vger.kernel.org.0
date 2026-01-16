Return-Path: <linux-arm-msm+bounces-89415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF6D3292C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6CDA73026A4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA1F335096;
	Fri, 16 Jan 2026 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WSfOmN96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E385B2BE029
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768573376; cv=none; b=pZhhXkQuZfvrAzeBqqVULmMvBSdPJnnBz9dP0NfWmvY29IY0/XSYwLIBUi1cOJ53xgogauwpmOkMmwQZw6dAKU2L+rEbJRBRfuHUXAeu0ID9HNg0LPRnLirLzIL+LPwgLeFFJROvepB3fLs5QBlEFwtUHyeHDFx115nSQxydxig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768573376; c=relaxed/simple;
	bh=qpyArYbgGexp0kw5GKDzvXd4kBpE70tAA0DX+Y4oYPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BUPc2mEK5TBqmGZ+XR98TBhA6dj3ofdQk4YgnZ1NLjRG/vEpbmUPiDo6YBlRXW6WvSKzsY1B838wxIuNk1WEPbooJVmjJSwdhSQ4d3MpHC4JkHvKBrcGLXFkCTUvbKS/ngaOGlCU/hRzSiU9gnuL1Tt/Nll9S0aimyJFcLXwOKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WSfOmN96; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so4049928a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768573373; x=1769178173; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4htJr+mv+3MEm3YJIQ7F3EojQWw625TtO5UiPuBMOs=;
        b=WSfOmN96iKXxFRro8ZsEjZjB0+VznXzBvzfbcATUNuaBPPShfW2ZCBePPMuXD88jnF
         zHKeHQ3at5UKb04WKQHnmR4T/Tlzmic4o+c+5SB/tZNpTIwSouxry9lSKWFsUzZIPi/M
         ZzWdkQRqOfDoCrKNgCwFT4jDSdS0JOza573trLisulpNWAWud0owTAJsMkfRAo8siIwg
         RJu55IhBgbHAAKlgoQesTUNDSJxve09HzDuOtFokfO+3HNfMkh4o4j001z7PTH/5uwcw
         bd7QhTNe0tTpa8+XiAQyb02+bVUw4XpbLkrrBSddCYtwuuOHuvWqrSuwOcO/me0CziDS
         wKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768573373; x=1769178173;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4htJr+mv+3MEm3YJIQ7F3EojQWw625TtO5UiPuBMOs=;
        b=pVtlSX/KIB+vIktV+KLYA5cp0u/VHnragyhePbMoP3G2P+Cku6GdZP758QLEwgJVoG
         YqsZ/VwSQy0UjveUrBAbnVMy3JBr3LjxoSd+Z7z8Wu1iQyfHoXkAYEFc14X6U556SW2j
         9xrCtaUni8UJ+3XPayyHKHpkDd1urfjGdOZUKCC8N2+Oxw55rhEZ6N6Dsrubgf/t5FAf
         vz46J1WO01Ivgz8m6YOFz/OeEhj5sRJpAsx9Leb9z4A7Ng+aG+Zsjl0cEV3UVk6xm/6b
         fNfghlrZ7ktMNp3XnajhJSi2JoT3OYmU8gXskEn3CA9eO27mdZg/4FZJrf47s//mOBt+
         Hf0g==
X-Forwarded-Encrypted: i=1; AJvYcCUiH93mVd1urHyMhqeb4nofq/sO7n1Amh8cPtf+v5dDmqTvhpvRBx5Ozc+6GDqcYq3EIQh2JFkIbqL2ML9u@vger.kernel.org
X-Gm-Message-State: AOJu0YyK4uLnQNyAqWNHnzPLTi7gaE4hp83dzHSIvnJHl2EDZjjZvLFX
	xRU2naa+BwpQh4kmO61bWD9ZgqIVw3g+9/RFcqFbfuxeNM6HZ3u1L9C1WD6yPlsuGyg=
X-Gm-Gg: AY/fxX6ZJah8t7DUvJnfS9tmPt1cHAuImlA4pmSJrVpeotqJY3y+jZNzLYFUQUvh9QX
	ZH0Svc2tO2j3Thw4v/cq085zAb6SeKNQAmAu46DWHRlKevWKKXOFoHIXxbrlWKhSKD3ZfqQRhT6
	hyPebV7IcgVt63DS6zs74Ht7ROr2BtPshpfY6oxZiS0MYzQD+ocYatQ5ffQHEP0ZH8Kpm5I//v6
	tWpPgC3FxMD76iicZn2jXo+YOjbTIiExACMjXjoI/IBWEzl3f9H13zPGKb4vPgCvUy2znbXsLZP
	8TueM7i9+H34MFbbPIPc7n5/b8QkEVhWYc/pYXj/z2NhYVPJ1KnYt6jdDc0i1Os8jObh3geiHbY
	B7E4iIBBeNoKcoIXmGoVb0kxCLkNSAeQP9feTPAls6Nfy1RWGyflMH//RHaFPYWbtd3xi6yImnF
	VVMuKNCcxFBKG5aNmk18ffkjGqI9c8r6OkNgCmn0ZHVJQqSqvjeDXTIj3YuK78eU1A
X-Received: by 2002:a05:6402:50ce:b0:653:ea2a:252d with SMTP id 4fb4d7f45d1cf-654524c77a0mr2442998a12.7.1768573373244;
        Fri, 16 Jan 2026 06:22:53 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce56bsm2558871a12.1.2026.01.16.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:22:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 15:22:52 +0100
Subject: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrDIBCF4avIrDugUkybq5QsbDo2A4mmjimBk
 LtX6vJ/8L4DhDKTQK8OyPRl4RRrmIuCcfLxTciv2mC1ddoYh2F1OPl5RqEoKaPR13uw4dZZP0J
 9rZkC73/xMbTO9NkqXNoITy+EY1oWLr2KtBdsuO5gOM8fBx2O55IAAAA=
X-Change-ID: 20260116-fp6-hall-sensor-1049f2f872ac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768573372; l=1553;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qpyArYbgGexp0kw5GKDzvXd4kBpE70tAA0DX+Y4oYPc=;
 b=SUQPJhnuPQ8OkZKLbWyhCU/QRzhAx9RGx7gjxBZU+8r8zevPBYChTL2y+F93PZr8Gj37riMSN
 +z5nLTFhTZgBuq7+kTL+8T2uWWz3lFzQOkXN7OoqS89Hm5E7Tx1b0y8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the Hall Effect sensor, used to detect whether the Flip
Cover is closed or not.

The sensor is powered through vreg_l10b, so let's put a
regulator-always-on on that to make sure the sensor gets power.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 7629ceddde2a..98b3fc654206 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -32,6 +32,16 @@ gpio-keys {
 		pinctrl-0 = <&volume_up_default>;
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

---
base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
change-id: 20260116-fp6-hall-sensor-1049f2f872ac

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>



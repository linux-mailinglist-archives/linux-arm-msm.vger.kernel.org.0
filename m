Return-Path: <linux-arm-msm+bounces-44362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2BEA05AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBD843A2670
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E23A1F8AF6;
	Wed,  8 Jan 2025 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="knp0r22q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AB21F758A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337936; cv=none; b=h/15jBLINTF9fyTE+VPraEeHccEdlMW2G9aWuKo72/OpRyLcfXSG0WrWaO9p5BvXN+PfUQY33SH3gYO6ZCBRP8Bm3rbtTUevn9HSnK2LqHt8LzJkFU5mj9DCRiton6QQEoqCaH88GAAkYn2xfcjaJc4ksRbOcrWqVt/P8u/j1f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337936; c=relaxed/simple;
	bh=O/ipbfUJ+i6XxrL+DK3a6ndmvpYfRjXuPQImjQMFwY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ia3YOoDF36IjpQnJmRlauFJbYpk9C2nxigKfBQHvK6ZihGjjphxyqWWALVYHbPnF7t/+oh3jf+vgRuHT545iq9eHlln7Gz54b2f9NedGOgNAkuZ8RRlvsMOVbAi7S6LrwfRoTGLrKF2/Iu5wok9Lvs294QgVJpY70XweoKRkFVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=knp0r22q; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so3781782a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 04:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736337933; x=1736942733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ydCNg6jT36E12xsOeua+Sa7IGX974RGk3urRyUbAQcg=;
        b=knp0r22qSano6GySAuO8bJkxWKa3dAnvtvoqqYJfekwX9xf4GiE64RVOqYlKiLj5ap
         IebIzAOTYZ9V9zicnDOLQzR8UqiPORTl6EjpRsmGNHMxMvtBZ1FC/+Lc7tg4orJ9x649
         BUMic65ls+RTVlgnTeWXssQ8z8oO0uk+Hte1Lculm6ePV1MpD8LQbgdGCjZGLoxUSmLz
         xdJAAbhkTWzHwtURexV+1jvGO8lo7hHP1R573v8Ls781T81yko9LRmhXXNli67uynGg3
         3L0znN7F4Jwu1yrDRhh01kNRQEQ31817nfiILJDW32c6fIQWqS28O44jgNS94yy8HPQS
         H6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736337933; x=1736942733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydCNg6jT36E12xsOeua+Sa7IGX974RGk3urRyUbAQcg=;
        b=fAjPDUXulAmMsD8pBMufqbo6JPyBDwaoA0OIgPEhKI3TPTFlSMJ6p1/u+g1cXEb/Dp
         TBOWGc1KFmLjuRAlnFgwV5nsrFsP3iZYwXyZldd/57I66kKIE77dSLze+ncoHto03wkf
         1lWF0L+VpZ8s179n2t48eokTbJhNG31ujC+qPhb3zqXfbaiEFY9MUIG1sw1aPH7bRnIa
         IBXaboZHLCHCKfzyMgstgnzftH6sAYxXfZ4qPP6ZY1TPjL/wLqTkMGrK5EOSOYL28Bem
         x70Hpgh1OPiE7gURNPIjf7Qxkb2WYCzjva5g0i0Np7ZwaBtk1SQ6QxpsDpthDzHcwxDw
         FmIA==
X-Forwarded-Encrypted: i=1; AJvYcCU99MKVZzw9osjT3gpsslGHie63QCE45ujEFCtWyoRO6jmPqGSiZtfkP9c8QloA0rAV60ycS9885nxNTazH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcu1kJJRntyW5WxNv/1drZ6PHtFdUiy71kc9nlUTbtYE7ZL7HE
	9/XjwG4Dphw0skz1ZSanAVGUElDoJTuGzWiY9rS9wvE4w0DCyudatpZUPIXV6HpEpgTGSLre9pD
	K
X-Gm-Gg: ASbGncufrM1GzEb4tWeoGVdI9jQ0x5k76zS4YZbA4O0nAJ1K/OPCYNFBNGPp+/wt0n7
	udvASdc4/ERnKW2oefiTZlalWSs9z1WqmuhF6Ty78x0gh1yMQbyHUPTS9cbPjcdBzMODp5Kj4Va
	2u5iHfzTsD0QF69RiDi14CCfQgcXBZsGJ5tc/pYRqJmaM1mEEdgqpT0RB68oWuAjtfZ/Nmo3sr1
	5zcYwdKxgjW/0w76ofnN+y3AbGqCk4abcrJUltRv7oWcCN51w+cwoS1twHCkIdDMOZcmUM=
X-Google-Smtp-Source: AGHT+IFK1TbD0Uf1FgK7ziNEnOG9YYy0/1HJ7Ai3OvVZgi26v6PEQj7rnDX7uvM6M1rlaGSscM2GKQ==
X-Received: by 2002:a17:907:c586:b0:a9e:80ed:5cc6 with SMTP id a640c23a62f3a-ab2abcb0cd1mr71382666b.13.1736337933040;
        Wed, 08 Jan 2025 04:05:33 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830b10sm2479699866b.37.2025.01.08.04.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:05:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: Use recommended MBN firmware format in DTS example
Date: Wed,  8 Jan 2025 13:05:30 +0100
Message-ID: <20250108120530.156928-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
instead of split MDT.  Firmware for boards here is not yet in
linux-firmware, but if it gets accepted it will be MBN, not MDT.

Change might affect users of DTS which rely on manually placed firmware
files, not coming from linux-firmware package.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts             |  4 ++--
 .../arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi |  2 +-
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts   |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts      | 12 ++++++------
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 9e9c7f81096b..4dfd66076629 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -383,12 +383,12 @@ &qupv3_id_1 {
 
 &remoteproc_adsp {
 	status = "okay";
-	firmware-name = "qcom/sa8155p/adsp.mdt";
+	firmware-name = "qcom/sa8155p/adsp.mbn";
 };
 
 &remoteproc_cdsp {
 	status = "okay";
-	firmware-name = "qcom/sa8155p/cdsp.mdt";
+	firmware-name = "qcom/sa8155p/cdsp.mbn";
 };
 
 &sdhc_2 {
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index a4b722e0fc1e..40522e237eac 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -157,7 +157,7 @@ extcon_usb: extcon-usb {
 };
 
 &adsp_pil {
-	firmware-name = "qcom/sdm630/Sony/nile/adsp.mdt";
+	firmware-name = "qcom/sdm630/Sony/nile/adsp.mbn";
 };
 
 &blsp_i2c1 {
diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index 9a3d0ac6c423..835ef929ff2d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -453,22 +453,22 @@ &qupv3_id_2 {
 
 &remoteproc_adsp {
 	status = "okay";
-	firmware-name = "qcom/sm8150/microsoft/adsp.mdt";
+	firmware-name = "qcom/sm8150/microsoft/adsp.mbn";
 };
 
 &remoteproc_cdsp {
 	status = "okay";
-	firmware-name = "qcom/sm8150/microsoft/cdsp.mdt";
+	firmware-name = "qcom/sm8150/microsoft/cdsp.mbn";
 };
 
 &remoteproc_mpss {
 	status = "okay";
-	firmware-name = "qcom/sm8150/microsoft/modem.mdt";
+	firmware-name = "qcom/sm8150/microsoft/modem.mbn";
 };
 
 &remoteproc_slpi {
 	status = "okay";
-	firmware-name = "qcom/sm8150/microsoft/slpi.mdt";
+	firmware-name = "qcom/sm8150/microsoft/slpi.mbn";
 };
 
 &pon_resin {
diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 2e1c7afe0aa7..12e8e1ada6d8 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -379,22 +379,22 @@ &qupv3_id_1 {
 
 &remoteproc_adsp {
 	status = "okay";
-	firmware-name = "qcom/sm8150/adsp.mdt";
+	firmware-name = "qcom/sm8150/adsp.mbn";
 };
 
 &remoteproc_cdsp {
 	status = "okay";
-	firmware-name = "qcom/sm8150/cdsp.mdt";
+	firmware-name = "qcom/sm8150/cdsp.mbn";
 };
 
 &remoteproc_mpss {
 	status = "okay";
-	firmware-name = "qcom/sm8150/modem.mdt";
+	firmware-name = "qcom/sm8150/modem.mbn";
 };
 
 &remoteproc_slpi {
 	status = "okay";
-	firmware-name = "qcom/sm8150/slpi.mdt";
+	firmware-name = "qcom/sm8150/slpi.mbn";
 };
 
 &tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index e8383faac576..7d29a57a2b54 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -547,20 +547,20 @@ &qupv3_id_0 {
 };
 
 &remoteproc_adsp {
-	firmware-name = "qcom/sm8550/adsp.mdt",
-			"qcom/sm8550/adsp_dtb.mdt";
+	firmware-name = "qcom/sm8550/adsp.mbn",
+			"qcom/sm8550/adsp_dtb.mbn";
 	status = "okay";
 };
 
 &remoteproc_cdsp {
-	firmware-name = "qcom/sm8550/cdsp.mdt",
-			"qcom/sm8550/cdsp_dtb.mdt";
+	firmware-name = "qcom/sm8550/cdsp.mbn",
+			"qcom/sm8550/cdsp_dtb.mbn";
 	status = "okay";
 };
 
 &remoteproc_mpss {
-	firmware-name = "qcom/sm8550/modem.mdt",
-			"qcom/sm8550/modem_dtb.mdt";
+	firmware-name = "qcom/sm8550/modem.mbn",
+			"qcom/sm8550/modem_dtb.mbn";
 	status = "okay";
 };
 
-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-33119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD4990399
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 15:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23B9FB23D6A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 13:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBC5210184;
	Fri,  4 Oct 2024 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="swTec+dz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F1E20FAB1
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 13:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728047336; cv=none; b=nWKODscJzjuKAb1DenM8fpngoTNFLwTwJCrTseGv1tCBXV8HkCwQ/KlDT1csBLj6LkiLQ7opAE2DwpcHCR54416+bTNsFVeOVUNh5jD4Fn7+XsG2S+OYfaBH1LgcZ46cvU7SdMwaL6QyxGpRSY34twWzk/aUffbRPImZiv5G+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728047336; c=relaxed/simple;
	bh=tF/nPfzcP4R3ACI8M/wyhrpEI3K4Z4ckVMNRUoBu3FA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PZsPdnihWHjd0mlamjpxgP7qSJ2Jvp/dciH2ZwFJp67xyNu8mI3mgXDkm52X/0/Uc65qb6tOHTeedD7SCe/hIfRit3a18f1cK1N//AEK2lHYjH10EghZ+pCGunFUP1bTdfX/nARrxgkYfQttW3TKStSl1TMxj/mRl87oUpHPvL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=swTec+dz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso408683166b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728047333; x=1728652133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4/AYJ0iM81mUlzV+Cv9ihjHBRLe4vDHy6tsndRIor4=;
        b=swTec+dzqbOKXdDH0yRc/7/GXtrHKjhcwpVfEHRq70oKRrfbwP/u9koyefhvNpwQgL
         kep7MCft0GIKS+17QNu/j3xvXakLFc64FcBhlbvKRAea7xUITEmtJyxXIKi3BmXjNpJZ
         ItjB9zGbhxXpAeiNKzKQevHC2JF3dH6t+4sMI+fNaYv5MsvB9xdyhRaMB6uzAmk+1OMT
         uyLtSBUOGFgEJ400wvojzPLsflNUTaGRzHSfVrzoMg6HjshnKQIQLay/DJhZluJOKPv5
         GB4XFvmnp3lPE3JPGQ1Hs5KX0ANYRXiBMvuiK0M3YszYCy8wTSZR2FrGtAdXJ3dCwO7J
         3tjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728047333; x=1728652133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4/AYJ0iM81mUlzV+Cv9ihjHBRLe4vDHy6tsndRIor4=;
        b=oeg5Ki2DAAlk0O9oAneMKeKacAG2FyM8Up9CS38aPEMgNDpZsOgnRdQGfFKiaPCh5k
         QgqItzgyiiflmzDUApaK8tFAcyWS0bbxyQ918+4Imv5ye6Mio7y2ISZWCxrWDSTwaf3/
         mZUXoij6lxrbSzl9livfJ7BfAZqaK0s04YdynC87CUKO6IzjMQb51npuzwaorQgj9WFL
         n2yaCqUSb8kMIxIZJ0XUxNzRKx1l2NloH+6rCfUrNFqLep7cxT4fOzVHv7hZcdWFmEs8
         YwJCl6KyPsDx96CiccF/7YMxpQwj6U00004S5sd9GsbFC1sH3YpVT/N6euItJPyhSMdA
         F+Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWZpwbYiduBhqKvlNoqsfGlaAFuzbmZpZH3jVJe5g0gG4oTZ8eQR86opJjnnDIWvxIZ+NuvNOM2PA/0eRk0@vger.kernel.org
X-Gm-Message-State: AOJu0YwEC4lxXfxYnjgwIvClaYE7eheoBW5tucYGKn/xaJSUpue/1p8U
	5fbzq7QEcppOkfbiB41WKDrN8wtYNsIoycVZSQ1Fp8f+PGSS1kqtkesEk6UOf6o=
X-Google-Smtp-Source: AGHT+IHiJ3v9CjBWrTt3qRr2xzF/A7zLY9mPcR2zAOy1KSRnmopFSHDNXZvYDIFtDM+HRc42v+GGqA==
X-Received: by 2002:a17:907:7e82:b0:a8d:4c83:d85d with SMTP id a640c23a62f3a-a990a04e25bmr686995066b.12.1728047332978;
        Fri, 04 Oct 2024 06:08:52 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99102859casm222477766b.47.2024.10.04.06.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 06:08:52 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	abel.vesa@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3] arm64: dts: qcom: x1e80100-t14s: add another trackpad support
Date: Fri,  4 Oct 2024 14:08:49 +0100
Message-Id: <20241004130849.2944-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Trackpad HID device on T14s could be found on two possible slave addresses
(hid@15 and hid@2c) on i2c0 instance.
With the current state of DT boot, there is no way to patch the device
tree at runtime during boot. This, however results in non-functional
trackpad on Product Models 21N2ZC5PUS which have trackpad on hid@2c
slave address.

This patch adds hid@2c device along with hid@15 to get it working on
both the variants. This should work as i2c-hid driver will stop
probing the device if there is nothing on the slave address, we can
actually keep both devices enabled in DT, and i2c-hid driver will
only probe the existing one.

The only problem is that we cannot setup pinctrl in both device nodes,
as two devices with the same pinctrl will cause pin conflict that makes
the second device fail to probe.  Let's move the pinctrl state up to
parent node along with the parent pinctrl to solve this problem.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

Changes since v2:
- updated commit log
- added missing parent pinctrl

 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 08ec2419f95f..5aa295404800 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -551,6 +551,9 @@ zap-shader {
 &i2c0 {
 	clock-frequency = <400000>;
 
+	pinctrl-0 = <&qup_i2c0_data_clk>, <&tpad_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	/* ELAN06E2 or ELAN06E3 */
@@ -561,13 +564,19 @@ touchpad@15 {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-0 = <&tpad_default>;
-		pinctrl-names = "default";
-
 		wakeup-source;
 	};
 
-	/* TODO: second-sourced SYNA8022 or SYNA8024 touchpad @ 0x2c */
+	/* SYNA8022 or SYNA8024 */
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		wakeup-source;
+	};
 
 	/* ELAN06F1 or SYNA06F2 */
 	keyboard@3a {
-- 
2.39.2



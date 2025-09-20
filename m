Return-Path: <linux-arm-msm+bounces-74255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667C9B8BCF4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 272C4A057E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 01:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2279B1FDA92;
	Sat, 20 Sep 2025 01:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhMm8xki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E1C1F463C
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 01:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758332829; cv=none; b=e9nbcIZ4L41l9m7xVsrsXiawEUjEgPnO+OrKLCPMa/xG2dDpdAC8S+x5idZSUSFKcoCaIx9oYV/MsX2cqnzUl5YDshrAgyvqonytgS2rkk3OHGe6voPaoSI6WR56DVkVRfe+mkKeiq+5w2Uu5GktWG6FbR56yVOo4FMNRGXuYJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758332829; c=relaxed/simple;
	bh=wttyNu3FB0JHzpeprhteba5sV89v7tUiRECg5BE75Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YTK61WCI4/uXwEZ5CqUyd1lWwWb1PqFarQ5rORGEKvtA2hScj2ZVlurfjJRcZpKwt0o2T6JyuzSXpHuE+eyeqqOHrWmQy/IbTUREaUKVaD1CSWdTdQdh5StcXOkp7sIjTDy/aOa/POLdtIge5bvQFfRPvvVdQDrdYsLmRcexFJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhMm8xki; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2570bf6058aso35809835ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758332827; x=1758937627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcxgtjVmCUZxaigJVlvyZe7TDMmHkjmyWKCsB43+itQ=;
        b=JhMm8xkiucygClKtWcJDQyATzF+yhqdWj//AfVdMkCqpkbgpI0eH7GMyae9ib4PCh1
         daHwE9qtgdQSETWBHsouSU2qrU9qlaAKINjy/j9LUcUG7/xderIWV6y4kuNzYNiKL+jn
         GJv9Srs4QMdzfK2rv+bR0p8MKS1umbyPMk8umk1dkR4XBeUrjpURtMyJ13Sv/I2w7I/2
         /6RsoTLbVUZfvQdMJUlLbojytZVf/Kyh1jEVxL139ZKs8Gea2bBCAN8/RkjuJosOn1v+
         gkiWSUoUmL3Mi7/Wf6TJ9k2y7zQmtG5vE7gHpA1MTELa+w+lvJs/hjA2AmHcwmDpZWxR
         b9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758332827; x=1758937627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcxgtjVmCUZxaigJVlvyZe7TDMmHkjmyWKCsB43+itQ=;
        b=TtxHGPlGT0N+7w81JiM7mWi0w+E0GmIaswyOc8C9wWR4r4bwf/owqTkWjlo3EjSiqE
         vfN3MOTFgz/QFWXaoGuj5d7Ye30cmEB426P0SShjLOF5tZZYRSBeyScPNcvEZsus6Smn
         PgAbLGhy5NNi6zXuCCZ/+TnexKrTUCvE4hqJFHwpU5oHCYUErr9vLji4YNYg/3tFE1if
         XJSHsPEK0j3ODhnP1A1TklARY4uaOpBiGoUW+aV3zOGHcZkv/sCicMZE7KJLZ1V+tMEX
         UGG77hsFod8d9cK9/Jr18DI0/p/wPRLKYHQQzBrG2L2zIQXF5i80YKXjcAmhVBhZdyN3
         gEcw==
X-Forwarded-Encrypted: i=1; AJvYcCW9KX0cKGTSQ8TqncdVINpjtQobIkF7J+gliM3a3nBQZRc1A4T5sQKBrLnfxCpclSPHIm/6r2QQ++2mgkNI@vger.kernel.org
X-Gm-Message-State: AOJu0YzoVYKU0n/0Xedvu02fN1mT8DZxAQk3MimrVyptvwrp9olmIKwb
	AYo6A4iaTRcuatXVJcLkoOxGdJYdyfQ5cnZCwiTxVcg2eTblqw4R9TMJ89O97Kn1
X-Gm-Gg: ASbGncuXRw6rarBtk4skfZpYgLqqn7XzSrc55XPeOxCfNbx7yykjwQ5At0qNj/zHErp
	H623ItV3vF7UVDOnHO7WBGEK2DO8AEh8eyeQmF1fCgAvEuuTwJvb557fcbAbpH+dOb9UOD2LiXd
	PK0DlVY6ALe7Jh5fitbCNKBxymJf64xpwnN1GLwVjNQSIMjsvwZr9zFPxpSQC2vLgaJIlgwnMgk
	KOfL2JQ8TAX/72+r85jpgxmC+5yBjKGjGjnJMj45Ac632gRbCT4Y4hvDAwa739QZTFx5/VSMD69
	W07NNWMFR987vAM2LD5DaV6uRPVYsBhZ2ydd7xRvRXqpW7R/7DgAvV9lE4w9kcbZ4hP1Lkk/A6f
	Vrm3n70sRyKqnp1IDQ2zz
X-Google-Smtp-Source: AGHT+IHu1VNSw+3ZcwebyxobluQNwXjhZ7r3UWUU730aQvye7TB/kSMESaaIT14huvuykOXkg+coQw==
X-Received: by 2002:a17:903:90b:b0:263:b8f:77dd with SMTP id d9443c01a7336-269ba568cd3mr78159545ad.57.1758332826778;
        Fri, 19 Sep 2025 18:47:06 -0700 (PDT)
Received: from archlinux ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033c922sm65709455ad.131.2025.09.19.18.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 18:47:06 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: qcom: r0q: add gpio keys
Date: Sat, 20 Sep 2025 01:46:33 +0000
Message-ID: <20250920014637.38175-2-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920014637.38175-1-ghatto404@gmail.com>
References: <20250920014637.38175-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add GPIO keys support to Samsung Galaxy S22 (r0q).

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 53 +++++++++++++++----
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
index 880d74ae6032..70e953824996 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -2,11 +2,12 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-
 #include "sm8450.dtsi"
 #include "pm8350.dtsi"
 #include "pm8350c.dtsi"
+#include "pmk8350.dtsi"
 
 / {
 	model = "Samsung Galaxy S22 5G";
@@ -28,13 +29,19 @@ framebuffer: framebuffer@b8000000 {
 		};
 	};
 
-	vph_pwr: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-		regulator-always-on;
-		regulator-boot-on;
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		pinctrl-0 = <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-vol-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8350_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+		};
 	};
 
 	reserved-memory {
@@ -47,6 +54,15 @@ splash-region@b8000000 {
 			no-map;
 		};
 	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &apps_rsc {
@@ -119,8 +135,27 @@ vreg_l1c_1p8: ldo1 {
 	};
 };
 
+&pm8350_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
 &tlmm {
-	gpio-reserved-ranges = <36 4>; /* SPI (not linked to anything) */
+	gpio-reserved-ranges = <36 4>; /* SPI (Unused) */
 };
 
 &usb_1 {
-- 
2.51.0



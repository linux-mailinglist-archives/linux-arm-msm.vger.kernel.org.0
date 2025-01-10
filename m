Return-Path: <linux-arm-msm+bounces-44717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1120A08BF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AF6516ABA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 09:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0112C20B7FC;
	Fri, 10 Jan 2025 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5wUYU/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460AE207A20;
	Fri, 10 Jan 2025 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736501101; cv=none; b=GfDqSXGDMjnT+PNUBJR//rczOjNcPeoKESuh42/HVcbygw2pBBxAveg4UHsQUVhSMZj1ty2Xk3DF0PWrpJxv1cWVw4/2OYaWI2vvxQZAumfHsFz7ECGehSm6F/cSBMXLIui5urp6sF8CiNv7Ai5FzBK7ax41bV2eljCZddGaoCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736501101; c=relaxed/simple;
	bh=niGjgrrVmdtVS1WVm9sHB6O3NublVeEjaptVU73jCc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DbEc4cySK0gmWAwi4a2PVZTSWdpVeumZuXgYSS9WXDSjhpnd5tDfVhJgxDB8bt8P4xOBO8CrdI3x3T2o3L6mwoAuWYQSHNTfUKJCieWpIef9MQRnIL+ZcAkUSC/3AcWO5/npmLYTeZZtpcKBOGCzLP6wokpQujUvc41TnhLQ+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5wUYU/y; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21a1e6fd923so40163785ad.1;
        Fri, 10 Jan 2025 01:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736501100; x=1737105900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7eyMIA6kVSBHitlP2NADPr2F2L1DgOnj57DVaHBD8ew=;
        b=P5wUYU/yFwindPrSxZRYnbEcwlK/S/XL7pB2qsdpJvn23ug+Bl84NGa+giRamMoBid
         JeWw4MAE3IvfFZwp5/EcTfN8cOv+2GFMxiY/KiZzEleUPOBndaFYYE/isYPmX+yZ5ype
         Hc11ol7cpQhdvVC6iCgiLgRu49ibS1/qxmpRkRzsgM0SazsFosXzCjtqG6HWV2HaycOr
         3tG2i/3VddU0oGhRYg0zXqbS571MU4hxF5opB1wtyUo7yJw7nNfTLunnkkgb0Z3YzPAb
         8lsht/DGIb9AuhYnmlqEgcHfRDPrDL1DviVTrvncRMeR+ERbdbNrESJNOxkSeh1Gd4cq
         UfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736501100; x=1737105900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eyMIA6kVSBHitlP2NADPr2F2L1DgOnj57DVaHBD8ew=;
        b=B7Pld0j1ajr7KFX9GUzVKnUZXwNHxKBAG9XAkEfAxRaBfxSwn6lVTpBoSL0KHtJIRD
         /fC9ON8xxt9bAMGCyZASKAnYGL4ngtcTrfkcsqoah05DWsRF70DcwXJlUfxbZQhqpOEu
         ecU4lrN4svqdeCBZpalLE6gVAF/73h1JFzY+1UQMPoPjmNd4J4kbJUhMaK1D76rL3F55
         lj3RUQVFs5eyq0/sp82KqYgkMgXs98mmFvQXbYpORYlD5VP7TJnv8fm4/ASA9r+wHNBN
         ZmULgVUoKci/0ht8cAf2cL/Ngo0MQaDvneqPbLLgQ7/hKaqrWCkyKvrbaI9Im+bSjzTn
         LExQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3hF/t5pEYABiI2UzfOwQ3S3JWUXr51oCdmzFPod2jO0WrlQ26YlFEzwxToF1ysYLoVVuZw39IsVk/SLDJTw==@vger.kernel.org, AJvYcCVRq0YkGdYK4BD28GSwuXYzFtU+EG78mO3R65v2FMW3UeBm8zpFWeu51ati9aD58wrW3T4eH+fexgAY@vger.kernel.org, AJvYcCVUvdzjfCFmQs+BloKrc8yOsIw9RBYfGnCPD4R3T347rMaTN3gvjKKiURJooIMSNJcWKLP8SvY06t05dX21@vger.kernel.org
X-Gm-Message-State: AOJu0YxNBwgQtOO225Ur8hfrv915/wjGxRz1awx94WwFiNJxPKONHwuh
	RBMC2tC5X5VPKcS4GjbPfKL1cC9A7uI+5lVZ7NJQazOSd3fLug99e6FZwgg0Kv1cDg==
X-Gm-Gg: ASbGncslpzGHNkYo1xonr7K+ED51Kd1IBSBh1YdCIQvZCIMsZlX+KxKwxl+Z0BE+X8z
	MCIHSxcinZT2VrLolaMzIiiy2dunhoVrARkEm8SWATJ4E78t1IHAqNHnHOsyfn9jY5wpheiXqOc
	2fEjUpgB66wiNXyX3YzqF7OZUs0NUr4p5tYKPTzMNDOvikteB5qxeYKCgq/shK/885HKp4uTUOF
	JGkHfwophCusczqXZEBPkwWBKFNL1+egfSvt6YXsr9D24OI5qkBJ9Y=
X-Google-Smtp-Source: AGHT+IEqM33omEl/Vt5aGBTweWkw0NcdKLGLmfnGjh27GEht1qiSgOpXbXiFido58MgIJFwO/DUyyw==
X-Received: by 2002:a17:90b:274a:b0:2ee:7862:1b10 with SMTP id 98e67ed59e1d1-2f548f2a149mr15244724a91.11.1736501099523;
        Fri, 10 Jan 2025 01:24:59 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5593fecc6sm2898244a91.19.2025.01.10.01.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:24:58 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc8280xp: correct usb phy power supply
Date: Fri, 10 Jan 2025 17:23:25 +0800
Message-ID: <20250110092326.167575-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On this platform, according to dsdt tables, usb{0,1} phy consume the
following regulators. usb2 phy should be corrected also, usb2 in dsdt
is a little complicated, so correct usb{0,1} only for now.

	usb0	usb1	voltage	consumer
hsphy:
	l1c	l1c	1.8v	vdda18-supply
	l9d	l4b	0.912v	vdda-pll-supply
	l7d	l13c	3.072v	vdda33-supply
qmpphy:
	l4d	l3b	1.2v	vdda-phy-supply
	l6d	l6b	0.88v	vdda-pll-supply

base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                 | 8 ++++----
 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      | 8 ++++----
 .../arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 ++++----
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 8 ++++----
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 4 ++--
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 75adaa19d..ad61bb206 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -815,8 +815,8 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l9d>;
-	vdda-pll-supply = <&vreg_l4d>;
+	vdda-phy-supply = <&vreg_l4d>;
+	vdda-pll-supply = <&vreg_l6d>;
 
 	orientation-switch;
 
@@ -852,8 +852,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4b>;
-	vdda-pll-supply = <&vreg_l3b>;
+	vdda-phy-supply = <&vreg_l3b>;
+	vdda-pll-supply = <&vreg_l6b>;
 
 	orientation-switch;
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 09b95f89e..e46f24c3f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -1013,8 +1013,8 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l9d>;
-	vdda-pll-supply = <&vreg_l4d>;
+	vdda-phy-supply = <&vreg_l4d>;
+	vdda-pll-supply = <&vreg_l6d>;
 
 	orientation-switch;
 
@@ -1042,8 +1042,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4b>;
-	vdda-pll-supply = <&vreg_l3b>;
+	vdda-phy-supply = <&vreg_l3b>;
+	vdda-pll-supply = <&vreg_l6b>;
 
 	orientation-switch;
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index f3190f408..5bf43050d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1363,8 +1363,8 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l9d>;
-	vdda-pll-supply = <&vreg_l4d>;
+	vdda-phy-supply = <&vreg_l4d>;
+	vdda-pll-supply = <&vreg_l6d>;
 
 	orientation-switch;
 
@@ -1400,8 +1400,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4b>;
-	vdda-pll-supply = <&vreg_l3b>;
+	vdda-phy-supply = <&vreg_l3b>;
+	vdda-pll-supply = <&vreg_l6b>;
 
 	orientation-switch;
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index ae5daeac8..179c944a6 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -769,8 +769,8 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l9d>;
-	vdda-pll-supply = <&vreg_l4d>;
+	vdda-phy-supply = <&vreg_l4d>;
+	vdda-pll-supply = <&vreg_l6d>;
 
 	orientation-switch;
 
@@ -806,8 +806,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4b>;
-	vdda-pll-supply = <&vreg_l3b>;
+	vdda-phy-supply = <&vreg_l3b>;
+	vdda-pll-supply = <&vreg_l6b>;
 
 	orientation-switch;
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index fa9d94105..d73b45d54 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -1003,7 +1003,7 @@ &usb_0_hsphy {
 
 &usb_0_qmpphy {
 	vdda-phy-supply = <&vreg_l4d>;
-	vdda-pll-supply = <&vreg_l9d>;
+	vdda-pll-supply = <&vreg_l6d>;
 
 	orientation-switch;
 
@@ -1040,7 +1040,7 @@ &usb_1_hsphy {
 
 &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l3b>;
-	vdda-pll-supply = <&vreg_l4b>;
+	vdda-pll-supply = <&vreg_l6b>;
 
 	orientation-switch;
 
-- 
2.47.1



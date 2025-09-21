Return-Path: <linux-arm-msm+bounces-74319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71ECB8D3E1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 05:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 617973BDEFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 03:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78FC212556;
	Sun, 21 Sep 2025 03:08:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958B4205E26;
	Sun, 21 Sep 2025 03:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.252
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758424103; cv=pass; b=tvXkJS+iryZX7O2FAGbzMXfI/Fdj2E6pndSDvqrUyMSN5anerKnunJEAfUO4yi18lnXURGBKSMLOJmHye+zdjlLYDUXLXKDafTc2EGCvhy2cubKrKE2RnVKEPtWssCwbdl+gubF9AsnkJ/VMvjpsMoU95RO7M5rNBp1t8uQvmIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758424103; c=relaxed/simple;
	bh=7QBfJERj/R13Wu4ZxQg0DmS4N7GfiO6Y2FuyU/Ti2dQ=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=PUFZFQy0NVEvKfsixio5iyEUrQZDk0hP01L7QJ80tzqaQSvJOsUdKpbA/BNrjED0YAbMtl4Ppz4MXjMBe3EIco8Pm0SqXh3jQOow0ujjJUAqSq9FmoilIEdUCWmzavmYtk9uBpUpe27QNbi8iimCeMp6DbD5Cd1fY+CLVHYpu/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.218.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 508E16C0B24;
	Sun, 21 Sep 2025 03:08:15 +0000 (UTC)
Received: from uk-fast-smtpout7.hostinger.io (trex-blue-1.trex.outbound.svc.cluster.local [100.108.158.238])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7AC576C0A60;
	Sun, 21 Sep 2025 03:08:10 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758424092; a=rsa-sha256;
	cv=none;
	b=uvigXCkxrxdQj3ezmo39NRpShDdj5dFgHs7jo7e3q/1PcPJ36xiDFfhDjZ7Z3xH+BHi8nr
	djXe6DW2Kg6Lw196gb3S/edmhHaTx6a5TQ8vadF0HkCXvQOky3SUOs6Pmf9U/0qk4fqZGt
	Z7LiB53ml9YkjZek7j6C6zNMGcmMP14JaEaX1XcDbKQekSWdC6IeErsOan3IZmuJswdnKU
	MKhylEnvxShd7cmVPT31PP2t7ebEehVu4cmmE6tHbeA0bAMJIu6e9NXauIBOGIqGKm6xKF
	e/dC0OO3dxSonNNDVhbWVc01kQx4ykJhkotnQs3J+Rch+XcDaGaHM76yKCzmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758424092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHAgQ3TlBbWzvqZdyf51SUIFeKuMgwkAx5vZHB/9HlI=;
	b=t7/6ACL6ahrpZXBwCuQC5WVUgoaLd+0f/kmwhENrcuRykWtQQASSJ/1iCUEQtXYEvySHfs
	sl4QbodVfJZr0AdR5ZgfALTDsJyzdBMP4x2qXQuYwXfwF0bd35OeKi8KSXUpQdSgLkdFN6
	7gkRYt5z8NpAumyhP1qZ9MJ/fN6OFlu6BWOdD58aM62Buq4g06OxwiPQCbbc7JgYMU4p6T
	r+D/jDfXuW8+Esx2uMi5k7u2ZsnO25v6E7wChGuKuyN2/KUiRsNJn+A2U3s9VwkOW4LCcf
	If7QoFwraCgSU4ucp0/nKF/6ci3NSfza/POdP60TUaS4ogBNas8d4DFBsZQC8g==
ARC-Authentication-Results: i=1;
	rspamd-5b85487794-f4lt5;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Celery-Industry: 0a045ac07fed409c_1758424095226_217642135
X-MC-Loop-Signature: 1758424095226:1609853650
X-MC-Ingress-Time: 1758424095226
Received: from uk-fast-smtpout7.hostinger.io (uk-fast-smtpout7.hostinger.io
 [31.220.23.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.158.238 (trex/7.1.3);
	Sun, 21 Sep 2025 03:08:15 +0000
Received: from [172.17.0.2] (unknown [180.253.43.125])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cTrln4K3kzHTnHY;
	Sun, 21 Sep 2025 03:08:05 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 2/5] ARM: dts: qcom: msm8960: inline
 qcom-msm8960-pins.dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-msm8960-reorder-v2-2-26c478366d21@smankusors.com>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
In-Reply-To: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>, 
 Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758424077; l=3822;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=7QBfJERj/R13Wu4ZxQg0DmS4N7GfiO6Y2FuyU/Ti2dQ=;
 b=RL+M3Ycpfg03ZLP+dggTmRGKFgPQ3Rh8pNc9kRiTAHs1ij/0X2OPJ2MXnQFcWf4Fu+L9R6wfj
 a5z3D0IGgxEDVvUxVpCnwQvAdSDnk8IEphhhJTstx5GkPdlbVuhUyB5
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 21 Sep 2025 03:08:05 +0000 (UTC)
X-CM-Envelope: MS4xfM6HIUgdI50BYd+DVFlnl5b+8V6OasnWz7MxSu+M8peczS47MU5hoI88zu7m4dsSgaHWJtCFiiupqPsznyR3GktTYOr0yoBjfEIIYoy+hNvLHueViUoh Z7toybrJEsybINDcGLoERUu+CDc/WkrMU2LyxZR4ZbQ6lF1Tx+bVpsP7HWqGEAGeD3P7dTxW/UAVpkZJnxuopFAaeMnoegmUZLw2kLYUjUrmE+LKr+MUeojQ 0KS9UxKUCQwJKocEivVUovjGf+Mqk4Wg60SEfbAHRetS+9ZrmH2iNmj79GS9ASyzNqmYmu/cpMQXIY/PcCDh6gNRxlQd9TLH3V4JpMmSTIztNnUjYOLmZX5R Ht1usLD2HZ+1lBhSbrFyNAj1z714gBnG33M80Fg3XdpxygBDOQ+aWjMh/D3n1FQUgYRA7eTzNkxGfVEFkQw5emcK/ixRCZpgqXjIKqZQK7/N+20lKsXx3zDy vA5IM9IdbbqIN2vNU1gu7Q2+Mf2+rR667rE43KsT7BzKycM9es3/sZ2XQjePQ6mlBvAJ5HON16pECYgatizE5jrjrXVAFD7cJnzARA==
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68cf6c18 a=hVqNbC/oQIbyndLMfyRB3g==:117 a=hVqNbC/oQIbyndLMfyRB3g==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=CxMuIbg76hbZoAQaLtoA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

Inline qcom-msm8960-pins.dtsi into the main SoC dtsi. Most Qualcomm
SoCs embed their TLMM definitions directly, with only msm8960 and
apq8064 using a separate pins file. After this change, only apq8064
remains split.

This is a cosmetic change only, with no functional impact.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Tested-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi | 61 ---------------------------
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      | 59 +++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 62 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
deleted file mode 100644
index f18753e9f5ef3b8ebd33cb0ca0b2cfd1010b679c..0000000000000000000000000000000000000000
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-&msmgpio {
-	i2c3_default_state: i2c3-default-state {
-		i2c3-pins {
-			pins = "gpio16", "gpio17";
-			function = "gsbi3";
-			drive-strength = <8>;
-			bias-disable;
-		};
-	};
-
-	i2c3_sleep_state: i2c3-sleep-state {
-		i2c3-pins {
-			pins = "gpio16", "gpio17";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-bus-hold;
-		};
-	};
-
-	sdcc3_default_state: sdcc3-default-state {
-		clk-pins {
-			pins = "sdc3_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "sdc3_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "sdc3_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	sdcc3_sleep_state: sdcc3-sleep-state {
-		clk-pins {
-			pins = "sdc3_clk";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "sdc3_cmd";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "sdc3_data";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 6884f7f5b11889f9b28a2cf61890e50e1b1405dd..097baee47897408a581a578d18f912d6e3567dd8 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -130,6 +130,64 @@ msmgpio: pinctrl@800000 {
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+
+			i2c3_default_state: i2c3-default-state {
+				i2c3-pins {
+					pins = "gpio16", "gpio17";
+					function = "gsbi3";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c3_sleep_state: i2c3-sleep-state {
+				i2c3-pins {
+					pins = "gpio16", "gpio17";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
+			sdcc3_default_state: sdcc3-default-state {
+				clk-pins {
+					pins = "sdc3_clk";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc3_cmd";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc3_data";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
+			sdcc3_sleep_state: sdcc3-sleep-state {
+				clk-pins {
+					pins = "sdc3_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc3_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc3_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		gcc: clock-controller@900000 {
@@ -537,4 +595,3 @@ vsdcc_fixed: vsdcc-regulator {
 		regulator-always-on;
 	};
 };
-#include "qcom-msm8960-pins.dtsi"

-- 
2.34.1



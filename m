Return-Path: <linux-arm-msm+bounces-32595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA68987583
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FFD91F271E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064AA165EFA;
	Thu, 26 Sep 2024 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NE+Sgq9s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AE81607B4;
	Thu, 26 Sep 2024 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360561; cv=none; b=pk3i85i2sKAbWYIQBSBDnmAhHZxVPP6S/CCOzpM7mhapyCVnHQ/Yc8fiWkB/z1LP/BFO5SaHTcal+qpeMMghtTKDCTyUUnsC3cxe1MOkaEfkz7mo9DTAK08ZFoJhlvddl7f2ckzDSc4RnHKHKXIl9Zv/2kamENK6V5Eg02kzzMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360561; c=relaxed/simple;
	bh=ir13QocNhYd+dhLn3EnuWkM1Qmu0ZEM2VLHnjiH3yQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JvpMkbnsuvV2XWMr1Kt0uEj5zOdcLTNjN9Yte+P5SuwayvRvxXY83niroAAMaCrGXpbR+qlxrlasLjkkmZHxtpD8BF5uV57M3FAxuG97ON8YqcJWU4dzhTHEccGF8+/hvNp5Cp/KZZ/YTPqD17aaaLtUzlRN+cFqz6n5rrCtZfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NE+Sgq9s; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5356bb55224so1443026e87.0;
        Thu, 26 Sep 2024 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360559; x=1727965359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvySoi/ghyixyWjU8Kt/wXCcix2cx/dAsfKUKyMxVic=;
        b=NE+Sgq9sg0wPxpqXim21WoduwMyAA1QMsimQ+q4jtmwEuorAGDuND8fGgXWwbH7mLX
         BsiyxMmt9gNL/ES2BsuMkeHnSUkZ1aKe0tMSOHDi58+KCdROvgcjVshyUMK3zjA0wqwS
         fISkcVJRvDW5i9pXo5Vl6+S2gavZ8cAxtlVbcL6NotqpCIs7l6e6G5EK9X0p/ePi8Dz2
         uu9CImciBASoxrw+tjA8frgYaVpeSG3cYqsMjczwnTliSkBBMQwTmxzL4UT7gKfy8ClK
         2U68JeX+RRGfW0jtRHRSEFrWqndIW67WGg6smud3sCre3OhicH880N3FU3J+SHTvr9aG
         4ZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360559; x=1727965359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvySoi/ghyixyWjU8Kt/wXCcix2cx/dAsfKUKyMxVic=;
        b=F876Pw4MMNS9Q8CIdIHYMQ6ZRSJ2mYmwSqF79/j2nbXCuw57MwcJR+fiR6tzmqL+Hz
         paBvqU0mvA6MhxkC/XSljBqF+/x9X4X/Cl9EaBy0MXf6a6iGJW46GPG87MLH6D4d04Nk
         TMS0WdqcV9LIlRMhwpznipbuK8B2tn7i/OTu2eJckZFj3lBI8C8a5J6D0aO9oGtQIZoj
         GxYu425gBLIimc5ogIqEEVCIzIe58oGHx+t7jtr7OuxQ6zVyn0s793ooB1CSSzmi82d+
         FY98jacPuZjYXhuChr3TxzICrmEeSPe7Ob6G67Lwuvi+sfWt19Jnt6/vmpxfWdEbCC1O
         7JZw==
X-Forwarded-Encrypted: i=1; AJvYcCV0F8kDYRllR4BxwkcR53VHYZSlnzy34oJm2zE1UYZkTigYKXWSn0qY2gJK0jclR8bin9ojCub8HJ8exKeQ@vger.kernel.org, AJvYcCXoAkzkYf+ZqyXMA4sMjaqEm5/8p9HXrc360lcy0Jj5h7wIu3YzQxvWRGzwv8GmwcdoiukcCdUoudN2@vger.kernel.org
X-Gm-Message-State: AOJu0YxqU4gLVWUbO4sJTKsb+moiXMuWxYdWCMalx8WiEc5mdiiEmRvy
	y0YU2Mb6+DyWTFDMyxqIoj2R4cze4crEc6rO6VJHn8DgtABYqU+n
X-Google-Smtp-Source: AGHT+IFjFpkYJtDlsaqYWrniHFrgIgENrRffE//ZKPHAlbRLrM3iqa1Io8iVHs0TgVNR+oGhvGRxRQ==
X-Received: by 2002:a05:6512:ac7:b0:530:e323:b1cd with SMTP id 2adb3069b0e04-5387755cbccmr4493488e87.40.1727360558375;
        Thu, 26 Sep 2024 07:22:38 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:37 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:12 +0300
Subject: [PATCH v5 12/12] arm64: dts: qcom: starqltechn: add modem support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-12-d2084672ff2f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=2052;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=ir13QocNhYd+dhLn3EnuWkM1Qmu0ZEM2VLHnjiH3yQk=;
 b=bEETRA30IoUzTR2gDYXWVHNr5nJGA7MFNAi36GprdUBVIrQU5Ivmm0NVQDxDqAum8EeJ7Ewv+
 q6IHjlwa1TgDTGNqN21yz2wL9Eid+j1GSqt9MFJK6EZ/H3h45eZA81/
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for modem and ipa(IP Accelerator).
Add spss reserved memory node.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index f7cb09734d2f..0f2db2cfb1e7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -17,6 +17,8 @@
 #include "pm8998.dtsi"
 #include "sdm845-wcd9340.dtsi"
 
+/delete-node/ &rmtfs_mem;
+/delete-node/ &spss_mem;
 /delete-node/ &adsp_mem;
 /delete-node/ &slpi_mem;
 
@@ -91,15 +93,39 @@ memory@a1300000 {
 			pmsg-size = <0x40000>;
 		};
 
+		/*
+		 * It seems like reserving the old rmtfs_mem region is also needed to prevent
+		 * random crashes which are most likely modem related, more testing needed.
+		 */
+		removed_region: removed-region@88f00000 {
+			reg = <0 0x88f00000 0 0x1c00000>;
+			no-map;
+		};
+
 		slpi_mem: slpi@96700000 {
 			reg = <0 0x96700000 0 0xf00000>;
 			no-map;
 		};
 
+		spss_mem: spss@97700000 {
+			reg = <0 0x97700000 0 0x100000>;
+			no-map;
+		};
+
 		adsp_mem: memory@97800000 {
 			reg = <0 0x97800000 0 0x2000000>;
 			no-map;
 		};
+
+		rmtfs_mem: rmtfs-mem@fde00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xfde00000 0 0x202000>;
+			qcom,use-guard-pages;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
 	};
 
 	gpio_keys {
@@ -837,6 +863,19 @@ dai@5 {
 	};
 };
 
+&mss_pil {
+	firmware-name = "qcom/sdm845/starqltechn/mba.mbn",
+			"qcom/sdm845/starqltechn/modem.mbn";
+	status = "okay";
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sdm845/starqltechn/ipa_fws.mbn";
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };

-- 
2.39.2



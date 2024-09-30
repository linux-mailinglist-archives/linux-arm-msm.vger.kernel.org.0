Return-Path: <linux-arm-msm+bounces-32766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D3D989F62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 12:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7DAE1C21CC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 10:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EE518CBEE;
	Mon, 30 Sep 2024 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OVCf6QhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7529C18BC00
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 10:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727692256; cv=none; b=rBg9QbjCQBzvsAOQKIrzW/emwDW3RA+RCAvpCUVqRRbxhkylhyiXLM+/wug47y6WUEYFnFOZhB7SLj9rkV3mmdBxS5h73TGxXxoXolGnbKkJRWtAV+L/QhrrRdk2jDPizS+gDGO7I1Rm8AJi1OjnOYEGF9NBvwNcK5anCp3rqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727692256; c=relaxed/simple;
	bh=z4OTCnuC4b/PxGRdBA3ScXQQSanWoNuzXbQ0PxFnuUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxEJEMEnv+yW7SDqJISyDe+Cd5pj6EpPbXcX4gQga30mGzqkQhYwe/Cs5WWrsTVhSJ1tj6jt9oFhWCG2zhkSyd3opDkbHtxAGoFTnxB86KbuCGS9R1o3Yz6iZMA6GCmTb37iHJ6XhM/oYH7KmEYv+mCsbiAI5/4OgwJpoGoearc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OVCf6QhK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37ccc600466so1787340f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 03:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727692253; x=1728297053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLuE6Kt3jND6zsj6ih54O9B6soObllB8kH8sl+QVpiI=;
        b=OVCf6QhKTLAdNzd8HdV5KeHnLpHIqD1knVHgWYwQE6J6kQVoGKN8g/ZMh/LahLAu7S
         +gBZ4x5AJV+8raE+W8KFS+6wyq78Bg+jsk1TFQ4KypCy/Gt0DQVuQYAu/WayxqbmtxR0
         T0eo+OuWmL1LgMSLhbZe1FTtxONcA6UTbDQeKvzGcHJMW/N6Em8an5YjEFLnuKXs/U36
         afkBd24LAocZujuhvK1egATnI8OGI20JDvhzp98VwBZIebw3jbuJ60tIVR7eGdt8Qz5f
         4Yml/fYUMy+xAR9QHE0r4u5NOD4gzAU1HwuQfyJcbsFSj6hkto9NJ5inCsiSF+t2Hnlg
         XXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727692253; x=1728297053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLuE6Kt3jND6zsj6ih54O9B6soObllB8kH8sl+QVpiI=;
        b=VjiAEfmWjaVoRb4OSjr93mHWKA/vBAbYDfvRFsWYtgp7aBjon7UiF3yhfRe+Yswaz2
         GUZovNVqg/0G3jXlKqKuJ489Llx+1Vz9o7xAwO04PVr+dpylPihE+u9JluDLK5jp05hC
         ZMhsClRNxGf0u8n9upbUJscUZFCECYqZH3xMFLdhzJ/GpSR1y+XVTi4BKSVv+8M09OFG
         H+/Yx8TsIlxUbfNDo48AjETdomKgSXYziUqP4ODdocG1y2JPGfIqLiYKl/KxDk8LQJNL
         D5g/gB6FacOXR4ZqXsgO3yF5qqFCCDlU22tIZk9GHYXW8dyfNCJUUzx39b/razhBS24Z
         7+0A==
X-Gm-Message-State: AOJu0YzEO9xk8LfyMFVwe+Xdum6KdAVAbqE3vBmRAbJzESodWAfO+RQq
	tajer6u2t6l8yJ62DNaXoAKBz8mwmCZa2tYFzB6RqIGGoKIRx4V8znzY8ROAKVc=
X-Google-Smtp-Source: AGHT+IGj28uwxU/n46idJB00cek8od4LkzHfcNT5QP/eTd8Cm3jw+UKDEVe4rhhl1exsV4JnemjLYA==
X-Received: by 2002:a5d:420d:0:b0:37c:ccbe:39aa with SMTP id ffacd0b85a97d-37cd5b1088fmr6148057f8f.49.1727692252722;
        Mon, 30 Sep 2024 03:30:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd55a5414sm8835051f8f.0.2024.09.30.03.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:30:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 2/3] arm64: dts: qcom: sc8280xp-crd: enable bluetooth
Date: Mon, 30 Sep 2024 12:30:38 +0200
Message-ID: <20240930103041.49229-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930103041.49229-1-brgl@bgdev.pl>
References: <20240930103041.49229-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the bluetooth node for sc8280xp-crd and make it consume the outputs
from the PMU as per the new DT bindings contract.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 60 ++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 28721570c59f..109d7cc5ee4a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -20,6 +20,7 @@ aliases {
 		i2c4 = &i2c4;
 		i2c21 = &i2c21;
 		serial0 = &uart17;
+		serial1 = &uart2;
 	};
 
 	backlight: backlight {
@@ -275,10 +276,11 @@ usb1_sbu_mux: endpoint {
 	wcn6855-pmu {
 		compatible = "qcom,wcn6855-pmu";
 
-		pinctrl-0 = <&wlan_en>;
+		pinctrl-0 = <&bt_en>, <&wlan_en>;
 		pinctrl-names = "default";
 
 		wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
 
 		vddio-supply = <&vreg_s10b>;
 		vddaon-supply = <&vreg_s12b>;
@@ -747,6 +749,27 @@ &sdc2 {
 	status = "okay";
 };
 
+&uart2 {
+	pinctrl-0 = <&uart2_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
+
 &uart17 {
 	compatible = "qcom,geni-debug-uart";
 
@@ -892,6 +915,13 @@ hastings_reg_en: hastings-reg-en-state {
 &tlmm {
 	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
+	bt_en: bt-en-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio25";
 		function = "gpio";
@@ -1091,6 +1121,34 @@ reset-n-pins {
 		};
 	};
 
+	uart2_default: uart2-default-state {
+		cts-pins {
+			pins = "gpio121";
+			function = "qup2";
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio122";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio124";
+			function = "qup2";
+			bias-pull-up;
+		};
+
+		tx-pins {
+			pins = "gpio123";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio101";
-- 
2.30.2



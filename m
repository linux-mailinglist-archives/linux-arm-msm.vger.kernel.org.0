Return-Path: <linux-arm-msm+bounces-7471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BFB830A6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 17:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0AAA287E82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 16:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EC7224DF;
	Wed, 17 Jan 2024 16:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tPi4TmAT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818562232D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705507711; cv=none; b=KzwzdRCGVvz+spVlArJjOYchXj0ArZYfr5iwK73OwDaIWQ27KiVSXZ2x1lFSVs7G8c6qrAA9+8tmGr+JyUXfb0ZL4XZxsNtlPYaQFdWBmeQEz1c177ObQKYc/ZrgmyFSzN9B/kASl4Awb/7AejZYI8Z9ZgLUkdrzWBvxWo2aMmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705507711; c=relaxed/simple;
	bh=YJPbO02xZXC38YN0dl13MAiQwG58+JzZk9dqvuDQNpY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=AJ2pS6nPUCwnb3D7l/E/AuwEMcqOKLTDyEySh3Au5eX0fglbBcThDE2/+YeYEUWrQ375qUFo/vpvvYMU18XYd3pcRt43MFa6gkc7H/wPwYvGIuFs9qDLDSECvTRlO2tdiRdq7rWcf0ixS0kjC/XqJ2k4OWafQ9O4zOjECAkGRCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tPi4TmAT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cd46e7ae8fso124681301fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 08:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705507708; x=1706112508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6ddlML0IuZ2voh4C/FU4IMUf2JGddrkn1DncdKHaxQ=;
        b=tPi4TmATEZ+WCo1KmxFE7a/m27hO03JMdKpMp2mRXX70p7GFBW/MPukj3zYoJrpOvo
         dtxCvSjW/enVNxgzl4biz2aHxIKbhQCIJ4BGLvFwSWOzYtMmpVrvyxaUr8qPEygoyhOM
         ck9EoP79r9cqibm3ceO6GjjWSz45PZMRNO7hi1/3TQob5xmAgAC4oFNEolVyoXcK8GLP
         DdhmyFFvmE3kVhQAy9eiIP0tNJNHnQIBT4BfGCHm4xRXp/0C4pppWEXTprKHebK0Vg01
         4sRyyLNImHAc2yuv9IWnEQbswVvkwnzgL+JBBqkfhdv94Ed3uoLqVY5MJZ5R+3dWdQED
         /svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507708; x=1706112508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6ddlML0IuZ2voh4C/FU4IMUf2JGddrkn1DncdKHaxQ=;
        b=PscKz/oVTmWJhoYcR/FaQaM0WGtkBh6NO4y3P89K6qGDgUQa/wDq5klI4HrNlJOEkV
         MseDIyz3nkGbMGGskWGo4TJKXOFt5AL42QDeV12dfz1KzP5/qoko8dyNS3S+DkYkUhgF
         bMLYzJZDgus/yXIjGnIZwV9dYMuXPFmttLYvTcm4/bY6mD5E6OhxefN8z996tJ7FVE3D
         /k8DKmOxwmogRC7gBUQycBe8vuO2irGXzOH4+KG0CsqeKYi9vWJWdYoi40NYdzskzAHU
         ogtCgUkoB+UN88wLZB5zWMjKbHcNlx7ai9hts8KLg+rASKt5B6w/XHDa7sLsocDlp8xj
         XfgQ==
X-Gm-Message-State: AOJu0YzGbElJ43JVW4kx1HXcD/gWaNKqhtQn3uvNpPFMReLjhmALy1Xc
	e1a2o7s5W+qvRc/eD7XPWUQGF4UQ/VrdqQ==
X-Google-Smtp-Source: AGHT+IE3YdoLC4uwScnR5w55Pu9PiyAWHj/OoMWnvbsMPQP7TmJR26qtwHM6LtwrN5dVsvSXykJlIw==
X-Received: by 2002:a2e:961a:0:b0:2cd:b15:da81 with SMTP id v26-20020a2e961a000000b002cd0b15da81mr2041774ljh.171.1705507708393;
        Wed, 17 Jan 2024 08:08:28 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d0b5:43ec:48:baad])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d6a4a000000b00337b0374a3dsm1972092wrw.57.2024.01.17.08.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:08:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peng Fan <peng.fan@nxp.com>,
	Robert Richter <rrichter@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Lukas Wunner <lukas@wunner.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/9] arm64: dts: qcom: qrb5165-rb5: describe the WLAN module of QCA6390
Date: Wed, 17 Jan 2024 17:07:40 +0100
Message-Id: <20240117160748.37682-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240117160748.37682-1-brgl@bgdev.pl>
References: <20240117160748.37682-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the ath11k WLAN on-board the QCA6390 module. Include the
relevant regulators and the enable GPIO.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 29 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 10 ++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index cd0db4f31d4a..35a5d1ee45e5 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -734,6 +734,27 @@ &pcie0_phy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en_state>;
+
+		enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa1-supply = <&vreg_s2f_0p95>;
+		vddrfa2-supply = <&vreg_s8c_1p3>;
+		vddrfa3-supply = <&vreg_s5a_1p9>;
+		vddpcie1-supply = <&vreg_s8c_1p3>;
+		vddpcie2-supply = <&vreg_s5a_1p9>;
+	};
+};
+
 &pcie1 {
 	status = "okay";
 };
@@ -1303,6 +1324,14 @@ sdc2_card_det_n: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	wlan_en_state: wlan-default-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
 };
 
 &uart6 {
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 760501c1301a..fef9c314ce55 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2197,6 +2197,16 @@ pcie0: pcie@1c00000 {
 			dma-coherent;
 
 			status = "disabled";
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie0_phy: phy@1c06000 {
-- 
2.40.1



Return-Path: <linux-arm-msm+bounces-33362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 312D5992C7F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9B1C283213
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E846C1D0E24;
	Mon,  7 Oct 2024 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FroXhAIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A2218BC14;
	Mon,  7 Oct 2024 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728306159; cv=none; b=XLareVmL4D4VREty9r4IMsgoDPZ/qfZbFDf5p5F2wq9KUvmcweIfVjOxXLDoB98l5OFhbCNkwZiCZWeLQVwFbESmJIfMQlK7GbAXxSaw1O4yTkhYNbMdWTJM3GSzfygLViRzW7sxoINI5VXT2NWZ8fTmYx+ZbCve8l37DaBrmgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728306159; c=relaxed/simple;
	bh=wikcKEX649wF6wZpeFvNl3HiQFi46qad0PLBCHQAJog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwwl8C7R5uc3hIf1COxm2yToCKPMGke0yX7RTba5T41XKZHfoVdZFQpMEbr0KwSBFSdwvawqQWcTs6q3x89Cy5q+KPif0RdcFtDetEwC+yHj/F7c8aJWYfeh6RrhACiMQv8QM9RYr7Vp81v6QnzzEmHloR92c2LV9lMGcCi+a5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FroXhAIF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7e9f998e1e4so1514985a12.1;
        Mon, 07 Oct 2024 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728306158; x=1728910958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWMilAdAhXOxfk4TdLStJoaJ1G5RmvUuFw/ETpmqfO8=;
        b=FroXhAIFIwpOtWUyRKQUBYNmlw6JjkSdDJ80ENzJFLF9RGGFIfW4gGDkYGuRqlIBem
         CrkLfH02hTNCHh68MU6bbyGDp2356pz59GfKLZj1J0dpUI4FBl1OL3LEHFMrn5Qc9XIC
         ntUzhV8gNwgO/paotaI7lsoT1UITvGcBJkUE4PE6ZmNBOqhpx9vAfvKQTYJwFsSmR5gp
         vyag/9uTE4zKqfYIHVcGL5hE08FwrZYRMCCyHPnj9c7TWvfDFKLV/9PxjQnouDzdmCwv
         O0+pg8qd/O1SFWrDRH5WnVuxSD9il2pjE4cAuoemzXFd7DpZZ1Tv7ZtgbjkB/ux9li6x
         f3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728306158; x=1728910958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWMilAdAhXOxfk4TdLStJoaJ1G5RmvUuFw/ETpmqfO8=;
        b=aiV87bTSZa9RAmVfv2xhKF1VbRzb2LeFeF5JqpIzOsur7rUQ1oqE95lThZK7DZanWB
         hvcQZoIiX2fxvjMeh3Lqn+4bDzTWKpC+3LAgzxjSyr06eeyBceXQzjPE4hzApbJfbPpH
         HqO+it7yb2Ck43+UBxD2ENjHHTp5y3Id2yQAPM2EOHHoJOhZU/XrY51ftrvRUNyyuIU8
         Y5b0BeNBM+rQXZ1ipQmnBGCjOKFmT41KbgpivT+OIdJcyedvmBtd20kutSYrEjV/o9KS
         TkEe2B9CZ79qZ9M3oi62MWBLyRddnOtoH9EKg0h3O2LvA/nbAhbavi2P0SKwdUemM9dO
         6+RA==
X-Forwarded-Encrypted: i=1; AJvYcCVFStNoW5JXWgaGSLE8cld2jJphcMGGvdpICEXPfT8nkMDTa1lq4/S8AzKW82eaFeUp+elORosHksf7eoa2@vger.kernel.org, AJvYcCX8nmxTMT4VWgG+2UAM7EwNlPgYEfgBxtgCesNPcZ0d9zR3C+vdRvI7iuby0ZUaACyawR/ttNtFld9Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8J5Rj77kd+V+AEphwurzz2D6a5wa4LWXjTDa/l3eCfSyEDvQ8
	QYhvaeB5FOXTYhtk8sApU9nxeGOT0lUJ2/H+yjNjVL6RQq6cKT2B
X-Google-Smtp-Source: AGHT+IGNUSBKOHPdq8ZkRSZF/M2tlelAs87E7dApEhcF1aDWG6JeTrj/gl/a6o1XgptXcmacfg3L7g==
X-Received: by 2002:a17:90a:db8b:b0:2e0:7495:93bb with SMTP id 98e67ed59e1d1-2e1e631e1b0mr13471545a91.31.1728306157731;
        Mon, 07 Oct 2024 06:02:37 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b128847sm5306654a91.49.2024.10.07.06.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:02:37 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Jianhua Lu <lujianhua000@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
Date: Mon,  7 Oct 2024 21:02:49 +0800
Message-ID: <20241007130251.125022-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add qca6390-pmu node, which is used to manage power supply sequence for wifi and
bluetooth on sm8250 soc based devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
changes in v2:
1. pick up Dmitry Baryshkov's Reviewed-by

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 3596dd328c31..ebea283f56ea 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -97,6 +97,67 @@ key-vol-up {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p35>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p35>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -701,6 +762,22 @@ &slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <40 4>;
+
+	bt_en_state: bt-default-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
+
+	wlan_en_state: wlan-default-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
 };
 
 &usb_1 {
-- 
2.46.0



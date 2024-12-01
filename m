Return-Path: <linux-arm-msm+bounces-39764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE0D9DF5E1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 14:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23076B212DE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 13:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A491D2B14;
	Sun,  1 Dec 2024 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ltcslp+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FF41D2B0C;
	Sun,  1 Dec 2024 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733061414; cv=none; b=t34LU1FFIdl4vjNCE16bgX1kFg9YrJTRaN4BNyhi9ANB9/PM7Ylk8eASHwf10BAGzaWNZfjHOxGsgB0IH2bbiZuDXA7giDh1lCRH7GIVK8oaAZrJZ0ALXste6V91NpyMRfei83qpRfG7XKqadfUxRLPCzRsNN6nTGLrZu3tXwzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733061414; c=relaxed/simple;
	bh=3ZnVMH51B8uXaY/kGCseLC7JnGM/ka3saQw3hNGo9Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KESPl+f698iFxLooMk2C/kCVFFwPS14sE1IbFQsrK4syQXOxCeSUVi+jaoQp22fASaNshixN9rDdR6sZXV8K2QX0BMPY0T29mRr6H167aTtNbd5XarZou7iL+VjctCWFYqJ1p8NfkkX1uvmkVpvTPel2Bc3HBkO8WuXoiPWYpPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ltcslp+v; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fbc1ca1046so2981696a12.0;
        Sun, 01 Dec 2024 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733061412; x=1733666212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68qOEfz1vPxOdGT/qDD3DqkJMDn+2pl3Ld7n516swbc=;
        b=Ltcslp+vq2s32ycSyk5+c7Fd4I0IORcyWKdWAQjekCo8OLYJbXTC3q8vu4fCH/mhn7
         cpBf3DcRAmWwY6+GUTjqTi/mqLqwpvcELgcsdK78JXvCT/ypLBey0uz1D/e2qBE6PHEh
         /gApv5Y8cM4hDv3H/AC2mT+hAcwvYsGdbu7/PdZ2OO2x4Q9EF+/+WXJVHSjzdMOR1pto
         tEXjiXb9i3unK+LaYkRr7O7w2sXrWLnHxk7cHcFyN9I6J1H+1L1H5tFTJpky2nDXQSua
         3yYzVwoYcdUjiMgQdeLiEHG0egOwggfXbdQkuhv0h2h35ExdytrkDpmN2gQu1KmOCjPh
         sZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733061412; x=1733666212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68qOEfz1vPxOdGT/qDD3DqkJMDn+2pl3Ld7n516swbc=;
        b=vOPdRuzvPGJukcPtJhVkM6J7xoLj9rB4Iv0svYniofOejD2F9FoTvXzKfd480UzoRs
         nhBmh8w5XEwfPhOSzZe4APYU63Os1G8UgtYnoda68X0HrY11ANUcKkKfmbBAT1CnK5aH
         6AUxQDJSsCCi3qjvl55BQE0Yx5iTZFUunKnLz6ahfXTzrTFv6Q611poliwuK7d3RQhcZ
         bM0h+uXm9sHBHRgE5JPNGSH4x5v49Uxa1EziWYpPSKA6DK2X5GMLNUBFOcv5EzNe8Lug
         JKL5FlMrfdhgPdRHDc2BUV0SyRb11eZZZZXQd9HQ1uZ7QqgpMneynhB9ODuqXJZGCmvn
         E2aA==
X-Forwarded-Encrypted: i=1; AJvYcCXEP70JibSdNiaiYxNwmdboZoBmCRzOwX7FiRZmRRP5GD9mX199twJC13azmxs/vVaXH/cq5jfBlEak@vger.kernel.org, AJvYcCXMSo6xO/WdRhStGAkVu9RhaCR/oL7jxCCnU5dxDTtSUoqBiepjynYav35ldIZqLFzJnoU9sps4lGyX3ipu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6y08SCcRCFWU35q4H4aThA0bmm3MYEKzAge0+DkP67xy4SToM
	5T5jJLTthlTdC4uTlXCSxE1cLZYKzGQBBuOeZDJyx5AT25jwD3yD37VFaw==
X-Gm-Gg: ASbGncuDCT04IUAwdYeftzpLP95wntD/JwFSRT7goJ4VhO6NhiHx4v3C7Sv4Lk9jWSl
	helcHcfvuhJz0PMvcm1Ke6tf3HjLTAxWwgPx9g6CZEVLOi3VpRx0QCzepRNha5zPyj+7S+5g9Qz
	COaJYIol8JsOEEgY69oR2UaanqnhKZ3WY0gx7DJs4LdMsPT85fBTl1a+bZagz/BfqXV1dboLa0c
	HrbaT1D0TtYzh70Yri1n4ZV3AAYZKt4a7M1xk4aPIPvCvgoVSmC5mYJsUdvLmnZJbmw
X-Google-Smtp-Source: AGHT+IEcWG91ybB3pH0MNUfESzU2Qoj4urY068Bf5W2w9eg8ERP80rvYwF6TBYDBIFki5QYZeDhoDw==
X-Received: by 2002:a17:90b:54c4:b0:2ea:7cd5:4ad6 with SMTP id 98e67ed59e1d1-2ee097e3f10mr21172187a91.32.1733061411488;
        Sun, 01 Dec 2024 05:56:51 -0800 (PST)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c30e2d8sm5260617a12.38.2024.12.01.05.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 05:56:50 -0800 (PST)
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH v4 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
Date: Sun,  1 Dec 2024 21:57:14 +0800
Message-ID: <20241201135716.141691-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.47.0
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
No changes in v4.

No changes in v3.

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
2.47.0



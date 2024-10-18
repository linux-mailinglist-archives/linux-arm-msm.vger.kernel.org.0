Return-Path: <linux-arm-msm+bounces-34962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249C9A3ECC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 14:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E83D2866C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158911F4289;
	Fri, 18 Oct 2024 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QNudas2H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1321D7E30
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729255789; cv=none; b=gXvcDNsg0W5fPxPb9SKzfb32MNr0ftVAnY01ouSp10PbwE51KemZjoFk1fUywgIouIvhqq2QpmH3kcrIV+4Nl+SQ+FNw43I+X4X88pUAYROaccN6Gj6UGLPZPfVn8fKOTgzh4XmFpDn4CFobD1Btr1El4HVFq/Ibe686Gv3WFjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729255789; c=relaxed/simple;
	bh=3k37DmjvVVitbZLKPGImu5/pI96IV+YohC0dbWztqgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dg3Z66UsvxjufTVR0hGBZPU60qZDftuNIpwovdItpAxdtrxrU2RAggTSGZ2SVRqxYvnFdfqA8TruhYw0xuRHsTCdEHA2/M5QeHBnazAJ95U/3aEdg7v0k6KQOQ281wStodT0R3FzxqymRBRPF9Fl3raSGEgMgkF10asLMSmEDl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QNudas2H; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so6027935e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729255785; x=1729860585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cqwZVP+zqyJHBNtjkA+B0HPwS7hbZ/3iwJT6bTaS8o=;
        b=QNudas2HMPcXKznENmgH9tD2OK++aB2Ivs6ErTx3uesmUaeYvtr2l3bVNRNue0ez5w
         paX+VUlr1/FxjXZLF7Asto5JgJyxZ7SE3z0mMLaG+hgS064kX43jjXJt+z+9TQemoP5e
         HlGhrGaxw9K9zchwdxVD7pZ5WSwlmldosrNLK+Iv6t33Pz6FYBJGz5gSvwZ1zpq4Cxrd
         KmBa3SlIaUQJLRIxu1Evb8NcubO4NbamgN5YzRcMLvn7EiBPK53LTakjVVicIFpSKcwf
         dKv8+EVMVYyzyNnPeuUJcdXRakFXWKr4eJBvzNEtWYvoTelosc9pYLc3iGnNCCFEZaX+
         WfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729255785; x=1729860585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cqwZVP+zqyJHBNtjkA+B0HPwS7hbZ/3iwJT6bTaS8o=;
        b=H4TZdrSDWo1L4LfNN6TGt+PbhVECZswlNFA6Fx8qUvcrckthV4MzwnRfFyKNbYX3K/
         FI8N19e7sHGecozEZeZljWyzJDRxhfIHm3sgAob46xNbsty8OyDXt0H0Mq9olEU+WXl7
         bnsWMvsDoco+VcjEQz2a0OvBJUehywuAGONwRjyvDlbuLke+/kfobZ9vS1A0UhyibKbi
         pgW4DuAlVg2WT7bT+qzswyAkfgorznyw62m0lfCGxa2B3vL3xzO8K+wpx8eah4XWd/7b
         +ZZEb4svEn506fsoZ++ph7t+Vlgb/FsKLrY+OeESm/ef0I2T5TUU2pGgZY2iJIKT1AoG
         vl1w==
X-Gm-Message-State: AOJu0YwzGNwmDb+kaUWCWmT2JBSFJHMnGLJPHUP4Rb75pM+rFoYkOWXq
	IH9KzTx5DSuc8tVyRHVbhgBo3mwPHSalYJs7FRMvI20c4maW/0vvTb0ebGvDSqo=
X-Google-Smtp-Source: AGHT+IHLkVNVhQBqO7zNNKeqKThK+CBSku3/uu/wTH7YA3otDEk1NvjE+42e7TZmZ+HlcqalO8sWIQ==
X-Received: by 2002:a05:600c:468a:b0:431:5187:28dd with SMTP id 5b1f17b1804b1-4316168edc6mr19255125e9.28.1729255785071;
        Fri, 18 Oct 2024 05:49:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:45a3:93e:5196:d8ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160695d8fsm26640835e9.27.2024.10.18.05.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:49:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 18 Oct 2024 14:49:16 +0200
Subject: [PATCH v6 6/6] arm64: dts: qcom: sm8450-hdk: model the PMU of the
 on-board wcn6855
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-sc8280xp-pwrseq-v6-6-8da8310d9564@linaro.org>
References: <20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>
In-Reply-To: <20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5563;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1R0dZeOAv50eWbW4Hszj2kUWLcatmibvSfqEpRoAU7g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEllgjbd04ztjzNExSs78CJOOz337EN0NxtRd/
 6gbQKZKbQaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxJZYAAKCRARpy6gFHHX
 ch9mEADBKXRTjzn7x8VnOkmoocbJwx64bVMcwPh/++m2yzmBzTYKWIiwWrB7R8Ely+i6yH75N0G
 TEzdL22l49vqCuAKbnegOKtBLnhn8pDheNcnaLLDYU46aDwZIDLwGnRWVroEOizyZTDb/IaFEsf
 mQ+LSu77Via9GacpG5/UgMlxhxuxP6lEO95y+FnYPOx7PlKLnu/PkdPlH3NrGmLGTofa+FOSspm
 qTVyT3CPQesxgSTYlcx6wLHkZ+YSV303q+GYCXh3zIG4BzDGe1jTEP+RW/Gad/QeUbWYMhuwoIY
 bpMk7KxNIpQxmGGoJ7yrK7i1ykdb79auFjNePh9DsBnPFptJkEjqxjwTy1LpCUMOHSbpWpfhNjT
 dlurZvNDmx0aeMxeObhq3yR8/ZjpTMLLTiWeFLlW84JN4ES5Djix2EDVDMCdoOBJjbNkyYOsLID
 KW+bLfXEfC/RNFofJhYmW/UTbLMg9n/LSi0xlGSVmeEcnoPNjT3DT+jW2+8akBaZ9e5QYMPGJkG
 PqLjKONZIZsrs4c3UPNO6OfziRdpAb3rB+BPc3CazgDHAbImkJH8Yor7LAT33osfUWkf6d7zH5Q
 NJcTCrerA4ERcNub+h7JGId1Nt3BPY8kLQrIcdtiMW25/s/MMGQlmwc78GOLggdCPCbNlqe1x8B
 O9WGTT60S76XGAA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add nodes for the WCN6855 PMU, the WLAN and BT modules and relevant
regulators and pin functions to fully describe how the wifi is actually
wired on this platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 157 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    |   2 +-
 2 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 67443822653d..2ff40a120aad 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -26,6 +26,7 @@ / {
 
 	aliases {
 		serial0 = &uart7;
+		serial1 = &uart20;
 	};
 
 	wcd938x: audio-codec {
@@ -247,6 +248,71 @@ active-config0 {
 		};
 	};
 
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&bt_en>, <&wlan_en>, <&xo_clk_default>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 82 GPIO_ACTIVE_HIGH>;
+		xo-clk-gpios = <&tlmm 204 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_s10b_1p8>;
+		vddaon-supply = <&vreg_s11b_0p95>;
+		vddpmu-supply = <&vreg_s12b_1p25>;
+		vddpmumx-supply = <&vreg_s2e_0p85>;
+		vddpmucx-supply = <&vreg_s11b_0p95>;
+		vddrfa0p95-supply = <&vreg_s11b_0p95>;
+		vddrfa1p3-supply = <&vreg_s12b_1p25>;
+		vddrfa1p9-supply = <&vreg_s1c_1p86>;
+		vddpcie1p3-supply = <&vreg_s12b_1p25>;
+		vddpcie1p9-supply = <&vreg_s1c_1p86>;
+
+		regulators {
+			vreg_pmu_rfa_cmn_0p8: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			};
+
+			vreg_pmu_aon_0p8: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p8";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p8: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p8";
+			};
+
+			vreg_pmu_btcmx_0p8: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p8";
+			};
+
+			vreg_pmu_pcie_1p8: ldo5 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo6 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_rfa_0p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo8 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo9 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -685,6 +751,23 @@ &pcie0_phy {
 	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &pcie1 {
 	status = "okay";
 };
@@ -892,6 +975,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default", "sleep";
@@ -1069,6 +1156,26 @@ &uart7 {
 	status = "okay";
 };
 
+&uart20 {
+	pinctrl-0 = <&uart20_default>;
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
 &ufs_mem_hc {
 	status = "okay";
 
@@ -1130,6 +1237,14 @@ &vamacro {
 };
 
 &tlmm {
+	bt_en: bt-en-state {
+		pins = "gpio81";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-down;
+	};
+
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio1";
 		function = "gpio";
@@ -1153,4 +1268,46 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-down;
+	};
+
+	uart20_default: uart20-default-state {
+		cts-pins {
+			pins = "gpio76";
+			function = "qup20";
+			bias-disable;
+		};
+
+		rts-pins {
+			pins = "gpio77";
+			function = "qup20";
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio78";
+			function = "qup20";
+			bias-disable;
+		};
+
+		tx-pins {
+			pins = "gpio79";
+			function = "qup20";
+			bias-disable;
+		};
+	};
+
+	xo_clk_default: xo-clk-state {
+		pins = "gpio204";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-down;
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 1b5dc5b8cecb..be876a919455 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1880,7 +1880,7 @@ opp-8000000 {
 				};
 			};
 
-			pcie@0 {
+			pcieport0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.43.0



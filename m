Return-Path: <linux-arm-msm+bounces-55466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FF7A9B436
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 18:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDC1D9A62BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC432820D5;
	Thu, 24 Apr 2025 16:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwbsIxg1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66369129A78
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512388; cv=none; b=oPSoKr1j0N4xrM9c2Pb79hK17l9ihiK2BkFAUL8I9g9gFjW3g0kh8pP+fIygouJtT1BWpgPtp/Sd8B1sAUL8Y3iNsQ4l4b/uFhNB/FugKItniI34wgFAlzdij2CyUMvqUYKAWtxiQskpfgJa8Q5/F5GOpz6fdAF+mcIUT0pp/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512388; c=relaxed/simple;
	bh=7SlgpGzEaVXrpJ6Gf/0SoK96Vq7Xa4U+yIvQ1crKXhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ww6Xhl2f4n1GekflhwPKgc3aCm6khwwREWo+rnubQnlyqjOkXTqMSiGsMACAa5eUcZmxM6koBoycCSCPgf5Pmv64RmHsnzRHNLxyiSpmTot4CPL5eB6xR4qR9+SjJr4zH1cJZCI2e8/a4X5LrJeYdiD9Q+R0ZcvqXJRRE3ACoks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwbsIxg1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso8746555e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745512384; x=1746117184; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/y5+NUwWZH6Udo1LfkO6ZqzWAb6VKbirQ7E8hAubGaM=;
        b=VwbsIxg1FQPZrrVRXcYiWjCgQyFQbNONWBP2iTX92XDczPKsCMiGwdrmc/RCAQNtCw
         ISS7nIGsyP1c0VQxUImV3MLxU8VnPOQj90Uj6JWzplkPtrCdXtCNR/5fgrL20x054+Hz
         y/+JRpIkWe1sozsJqHM50FH4tECaXZ1Ww9h4HYRKwmTeQ8gsLafRVXihNthZdDMD3PNx
         l030+WTeCC/YZTjZmGIbGKaMKx2WCLnWv5xu0dti+qMSa0PJaa85LvJoJ9Eqk/peBL/i
         lyy64YnNOeAnZxZNpZamZD4xvphbhAWFfe7z6dygdyc6gaNKDRXbrJLR7hm/pzQMRuo2
         W1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512384; x=1746117184;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/y5+NUwWZH6Udo1LfkO6ZqzWAb6VKbirQ7E8hAubGaM=;
        b=Lrk+qtndmzgU39+dGZeS3hgDl3jbxKaXWcZNThrzLtRuT8vOSE6YLcasdaEZ2mmBY7
         Rmmw9BjnYJTNlPqJupglh88ML3DudTOHPersBcLhQeAsuubcLNMYK1t306QZnroIj/36
         6jjfjzL0kLnEjjtNIVqYeC7NHg2C3far3Z5qJYsYQq8jtpGPFYuFP5BA7eCged1thbap
         3Cvi/JSXWQYq4ctKfriliBxlMcjbL+i/m9j33sADmouZYGCbPi61dkfqb56RilYSZzFP
         JXcWH5SnYB8j7340chM1HRBq5SjO/3uMMnLV5SZMnsbis5t61hmEtxa1b4x+I9IeX3ak
         VZYA==
X-Gm-Message-State: AOJu0YxxTFszx5orDMJ4wD4YnNsIq3i39a5Aj1ej3hOgJvMVB36yNCxm
	TvJ3cw7p1+Y+C0AK0qB5LaL39piupwsrA0lqTwyCUe7ESzmIpI8JbMSthkglXnU=
X-Gm-Gg: ASbGncv/Cz+cv+kBHzJBoEA26ky9VUiWCRJYrjyzfqWol88xrrjNrXtaJAcZpKhVpjo
	otT5s/4244GwAXs3trcGfZ+2/BQfKHJBdiEsNmlUayES3x3liaC1t22WcdzQwBHKaKq6N4PADMv
	WVy9+f//fK0yNaYImOocRhsrO4usfupyBeHjcjrIaGLYWvO/Pi/wKLFA2JfwwKZg2JcbXb+S+as
	SxYCCvBzZEhyP81b99ICFmHb5I4ssAz2YZo7MZvAh0O3v1/utcwe1+pwrHVdmPZ0Hv9FNpVNUgO
	5uDUqUOGsWnTEHkEWJH4+DOHdlPL4kTjd8DTFijxdW8Za5RIgpRpVOayLIdCgQ==
X-Google-Smtp-Source: AGHT+IEg9Pmnn6oi97OyXXdxvc+YBHTYhGAgb0Sc/RWpG0VisdPPCObrcY82XTvGAmWPmvT7RAtnLQ==
X-Received: by 2002:a05:600c:3d0b:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-4409bd09f95mr35596045e9.2.1745512382397;
        Thu, 24 Apr 2025 09:33:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2ac0sm27200995e9.15.2025.04.24.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:33:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 24 Apr 2025 18:32:58 +0200
Subject: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
X-B4-Tracking: v=1; b=H4sIALlnCmgC/5WNQQ6CMBAAv0J6dk3bUFI9+Q/CocICmwglu5VgC
 H+38gOPM4eZXQkyoah7sSvGlYTinMFeCtWOYR4QqMusrLZOl8ZDigu1IJPfnIb3IokxTEBMAr7
 KqkvQ2bYqg7s57XqVQwtjT9s5qZvMI0mK/Dmfq/nZv/KrAQNehyqg08/e6MeL5sDxGnlQzXEcX
 zcrpk/VAAAA
X-Change-ID: 20250418-topic-sm8x50-upstream-iris-8650-dt-d2c64a59505f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5173;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7SlgpGzEaVXrpJ6Gf/0SoK96Vq7Xa4U+yIvQ1crKXhg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoCme9kW437eZ1OYlsdNpBY145UiocVvUVuDnEVrKx
 n8eQ1GKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaApnvQAKCRB33NvayMhJ0WeCEA
 C7DcdYhFK1XK/fLFvwRyxNU95zLJX+xE7B0D+hptJEy5BpDQcpIgJMGwlriTvX3uHf+3/HC/XoXRKI
 qGPRtAI7sWBGiNw8w1t9FjfjpPQA0os2z5qL+QMPDUZvqZUWXLv7nXVY0mV1lYwLU6BelSMfiaJI5u
 FZq+/IjvskQKD8DxMgnSx9LiclkgCJPnAny0lqeVluSLdiVndwysteiJnIp/nxxsKq2XOp5epREZms
 u9RaKjoFP28qJX6R+/oYkomgX1x8JIh6NaeQNGTCFV4nrYSAIoPZcMdpuGaU95iH4eR1PkaZAxuenO
 Tf5Sd33EN0WhLKSwGyysMWx45CXOGnvj4yJb7m2VWrSFxnKw3GGZq+rOX/2CwRU0Iy0Y/M98JWVyWX
 S5VSAt05GpJSzqbK40QWMlY0q0ReJ6++THfpZXhp8InIBj3tTYveLm3ezk+WDA62uj+sFrH0PLUq0/
 YJmRjqGo2NeBae2dAv7oK5PYJt2yO6ZkwpWm1eSGrWMSBGfrxAQr9CwHs9UEUAP7VrN42Bmk8zE6Y1
 DkVY+4IsiIIo+66ZEC/C1YpTy0fUhAMOKCagbLhXpLtRJ6tuxWRoYVN/YYtuvzNgpMeG9jmxxxo55O
 D0iIsi7hX64N4jwESWSVP6vgkIGsZHop4hhZN19ZEdRgImZx2ze/owWQQJjQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add DT entries for the sm8650 iris decoder.

Since the firmware is required to be signed, only enable
on Qualcomm development boards where the firmware is
available.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- removed useless firmware-name
- Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 94 +++++++++++++++++++++++++++++++++
 4 files changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index d0912735b54e5090f9f213c2c9341e03effbbbff..259649d7dcd768ecf93c9473adc1738e7d715b6c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -894,6 +894,10 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 76ef43c10f77d8329ccf0a05c9d590a46372315f..8a957adbfb383411153506e46d4c9acfb02e3114 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -585,6 +585,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio21";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 71033fba21b56bc63620dca3e453c14191739675..7552d5d3fb4020e61d47242b447c9ecbec5f8d55 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -824,6 +824,10 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c2937f7217943c4ca91a91eadc8259b2d6a01372..9afde0582ec9b8fef44c0af0324bfae9b20d1d60 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4955,6 +4955,100 @@ opp-202000000 {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8650-iris";
+			reg = <0 0x0aa00000 0 0xf0000>;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			/* FW load region */
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_XO_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus",
+				      "xo",
+				      "core";
+
+			iommus = <&apps_smmu 0x1940 0>,
+				 <&apps_smmu 0x1947 0>;
+
+			dma-coherent;
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable in boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-196000000 {
+					opp-hz = /bits/ 64 <196000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-380000000 {
+					opp-hz = /bits/ 64 <380000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-435000000 {
+					opp-hz = /bits/ 64 <435000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334>;
+					required-opps = <&rpmhpd_opp_turbo_l1>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8650-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

---
base-commit: a7dca088884312d607fff89f2666c670cb7073ac
change-id: 20250418-topic-sm8x50-upstream-iris-8650-dt-d2c64a59505f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>



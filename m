Return-Path: <linux-arm-msm+bounces-54746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA244A937CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 15:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 211287B12A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E19627604A;
	Fri, 18 Apr 2025 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGKRrPx7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F69275868
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982441; cv=none; b=pR60THL/3sCvhZLblI4/GPmSp/rA4028tMU7L5ltsEdk792fjNvPK+bsPaeoDAOk75zObNK4hWeCamt4LF+k3MGAptLa68OrRgsBF+8t9HFx4z7kWvHThsCqdL3Jb2affFlhp56jFo3y/bHBJ3HUoBfhJQP2hTkKlD4wlOYB5rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982441; c=relaxed/simple;
	bh=2a5mZA5F083sDG7voTLLBarBLnmEOis9dWzoiN0JvYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CWUrjq8yInA4r+nDKwV7uOcR1+bdCyEcSdJ7cKC0zyRHBl8mZclQ13X5xXNI08OQON/MAbgtsIWnjpclSsvZK62EZ9fDBr4Vgu5QrVucvGxaIu3mFnygDprb3dczBx6iNRgc9S7E5LcaEDgQ58Ii7tt4WCwNt0nIdRZFDtEzZJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGKRrPx7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso18042115e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744982437; x=1745587237; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LUZqPB3JWIFBkEpZBtu+Xgl3vTEZWV4zcKVyVrLimPE=;
        b=EGKRrPx7m3b/pjVhhe3pr0Dt3B5t2xb8YxOr60fOPULBx8d3DmzUSB01U46BJlj/A4
         DLtdrIGXeKD1KbSZIWlUU8WLv0YvWI3xn6Ap+mmbVyB/E6WyqrPigi7qdBAm9L8+aosm
         oio2faR/5/XV5CdAIyTWsF+ae5Z64lqOVSK7pz5TF8dRdGxUz3hUfbtZd9AW7i1dEvjF
         qgGlgaNQeDtcJMc/ghejySZeuSh5Z9WGtmhz8ghhaOOkKYyWiFhg8+3FgclyZDIrmsTK
         MVMH7dC32bB4zlzmiWFDBPbvpYZRVlTUIL76/yf6pNjuXvdyK4E8NeEij00/1rhzxJ44
         qBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982437; x=1745587237;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUZqPB3JWIFBkEpZBtu+Xgl3vTEZWV4zcKVyVrLimPE=;
        b=X6W9EaZPMy4JO9R3Am/Wn9zZdxAUpXTbvZz/gpwmLX9kMoeQZL4hpYJmE69cIHz6ux
         40kpVQlzJcJgttVhvQLogDAjXzeOzaaSrIaT/VC30WdiOLsHj8RQYNXjiIV4/qVJwWW1
         9Oanv3raRJb3trUmHL13iGjNgkx8RikZdj/tOnWM8ptL2t5X6g0LAkSlIsbqqS6ahoFE
         tbkn2ZRRPOCqUdwfMLTOvVjl7zrcYvgHH0DuCR0LwPP4lSlfsPHwkXLhXaV1PduFK+2X
         JXOYDi3LUS6IwZW0IBOOiTIbKURvgFm05Do3bQcRtOePw+HMSV2PHcpZcf3r1ycMvZQA
         5EWA==
X-Gm-Message-State: AOJu0Yz++PwH6jK1qWOFz0cQebLxTb/5S/I1qvripzvK8EZOZyPdwWkA
	wQ0oHmi9wJ9HIpdia8ytnUzgWCUyzs931JMX1g0I5eBUIEgeAW2hTRGhaa6eir4=
X-Gm-Gg: ASbGnctppLcFIXj+P7HlREGrJMIBLKvMduUUSSYnYTS9uhMazJIOgASSgpU9ZYSM2vL
	GJ8IPtzh5cC3XltM9z39uS+ifZXCfmnCSl2oIlQzrYsYlDz2C0yF4+lBp2iChfAT1K22eEZPO1J
	qLYE26eqDo5lTXoHImmv2TTqDpgpP0l0OqOnBTBYbnYfj/XccD7xOYjc/DCyPs0OozPoQZGeeHb
	vs7SfqmdM0/LMsFno/9pFPyYe5oa/p/KgPoSyEcM5Ka+yNxp2/Mg0nIrOmnCnBtvtUVbMkV7act
	ZBRFHxa3hOY1y/4fe5VGWosJK70Cj4kbKGCLyTAPM20LOP3/H6XiZ8Kekf6A+w==
X-Google-Smtp-Source: AGHT+IEzrDlbck2TDJSIOBdLiuYqPZoYmEC3K3oJ5x9QBNX72TIwXyNygbpV6/DLy0HD+J1B1mLulQ==
X-Received: by 2002:a5d:64ae:0:b0:38f:3e1c:211d with SMTP id ffacd0b85a97d-39efba5081cmr2268340f8f.14.1744982436988;
        Fri, 18 Apr 2025 06:20:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acdd4sm22039775e9.14.2025.04.18.06.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:20:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Apr 2025 15:20:35 +0200
Subject: [PATCH] arm64: dts: qcom: sm8650: add iris DT node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKJRAmgC/x2NQQqDMBAAvyJ77kIMrqT9SukhJKvuQQ27qQji3
 xt6nDnMXGCswgav7gLlQ0z2rUH/6CAtcZsZJTcG7zy5oQ9Y9yIJbQ0nOfwWq8pxRVExDGNTuWL
 2aRwiPcnRBC1UlCc5/5P3575/juESyXQAAAA=
X-Change-ID: 20250418-topic-sm8x50-upstream-iris-8650-dt-d2c64a59505f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5070;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2a5mZA5F083sDG7voTLLBarBLnmEOis9dWzoiN0JvYg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoAlGjYvoQQWRPOtHWsHNXvWqPYIr0EzjyAfLeb4CB
 bYAUismJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAJRowAKCRB33NvayMhJ0e+VD/
 9HMqkQ6TcKOWABPqwCyA+PayCG/cXpY9IS99z1U/IAYTVGjt0fSMp5dQ/iIRW/17cCksxnMhMJkeyG
 64TqzdojYumZCFeGbYMYrHsfdM9fcnRo+AsrvOtYfwDp5nUuCLWvg8d4bRT249oOTki5imxHxJEulx
 8j+mkoClJ5Y+SGeQellnr2YaVq7anuVjFRnQf+26W0hGNoOf92hChaSbznQSSRjO1tdngGQLiG0y+s
 KFZ26lEeW6Tg7zjcvDwYfE4S8KGxXPMwgSI7oRgsNO6LT2JKCMWZPSnHOvbeUIHHVBVHha0vkucXnF
 bVFMKPGgfv2KLPK6jB95brmDYNqCJJxg6D6+LRNKJXuAHQM3fXs1aQhMR4d8JeYHMwXDTdtohub3r5
 sCWEg0jK2vgXq2yC2zUHakjhcTB2y56StxfXKiZRdvSPuZcehoCE5frkjZ8CZ2rzY2b7+MKUQu0QVb
 frYoIetuMBpJt4utB4huMvUAnb+qMpUbTqNdrBV3+j+ElsZFNfJBK8YR+qUUpcElGUXgdHNcN3DJ2M
 hhMq4iiz55JHtC+I8XX2CmAb8vkvK7d3+Vc6R4aZ25R77OQMes9WPwH2sEwBSo15BbzrCrVjLCrP3c
 ljSMVDc3EtMTxH/G/6vLC9QWNJoSkj5mMFjx/KfCYSTcQ0dYNftGyMQw+txw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add DT entries for the sm8650 iris decoder.

Since the firmware is required to be signed, only enable
on Qualcomm development boards where the firmware is
available.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  5 ++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  5 ++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  5 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 94 +++++++++++++++++++++++++++++++++
 4 files changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index d0912735b54e5090f9f213c2c9341e03effbbbff..69db971d9d2d32cdee7bb1c3093c7849b94798a0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -894,6 +894,11 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu33_p4.mbn";
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 76ef43c10f77d8329ccf0a05c9d590a46372315f..04108235d9bc6f977e9cf1b887b0c89537723387 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -585,6 +585,11 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu33_p4.mbn";
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio21";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 71033fba21b56bc63620dca3e453c14191739675..58bdc6619ac55eda122f3fe6e680e0e61967d019 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -824,6 +824,11 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu33_p4.mbn";
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



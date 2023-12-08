Return-Path: <linux-arm-msm+bounces-3999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E485A80A6CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD9A61C20E50
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8740820B34;
	Fri,  8 Dec 2023 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gNcnwtsH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E781BF9
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 07:09:09 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a1b75f59a12so278504066b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1702048147; x=1702652947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GYxu5vNb9UOC9+Ks0EEx/+fAHrpRHM/oRCqL4Wixxg=;
        b=gNcnwtsH5FFL6ln6fYdy36zFKSkOUrAbU9KdB5G/P8wnKFbS4r14Kc3Tum9RKtGX5/
         soPsbNEUiSBxrdHO43LEkD2MyQAaftGHHEtQ1kh7GTikGccprmXXKJh7izHmk6uHjcur
         x7j8hYHDUZXCHTpV0t359pztDD2VYMyahbEGYGjvzm6l0UiZEesVKFaRLDJxymJd+3yt
         TW/fGgJEUEUXA3HZCWa39ykz+B0ycHd/TJ84UAhXiyvWl6GNvvFw+Pr8ofsluz2fXirW
         k5fAgQe3Aokmn+MaolrZhr0Zv4HOB+o3QRTIzrWz8I7yQGTQYwmiyMj/mwengNHnBwK5
         WK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048147; x=1702652947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GYxu5vNb9UOC9+Ks0EEx/+fAHrpRHM/oRCqL4Wixxg=;
        b=syp7xM6P6WPHb4Ea3HHBHo9AWL0e6DBoCliz8C3T5n6rtdTui3rKy3srP7Rt3HgbWe
         bbxE2AllA2VQx9mVwvr9A5rKHnMz7YMBOFcusKL2Dw50ykY96MMbOxdD3wmpdBqgobSb
         pY4wEwRveu1P/4faufnTBYemvHYQ3mDc5xvpGXUGdazT32rjJUEC4PaIBKmVC4oBNSLx
         EndRirv5GBcFl9ZzK/aG8OWmD/dcIVFt6sYSlEr81Y4JY102Yey0iEWMfumOog0NpEj4
         zNQX4+KiTbWyA8Q0jVDxfGgK0XHlQdF0gShq2TWqYBewTNUYc1f4J/49nLeglGCWbrT3
         5eYg==
X-Gm-Message-State: AOJu0YyQYkvKZkyCTzCx9AwpSaTOPO0xXxz69bKhRCY02AtlsuWLo+8k
	MkdzL2iF83JHQwcs6EGXV/tcbA==
X-Google-Smtp-Source: AGHT+IFPKdSvBmgG4k5t8wjzwxLYY7RoBwUh5zsRCXn1qsCZ87DEkz0BTDFQyQWNgiRhavvMjylrwg==
X-Received: by 2002:a17:907:31cd:b0:a1c:9f65:a414 with SMTP id xf13-20020a17090731cd00b00a1c9f65a414mr41229ejb.152.1702048147713;
        Fri, 08 Dec 2023 07:09:07 -0800 (PST)
Received: from [192.168.55.221] (tmo-113-102.customers.d1-online.com. [80.187.113.102])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm1096114eja.217.2023.12.08.07.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:09:07 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 08 Dec 2023 16:08:04 +0100
Subject: [PATCH v3 08/11] arm64: dts: qcom: sc7280: Add ADSP node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-sc7280-remoteprocs-v3-8-6aa394d33edf@fairphone.com>
References: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
In-Reply-To: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add the node for the ADSP found on the SC7280 SoC, using standard
Qualcomm firmware.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  5 --
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  5 --
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 74 ++++++++++++++++++++++
 3 files changed, 74 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 10f4c75aed3f..b1ea31720d7b 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -77,11 +77,6 @@ cont_splash_mem: cont-splash@e1000000 {
 			no-map;
 		};
 
-		adsp_mem: adsp@86700000 {
-			reg = <0x0 0x86700000 0x0 0x2800000>;
-			no-map;
-		};
-
 		cdsp_mem: cdsp@88f00000 {
 			reg = <0x0 0x88f00000 0x0 0x1e00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 8f7682fe254a..a60fb58d1bf1 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -26,11 +26,6 @@
 
 / {
 	reserved-memory {
-		adsp_mem: memory@86700000 {
-			reg = <0x0 0x86700000 0x0 0x2800000>;
-			no-map;
-		};
-
 		camera_mem: memory@8ad00000 {
 			reg = <0x0 0x8ad00000 0x0 0x500000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index f404276361fa..6d319c8c6acf 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -143,6 +143,11 @@ wlan_fw_mem: wlan-fw@80c00000 {
 			no-map;
 		};
 
+		adsp_mem: adsp@86700000 {
+			reg = <0x0 0x86700000 0x0 0x2800000>;
+			no-map;
+		};
+
 		video_mem: video@8b200000 {
 			reg = <0x0 0x8b200000 0x0 0x500000>;
 			no-map;
@@ -3600,6 +3605,75 @@ qspi: spi@88dc000 {
 			status = "disabled";
 		};
 
+		remoteproc_adsp: remoteproc@3700000 {
+			compatible = "qcom,sc7280-adsp-pas";
+			reg = <0 0x03700000 0 0x100>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack", "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC7280_LCX>,
+					<&rpmhpd SC7280_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			memory-region = <&adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1803 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1804 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1805 0x0>;
+					};
+				};
+			};
+		};
+
 		remoteproc_wpss: remoteproc@8a00000 {
 			compatible = "qcom,sc7280-wpss-pas";
 			reg = <0 0x08a00000 0 0x10000>;

-- 
2.43.0



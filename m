Return-Path: <linux-arm-msm+bounces-7177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 136FD82C9BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 06:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F5F8B24138
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 05:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E091D522;
	Sat, 13 Jan 2024 05:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFhPLrLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AAB1D52D
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 05:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cd928a1d58so19832891fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 21:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124573; x=1705729373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zs9DV/jaFFsuf/FyKYG2D94+QM9WwP6rWL2xoLmx9UY=;
        b=uFhPLrLx5gMB5QtUarfzE3QGmsb/IkiudMtXuyfJ6jf515l9xTLAnrF/xza4fb51wd
         2tMmdLgig4aAwvrIs9dHmLBnpG7OOO4oBjMfrT1F+48ZYl5OcWaLACUWcImU9/fYxuEx
         GMQPlmAVhOtSpKEmBtkqRBhdrF16tCYZJMBD7WF3/vwZVfnn69oBT+TrMqlQCFgL6yNQ
         fHSgE+P4aFkcQuDAhlvfacYyHyY1J0iky5ZIzsTU+xrbyI0ElQFflHXW8N8RVcyiQK5i
         HtfVfxDYvSWH6QfEV+LYXEPGvg2M7I5XBCFTiMNFA4cGxkwMjfIh8l+hsICW3Z1Xh9/y
         LNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124573; x=1705729373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs9DV/jaFFsuf/FyKYG2D94+QM9WwP6rWL2xoLmx9UY=;
        b=NufR+COMqL/qme82YdYCgYjqMrMOC2iNa4uq46J4hhG0NlNdjjg5iSl+2NTC5RRYvU
         Fmc1kOLTkOX3xw0vdQzePCsERtQgzdRFcH7+kMYF5YxNOgJ5dGFwZYm+Y6UVJCpE/2hc
         T1ZGRdHEQCSXD8Ok8ErrujkLEgnNLHJxk0zcOGA1MehNRgrUiZv6Pfm3ynx7AKSuc3+Y
         pKwEoWfnrjKuREJIom5GgW3088bwGx2cIGRofVpiTELZmvnXvZpeFJ9JBFhNXrTp8oLE
         9jlUSaUdxTmjHIHQhN5VK1xCUv1pGmFkw532h1qu5fWMjV2B4q2P4SsOLz2f3uR2Jtn0
         EAkA==
X-Gm-Message-State: AOJu0YyGjkVYTjQhlAWtmDXpR0EkCEJYaBAYBOY7hnOq8HsKa0OXRk7Y
	r9ByDLhjUSSNTDNdAOCNbekyIO89CBDpmw==
X-Google-Smtp-Source: AGHT+IGJUtQ8hgr/IfQF13xUO6+a0792Lm2U7lgoN8AnmqKRlCnKHjXQqO8vrvfkcWonklMtDBjzCQ==
X-Received: by 2002:a2e:8791:0:b0:2cd:7fe1:3a1 with SMTP id n17-20020a2e8791000000b002cd7fe103a1mr1212342lji.66.1705124572881;
        Fri, 12 Jan 2024 21:42:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 07:42:50 +0200
Subject: [PATCH 13/13] arm64: dts: qcom: qrb4210-rb2: enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v1-13-de7dfd459353@linaro.org>
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3579;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4/rs+MHUItB53QwHSPgf9kfH5rPH7c8tTRRjdfnPLl8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLSizQm9ZA4Y4bbpKWaVIGaR7MUZ8jUBCMYV
 PsYJAo3NiiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIi0gAKCRCLPIo+Aiko
 1ZRnB/4xXKJ3eGp9xagKvMmv5n4K4r8iL6MDrSZsEvWUvHf1dYZKcZ1wZ8n3G3OBFMXfx+748Rk
 w6gZ9Bd38a/D3e5lOtuKlalCWa2LfigpsH38eWBHOOYAxgJVERGPSra0LTpwOvKCYbHinxjPj4H
 dl96+mHnXx/P4/IRqC/plDCFu4ZCMsieRmd/2DfH+y+/gTi2yiqCQRvNyo+XWvNsOpbSyqLWCmd
 p8srCka3Es53PPlXGnlLfWthSphT0Gzq12DOiOh9SmwLRj/0Su/q/l6ZIsUqFAe7lhLgQLL4zYg
 9YMmYi1tn6dkWcEkyfW+eudKCvZUUBmuy2exLHINoxivMi+6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Plug in USB-C related bits and pieces to enable USB role switching and
USB-C orientation handling for the Qualcomm RB2 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 62 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 38 ++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 52f31f3166c2..a96e3afb65bc 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -6,8 +6,10 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm4250.dtsi"
 #include "pm6125.dtsi"
+#include "pmi632.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. QRB4210 RB2";
@@ -256,6 +258,53 @@ kypd_vol_up_n: kypd-vol-up-n-state {
 	};
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		source-pdos = <PDO_FIXED(5000, 3000,
+					 PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+		sink-pdos = <PDO_FIXED(5000, 500,
+					 PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+		op-sink-microwatt = <10000000>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pmi632_hs_in: endpoint {
+					remote-endpoint = <&usb_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pmi632_ss_in: endpoint {
+					remote-endpoint = <&usb_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -607,6 +656,14 @@ &usb {
 	status = "okay";
 };
 
+&usb_dwc3 {
+	usb-role-switch;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};
+
 &usb_hsphy {
 	vdd-supply = <&vreg_l4a_0p9>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
@@ -618,10 +675,15 @@ &usb_hsphy {
 &usb_qmpphy {
 	vdda-phy-supply = <&vreg_l4a_0p9>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
+	orientation-switch;
 
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&pmi632_ss_in>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;
 	vdd-1.8-xo-supply = <&vreg_l16a_1p3>;
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 76c429e8ebab..252074219bed 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -880,6 +880,25 @@ usb_qmpphy: phy@1615000 {
 			#phy-cells = <0>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+					};
+				};
+			};
 		};
 
 		system_noc: interconnect@1880000 {
@@ -1614,6 +1633,25 @@ usb_dwc3: usb@4e00000 {
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
 				snps,usb3_lpm_capable;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.39.2



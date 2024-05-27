Return-Path: <linux-arm-msm+bounces-20542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D03848CFB02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 10:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 466871F21FAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1614D59F;
	Mon, 27 May 2024 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mkIKu3FS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB63C463
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716797265; cv=none; b=fSR11djln4NDUKBvCDtWfersAQnZrusLX0h6xPcIEV7ba4X0MnviHhqbhVDx46kpsiGevUDtgadWponZsNrDMMuI488pCxbgPJOUX1kvYB7tDuoqvSeWb552L4ZNl7Oo5S3Pjy9Fsqn0BeU9ahztBIwvdbL38Fgato4+0nU1iDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716797265; c=relaxed/simple;
	bh=0K4VHzS7JijMYhdg/yqlESpYmlpt5lze8eOI2eCFnBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRfoOLqYIu6eTyXNs74xnja80GmrgrjdmDTpBspOFQUJivyIzdZHk/V5fez2otTUR7b/16SYlOdUBylCuTGfLfL/F51+WZkEngMR92eypvTQTVJ9eLJ/erursTYobJuWtH9VCgqU8PaXI6B75T5znc0tGocqT5Kgt+55dCZKKS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mkIKu3FS; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6267643794so135816966b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716797262; x=1717402062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OAkpiG2WcQO5F5//mbNfjMkbNsZQ18DtYIGSneDgeec=;
        b=mkIKu3FS4YgDIHnBoDa/czCctR42w05FSxLeTnxfaMwzuqhofv5QLEtkUIeHeXWAWk
         i2CNbBY+bVvcmLqzsMKtFhrFMS/m1nBQ6R9/dHzoxADu/QawJV9cz4nIKXvPXAKZwUW3
         t5aHNfQihirjYW7HFI8qRDaUxqELmYtEKuMdaE+fcdvUzEXPKL4qaPzOgXY1T5sIpuJm
         d8u2uv3y9cemc5qv/Bry3nwNurEKFN7txe5lDk06gORO1fALOJmllmpxHQx6pHThwPjJ
         2UNCCX+GuFibICzKKAqPN2V6k4xHNv4F5aP3aJrmWmf9EQ6HA4MQ+8GQB+p4o/6i8vvq
         B6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716797262; x=1717402062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAkpiG2WcQO5F5//mbNfjMkbNsZQ18DtYIGSneDgeec=;
        b=ErPD01qX63IJo80Ekn18lnK7m/ZWguMYzOb8DfcMpUoZxG54D7Ryp0VPC9QgBFlgFy
         Mxd1waKZA5WkHKsyq5qKZ9kWzYMrhD5W8n+t6sl+3AKX4pSuBJqMYD7o+jOc1HWcysKf
         4lu75KRxJlVKX+n0cFjiE9d5hF9gjZq9Rd+vySbBmnB2vdj/dbVU1+aThQ0xFWEMHXfK
         SnBYDwvLkK83r5lsrz5MH04znXrsHWvNdatKKLg26eEDw2NLdNQhCa2sJvNDS9wnEjQt
         C1JqWcG3+aLW2qyzDr20Tj7yYn93ZFYXFjDhyjZbivdB73oAYK4cWz5eEV9RTmvadll3
         lnbQ==
X-Gm-Message-State: AOJu0YwvEqjakqpLXI2AFyN/aTEpRT+7PnLfB4YW1RmZJJ9FzQK03KIG
	xz4kyWRG9KfggNntfgTCEzZQsVhr/YcE23ETQyxdZUOqoZiwt+YEwv7sMfgm6Zk=
X-Google-Smtp-Source: AGHT+IFB9ryjqGl/QrGf5X5oVtJ9MtfYw3bPT+7NOdbkzMdVcAAqG4l+F8nPfMId+xB8gQU7k9IfHA==
X-Received: by 2002:a50:8ad1:0:b0:578:5b30:8bfd with SMTP id 4fb4d7f45d1cf-5785b3098cemr6499750a12.21.1716797262034;
        Mon, 27 May 2024 01:07:42 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d30b82a8sm1240893a12.79.2024.05.27.01.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:07:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 May 2024 11:07:28 +0300
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100-crd: Add pmic-glink node
 with all 3 connectors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-x1e80100-dts-pmic-glink-v1-2-7ea5c8eb4d2b@linaro.org>
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
In-Reply-To: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3953; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=0K4VHzS7JijMYhdg/yqlESpYmlpt5lze8eOI2eCFnBI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmVD9HYydzKT2P+zMLzZyfUebAmSH0ruuw6qjC+
 lTHveMOGq2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZlQ/RwAKCRAbX0TJAJUV
 Vn1rD/9z9A6LAXjJDXou4iVIMkjaboYZV76C7ty6PcQ+8MHXqlIpw2CCLf9HfYjjjdHePsEwlth
 vLEvROQcWCDVGOOnQv9wZ2Gwz2qvzu/1TNYLi3vqVJ0IvXGnXdL7NL6IGeswQCEH6ID6/p9FICf
 0TLq0ujp2tpaRooxXkn7xA7IV8BMGYH5CrRorZjxyqlbk79LbnScqtSnv2cCOItm+2nVvJuJMq9
 X2RcEUq28RZZKgZoNUFncWX0xN8a3wcBN5BM7qLV7nCqdQF7nN5yhZ73T8+fwWAaoVH3tfdiCyd
 xOfb+7wbuFdK5zXY15IMDeqpQn8a6pdZht6/pC1CT+F9ElvGaOFdNz+KTuSxGChXN3VadCZd7n3
 nvoYkd2kfXi6XIO8LqSSuA/eOCzJFf/RpkmzJ//OmP3Aur98ioVKDf786GndqMscJLP8lmhhTLf
 E5kieOHF1usBMgQyDoC06fnSagf7MWVyfLkXapIaXYAAbCIR6tCUJjnGfPrRVVOLwkiA/IMEama
 fEXWDZwXj7o+ip5MGh5+2CeobWxUyYEsiFzAbOw7LE3cO56G8JTq6OvGb1gWJYY5a2bS93FaGqV
 WLOsJCOjmhGUZi6fe1R19GToaM0Rqfl6kGh4MoDWqQsF1ezQJ4Ba4954wH//BvBZChyrpMYWkM4
 rmLDPZKptaPfbwA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the pmic-glink node and describe all 3 USB Type-C connectors. Do this
for USB only, for now. The DP port will come at a later stage since it
uses a retimer.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 143 ++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index c5c2895b37c7..2fcc994cbb89 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -49,6 +49,101 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	pmic-glink {
+		compatible = "qcom,x1e80100-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss0_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss1_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss1_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss2_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss2_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss2_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	sound {
 		compatible = "qcom,x1e80100-sndcard";
 		model = "X1E80100-CRD";
@@ -852,6 +947,22 @@ &usb_1_ss0_dwc3 {
 	usb-role-switch;
 };
 
+&usb_1_ss0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss0_hs_in>;
+};
+
+&usb_1_ss0_dwc3_ss {
+	remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
+};
+
+&usb_1_ss0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+};
+
+&usb_1_ss0_qmpphy_usb_ss_in {
+	remote-endpoint = <&usb_1_ss0_dwc3_ss>;
+};
+
 &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
@@ -874,6 +985,22 @@ &usb_1_ss1_dwc3 {
 	usb-role-switch;
 };
 
+&usb_1_ss1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss1_hs_in>;
+};
+
+&usb_1_ss1_dwc3_ss {
+	remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
+};
+
+&usb_1_ss1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss1_ss_in>;
+};
+
+&usb_1_ss1_qmpphy_usb_ss_in {
+	remote-endpoint = <&usb_1_ss1_dwc3_ss>;
+};
+
 &usb_1_ss2_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
@@ -895,3 +1022,19 @@ &usb_1_ss2_dwc3 {
 	dr_mode = "host";
 	usb-role-switch;
 };
+
+&usb_1_ss2_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss2_hs_in>;
+};
+
+&usb_1_ss2_dwc3_ss {
+	remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
+};
+
+&usb_1_ss2_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss2_ss_in>;
+};
+
+&usb_1_ss2_qmpphy_usb_ss_in {
+	remote-endpoint = <&usb_1_ss2_dwc3_ss>;
+};

-- 
2.34.1



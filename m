Return-Path: <linux-arm-msm+bounces-9092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD5A842D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 20:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E09271C24642
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 19:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAC41E539;
	Tue, 30 Jan 2024 19:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5zmhHiG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C350471B25
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 19:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643781; cv=none; b=U+255hwGSZwIMeVHnsYehA+cgW0cvK2F7ZAsewdJCRkS3mmnbU6jYJYtYM9gG0ax243fmb6g2alkTvtBmb9Gn+Ay+J/tQEtq45ufikN+bzEUsbd7fgiRgsGuDdecrM4YPyl7jrnNT4y7/JgjkBk3BJXHK6rFpJnW+73vkVywGnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643781; c=relaxed/simple;
	bh=SD6UUFtI+FrYWwRFXzuabrqwuSDciUQyW6zeuGZeagc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQBr80muqKMG+aJokWZ7Nh1/cPQRM1cGnjTx2DwWfUNVEuz5UjmnynUT7QZ9laeMo9cxkt396E2EyOx/2XMDi4MIzZFSb9QThITbV71rg3GDyW+xDYKNpM6QEC3yTHiVKn/ZjpHArqnxUChUMRU6JAoRUl37YvjJFX1Rr/7uKmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B5zmhHiG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-511206d1c89so882333e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 11:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706643778; x=1707248578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfLAPid7VDK1PAEPiQCRMcHMVr/os/p3blKtpfELzqM=;
        b=B5zmhHiGC5WfcpUD3UAxzV85JurDNRsmWCPa/2GarcYZuSG7wx1y+GH8CeyPbakayf
         PbE1uS3xUCC/A2VbgFEujCneF9EtH2nz7h1KiX1RPbbjXVjIPsOG6v8Q8mIRNPvifly8
         csHCHdB2pKopyAGe5XpVXhM9NZHHS+or7mFYKrqTUm2zWw8nM2dqu01H09PrqmojkMFz
         LarQ5TTQRB3ewhrfPQ+dlhQ+rqKiW4AJ3VFhnxYMhqnIeIZKfCnGzc3hOVOftMnU52EN
         OlatVluv1fi34vi3w9LhDLyP/Pg5T5IxqdVVrxetmz+8t0Y1qQiB/8jcC1kD+OkYAc3q
         W0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643778; x=1707248578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfLAPid7VDK1PAEPiQCRMcHMVr/os/p3blKtpfELzqM=;
        b=AMoDoGtRuzTUBAwJGfphsh9/bZNHi6r7hIdXpWzWvU4obvJKwsL/CmVmh3VZlpyWZy
         i1zDD+B/T5C8W+fHFckied1KaFl+OVQyeouYBn8v9e0Kp33yjaAAbB3iqsIg2m3/Xtsj
         sAazotSBSE7WMuGxHwDC0naZUsbIXm1HnvhduZ1wYrLOMUAolJ5nDWubmqz8fRPzXdww
         RC+TfF8ZqWb+LEM85LPOqRLGKN0cjGsf6fRXAO+vZvygwsVDWDGOyDeEop3TJ72//SqI
         f84ZCE/pbYMAJwGqOd9EyXAswejgAm1j5oDSsGltC7X38jj0D+t9ygmcIgNkPEFgi6gp
         zULQ==
X-Gm-Message-State: AOJu0YwmmfO2lR9gkOrv8bUOggBvSaclJKH09umwfa+02rwCVIic2EYz
	6uHTtYWE0eqzGzKIIutO3RrK4+n1Qze0IXwgu2AYqZHUtQh30TNOiYYmszLF1QM=
X-Google-Smtp-Source: AGHT+IHeoIXaYNBsUUv+fe79H1KB6EJw8xDWRHxgZDs441eUwoCCek8zCVtawcdZToqN9UH2MCXD/w==
X-Received: by 2002:a05:6512:2315:b0:511:e76:6f1f with SMTP id o21-20020a056512231500b005110e766f1fmr5688546lfu.43.1706643777864;
        Tue, 30 Jan 2024 11:42:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWPQmzdu8fdjl96ajOCNfaoF6z4qGiTS/hWiaZlRAfWNUYtfURGCC7A6rQN5yZ9dw1lnhgrQAKQQIWbFMQYp/zI7YvOWI8PpWatt6wZENysU351hhBxOAWPlCnLNq9W033YOUiZL0kn1MdlfAg4705tbQS/Hlep2dwVwAZ6cqmfzVnyUicCyzyZeAhdTbsP/YfrRDtg6CrEswdm+2DIR/ckiF5/5OLzDVJKaHTxBAhjuH13bzTuNPIOk8aHRzBZIkuX4NICKQMHrzN2EdGoNJM3DP3w7MjTeegTa58BG5QEIr97h4ILQjX1eYOLiJZ3bKasRP/fkWurYfcmSD5LgFci9hqwChHeqza1HT3F5NtSy13cyCmEplHwaOn/7gY9WJvXZhXwa1pQgzK/xgoDM5SeUAzMxjVuUI7wvRtZuszxLqVH3p3U
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j16-20020ac253b0000000b0051021a9febdsm1552145lfh.153.2024.01.30.11.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:42:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 21:42:55 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: qrb2210-rb1: enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-pm4125-typec-v1-4-e8d0097e2991@linaro.org>
References: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
In-Reply-To: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SD6UUFtI+FrYWwRFXzuabrqwuSDciUQyW6zeuGZeagc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluVE9kkqMLKfbaX1ipK08gr3+CK2Afcwvm1voG
 zQGc+8nooGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZblRPQAKCRCLPIo+Aiko
 1ff3B/4yWQ3f+JTyg8s/rzYHNW9PjzotYy7Z7EzIFh7SdM/3RhRZ8dG1IqkFtroo1bIsXXQoEJ8
 RBk5ehNcHGFJi+fGaNN07thCsbxThc5aundRGXtdjn3g0oTQvIvPW+8ir8WsBdZ0VyW/N72RrfD
 ugJRbarapPGJN2dpLJLSvZlYVgwA7n8KGdIY9a+Yc3IHEkuJhZG5QoPczljTef5C46yguRykZ3e
 DIQqYIc4NJChLQzw0XgdkzlAyjSk1lmp2WBfN1dpoqxr1kJm2W7pV5dkA9tARy8yjsV4rCqIOiI
 N/RwfWLRVJPHxtKxi5gMkIjTt7IjRGZfaqXMgg/OOnayF6CB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Plug in USB-C related bits and pieces to enable USB role switching and
USB-C orientation handling for the Qualcomm RB1 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi    | 42 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 60 +++++++++++++++++++++++++++-----
 2 files changed, 94 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 0911fb08ed63..6e9a92556423 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -689,8 +689,29 @@ usb_qmpphy: phy@1615000 {
 			clock-output-names = "usb3_phy_pipe_clk_src";
 
 			#phy-cells = <0>;
+			orientation-switch;
 
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
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+			};
 		};
 
 		system_noc: interconnect@1880000 {
@@ -1373,6 +1394,27 @@ usb_dwc3: usb@4e00000 {
 				snps,usb3_lpm_capable;
 				maximum-speed = "super-speed";
 				dr_mode = "otg";
+				usb-role-switch;
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
+							remote-endpoint = <&usb_qmpphy_usb_ss_in>;
+						};
+					};
+				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 64b2ab286279..00fcc01326ff 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -244,6 +244,46 @@ &pm4125_resin {
 	status = "okay";
 };
 
+&pm4125_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm4125_hs_in: endpoint {
+					remote-endpoint = <&usb_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm4125_ss_in: endpoint {
+					remote-endpoint = <&usb_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&pm4125_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <500000>;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -517,14 +557,8 @@ &usb {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l12>;
-	vdda-pll-supply = <&pm4125_l13>;
-	status = "okay";
-};
-
-&usb_dwc3 {
-	dr_mode = "host";
+&usb_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
 };
 
 &usb_hsphy {
@@ -534,6 +568,16 @@ &usb_hsphy {
 	status = "okay";
 };
 
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&pm4125_l13>;

-- 
2.39.2



Return-Path: <linux-arm-msm+bounces-18784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A498B58D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15007283DB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 12:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE5054BD6;
	Mon, 29 Apr 2024 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/aNV9SI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E479200D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714394629; cv=none; b=S6ShudOBX06K3Xi6b6gZyBJEiGU86LDnbzOKBv4yrmmbpO6YZ93BY4WJdbUgl9talAkw/jkTU7US1qslzwYelIdHuc4GYhmGJO2bMRoOkpqo6T1HdVlPMwR/iOCYmvi4EMH+BfZ/lOJ9j9Uhhjw3DWMBSHmYwM+OzA7zDLmqgXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714394629; c=relaxed/simple;
	bh=T611xpa2u6i4khfTFU2OgFjuDM98KKpM9628a4zNbDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vr5mcUD7SqvsoSdR7u6KE5khdd0mtTS08S2kKi6d2NK5c7jkFroCMyE8xz51L4dHp5RrvrKI5jc+1Ni4otVeKY9Iq7Dp0Ui1JKFwLdN0biENProAHWiPfEa+9Ihrwzo6wWJBcieYqnG1Gm9dyIfdiYry6nyG8Nh7Ij9ciLR2HdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/aNV9SI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5194cebd6caso4956656e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714394625; x=1714999425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUoXRRFUJQQBOWuIqHtXudyyJPn9iQWzIcDItzMD4xo=;
        b=A/aNV9SI+OThSesec3lgnw6AVerYvVFzXRfo3H31JxG6HhOBIhWNVn30p3ccY90Yiz
         Hd7GqApxV2W0uS3dm/l6z1BLRq46QdLfRQQ988BOs8DWychIJEzr+lFV3KQo9zVtT1Z2
         Oo1GginNxY0WJGva331aKfDhILeUBRsvmxnIOahSE2xcwh8ujXHeJiBOg40MQIxgrplD
         YlZj4gkNxDtiy1wohCPJgVILLSDLa33GGBZQT9L5fZpFvZ9xmRIILgr4cqTKMHszuUHP
         VhjBrWgmIYjhnKecJxvKlKNFmypap0OmvZeFmB8W8kH0x/RPCb5guwJTHuck8LKA+kv0
         P4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714394625; x=1714999425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUoXRRFUJQQBOWuIqHtXudyyJPn9iQWzIcDItzMD4xo=;
        b=URUL6D8AxaLk4XaIraPXjdiukHzIG0TLn4uJbDgomBwAvwgwG49lUnLsPA3mvANPfK
         dFXgGETNGNGF7cLrtw2GBHjXChdI7qlKg9ezePpoHyCYHDIUt+5XkBUpChh3XAoawDjT
         aLEFloEhoGqNQbH2y/EzNp7mo1oyELKOYX7PDnRojJatL1LR/BF7LUi44p4L62kbhngu
         7+fva2HbC9Xnzf6V6Qi2HyObPol28B7FCeTiRX4PCA238mvh7vRpZ8fPBQ70G8lMqOkf
         K93JvD6Z5IOsNLOus6mvfbnfLzErf6cotuE9EsGVxpo8sFFpKa8zUYp76AcQsM2Nh1oR
         tSig==
X-Gm-Message-State: AOJu0YwKaGx0ssi6r0kghGiULs3cvJxMEp8EjR/YHWhAcsOH+D+W66FC
	LE1kDnBTvQxgbUYyehb854fZjw9nZvlyENpTwsHO48c6+FBSPBNwakz3EYYCWCsXkqXsayf0L+a
	d
X-Google-Smtp-Source: AGHT+IEI78llUWEI2u8/GRG6nm2hwH5UIF30yhS7dfAtx32McGYBAqnjYGzst6qNeJ/UgXfR0DcUrw==
X-Received: by 2002:a05:6512:2395:b0:513:edf4:6f20 with SMTP id c21-20020a056512239500b00513edf46f20mr7214514lfv.54.1714394625729;
        Mon, 29 Apr 2024 05:43:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h18-20020a0565123c9200b0051d94297380sm467538lfv.241.2024.04.29.05.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:43:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Apr 2024 15:43:40 +0300
Subject: [PATCH 03/12] arm64: dts: qcom: sm8450: move USB graph to the SoC
 dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-usb-link-dtsi-v1-3-87c341b55cdf@linaro.org>
References: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
In-Reply-To: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2551;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=T611xpa2u6i4khfTFU2OgFjuDM98KKpM9628a4zNbDM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5r+1L8Oixd7Xp/9fM8yX9HLyjfFy6TflWsoBbDMsTe4l
 1ncPdWzk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATOXSWg2Em6xuHlhdT/jsH
 BzK4HXE5W7hXQf7R2krep955be7PWJ/7tei53ejJiZP+1TT9/q0ggaVHZj6+ca2Fd9G6oLMpgg6
 zvBfeUrjEI5D5iqNCc0dlhTzn3XR+eybBXAcZLbnVd16l5LE8/ziz1a5i38Peb3Ic3ony13NvR3
 KcnayosnLZNj/NSS3i9ZW6nIttpuzq+HOtuuP3FXYbuRV3jwVOYjYKT5jh56/T83ffzimuQVMVr
 ud5T7u9o77xs4HJ9+s3U1gtpplKK+YtUIjJdHohlcqwZ/cLX7bOGUUtzA1GEyNLJ4UIXfEQnXkw
 WeGV5IRTfOJ1UnYcrT0b6j9k1WS0175uj2aJNd52YuY7AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move the graph connection between USB host, USB SS PHY and DP port to
the SoC dtsi file. They are linked in hardware in this way.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 25 +++----------------------
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 11 +++++++++++
 2 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 3be46b56c723..9926294e4f84 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -674,17 +674,10 @@ &mdss_dsi0_phy {
 
 &mdss_dp0 {
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			reg = <1>;
-
-			mdss_dp0_out: endpoint {
-				data-lanes = <0 1>;
-				remote-endpoint = <&usb_1_qmpphy_dp_in>;
-			};
-		};
-	};
+&mdss_dp0_out {
+	data-lanes = <0 1>;
 };
 
 &pcie0 {
@@ -1114,10 +1107,6 @@ &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-&usb_1_dwc3_ss {
-	remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
-};
-
 &usb_1_hsphy {
 	status = "okay";
 
@@ -1135,18 +1124,10 @@ &usb_1_qmpphy {
 	orientation-switch;
 };
 
-&usb_1_qmpphy_dp_in {
-	remote-endpoint = <&mdss_dp0_out>;
-};
-
 &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
-&usb_1_qmpphy_usb_ss_in {
-	remote-endpoint = <&usb_1_dwc3_ss>;
-};
-
 &vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 616461fcbab9..d138b90bb280 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2321,6 +2321,7 @@ port@1 {
 					reg = <1>;
 
 					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
 					};
 				};
 
@@ -2328,6 +2329,7 @@ port@2 {
 					reg = <2>;
 
 					usb_1_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -3119,6 +3121,14 @@ mdss_dp0_in: endpoint {
 							remote-endpoint = <&dpu_intf0_out>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_dp_in>;
+						};
+		};
 				};
 
 				dp_opp_table: opp-table {
@@ -4584,6 +4594,7 @@ port@1 {
 						reg = <1>;
 
 						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
 						};
 					};
 				};

-- 
2.39.2



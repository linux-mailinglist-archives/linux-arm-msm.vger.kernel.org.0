Return-Path: <linux-arm-msm+bounces-22402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F77904FDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5B9A1C2170B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9635816F0FB;
	Wed, 12 Jun 2024 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YY3r+vbX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA27016EBF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186383; cv=none; b=sijxUVZyERh7r9eerpReJJfgSpKX8291yzw5d2yf6o92GbckhRvZuCTcigq0S0izn1FGeBj/n2+Ytvx0QZc7fu3k5OtDvVBUHWTsEcD1fUMb5acnmDBrpmS/UWyNjeiqNgRK0OezyKdEnIOU0cabrY9qeSod1AwHWjNJjSf/1FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186383; c=relaxed/simple;
	bh=D7uOWa4uDmtjSwf30b3ABIP8kdvr21SmZRUP7Dp4FOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8mYkhW3Va5TG1/64zKRKqOcofmIJZThTwEopDXZNMZp5SSJbB/ZYLT3C9y4GrCHSJ8GuyFWButdNvXCGAHFRFTTJjMykrJgNyAxnHopi6q+Q069v4zeDolePTRFCTO0eA4BGbADxXos6KxYkLLme8mNXNxDCfgWIJSbaQ55CXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YY3r+vbX; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c8973ff29so2249126e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718186379; x=1718791179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbxciSj28k5Q0p0UZvIK+bmv47cyvDnbr4Z/LAPTdSA=;
        b=YY3r+vbXfC/Y9tf1niSqtVV0/3OIcMZhU6SmrZ2DUMyPrElUKoVeLyjY4pKLeeap2y
         /9kEYkHGCf1WwBYTb2XpSOamIzY5rV/IN2GQZJqVZqxR6xv94w+Q7AGaMOcuHqlgKFA7
         /3T0gMQWJDamYP4FJhlxBspox7+EUWx3YQBKi7WTjf5fpPhgvFuxSijedHgZxAY2G9Ay
         /C4KCYn11sfyASLBLPjvJvVjdn+tcNKKEB8g9WfY4QUt+a6YpZktkUVkt/6O+Y4X9DT0
         fHqUQkcmV2NJBtyVNHFx4V+zmRXiJy0+Ak6Q+H9XPt+H4R2hrDN3gUxVNa1q8zl8/fSZ
         6AfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186379; x=1718791179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbxciSj28k5Q0p0UZvIK+bmv47cyvDnbr4Z/LAPTdSA=;
        b=dAaLjMKJK+Fg3TLAE1mHLTsAV7fOmwhBT9CVffuOkzMQH3nxhwX1LupBrFSbKW/XRk
         +09ewv/ei1E8vJhoYkp6ChS75Yj5wfgco3nnc5DoHoaM+NednwM4+6AD1E6kI1+Eh8x0
         kroUDtadCnPeN1qmMq7ImRc1lI2djff3UlwuTH4+BWkpNgGwms1xH12zKzpfjuNJnZSM
         97Myq4j+kldyqV2ef1uWjrYBuYu8x5y5VcfipX5JnJBQMiK3YPeuaQctfZPCsoflI66I
         78ccNCnx7RFpxin0aYuWJbhnw1pLy+fvBIZrLEMoSzH+2EPWL+605PGwNNtQZoTBjpkq
         hE5A==
X-Forwarded-Encrypted: i=1; AJvYcCX7vQZblzm+TQTsCcVfkeBq3tT8xW5xyTgjw534EA8LnC4lVqhr8elN7pdCBMTpSfBItF/LwJlYeHuZT5aqIg+OhHr5N8t7A6x5tBopTQ==
X-Gm-Message-State: AOJu0YwSWZAkDk9UYxIPrpECcZVO1kURUTptzesiEWiDH7AFiOMr+9Sx
	pTkE+F0SMtxT0FMv2yPQfemP5/JuVYAQGyskL3KiWNAgKVqTJjgxPeJOeXDqJUE=
X-Google-Smtp-Source: AGHT+IGUI7ZvsPCAH6It2x7kbWRHWUG4+wkOTpCQNz1t6NvaP/51Vx/SEMUet2s6JbBXdCB0wJkuWw==
X-Received: by 2002:a05:6512:48c6:b0:52c:8050:6f19 with SMTP id 2adb3069b0e04-52c9a405e3cmr744956e87.60.1718186378791;
        Wed, 12 Jun 2024 02:59:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c8907dae9sm1408095e87.129.2024.06.12.02.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 02:59:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 12:59:36 +0300
Subject: [PATCH v6 5/6] arm64: dts: qcom: sdm845: describe connections of
 USB/DP port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-yoga-ec-driver-v6-5-8e76ba060439@linaro.org>
References: <20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org>
In-Reply-To: <20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=D7uOWa4uDmtjSwf30b3ABIP8kdvr21SmZRUP7Dp4FOI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaXGGc7P4fHzcaQPT5coScEFYPOsIwqMDo1vug
 ZyBzPFUb6CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmlxhgAKCRCLPIo+Aiko
 1dp4CAChpYYB0Dn6m5M4lVLAbzOSVD8fIzavlY6uPQ60E2Ibf4v2h6fimoQIbqT33YjjJ6G2Ilx
 9+WaFciLOuIl2OExCw9xAa+wLodOFssGHIwPyduinYilbm3+yIYjo+87Fmdnbvab+Bpf+zpm1Mj
 VHIOxTu85t1BttTOBvCFRHCo21wBRaCXdghRvd2HY0yDDNS9gDkXhYqS6MZEjk3e5W23lZEH5sV
 LCF71QCao3VNID7GqvWx9edsIWl7OR8p6JEGPae43yjD0RV+YZWv88QH/BjDK8t/ZRJXCcWI8QG
 r79uKtqRVJK11By5K5Wy2KZ3ZLSOPmoNNM1lC2XLNRKiH2FB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Describe links between the first USB3 host and the DisplayPort that is
routed to the same pins.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 53 +++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index a0125f3d92b2..23b101bb3842 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4031,6 +4031,35 @@ usb_1_qmpphy: phy@88e8000 {
 
 			#clock-cells = <1>;
 			#phy-cells = <1>;
+			orientation-switch;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&dp_out>;
+					};
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
@@ -4111,6 +4140,26 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+						};
+					};
+				};
 			};
 		};
 
@@ -4601,7 +4650,9 @@ dp_in: endpoint {
 
 					port@1 {
 						reg = <1>;
-						dp_out: endpoint { };
+						dp_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_dp_in>;
+						};
 					};
 				};
 

-- 
2.39.2



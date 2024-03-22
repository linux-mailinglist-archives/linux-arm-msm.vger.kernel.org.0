Return-Path: <linux-arm-msm+bounces-14825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C0886BBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 12:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83A71B242AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FA43FE54;
	Fri, 22 Mar 2024 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jh8sRe0E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054533FB96
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711108703; cv=none; b=kxzFc8Fe/+XStpuYuXDjUhqGW9XS6AFDQRR9aC8ky4AhrzO0W0EH0Yn4oqZ3LlIusqpkRkjRaAxHf8z0zn4wPmPpypkaE11dFpjfFr+S7zYv398m4cDadb0pCWMhIhgOZ1zNtHTTCimcJIBcF5SjCme+4uTW5NAuFfgn+bRRkPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711108703; c=relaxed/simple;
	bh=98BCJ0NbsVizpp9ZzVzT5Y699xuRAXE4zH1lvoYksiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQH3as8xKoaoh1zkC/azV+cWfwMyRQXwrix9D6uNcwmmubdvh577wQNfFEXILMueeFgXclp8G8ZcM2FjqtAwlbesszinwX50/o0vz0qSS5JhetuuM+VS3uYTacPpL149BNlazvUr8IAl31BgwgpkAniPWI3/7TRaZhONs6FkL2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jh8sRe0E; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d49f7e5d65so24536951fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711108700; x=1711713500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEWAd404OY/0I4ilqKjjt8XNT6iWHXzoQdn72mQR/G0=;
        b=jh8sRe0EGEDr8DyPyTcLm+en3/9ov5yGpGbpJTCV9LtlzX/fhBNVjvrobi/Gn2mPH7
         Jwr/yECXEE0n085DXNkpmK3t3UqXaWwxE8eTgS2fRIACD4KeZBhD5LLAT3EVq3CLc4bU
         F5Avsn1CrMWQLwCFHYrg/3H3eMomaFCWgYip9+ZInoU5SHaRim5WiQSlJK6BMOBCrO7Q
         QT3O918YEM9PT2uZ2jRGlJgNLQrY/7saoh/+EJ7zW+L8ryqvlFeSFqWJshGNPha04tFx
         L76L3UoPGeMrPS2dHKOt6wbIQudYn4BbUVCUQqKwGoOaULVK73pyH9a1vkAsOB3Etd8C
         leNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711108700; x=1711713500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEWAd404OY/0I4ilqKjjt8XNT6iWHXzoQdn72mQR/G0=;
        b=vdBUc8Bx+moMOnYr+w7MKctBdH0pIZeJV0WqwSKfeTbZXeOgkSVA9uMCt4wPJipCRb
         KroLRPny91iG3JhnwfFkJsAoqpDbOdgfkG87v1J/QPc7a+uMtOVSNoxGdb53OIdsggFp
         o0lUpVQQxX70UJRP3Z2S11yoYKEbE6/s5nNYpKZnJMOa4zzcoJKaq2Eq9R44l1oOFr2H
         5Wq5ItkjFaHfGdZ7fSbWhav62/KHSWfJlsYCQpV7FqKffCjzSrfEWIFDL8OtzATVk83S
         tO68zMPrTzTLMLlC/qJZHF9rNi70oFQXdjXGW0HtNssVLO19H7GC8mMRm9oMe1Rdmirj
         Xthw==
X-Gm-Message-State: AOJu0YwVogP4FJahzRO9UalocigFvQHjFuINRvzW6w1Ljws4mO5p22A6
	MlG6YNv4MZHIBaQgUZiZJndxBhgkxq+XUBWtqSqIHbOTb7qu73aGG140e7SLhmQ=
X-Google-Smtp-Source: AGHT+IGg87yMAc0hdZfN4wwcSP7UltswSGgevdpiGD2DHuyQqn9axeOUfU9/rL4N9AE/ZWuimmznhw==
X-Received: by 2002:a2e:2e0b:0:b0:2d6:aff5:1e65 with SMTP id u11-20020a2e2e0b000000b002d6aff51e65mr1469418lju.16.1711108698384;
        Fri, 22 Mar 2024 04:58:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d7-20020a2e8907000000b002d10daeb6dasm307430lji.126.2024.03.22.04.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 04:58:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 13:58:16 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sm8250: describe HS signals properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-typec-fix-sm8250-v1-1-1ac22b333ea9@linaro.org>
References: <20240322-typec-fix-sm8250-v1-0-1ac22b333ea9@linaro.org>
In-Reply-To: <20240322-typec-fix-sm8250-v1-0-1ac22b333ea9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=98BCJ0NbsVizpp9ZzVzT5Y699xuRAXE4zH1lvoYksiQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/XJYDQuh4AMoszLe6Ko2XoV3XCUdNdq3KUnBz
 eq8by4gPE6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf1yWAAKCRCLPIo+Aiko
 1WypB/4gZqLlhCDi6OQO8X76Ew0qC8bPbwLRiZmRdV1gxJhodt+I5yQgsdi3R82CW5BhrV6TcjI
 4Ww6E1lC0dpafpUbkh7SOngl2F5dE23ErkFgq9f615zBwK495/XZGRkH4F0tdzDgulquG2hVlQm
 5N3kwdhqhm5vmK/svzdoXwzod8VIMELwvGfkLZXpXAWOAc43U0mpIeJV9WzywhnUQnRpWrFS5/h
 oeReZoUDLwk/dmzol2Vt5BmEGSeunVFR4U4RfXoWMp87mt54dvO/wd7OCx0Kg3AMd3jP2UqYvcQ
 Vg2aryVZBiZUB73wioZ4TP1mmnajGLT2VCC3boDA8dEUwd+8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The OF graph should describe physical signals. There is no 'role switch'
signal between Type-C connector and the DWC3 USB controller. Instead
there is a HighSpeed signal lane between DWC3 controller and the USB-C
connector. Rename endpoints in accordance to that (this follows the
example lead by other plaforms, including QRB2210 RB1, QRB4210 RB2 and
all PMIC GLINK platforms).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                 | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8250.dtsi                     | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index cd0db4f31d4a..44239d1e57e9 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1356,8 +1356,8 @@ &usb_1_dwc3 {
 	usb-role-switch;
 };
 
-&usb_1_role_switch_out {
-	remote-endpoint = <&pm8150b_role_switch_in>;
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
 };
 
 &usb_1_hsphy {
@@ -1465,8 +1465,8 @@ ports {
 
 			port@0 {
 				reg = <0>;
-				pm8150b_role_switch_in: endpoint {
-					remote-endpoint = <&usb_1_role_switch_out>;
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 6f54f50a70b0..99915a2b97e2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -652,8 +652,8 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				pm8150b_role_switch_in: endpoint {
-					remote-endpoint = <&usb_1_role_switch_out>;
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
 				};
 			};
 		};
@@ -716,8 +716,8 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_1_role_switch_out {
-	remote-endpoint = <&pm8150b_role_switch_in>;
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
 };
 
 &ufs_mem_hc {
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 39bd8f0eba1e..d57039a4c3aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4196,7 +4196,7 @@ usb_1_dwc3: usb@a600000 {
 				phy-names = "usb2-phy", "usb3-phy";
 
 				port {
-					usb_1_role_switch_out: endpoint {};
+					usb_1_dwc3_hs_out: endpoint {};
 				};
 			};
 		};

-- 
2.39.2



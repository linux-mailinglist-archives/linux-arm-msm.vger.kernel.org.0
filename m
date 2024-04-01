Return-Path: <linux-arm-msm+bounces-15977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAFE89460D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 22:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ECCEB2205A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 20:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4854D56473;
	Mon,  1 Apr 2024 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lh7wa/pW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B6250271
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 20:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712003630; cv=none; b=SWD+DLtnyyxlmSIHYbUpSnjSH0L1NudT7Vizp0EbO2UeHBIH9n+4irr/oHys6QUp27MI3+110gDJv/BnayvL5ZbYi1QMyi4GhKuC8C1fScuGZ85X81e1b1W4MosYhDE4sFgtqH8Othb5MlGEKEKMzRlWUDdgZ7T0zLowm9JMzhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712003630; c=relaxed/simple;
	bh=CLQVhmk/27P67Q5DDFf+FMW5mOTK698dPfd2w+evFJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRlC99UKtm+XMB4aSXaMDfEbdPVvIQaNUNX5fmxcoZVtIYwB1+I4ZuKir7IvU2+DPw0cT428vHvGXkhcq6415NSLBBd8nFoaVJ84LoyhsIDhxN1Ay2pKu+IgriE3D5f+FjrKEvK0FDbJ7KWDHo4A2F8ItW+p+E3VXWMPuJnU854=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lh7wa/pW; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513d4559fb4so5396285e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 13:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712003625; x=1712608425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaUekUYydxWYYnPrJdmSSBGQEd6ZZ9qkV24cX+A0hWY=;
        b=Lh7wa/pWworIaC8e/iMNVizLgPQBkujXFyyQ2b/PR4nJxbmKLDHbJ0kvqfOPgb3PeI
         QugMgbqv0QyMa2XYEZO2zpDFJWUu16h1fJCD7q7cg74Az6J+KU8DwKzxDc5dVejPmQk2
         RACVzDhHgvHrkT9Hj3Df5f7pJRRluAFXyPmyZhVqSCaFfy3o/bWHBPSOS29ILhiXNT8G
         3Uh0AKFWnyTOUu1IjLnD8rdFGT7VByDIJ+QhvJOsdjGaeTm7fgpGzpStzdxCGAoL6EUy
         xLfH6mugI4aJyqaGDlrzL5K4e8JcNNCg3NNZenYxQzawmmCbkGYJXS6PveSvDKUW4STe
         m+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712003625; x=1712608425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaUekUYydxWYYnPrJdmSSBGQEd6ZZ9qkV24cX+A0hWY=;
        b=DtC1QqiO5o2mdnWSZXepnt4py+UJG1WLiHjgRYvpR4AxeTGb6fQ1S7i3TQWSHYw9k/
         94f+Zf5hXdnMqibpF5vEHyrD/M/VifpFwrEaGwbvPeN5w8qFu2xt1xPlAgupGUnEWDzU
         0YzuUyx8nc+HkuLkEqjkSkT26D5F5qR8Byplv1XMvOWDtL6RjhQQhYxaVhtBn7FCvsF8
         EfWo9+3F4fdUESdYYvtGD/QZWLNc8IVSF2jbcboAqF4w3fWDk+Kh9xDNHL+fH8Uz3laM
         01Hd1u7xkhiD8H+WEeSrc4NaWoJPk1CmX7QeFhmKlGlqxomcdEloYZ7rM5SJXiNLQOjZ
         +RBg==
X-Gm-Message-State: AOJu0YxmDC/dRQXRMpCGs9GP4Mhmq6B1VNhxrQhzDCyf/Am2Klv0iS9P
	aCGqM9y44Ezt37w+JfUgXmQsLFtKSev5HI41Z+UvIKcypr6tXC7i6T316hybUCo=
X-Google-Smtp-Source: AGHT+IETxbYIRwMi9ZqWd0CXislqKNeCyvvi2z5Yd70SZATtR412rIeowfoqOTOCD0tS3luuJce/KQ==
X-Received: by 2002:a19:e004:0:b0:515:d1c1:c1f8 with SMTP id x4-20020a19e004000000b00515d1c1c1f8mr7558416lfg.64.1712003624989;
        Mon, 01 Apr 2024 13:33:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j11-20020ac2550b000000b00515a6e4bdbdsm1478342lfk.250.2024.04.01.13.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 13:33:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 23:33:42 +0300
Subject: [PATCH v3 3/9] arm64: dts: qcom: sm8250: describe HS signals
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-typec-fix-sm8250-v3-3-604dce3ad103@linaro.org>
References: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
In-Reply-To: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CLQVhmk/27P67Q5DDFf+FMW5mOTK698dPfd2w+evFJI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCxolBUPQlAYOIefb8KyuYOLAtq6877RLYQh43
 QZgXF2CyuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgsaJQAKCRCLPIo+Aiko
 1Wf8B/9Pm78kXmduvIoq5pA27/BiuNgtFW3USGWltyqAMieojp1D5zEE67t/h5A/x1LHwOUyzdd
 g1AkILqZT2wUyg2ZY6JhuZE+voEGEkhYV9bULkhkiT4Egcx0ybtDyoI3OV3uRWoRzpy0jLHdx/0
 5Nm7QTtE8dKEKDPqJ6EQ0Zv61j1Vd51JgtmJU4pHcXTXmQ4am3WU6+G7Dt+RE9BzeFKUQOcOWP5
 Xt4oWGQeUuoFmzWfBTMnFMwyYXgyxvv+kaAL6ZrZ+8T11P7Hwoxk5frc5WW5xNgU5tqGTQvoEAW
 VKGboz6AcVlWLj+SitfgrC1biUXfHGGmp9TOl1HviMK+ZV9X
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The OF graph should describe physical signals. There is no 'role switch'
signal between Type-C connector and the DWC3 USB controller. Instead
there is a HighSpeed signal lane between DWC3 controller and the USB-C
connector. Rename endpoints in accordance to that (this follows the
example lead by other plaforms, including QRB2210 RB1, QRB4210 RB2 and
all PMIC GLINK platforms).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
index 2042020eb0dd..6cc0bcb40f1f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -659,8 +659,8 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				pm8150b_role_switch_in: endpoint {
-					remote-endpoint = <&usb_1_role_switch_out>;
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
 				};
 			};
 		};
@@ -723,8 +723,8 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_1_role_switch_out {
-	remote-endpoint = <&pm8150b_role_switch_in>;
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
 };
 
 &ufs_mem_hc {
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7f2333c9d17d..440bbb89bf8a 100644
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



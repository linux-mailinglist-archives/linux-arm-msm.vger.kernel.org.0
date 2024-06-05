Return-Path: <linux-arm-msm+bounces-21735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 270108FC70F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B10B6285940
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5631B18F2E4;
	Wed,  5 Jun 2024 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PY5JUB7x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726F18C34A
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717577767; cv=none; b=HTeE2iru+N1yQ2PhUtyrXSwFbV1jXrRLNvUP42dGT2RjKZoV1sZWB9MhMtK/VKz3QeydI3wWx5cTpW+Bl3WlYVtUKH1pCfCIMNk6IYvAxtoQNJqPbKPCUjPekipPZJHJ7lVJVicpV9zXTYSEVkdNfPbp9eiioKelA/vWpGtNsfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717577767; c=relaxed/simple;
	bh=+RccpUJwmpU1LzXIIE+Z5WpSTFsSjxa720tthk/FtD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+Sfzp8wIMasx53vXRRZw+gatWtseszlFdGASPCei0oWiGU5eHVYS1EW3ZBj3tdhifCUuRjCDHe9aD2RI7Bx0A7Off/RR75TBcphdYWM5AbYmmyOcZ5802aBI0kYR8qKLlQADMZRG9pOGMIjTP3yeh1jYORClkSgu9W9uYLzmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PY5JUB7x; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eab19e7034so6146061fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 01:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717577764; x=1718182564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kpQnqqqSVuejJPJABBKqggJwaHgc93uYPHXdAev6mI=;
        b=PY5JUB7xejCk8FNt/8+pM3g2fFoceqqnmolQTBbgtHJguBp+ZsJ+fhTBjcBXmNkEq+
         gJju2E8RwVqQDOUchkRYUiaJ8Vz7VTsLgrDzEZjtgShuKm46+Hu2BnjMTf0SgGwoJmIf
         Zg9zN1biZny0m+gxiAO4pUKVd47LMq5jdxpuB7J7PStEtYOdWi3BWCZBAnr7fkAep8Kg
         U5AxidvWTx9Nyxnzopse/Yn+3otQm/5F+29Z163bEDm1WS44I0qW/pArt3N2WD6gf3gM
         hjPsnqMzRemI4jxo72t1Or9Q8hTMh+67Khhj5PzENdc7hWOeMjx+pwoVHPphxkKyxCSS
         dLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577764; x=1718182564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kpQnqqqSVuejJPJABBKqggJwaHgc93uYPHXdAev6mI=;
        b=dVcTDQ5biVFDEFoZFVfwpwRq6MMCubwVHTomxLrvMxwg0HoVc+Byta3bkVo1UXppvW
         PNd3vzcdIbcan3sCw1CHykzcsIdfIpkb0ZLDnNXHf/SxBr9TiQOzvJ7Eg3Wom4YVe+47
         FshGe37VQoqKuldlzLAWMt/9eRMA6pAZyQJHQRpU00enqq7UnLpugR0M9y4PvMyaTzK+
         mzhAXRzaZc1XiCAHfpnYnQBUEVenmPRBBCyOOruZr8r3y2VZ4gmGb64+BoNY7ZuMTGyu
         NRNmP0ayJhQVZ81/2Qn43b9Iwy5cRrCxUhIbTrprdn5Me+ETYC0uyjrPSpgf/4foDXal
         d36g==
X-Forwarded-Encrypted: i=1; AJvYcCXsAaJY+xn6S3arO5+SCEB+rb0LLMdQqt5nAKKxqLwa1R1tqmx0JXb8oCaBz0cVti2N5QzcwWC9fEOs8cAkhbRtRdmrJq/KVvNk/qB+wA==
X-Gm-Message-State: AOJu0Ywms4T1K9+LCgIafFGesg0CBqItD6aBVhXbyYjuwrhRmmG6mn0H
	JmfrKj/yLItcsv3FZweaf17lvmCOcx3Ou/ybMc1hOgB+l2N2+GCgqn+tupqtb/4=
X-Google-Smtp-Source: AGHT+IFDReirRdjjKGPG5ks0aGxVAJHaEgtt9C0ix5ER6U6cIzBhxTbGupz9iH+hYUY6Qm8Vpe7Zug==
X-Received: by 2002:a05:6512:3c9c:b0:52b:94f1:6115 with SMTP id 2adb3069b0e04-52ba229b2dfmr1827078e87.25.1717577763804;
        Wed, 05 Jun 2024 01:56:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f55dsm1715321e87.72.2024.06.05.01.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:56:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 05 Jun 2024 11:55:56 +0300
Subject: [PATCH v2 1/2] arm64: dts: qcom: qrb2210-rb1: switch I2C2 to
 i2c-gpio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-rb12-i2c2g-pio-v2-1-946f5d6b6948@linaro.org>
References: <20240605-rb12-i2c2g-pio-v2-0-946f5d6b6948@linaro.org>
In-Reply-To: <20240605-rb12-i2c2g-pio-v2-0-946f5d6b6948@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+RccpUJwmpU1LzXIIE+Z5WpSTFsSjxa720tthk/FtD0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYCgis+/VKxDqB8zWqxyQONbpETW/6Otdc520y
 t/JSEqJ7kuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmAoIgAKCRCLPIo+Aiko
 1WzvCACxWQwjy6Y1HEw34Nq/jHm0FQPEq7DB5kpZtlaCtNTGX1h+F6lm9acHSt9goc2DzP/vT60
 qusJWxBa09VZQWZMdI1GP1x0YZZrfXQmhtKO5WV1FwrgXEiAVHfZPX9UFK0JfsBCRZFSASmqQBc
 dMPrFeacZrGdrWjwIo53MMFvyIIdTXD9MaxTOX08PIH11UnHl11AKC4bUD4vGS49ztCLUeizOHZ
 t62hy4JK/I+1PVvdJbGtKojLz2fXTirx6OdSoLfvMD7LrBKbsOUCwGjatfb8UEt4mY/igMCTF9C
 oDTeci0yTEEv0f7Du8rtyOD3UTEBdeequCUrtjdt4vRaqud9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the Qualcomm RB1 platform the I2C bus connected to the LT9611UXC
bridge under some circumstances can go into a state when all transfers
timeout. This causes both issues with fetching of EDID and with
updating of the bridge's firmware. While we are debugging the issue,
switch corresponding I2C bus to use i2c-gpio driver. While using
i2c-gpio no communication issues are observed.

This patch is asusmed to be a temporary fix, so it is implemented in a
non-intrusive manner to simply reverting it later.

Fixes: 616eda24edd4 ("arm64: dts: qcom: qrb2210-rb1: Set up HDMI")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index bb5191422660..8c27d52139a1 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -59,6 +59,17 @@ hdmi_con: endpoint {
 		};
 	};
 
+	i2c2_gpio: i2c {
+		compatible = "i2c-gpio";
+
+		sda-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -199,7 +210,7 @@ &gpi_dma0 {
 	status = "okay";
 };
 
-&i2c2 {
+&i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
 

-- 
2.39.2



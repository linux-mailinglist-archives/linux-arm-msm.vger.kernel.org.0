Return-Path: <linux-arm-msm+bounces-7227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 380CF82CEA2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B552F283B06
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFB718AE1;
	Sat, 13 Jan 2024 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXALexM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FBCF517
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso8362318e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179364; x=1705784164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYf6KomQ+q+ORrPOfMtpnxD934CKPfXvUig596j98Xs=;
        b=ZXALexM7NmNWRewQdRxud6U2bhakagD1mPUBGfkNLYM5Qm4Ao7yxA8YIQ/5V3ITnTs
         7TLjyqKasBT3l/YFe10BTnflHdCJF35iCXoRpEW1v/IvObtDiSh1u9a0uX3mX9cScHow
         cJVtkEVO5WHn/9I+axnD74ZJNWsyqvaV922N4kFaz4ESf8oSX6FUVYF4TUOQIRiRTXkx
         ja+EWJgdYv4sMjxf6W3Nx8aolESpVgWwtcV7HKOPNG7L1JnfOG02WMR0ma+UmWKke56g
         THqCj1kYD/EP4hxl8C1nZHpYcsnwjnKOmWPkZygrD+9y5lPYfibIB0YWXmECJlmkI8S7
         7k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179364; x=1705784164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYf6KomQ+q+ORrPOfMtpnxD934CKPfXvUig596j98Xs=;
        b=kB9X3DvmqGjpm5Gl8gueexZ4T6Wd+PKlGWfQSd8Fi+eDDQRC/ZVjI/ILCcGRL+Ffsg
         ETClCA1BcFku4hM+LRKDQFR69xzGi2pEGzzRM2E2jEUeuLzws6LYQG6/na/GjWsHGiaL
         bnBAQ2wanpdO962/yMtnoouLEowtKN1Th5n+YlARTIHICVuSVNV5T2/HIZ8uJxAfnO/L
         PfZjBsd7pY5nENo3nJNZpkQ9KxmF0jcX8Ppzm5ADWnlYUbeCkmB760bYsuvDgg7RVzAj
         7O5H7WtyE6kgC5Ms4q36DFFmLs/FAhSGY/ehIgzVCLA3CbJUCH61mvfqlEzlVJ4qi25N
         yjpA==
X-Gm-Message-State: AOJu0YxoCxKNzVfGseJHbc+5H/40DvWFL2Mws1M33D6DHiVeLCaSCNP5
	vzEwU2Py3bOHQ5EdpVh9+Scg+i223wIWbzhEo+K1ir4ZTKzRCMvm
X-Google-Smtp-Source: AGHT+IHDcDjAUvVuG/RYmKMk8PaIF6toOUKEDOELgS2lKQF4sSHIVkplyiUbGlN4lnvQsER8SeKFKw==
X-Received: by 2002:ac2:4559:0:b0:50e:7915:ace5 with SMTP id j25-20020ac24559000000b0050e7915ace5mr1349568lfm.134.1705179364466;
        Sat, 13 Jan 2024 12:56:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:56:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:57 +0200
Subject: [PATCH v2 14/15] arm64: dts: qcom: sm6115: drop pipe clock
 selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-14-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
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
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PByUN+WAixFhUZidNT3kE48yA7k+ACS3q0ToQ5RNUeQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjYHS9liGQDgqchYSNifXDFPFLI53DOsb+/p
 HdUvWrwW7WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL42AAKCRCLPIo+Aiko
 1XcOB/0UurL9UkPJGLs6cbe4VVnAcRJgSKAPzl6lDHeo8QV1EVryu71ynQ/1z+Sc1Hiqp1clqqz
 hCaPXjqKBsArlbZu1Att0QTPAIK5badK9qegvFaR9iCtsZoXRGOSt3qDMz5wBOp8PhZecAAGyAF
 0D7oNwyHIbUTbf+8nD+HvHcHFfiB4eOx2QJF+RqQL/aOpM4yRYXstYRWysKmAoRBPmXAMgLpVzd
 QESZq5fXyMmp+BxOeuudaSGuSVNmuHetTH6UivpWZrNAlUuv3p1JGTtcBh1MEHaUU19CFjcTkOI
 8LQ4eSDFTDAVJl7QhTxJ/8CIwIsmJZa4FLTmLgYXD8dNHAjU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Stop selecting UTMI clock as the USB3 PIPE clock. This setting is
incompatible with the USB host working in USB3 (SuperSpeed) mode.
While we are at it, also drop the default setting for the port speed.

Fixes: 9dd5f6dba729 ("arm64: dts: qcom: sm6115: Add USB SS qmp phy node")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
[DB: fixed commit message, dropped dr_mode setting]
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ----
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 7c19f874fa71..52f31f3166c2 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -607,10 +607,6 @@ &usb {
 	status = "okay";
 };
 
-&usb_dwc3 {
-	maximum-speed = "super-speed";
-};
-
 &usb_hsphy {
 	vdd-supply = <&vreg_l4a_0p9>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 160e098f1075..76c429e8ebab 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1600,7 +1600,6 @@ &bimc SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
 
-			qcom,select-utmi-as-pipe-clk;
 			status = "disabled";
 
 			usb_dwc3: usb@4e00000 {

-- 
2.39.2



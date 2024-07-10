Return-Path: <linux-arm-msm+bounces-25874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789D92D71E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964481F2631D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 17:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0F4197555;
	Wed, 10 Jul 2024 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsLq3ko0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BA9195FD1
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720631122; cv=none; b=LU5PqKbUXku6XzGZdSHe/hR0aWEBwJzH/VnLmdX2IxHUAjO5f6sQWIXWXqTgiMvzOc6sB+EiGpFDxYn3ViLJlX1DqKfbmRMf87j73KvG5mp3xPs6XMmSbvojTDpIAzCCLQz03lewOD1zeuEkcV482KMhj9Vo/e1RsUpzh1mytoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720631122; c=relaxed/simple;
	bh=UtGbOemBnLSiS/SSxde0/IPn7E11HeciK/KMJx5zgzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXzPUYLvuezBbEO4l/pUwxj4pnf+5YayJIpysm48fJvZh4nQ1sEkVEvaoo+plXbUrKVjH1weMi7Ud9ya3iJ/4e4Y+QEP5IhzG/sduR0guzmCELW7t8Pji2oRn/IvZUQhenLpFNKAwjytLlL7xkQBGHT890vvJEG6KtDKkB6NP3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LsLq3ko0; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52e976208f8so7221546e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720631118; x=1721235918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejuDXxzDzIH7zcxYcOPWRk3uTUuzsIoqRWToUCtONmU=;
        b=LsLq3ko0dEzIxVV03b/Sxfq0ohjNb7DdPmSl2uFnq3WU8jJ13/fccWpT/ATmUPgcuK
         k+Csu+TO8PGmCRyBNyasjp2FDjQ6cdZ0QWIkNL+nE6vkuo8WHimXlRTY/p1FfcfgJw77
         56F45oodFpoGj+RMHwrm/oso9eAwGI7HNKdFS04ZzT1Dl6LYrSiPlCI+Tu9v6AdfNo01
         MG8DlqovWQHyPCVAoIFBCM4aZsHPWJFf19TJQodeKj9G7fN94BMGYuwI7ekFHJ7b9GXa
         LmcUNCVAjfqLIVOmox8yTG6IhYL5ef86ZbR/j/j8VUUohaZxhlaRGoG8deaQXsplmYTt
         Sc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720631118; x=1721235918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejuDXxzDzIH7zcxYcOPWRk3uTUuzsIoqRWToUCtONmU=;
        b=lQuMaPqcLMEkPYPHHo1z8Tog5NVj0cv+aRUzeE3wj8sxlw2Njd0EP5HnV4I8Ir9eqG
         LOcGk3/HtZHaixuunnTAT2S/yfoZVHKz1eaoXqdlD9Xi3RItmkt6ePXvgy6TRMjqFA2q
         +2yIIC9X3DBECejJLZqcQkzg6UMpNVbD+GhhQJ6rgjogRCNha723L+rN2StoHRBgqViV
         oh835Lw5N6Bsrdg8uveTpyf41s/yYdnYi+PuJzq9mK5Cg4CQexolYs+925SZg68SDbL4
         g+t055SPucAoIFJnNy04gLQ5BXN0+E2ssF4jx5QE1/FOPxwEnKZ+0pHIP42nE0ML4r0g
         yH6w==
X-Forwarded-Encrypted: i=1; AJvYcCVD09dmR6z1i2lu4lXJS9HFBQd5a1SHCHArT67Sq5PgmzvxfMh0fypUon+94JY9z7YusH6mpDnNDggFjUOfg+Y2fJCF1yqOEvaDNbJBQw==
X-Gm-Message-State: AOJu0YzQM/29VF9nghB3g49dRg02GAoKeOjj1DKZHAzkIdDHM8pJHp36
	yO6wAJs9ZRviH7GoQYK7ujD5liwegHFUpEDSJn7tQptE8F9bSJrhV9TNTw221+Y=
X-Google-Smtp-Source: AGHT+IEdzDMqSpFrgPIKMoDSkhiU2e+ql+AL5vU9wurvK32RxWDhsTOWJlgEkSrVCpO+E3+Am+YAjQ==
X-Received: by 2002:ac2:4281:0:b0:52e:9471:e533 with SMTP id 2adb3069b0e04-52eb99d5fb9mr3803124e87.66.1720631118372;
        Wed, 10 Jul 2024 10:05:18 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:65e6:93ca:5f80:ea9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7dedfsm5838446f8f.24.2024.07.10.10.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 10:05:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jul 2024 19:05:00 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: x1e80100-crd: Fix backlight
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-x1e80100-crd-backlight-v1-4-eb242311a23e@linaro.org>
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0

The backlight does not work correctly with the current display panel
configuration: It works after boot, but once the display gets disabled it
is not possible to get it back on. It turns out that the ATNA45AF01 panel
needs exactly the same non-standard power sequence as implemented by the
panel-samsung-atna33xc20 driver for sc7180-trogdor-homestar.

Switch the panel in the DT to the new compatible and make two more changes
to make it work correctly:

 1. Add the missing GPIO for the panel EL_ON3 line (EDP_BL_EN on CRD and
    enable-gpios in the DT).
 2. Drop the regulator-always-on for the panel regulator. The panel does
    not seem to power off properly if the regulator stays on.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 6152bcd0bc1f..7d6800dd9b8a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -268,7 +268,6 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		pinctrl-0 = <&edp_reg_en>;
 		pinctrl-names = "default";
 
-		regulator-always-on;
 		regulator-boot-on;
 	};
 
@@ -724,9 +723,13 @@ &mdss_dp3 {
 
 	aux-bus {
 		panel {
-			compatible = "edp-panel";
+			compatible = "samsung,atna45af01";
+			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
@@ -785,6 +788,16 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		input-disable;
+		output-enable;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };

-- 
2.44.1



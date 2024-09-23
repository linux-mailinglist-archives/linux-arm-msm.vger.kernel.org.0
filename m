Return-Path: <linux-arm-msm+bounces-32186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A14DD97E69E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 09:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FEEB1F2280C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 07:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D73E5644E;
	Mon, 23 Sep 2024 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEKULfIi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6152502B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 07:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727076553; cv=none; b=nu0A7pKCfocOMV983Xl6EutgBg88mYPikC52rHZYWVR+CDhaXBAzo9T+aCFuVXaN0rocKBRdIpst6cSggZwFD1tuqptL3wsUWiBjCTpKyqeM0HGNqeDHVV0OvHUFAtCCB1Q5dMsm3q8VzLhX/unn9vWbkenxaJyWwmOc/0osEsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727076553; c=relaxed/simple;
	bh=tFaw6KXY86hMbQIbcttzfO6lDEyEEwPkoBMlSyvbiT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4QJ/pL8GMGHEEyQ9r3GcRgk103VXpaQZAKaDK4WxDex0IGoozSz0yUI1aH8L4Xlza5SNl7JZG7VY9+dcGIIxgMLOk+UGJF6J8BgQZXuQItnYylTKW25LEmbNXzeniEzMXLDIQCPFNFRobdvCXZb0nSP1qZcyktTxuD3Lskz7+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uEKULfIi; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a9a9cae07eso45928285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727076551; x=1727681351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wgNnXvrg8o8t4zipfSpiHUqyxHJSbujSn+QNon+tTo=;
        b=uEKULfIihSsVCeiWTM7Q3LKQvAvmWljaKPoEKQCj/L5el+YY+8TSG6385rmE13HUCJ
         DUitIHtbtqI7ANxpTOFTCPsCRPLKJMzWxDv+SPbL6JVUL40Km+KXpLPH0GQggd5BfFIH
         DYxqjG6hYc6tycV56Zr+jW4ZnArm0sJJnWVAskBo/Q+gI3o56LEvE+KosVIh662E5oAO
         edz7yx5Am6XA7HEh5FyFBfVwC7zuMTTy1qgoLbLwWTm5I+XL+05/SqgsaqfGbQgdswrj
         Frxwr4eHj9P+NlDXRlEVsFk9J7v12opQB+bLFTHKrJLODe6E09ssC9LE5r4eR+WTNs03
         BYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727076551; x=1727681351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wgNnXvrg8o8t4zipfSpiHUqyxHJSbujSn+QNon+tTo=;
        b=PGQHAuyzJSsoJJ4lQ9OZD+t+r6w7uJYt0KenWOQ2mVmiNs4q8ktIUrQ6kG0uXsZo/4
         EUjG2REb5CzVLhFQkmURGO23LBQMPNxgTWM8UBV1jj42LogsxIrgcZlT/Z2ET181+moA
         aoIXeDt+vgPh+IuiSvTnd3jkbccT82aTxEF3aZipViETxAn4CkA1AEnV2PV1tOSXAKQU
         X3GxRVY3tdfnFBz2xAk9a6SLkedbhli5fMCHS6797IAgPrD6WhdQCeaK1p7fafdw+bg6
         Ev4wIr7Z4wkRZ4TzFLCgwZnLRcZwOIYB1j78e4isESGkLIbAMwEZtmnLsYz8Csew7sHe
         zZmA==
X-Forwarded-Encrypted: i=1; AJvYcCXd8f8c8ixNOz7oi+m4/UL/UHxP7zNa3cxQrrNbToVPmhso8LPcYYW9SFE4t7GBt3C7TtcM31bJ5FEf4auH@vger.kernel.org
X-Gm-Message-State: AOJu0YxqsbApqGxZOvNXVCtEYcbYjlqjg907iogqku8+TQEQp6xg+2CS
	veFAPIuEovpvMRqQWVc0YUAqYBCsdex1Fa6RiCjIuZyYuBAQyFT1Me2Tg046NQo=
X-Google-Smtp-Source: AGHT+IHJQDI2HwwKhdUbGM+FNmKSDKzmgVx1HpZfzhq3R43koi3JjFK6uE92zPiu953Z8nKxzWmf4g==
X-Received: by 2002:a05:620a:1a16:b0:7a7:fa37:d43e with SMTP id af79cd13be357-7acb81faadcmr753473585a.9.1727076550884;
        Mon, 23 Sep 2024 00:29:10 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08c182dsm452872285a.75.2024.09.23.00.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 00:29:10 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts
Date: Mon, 23 Sep 2024 10:28:27 +0300
Message-ID: <20240923072827.3772504-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expected type of all CAMSS interrupts is edge rising, fix it in
the CAMSS device tree node for sm8250 platform.

Fixes: 30325603b910 ("arm64: dts: qcom: sm8250: camss: Add CAMSS block definition")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 630f4eff20bf..f4b00cac5fcd 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4481,20 +4481,20 @@ camss: camss@ac6a000 {
 				    "vfe_lite0",
 				    "vfe_lite1";
 
-			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csiphy0",
 					  "csiphy1",
 					  "csiphy2",
-- 
2.45.2



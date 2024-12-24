Return-Path: <linux-arm-msm+bounces-43219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6BC9FBC04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10EA318828CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898DD1B4F3E;
	Tue, 24 Dec 2024 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cg2NWYcg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE4A1B3936
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035157; cv=none; b=qIFf7HrrTna93I7F1ftuGPsIOmhnsJn8cyTWBfvnnPmxFKy0O/5NixIoUkVP63D5T8CYxgkgoZkAcW5qSXGeTShV46emZfM/eNz42SSoHtClbAWNT/viXPPFwu2HOO/0XBdrYzXu255EyU6JoItU672XY7lTgMqzQQGYP1SGr9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035157; c=relaxed/simple;
	bh=Qth8lmPCD2HZ8e7n0fcscU6OItm375v1ZHaNDTxe/k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1T3iodypyR4Yn8PEJHJzry7ztXip0Bse9nn4/vnkbvA/XH5z4VfxLKZxPvNkDjhPoE8sQuwkhTdmgvO4DqvcfEOPbXzlLFfLreypUtudUbMjCsMW2drBDnPhMzdBHi2bMgnC+XbpujMOOqx3eHM38SZ7qSLecz/fO0ty4Z4KEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cg2NWYcg; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-540215984f0so5239891e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035154; x=1735639954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNv7vuo/nVPsOvSPfX1b8QlBVUPniiNuRCRjr7neK+w=;
        b=Cg2NWYcgXS3gGV0XjQXFG180zVG7fGlQwQ7A/NkGKIK6x2bqqIZe0r4EBarr7NS2Qe
         1SGBfN6bCdWPZdcaumM6Wp0X9KJ48Vsxq79PgiHLwudOssK0nbJMwCPbKU24qk4DYvg+
         J7M47zTqVBsl4b1T5pJ5ODxl7LoijkEuPwWxRSp+Ip+tAiAL22xpWDZRi4uBgbPvCalR
         wfrub/6OpfzrInNMS/SFlkiRI+RzJfJtNpVdMd1aOt6UmCVezGC1JavAmJGXnVHEWFoq
         01ie8vIfkyl2pEZxh+6imDuYoUGiac5ZYwqNYC4DZPoZlZLLP+sMk6qMtBy6BGGxwkvk
         BIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035154; x=1735639954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNv7vuo/nVPsOvSPfX1b8QlBVUPniiNuRCRjr7neK+w=;
        b=PyVTFvmT9Gwa+BqfORanRyMQ1/n1s7EsX8RiVNlGUhBC7qZDK0xcxI8O8j7Viz0b9N
         EvMFaViLy+Egn959gtLdOMZVQR9GEZRUTT15SAvMRSQKFByZcLiDIa3PTLb8g4Zgv8td
         ArJk49fyiZ2RfKeFEqquPGEO83EuxK9i/h7uNLa1LRGJ3Abg5W4q+gM4Nc/T+Z6QBTPy
         nZJhxEPsAZNH6WSYZT585f50BRY00Y6eoTvJSulhLhlLo8FRobirR/a0BHZrTpcuXDJx
         mqMyo3/nwrFWkiNOSwXkW03wadLiztjGLsvLMrw9MZAiGu0sbDVinP4Yl4HE2tORv75n
         FS3w==
X-Forwarded-Encrypted: i=1; AJvYcCXUl0tfssnFJJrNsKgU/HaIebxH4Km5ZMfXhmSRh+sEKCkBNcjPC3pRSB8p52fOGRPUlsKRk/8oSYWzMAmN@vger.kernel.org
X-Gm-Message-State: AOJu0YwDI2umDOLwONeJT44ZotGI3b+BLtFRwfUln7MVdv/y/wP8B/O5
	IA6QsVhhQmw8ac/YdS70nZnGHjlkEZittfF/gk//6pVA+i336wEqHOXB+OYYTW4=
X-Gm-Gg: ASbGncuMrdM/bSG7YSHUJpEa6xmpqIbjgafHfHox67u9umXd2+0QdCQKBDE2au4UD33
	2DB+mPdOwh7NAtTtMnXcUAK4GKDcKQmMxJKPaUYpH/BMs2643FPejqfq/XxVWe7f6S15YCLN5pL
	vVFnc9ZSnXxf21dr8fgaIHMX/lcniQx3dq5s3ILq09OjmwTtvuvY06bRlaB3XFC6Y75RxnskFL7
	uLPehgyWJopz8j7Tj2gfHKDPnS9OKYhHA4hMOEJNLFfaz+cwB0AF0K71Sov95NX
X-Google-Smtp-Source: AGHT+IGqnFZxpigpQ9ODtiMrS6DALNNNczOXgsG0KCWv9iCI5/tAgbeiqKkqCBnMr84iq0mo6PD4rg==
X-Received: by 2002:a05:6512:1283:b0:540:3581:5047 with SMTP id 2adb3069b0e04-5422959cfdbmr4227024e87.48.1735035153783;
        Tue, 24 Dec 2024 02:12:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832073sm1574233e87.260.2024.12.24.02.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:12:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:12:13 +0200
Subject: [PATCH 1/4] dt-bindings: clock: qcom,mmcc: support LVDS PLL input
 for apq8064
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-apq8064-fix-mmcc-v1-1-c95d2e2bf143@linaro.org>
References: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
In-Reply-To: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qth8lmPCD2HZ8e7n0fcscU6OItm375v1ZHaNDTxe/k0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaokMnqkvhxjSffwsb2H2ODnrmOrLntpagqmz6
 DSMteYvVxmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qJDAAKCRCLPIo+Aiko
 1XOxB/4kwF9PgbpsVnjxy1HtELAqbnhuecamdGx7qGW052yeXgyQh/vocy6c2Qst83ESM0eeI4u
 bZF/BeIcfFkzleUyyrxuDioDAslxNyw2ETS1R6qDJWLsWdulkwiHmD0BVyXJCgZBypPjGJfBY0B
 ZPbsMnjThr3IZalaU/Xp2pO1Gy5qXMFazELw1oXN+qMV5zm/OnFmtb39oZHL3plfoApdC/gujlj
 e77pvtGMcvjjYg+HbkLDOZwQtsTEVo9304tTM25IHN/hnU9Q9HKRQ02SaT7/fgsjumBP3gv56UP
 Uja8v699FBjAkoq7Cj5yC6Wi3wb7xl4YokuCxkTiyM6v08SP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

APQ8064 / MSM8960 have separate LVDS PLL driving the LVDS / LCDC clock.
Add corresponding input to clock controller bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index aa35a40648ba8a606c9d6286a1916e2cff339f1a..59ac288ca5f12de4f14fac3ce0d783d1ee1ebb4f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -78,6 +78,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 8
           items:
             - description: Board PXO source
             - description: PLL 3 clock
@@ -87,8 +88,10 @@ allOf:
             - description: DSI phy instance 2 dsi clock
             - description: DSI phy instance 2 byte clock
             - description: HDMI phy PLL clock
+            - description: LVDS PLL clock
 
         clock-names:
+          minItems: 8
           items:
             - const: pxo
             - const: pll3
@@ -98,6 +101,7 @@ allOf:
             - const: dsi2pll
             - const: dsi2pllbyte
             - const: hdmipll
+            - const: lvdspll
 
   - if:
       properties:

-- 
2.39.5



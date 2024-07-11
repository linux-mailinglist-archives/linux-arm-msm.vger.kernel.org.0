Return-Path: <linux-arm-msm+bounces-25956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BDD92E56A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 13:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C25CC1F23BD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 11:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE8415B108;
	Thu, 11 Jul 2024 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vaJrJB1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B44015A85F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696049; cv=none; b=t5kAyj51h71Es3fTQN3J50ym69nKyvgsAASBICqoPcR/INBzN/Z5I9QrD35yM7BCPHhNJ8li+269LEQJR2LlS8hJYiDgDb0ku9lmJkPPrLqZyxfHJrF6D8ogHz10N8vBOyPi0ZvuB0ipAaTgWuHosepXkvRmcPHWQKoXC7FE0oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696049; c=relaxed/simple;
	bh=bdr7Qv4L5tPrAAQGniWMZ8aXQvkLhJUYw2j8R49nvvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKt7DP5ak3izjRczGWcVtBM0DoMevXUp9H9RnAB5YPc8DIFhJkhKA+kinuuYfUvvlDHNzcYwvvikjt8HG2kUWRbUZp6LrUXUsu/IDIjuhQ9VJiWHkJ0fzGxWWVbK1sq/XUMr8NG731KXaV5VNDnLSkObhhGp0uLixF5GtWwzSnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vaJrJB1G; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea5dc3c79so1060842e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720696045; x=1721300845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k1josUYaKJccQAezOxNpgtIgEzdm1ySywjOhe1mBcI=;
        b=vaJrJB1G7wb7w+HUtMIbTteYET+PQu+4CqLkWSA6RJM7ssqE+gEopsU9Uy/Cy1A9Pm
         fTolW5VgtmdpAmlxWvPlPtZQ0TEvLw/LWPScIdavgSYYUoTUFPlFhrYbRyONc6WooxxY
         A4jKFiLcxXqupayovqhKyWd7OjDTpTn0MSE9HBeIy8g0Lrf0kCrjnrK225LX7vi+21L6
         IRLnOtVcH0eTJinyQn2HqOD05zpvSGIhPFgy9CTJRl+zqhMdcmNLQ6On5xce9YtX8IEU
         T6qrpVUgTusu+OSNrtRdaa4mlrmfLV3I3mthFEGeQQ3kVuTiPU6Kwa+DgWZOdlsAsQD+
         Bw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696045; x=1721300845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k1josUYaKJccQAezOxNpgtIgEzdm1ySywjOhe1mBcI=;
        b=mgF8ibq2FjEPzNlX4e0FAovu3bgpQIMjRK8H12MkQfONQaZveBeAKfec+df+STWCtS
         0l7OpqKf144KWcNc9+oCR98yMxksHBDRszS51Su27pzp4V7UHrVFI7W93FB5jxpq9cKS
         6Mawx/LV8k+0OwfOPcKIzplDHcRZs/btHPRjIyImTqenNRALjRDecq63o0PzGd1mOI4w
         gJO8ppCBkkR6W7epQNYLEyEtg+lGxTa16B5JG5ErxnK0VRdSbWtR22tiQUHgLsLJuHfw
         Ua/oRyXGXWg4R8b4Ol9qxUjmnFvM7DJFF78RyPbXeOgFGvyVMeQuJhWgE/BASdah5juc
         6dSw==
X-Gm-Message-State: AOJu0YwEHsSgEPtWurxLrdNE/Kuo8fQEKlFNyOPM2++B2QB20oGdAZBa
	Qmlf3BCeCVzlUdHa5lX0lk9ysIFUvQUNiD+wWI3exKYSdEWM7DEUfEmcKOvHX4qv7OjYfrGJS3O
	e
X-Google-Smtp-Source: AGHT+IFJMwFpxedQ55eq8RkosPMI/H4P5xWD6f2RDmkSUZbsv9Lc5g+x23KiZbvtlWcYM7Bm3nhFtQ==
X-Received: by 2002:a05:6512:e92:b0:52c:dfa0:dca0 with SMTP id 2adb3069b0e04-52eb99d323bmr6542914e87.43.1720696045231;
        Thu, 11 Jul 2024 04:07:25 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e097bsm115686685e9.6.2024.07.11.04.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:07:24 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: linux-arm-msm@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/5] ARM: dts: qcom: asus,nexus7-flo: remove duplicate pinctrl handle in i2c nodes
Date: Thu, 11 Jul 2024 12:01:39 +0100
Message-ID: <20240711110545.31641-4-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711110545.31641-2-rayyan.ansari@linaro.org>
References: <20240711110545.31641-2-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove duplicate handle to i2c pins in the device tree, as they are
already set in qcom-apq8064.dtsi.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
v1 -> v2: split from main apq8064 patch 

 arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index d460743fbb94..947183992850 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -125,8 +125,6 @@ &gsbi1 {
 &gsbi1_i2c {
 	status = "okay";
 	clock-frequency = <200000>;
-	pinctrl-0 = <&i2c1_pins>;
-	pinctrl-names = "default";
 
 	eeprom@52 {
 		compatible = "atmel,24c128";
@@ -148,8 +146,6 @@ &gsbi3 {
 
 &gsbi3_i2c {
 	clock-frequency = <200000>;
-	pinctrl-0 = <&i2c3_pins>;
-	pinctrl-names = "default";
 	status = "okay";
 
 	trackpad@10 {
-- 
2.45.2



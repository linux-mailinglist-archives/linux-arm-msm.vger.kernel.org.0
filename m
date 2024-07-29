Return-Path: <linux-arm-msm+bounces-27320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AEA93FFED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 22:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E55B4283410
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 20:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C4818C349;
	Mon, 29 Jul 2024 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFlxC2S9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450E97F484;
	Mon, 29 Jul 2024 20:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722286660; cv=none; b=GF9uxDo+ZfMagjWLR+p07MFL5GqGkFXjE4RLT+Ka9yAlwHoGkUX0qe3s1kamDNF3GUG2j3QylijFtJtRHEbfCRF5osLVkmjk54QAB8VBtdYsETXmUfxQlIIsKUcw5EubUtVn4L80lqsbhfzFWQ4UK9LmOQduWAgEKQh0jO0twY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722286660; c=relaxed/simple;
	bh=F+mwvPBXoLMzjYSMn2EfxWn5boenx+6/6CQfkZwYJ4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQiVuUaFoBMCOJGI21kG9RSGDVkKIrrI2WGY0ukvpbAA55XiAtHM93hHsGqSSFRvU1KHZOyezX/+ULnFAZP/jQE+pZH1GpM7oydDT96Sj15luXVIGVc0huEiOhqg988U40hIj396aNNJNmerS79rdP4WWnwhOv0577tiqxhJf/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFlxC2S9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70d2b27c115so2945884b3a.2;
        Mon, 29 Jul 2024 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722286658; x=1722891458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERKl3Sx+w+cZ4flJtIrrow6K82V5k/KKmUneLiQEpbQ=;
        b=LFlxC2S9KOJvyM6OU3nqUCAQC+4hr47FQBFmTcC30Mm1XuPvM3s6wK5+wfYxGy8ctR
         NGyn7orRObpew4iHikg9EyX8zi8ppJZfU7WCquON8/IqA46FUvUvQKJIGSW5IT8ZpzOQ
         Uw6pznVreH609PC5kNCGoUYWLFxnkFdC1qYypSYMlxyy9nMNiqTCv3K6ft/r1QfV1O+l
         c7yeVtvLtUPJ7fJoaaBRAkNuYVUtBgOu8yh3z+dUQe8utmnKGszVGddsVKQ5Mv9OCPOW
         FlU855woK/U/Fn3EAdEHeYfkj6IMuEM1xEygom08FJ7+nmtMfdfwrwA1rAJ6cmrMr8ef
         SzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722286658; x=1722891458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERKl3Sx+w+cZ4flJtIrrow6K82V5k/KKmUneLiQEpbQ=;
        b=w8gXdZlDU3w3oJWsedCpvmg2SKzw/bEQ53tNdGg2Iu9KEDBaCIhRGUE9UOVUGg+g5A
         WrZWYzlrqWEKbmQ7jxWrx6RYk9+l5hHPW0S7Wrx1hwxuFqw7x2OtgZnaksXsW148QFT5
         74W9ggtnj9U2GJOdTjJYdxZQnHm5BU7LLn/ijwYSzw9C9ehROhft2v0vsgbJ4sdNcAqH
         WNxLUsXYJfgejjJusWaiXWLtUGxmrv1HPqVxKIAC5JzwllFAGg4QJIwNPMeT3jNNZyul
         AhrjV+bfmRnTLl4zlSH0hEqVOYwBp8ofY0s/7xbrl1uLKuykUKArBCLGIMA+d5KTLpBj
         M3cw==
X-Forwarded-Encrypted: i=1; AJvYcCXIlK2ir2N0mSD1nfrcSTl7MaD5Bf6pJilCe5lQVCPV/lQVXhYQBRqrp2c8KWx2UrV8Cfsg8Y9lqpCrgWkyNI2hQGFZFZfByB/cFn2TFH2FGHHRvQo3uxBQqNti0FxyZWWG9BPAh5dzkg==
X-Gm-Message-State: AOJu0YyNoEQzcqWI5nmQOTA4xFs3KFbpUp5tofdp3rh4W6CbqQOHlZpK
	EFrIYXq1H2Gf7AbzJWoKUACwlIO0+FFN1jWxo5kJmDJAqNc7+5yovrvq3A==
X-Google-Smtp-Source: AGHT+IHd8zHlIcDm8Hl9yK0OAeYxEN589zt5m+ynTtCK7eKu09dJkvyX+79AOzKybTXDRUarDuB/zA==
X-Received: by 2002:a05:6a00:3d4e:b0:70a:f3de:3ff with SMTP id d2e1a72fcca58-70ecea30bb4mr10982908b3a.14.1722286657917;
        Mon, 29 Jul 2024 13:57:37 -0700 (PDT)
Received: from localhost ([100.84.200.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8a105bsm7207991b3a.194.2024.07.29.13.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:57:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
Date: Mon, 29 Jul 2024 13:57:25 -0700
Message-ID: <20240729205726.7923-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729205726.7923-1-robdclark@gmail.com>
References: <20240729205726.7923-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Use the correct panel compatible, and wire up enable-gpio.  It is wired
up in the same way as the x1e80100-crd.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
Note that the power-source differs from the CRD.  Figured that out by
diffing $debugfs/gpio.

 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 70977e9fa266..6f8d52c368a4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -190,7 +190,6 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		pinctrl-0 = <&edp_reg_en>;
 		pinctrl-names = "default";
 
-		regulator-always-on;
 		regulator-boot-on;
 	};
 
@@ -592,9 +591,13 @@ &mdss_dp3 {
 
 	aux-bus {
 		panel {
-			compatible = "edp-panel";
+			compatible = "samsung,atna45dc02", "samsung,atna33xc20";
+			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
@@ -669,6 +672,16 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <0>; /* 1.8V */
+		input-disable;
+		output-enable;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
-- 
2.45.2



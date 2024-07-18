Return-Path: <linux-arm-msm+bounces-26597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2DA9351EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 20:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB66828330C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6F6146A85;
	Thu, 18 Jul 2024 18:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiUnQttj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B57146A6B;
	Thu, 18 Jul 2024 18:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721328293; cv=none; b=WHer1vyH2b6hQHSobj3sH/7D20bIbplC2RvUlONcL9ugjBKn5UaitNHAJIfrY+iEtvsuAYufKCqmYR4eHIWS7X/5jh08IeFWsL0wq46Jlqv+CgyZyGkzGu6WxMd+uPQ2ZfIRfbLr61C1uz7kVI282YrpDttynNskSMaz2cfeUHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721328293; c=relaxed/simple;
	bh=9sBK5K4+cHOrE4uvr23RYpMqbNqYy4vqgDPWNqgM0f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5MqI3rBcmx25hJSqCKfOcxvknrBfmxWp2o50B/U0ZlfjNUGqKYNBhBjd2o/CfXodYqb7NJXFLaJ1I2AXFC49sX/N7dZwS4AfDfzDp2Ud6HwBsmAaByeIjLU4Rn9yRMyi383uwOp1TVhAEDLLwYhqENSA2zyf6XphQrPNnjjcUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiUnQttj; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70b42250526so102241b3a.1;
        Thu, 18 Jul 2024 11:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721328291; x=1721933091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvDl0DF23aI2GecrtsR94Ksljs15WLtxcCwOavCMIx8=;
        b=HiUnQttjzG486SL8UACnXHGWuur0GBWhromoquGz9LdD/OikE23rd38NlZ0s0TDkTD
         0bN02sb9bxgW5wsz/Tw/k06uFOisjc8tejZnBAeN8Xbayd9/nYd3utL5OVTEwkgMikle
         01z+vUdaVBS6p8qV3prQyd1x7UiCmk1GoXzIa6KB1xOyYvnPwBS4tYu9SuolLw1H9gWJ
         AyjXquDDIGxAvsw61bsfXWZyF4vYGOY9fiZFHfJ0BqBJGjIUG6HQ0wRonOr5keoGmGxF
         YILhRpyZvEcSZwt97dg/8ZdZHijy+ARVP9B4jaNL+iu43QAxm9kpVxSxfhuWcIGLoVFk
         4uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721328291; x=1721933091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvDl0DF23aI2GecrtsR94Ksljs15WLtxcCwOavCMIx8=;
        b=Mx5mvXsF5bMVyo/d0h87kOAekNuwsHLLtWrUxowvb6zJ8ItfzL+I7eM676U1WN6vx3
         mIsYr6gISrC2sweX1Av0UgVOFbo7yJ19b3zD9/mQzCVGjO+41yMwlZtDGDK5DK8YL55S
         FU/+5vIJe9m6gXdrAFZQb4G6AZJL4POC87haoKaHIUaKTHbSV2LbLcXBIZ6bAdY2c+Xt
         BipYqhH4IqXkQUdi/Q09MY5iNLyITqO7gvEYsiftPrHU63ykKoGFOl5NV0s4DvIySrHB
         zdwinnYfYAi28FKLUJ0p3QRLaRZ7mWB88YBXdpU05RRBel/ew00W8BqSYNNCdLkXw4kc
         5BWw==
X-Forwarded-Encrypted: i=1; AJvYcCWxpq7w/6IR6g8i8GtCFWBcEkrVfiktf+I5+1YxOwe/lQv0EevIyxeTkClVgSWQAD34QhC2dXDz42obfqqGGZh/JLMEO3rMBf037aVzjpIJc2Pl4oojkuplE+NnoRBc1BDT0Y7USkUFqg==
X-Gm-Message-State: AOJu0Ywu/eZnY9bAqnv/EIEbuWjQ2iqjjFdECl2agVtuRPLsJQvOQA1N
	RLt61HMagHYC2weiU7d6DQkd52NDssQAkCIex3rnxtpHms+K9NgjZ0m99A==
X-Google-Smtp-Source: AGHT+IGVCt3HDoliN6B65VoDbWa2i+0NWVOj7HIVlmx/hURkPU4govXcszxyEECDWMTBN6bK357ibg==
X-Received: by 2002:a05:6a00:c92:b0:70a:f38c:74ba with SMTP id d2e1a72fcca58-70ce5069e69mr7990334b3a.22.1721328290542;
        Thu, 18 Jul 2024 11:44:50 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:3279:d3cd:5dde:c799])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cfc72fbadsm150800b3a.90.2024.07.18.11.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 11:44:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Doug Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
Date: Thu, 18 Jul 2024 11:44:34 -0700
Message-ID: <20240718184434.6307-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718184434.6307-1-robdclark@gmail.com>
References: <20240718184434.6307-1-robdclark@gmail.com>
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
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index f569f0fbd1fc..37ef05f8c7e0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -592,9 +592,13 @@ &mdss_dp3 {
 
 	aux-bus {
 		panel {
-			compatible = "edp-panel";
+			compatible = "samsung,atna45dc02";
+			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
@@ -663,6 +667,13 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
-- 
2.45.2



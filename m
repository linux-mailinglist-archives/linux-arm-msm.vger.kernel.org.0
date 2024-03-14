Return-Path: <linux-arm-msm+bounces-14125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D374387BBE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 12:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB577B2177D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 11:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA92F6CDD7;
	Thu, 14 Mar 2024 11:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e02Lk7fr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6446EB74
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710415624; cv=none; b=DaxKaza4ZQf3PQqzKahNw524PdzMFn2SKVwIk28bvjT3gA8Dhja1y9H3UqSUWLDKFlM4VlVNe0+Z1sqX1U5YcovC8OBrtPwBgxBgmZwzMtZ6zhXc9M8MMo9B5p+vTwBrLCrAkqjffotddWhWFa15vITRVwbi326AGnsK6Ps9dy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710415624; c=relaxed/simple;
	bh=NZQktpdrtfs7qW27jx8uDV2H4cOGOdMPNZEZKyZNqn4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A3a3Bd5cXzbIRLCgp0WWuWveKjlR9Xdg7tYlb9OJVgIIQGQPDBZHYNs7AF2qBqnwyDhRgfMGPVJB0jbgTd10hYnWj2n4oNRoshrvOvossnbZ92pxcYr3q92UY8pXGoEHNVfuBBNW9pH7iKRKuL/XN0ubjNS6nEarm+RQGE9q1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e02Lk7fr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513cf9bacf1so930743e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 04:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710415621; x=1711020421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RqhAHkzb4BHsXhRmp42tjCgM0t0AB1g5Lp7YtW1X1vg=;
        b=e02Lk7frLO8mGFG2llXaOzkBKU7MbQLlhs3kBLmkjjbWK7ISkzfHp9TNSZNSHDw684
         g7i0y8ZNhCoXeL1UiJG9DSUJkl2+W4b7VEgrNu2RE9l9zHiDjiWf1k2uapEA6S5kJjn+
         MFAEudv5fm5ZUTqsyTESSK2JWTCccGsYFGqmuljv+UQYfLeGSUD+XNl0WO7eOpseOpgB
         YIw/AGMtGdQ4MeEX0TmEvqwcOjqZGJA25h1h4e+3idxe9tvmgA6Te44UFdPKA5qRuIyl
         fNds+KudlkYqd3v8AC9cTw+uvSgj42YnwnTAXVyLtXGUdObi2WikMURQiktU6jL6tvDm
         slVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710415621; x=1711020421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqhAHkzb4BHsXhRmp42tjCgM0t0AB1g5Lp7YtW1X1vg=;
        b=IKyIf21oxkSeFLeV0jyIyGnbZwMNnM55FQ0e5IqrfCh8/cLkJVgLohPB7/1wogkbpf
         OHYi12XCamkdJOuE2DaIsbhVzOaqTpI9rHvs2/K6KAzymFsdkdd9KFgeuATr26shJjLH
         krx2fks0GMIrda24ZnmXa31R8yO5lxdXx7wqyBJgQ1EnUFamZEMyIUcUeuV8kllYkGJr
         5HVNnZYTfG4bmQND7sT954vx2iitoAWIzop7Ou4mRKm57/5y3ySktyHbXZR+yZ19rTxx
         O1e3ckJTz9pUT9IbH2fE+6YWtJTt2RvJutdnL7rj+aP58Yhpz+mTWV44dAZrdWjUbTSA
         dVHA==
X-Forwarded-Encrypted: i=1; AJvYcCX34UwaF4T3NMEjQU0F5d5/wC5+fap9RPaC7chPCyZkB1PG3IycxN64nXkFl7Nb3ZkFrqKwhXyv2OSzzuOLVDMoLW72oFpV9x0ryEVQUg==
X-Gm-Message-State: AOJu0YzvATbur41DPEI2SCR4jVFBvtzYB9IN5KshSqZvJwEiJx1oEZjT
	xajiHfQ4Yyiw7XXjJcAsXqxr8KrNGYFDUWIbo8eA3tY4Q9inzMB+3UGvAn+Sr5g=
X-Google-Smtp-Source: AGHT+IFiOaTUBm/dmApeywx7C2FjUTaLu385b2URTg8PSx1WzFj+iIemPcjjAzN72x90SEFH8nsUrg==
X-Received: by 2002:a19:8c47:0:b0:513:b062:98c4 with SMTP id i7-20020a198c47000000b00513b06298c4mr950278lfj.11.1710415621009;
        Thu, 14 Mar 2024 04:27:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id j16-20020adfe510000000b0033e42ab5114sm560922wrm.2.2024.03.14.04.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 04:27:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH] arm64: dts: qcom: apq8016-sbc: correct GPIO LEDs node names
Date: Thu, 14 Mar 2024 12:26:57 +0100
Message-Id: <20240314112657.167006-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Individual LEDs in a GPIO LEDs device node are not addressable, thus
unit address is not correct.

dtc is also not happy:

  Warning (unit_address_vs_reg): /leds/led@5: node has a unit name, but no reg or ranges property

Reported-by: Sumit Garg <sumit.garg@linaro.org>
Closes: https://lore.kernel.org/all/CAFA6WYNRwF7GqhBk2B7i-deT3aLxNQckhnOasjip2TYm4HZgAw@mail.gmail.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 9ffad7d1f2b6..aba08424aa38 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -91,7 +91,7 @@ leds {
 
 		compatible = "gpio-leds";
 
-		led@1 {
+		led-1 {
 			label = "apq8016-sbc:green:user1";
 			function = LED_FUNCTION_HEARTBEAT;
 			color = <LED_COLOR_ID_GREEN>;
@@ -100,7 +100,7 @@ led@1 {
 			default-state = "off";
 		};
 
-		led@2 {
+		led-2 {
 			label = "apq8016-sbc:green:user2";
 			function = LED_FUNCTION_DISK_ACTIVITY;
 			color = <LED_COLOR_ID_GREEN>;
@@ -109,7 +109,7 @@ led@2 {
 			default-state = "off";
 		};
 
-		led@3 {
+		led-3 {
 			label = "apq8016-sbc:green:user3";
 			function = LED_FUNCTION_DISK_ACTIVITY;
 			color = <LED_COLOR_ID_GREEN>;
@@ -118,7 +118,7 @@ led@3 {
 			default-state = "off";
 		};
 
-		led@4 {
+		led-4 {
 			label = "apq8016-sbc:green:user4";
 			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&pm8916_gpios 2 GPIO_ACTIVE_HIGH>;
@@ -127,7 +127,7 @@ led@4 {
 			default-state = "off";
 		};
 
-		led@5 {
+		led-5 {
 			label = "apq8016-sbc:yellow:wlan";
 			function = LED_FUNCTION_WLAN;
 			color = <LED_COLOR_ID_YELLOW>;
@@ -136,7 +136,7 @@ led@5 {
 			default-state = "off";
 		};
 
-		led@6 {
+		led-6 {
 			label = "apq8016-sbc:blue:bt";
 			function = LED_FUNCTION_BLUETOOTH;
 			color = <LED_COLOR_ID_BLUE>;
-- 
2.34.1



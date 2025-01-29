Return-Path: <linux-arm-msm+bounces-46494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE0A21B17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42077188845B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 10:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A261B0435;
	Wed, 29 Jan 2025 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YD1xVnzw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DDE19F487
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738147252; cv=none; b=aOdVXKfOcipvsrJxRfTC3RAeNvYbSmCtyNQPlV2IKlNGEqeq5KF/MAFIt4sSnbL+OGjeUujCYamR9psrft3O33nkmV6hTDJXzoNBAxHkQQNy3GmNsvYCVW6Qg3t6mXxJIf7zaTZXURZ2BnRKFQ6y1Crb25CDotSmwOW4VcbMFl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738147252; c=relaxed/simple;
	bh=vSoWV0VGv0peVl0kRTkz4N7s8x47L2yDhqYC0POt8Wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m6yAT2Bcai/vGmCxl5tQkPZN4CNSKw1Aio1Nhfsd7G1mY9Z/MtYjLJpzP5Kw9oicUSKeTUfn4s/IRqsxLe/ncv/XTAWJIMaLdBKPVmc78oiLh0JHaN/L60h9FGZRkuGfOGrpfxMz0PFE7948Rxzsjn+oVGYKokrJ7efHXA6/Has=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YD1xVnzw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3612454f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 02:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738147248; x=1738752048; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GM2FkveSmeT/ifZcYkvEJxk0YOsQhqWXppQ6+s3P/EY=;
        b=YD1xVnzwK0LrGW3yrNzGY7ZsnMpQRUb0fMczjj7MMUJQYg8UV26oW9FGChyW1zvsC0
         HDUCmCDu5JtOW5h+sB1N440wctTyP3cHjfXm8FVDMRfbGgX4UYNVQQ7jPrzIBeCTa9eE
         lRtz4956FhgKvvUXCuuGV+3UDGYpALGSi5NHkSRN1cdSUxTnvL716NSYQ4PTIbSiST19
         4xxnvppKFB4k8glCFWnPeql/iZAwLrYwZR0E7YgaeHfm+NJDAA+T/S4uajagIsEJ7ccZ
         F+dmvde6K8YJ+xXcKMZbsBSVNpL5PuS01g6TY9dKQ1xqNJeV5/nzwjkg/cta8+OkzQMm
         +f8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738147248; x=1738752048;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GM2FkveSmeT/ifZcYkvEJxk0YOsQhqWXppQ6+s3P/EY=;
        b=IrDoSryMH2h7LmGhRP+F6QGGYhzumWhou7hW5OUZR84v68TvbOMVbXf1T/z4CvuCND
         E2lieZ6EsrONgCXkyhmSUEQxGx/vcw9ytSaX+FxmCQuMI+1SuRdQEST1iEYtysd/63Qz
         f/W/a22M/svlVw921KHTI/rVD/kUoPHfEQ0DTmCkeTLdNHcyicoz4yaXNaByc9sXK3K9
         jObKw5wnMrabdNY7Z8zJv4Sij0ePMYodo7+1tjFqFYLq1VJeeru95CtGyV8YTQv4iGCS
         k+S5RnJbku7X8dbWwHFSFo9ON4ukGXVWNJ0DL/1TLbGiKVEwJTTVC/0uaCYWY4WHOmmd
         EJvQ==
X-Gm-Message-State: AOJu0YzuEDG1/LSAG7YjmoGoQolhR0/oZBlgRnJ6crTIA9fWto0khuci
	JIbvX7k9wDI2y5lousywlStMWZD0+85X+UoGLJbZx+4738Fg/56aCeVe9zxARhI=
X-Gm-Gg: ASbGncuy1Y1lMpTwlENe/nX8PjLj6Pt/WAagpZqnbCXIzJsOz9j1xIB6NEGSzi6SINc
	LBYlxB4gEzOfrykKLGLQNEUINEVnkj4r73rDzxdMJPxqT9wB4K0x2M8PauKCH6qwfNliEUhMmAw
	uzvzrVPa9BtavG4VcZHK2bOIrI3daEHeu7mR378AuJF1sPraHxFIcm81HQhstUpMvlagVDytXkx
	+O2isYyBE6gI6dDRPja+AxF9d4oB/OvlOkIgOpqrBFl0neUy5EclTcn0MP3a5BAZFoFgPvZo7wo
	O1tGKwqBpoXIvT/waxbl5weISWG3E1rLQTt/
X-Google-Smtp-Source: AGHT+IEo6tTkfuoHvRbwRM54QhEgHlVHx2lzfOPvYYUpGdDm6TJusQG0c7s4uNn/GmrCQ3rMz5JW1A==
X-Received: by 2002:a5d:64e9:0:b0:385:db39:2cf with SMTP id ffacd0b85a97d-38c5195f334mr1803231f8f.12.1738147247972;
        Wed, 29 Jan 2025 02:40:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc11ae6sm18468515e9.6.2025.01.29.02.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 02:40:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 29 Jan 2025 11:40:25 +0100
Subject: [PATCH] arm64: dts: qcom: sm8650: harmonize all unregulated
 thermal trip points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-topic-sm8650-other-thermal-fixes-v1-1-2ceb36bdcd6e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJgFmmcC/x2MywqDMBAAf0X27EKSGl+/UnpY4qoLaiQrpSD+e
 6OXgWFgTlBOwgp9cULir6jELYstCwgzbROjDNnBGeeNdR0ecZeAura1NxiPmRPeWGnBUX6s2Di
 qXjZQZ8lD3uyJn5Av7891/QFggg6kcgAAAA==
X-Change-ID: 20250129-topic-sm8650-other-thermal-fixes-72a431ca91a5
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10671;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vSoWV0VGv0peVl0kRTkz4N7s8x47L2yDhqYC0POt8Wg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnmgWuzoCJQ4lpMw0SXCQ6d4xqiSHsIEfVrpDFVpTG
 Bgpt0NSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ5oFrgAKCRB33NvayMhJ0SmjD/
 9KrHefU+xfw/gYQklNC1zTX5T/F5lFeA525ykfZaAxDAelGUMU0NCTkJ/bWKWB4v6Z/wee6s4HFUJa
 pmP2scfQP3fx3ogu7uvlMYvvoAf6ncUy3lNAbs+vFPW43yRhG36zQAym53PZFg0xifV5DZosZ7e0Tf
 VNGAQ7OAbc0PweOvKea4JLEOfrPZxgjkeDOvjEdo25zH4VDNf8zH0+IyVmLPskwOathyFIAMRArYq7
 tsPr0aKTX2pn2HjKt8O8Ef0zKaeDWBXomUWadiF7hF+f4dls8cWC53HqX6nyiHpV0zpK/1AWPus1bN
 3CChWJCGqFh2LJXEsWu+bm6wKs4jRF88WJfWmEiKMGFhGSlV1i/1XKJbaUVXZXcp2ZxhqzYKfG5fu0
 mhWGdLXeGebvQAfSWFn41DQAPFvTHWmjVGG8ctVV85tK9sMSCUMHErO95wTUP9OQ01pUabAMWH57bq
 ISB3LYtJ/0hvqOJMtsTsV1XPmHZ74mLMnGTg8Uz/PSaI0elaz+K7h0KMIzvu4ONSI8rTh8xlEiwigY
 ToiQ11cv8jlFOZsTQRKF1jbjRyaWX4Wv/XjfV6g/FiP8ynaD6HH0+oXl0zNg8/QCugzU+19NSBV18A
 p36pAYczBtzMbqGy+NGg+XPP2kZ2442fRsx9JXVRCmUmYK9IVePwRJV/lfPw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

While the CPUs thermal is handled by the LMH, and GPU has a passive
cooldowm via the HLOS DCVS, all the other thermal blocks only have
hot and critical and no passive/active trip points.

Passive or active thermal management for those blocks should
be either defined if somehow we can express those in DT or
in the board definition if there's an active cooling device
available.

Cleanup the trip points names and adjust the temperatures to
the downstream reference implementation where the following
trip points are defined:
- "reset-mon" to 115C
- "thermal-engine" to 125C
where we can map them to hot and critical trip points.

In the case a passive or active cooling device would be
available, the downstream reference implementation uses
the 95C "tj" trip point, as we already use for the
gpuss thermal blocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Depends on:
- https://lore.kernel.org/all/20250129-topic-sm8650-thermal-cpu-idle-v3-0-62ab1a64098d@linaro.org/
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 170 +++++++++++++++++------------------
 1 file changed, 85 insertions(+), 85 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 3ec3a65ddd612e83cab6a1f574813aed2e99b4cf..0dd81aad8c5b6e710b31f489205444b154d898be 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5843,14 +5843,14 @@ aoss0-thermal {
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				aoss0-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				aoss0-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5861,14 +5861,14 @@ cpuss0-thermal {
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				cpuss0-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				cpuss0-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5879,14 +5879,14 @@ cpuss1-thermal {
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				cpuss1-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				cpuss1-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5897,14 +5897,14 @@ cpuss2-thermal {
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				cpuss2-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				cpuss2-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5915,14 +5915,14 @@ cpuss3-thermal {
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				cpuss3-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				cpuss3-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6053,14 +6053,14 @@ aoss1-thermal {
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				aoss1-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				aoss1-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6133,14 +6133,14 @@ nsphvx0-thermal {
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphvx0-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
-				nsphvx1-critical {
-					temperature = <110000>;
+				nsphvx0-critical {
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6153,14 +6153,14 @@ nsphvx1-thermal {
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphvx1-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				nsphvx1-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6173,14 +6173,14 @@ nsphmx0-thermal {
 			thermal-sensors = <&tsens2 8>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphmx0-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				nsphmx0-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6193,14 +6193,14 @@ nsphmx1-thermal {
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphmx1-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				nsphmx1-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6213,14 +6213,14 @@ nsphmx2-thermal {
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphmx2-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				nsphmx2-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6233,14 +6233,14 @@ nsphmx3-thermal {
 			thermal-sensors = <&tsens2 11>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphmx3-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				nsphmx3-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6253,14 +6253,14 @@ video-thermal {
 			thermal-sensors = <&tsens1 12>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				video-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				video-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6273,14 +6273,14 @@ ddr-thermal {
 			thermal-sensors = <&tsens1 13>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				ddr-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				ddr-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6291,14 +6291,14 @@ camera0-thermal {
 			thermal-sensors = <&tsens1 14>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				camera0-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				camera0-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6309,14 +6309,14 @@ camera1-thermal {
 			thermal-sensors = <&tsens1 15>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				camera1-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				camera1-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6327,14 +6327,14 @@ aoss2-thermal {
 			thermal-sensors = <&tsens2 0>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				aoss2-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				aoss2-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6609,14 +6609,14 @@ modem0-thermal {
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				modem0-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				modem0-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6627,14 +6627,14 @@ modem1-thermal {
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				modem1-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				modem1-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6645,14 +6645,14 @@ modem2-thermal {
 			thermal-sensors = <&tsens2 11>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				modem2-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				modem2-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6663,14 +6663,14 @@ modem3-thermal {
 			thermal-sensors = <&tsens2 12>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				modem3-hot {
+					temperature = <115000>;
+					hysteresis = <5000>;
 					type = "hot";
 				};
 
 				modem3-critical {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <0>;
 					type = "critical";
 				};

---
base-commit: 2616c1ec96d966abb922248fe48b12dbd4297dfc
change-id: 20250129-topic-sm8650-other-thermal-fixes-72a431ca91a5

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>



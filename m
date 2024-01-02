Return-Path: <linux-arm-msm+bounces-6241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA99821CBC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 14:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37098B21DDC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 13:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A743156C3;
	Tue,  2 Jan 2024 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="elwO62J9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AF915480
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a27cd5850d6so182051966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 05:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704202467; x=1704807267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSwJ3dWt9hLdZitz3UKxb0LWEVzUSjaE6+PW7S8QElA=;
        b=elwO62J9b5ComZpKiK1cYMNmxaVk7hZZRjm+ecy8JWQnFb0Ptl5l3h+tTdUXcssRAY
         nkpY38Plqzv9WF+KibVNjUU7wQzOUHSXg+Iy9dcnxVTY5ryJXrEWChJdDrvb+UIHlJa9
         7nEm61XAFnDqYMP+b/Etrm9z/WRRUsL0vK5j9NFrCHRarmianRDjrnMgOfzzoggkchTN
         ubWcG9iy93/+8KBUPQCHw8Q993pJIaQmcNkxhYqp2MF62M3xGJhgGSIiwzSiWHxPS3dt
         2Crz6jBGrsvvU2WFi3DfPPtTT0shpARY1r8UAczoPFWq9+YRcAsbfxtMdpBuxSB/gvZd
         51EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202467; x=1704807267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSwJ3dWt9hLdZitz3UKxb0LWEVzUSjaE6+PW7S8QElA=;
        b=gbRc/GUM2GxwDYI70ZADRAVuxOXdq4cdJhmYuATlYe91HJdDFW6KSi6aCPnJ0SoTte
         ECDmD9lmDPv3KTiirdL8SGA7PYzFL9WN+08uncAQ5YSGv1p+4wFRC8WVx82gWiV8AFHS
         emIj8MwhdW1E7pC0WAWW/g8CnmiB/Vw9y/ilLYFjTQAiDYz2PSLF5NnCtfNKFmtmuqIn
         oy8Mu9rlTdHD1U+Kto9oRjOcTE50bs3OamCMVJkEuKVAWCTbbjXwuq+vHgrMI4iDNIdL
         ZPC421ZmbIwRf5VM4zly+QPe58gkzuP5EwCu00vUvBdyrHJMgsonSxZC41Rir8I8166y
         Ji/Q==
X-Gm-Message-State: AOJu0YwLiqK2u5RYvatdS5lwa1SHJBrPODJgDJWjkJgsiA5svGnHQ6Ni
	vF41/o8gzC3Uto+bKkeeHRQyayjDzeXUmQ==
X-Google-Smtp-Source: AGHT+IGNAUQBxxGRxw0Z1emMUM65xsCmnItNzNDBJuc/+VVUXAWl6/S60faEyrK5h6THAfAxtrxbhw==
X-Received: by 2002:a17:907:6e90:b0:a23:482:ee74 with SMTP id sh16-20020a1709076e9000b00a230482ee74mr10023202ejc.28.1704202467733;
        Tue, 02 Jan 2024 05:34:27 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906109700b00a26af5717e9sm10950923eju.42.2024.01.02.05.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:34:27 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 02 Jan 2024 14:34:11 +0100
Subject: [PATCH 07/12] arm64: dts: qcom: sm8150: Hook up GPU cooling device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-topic-gpu_cooling-v1-7-fda30c57e353@linaro.org>
References: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org>
In-Reply-To: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704202458; l=1570;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=R9UqwjL5lclX35BC6In859XOY8l0XNfuxqV/TqSMFgg=;
 b=BNkMeNbXaJ10HkdGRUb2ZV21Yr//wjNQZDgCON/DdlpdjArHzNIWV5+pwtOYP5/+n9NzemHZ6
 A7F+B3icE7hCqTicsjp96JJxapM14kxjy5vqPEvoltz0azfEIH64C+2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

In order to allow for throttling the GPU, hook up the cooling device
to the respective thermal zones. Also, update the trip point label
to be more telling, while at it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 761a6757dc26..26dbda713e51 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2198,6 +2198,7 @@ gpu: gpu@2c00000 {
 
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
+			#cooling-cells = <2>;
 
 			status = "disabled";
 
@@ -5101,8 +5102,15 @@ gpu-top-thermal {
 
 			thermal-sensors = <&tsens0 15>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu_top_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				gpu1_alert0: trip-point0 {
+				gpu_top_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -5281,8 +5289,15 @@ gpu-bottom-thermal {
 
 			thermal-sensors = <&tsens1 11>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu_bottom_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				gpu2_alert0: trip-point0 {
+				gpu_bottom_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";

-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-6245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E894821CC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 14:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A0421F22B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 13:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B62615EAE;
	Tue,  2 Jan 2024 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XnsYIjjZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E2815AE6
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a22f59c6ae6so1096539366b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 05:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704202474; x=1704807274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OWoK94k92VUFweM74Xj1aKbQd5zya8fwaKZhm4CVmg=;
        b=XnsYIjjZZNuoFgTW02++aePrM2kZJjBFWT3j8WaUWtosp3HLr11oHo4V44l7csyTYu
         IUcuHAk4nCs4YQxS5EN48162rkL68zR3dmKBJriZ73x0Pm4mJUpIs6cmxcMnA1Ee/S6Y
         eoBwmG1/QiQfkcMGyZK6wR3mpnb36AXM6LHj2zu2ZhvMjNtlEC/RCPos96R7Dox5uVFq
         wvvH92ZzN9u+NkhQBRy2q3K+Rn2hHOnVziHbfarYh3ccFScKVyD4q27S74PjMk5aCCOT
         XTiwuCJNpLe2X7s1vDE4IM0TSJyxubiU1UEuOLYNNXPYe4ckZ6XAWCcKI0szlN/jseIU
         6SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202474; x=1704807274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OWoK94k92VUFweM74Xj1aKbQd5zya8fwaKZhm4CVmg=;
        b=BRGUn2mMtVUI++UHVFBZ/fiizdPotJSrpii2NVNAFLS9llAGAWn4SUfchf3CjppooE
         anY3UrH4HCLso+WRDgZ6gtpTOKm5SLoPkTUf16lBWEe8oPZm+7E+Op3BrYlxfkmFK6nn
         /ptLWR9Q4/2OWPrlM1vAUq95KagJEETqBVH4+Abx2OaLU98a/pga2xwFo91w0GO5TWFx
         edbhucB7JrBfH4TCWN6tld7cVZ5G4Ju2SYGdsPCKvfgbFmKgu6vI+v90c0wfZvvP0sTh
         rUEDCDJ3tFWa5E0cfJNtkgZilG3VBBHgxK5LA01EndtmI9L+IpJMow5isy3aTEAuCKU5
         C+Kw==
X-Gm-Message-State: AOJu0Yx1+ryEiyA4VV1PBGvN2+pbwLB5PILaPLSnr0ox2r34GHECRd35
	txbvYJzcYcsj6aoCW+P++LlAkrGAmMSLYg==
X-Google-Smtp-Source: AGHT+IF+MDXfI8BaBqbcHm6bZ3CkBKXixZxWmG37C04Vtaefl/tQfJrcOrcyxc56AYfTZDdFlsqAhA==
X-Received: by 2002:a17:906:51c2:b0:a28:c5e:290 with SMTP id v2-20020a17090651c200b00a280c5e0290mr544966ejk.195.1704202473813;
        Tue, 02 Jan 2024 05:34:33 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906109700b00a26af5717e9sm10950923eju.42.2024.01.02.05.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:34:33 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 02 Jan 2024 14:34:15 +0100
Subject: [PATCH 11/12] arm64: dts: qcom: sm8550: Hook up GPU cooling device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-topic-gpu_cooling-v1-11-fda30c57e353@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704202458; l=3486;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=rW4SZBJO/MEJiHsIskIiQj25wMjK7Vc4dTt0OTlDOT0=;
 b=XBOYil/f7zB0TAbiezwtYvDkKoayOi71ifq19Dd3g4yC6gyVppwcjHagkNDVq9GVqgkg9sXuc
 u+F/WN8x7hDAq46XGZtDKEW3j4q6YQR38AuoeAJVwtf3PJdUcZlXztL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

In order to allow for throttling the GPU, hook up the cooling device
to the respective thermal zones. Also, unify the naming scheme of the
thermal zones across the tree while at it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index ee1ba5a8c8fc..692cd85f03fb 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2012,6 +2012,7 @@ gpu: gpu@3d00000 {
 			operating-points-v2 = <&gpu_opp_table>;
 
 			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
 
 			status = "disabled";
 
@@ -5304,6 +5305,13 @@ gpuss-0-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens2 1>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu0_junction_config>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				thermal-engine-config {
 					temperature = <125000>;
@@ -5336,6 +5344,13 @@ gpuss-1-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens2 2>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu1_junction_config>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				thermal-engine-config {
 					temperature = <125000>;
@@ -5368,6 +5383,13 @@ gpuss-2-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens2 3>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu2_junction_config>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				thermal-engine-config {
 					temperature = <125000>;
@@ -5400,6 +5422,13 @@ gpuss-3-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens2 4>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu3_junction_config>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				thermal-engine-config {
 					temperature = <125000>;
@@ -5432,6 +5461,13 @@ gpuss-4-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens2 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu4_junction_config>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				thermal-engine-config {
 					temperature = <125000>;
@@ -5464,6 +5500,13 @@ gpuss-5-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens2 6>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu5_junction_config>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				thermal-engine-config {
 					temperature = <125000>;
@@ -5496,6 +5539,13 @@ gpuss-6-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens2 7>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu6_junction_config>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				thermal-engine-config {
 					temperature = <125000>;
@@ -5528,6 +5578,13 @@ gpuss-7-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens2 8>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu7_junction_config>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				thermal-engine-config {
 					temperature = <125000>;

-- 
2.43.0



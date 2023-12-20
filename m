Return-Path: <linux-arm-msm+bounces-5631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33A81A8DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 23:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA564283638
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 22:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DFF4B5A4;
	Wed, 20 Dec 2023 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ssHWjGea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6EB4AF64
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2331e7058aso14392566b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 14:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703110380; x=1703715180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HnpnplTrD1orPk+bkW3DK3tg+VQN6eNtW2DmsIuzEk=;
        b=ssHWjGeae+p9pdccO/d4gjRHHPYnHTW1xGhvnokcUduCSa81sbvM7t9cksTMMv0PXB
         xekric/G4JWDVEPddsBw1majusMr1K7xf4+I4kPak+jO2b/SWQVHyTW0VoOQdiaQnDT3
         ag6DsBmY10vfmUl2yMZC+fic5RcHSDAB1kttIKIj8lxI6Jp0wnZC2xGTKIUqNrZpcPjb
         +Tuza/DgA56in0dtnR4VSM9vOmyp9/zLARTe7zrVrt2kJ/Yr0wfwVLRC8G9Sn3vVF2rm
         tHsBkaamCs2EVeZ09cFlrGzvAPHbq1Mj262vQLOVjS1oQS8XRMTvmMy0W721Gx16LQ2/
         QXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703110380; x=1703715180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HnpnplTrD1orPk+bkW3DK3tg+VQN6eNtW2DmsIuzEk=;
        b=fhPivo9wpOgs/gxqrP5RYKf0WZs9MTg5IN2TOvuy6kSICTKaYhfG1PjkLLoeIAjzPN
         w4mQBw5JSpYpgdmwEHsEQjcy62bWy1wA8U7dyDhNwo4LARjup7RblaL9K5oiUJULs2eT
         7F11FVU7DOFT9UtVI7vRuiM+iiy8MMtJr3g9nERlf6yiCDAbdaLRpID8eWY7zySwzYeg
         e39731DO3WqlR56hUHo5z/PWravXTCcbgT0UXb4E/hzieoiaKCogXgBVLKyi1t8mzN1z
         sOK8ZugLVDIPllTei4hs0PmXwNCjUV719oLwPL/Asu9UVlPKMZu20kDiGiV2uJDH6S1M
         C3jg==
X-Gm-Message-State: AOJu0Yy6umngyzufAOiL8+BR3D+DG2ccssMWPgtPeg0HvoHxcEa/RsE7
	GVzms9Qhz4l3jKM7tHqwbfjzRw==
X-Google-Smtp-Source: AGHT+IHz8aguBgWkrXv5yB1Webr2VO6bthyuM2ML6cD3xoOBmm70JHSakgwkDOPf0TpRVfQH25Bs9w==
X-Received: by 2002:a17:906:73ce:b0:a26:8edc:d543 with SMTP id n14-20020a17090673ce00b00a268edcd543mr519704ejl.191.1703110380527;
        Wed, 20 Dec 2023 14:13:00 -0800 (PST)
Received: from [10.167.154.1] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id x22-20020a170906135600b00a235f3b8259sm254654ejb.186.2023.12.20.14.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 14:13:00 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 20 Dec 2023 23:12:55 +0100
Subject: [PATCH RFT v2 2/3] arm64: dts: qcom: sc8280xp: Add missing CPU
 idle states
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230619-topic-sc8280xp-idle-v2-2-cde50bf02f3c@linaro.org>
References: <20230619-topic-sc8280xp-idle-v2-0-cde50bf02f3c@linaro.org>
In-Reply-To: <20230619-topic-sc8280xp-idle-v2-0-cde50bf02f3c@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703110375; l=3555;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=njYYbjQnLKOjnHDRuMuyMmnE/ukystDNC4JUsi3kSaU=;
 b=RT2azaFKMj0cfGxvNjp/OYW9kpncF83pKfbmWCHN5vwgNdSmf4dYuAKtTdfLc7/F49W8oPQBO
 cBHzbE0RDRBCkWqmsqA1UAz5kSbTTPWganHvj7sB5tGfPzJ9G6K0mb+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Between WFI (C1) and rail power collapse (C4), the Cortex cores on the
SC8280XP can also be shut down on their own (C3).

Describe that missing idle state.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 36 ++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index ca56bbac4353..62f3f33220ff 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -265,6 +265,16 @@ idle-states {
 			entry-method = "psci";
 
 			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -275,6 +285,16 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 			};
 
 			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "big-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -603,49 +623,49 @@ psci {
 		CPU_PD0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 		};
 
 		CPU_PD1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 		};
 
 		CPU_PD2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 		};
 
 		CPU_PD3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 		};
 
 		CPU_PD4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 		};
 
 		CPU_PD5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 		};
 
 		CPU_PD6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 		};
 
 		CPU_PD7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 		};
 
 		CLUSTER_PD: power-domain-cpu-cluster0 {

-- 
2.43.0



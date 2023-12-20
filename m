Return-Path: <linux-arm-msm+bounces-5632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3D81A8DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 23:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96FC21C21316
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 22:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C22F4BA89;
	Wed, 20 Dec 2023 22:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ty9LQw3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4285A4AF73
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a1fae88e66eso13816166b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 14:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703110382; x=1703715182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DxvM6dJkXr3AT8uqclVXbZKCSa9zDAjYg1Tc1GwtgQ=;
        b=Ty9LQw3Mfv6h+l7ZX8byVyljcsnrsUmHW5gabv8COtiYkUicrhDeqaV2oUPDKEey5u
         4a+8fw4ZYu61sUd7zfCX3oKADbKQsVDOAv/igS+YcjZmdl1htzoSN+OhekZ5iuq4hnFe
         gNcgDZW1OqnUeEJhpozsYnd5bznGeDVL2w8MYQVwOdffCFICwMnt10NzrYPxkEmIldGC
         VVuetXUrZ8iF3OZvy2GWem5UkMImeC/Q+bNa08veVDxC/nYV/qy84BfjWa//khBcKjH+
         7Y9736xLUxb6TTrzutLhMR+hldDnze53GSukHkXg/u3QGUG/LKqC28fFXPx1FsPke3z1
         fqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703110382; x=1703715182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DxvM6dJkXr3AT8uqclVXbZKCSa9zDAjYg1Tc1GwtgQ=;
        b=sv5rULSCN6cHaJGeAyAg3v/C+zzoX+MbILCzMYvVJgj/5zjsNwVOHdc85ZQGrOniLC
         Z3nmA0AwljoU46pXrB8X8VED/Ey2fkGB5BlbDYqjDlw7Cp4LucADmcJYKKq8w+z3W5a3
         Wv5Bhp+vkX2+9ttFsFA/lJ9IWur6xqjnSfCgVCbw8cZrSAYveXlxUWrzeNeI43iXzh1u
         qKZRYTG5Gei1TZCeSXQNB7JwFuqURhKFgFhN4KyceGIwJE4Rxf9OQomiSsND6SBCGK+6
         R4G6HOS/lvgbC2fpr5pPUvziSECUBhxIeQYb0sYIf51sUqhALos4R2x2IWsd2MbmI04T
         tTpw==
X-Gm-Message-State: AOJu0YxnEiakilO0XEpA46l2KDeIhknKweNz08e2OhqK7bgcFn6w+mYY
	WAxQnFpgaunnFbbO2oPTm3L/4A==
X-Google-Smtp-Source: AGHT+IEg2zi7y1PjLZ1nj45tvv1Sx1l07lv/enT1qJZBDZirnV6ttTBO55lB1kMef7B2OIsOWlNWGg==
X-Received: by 2002:a17:907:4d7:b0:a26:9c58:3ad8 with SMTP id vz23-20020a17090704d700b00a269c583ad8mr353676ejb.145.1703110382392;
        Wed, 20 Dec 2023 14:13:02 -0800 (PST)
Received: from [10.167.154.1] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id x22-20020a170906135600b00a235f3b8259sm254654ejb.186.2023.12.20.14.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 14:13:02 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 20 Dec 2023 23:12:56 +0100
Subject: [PATCH RFT v2 3/3] arm64: dts: qcom: sc8280xp: Fix up idle state
 periods
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230619-topic-sc8280xp-idle-v2-3-cde50bf02f3c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703110375; l=1804;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=c3T3c0tRpO5oGLK3Rx2bXv5zepnSj3efGb1cym3Og74=;
 b=CqWRArCrFNQSGcd2JvKSmBjJO6OK5sVHZ15tRniyJHsxaCCV8BxqNAoXGdQdeffFz3YCYlsxA
 WZXJiTtkmbVAthr7ZVoTCXFbjZf6/wOhU0slMr7JJH/7YJfDGDINyf8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some of the values were wrong, which may have painted a wrong picture
to the scheduler. Fix it.

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 62f3f33220ff..7625db4512c7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -278,9 +278,9 @@ LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
-				entry-latency-us = <355>;
-				exit-latency-us = <909>;
-				min-residency-us = <3934>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
 				local-timer-stop;
 			};
 
@@ -298,9 +298,9 @@ BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "big-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
-				entry-latency-us = <241>;
-				exit-latency-us = <1461>;
-				min-residency-us = <4488>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
 				local-timer-stop;
 			};
 		};
@@ -325,9 +325,9 @@ CLUSTER_SLEEP_CX_OFF: cluster-sleep-1 {
 			CLUSTER_SLEEP_AOSS_SLEEP: cluster-sleep-2 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100c344>;
-				entry-latency-us = <3263>;
+				entry-latency-us = <3638>;
 				exit-latency-us = <6562>;
-				min-residency-us = <9987>;
+				min-residency-us = <9826>;
 			};
 		};
 	};

-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-6116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4358202F9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 01:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ED1AB22185
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 00:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411BE5660;
	Sat, 30 Dec 2023 00:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCQJAWWL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87C3D6C
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 00:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55322dbabf6so7668723a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 16:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703894712; x=1704499512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ns1dL2MqcYmvBdrUOAiqp2mC+tSGPSDtkE6TV4xq48=;
        b=rCQJAWWLd0+lXneLnqrV2YvQOdYxJFFrQ0oj936cojSE34anZD8/EOqBXmGIqYdBiu
         B5X7+Rj9redNSAUCJ+zOFSXV+aI3++ejLZRpOJVxz7uf2LjDxopMOb2AkSnA4v3a913t
         VHVthDK748anKG1xaiLyG+Q16L5EXJGgM3W40x9CZ/6WBO9pT92lrCiwV1XFCrIkI3fC
         yelczvx1brT0CpLei6b6RGNGcYbdShii9etFNrgstydAsH3UPhIEUyBeV6wnpZD7NzLs
         eKrjkb3C4gpeDQxPswDDCST0xzpXzgkhQxjoeiGWi40PkszG9wok2BdfY9qG89skYnTF
         PL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703894712; x=1704499512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ns1dL2MqcYmvBdrUOAiqp2mC+tSGPSDtkE6TV4xq48=;
        b=Ld1aGT72dC/rnsK7BJ5BJ/cBQXER4tCVLhPPJGlf3KHZNEE+3lrNtBOTvmJtM27VIA
         B0WxijQa8pgpcTvXmGGHYWDKBMHYOSiZLM7rVQEGq4NZN22w+wZCGIWKxSFWNsgoK5q4
         Sx4QB1CVdrJYAYUBhoVkvNyEGUP1Hq811EZPMx1gZ4n3l9o80nYseJjkSYx7YBz10+8J
         I7zFiJ4p0Vc4mNYeWfvDFcMALEPwM5WWfOlvK36u4RwFC42Ma0ZwJxWZeyR/8J0stFHH
         nsn8280AQCtHG6ojpJdfWW4Zzmd4LWmMjoxzLQI54gSGzNfsaN0RQMFOnTYjuwk55JMD
         HARQ==
X-Gm-Message-State: AOJu0YzZi64RMn8aRTgsqegu+wrHP17IhVofh1+BNcowNYISXoSOYo5r
	JAcrANNv0TrXtBD2m2lyLNGLX6tVjjiOhA==
X-Google-Smtp-Source: AGHT+IGfpuScaZ04+MVJ2d4ytaFY0u6SlkdpMgDvfu/Ebs0FpIOUqi33kSyXqTvp561KIHcYd2svTw==
X-Received: by 2002:a17:906:3e54:b0:a23:6259:12d2 with SMTP id t20-20020a1709063e5400b00a23625912d2mr5168883eji.69.1703894711882;
        Fri, 29 Dec 2023 16:05:11 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id wj6-20020a170907050600b00a26a0145c5esm8609623ejb.116.2023.12.29.16.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 16:05:11 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 01:05:05 +0100
Subject: [PATCH 04/10] arm64: dts: qcom: sc8180x: Add missing CPU off state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231230-topic-8180_more_fixes-v1-4-93b5c107ed43@linaro.org>
References: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
In-Reply-To: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703894704; l=1425;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+PkUcmeYaxFipnN5tNi1C4DL3fSDrQJVd/KWJuKrVDQ=;
 b=GoZh2GoTTHAsw7/PuHEDfeMrw1K6eOfM+uzNCWnQXqbuJR31KiRBfPtGUWe0p61kMXBU/7pEk
 wdHqcLHDAUlCesyPBSQIOK0hcoyvvsBBCZqTZ7YVkSibJJzkD3OvFbK
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The CPUs can be powered off without pulling the plug from the rest of
the system. Describe the idle state responsible for this.

Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index b84fe5f3b41c..8849469d0aa1 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -298,7 +298,15 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_0: cluster-sleep-0 {
+			CLUSTER_SLEEP_APSS_OFF: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <3300>;
+				exit-latency-us = <3300>;
+				min-residency-us = <6000>;
+			};
+
+			CLUSTER_SLEEP_AOSS_SLEEP: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100a344>;
 				entry-latency-us = <3263>;
@@ -582,7 +590,7 @@ CPU_PD7: power-domain-cpu7 {
 
 		CLUSTER_PD: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_0>;
+			domain-idle-states = <&CLUSTER_SLEEP_APSS_OFF &CLUSTER_SLEEP_AOSS_SLEEP>;
 		};
 	};
 

-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-5267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D54A98176E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 17:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89F9D1F26893
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 16:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A44774E1D;
	Mon, 18 Dec 2023 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1jGvhhF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8139C74E0B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-54c7744a93fso4079231a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 08:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702915364; x=1703520164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vqnaVfXUc3+Cw3ab8YklVZAFoD7TS2H8et3g6n/n1M=;
        b=T1jGvhhFYMLI01YBjJiXWfbpFy+l/hCvjCQyspUxwGoQqV2yBVUyFl931zZNuxQk2l
         4qos0t0OO0O2YLKXm+YKz1xT2vr8ySTQ1tW8VRqDG1AVoJAKy27PLToAXUreprJvbNvO
         kik/DfDnSSdkpSMZwce0Qvt62V6UAKFXXbUiW/cLLfAaNfK9MaWjBEY4RVP0lCHdgZEF
         j/l7nBfK2qQt6s2ok34zre2deoCG2wOcEl7fB/9HUYRWxjbAaxH50SgowiVuGpcvm8hL
         G+yLJcEkbMGf3Gxg7L0ZejRoneqyqHJQ0Lvlnf0zzm/gHXhFw35aPqxiWNGUSq7hYcIT
         ZxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915364; x=1703520164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vqnaVfXUc3+Cw3ab8YklVZAFoD7TS2H8et3g6n/n1M=;
        b=XlZzpDlAR+hHlkP1FxQF7sit+azQvP5uEXIXmoqo8KBSOH8yOjbzU/sidCJ0M2Lg65
         Bkq2vQoUwi6sASgIMf2DqwGerZD1Y+/7WLagS6GqgCmLyZOUoohOpwuJ2oM/SB2fnYwD
         YBRQwNpXBTwPeSX4n+UpBxfHKzvZqgJbaVj5oBAvPOthRntoZxJWgvZbvvJzAw17535r
         PbuBuxu4VrvBQJ6MVQyDetGd4+/e1huH7A7n6oqstxf96w2ljH5aS54zvZvY46KF+UvX
         V2Zr/YPk1JFplGC8NENwwnAKHbe+hQ3K1j9zGMyfqXv0wHfsRL+AyMzNYQekBvY8+3NR
         vrLA==
X-Gm-Message-State: AOJu0YwV4fcQvrKh1MxtVi8ECox2w9sbQ8iJ2ZukD9nnz8JZDVE7/DmX
	6g3i20uEn3BBu1eaWLfpjv6PPw==
X-Google-Smtp-Source: AGHT+IGNnRKVBXAyleisarX/8QiSexrXfrpnMlqCDzp/Inh+l4LMc8nVvkgqQc+KX35OdfJEHdb1Dw==
X-Received: by 2002:a17:906:5c:b0:a23:660:ec5c with SMTP id 28-20020a170906005c00b00a230660ec5cmr3564518ejg.40.1702915363917;
        Mon, 18 Dec 2023 08:02:43 -0800 (PST)
Received: from [10.167.154.1] (178235179137.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.137])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a1dd58874b8sm14260693ejc.119.2023.12.18.08.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:02:43 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 18 Dec 2023 17:02:13 +0100
Subject: [PATCH 12/12] arm64: dts: qcom: sm8550: Update idle state time
 requirements
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231218-topic-8550_fixes-v1-12-ce1272d77540@linaro.org>
References: <20231218-topic-8550_fixes-v1-0-ce1272d77540@linaro.org>
In-Reply-To: <20231218-topic-8550_fixes-v1-0-ce1272d77540@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702915332; l=2164;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9Z88FW0hsRmPlBm1BVUnqIFZHzLISLnQdKvDWpIJwf4=;
 b=ppRSM6dTlJsxBT50Gv31qfqBnfv3jlmcUCdVlaNY6XDUuq5HjF8k9Ls7YTXHH1MkJHv57Sstg
 PWmaijmoN+VBlj0oEm+XgddIIkdtdoLL2e+n8pKTbtpIlbzHcxdZSUG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The idle state entry/exit/residency times differ from what shipped on
production devices, mostly being overly optimistic in entry times and
overly pessimistic in minimal residency times. Align them with
downstream sources.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 5143a08c4867..6a192fb41f84 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -285,9 +285,9 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "silver-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
-				entry-latency-us = <800>;
+				entry-latency-us = <550>;
 				exit-latency-us = <750>;
-				min-residency-us = <4090>;
+				min-residency-us = <6700>;
 				local-timer-stop;
 			};
 
@@ -296,8 +296,8 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <600>;
-				exit-latency-us = <1550>;
-				min-residency-us = <4791>;
+				exit-latency-us = <1300>;
+				min-residency-us = <8136>;
 				local-timer-stop;
 			};
 
@@ -316,17 +316,17 @@ domain-idle-states {
 			CLUSTER_SLEEP_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
-				entry-latency-us = <1050>;
-				exit-latency-us = <2500>;
-				min-residency-us = <5309>;
+				entry-latency-us = <750>;
+				exit-latency-us = <2350>;
+				min-residency-us = <9144>;
 			};
 
 			CLUSTER_SLEEP_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100c344>;
-				entry-latency-us = <2700>;
-				exit-latency-us = <3500>;
-				min-residency-us = <13959>;
+				entry-latency-us = <2800>;
+				exit-latency-us = <4400>;
+				min-residency-us = <10150>;
 			};
 		};
 	};

-- 
2.43.0



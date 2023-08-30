Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413A378DBF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236164AbjH3Sbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244252AbjH3Msz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 08:48:55 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B18193
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 05:48:52 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so84884481fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693399730; x=1694004530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZfHVMKUP11Ad69XbKt6znXsV/mZxYi0rjxpdqRgPps=;
        b=hu6rQ9805q5fpQOj2oxFN/aNoeH9GOidfTygVabHYo7aQJe7wdA7rDuKH/TSj+68Yv
         3xDVSGEmk4Ys75J2QOHIr+r+l4OlCse9sqoIvZiJxkZKZDqjGOZY2jEWle5In6jpV6Kd
         qJbnRmOstPmBKmC5kgIerRAgjM2H4wqaOMDnDbWYcXS9cXPKOwglyjrP3DCVRzRdBk3f
         mywlogTvUOsWbZ9M/+aBf5vVp7by9kjAj5GKljDLdw1pWmc17qPoAEnqrpB++JmaAuXq
         oS8G2rKkCz9ilh6xsOxauyCoQA1Nm58MGpt49Xfc13PLL839qgdNNC47fqLm4b2OqZ7J
         OFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693399730; x=1694004530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZfHVMKUP11Ad69XbKt6znXsV/mZxYi0rjxpdqRgPps=;
        b=A/NBfmY67qGWC8+OP2SRcIHbFYgKoDajtWcTUEBVr5EblyZNaxlnDx/eomeXUeDG8g
         C66hV5wgv6N02rTJhsOI61FLTdVPSx/qVajrN5MgqnZ6lBVV2/hD8YEdHiuCxIwQgtvA
         EU7/wUP+OulI3tbUbi1C74G5qvhVw6y/yBbSqOXBQNRLg/4NrfTBTl0RJeYG9x6sebRk
         lZTtz5hkH+Y8tZ9Bd1MQTSr690OsN/vvmxw9rrNMnrFhkceho85lrcwwZ+PVpTFR9jH/
         fTdFUKLVsbGvyWeYvE4O8bzxq2RszL5StdYMTpfIWDmMTVEAfy+19dGrxHXUY9XPrkRL
         +7pw==
X-Gm-Message-State: AOJu0YxP+SICJaNQLWcowG8IGCXmaBwcin07AU0jkiklmhZQ1Z2S0q3U
        TMYKXOwNjR6uiqf36i2eV+a3dA==
X-Google-Smtp-Source: AGHT+IHPl8V3zLsbjHDfFeGyessbZv19EUMNxsPr1TfduqPt+L+60b346bKoU40JysVs7/+lbfk56A==
X-Received: by 2002:a2e:7c10:0:b0:2bd:f8:1b6a with SMTP id x16-20020a2e7c10000000b002bd00f81b6amr1697134ljc.36.1693399730441;
        Wed, 30 Aug 2023 05:48:50 -0700 (PDT)
Received: from [192.168.1.101] (abyl195.neoplus.adsl.tpnet.pl. [83.9.31.195])
        by smtp.gmail.com with ESMTPSA id y23-20020a2e7d17000000b002b94b355527sm2602662ljc.32.2023.08.30.05.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 05:48:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 30 Aug 2023 14:48:42 +0200
Subject: [PATCH 3/7] arm64: dts: qcom: sm8550: Fix up CPU idle states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-topic-8550_dmac2-v1-3-49bb25239fb1@linaro.org>
References: <20230830-topic-8550_dmac2-v1-0-49bb25239fb1@linaro.org>
In-Reply-To: <20230830-topic-8550_dmac2-v1-0-49bb25239fb1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693399725; l=2738;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0daxHtWoeP34wSKYumu6HinO+/RzKr02RkF1NXHSNDE=;
 b=p3avE3lalFnBLXK1+HYj/Tak5HGjcjronN/VeNSSfxc7bbROD0ZBpqjBzpJ+GkO99VFs25eGP
 iYtcGWuoP8eDX6N9X2Rl3v1Eltm0zCkK58DxdKj46Fh+5DpeVZHenHt
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The idle residency times are largely too low according to the vendor
kernel (maybe they came from an earlier release or something), especially
for the prime X2 core. Fix them.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d115960bdeec..c21ba6afa752 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -283,9 +283,9 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
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
 
@@ -294,8 +294,18 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <600>;
-				exit-latency-us = <1550>;
-				min-residency-us = <4791>;
+				exit-latency-us = <1300>;
+				min-residency-us = <8136>;
+				local-timer-stop;
+			};
+
+			PRIME_CPU_SLEEP_0: cpu-sleep-2-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "gold-plus-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <500>;
+				exit-latency-us = <1350>;
+				min-residency-us = <7480>;
 				local-timer-stop;
 			};
 		};
@@ -304,17 +314,17 @@ domain-idle-states {
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
@@ -398,7 +408,7 @@ CPU_PD6: power-domain-cpu6 {
 		CPU_PD7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			domain-idle-states = <&PRIME_CPU_SLEEP_0>;
 		};
 
 		CLUSTER_PD: power-domain-cluster {

-- 
2.42.0


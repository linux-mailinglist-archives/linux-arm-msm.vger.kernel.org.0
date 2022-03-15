Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2A44D9D06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 15:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348875AbiCOOMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Mar 2022 10:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348854AbiCOOMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Mar 2022 10:12:20 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14AD1546AA
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 07:11:08 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h11so26666261ljb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B5J/aJLfwIlJFiO9Fm9A+DptsdVKj69BbXqtDgcTbh0=;
        b=DnbEBaXdcq/FUu+zJE4TlRVgH900JAfWn3cUyLX+EpC6oAWigrhIJmrKTlvVvg/Thw
         sDiuQYNx61dU5n+EzLMRNRmk2Z//FBpIIOKDlSC1yAFj7tcSjLIp8OehlkFYjMXDFDex
         9X59veUpCRusGkjqqLRd7OMyA9MG1URDxZ4BKTBcTT+6zGKPvcqrsCUOMrnbQ07DwZiE
         LXqtgtTuVwYXnlsuRT2lFonV+2vYKEs+7oFzGCLxWYZuHNMKXtAG0pxSm15FyWpWRuvz
         rh8Yd6H1bknNLm4+jyhK7/zh0zar9H5m7yT25DRUDZjnil2hHQaXQsk2Xx9eMREH9FpM
         gpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B5J/aJLfwIlJFiO9Fm9A+DptsdVKj69BbXqtDgcTbh0=;
        b=wVpaJMrQAY0m6cXRFZiOep5RSLBfkk2UqoRAEZX9ZlswvdHMixSzcOnr4HFApCUiSJ
         ++78if0rvztMau1eutgGp0TC7Uf8nQOHM/OywAnijYChcH1I+uiTPX0mWA+vwR8AjxOM
         G983KJOcVTTl7Lfv0+H2XFlh9OK4jehLTiUw8R1MErQZ7fWIqU9slK1toIxDH4Oiadqf
         drHWaGCoQoOnC+gDIT3BYETMdgfw6R76RrlS0onnGzJ5/mFYK/Nm/LP724Lu+LfSR0Af
         nt65Xf15eNmELStHQkCHx+DG32XkaUQWxVDXLU2QA3ezPp6pXDiyyt39B7O9g3RhnlK7
         TlRw==
X-Gm-Message-State: AOAM533fNnTBgTB1LUhRnfY889zlonJQYs/PLaQlbhCihtxoAZgwelQO
        3/bzP2p1OTvoKv7b32SpTZN9pg==
X-Google-Smtp-Source: ABdhPJxPbWblQZTYsvwK2UfV+LUVc2YAAB++YPqAh17gS7uc6rSaVWP8XiO+sEhfeXTIG2rjW7RBSA==
X-Received: by 2002:a05:651c:1047:b0:247:f205:2911 with SMTP id x7-20020a05651c104700b00247f2052911mr17745888ljm.284.1647353466319;
        Tue, 15 Mar 2022 07:11:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c27-20020a2ebf1b000000b00247eba13667sm4324079ljr.16.2022.03.15.07.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 07:11:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Danny Lin <danny@kdrag0n.dev>
Subject: [PATCH] arm64: dts: qcom: sdm845: correct dynamic power coefficients
Date:   Tue, 15 Mar 2022 17:11:04 +0300
Message-Id: <20220315141104.730235-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Following sm8150/sm8250 update sdm845 capacity-dmips-mhz and
dynamic-power-coefficient based on the measurements [1], [2].

The energy model dynamic-power-coefficient values were calculated with
    DPC = µW / MHz / V^2
for each OPP, and averaged across all OPPs within each cluster for the
final coefficient. Voltages were obtained from the qcom-cpufreq-hw
driver that reads voltages from the OSM LUT programmed into the SoC.

Normalized DMIPS/MHz capacity scale values for each CPU were calculated
from CoreMarks/MHz (CoreMark iterations per second per MHz), which
serves the same purpose. For each CPU, the final capacity-dmips-mhz
value is the C/MHz value of its maximum frequency normalized to
SCHED_CAPACITY_SCALE (1024) for the fastest CPU in the system.

For more details on measurement process see the commit message for the
commit 6aabed5526ee ("arm64: dts: qcom: sm8250: Add CPU capacities and
energy model").

[1] https://github.com/kdrag0n/freqbench
[2] https://github.com/kdrag0n/freqbench/tree/master/results/sdm845/main

Cc: Danny Lin <danny@kdrag0n.dev>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 41f4e46e1f85..f5932b49877d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -200,8 +200,8 @@ CPU0: cpu@0 {
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <607>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <611>;
+			dynamic-power-coefficient = <290>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
@@ -225,8 +225,8 @@ CPU1: cpu@100 {
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <607>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <611>;
+			dynamic-power-coefficient = <290>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
@@ -247,8 +247,8 @@ CPU2: cpu@200 {
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <607>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <611>;
+			dynamic-power-coefficient = <290>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
@@ -269,8 +269,8 @@ CPU3: cpu@300 {
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <607>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <611>;
+			dynamic-power-coefficient = <290>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
@@ -292,7 +292,7 @@ CPU4: cpu@400 {
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			dynamic-power-coefficient = <396>;
+			dynamic-power-coefficient = <442>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
@@ -314,7 +314,7 @@ CPU5: cpu@500 {
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			dynamic-power-coefficient = <396>;
+			dynamic-power-coefficient = <442>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
@@ -336,7 +336,7 @@ CPU6: cpu@600 {
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			dynamic-power-coefficient = <396>;
+			dynamic-power-coefficient = <442>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
@@ -358,7 +358,7 @@ CPU7: cpu@700 {
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			dynamic-power-coefficient = <396>;
+			dynamic-power-coefficient = <442>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
-- 
2.35.1


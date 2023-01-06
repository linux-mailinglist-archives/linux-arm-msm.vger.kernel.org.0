Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB6266050E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 17:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbjAFQsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 11:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235895AbjAFQsE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 11:48:04 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1F47CBC9
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 08:45:36 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id z16so1797969wrw.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 08:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3oJpCSGnnDJtoKqiOy/io+oXZbWMd8CgdZY3qs2G2Q=;
        b=UHWt0Km56J2JnjdyVXkbV8H2zFDMRABozsD+/PxSIf69I83GfPnUrLfMbjeaUzn8vZ
         +zIVn18GbZy3rzc6xOZwT7GdzhrtkKXtVAd/PZqr5inSgoOB2/Zqb+0dn76yH5UKdUFS
         p3blat2x46IA5MD0L2IoYIrmhSUBmIYd/rIVIJDn16g0P1JK7H2kOYyX0S7+YRbkICpc
         cYYB78tfufmn+ROyktFKlhIFFx23eUNJn3GHfPZ7voW5kVPOyppY/rrt25CaRCrubbL+
         DUSAk9yJUwTI/tbI4VYaIVlLQQnk0jIGMdZ8Atr58Wc/TjRkuwpinIwbdEo+Xu0IqP7Y
         li1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3oJpCSGnnDJtoKqiOy/io+oXZbWMd8CgdZY3qs2G2Q=;
        b=HHS2kmAK4vOgwYdwoHRod6a+QNivV9FxGTKUodD3DYVfcZSr0i/JxZTB29ABdC2xb/
         Zq6xRyyWdgnxcsuo5/byxM6i0y1U9Cdsmy5ncpzouJ/ArDXCmdhLDJj/rKFyQwqaqF1q
         4XplR7Qs650VrvZyUiyOP3D3AAv0uVXNQqmWVc/3Psluoz6maIHU4x1Yu/86yvjvsFd3
         luv92KNHhuKv2SGaYEIfSI7CcN9GXV2S1VRywvJwNxWXRlWW19B9OJiJsHX70kIxm9W2
         fbMZ0GfPNzWP8xWoao0wDxMlehRdcdklaq8zr04uVu4Oxyjty7XofXz1EDYI7Bf77VYj
         vxLw==
X-Gm-Message-State: AFqh2koPBNPuDbjjKUV1A5Zj1wBVDQY06qwGsWYq/rT8OR+/t8/aMtVh
        Vdjl2KsaE4z/4YOvy1NQxLl5cJxQVZ2ekmeL
X-Google-Smtp-Source: AMrXdXsupooZ2m7x/LlwSDiAAmoOXy0FQsRZd6LIfrgcfBUzghk7ki1VBFwsA9x4tgGcarRo8PcF2Q==
X-Received: by 2002:adf:a15b:0:b0:256:ffcc:49b7 with SMTP id r27-20020adfa15b000000b00256ffcc49b7mr45132785wrr.62.1673023516197;
        Fri, 06 Jan 2023 08:45:16 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:98f9:4145:643f:e1da])
        by smtp.gmail.com with ESMTPSA id cl10-20020a5d5f0a000000b002423620d356sm1629623wrb.35.2023.01.06.08.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 08:45:15 -0800 (PST)
From:   Vincent Guittot <vincent.guittot@linaro.org>
To:     dmitry.baryshkov@linaro.org, agross@kernel.org,
        bjorande@qti.qualcomm.com, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     danny@kdrag0n.dev, Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: correct dynamic power coefficients
Date:   Fri,  6 Jan 2023 17:45:13 +0100
Message-Id: <20230106164513.1845197-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While stressing EAS on my dragonboard RB3, I have noticed that LITTLE cores
where never selected as the most energy efficient CPU whatever the
utilization level of waking task.

energy model framework uses its cost field to estimate the energy with
the formula:

  nrg = cost of the selected OPP * utilization / CPU's max capacity

which ends up selecting the CPU with lowest cost / max capacity ration
as long as the utilization fits in the OPP's capacity.

If we compare the cost of a little OPP with similar capacity of a big OPP
like :
       OPP(kHz)   OPP capacity    cost     max capacity   cost/max capacity
LITTLE 1766400    407             351114   407            863
big    1056000    408             520267   1024           508

This can be interpreted as the LITTLE core consumes 70% more than big core
for the same compute capacity.

According to [1], LITTLE consumes 10% less than big core for Coremark
benchmark at those OPPs. If we consider that everything else stays
unchanged, the dynamic-power-coefficient of LITTLE core should be
only 53% of the current value: 290 * 53% = 154

Set the dynamic-power-coefficient of CPU0-3 to 154 to fix the energy model.

[1] https://github.com/kdrag0n/freqbench/tree/master/results/sdm845/main

Fixes: 0e0a8e35d725 ("arm64: dts: qcom: sdm845: correct dynamic power coefficients")
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 65032b94b46d..869bdb9bce6e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -198,7 +198,7 @@ CPU0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <611>;
-			dynamic-power-coefficient = <290>;
+			dynamic-power-coefficient = <154>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
@@ -222,7 +222,7 @@ CPU1: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <611>;
-			dynamic-power-coefficient = <290>;
+			dynamic-power-coefficient = <154>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
@@ -243,7 +243,7 @@ CPU2: cpu@200 {
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <611>;
-			dynamic-power-coefficient = <290>;
+			dynamic-power-coefficient = <154>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
@@ -264,7 +264,7 @@ CPU3: cpu@300 {
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <611>;
-			dynamic-power-coefficient = <290>;
+			dynamic-power-coefficient = <154>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
-- 
2.34.1


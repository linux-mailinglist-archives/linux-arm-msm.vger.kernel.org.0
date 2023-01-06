Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F469660510
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 17:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235845AbjAFQtJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 11:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236439AbjAFQso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 11:48:44 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD167CDD2
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 08:46:39 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id co23so1792300wrb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 08:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3oJpCSGnnDJtoKqiOy/io+oXZbWMd8CgdZY3qs2G2Q=;
        b=qpMR9X5BgMZLO6LuXpbgh+LKWdi9seLm9UpJqzwZeSc7hagiD2LM4sAjrOeLX4Gzii
         yPuO4bFe/zKGO7VA0NZcGEttyiiTk0p+svKkmywDvXbfxCqxfRxBL7t5mfGI36+2UPec
         EVZzLQ2KGgEW8GcUNwj4BUVm70dFiyApVGDxtu4QgmMl/yO9uGbRP70fgEFnKBboNjp+
         IYRfjvQ/NcSHQzF6mn3+vA8tgN2EqZgb53XfUnSkLYQ8SWGhdRAZ58eGLdTBfvx9mjbb
         BDVnR6Y7FjpsD1TJBlDPE2c6gtgdH9yWpaBMAkCwdEwev/vqrlaY6IiBqr1pIckHSRvK
         iXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3oJpCSGnnDJtoKqiOy/io+oXZbWMd8CgdZY3qs2G2Q=;
        b=MSgvJKm+KaAxRBi8s1TvT5vaDbAewMotDGffvJyroxwx21GenCWrL/fKQe6FRr6vJZ
         WVSDlwiX7jgC04sJ5SqINNfsaNgy/htDh/Bh2BI7prccP3M2u2pcO+K2LXO5dfbBbVFT
         pWnYrPUTRYFt2xRZtrAQuu7x6hY7/fHXsd2Rdm/DSk3lCjL0ty4wxVoiuey488REi+6f
         muxcemu+9EOHZVF8jKhLNYPZQyfuQWhyRispLDXHhNj2O9x4v5oOavVnX/NIivav9tIp
         HuC902Gqa7XC83rpbNNTmobWbWynQUw2cSQ3zFX364H1Knjxqc9MghSqmFUalOWbU7jN
         CqsQ==
X-Gm-Message-State: AFqh2kqD6DAMRuebfMI3ZMFpQ1GXGc4ocUtmZ7eTXt1XldEheqG8RQij
        0gx3ZrqhOFwHqi9yS+eSGiEi+w==
X-Google-Smtp-Source: AMrXdXsPpwdAEKZ/QTxH1EEGLQ3xybMXm99F+tFdxmq0b/1bdwFk1HQR5MWl5UrczpOvIrg1MmqVuQ==
X-Received: by 2002:a5d:4884:0:b0:242:3812:f948 with SMTP id g4-20020a5d4884000000b002423812f948mr35405492wrq.24.1673023581350;
        Fri, 06 Jan 2023 08:46:21 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:98f9:4145:643f:e1da])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d44d2000000b002368f6b56desm1916999wrr.18.2023.01.06.08.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 08:46:20 -0800 (PST)
From:   Vincent Guittot <vincent.guittot@linaro.org>
To:     dmitry.baryshkov@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     danny@kdrag0n.dev, Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: correct dynamic power coefficients
Date:   Fri,  6 Jan 2023 17:46:18 +0100
Message-Id: <20230106164618.1845281-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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


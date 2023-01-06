Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D846604FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 17:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbjAFQoj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 11:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235808AbjAFQnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 11:43:55 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F6678A64
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 08:43:50 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so3960941wma.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 08:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3oJpCSGnnDJtoKqiOy/io+oXZbWMd8CgdZY3qs2G2Q=;
        b=eyI2I3kagE68Lvc5JNJ6I/EKVCgf6WiwLXx7wCLKBjHSuqq71xJmirhfUIxf08Rsi6
         Xrwn1DqBXFksrRYmlNDpOamWBf6Y1iFznBgG4JkNlKgC+qhmZmtgqqVc0Ij/5S4rHPic
         YInXYp+a/wSNPVy9Xw+hoeXPHWGNdY4Dom4B0dQZcSUTMtU3UcMEcSD5eWqAarwSYkWQ
         ihbNV+P540smuwlLjlhQGeT6ORkOHu1PLhB+fUalJlj3yecZD+HhRADDlXK1iuxlEJ2C
         pATvPqvrmykQjd+Wy1lmS82yH6h8B7jB9N+GNx4PJ5krZR/PrvNO/Ilm7a2tZnKV7AZW
         +8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3oJpCSGnnDJtoKqiOy/io+oXZbWMd8CgdZY3qs2G2Q=;
        b=ST46RWG0Gxyz3MQAM1JDoJdKiiIFTGmcXaBZJWK3T+Ltl+veIdb+CzvBw1sl2CE/AC
         l/f8lFInNDG20vx5mGXI0nHs7CJtoOqqRCBAuNYCa+E0766B8u3zzbpHNCjT9swiElid
         ttzsaJjSHELYo+Db/sOBo8WIyWQjYHCa5DZhrtzyTOqdceQsYgyL15+m/J16/zdUxQoX
         5v8SLGcWenjKwRVSAReC0QlY7unFxfsvP8eDzHFQ0MgPZUjvrGbSeiE0s9X/+391ec4b
         b6OHVO6KKl+igHyv9egmGEb+8b5OzfK725QiyFzNy0fq78g9KtOXQBSfGCwUhpHCBxV9
         85Nw==
X-Gm-Message-State: AFqh2koAP0ClFjkwREEF2WvVTyNXmaOVzXJot+7aB0mfD6wK8MZK0iNV
        iwqtIRk9Wehx4/oVWdQMwPZTuw==
X-Google-Smtp-Source: AMrXdXvNKFj5uTJoUEF00h6bsaaRcDD6Ay5cuWevUuztp6tLx9fveZPhfXisq8Qj4fCZ7d868Vnyjw==
X-Received: by 2002:a05:600c:4e04:b0:3d2:381f:2db5 with SMTP id b4-20020a05600c4e0400b003d2381f2db5mr38887232wmq.22.1673023428711;
        Fri, 06 Jan 2023 08:43:48 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:98f9:4145:643f:e1da])
        by smtp.gmail.com with ESMTPSA id bj7-20020a0560001e0700b002b6667d3adfsm1618511wrb.80.2023.01.06.08.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 08:43:48 -0800 (PST)
From:   Vincent Guittot <vincent.guittot@linaro.org>
To:     dmitry.baryshkov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     danny@kdrag0n.dev, Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: correct dynamic power coefficients
Date:   Fri,  6 Jan 2023 17:43:44 +0100
Message-Id: <20230106164344.1845098-1-vincent.guittot@linaro.org>
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


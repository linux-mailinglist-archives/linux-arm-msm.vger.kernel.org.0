Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2A158A778
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 09:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240250AbiHEHuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 03:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240319AbiHEHuD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 03:50:03 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF19F61D86
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 00:50:01 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id o3so1982639ple.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4fMMHWvyg4GU7gRV3bzyHI/9v3wkdIknoimmt7krGAY=;
        b=SBwIQEBS5OLlLKVrNkobgKRtOwMC9KhMVwRrSlHdxz4VRXR0glBhSBoquXjuPrrvMt
         O66C2m6XUa9h+0z4CW0OwujLEyYD8GItcERM1jJoPxm1g8xH7qT5MvjgqnmrI5Mj7ibs
         ZZZMk6DC8wzFQWh7hVAwlW1NXEeC8g2oEtrNP1GdG26+Ej2Kk5xJ83XTL/5W95QOWix7
         qyWpxwAk0oW3szjbIb/6/ZB7HYKx9QeFaNk74rycYoJtJFqzXdPoT/hUdTs4wQeikf/t
         fE/IiKR08reJ8kTWCyXfkUB25/wG34DloCRGZj+g1i5WOdKP0/lOHo+2aXfVvVRIu0Tq
         llgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4fMMHWvyg4GU7gRV3bzyHI/9v3wkdIknoimmt7krGAY=;
        b=kaCZ4+B5zUYaJNg77Tu3nxG/6zB/jLd4gybLiVUF4+qhMd4N91V+3we8fsVqtFiFRg
         AeJDQQzjTfAbXEnQWlF4WGJWybL96Nhd9xT/42pf29bN5X2Rlt9aAmfsvJWjNL0mInU4
         zqd4GyejI8HDhtXKK67ypnwVQjcdAt4jjQbAj2u1jwXkjtJCnzKfz/SPhFxNeoBJxSqd
         hrCwndMJJRGeOiCVgqqKmVvnti7U4QAU+EVeJehknI5W+8MhgTRAfXUrbn6HWDJVjhUv
         dCzphBl2mE0bbgPnJge7x32JUnZBpGtIREYEOS4qsIMBfmdRJpby92iW8og5PJBc6Hlc
         H+AA==
X-Gm-Message-State: ACgBeo0u3Kj9uZFms13KsQ+/C1CpjE3NXfM4XojWOFEe6PcqIg/3oXfR
        evxLuwq8NgSjUGH+uUKJyw0IQA==
X-Google-Smtp-Source: AA6agR4qlmdhm+PfIJ042pSYU/7pcw4mifiS+duHcfD/56kLs2ea+10997KQtLuZHNrwdkxVqJD7hA==
X-Received: by 2002:a17:90a:a4d:b0:1f5:5293:6abb with SMTP id o71-20020a17090a0a4d00b001f552936abbmr11131594pjo.236.1659685801124;
        Fri, 05 Aug 2022 00:50:01 -0700 (PDT)
Received: from localhost.localdomain ([45.8.68.134])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709027e8a00b0016ecda71e26sm2309372pla.39.2022.08.05.00.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 00:50:00 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, shawn.guo@linaro.org,
        bryan.odonoghue@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 3/4] arm64: dts: qcom: add power domain for clk controller
Date:   Fri,  5 Aug 2022 15:49:34 +0800
Message-Id: <20220805074935.1158098-4-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805074935.1158098-1-jun.nie@linaro.org>
References: <20220805074935.1158098-1-jun.nie@linaro.org>
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

Add RPM power domain for clk controller so that clock controller can
use it for dynamic voltage frequency scaling.

Also replace the RPM power domain value with defninition.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 05472510e29d..fdb32b3a23e8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -312,22 +312,22 @@ rpmpd_opp_table: opp-table {
 						compatible = "operating-points-v2";
 
 						rpmpd_opp_ret: opp1 {
-							opp-level = <1>;
+							opp-level = <RPM_SMD_CORNER_RETENTION>;
 						};
 						rpmpd_opp_svs_krait: opp2 {
-							opp-level = <2>;
+							opp-level = <RPM_SMD_CORNER_SVS_KRAIT>;
 						};
 						rpmpd_opp_svs_soc: opp3 {
-							opp-level = <3>;
+							opp-level = <RPM_SMD_CORNER_SVS_SOC>;
 						};
 						rpmpd_opp_nom: opp4 {
-							opp-level = <4>;
+							opp-level = <RPM_SMD_CORNER_NORMAL>;
 						};
 						rpmpd_opp_turbo: opp5 {
-							opp-level = <5>;
+							opp-level = <RPM_SMD_CORNER_TURBO>;
 						};
 						rpmpd_opp_super_turbo: opp6 {
-							opp-level = <6>;
+							opp-level = <RPM_SMD_CORNER_SUPER_TURBO>;
 						};
 					};
 				};
@@ -933,6 +933,8 @@ gcc: clock-controller@1800000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmpd MSM8916_VDDCX>;
+			power-domain-names = "vdd";
 			reg = <0x01800000 0x80000>;
 		};
 
-- 
2.25.1


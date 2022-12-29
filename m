Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2667B658908
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 04:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbiL2DBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 22:01:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbiL2DBa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 22:01:30 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C487013E0B
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 19:01:25 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j17so16406330lfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 19:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOXCojF6nMUqcnzqXxwpAmyJSgWY8gTmzuaLk5ZSLYc=;
        b=H1EaOKzRy/Jxn8G2Yr8NF7Cp1/b/ecLkf9nW9Yep35p38f8xZmZ3BuKKW0bKm2QUMk
         fIvuCmTKyDV5yP+5fW3hlrk+yJ8ghqrvwX2Kmp/cgpndH0nHPzSdWmrlwBYGU90Lz11u
         7G8VDQXtZa933rpStVfu2svs57HLCmT6nOzWUyo7e0BLVmaYeL70/3FqAWoZizc1pGSD
         Gag1E9OZQ7SMeIAIjGDpus2dFV3khu+D40T3vfsjY8Nrk2GJ6qufKNnI5/KwC5sOSf8y
         6P9awTWWPvSeGzRt6kzZr7QNwe9V47KEokEVQDJLkYW+MZ0ApzHuQ1fgWK0e/EHMfNyk
         OGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOXCojF6nMUqcnzqXxwpAmyJSgWY8gTmzuaLk5ZSLYc=;
        b=f/tgrRtrsZIUAkgFvMo9jB2u2NvHmd9Pqx9cI9fGxeWSPw5GbSOUOfyCUHU/XkV77Q
         awpBB2Ynftf0iPVyp2n/f1Z8LodqruCrqfvcp8vyheHvclJvZvh6xpEqQdZXsic8GdXu
         MeNEXxf16mWFhtnHpIiRqulMQwXjz5cPcoYKecA3zfynC6QTpSmEzPJGqGZE8yhLVNS1
         2gFOG7Xf3c9bpqEx30noiQ9CbhiHiGbb3/QcxtVfMPRNkmKz/7H9wXQiVPyTASX9jJir
         vYFQ5zq5gWEGqtYKwoGOWpAwh5EwjqunLOxNk16Wvuha05BNMTcX3zjQnqP7Vm40R5u+
         0C9g==
X-Gm-Message-State: AFqh2kpc7fKGSOEXvSwL+pfgyVHkJ7UmCgCQra7BnbJFR1YjiuCR+r4Q
        5rSg4kCp2Cv04J80L3RPGZ5cew==
X-Google-Smtp-Source: AMrXdXsUTACC7UrSpRyosww7bvX9J3AINUCVm60231BThj02TmLcwp+bOoe6DW1Kg7bfV2r3sLx9dg==
X-Received: by 2002:a05:6512:4005:b0:4b5:9183:5ad0 with SMTP id br5-20020a056512400500b004b591835ad0mr10050207lfb.63.1672282884658;
        Wed, 28 Dec 2022 19:01:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512024b00b004b57277474esm2883070lfo.106.2022.12.28.19.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 19:01:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 20/20] ARM: dts: qcom-apq8084: specify per-sensor calibration cells
Date:   Thu, 29 Dec 2022 05:01:06 +0200
Message-Id: <20221229030106.3303205-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
References: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
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

Specify pre-parsed per-sensor calibration nvmem cells in the tsens
device node rather than parsing the whole data blob in the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 313 +++++++++++++++++++++++++++-
 1 file changed, 307 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index fe30abfff90a..22e56ee82a20 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -249,11 +249,260 @@ qfprom: qfprom@fc4bc000 {
 			reg = <0xfc4bc000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			tsens_calib: calib@d0 {
-				reg = <0xd0 0x18>;
+
+			tsens_base1: base1@d0 {
+				reg = <0xd0 0x1>;
+				bits = <0 8>;
+			};
+
+			tsens_s0_p1: s0-p1@d1 {
+				reg = <0xd1 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s1_p1: s1-p1@d2 {
+				reg = <0xd1 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s2_p1: s2-p1@d2 {
+				reg = <0xd2 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s3_p1: s3-p1@d3 {
+				reg = <0xd3 0x1>;
+				bits = <2 6>;
+			};
+
+			tsens_s4_p1: s4-p1@d4 {
+				reg = <0xd4 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s5_p1: s5-p1@d4 {
+				reg = <0xd4 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s6_p1: s6-p1@d5 {
+				reg = <0xd5 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s7_p1: s7-p1@d6 {
+				reg = <0xd6 0x1>;
+				bits = <2 6>;
+			};
+
+			tsens_s8_p1: s8-p1@d7 {
+				reg = <0xd7 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_mode: mode@d7 {
+				reg = <0xd7 0x1>;
+				bits = <6 2>;
+			};
+
+			tsens_s9_p1: s9-p1@d8 {
+				reg = <0xd8 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s10_p1: s10_p1@d8 {
+				reg = <0xd8 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_base2: base2@d9 {
+				reg = <0xd9 0x2>;
+				bits = <4 8>;
+			};
+
+			tsens_s0_p2: s0-p2@da {
+				reg = <0xda 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s1_p2: s1-p2@db {
+				reg = <0xdb 0x1>;
+				bits = <2 6>;
+			};
+
+			tsens_s2_p2: s2-p2@dc {
+				reg = <0xdc 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s3_p2: s3-p2@dc {
+				reg = <0xdc 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s4_p2: s4-p2@dd {
+				reg = <0xdd 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s5_p2: s5-p2@de {
+				reg = <0xde 0x2>;
+				bits = <2 6>;
+			};
+
+			tsens_s6_p2: s6-p2@df {
+				reg = <0xdf 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s7_p2: s7-p2@e0 {
+				reg = <0xe0 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s8_p2: s8-p2@e0 {
+				reg = <0xe0 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s9_p2: s9-p2@e1 {
+				reg = <0xe1 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s10_p2: s10_p2@e2 {
+				reg = <0xe2 0x2>;
+				bits = <2 6>;
+			};
+
+			tsens_s5_p2_backup: s5-p2_backup@e3 {
+				reg = <0xe3 0x2>;
+				bits = <0 6>;
+			};
+
+			tsens_mode_backup: mode_backup@e3 {
+				reg = <0xe3 0x1>;
+				bits = <6 2>;
+			};
+
+			tsens_s6_p2_backup: s6-p2_backup@e4 {
+				reg = <0xe4 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s7_p2_backup: s7-p2_backup@e4 {
+				reg = <0xe4 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s8_p2_backup: s8-p2_backup@e5 {
+				reg = <0xe5 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s9_p2_backup: s9-p2_backup@e6 {
+				reg = <0xe6 0x2>;
+				bits = <2 6>;
+			};
+
+			tsens_s10_p2_backup: s10_p2_backup@e7 {
+				reg = <0xe7 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_base1_backup: base1_backup@440 {
+				reg = <0x440 0x1>;
+				bits = <0 8>;
+			};
+
+			tsens_s0_p1_backup: s0-p1_backup@441 {
+				reg = <0x441 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s1_p1_backup: s1-p1_backup@442 {
+				reg = <0x441 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s2_p1_backup: s2-p1_backup@442 {
+				reg = <0x442 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s3_p1_backup: s3-p1_backup@443 {
+				reg = <0x443 0x1>;
+				bits = <2 6>;
+			};
+
+			tsens_s4_p1_backup: s4-p1_backup@444 {
+				reg = <0x444 0x1>;
+				bits = <0 6>;
 			};
-			tsens_backup: backup@440 {
-				reg = <0x440 0x10>;
+
+			tsens_s5_p1_backup: s5-p1_backup@444 {
+				reg = <0x444 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s6_p1_backup: s6-p1_backup@445 {
+				reg = <0x445 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s7_p1_backup: s7-p1_backup@446 {
+				reg = <0x446 0x1>;
+				bits = <2 6>;
+			};
+
+			tsens_use_backup: use_backup@447 {
+				reg = <0x447 0x1>;
+				bits = <5 3>;
+			};
+
+			tsens_s8_p1_backup: s8-p1_backup@448 {
+				reg = <0x448 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s9_p1_backup: s9-p1_backup@448 {
+				reg = <0x448 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s10_p1_backup: s10_p1_backup@449 {
+				reg = <0x449 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_base2_backup: base2_backup@44a {
+				reg = <0x44a 0x2>;
+				bits = <2 8>;
+			};
+
+			tsens_s0_p2_backup: s0-p2_backup@44b {
+				reg = <0x44b 0x3>;
+				bits = <2 6>;
+			};
+
+			tsens_s1_p2_backup: s1-p2_backup@44c {
+				reg = <0x44c 0x1>;
+				bits = <0 6>;
+			};
+
+			tsens_s2_p2_backup: s2-p2_backup@44c {
+				reg = <0x44c 0x2>;
+				bits = <6 6>;
+			};
+
+			tsens_s3_p2_backup: s3-p2_backup@44d {
+				reg = <0x44d 0x2>;
+				bits = <4 6>;
+			};
+
+			tsens_s4_p2_backup: s4-p2_backup@44e {
+				reg = <0x44e 0x1>;
+				bits = <2 6>;
 			};
 		};
 
@@ -261,8 +510,60 @@ tsens: thermal-sensor@fc4a8000 {
 			compatible = "qcom,msm8974-tsens", "qcom,tsens-v0_1";
 			reg = <0xfc4a9000 0x1000>, /* TM */
 			      <0xfc4a8000 0x1000>; /* SROT */
-			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
-			nvmem-cell-names = "calib", "calib_backup";
+			nvmem-cells = <&tsens_mode>,
+				      <&tsens_base1>, <&tsens_base2>,
+				      <&tsens_s0_p1>, <&tsens_s0_p2>,
+				      <&tsens_s1_p1>, <&tsens_s1_p2>,
+				      <&tsens_s2_p1>, <&tsens_s2_p2>,
+				      <&tsens_s3_p1>, <&tsens_s3_p2>,
+				      <&tsens_s4_p1>, <&tsens_s4_p2>,
+				      <&tsens_s5_p1>, <&tsens_s5_p2>,
+				      <&tsens_s6_p1>, <&tsens_s6_p2>,
+				      <&tsens_s7_p1>, <&tsens_s7_p2>,
+				      <&tsens_s8_p1>, <&tsens_s8_p2>,
+				      <&tsens_s9_p1>, <&tsens_s9_p2>,
+				      <&tsens_s10_p1>, <&tsens_s10_p2>,
+				      <&tsens_use_backup>,
+				      <&tsens_mode_backup>,
+				      <&tsens_base1_backup>, <&tsens_base2_backup>,
+				      <&tsens_s0_p1_backup>, <&tsens_s0_p2_backup>,
+				      <&tsens_s1_p1_backup>, <&tsens_s1_p2_backup>,
+				      <&tsens_s2_p1_backup>, <&tsens_s2_p2_backup>,
+				      <&tsens_s3_p1_backup>, <&tsens_s3_p2_backup>,
+				      <&tsens_s4_p1_backup>, <&tsens_s4_p2_backup>,
+				      <&tsens_s5_p1_backup>, <&tsens_s5_p2_backup>,
+				      <&tsens_s6_p1_backup>, <&tsens_s6_p2_backup>,
+				      <&tsens_s7_p1_backup>, <&tsens_s7_p2_backup>,
+				      <&tsens_s8_p1_backup>, <&tsens_s8_p2_backup>,
+				      <&tsens_s9_p1_backup>, <&tsens_s9_p2_backup>,
+				      <&tsens_s10_p1_backup>, <&tsens_s10_p2_backup>;
+			nvmem-cell-names = "mode",
+					   "base1", "base2",
+					   "s0_p1", "s0_p2",
+					   "s1_p1", "s1_p2",
+					   "s2_p1", "s2_p2",
+					   "s3_p1", "s3_p2",
+					   "s4_p1", "s4_p2",
+					   "s5_p1", "s5_p2",
+					   "s6_p1", "s6_p2",
+					   "s7_p1", "s7_p2",
+					   "s8_p1", "s8_p2",
+					   "s9_p1", "s9_p2",
+					   "s10_p1", "s10_p2",
+					   "use_backup",
+					   "mode_backup",
+					   "base1_backup", "base2_backup",
+					   "s0_p1_backup", "s0_p2_backup",
+					   "s1_p1_backup", "s1_p2_backup",
+					   "s2_p1_backup", "s2_p2_backup",
+					   "s3_p1_backup", "s3_p2_backup",
+					   "s4_p1_backup", "s4_p2_backup",
+					   "s5_p1_backup", "s5_p2_backup",
+					   "s6_p1_backup", "s6_p2_backup",
+					   "s7_p1_backup", "s7_p2_backup",
+					   "s8_p1_backup", "s8_p2_backup",
+					   "s9_p1_backup", "s9_p2_backup",
+					   "s10_p1_backup", "s10_p2_backup";
 			#qcom,sensors = <11>;
 			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "uplow";
-- 
2.39.0


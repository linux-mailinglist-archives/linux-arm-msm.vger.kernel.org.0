Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B569B526D9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 02:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiEMXzr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 19:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiEMXzq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 19:55:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85C53AC0A8
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:46:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u23so16977983lfc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TX2EPeQO4iv5kbvdeC41BclBBjF3SbJIVPgRNnipG6Q=;
        b=yBfGhQzKrLMGPhZ57kCWsLvEOazFn87vmB7DlJD3uA7Ufer7wKby/lJr4woIh1Ma3h
         mI5pebX9Fg7RKVLN/wUHjFAbJt6SS0OXEDmLwxXiYMbgblpz9fmm+cctRi3Hs+XBKUb5
         lw8VCSUU3r0J/5WaM+6zYO5j9THM5gduyOkSsj/c0zNWKYGGK96qpzL/tQqjqh+G539w
         iSi0nPtyj/EOF/m3PYX27quOOTfRYcE0fs/M/oout2QiJ9IAh05rzByz7zGktjsT1qU+
         +12n88oCgKH8JVeeJQv+oeMroteA99LQg6SubDR4HV70Zn0aY/1Z4m7c2QIYI1xAK40q
         c7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TX2EPeQO4iv5kbvdeC41BclBBjF3SbJIVPgRNnipG6Q=;
        b=neFQGIXwrIBKXYSxy6IXUBK23KeCEfxUIpiD8DsvaytzgCclmPalQXYhQ2/R0k9Kvg
         xO1mkpWXtC+nGEWBsXoUFLLHjkv2VwgMwJp9a2/4wDM77eMBmU2/DLVPIER9jk2hQblL
         l6fwku89zs9qlilc7q4v6WpXhrCpr1m+d1RQ3T4fyd/wbNjCNRLOWZozljk4gSVN8kPO
         KV+Vi0OHoerXk/cWoAD4Y3yqel4XZjp+XkxG0GArA+IcfTiHhixILU07FgI4QEHzgUjJ
         YQdTmx6W/HPHNjtJhIUcPNV2qjXWRQv0Pp/ny6cKGeGZn6SKMVA3FSrD19YPP6wnQzei
         OlkQ==
X-Gm-Message-State: AOAM533H2+yKrI/DZ5YZYoCIaNCVYj/FrUTAmR6lFiZQz8boXFAkB+OK
        ih9vv5w43uMjdyfkW47w2KTNCA==
X-Google-Smtp-Source: ABdhPJyyJPoa7IrmQUayboS6inxRaPsYjx+m8Qr/HZ7y2yCcBtlZ0FrBbAgDYotRGLNtyIZ5mZVf5g==
X-Received: by 2002:ac2:5456:0:b0:471:f9e6:7388 with SMTP id d22-20020ac25456000000b00471f9e67388mr4713217lfn.504.1652485527846;
        Fri, 13 May 2022 16:45:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o8-20020a05651205c800b0047255d2118csm527342lfo.187.2022.05.13.16.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 16:45:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 6/8] arm64: dts: qcom: sdm630: use defined symbols for interconnects
Date:   Sat, 14 May 2022 02:45:16 +0300
Message-Id: <20220513234518.3068480-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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

Replace numeric values with the symbolic names defined in the bindings
header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 17a1877587cf..01a1a1703568 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,gpucc-sdm660.h>
 #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/interconnect/qcom,sdm660.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -1045,7 +1046,7 @@ adreno_gpu: gpu@5000000 {
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 
-			interconnects = <&gnoc 1 &bimc 5>;
+			interconnects = <&gnoc MASTER_APSS_PROC &bimc SLAVE_EBI>;
 			interconnect-names = "gfx-mem";
 
 			operating-points-v2 = <&gpu_sdm630_opp_table>;
@@ -1299,8 +1300,8 @@ sdhc_2: sdhci@c084000 {
 					<&xo_board>;
 			clock-names = "core", "iface", "xo";
 
-			interconnects = <&a2noc 3 &a2noc 10>,
-					<&gnoc 0 &cnoc 28>;
+			interconnects = <&a2noc MASTER_SDCC_2 &a2noc SLAVE_A2NOC_SNOC>,
+					<&gnoc MASTER_APSS_PROC &cnoc SLAVE_SDCC_2>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 
 			pinctrl-names = "default", "sleep";
@@ -1351,8 +1352,8 @@ sdhc_1: sdhci@c0c4000 {
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "core", "iface", "xo", "ice";
 
-			interconnects = <&a2noc 2 &a2noc 10>,
-					<&gnoc 0 &cnoc 27>;
+			interconnects = <&a2noc MASTER_SDCC_1 &a2noc SLAVE_A2NOC_SNOC>,
+					<&gnoc MASTER_APSS_PROC &cnoc SLAVE_SDCC_1>;
 			interconnect-names = "sdhc1-ddr", "cpu-sdhc1";
 			operating-points-v2 = <&sdhc1_opp_table>;
 			pinctrl-names = "default", "sleep";
@@ -1525,9 +1526,9 @@ mdp: mdp@c901000 {
 					      "core",
 					      "vsync";
 
-				interconnects = <&mnoc 2 &bimc 5>,
-						<&mnoc 3 &bimc 5>,
-						<&gnoc 0 &mnoc 17>;
+				interconnects = <&mnoc MASTER_MDP_P0 &bimc SLAVE_EBI>,
+						<&mnoc MASTER_MDP_P1 &bimc SLAVE_EBI>,
+						<&gnoc MASTER_APSS_PROC &mnoc SLAVE_DISPLAY_CFG>;
 				interconnect-names = "mdp0-mem",
 						     "mdp1-mem",
 						     "rotator-mem";
@@ -2034,7 +2035,7 @@ camss: camss@ca00000 {
 				"cphy_csid1",
 				"cphy_csid2",
 				"cphy_csid3";
-			interconnects = <&mnoc 5 &bimc 5>;
+			interconnects = <&mnoc MASTER_VFE &bimc SLAVE_EBI>;
 			interconnect-names = "vfe-mem";
 			iommus = <&mmss_smmu 0xc00>,
 				 <&mmss_smmu 0xc01>,
@@ -2097,8 +2098,8 @@ venus: video-codec@cc00000 {
 				 <&mmcc VIDEO_AXI_CLK>,
 				 <&mmcc THROTTLE_VIDEO_AXI_CLK>;
 			clock-names = "core", "iface", "bus", "bus_throttle";
-			interconnects = <&gnoc 0 &mnoc 13>,
-					<&mnoc 4 &bimc 5>;
+			interconnects = <&gnoc MASTER_APSS_PROC &mnoc SLAVE_VENUS_CFG>,
+					<&mnoc MASTER_VENUS &bimc SLAVE_EBI>;
 			interconnect-names = "cpu-cfg", "video-mem";
 			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
 			iommus = <&mmss_smmu 0x400>,
-- 
2.35.1


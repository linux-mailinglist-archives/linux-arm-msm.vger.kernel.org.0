Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55CB2525874
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359533AbiELXhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359580AbiELXgz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:36:55 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410A565D1E
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:54 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id c24so2230983lfv.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TX2EPeQO4iv5kbvdeC41BclBBjF3SbJIVPgRNnipG6Q=;
        b=HE08OQVAnUz2znm00hNElDbS1LEanC3qKT/KhfJ4Dnyuj6plz4TOoRXvqQC0+ztg7d
         VqgPqqlcPy7nZUg7yhtzgHI4zHwHpyVK8oEgk75jU/hA49F1m9frF4bNPHdAsn1jgMdM
         XXJ8p2CgFMpW71prYj9/XVW3LarKqJO60vhgC2RTtDn+1UYX9mHgK18p30Qc/NT8Cdjq
         ihav1A8UoabwD2K6QvCE0XiiEDvZq6mQ8wk8uDw2bW1RtUoO70dWiGAYSqpCpCjJsPPt
         2WPY0/AoGSzr0Pmz28/NaF4EqSrkQc0ULjXK8j4rEzUrjZNdSfsCcZN/MGj7BaOkyoP2
         LwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TX2EPeQO4iv5kbvdeC41BclBBjF3SbJIVPgRNnipG6Q=;
        b=BHGmcyxNI/MIk1A/4SNnqVR9LgGlEihCn30b5iCkWROjIpR3wJGUNpgVTjEpmYUNUn
         +0UgXJUpLE5nWAaNvFO4mo4vwk/OZ9LESuZ6qjM7rlv/DQLi8Qu+9Tkdfip5prIFJ/LE
         vmDJD326gEYCkJ2/zVwZwrA1Y+r053RgKsUwODgHLCHMW9+zjcEeWZ0VqxFqf3dnVyXc
         fwWWGuviPAjV6HX8/NI3Mzctg8rf+lV3fyBBTjAy1jYksxIY+QqMrjRKDM+4VHmdtsBN
         TVTZWoXduSPPJPSz2NAQnRvJn79K0akh1H3fGqJND8+Ao97IfLNR0Rah4G/MWHKIBhky
         3fpg==
X-Gm-Message-State: AOAM531V7xGvJTDEErYh3Ym6leHWqk1rqj1S5tzQ3EH1BQHDWdYiVYGU
        3W9X2OFTkYQzz1Mu6qMMAFCwqA==
X-Google-Smtp-Source: ABdhPJy+8lSM7XQyQmcSe1HtYqihl1nvJXf2e/GgGHxotQZ2pTQPbTT5zA2DFcRKH6tbcadE0L/Isg==
X-Received: by 2002:ac2:46c3:0:b0:471:f5fc:ac4b with SMTP id p3-20020ac246c3000000b00471f5fcac4bmr1400214lfo.381.1652398612615;
        Thu, 12 May 2022 16:36:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:36:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/8] arm64: dts: qcom: sdm630: use defined symbols for interconnects
Date:   Fri, 13 May 2022 02:36:45 +0300
Message-Id: <20220512233647.2672813-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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


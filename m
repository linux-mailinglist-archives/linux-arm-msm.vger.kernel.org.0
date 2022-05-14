Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06ACA5271AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 16:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbiENOKw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 10:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbiENOKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 10:10:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F52A14D23
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:49 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b18so18902326lfv.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vAKzbIo4hRjweGPYwmYctILBgK8ro78wB6S5h8puzVU=;
        b=sOzCUR6V98rqT7GY+XYtG9PyE3u4k5Hqtjemu8W6GaDAS6jsLgerdUYvJy50sY4JHF
         aqdZbvLH9DjdHU9Hh6XrczSOz9YGNZ13XstZM8GTbjCNTJs2QlQyCJL95kYPZCOvrqi6
         WERJ/1xs6wFz8UKX+CUbN/y63aREU6CoJbYKmR9s/h0oHuWT6bJTcl8Pt7MN6ohaEvjp
         +ZsprPfgZN6dPEEU9ZPceYEc+GMZ5SKx88iab2EIGiPW8ei+DXz5M7i0a6jdC1EoRLYX
         z0UqS2qQ6R3pgpk/YC/cAbETyoa/bpGhdkAsnf2tGZnxaSSMzS89PAYnCNn489jtHxs3
         20EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vAKzbIo4hRjweGPYwmYctILBgK8ro78wB6S5h8puzVU=;
        b=GiVF0Q+CD2SjDOANoBjBjrXxHVEgsmjw6pAjO8qAdJsEWjVUbANA2TqEQhPaEcUfik
         t0+XTyztGKpmW0ToQkKh8WVwoJcFDJdJc08bmBFydMeYnOy+v3Dqz8i37SfCgxmHopED
         VPNWHok2+Fy2Hid5NAB+S6pKB2HkO5TrQDtz7n+BHAvFvmXaOjWFZl458eM9PYMkX5A/
         X8t8hmH6bsu2WaAYffI1x62I5CFnSTNIG+WiErUp7IG4bzrXXs6N6uly3fHeVKwNIQE1
         yOcYyvEUZ9zKW2eGmqH6V14VbTHwv/Cqh1NnefU6bLrrBRGOsjmitUkDSkUtCDbmknUN
         aZnQ==
X-Gm-Message-State: AOAM5335YocoquwDjRtBEOHLvcT1On23WzojuqsUhLDzyiGrZhkOHYVZ
        Qt4KvXF2W3Uw2zQOeDHT4vzFvA==
X-Google-Smtp-Source: ABdhPJzYF4uRWhQ+XRmyrgNwFS5IbmNsiuCp414tMvuttj6/n7nvxSr+SMGtSvNpzelN14umWqxF5g==
X-Received: by 2002:a05:6512:3b2b:b0:473:a42b:faa4 with SMTP id f43-20020a0565123b2b00b00473a42bfaa4mr6785574lfv.292.1652537449017;
        Sat, 14 May 2022 07:10:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x9-20020a05651c104900b0024f3d1daedasm845912ljm.98.2022.05.14.07.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:10:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 08/12] arm64: dts: qcom: sdm630: use defined symbols for interconnects
Date:   Sat, 14 May 2022 17:10:37 +0300
Message-Id: <20220514141041.3158521-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
References: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
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
index 6d0bc9e8fb5b..44f048934fc6 100644
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
 
-			interconnects = <&bimc 1 &bimc 5>;
+			interconnects = <&bimc MASTER_OXILI &bimc SLAVE_EBI>;
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


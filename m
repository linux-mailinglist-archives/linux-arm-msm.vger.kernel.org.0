Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4E6E6BAF11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 12:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjCOLUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 07:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjCOLUZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 07:20:25 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F51D62B60
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 04:19:58 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id m2so4175155wrh.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 04:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678879193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EmJQmSLAdC0WtS3STT0wWc+AeCLwgpzodfCAhTdjfEQ=;
        b=kZoLoaKq4++Zg0XlEBc+O524i/T3zhsI0XJoOZIepOVnhA+Ce57DzTKsTQk24DJ6VS
         6LiUXGpYk68nxAfOyjzRYGB4ihlWpyFr4LjQeTYfyIbkP2vHZQAGQ7sG4Kn4BYgy3a5q
         cfWIqxwScEMmmz+CXeqits+nNSMbwK5V/ajQ+eImxkhvDGMBX8uU25dnqooMQGt/c0S3
         +QkhBygQcYpG1w4YDqNzXxJlMcH7+XWijb0cfTXRzYLV5zD46wqTZH7seW64IwHtyIgL
         POVRwVi922EZ+9mzAI5DSRv7+va1XVGy4LqnatrxuimnFdI2ekyfl2Hj2vofb7AnXbZl
         /G9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678879193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmJQmSLAdC0WtS3STT0wWc+AeCLwgpzodfCAhTdjfEQ=;
        b=pRxEEUYoc6d7eVhL1n+R3K5cdCV6/nKmJi+IZnV0CS7yYm1x/SZhQ7EOW7gA4KEZii
         D1byIeIjgabLXpQ7m7H+DhB/C+53MTNU9BTlp5CqHKQxZ7o5wA3+Ef/D/KYMHIBq7qLT
         wrDi9IxwCVa9DMSxjFJr4p0o7XWra5pXF2CIHGTYKtKSfo7mGvwu8DCjhLUkLNBWZmyj
         RFAeY0P5iBJg1SAHjLNsmKnajCyeXw7SKmzihwJTJOmBYuxbVxJktRlFvLzAI5X8hW8v
         AUZTNEEyGUk2mGTK/qnbnt/qXsIDrXh7RH48CnVygRmYpgkJO69e3duQnAOF3TNq7zw3
         FcPA==
X-Gm-Message-State: AO0yUKVX6JbGHyIECrwdJXhjdGpx26v3X+P2WlHKeamE6/hea5R81eEc
        qS6tFLCFriBEY8B+5xnUasG6oQ==
X-Google-Smtp-Source: AK7set/KeTl9OJvQqovTWcjALV01qYRi3aDVbanxxgY1tmvvlwN7HQJUghGt+tDyB9pfRe5G3K5iDQ==
X-Received: by 2002:adf:f748:0:b0:2cf:efc0:bd95 with SMTP id z8-20020adff748000000b002cfefc0bd95mr1498346wrp.38.1678879193022;
        Wed, 15 Mar 2023 04:19:53 -0700 (PDT)
Received: from lion.caleb.cas.dev (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id d13-20020adffbcd000000b002c55521903bsm4250015wrs.51.2023.03.15.04.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 04:19:52 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Caleb Connolly <caleb.connolly@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: sdm845: add framebuffer reserved memory
Date:   Wed, 15 Mar 2023 11:19:45 +0000
Message-Id: <20230315111947.3807083-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The bootloader configures a framebuffer in memory to display splash
screens or other information. This configuration is overriden when the
display pipeline probes, but never unmapped from the SMMU. To prevent
issues from the kernel trying to allocate in this region and to allow
using the framebuffer for debugging, many devices already reserve this
region.

All devices follow MTP and use the same address for this region, Cheza
is a likely exception though I'm not able to validate that.

Some devices only reserve the size needed to store the actual
framebuffer, this is incorrect as on all devices I've checked the full
0x2400000 bytes are mapped.

This patch moves the framebuffer region to sdm845.dtsi and removes it
from each individual device. This ensures that the correct size is
always reserved and prevents having the add the region for each
individual device.

This patch specifically ensures that this region is now reserved on the
OnePlus 6, where it wasn't before.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---

Changes since v1:
 * Offer more context and justification for this change
 * Make sure Cheza doesn't inherit the node.
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi              | 6 ------
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts     | 5 -----
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts           | 5 -----
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi       | 6 ------
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ------
 arch/arm64/boot/dts/qcom/sdm845.dtsi                        | 5 +++++
 arch/arm64/boot/dts/qcom/sdm850.dtsi                        | 2 ++
 7 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index f942c5afea9b..6a1c674a015b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -93,12 +93,6 @@ spss_mem: memory@99000000 {
 			no-map;
 		};
 
-		/* Framebuffer region */
-		memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x2400000>;
-			no-map;
-		};
-
 		/* rmtfs lower guard */
 		memory@f0800000 {
 			reg = <0 0xf0800000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d37a433130b9..7c2457948a32 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -55,11 +55,6 @@ vreg_s4a_1p8: pm8998-smps4 {
 	};
 
 	reserved-memory {
-		memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x02400000>;
-			no-map;
-		};
-
 		memory@a1300000 {
 			compatible = "ramoops";
 			reg = <0x0 0xa1300000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index b54e304abf71..4f6b1053c15b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -60,11 +60,6 @@ key-vol-up {
 	};
 
 	reserved-memory {
-		framebuffer_region@9d400000 {
-			reg = <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
-			no-map;
-		};
-
 		ramoops: ramoops@b0000000 {
 			compatible = "ramoops";
 			reg = <0 0xb0000000 0 0x00400000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 4984c7496c31..7e273cc0158d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -79,12 +79,6 @@ vreg_s4a_1p8: pm8998-smps4 {
 	};
 
 	reserved-memory {
-		/* SONY was cool and didn't diverge from MTP this time, yay! */
-		cont_splash_mem: memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x2400000>;
-			no-map;
-		};
-
 		ramoops@ffc00000 {
 			compatible = "ramoops";
 			reg = <0x0 0xffc00000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index e0fda4d754fe..191c2664f721 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -98,12 +98,6 @@ spss_mem: memory@97f00000 {
 			no-map;
 		};
 
-		/* Cont splash region set up by the bootloader */
-		cont_splash_mem: framebuffer@9d400000 {
-			reg = <0 0x9d400000 0 0x2400000>;
-			no-map;
-		};
-
 		rmtfs_mem: memory@f6301000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0 0xf6301000 0 0x200000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 479859bd8ab3..ecec2ee46683 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -865,6 +865,11 @@ spss_mem: spss@97b00000 {
 			no-map;
 		};
 
+		cont_splash_mem: framebuffer@9d400000 {
+			reg = <0 0x9d400000 0 0x2400000>;
+			no-map;
+		};
+
 		mdata_mem: mpss-metadata {
 			alloc-ranges = <0 0xa0000000 0 0x20000000>;
 			size = <0 0x4000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850.dtsi b/arch/arm64/boot/dts/qcom/sdm850.dtsi
index da9f6fbe32f6..b787575c77a5 100644
--- a/arch/arm64/boot/dts/qcom/sdm850.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
@@ -7,6 +7,8 @@
 
 #include "sdm845.dtsi"
 
+/delete-node/ &cont_splash_mem;
+
 &cpu4_opp_table {
 	cpu4_opp33: opp-2841600000 {
 		opp-hz = /bits/ 64 <2841600000>;
-- 
2.39.2


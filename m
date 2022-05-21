Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B77A252FF5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244517AbiEUU12 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240762AbiEUU10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:27:26 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5695AA60
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:23 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id o22so13022583ljp.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P6dEN12+e/3jrGidwJFxqGv3N1U2RblnzTnzycq26RY=;
        b=DIoLAWszmoWBCmnMpSxqw/ypSTqKQm7Jsmxg0LgguRist0raw/t03Eg0KdwLP1B8dJ
         a0IcO0tlwLHKwzLlPBe6PrMMrhO5bUt95ZsS9kARkUt7aPM+xNGzjxcH29GE5ZlfFKWg
         gQ6gOtAohqunQHj3fAYXeSzoAfJ2Qfk+Ow2YeDQlqJJlSPv4jstBJOCIbDVjA3WAh9xS
         81QZv8zXwnf5xem327Hu4AY3mUZ+rHE+HLcmNagxt5QXup7BFL4hrFvQTPyollr0sNeA
         Hr9YSCNhnJej+2vvggq08+56kPd+6NyR6hRz5E3DU8ufO6ehweTb1E6+m26DJW3p1o6U
         7Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P6dEN12+e/3jrGidwJFxqGv3N1U2RblnzTnzycq26RY=;
        b=evpvrjbHID1C/XYWRJsDn3QHJi7d3hxS5f6C/+RZ2xpcAo24iddSENKjlp5dJGgFU1
         vX2eEsU+ysvKgeogQlt9oyhEonk4vb63TblSHRKKie+y6dBHy5s2GRMO5+iJ6WwzbSU4
         v1dQA5BuQyKxPQy58n3Euoa+x5SIlZAaX5V/tWPm7IMl9Qla60pOTVjdgbEK9+5ovzR9
         +XsJQfS+B04gbbTowvfP5y8ksohR0NtfiW0ylJKIdV5qqn9uZ33SxXTBQqbGQOEenZxB
         P27mGlFSUlDFIkmB7sDWe5ckBoh5WUn1i1ogV3e/5r/PhiGeiWSsZrn4GcVgjdf2sGAM
         404w==
X-Gm-Message-State: AOAM530HEuU5JWZxHw0BTuKriU4PEP1+nBZ7twavEhANpsysmNqAZ4r/
        7A5erDFtPk5Fve5iDmyE8AYyfw==
X-Google-Smtp-Source: ABdhPJykaaTR3o9Iapz4G76tONPSRLrqcFU4Ux6/D34ubZKqRA7laAqVzubScp8yNIpr8abNgGeClg==
X-Received: by 2002:a2e:391c:0:b0:253:c3e8:8e79 with SMTP id g28-20020a2e391c000000b00253c3e88e79mr8486266lja.304.1653164842185;
        Sat, 21 May 2022 13:27:22 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x1-20020ac259c1000000b004786291114fsm317773lfn.140.2022.05.21.13.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:27:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v7 09/11] arm64: dts: qcom: sdm660: move SDHC2 card detect pinconf to board files
Date:   Sat, 21 May 2022 23:27:06 +0300
Message-Id: <20220521202708.1509308-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
References: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
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

This results in dts duplication, but per mutual agreement card detect
pin configuration belongs to the board files. Move it from the SoC
dtsi to the board DT files.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi   | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi             | 12 ------------
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts     | 16 ++++++++++++++++
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 00baacf28c63..ccde9951e4fb 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -549,6 +549,22 @@ vreg_l19a_3p3: l19 {
 	};
 };
 
+&sdc2_state_on {
+	sd-cd {
+		pins = "gpio54";
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+};
+
+&sdc2_state_off {
+	sd-cd {
+		pins = "gpio54";
+		bias-disable;
+		drive-strength = <2>;
+	};
+};
+
 &sdhc_1 {
 	status = "okay";
 	supports-cqe;
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 1c887b9055b3..55de345895e6 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -983,12 +983,6 @@ data {
 					bias-pull-up;
 					drive-strength = <10>;
 				};
-
-				sd-cd {
-					pins = "gpio54";
-					bias-pull-up;
-					drive-strength = <2>;
-				};
 			};
 
 			sdc2_state_off: sdc2-off {
@@ -1009,12 +1003,6 @@ data {
 					bias-pull-up;
 					drive-strength = <2>;
 				};
-
-				sd-cd {
-					pins = "gpio54";
-					bias-disable;
-					drive-strength = <2>;
-				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 9280c1f0c334..2b1216502eb0 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -363,6 +363,22 @@ vreg_l19a_3p3: l19 {
 	};
 };
 
+&sdc2_state_on {
+	sd-cd {
+		pins = "gpio54";
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+};
+
+&sdc2_state_off {
+	sd-cd {
+		pins = "gpio54";
+		bias-disable;
+		drive-strength = <2>;
+	};
+};
+
 &sdhc_1 {
 	status = "okay";
 	supports-cqe;
-- 
2.35.1


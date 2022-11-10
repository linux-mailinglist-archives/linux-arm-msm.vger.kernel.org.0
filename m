Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2CAA624556
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 16:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbiKJPQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 10:16:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbiKJPQV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 10:16:21 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30881F60C
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:16:18 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id a13so3625690edj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LN1U4mZ9BKy9b/d0FsMWTlpOd6p+7htqRFgfQaki7RI=;
        b=gRWU428TNi2n+0fvmKxE0ljpqDmUdJ29tdGhpAKJTAydrkj99Di90lS5wcP3ErtJmz
         FYkX4pi9lJGqafLqIbnZVzCaIRfzvPk1DEBz1PIGZkOBiDZv9u4gvoLd+WU554TKALQE
         YDZBXYb3c6M7tq1JQakbMFWkuf8+D2Do/HpDQm7oHrDUsizebhjCUBN+wosiXTQPBBNb
         mnvc8Op4MQ5GeE25catj8eF+bv32SLiujkFjOIjusH4L41uAgXQUAnmGfPNYZ9Oyaj/P
         D8Z0q078Q0dXPa/hf6Qp7Ou150b/WDWQ+H3m8lyQdO1/jEfdPMTNgEHjpIC10XQu5pCT
         vtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LN1U4mZ9BKy9b/d0FsMWTlpOd6p+7htqRFgfQaki7RI=;
        b=BYSnMviY2A4yiqlPZZfr0cyRMN6+briktduWAEa8Oi0dRp59EUg3xd/9dkYWiZNgtH
         +QpuER9gwFbYMRjH18ZJ2HIn3KQaF1qEO8WN3yPIyEgP0QnZf6t0sooLqTnSf5h0bSLl
         0Ha+nDV5+WD5qekuSC2BwBSta0M+JZw7O1aNc8t94qrOsYRjn9feqRhU+wkbVayX9KqF
         kVKMHzoNkqwOQT8JdK3cnM6NYowabP0CYrQMWKm0nxtAQRSwwmMVZ6rlk9AU4LfhADNJ
         pEeonmXwROCmatD3PrRKj0ZSPrTif0Qfo28u57fepuXeXfmv+ds68hd/vEixlQskgB1Q
         4dhg==
X-Gm-Message-State: ACrzQf0yqaFYdjwdrDnhMuQsjjXp9mm3BM4B4NHfu9enlNRNjrY2msaK
        J2/hyJ8jVodr9F4IBk5x7WVCh2WbDFczfrGG9V8=
X-Google-Smtp-Source: AMsMyM53BtruN4SCEnT9Nc3yDWsSXfDnIZYcHSTnxYtwkSHTXX83ywwsZ8L+xXo00l++diKjj0GekA==
X-Received: by 2002:a05:6402:22e8:b0:461:e598:e0bb with SMTP id dn8-20020a05640222e800b00461e598e0bbmr2484239edb.21.1668093376881;
        Thu, 10 Nov 2022 07:16:16 -0800 (PST)
Received: from otso.. ([46.183.103.8])
        by smtp.gmail.com with ESMTPSA id fd25-20020a056402389900b0045b910b0542sm8555466edb.15.2022.11.10.07.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 07:16:16 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Enable SD card
Date:   Thu, 10 Nov 2022 16:15:06 +0100
Message-Id: <20221110151507.53650-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fairphone 4 uses sdhc_2 for the SD card, configure the pins for it and
enable it.

The regulators which are exclusively used for SDHCI have their maximum
voltage decreased to what downstream sets on the consumer side, like on
many other platforms and allowed to set the load.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 39 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 30c94fd4fe61..1cb14051ab1b 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -279,8 +279,12 @@ vreg_l5e: ldo5 {
 
 		vreg_l6e: ldo6 {
 			regulator-min-microvolt = <1700000>;
-			regulator-max-microvolt = <3544000>;
+			regulator-max-microvolt = <2950000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes =
+				<RPMH_REGULATOR_MODE_LPM
+				 RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7e: ldo7 {
@@ -297,8 +301,12 @@ vreg_l8e: ldo8 {
 
 		vreg_l9e: ldo9 {
 			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <3544000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes =
+				<RPMH_REGULATOR_MODE_LPM
+				 RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l10e: ldo10 {
@@ -424,6 +432,33 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&sdc2_off_state {
+	sd-cd-pins {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&sdc2_on_state {
+	sd-cd-pins {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9e>;
+	vqmmc-supply = <&vreg_l6e>;
+
+	cd-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <13 4>, <56 2>;
 };
-- 
2.38.1


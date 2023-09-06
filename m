Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84500793814
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 11:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236656AbjIFJZH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 05:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236637AbjIFJZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 05:25:06 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FEC11708
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 02:25:02 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so2749501e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693992300; x=1694597100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tTpQvf5esAbjLqRJbk/GJE3MAqg/M3E5kjL+FFGdtg=;
        b=bUSEFq+BcZ2qUqPIdixv9E76ji9Btbod/rLCxajolaplddyU6wnCkUNf7VG9c92vTe
         Qbq3LTzHIk8I8sodNR6vSQIMbBf7DPkwSycpyNeuGvy/r7Zzdv53NqyUwT5DNXFQJV62
         IBR/WsX+FgeLAJikp0OcEj8Yk62k3B6JY+JvGO+BWrzxfZmFWShi5cgbzlOjUrhyZ4Dr
         kJoN/xaakJ4HfzJmntCRpD6t2uo4OGiJDqYV2DTpHmWCmfkSMOV3tsrHl7RBAmD8L9dW
         7jeoWhNgPA58J50vJcbwOsvjjhzd0R33+oZ9CeTEO2ECwUOOPt9iZsj34NyY3KlgaIWr
         aVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992300; x=1694597100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tTpQvf5esAbjLqRJbk/GJE3MAqg/M3E5kjL+FFGdtg=;
        b=Q5YqbGCkpv3SNv4Wk/vZg5Z7BDS6K4cPt42gELgTkCka7/ncqhAKKaeGmyHVtNyZpZ
         J5xeZCblv+dSp2GuAGX/mH+dsWCfYJZ7pLOI6C/lsntMFtRCdctmwK1sXYw/rEhQ3Fc0
         zuhpYSdC4NqrdXPs5AS2Ze+QU/B2jAI47buIyyaKenpbUpO7g7sFQkYSiDYYDaBbfd1a
         0xI/3Z0AGICFGHh2ikyyhfsZhfy4LL1N+S6Q5MzgL51N4yJPO9NQhhF5SkCttOEqNa+w
         N5Dq2IGwZN2IzQ78snJJXLNi2kPxy0pbTquLeKFzoj/uUhJECjnIAL+2mwg4gQbAMBJr
         oFCw==
X-Gm-Message-State: AOJu0YxAYnBdRjTk/1YPbmr+PQf1U5NWvqpMw5Wv7Blfwe+jm43ybSIc
        FXEv9wwRX6uf9WQOfcdMH/9bPw==
X-Google-Smtp-Source: AGHT+IHTq09S7UVjLcS9Dvpl6hPbgtJKanFRtWmiqDWBfzu1dweqOXsuDIJ1oTvabzh9hlx4UP5/rQ==
X-Received: by 2002:a05:6512:4020:b0:501:c3cd:652c with SMTP id br32-20020a056512402000b00501c3cd652cmr2431698lfb.31.1693992300487;
        Wed, 06 Sep 2023 02:25:00 -0700 (PDT)
Received: from [10.167.154.1] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b005232c051605sm8096155edt.19.2023.09.06.02.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 02:25:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 06 Sep 2023 11:24:56 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: qrb2210-rb1: Fix regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-topic-rb1_features_sans_icc-v1-2-e92ce6fbde16@linaro.org>
References: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
In-Reply-To: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693992295; l=6762;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DqC8ZXzqnHdza8o/7w0SCcfZdCImiHqgYjjXlkoPTAg=;
 b=BtIBMDq5Tev94GgSuT3C/DuX/o6Oa9eTQ/larFIK8OgJs5GGdUuHdhuUC6wbnT3H62sjd4Wrg
 puqy+JSHgPFC+74wGLEc0TTt4QXJ9JTQcphcKeaoCRz1kFwb+EDXMFq
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit b4fe47d12f1f ("arm64: dts: qcom: qrb2210-rb1: Add regulators")
introduced regulator settings that were never put in place, as all of the
properties ended 'microvolts' instead of 'microvolt' (which dt schema did
not check for back then).

Fix the microvolts-microvolt typo and adjust voltage ranges where it's
necessary to fit within the volt = base + n*step formula.

Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: b4fe47d12f1f ("arm64: dts: qcom: qrb2210-rb1: Add regulators")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 86 ++++++++++++++++----------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 5cda5b761455..0f7c59187896 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -150,15 +150,15 @@ regulators {
 
 		pm2250_s3: s3 {
 			/* 0.4V-1.6625V -> 1.3V (Power tree requirements) */
-			regulator-min-microvolts = <1350000>;
-			regulator-max-microvolts = <1350000>;
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
 			regulator-boot-on;
 		};
 
 		pm2250_s4: s4 {
 			/* 1.2V-2.35V -> 2.05V (Power tree requirements) */
-			regulator-min-microvolts = <2072000>;
-			regulator-max-microvolts = <2072000>;
+			regulator-min-microvolt = <2072000>;
+			regulator-max-microvolt = <2072000>;
 			regulator-boot-on;
 		};
 
@@ -166,47 +166,47 @@ pm2250_s4: s4 {
 
 		pm2250_l2: l2 {
 			/* LPDDR4X VDD2 */
-			regulator-min-microvolts = <1136000>;
-			regulator-max-microvolts = <1136000>;
+			regulator-min-microvolt = <1136000>;
+			regulator-max-microvolt = <1136000>;
 			regulator-always-on;
 			regulator-boot-on;
 		};
 
 		pm2250_l3: l3 {
 			/* LPDDR4X VDDQ */
-			regulator-min-microvolts = <616000>;
-			regulator-max-microvolts = <616000>;
+			regulator-min-microvolt = <616000>;
+			regulator-max-microvolt = <616000>;
 			regulator-always-on;
 			regulator-boot-on;
 		};
 
 		pm2250_l4: l4 {
-			/* max = 3.05V -> max = just below 3V (SDHCI2) */
-			regulator-min-microvolts = <1648000>;
-			regulator-max-microvolts = <2992000>;
+			/* max = 3.05V -> max = 2.7 to disable 3V signaling (SDHCI2) */
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2700000>;
 			regulator-allow-set-load;
 		};
 
 		pm2250_l5: l5 {
 			/* CSI/DSI */
-			regulator-min-microvolts = <1232000>;
-			regulator-max-microvolts = <1232000>;
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1232000>;
 			regulator-allow-set-load;
 			regulator-boot-on;
 		};
 
 		pm2250_l6: l6 {
 			/* DRAM PLL */
-			regulator-min-microvolts = <928000>;
-			regulator-max-microvolts = <928000>;
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <928000>;
 			regulator-always-on;
 			regulator-boot-on;
 		};
 
 		pm2250_l7: l7 {
 			/* Wi-Fi CX/MX */
-			regulator-min-microvolts = <664000>;
-			regulator-max-microvolts = <664000>;
+			regulator-min-microvolt = <664000>;
+			regulator-max-microvolt = <664000>;
 		};
 
 		/*
@@ -216,37 +216,37 @@ pm2250_l7: l7 {
 
 		pm2250_l10: l10 {
 			/* Wi-Fi RFA */
-			regulator-min-microvolts = <1300000>;
-			regulator-max-microvolts = <1300000>;
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
 		};
 
 		pm2250_l11: l11 {
 			/* GPS RF1 */
-			regulator-min-microvolts = <1000000>;
-			regulator-max-microvolts = <1000000>;
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
 			regulator-boot-on;
 		};
 
 		pm2250_l12: l12 {
 			/* USB PHYs */
-			regulator-min-microvolts = <928000>;
-			regulator-max-microvolts = <928000>;
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <928000>;
 			regulator-allow-set-load;
 			regulator-boot-on;
 		};
 
 		pm2250_l13: l13 {
 			/* USB/QFPROM/PLLs */
-			regulator-min-microvolts = <1800000>;
-			regulator-max-microvolts = <1800000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
 			regulator-allow-set-load;
 			regulator-boot-on;
 		};
 
 		pm2250_l14: l14 {
 			/* SDHCI1 VQMMC */
-			regulator-min-microvolts = <1800000>;
-			regulator-max-microvolts = <1800000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
 			regulator-allow-set-load;
 			/* Broken hardware, never turn it off! */
 			regulator-always-on;
@@ -254,8 +254,8 @@ pm2250_l14: l14 {
 
 		pm2250_l15: l15 {
 			/* WCD/DSI/BT VDDIO */
-			regulator-min-microvolts = <1800000>;
-			regulator-max-microvolts = <1800000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
 			regulator-allow-set-load;
 			regulator-always-on;
 			regulator-boot-on;
@@ -263,47 +263,47 @@ pm2250_l15: l15 {
 
 		pm2250_l16: l16 {
 			/* GPS RF2 */
-			regulator-min-microvolts = <1800000>;
-			regulator-max-microvolts = <1800000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
 			regulator-boot-on;
 		};
 
 		pm2250_l17: l17 {
-			regulator-min-microvolts = <3000000>;
-			regulator-max-microvolts = <3000000>;
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
 		};
 
 		pm2250_l18: l18 {
 			/* VDD_PXn */
-			regulator-min-microvolts = <1800000>;
-			regulator-max-microvolts = <1800000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
 		};
 
 		pm2250_l19: l19 {
 			/* VDD_PXn */
-			regulator-min-microvolts = <1800000>;
-			regulator-max-microvolts = <1800000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
 		};
 
 		pm2250_l20: l20 {
 			/* SDHCI1 VMMC */
-			regulator-min-microvolts = <2856000>;
-			regulator-max-microvolts = <2856000>;
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3600000>;
 			regulator-allow-set-load;
 		};
 
 		pm2250_l21: l21 {
 			/* SDHCI2 VMMC */
-			regulator-min-microvolts = <2960000>;
-			regulator-max-microvolts = <3300000>;
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <3300000>;
 			regulator-allow-set-load;
 			regulator-boot-on;
 		};
 
 		pm2250_l22: l22 {
 			/* Wi-Fi */
-			regulator-min-microvolts = <3312000>;
-			regulator-max-microvolts = <3312000>;
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3312000>;
 		};
 	};
 };

-- 
2.42.0


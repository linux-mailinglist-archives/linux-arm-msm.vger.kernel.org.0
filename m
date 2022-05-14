Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D506B5273AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 21:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234815AbiENTBy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 15:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234849AbiENTBu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 15:01:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3CB28738
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:49 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id p26so19633428lfh.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PIPhrHSX0vDaE6umAr6Uz83mLWrCmZ9TxDaxz4FKhdY=;
        b=H65mzVaNr4iujB5hGdwVwcYPUMtX/2aAm83Q+G7uP5nqE5K+t3zzjXnookoIQeG3fz
         R3R5HzC97wdEZxpnaHEh/nshQn2FI1K8M7EZKakNCd4hS3MSGZqPuNwcMzPnWdIaEglC
         uBxF4dU7BQCoR/WQn5+0JAzwaQXAMrDhMH6ZyH/sMz/2Le09asz4hmzOUQaYspoJOKDM
         h/REjJy1/aPi8FOOzAiRHfA698vBg3V1w8pXa44CWNF7k/w42cTEVniACWcdlk0Fs8lg
         j/g3oL7Ia2QuV3UQcKBic3WHCm2G36PiDRtIQhY7Kkno6e7tS9RnA26wsej6eyr9AzZE
         Pbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PIPhrHSX0vDaE6umAr6Uz83mLWrCmZ9TxDaxz4FKhdY=;
        b=bHXsKXq0rBr/v1nsZNUBR6U6IT+ZM0+vchW/QBnxHUkL5WAyHddrH7Mw7VGRqbKvA2
         WeVSF0/s99/gBCj4IODhTCSnZ5lYnlQSi2zVDNk7OkbuQue4+e6rq5ncFINxsPNmdzYp
         q62Zvn66/OZhcHF4JMXWeDkUH28W1gNjA9cksOVc9zYx8AWjOTw6nvIjP1zmoXXlqMrg
         qV/wvN8i5oRPDodB31ZLByMyvnl1vj5BcvqUuHIQZ1D3k7LBSKTec/qD4AHBSGeSN8HH
         WqKaFa1rPIRVrYrXiQBymR3rino0pwtWy3Do6zEvtGVbq7MAcdIS8iLr2zKTg6C9ch4R
         7sFw==
X-Gm-Message-State: AOAM533A5uJdL6aa9kJlg3Ed0yuT5Ruf3T7a1XfW4iy9vqkxTQamWz4u
        JGuEiQS0/+kFExluVIp8JcZ4ww==
X-Google-Smtp-Source: ABdhPJw2+9H0WcICaEej/Et96byTHp3ZFLBRw7qtWFETU8N1ScIAUYX0ncTH+9qwOYAda4rQiapHew==
X-Received: by 2002:a19:6a06:0:b0:472:100:47c6 with SMTP id u6-20020a196a06000000b00472010047c6mr7552953lfu.307.1652554908338;
        Sat, 14 May 2022 12:01:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b0047255d210f4sm787427lfg.35.2022.05.14.12.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 12:01:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 10/12] arm64: dts: qcom: sdm660: move SDHC2 card detect pinconf to board files
Date:   Sat, 14 May 2022 22:01:36 +0300
Message-Id: <20220514190138.3179964-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
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

This results in dts duplication, but per mutual agreement card detect
pin configuration belongs to the board files. Move it from the SoC
dtsi to the board DT files.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
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
index 44f048934fc6..e6f06a548011 100644
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


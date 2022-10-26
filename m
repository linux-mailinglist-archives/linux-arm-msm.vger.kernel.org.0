Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8789F60E9B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 22:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbiJZUEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 16:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbiJZUEF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 16:04:05 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BED4EE08A
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 13:04:04 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id s17so11503181qkj.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCMOew4GYhYa9VutNSyEqOxm0n7KKviZV3m1tbrXNe8=;
        b=sTTWAIo5k27JetB031FERfXCHBmgKPyJ72n2o8UpQU7LPPUKLhGV/CDya5o/7qVF1q
         uOqEOdGauhJkk9EAWfkObzamE1fBwkEZ4wJLVDNagbXvR6JivctG6utnuSdEvbzDW3AB
         zW/kLgrUcuHCMiczttSb93NiRVPpXwBweiOq8DN+AZmFjpVoBhwVZ+zGiI2LTfE0hqG0
         XzQKPjTLJtg2L99KsgK9xZDOOgDGsSVXxBhFqB+sfbOBJFkBZ51g6UidteeNMBK/VMDh
         dlElAojwU9/5R+8NwyACsGYei27bywaB2tavQdvwraMhkBaOUVMcbM1ryfp3Wfq8SNlk
         bXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCMOew4GYhYa9VutNSyEqOxm0n7KKviZV3m1tbrXNe8=;
        b=RH6PG82FK0FevBwjZrNYK5Rty3Lhe2s4kbybIGzRiC2uPl1Qg7oHZc1cm1AjzRAenK
         QeGg1LeYAD0vdyyy1ovj8xddLXvnFPA0t3zjcqr7zhghwEHq6FwrM0M7C+CWjiyCbSPr
         g7Yp5XXhQ6epLERBo1BWpTXIQOcRgOicRRGpu2oxnD9tsTGzF+ZsD1bD55om2sJM07z6
         l3pzcGoSjGX01pW0ZqNtx4c5ADvY4Vqlk1KR0prgSG6UXLqqxa5eGSmg/D/fhzZkco/w
         D+8Xn0+ks9W4D81/FqBB4Q1XDNnud1l4zMNwgFzpugPK4SRI9LqdgqcXLCtvOzmabwyG
         pBkA==
X-Gm-Message-State: ACrzQf2Nm4eI2v1EzcFvz6rR7W1mUdV0QdB+BiPgQlVyB5JskjCZErDK
        ptvEYtZBsTwO1SSI6A1fbCpbpg==
X-Google-Smtp-Source: AMsMyM4AS50UrpNeey0s5Z7YjYa+fX4boAh819y3K4g+c2NblZIARcITUJAeqCDo2aFHrVHFEuBK0g==
X-Received: by 2002:a05:620a:4487:b0:6ee:bcfd:bd38 with SMTP id x7-20020a05620a448700b006eebcfdbd38mr31661442qkp.468.1666814643576;
        Wed, 26 Oct 2022 13:04:03 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id de30-20020a05620a371e00b006e99290e83fsm2942089qkb.107.2022.10.26.13.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 13:04:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 1/4] arm64: dts: qcom: sm8450: move SDHCI pin configuration to DTSI
Date:   Wed, 26 Oct 2022 16:03:54 -0400
Message-Id: <20221026200357.391635-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026200357.391635-1-krzysztof.kozlowski@linaro.org>
References: <20221026200357.391635-1-krzysztof.kozlowski@linaro.org>
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

The SDHCI pin configuration/mux nodes are actually common to all
upstreamed boards, so define them in SoC DTSI to reduce code
duplication.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

In theory drive strength belongs to the board DTS, not SoC DTSI, but I
am following the advice here:
https://lore.kernel.org/lkml/CAD=FV=VUL4GmjaibAMhKNdpEso_Hg_R=XeMaqah1LSj_9-Ce4Q@mail.gmail.com/
---
 .../qcom/sm8450-sony-xperia-nagara-pdx223.dts | 20 -------------------
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
index 82918c2d956f..718c690af8ad 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
@@ -572,26 +572,6 @@ &spi10 {
 &tlmm {
 	gpio-reserved-ranges = <28 4>;
 
-	sdc2_default_state: sdc2-default-state {
-		clk-pins {
-			pins = "sdc2_clk";
-			drive-strength = <16>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "sdc2_cmd";
-			drive-strength = <16>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "sdc2_data";
-			drive-strength = <16>;
-			bias-pull-up;
-		};
-	};
-
 	ts_int_default: ts-int-default-state {
 		pins = "gpio23";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 1d1775334575..1df5c964c6f7 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2515,6 +2515,26 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 211>;
 			wakeup-parent = <&pdc>;
 
+			sdc2_default_state: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <16>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <16>;
+					bias-pull-up;
+				};
+			};
+
 			sdc2_sleep_state: sdc2-sleep-state {
 				clk-pins {
 					pins = "sdc2_clk";
-- 
2.34.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE16744F05
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 19:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjGBRn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 13:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjGBRnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 13:43:04 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908D1E6A
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 10:43:02 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b69ff54321so57554111fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 10:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319781; x=1690911781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oENXundP7VA1MRBgQvpQRhOTru+bmpAb8Jj6teLABdA=;
        b=um8AHGnAc49w/aoee5Zj053/cQRYmY2CzWL0EM06116yTf1ooLHmqdGZO37hUnJhWL
         NsmsHw6FxCPCkYI9sIWXlsEV4cUfYk8yc9Vr80dVghW+iVUDELYAZhSJjeUJBwc67IEl
         zsmDzU/vldC9/AVBU4hBSXe9vBXNgLfA+5u34LymHZk5wDlDmN/I8/WTCzcEAMiutneA
         uykGT5A7nI+dB08g/xcFCVBwaf3iY+Mvw0Z3kOEFGA9cK2tF8GQAX53TRBR47KBGqU+x
         JZS2cZCUaVw62tEkxoVUs5SFS/g9V2UxiVwg+pQDqsWwvJy6cxyNTc5QfCoAg/mef7aq
         spZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319781; x=1690911781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oENXundP7VA1MRBgQvpQRhOTru+bmpAb8Jj6teLABdA=;
        b=BBHSqJwOJiVLToLvf8S13JP1V0kGqJFJw2F57esw6Tyz86R9w8VAEAEsWXy31Yollk
         DKf0o2eXCCc3lYYRaL76H1Rpsb/+2f39RqWrcUk1VutxpR3VeA0+/mQkoS+GUEoauL6h
         yKA33xxuVBNhKsG+3+VTWBZ+FKXoxYoJY3gJ6Hmu0xhO1+vA7PpmZRmCGT3j74AxRc3n
         2CG86pZGDMleLWfCR3c6OoSA1MLsDv2ynt7D/Ca0zE1Zeo94j237BQAtE73zJew4WjxS
         IRLf782EKZEE9R/OoE2Bg1OXxbPOqrV0BsSXMHWHBsP6uzKaCHIJzPj7d8P074snX2GC
         XXIA==
X-Gm-Message-State: ABy/qLY6ocSKuzdaeRh41MpIPT38BJRiAkgXIogBXgHsgLmZErQVXqZJ
        wcvjMUUT3j+N3+OIvU+UIzcHGA==
X-Google-Smtp-Source: APBJJlGIGizI+sgvR9iOUHE9NZTug7FX/4nSpCfK61lbe7gurYQEjk8zzdYkhAWzMvzk6fkohun3MA==
X-Received: by 2002:a2e:3207:0:b0:2b6:da64:321 with SMTP id y7-20020a2e3207000000b002b6da640321mr2242151ljy.45.1688319780836;
        Sun, 02 Jul 2023 10:43:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:43:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v3 14/28] ARM: dts: qcom: apq8064-asus-nexus7-flo: constraint cpufreq regulators
Date:   Sun,  2 Jul 2023 20:42:32 +0300
Message-Id: <20230702174246.121656-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
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

Add additional constraints to the CPUfreq-related regulators, it is
better be safe than sorry there.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index 1caa73e20bc9..1d6fb840dc60 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -213,9 +213,9 @@ pm8921_s1: s1 {
 			bias-pull-down;
 		};
 
-		/* msm otg HSUSB_VDDCX */
+		/* msm otg HSUSB_VDDCX and VDD_DIG */
 		pm8921_s3: s3 {
-			regulator-min-microvolt = <500000>;
+			regulator-min-microvolt = <950000>;
 			regulator-max-microvolt = <1150000>;
 			qcom,switch-mode-frequency = <4800000>;
 		};
@@ -299,6 +299,12 @@ pm8921_l23: l23 {
 			bias-pull-down;
 		};
 
+		/* VDD_MEM */
+		pm8921_l24: l24 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1150000>;
+		};
+
 		/*
 		 * tabla2x-slim-CDC_VDDA_A_1P2V
 		 * tabla2x-slim-VDDD_CDC_D
@@ -327,8 +333,12 @@ pm8921_lvs6: lvs6 {
 		/*
 		 * mipi_dsi.1-dsi1_vddio
 		 * pil_riva-pll_vdd
+		 * HFPLL regulator
 		 */
 		pm8921_lvs7: lvs7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-boot-on;
 			bias-pull-down;
 		};
 	};
-- 
2.39.2


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D03972B7B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 07:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236071AbjFLFk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 01:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236065AbjFLFj6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 01:39:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C0F173E
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 22:39:50 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f64fb05a8aso4535869e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 22:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686548380; x=1689140380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2COHoS0iCE7QlZQECIs2qMw+k4Ux9D95krl1smHPEhw=;
        b=vQtQ+YLvQaTeDMhfogpkzaIizdumMXgl+SwKny0ktMYFLMvzj5QzSSoHCBZgwdMhxe
         Pzg8JZjmdDDa28Mvp723hEtP41NXATAzox+CURgRFTRgRsTaaZDYKQ1rTC7soqgmJV7w
         ovKdjHvXwI1MQo/wxBQtIGI9juYnCPvDcJMrNP87DlwhuTbBkjJOrE6jabGUo6xf0aHI
         WDHFmJ+IrUMM7iNaMu7FFn/M86EnWnCQ1WG122UZdq01E2+8kUjLlhKa1c8veTDsCTnI
         VpdJD+merSWMi5vrJIpkegtGSWsJwc5RnGrkAwgHE35EGVbcqzzkAlqP+PAo4mjR02oc
         VeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548380; x=1689140380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2COHoS0iCE7QlZQECIs2qMw+k4Ux9D95krl1smHPEhw=;
        b=clGKljfLj7dKrxOhZhfhzD8gEVQsHUwc/4Q58vCoXhxiwXQ/aC3tC7LmN2tzsvAV4s
         AR+n74ZGyGf6Qg7n7kp4eKU2fdT4GYFHojVlpQuy6XYkAJI6ZAznJrdiUIos/8zBQtQi
         DfAXxzsK8rNOe7dn194DnLxJzYXzf5G+ZLZcl7CEsEJQPRJWTPo4hTOLgMj3p+2IenKM
         ZjM+XOxYc7Eqa3SLr3rlFkzgTP6LFAb+GfI0qJkl9b7y+M1XwhSGdkbEUjOqJo2uMo3V
         nqGpq/04TbgV4ZsxBrQPyYJU/IGOckqPFxhxP7QELEQehd+q/S3pLwoe+VSdMh3wPL/s
         7NJw==
X-Gm-Message-State: AC+VfDyEuetgaelRRhGFSGt6xjQ5Oz5BLoZrAEzjfUs15CnyzDJZttyq
        pn5vhuFwxyDL0Xa6yEAXK6YqMg==
X-Google-Smtp-Source: ACHHUZ7jZf3YWi3Bhcxzz1FPeGdaumoZrreHjOvXVIwrZeVhijRftpqHNrSzCPUKmYTkPYHQrW2K2A==
X-Received: by 2002:a05:6512:32b7:b0:4f4:e3fa:73d8 with SMTP id q23-20020a05651232b700b004f4e3fa73d8mr3408928lfe.62.1686548380316;
        Sun, 11 Jun 2023 22:39:40 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n6-20020a195506000000b004f38260f196sm1324125lfe.218.2023.06.11.22.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:39:39 -0700 (PDT)
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
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 17/18] ARM: dts: qcom: apq8064-asus-nexus7-flo: constraint cpufreq regulators
Date:   Mon, 12 Jun 2023 08:39:21 +0300
Message-Id: <20230612053922.3284394-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index c57c27cd8a20..9f5d72727356 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -218,9 +218,9 @@ s1 {
 			bias-pull-down;
 		};
 
-		/* msm otg HSUSB_VDDCX */
+		/* msm otg HSUSB_VDDCX and VDD_DIG */
 		s3 {
-			regulator-min-microvolt = <500000>;
+			regulator-min-microvolt = <950000>;
 			regulator-max-microvolt = <1150000>;
 			qcom,switch-mode-frequency = <4800000>;
 		};
@@ -301,6 +301,12 @@ l23 {
 			bias-pull-down;
 		};
 
+		/* VDD_MEM */
+		l24 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1150000>;
+		};
+
 		/*
 		 * tabla2x-slim-CDC_VDDA_A_1P2V
 		 * tabla2x-slim-VDDD_CDC_D
@@ -329,8 +335,12 @@ lvs6 {
 		/*
 		 * mipi_dsi.1-dsi1_vddio
 		 * pil_riva-pll_vdd
+		 * HFPLL regulator
 		 */
 		lvs7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-boot-on;
 			bias-pull-down;
 		};
 	};
-- 
2.39.2


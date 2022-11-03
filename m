Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB04617751
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 08:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbiKCHLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 03:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbiKCHKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 03:10:47 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42D0B7F7
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 00:10:35 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id h14so821644pjv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 00:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH8K/6eg5Lh08TfiTAW9SH/au0kXMjW1a4OsBDcVWqM=;
        b=ZrpmvktuoNhallTRgxhKQWglgv0B8LbAU1PTDwPFaf4kgpbfOwqNdrjuUyEYePAhmn
         v4ka3TNaMdkeY8ZVY2T2rQ0f8guNpPWfWma2a9Yvp85ab9hutZ6UK3cy7HUmFdgqOCfd
         GnKXbWoyhIecHnsbgAYaKyOxfc5gZfd8rk9quMhI4WpVKYLgV53MWkF+opti+4DIs2LD
         xlUsF7jtqt98uNmlEs9MrQUhTBg7WgBXzFR+yP0j8yfbq/TYfaCvo5wJl/I7SqYuE/0p
         92zAmBBlwYZYtT5WTc+4WwHUSjSJTho/+IY30WbkLUmdhQwzfPTtzMVjvrNqMJ7rPt/M
         GOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mH8K/6eg5Lh08TfiTAW9SH/au0kXMjW1a4OsBDcVWqM=;
        b=FXI9lA2D4aGLIP0KCFTyxhe9Ea5pCOydRdMgm9yY23n9S81O+Yr+FJCnVKynT6+5aE
         3k++FlXjXZilRi27OTQFKoKD/zL8hcGvtuvfEyzgqmuYX6rzErcgeDOKlKck51fSd5g7
         Ln834hTjtjUngUo1AlB/gYp9I56d24/7cTIovibA7epXWRcEIApqo3Ud6yUpJ1SscJ6t
         R2jOigWx7copBFbRjyFNtXL3f/032rZQJYoK0aS28sT4D6uhcj1pRCOLNm+pk1h6zQ4m
         i4cIlZCLAwKYISN8fTzKyHTljmXhXc5SAkE0SKAYKlR2Gs8k6lPQYG0+sDHfmPNZx33O
         oqgw==
X-Gm-Message-State: ACrzQf2C5Y79hN18aZzNLfUy/wHWpHc/lvZKtIi4Y3kj5nHf44kpIQhD
        N+wrOy8zxGzbLlnvirv4gfbn
X-Google-Smtp-Source: AMsMyM54CWyBk4TvLqKM0kCdmNpeBWyLDMlWh55Ntk+biSUah5rCsEOht738OFK0w9dK2KGfEeYZzA==
X-Received: by 2002:a17:903:2c2:b0:182:df88:e6d3 with SMTP id s2-20020a17090302c200b00182df88e6d3mr28273709plk.81.1667459435320;
        Thu, 03 Nov 2022 00:10:35 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id s9-20020a170903214900b00186748fe6ccsm9451244ple.214.2022.11.03.00.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:10:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 12/12] arm64: dts: qcom: sc8280xp-x13s: Add thermal zone support
Date:   Thu,  3 Nov 2022 12:39:11 +0530
Message-Id: <20221103070911.20019-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103070911.20019-1-manivannan.sadhasivam@linaro.org>
References: <20221103070911.20019-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add thermal zone support by making use of the thermistor SYS_THERM6.
Based on experiments, this thermistor seems to reflect the actual
surface temperature of the laptop.

For the cooling device, all BIG CPU cores are throttle down to keep the
temperature at a sane level.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index fdeb7718a596..7d2b53ceaa54 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -29,6 +29,52 @@ backlight {
 		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
 	};
 
+	thermal-zones {
+		skin-temp-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8280_adc_tm 5>;
+
+			trips {
+				skin_temp_alert0: trip-point0 {
+					temperature = <55000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin_temp_alert1: trip-point1 {
+					temperature = <58000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin-temp-crit {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&skin_temp_alert0>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&skin_temp_alert1>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	vreg_edp_bl: regulator-edp-bl {
 		compatible = "regulator-fixed";
 
-- 
2.25.1


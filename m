Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9864C582B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Feb 2022 21:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiBZUvQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 15:51:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiBZUvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 15:51:16 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E807262957
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:40 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id e8so12087912ljj.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5YSGyAyPF45kPZTOEBiFjB51m3jGTYQBjmE+p3kIZYw=;
        b=uQeX4q133YKohaCiUnKyFr4TSJ7jGHyby1zap2LNOkjZH3sRMxtVWFjKYtAl5sRJbn
         v+h3fv/L8nVdkLtArFESl9ztItt054L3wnG7I2I+eaWwemYZwgjZXzvMWN9iJRGRBDwJ
         kiytsn9vNUoRazEVTkAPSHO+wh11xk3IjvFRKZeekaa2VRw2zwJI4X2gPDKTnBsxXXXh
         8e2g/LozEgF6927whLSfGHTY6ho7PbA5LbzjAMWZX3Na52ZIdQYEnqPZ4MIMk5sdgQzp
         eZCuC7BReK6gnoYi+58LWl2+SaNRqm1pzuG2yzq8rkBpmnJz06qiirzM73z3XVVuwsIz
         Ckrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5YSGyAyPF45kPZTOEBiFjB51m3jGTYQBjmE+p3kIZYw=;
        b=zPyWr/VGnEZoMElkQ2dODpKSh0ZY2eXJ/pz1rDenpEiOnN0T1osx8ZORRBTwcRNv6Y
         6zUAkoE/5wBCKt8uHZF/EDeKXWwOQerFySA++6f24aXRO4CvwY0dnNtBuf8B0k5pSP+T
         K9DgV9Tppc5/FNvRNA+lYraFoURgV9KOuBCSNG1+SoAOrK9Z9w92A7IAa2ZvPDAF/rrQ
         FJGpAQuAV5P2sYlQB+9nfFiMURd0u/528bij2yCCgHSe527dkLB5NA4dKxjInqfBrbf+
         eAX7syPezfcpeV6yu7gG2MPVEvzRLRj7pi9rTnwCAlfPAcGZAkPQk41ddZDey4gn4HZK
         Maig==
X-Gm-Message-State: AOAM532y9qrbEEWNxUsnEQWmfYV6mtx0HCcgm/ZShO+BcVTGu/h0igQj
        yOzNBP/zTZEkVnx7HtsETBemRgpWtoyKzA==
X-Google-Smtp-Source: ABdhPJy8aCgRcDZc35d8Vy+tF/TT9W4JAPh4z5h+QW4D8lqoziyp69NAriolByHTgJ+VA1dHorEVvw==
X-Received: by 2002:a2e:80c6:0:b0:233:66cc:f565 with SMTP id r6-20020a2e80c6000000b0023366ccf565mr9864271ljg.236.1645908638875;
        Sat, 26 Feb 2022 12:50:38 -0800 (PST)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m27-20020ac24adb000000b004433bbaa3fdsm527162lfp.174.2022.02.26.12.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 12:50:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/7] arm64: dts: qcom: pmr735b: add temp sensor and thermal zone config
Date:   Sat, 26 Feb 2022 23:50:31 +0300
Message-Id: <20220226205035.1826360-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
References: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
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

Add temp-alarm device tree node and a default configuration for the
corresponding thermal zone for this PMIC. Temperatures are based on
downstream values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmr735b.dtsi | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmr735b.dtsi b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
index 1144086280f5..604324188603 100644
--- a/arch/arm64/boot/dts/qcom/pmr735b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
@@ -6,6 +6,30 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pmr735a_thermal: pmr735a-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmr735b_temp_alarm>;
+
+			trips {
+				pmr735b_trip0: trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pmr735b_crit: pmr735a-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmr735b: pmic@5 {
 		compatible = "qcom,pmr735b", "qcom,spmi-pmic";
@@ -13,6 +37,13 @@ pmr735b: pmic@5 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmr735b_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmr735b_gpios: gpio@8800 {
 			compatible = "qcom,pmr735b-gpio";
 			reg = <0x8800>;
-- 
2.30.2


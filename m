Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D94663D318
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 11:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235801AbiK3KTB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 05:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235649AbiK3KS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 05:18:57 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1234B1F4
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 02:18:55 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id gu23so21943823ejb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 02:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GBkrjGOYCG/vFk7NUYRuiiITSa0YV9dEfizXvTyQ5c=;
        b=pdPBNvLlKlDtPWOjpJRUycW5aZQg3dZVVaZPU14Wrc2kFzT8wYMrJuK+Hj/BoYu3Cy
         EnwHxhTdc+u3yAiBVcINepX6ZQFgKKgs7tTGClF/b/rAbUGIJaWnX7BOOD77pDy0dIi3
         DBvFcbk240FmgoeqAPLSaFGR5XZL+5oza6YQ0w3h+oUkvXNh5gF9DYyQCrdKZ8Si1u/1
         5KpMbmJ5HDhbGsyZWDKEZdr+0y5kaTAyiEXBCqINS8wJ8a4P0Njb+v+tDZS3rjuH6CfG
         aw7mkS7RTMUG9w7OftGVYmPlTwER7SEdy6zzzkwBVPxehYkzEch2tU93IDqafLBZovnT
         3G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GBkrjGOYCG/vFk7NUYRuiiITSa0YV9dEfizXvTyQ5c=;
        b=MBfljV/QdwQRnTvCOryqFJoQ3ueugxo0Ea82yJIA4W7b9AAbhtX9aFj2feA1TmOAi+
         GpKJn+JesDNGWrU3N/Nnse7l1w2lqgi+5Aw7ecILyeJtbWXcMjx9NNmD0f0efM/DeqRE
         QrGQw4Techam6afP2skdeT14biHAtKhaYaw+Y6+3SLz+9xfu5BXwuKzTR4W/HWOfuRo1
         Ykr+SMzbzCfuLWYApTFPXB6Uhb4WlCKYG1Asw6775R9G00xVv0svWPmEQEW4spU0JZQw
         h7ake/EYqXHs3fDmDJT9ZREOgRkbCE2BK19ka64nn+Vw4Qta+QyVsnglU/FcuaI/eoVo
         7j5w==
X-Gm-Message-State: ANoB5pliuYET5KplqxdRSIWIID0URe9i0zW8s8JDXp+zmcOP/HahFgZy
        Aqzl4zsMTr6AMa2+1aL81v/c9Q==
X-Google-Smtp-Source: AA0mqf7ZSYaNSfMVSwWCclYg+wCcZWI2Bmqi5n+PvlG4+QWMYMjlSidycqB+GZFWCY/AOWGS2AzqAA==
X-Received: by 2002:a17:907:213b:b0:7c0:999c:ac9b with SMTP id qo27-20020a170907213b00b007c0999cac9bmr2878253ejb.292.1669803534487;
        Wed, 30 Nov 2022 02:18:54 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l4-20020aa7c304000000b00458dc7e8ecasm449462edq.72.2022.11.30.02.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 02:18:53 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 06/10] arm64: dts: qcom: Add PM8550ve pmic dtsi
Date:   Wed, 30 Nov 2022 12:17:40 +0200
Message-Id: <20221130101744.2849294-7-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130101744.2849294-1-abel.vesa@linaro.org>
References: <20221130101744.2849294-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Neil Armstrong <neil.armstrong@linaro.org>

Add nodes for PM8550ve in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi | 59 ++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550ve.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
new file mode 100644
index 000000000000..c47646a467be
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm8550ve-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8550ve_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+
+&spmi_bus {
+	pm8550ve: pmic@5 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550ve_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550ve_gpios: gpio@8800 {
+			compatible = "qcom,pm8550ve-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550ve_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1


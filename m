Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785E76607DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 21:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236482AbjAFUL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 15:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236546AbjAFULP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 15:11:15 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B441B9C4
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 12:11:01 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso4135900wmb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 12:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiSyzj5bxhBZ228Fs3MQ7cHv3+MhOBcyO/fL/boI7rc=;
        b=fHb08uDC6Ug3VCSCacrHQK2KWXiwDV+BvsVKaMkFYw1twxLensKJOr1e3K0Gn5KV4u
         fJgR6wKvlfZLziYbuQOt8Oy8p0lpiISSHGm3q+RpTMLbZbLDBRxeoWtSMtp0z4w5Ch3t
         XppHJaUghhtv5AZtAclzG2jo5hxccyuqrM05t4X+9aibsOmznWT6AuARS7mTV1MLMHF1
         Bs8ukn5MgRfj+RS8fxNlnBr0XuOnLtEx//ZLUSKQIxp5IP3KgWrq9WsNWBLIu3iaDjQU
         ZvSPU2AQeAl9AeSCE1rch76vLxqN1iTWnftZ61+/dXGaoL7WNTyDE4YYVgjl4Etj4mhX
         UrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiSyzj5bxhBZ228Fs3MQ7cHv3+MhOBcyO/fL/boI7rc=;
        b=bVNLu1fWN9ntnNsYscR8vlaLkyvdPjserEAF+uuujpF8KuiHlSsXKhkrrYHm2bquu3
         JtN3IzUysj8LJDi2XxX29KyMzyxHWn2yGe3JgYdBjrqe7/m6chRElTw6HvA6YhWHWZGw
         0Icnps4TTCi9XNDAmGfItnh3hutaVzUnYPxJyDVEJlqPrP1vFNhqRE0ZGfE5i5Ui34I0
         kEuKJWU6jMbCqe9ZTGGJFIFR5WKgWC9mxCKiFnwSz/89FBaebTNqC0hb0rKcNv/c6inz
         5JpvRoDbB5OqpqNBzm72MPq1KGOgpznG1MH5Byb2bRfkZLvALgCWzvqbu0xJ3ZMtE0fE
         fNVA==
X-Gm-Message-State: AFqh2kq05Ay3OGKCYzIHR+98gRRtaZzBRMbTFA3ycRaSBTWvNWzAAtxL
        xDpNvMNqAwHmHaIjbaj4deLIrw==
X-Google-Smtp-Source: AMrXdXuw0ubelAcZKg/C9qczzJNj3aXdnFzwZGQKx99B8kT/nJlaqW1Os9SmqW41WmdgA8h1V1zW0Q==
X-Received: by 2002:a05:600c:4d20:b0:3d3:5737:3afb with SMTP id u32-20020a05600c4d2000b003d357373afbmr41322360wmp.41.1673035859585;
        Fri, 06 Jan 2023 12:10:59 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c220e00b003d99fad7511sm2665240wml.22.2023.01.06.12.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 12:10:59 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v9 04/10] arm64: dts: qcom: Add PM8550 pmic dtsi
Date:   Fri,  6 Jan 2023 22:10:41 +0200
Message-Id: <20230106201047.337409-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106201047.337409-1-abel.vesa@linaro.org>
References: <20230106201047.337409-1-abel.vesa@linaro.org>
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

Add nodes for PM8550 in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
new file mode 100644
index 000000000000..46396ec1a330
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
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
+		pm8550-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8550_temp_alarm>;
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
+	pm8550: pmic@1 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550_gpios: gpio@8800 {
+			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1


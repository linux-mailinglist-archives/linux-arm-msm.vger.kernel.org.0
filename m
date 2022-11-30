Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1183D63D31B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 11:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235791AbiK3KTE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 05:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235704AbiK3KS7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 05:18:59 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C161AD91
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 02:18:58 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id fy37so40088153ejc.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 02:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCy2ZKkP+o5zw4JnVQxbpcd6lL2PTAKfa9gdKzWsPa8=;
        b=tvxu/uu6V2sqcw+PhA6TkhZccxJfgBZ0cp8y29O7sXLoXDQPVVSlqSlzvlX1bPk5sw
         3tY2wyE7y7Svk4zKFPPqw6sSaOZtS5HaG4PrydiY+yRZaXZF9llxjAVuxaGimew/q/TO
         bITbcmtXHK9NBtuYpcCdTqduWwG5TVMKu+u/KwquIJ4PFmN7zc07DIl4BDzLjRHBaVX2
         hA9G5u6wMqK87WEdLgRPz76SGZXSKq+fIg34F47oW8CeInJ+L8/EOwoMq1U1JcysHm9Z
         5/CnI5BPxoV7DdTIloN7Wbd2kyJXJgFvDBSHvZT3ZhSaBGUJKZwJzXVuIFVL9Fj+kmKR
         Z+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCy2ZKkP+o5zw4JnVQxbpcd6lL2PTAKfa9gdKzWsPa8=;
        b=LpuQD/FYryDnc2/+QgzJafjlwn2s1czcBxdUJQYHm0igegRfYx4SRhRax+3ipw9D+L
         +eOsXWovdyb7hkLZK7TMkBKGmN9WhYi7tWcVEwH440OT4EcrfNYpS88RS9ZanCXbb0Io
         Zhl0uM2u2smoeP/+0Jrdkk8+p6FPhW6rz0nxn5iP0PRgg/pelQtlh4tvjuLlI7FekhbO
         jXnVsiMf+kCXsOpDla4mzdrme29LRdG6kYYkctBkpR7x+qH0VRtR0xsZHoNrAu5FiVMy
         d3osI8Z+QZQaAXPpFw0WiwjzRttHmHePn6/uEjGw1ZA4GTEtHrOjRPUs5dZ5f50BZyvj
         Vcew==
X-Gm-Message-State: ANoB5pnUi/YZuvq8iC8L448Hs73fFeolwiq9bkf4yY6ijdRgvIBt/mwj
        TnH/PgZ/mbUyZoJPtUGMf2Jdmg==
X-Google-Smtp-Source: AA0mqf4VQcGyqVAYS2TOceDihKJKQ+gU0qVCuW0tL/HtaSEEZDjPCtBGq98IbV0Yvs6pYmv5dLRBeQ==
X-Received: by 2002:a17:906:bcda:b0:7c0:80b0:7f67 with SMTP id lw26-20020a170906bcda00b007c080b07f67mr8320675ejb.462.1669803536940;
        Wed, 30 Nov 2022 02:18:56 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l4-20020aa7c304000000b00458dc7e8ecasm449462edq.72.2022.11.30.02.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 02:18:56 -0800 (PST)
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
Subject: [PATCH v4 08/10] arm64: dts: qcom: Add PMK8550 pmic dtsi
Date:   Wed, 30 Nov 2022 12:17:42 +0200
Message-Id: <20221130101744.2849294-9-abel.vesa@linaro.org>
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

Add nodes for PMK8550 in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 55 +++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8550.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
new file mode 100644
index 000000000000..47213d05bf92
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmk8550: pmic@0 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmk8550_pon: pon@1300 {
+			compatible = "qcom,pm8998-pon";
+			reg = <0x1300>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				status = "disabled";
+			};
+
+			pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
+				status = "disabled";
+			};
+		};
+
+		pmk8550_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+		};
+
+		pmk8550_gpios: gpio@8800 {
+			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
+			reg = <0xb800>;
+			gpio-controller;
+			gpio-ranges = <&pmk8550_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1


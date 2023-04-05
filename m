Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5439D6D829E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 17:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239192AbjDEPvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 11:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239132AbjDEPvL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 11:51:11 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B207281
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 08:51:02 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c9so36810247lfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680709861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Jq2avB28NPHNddAO0QR7tlYd/NjJsIY90TgGhkA/74=;
        b=XPgwlUHM18x/KrRkTMpXMslOgHHHIhLSovEDCYrXnK5+JX2o0TqWqrH+lm6NLFf9Gb
         GKJBLwe6rWefqV+fpoqdhldJ7ZwyY2Y+wFW3+rVTG4O+OMl3LSfcIrMEJ5XGxrSiP8ZW
         gJwvwQ6cI19pqubUhX4dlrNImaMjHnmBonadP+LpDwtj+9BKffAnbhQAx163wMjqpkOC
         MchevxkEnb1aKXY4Tn8c2J1MILRyszyC4htIGK1oVxWqQsQGZxpwQGIZv0gFP2hMvoou
         orF/X5EwxG90GY0Rg2UkcBrBjsIQAbHdk6fhOSh4fVG+Z42V2c/YEA9IRZhWMIiuE8Ng
         nt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Jq2avB28NPHNddAO0QR7tlYd/NjJsIY90TgGhkA/74=;
        b=WIzHv7alapco5+h5+4/GwEUeY8TuC2N8/AefgMW/m4rSPvnlxuG4ovDRFUnD3eD+qi
         NpBtZf6+ngAAe6KLSApEi1cKwcRH3qmcj71QW8eZshHp/GFDg4TQa4CPrTErBQwwYmqH
         zQkfbnTPyyxadh5oXljeVyCuvk74X1fYJxOMGMZeFlgCguH4Hb5dKKB8WvTuEP5nyLsU
         wtxNeJuEf7r3ZkBVeo5kStmcYB7iVZ982r7cPvHCEvafjpE5tDtpz8TnFZtti9NBc5m9
         X77N6fZq/jufG6FYJ3xlN47I/sao/AUKC5jn2OKnbr1YKQq8LOTgElOlDVa+ZL2jBaKM
         qBgQ==
X-Gm-Message-State: AAQBX9fuAPnzEB98oOhJd9lhPz1by10f/tQh9MVhYw9ZNrTcd72rNUNB
        yGfc/MfRGYUEDSr7Xt0drsBEkA4Z73WPzHV+uKQ=
X-Google-Smtp-Source: AKy350YOCVp0/gwgNozBafX6g1sEowVHwS+jvygNQT3B2+EpQ7RHHOduqZspWuG54cBXgHLjWVX//w==
X-Received: by 2002:a19:ae10:0:b0:4e9:afb3:d56a with SMTP id f16-20020a19ae10000000b004e9afb3d56amr1885235lfc.7.1680709860966;
        Wed, 05 Apr 2023 08:51:00 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id o28-20020ac2495c000000b004eb2db994e7sm2869344lfi.239.2023.04.05.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:51:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 05 Apr 2023 17:50:33 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: Add initial PM2250 device tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-topic-rb1_qcm-v2-4-dae06f8830dc@linaro.org>
References: <20230403-topic-rb1_qcm-v2-0-dae06f8830dc@linaro.org>
In-Reply-To: <20230403-topic-rb1_qcm-v2-0-dae06f8830dc@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680709854; l=2091;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XmYfveQ8qrj0CLWV3Vu/9OMSY6RU4NB/qR/vQb3iO3s=;
 b=cR6VOomLQzZGKc6BgTbCdvKPXWiONH+/uNHL6VACgn/+XF2iFq2QOCVRhIib6rje6FFcLTWbhgaa
 PPWAcf/2CCvUA24LuC1Yt8WSe7AiGl+mhIDSrFXmwj1yYED0k10u
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce an initial device tree for the PM2250 (sometimes known as
PM4125) PMIC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm2250.dtsi | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm2250.dtsi b/arch/arm64/boot/dts/qcom/pm2250.dtsi
new file mode 100644
index 000000000000..5f1d15db5c99
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm2250.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2023, Linaro Ltd
+ */
+
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmic@0 {
+		compatible = "qcom,pm2250", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pon@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x800>;
+
+			pm2250_pwrkey: pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+				bias-pull-up;
+			};
+
+			pm2250_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				status = "disabled";
+			};
+		};
+
+		rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000>, <0x6100>;
+			reg-names = "rtc", "alarm";
+			interrupts-extended = <&spmi_bus 0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pm2250_gpios: gpio@c000 {
+			compatible = "qcom,pm2250-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pm2250_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmic@1 {
+		compatible = "qcom,pm2250", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};

-- 
2.40.0


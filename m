Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD34D1EDA11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 02:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbgFDAnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 20:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbgFDAnf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 20:43:35 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071B7C03E96D
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 17:43:35 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so5075417ljc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 17:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cRs2X+oeKdHfeX7eb6eCjnPnFevRST0za6Vh4RscaYk=;
        b=F61Eg71tZo7yLrSch48uDBf0KGXE71dR3HqNioWJV55S47JVRdokkrYs80rBGWti5/
         XEV1n92aHxZsHxfcwi32EyGaIXmtYgacwjIGmqmIzrMif3TSuH31NEOL8GClMmPwj8Bf
         9XTRws7vdUclGUMSMgL2sxdjno7P9KhvriiO0nDn3BVQZj/lwM2+ctlcKOMcSZ610PAG
         OBbnqFVftCDzTnIt6JtDFtS88DzYhVpvPorl3aKDfzGHssRxOfaH/k9tlT6spSHqFfnj
         wdIX2n8W2d4WxgAHcV28FMC9Fx3MnxDVtdBu9G+QUyNbQA+RmLu1PhTcw+y36vz/kFqJ
         ndEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cRs2X+oeKdHfeX7eb6eCjnPnFevRST0za6Vh4RscaYk=;
        b=OLbafUCAy5CL3WMstmy119kbTXin6dc36xh50oyoZpygEstcNCbAq/lYmXGurzNm8/
         GotHZTVF2f7DNHkZkXX1nvG1hsWCdwbhoQEP8br0JKferC1P24BQG/4FBxY85AvR3ZpD
         LODoWTi5CfmjwTYM3b0bRUVoO62C6CcfZqyjTxesBpTRO1iVBNRpjHB33X5IyqwKk1rQ
         Qw+R+qwYZDZ7irt4FWlGrf1TytmLELi9j490jaKz3tQovO7UB+5S9EN3VtQvlJ4Vrc45
         epjrBhtEBzlFQEfmHUujTafCHpNQNCp1y9xUZ/IROiUBEb9s9dtz1P6SiXnG8shb1Wsh
         rhKA==
X-Gm-Message-State: AOAM530IL1vjxYXxyX+9WWza5OlGNSzaP2cVTSFHRi3A2RwZT9UdpqNl
        jq3oWMtEGZaa/HD3kbZIrH662IeTC+E=
X-Google-Smtp-Source: ABdhPJxKJLWg8HQ02rdlWfobnc/UXxVw60sSX6mDM4NyyI2j3u4EiXaSOG8SVYMOqXoJMYQ9gnhVnQ==
X-Received: by 2002:a2e:9783:: with SMTP id y3mr733957lji.457.1591231413382;
        Wed, 03 Jun 2020 17:43:33 -0700 (PDT)
Received: from eriador.lan ([188.162.64.226])
        by smtp.gmail.com with ESMTPSA id t16sm858527ljj.57.2020.06.03.17.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:43:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 1/7] arm64: dts: qcom: pm8009: Add base dts file
Date:   Thu,  4 Jun 2020 03:43:25 +0300
Message-Id: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for pm8009 along with GPIOs and power-on nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8009.dtsi | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8009.dtsi b/arch/arm64/boot/dts/qcom/pm8009.dtsi
new file mode 100644
index 000000000000..9f3e19b5bd00
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8009.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2019, Linaro Limited
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+
+&spmi_bus {
+	pmic@a {
+		compatible = "qcom,pm8009", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		power-on@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x0800>;
+		};
+
+		pm8009_gpios: gpio@c000 {
+			compatible = "qcom,pm8005-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmic@b {
+		compatible = "qcom,pm8009", "qcom,spmi-pmic";
+		reg = <0xb SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.26.2


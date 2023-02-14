Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7840695FE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 10:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbjBNJzN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 04:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjBNJyv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 04:54:51 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687E2241E5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:54:46 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id hx15so38594057ejc.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojz/IndadzvCh/MxBOcdddWP2Cz3VxxnwtTNlpFnCXE=;
        b=w2V6QzHcVqzF2wUIpdMO09Z2XGoYsyl0FM9aS96R0HywOimqrhl7w6q9vMefbhDsGT
         L8YKL2Nh+2plQ9p6wjduMlSwsMC88dH8JFB9AdcD4y6XIo0LsEOdwm1LDYornK41kKam
         GCMaKCuvIE+lWzGNlRhEf0c8yZt/uStZtNaIRBkFGVCLcoh+BK/pQr4ZfSO3ajbug6zd
         aG2xjYchretIafCeup7GRu7hA60nUGaFTV/H0mqSUP7AG7xLFNOkOTrK5UxFq2XWR1YA
         SPbAE6YAhpWHr4/F5Xf2FfpigwwF8O6IN+G8JDHXtpMmVo4+xwgTYgfIYZ9zm+Txkifr
         6haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojz/IndadzvCh/MxBOcdddWP2Cz3VxxnwtTNlpFnCXE=;
        b=iU77aXPthqzwqFz7qA51/qD8avDnnrwkE4/BuMoLerLPfg/AjHNNMUh3RCjLvttv51
         PGWrMVzuKHSNRSmB/WUAXOlrjyyN6QOHEDieAHByfgzun80cwOW8v84eE7yxReaF5JQm
         YHCRP8uvkcD4Jtw5QYhGG+9AjfmmrLVHmdQd0P6+MM8mnem7d0llgK3rJyqQr1Vtc21u
         Kjc5hnjYAxd7hXg4ANfo7yy5h4xAj9kYvmn62bVp9p6MfQFeMp8a/uIhrINSJ3/Cieq1
         qQ/eNVDTZebOC2jrCjQpwyQ07nr/HODMxKnLDDasjeOixxMzlaHufS3GDFzc6zWu65B1
         Pm7w==
X-Gm-Message-State: AO0yUKW+gkohTurE/F+zPEIr+RuHKr/YFF1Vm6Cyd7mWF2H4WTXxqMVM
        7rPpc8Z+d9LjHFnr87UwqgNg9Op0gM7i3MYY
X-Google-Smtp-Source: AK7set8mpohsjeaKxqj4KMhcHHNLeFkltVfpeElHNuNkPLK8QwrwaqfgyXY0YmKQewBzicTqLRwHAg==
X-Received: by 2002:a17:906:3019:b0:8b1:2fbe:7d6b with SMTP id 25-20020a170906301900b008b12fbe7d6bmr1581981ejz.73.1676368484734;
        Tue, 14 Feb 2023 01:54:44 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906038c00b0088f464ac276sm7936172eja.30.2023.02.14.01.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 01:54:44 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: Split out SA8155P and use correct RPMh power domains
Date:   Tue, 14 Feb 2023 10:54:35 +0100
Message-Id: <20230214095435.2192153-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214095435.2192153-1-konrad.dybcio@linaro.org>
References: <20230214095435.2192153-1-konrad.dybcio@linaro.org>
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

The RPMhPD setup on SA8155P is different compared to SM8150. Correct
it to ensure the platform will not try accessing forbidden/missing
RPMh entries at boot, as a bad vote will hang the machine.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts |  2 +-
 arch/arm64/boot/dts/qcom/sa8155p.dtsi    | 51 ++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8155p.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 459384ec8f23..9454e8e4e517 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -7,7 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/gpio/gpio.h>
-#include "sm8150.dtsi"
+#include "sa8155p.dtsi"
 #include "pmm8155au_1.dtsi"
 #include "pmm8155au_2.dtsi"
 
diff --git a/arch/arm64/boot/dts/qcom/sa8155p.dtsi b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
new file mode 100644
index 000000000000..f2fd7c28764e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ *
+ * SA8155P is an automotive variant of SM8150, with some minor changes.
+ * Most notably, the RPMhPD setup differs: MMCX and LCX/LMX rails are gone.
+ */
+
+#include "sm8150.dtsi"
+
+&dispcc {
+	power-domains = <&rpmhpd SA8155P_CX>;
+};
+
+&mdss_mdp {
+	power-domains = <&rpmhpd SA8155P_CX>;
+};
+
+&mdss_dsi0 {
+	power-domains = <&rpmhpd SA8155P_CX>;
+};
+
+&mdss_dsi1 {
+	power-domains = <&rpmhpd SA8155P_CX>;
+};
+
+&remoteproc_adsp {
+	power-domains = <&rpmhpd SA8155P_CX>;
+};
+
+&remoteproc_cdsp {
+	power-domains = <&rpmhpd SA8155P_CX>;
+};
+
+&remoteproc_mpss {
+	power-domains = <&rpmhpd SA8155P_CX>,
+			<&rpmhpd SA8155P_MSS>;
+};
+
+&remoteproc_slpi {
+	power-domains = <&rpmhpd SA8155P_CX>,
+			<&rpmhpd SA8155P_MX>;
+};
+
+&rpmhpd {
+	compatible = "qcom,sa8155p-rpmhpd";
+};
+
+&sdhc_2 {
+	power-domains = <&rpmhpd SA8155P_CX>;
+};
-- 
2.39.1


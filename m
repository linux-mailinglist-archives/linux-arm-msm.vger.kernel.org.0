Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D63DC789E24
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 15:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbjH0N0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 09:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjH0NZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 09:25:41 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392F01BF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 06:25:35 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bcb89b4767so35817201fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 06:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142733; x=1693747533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8FEcjdA8iNcOHwEq2cMCs8CLCGe5ZixaPNnhBx5vqg=;
        b=D0wSjRo0WEkCplMs7ChbpvuBcEy7z5VVeOyGrb4Ib8IEseszHswTvGRjMaAAxNM/ee
         CAhQDoE870ZzV+lRWjB67djxrIg+Oj59I7de9RugPdSbfeyRsB8aXYGOT5U0faoCSueU
         x6LIMfZed4gM6+BUGj9AmI6z+ONMaM33leSD3qKyK8tMCYDeCk0W45pKREMLbWf51RGH
         BwRgTn3BjPlaTqpwc7pIdv8/QxYAi2JDjCDQqczZtNe/UNrXT3QquDOXlVPuWQ97mSzc
         T2OvB/1HjU45d6E1q52ITlFV7WfhMA/oBpDKL1VuDkaAXInYcEk+XhCSChOdumzrdSyQ
         XgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142733; x=1693747533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8FEcjdA8iNcOHwEq2cMCs8CLCGe5ZixaPNnhBx5vqg=;
        b=b24oIbAKVb+3zMBkz9AV6L0orhhplSUv2Eww3rZFrV0ZZqOnldE5zQJtbMyc3ONGik
         l9sRseeqTE4huzLAAB+wtqOfHUtstYkBWv1dXSfzO4Zh/cusAemNerO2nqXVwOsTU0zK
         qYEV9tdv3LQtQT/q0sb6afunQmgP1GQABCvUJk5SE5buGEEeGVtfK8VL0NGgBwkwMVuM
         4DfvaJcR80qhWRm8uinXqkdCbHjrUVihBp6OFpZSswAJeZlCEPSmLWOz+1F5WZCGX4Fq
         XQvq2u5WwM5TeRbyiDk+BsJ16RKDgDu0kLtgIdgPWEA/OfGtsRgf0zuRJD+F4hOlwqOd
         ZIqA==
X-Gm-Message-State: AOJu0Ywjzpn4sCxmpipCKzR5zN7gvQQaqPTM/a9ArSYdw0xH7+PIHZ4L
        gvOY44A2y5ZHTPeGjofmjCj3Vg==
X-Google-Smtp-Source: AGHT+IFUBThlZ7IfAEL8mskNm9bVraHz61joi7YhitR60Fc7NjeIzZ5BLItJRR4jTXzbjlGVPfMQoQ==
X-Received: by 2002:a05:6512:1312:b0:500:a008:a4c5 with SMTP id x18-20020a056512131200b00500a008a4c5mr8051316lfu.59.1693142733505;
        Sun, 27 Aug 2023 06:25:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v5 08/37] ARM: dts: qcom: strip prefix from PMIC files
Date:   Sun, 27 Aug 2023 16:24:56 +0300
Message-Id: <20230827132525.951475-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the vendor DTS files were moved to per-vendor subdirs, there no need
to use common prefixes. Drop the `qcom-' prefix from PMIC dtsi file.
This makes 32-bit qcom/ dts files closer to arm64 ones.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/{qcom-pm8226.dtsi => pm8226.dtsi}      | 0
 arch/arm/boot/dts/qcom/{qcom-pm8841.dtsi => pm8841.dtsi}      | 0
 arch/arm/boot/dts/qcom/{qcom-pm8941.dtsi => pm8941.dtsi}      | 0
 arch/arm/boot/dts/qcom/{qcom-pma8084.dtsi => pma8084.dtsi}    | 0
 arch/arm/boot/dts/qcom/{qcom-pmx55.dtsi => pmx55.dtsi}        | 0
 arch/arm/boot/dts/qcom/{qcom-pmx65.dtsi => pmx65.dtsi}        | 0
 arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts          | 2 +-
 arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts       | 2 +-
 arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts              | 2 +-
 arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts  | 2 +-
 arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts           | 4 ++--
 arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts               | 2 +-
 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts                   | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 4 ++--
 arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi    | 4 ++--
 arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts      | 4 ++--
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts      | 4 ++--
 arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts       | 2 +-
 .../dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts   | 4 ++--
 arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dts                     | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts                     | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts         | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts                     | 2 +-
 23 files changed, 23 insertions(+), 23 deletions(-)
 rename arch/arm/boot/dts/qcom/{qcom-pm8226.dtsi => pm8226.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pm8841.dtsi => pm8841.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pm8941.dtsi => pm8941.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pma8084.dtsi => pma8084.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pmx55.dtsi => pmx55.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pmx65.dtsi => pmx65.dtsi} (100%)

diff --git a/arch/arm/boot/dts/qcom/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom/pm8226.dtsi
similarity index 100%
rename from arch/arm/boot/dts/qcom/qcom-pm8226.dtsi
rename to arch/arm/boot/dts/qcom/pm8226.dtsi
diff --git a/arch/arm/boot/dts/qcom/qcom-pm8841.dtsi b/arch/arm/boot/dts/qcom/pm8841.dtsi
similarity index 100%
rename from arch/arm/boot/dts/qcom/qcom-pm8841.dtsi
rename to arch/arm/boot/dts/qcom/pm8841.dtsi
diff --git a/arch/arm/boot/dts/qcom/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom/pm8941.dtsi
similarity index 100%
rename from arch/arm/boot/dts/qcom/qcom-pm8941.dtsi
rename to arch/arm/boot/dts/qcom/pm8941.dtsi
diff --git a/arch/arm/boot/dts/qcom/qcom-pma8084.dtsi b/arch/arm/boot/dts/qcom/pma8084.dtsi
similarity index 100%
rename from arch/arm/boot/dts/qcom/qcom-pma8084.dtsi
rename to arch/arm/boot/dts/qcom/pma8084.dtsi
diff --git a/arch/arm/boot/dts/qcom/qcom-pmx55.dtsi b/arch/arm/boot/dts/qcom/pmx55.dtsi
similarity index 100%
rename from arch/arm/boot/dts/qcom/qcom-pmx55.dtsi
rename to arch/arm/boot/dts/qcom/pmx55.dtsi
diff --git a/arch/arm/boot/dts/qcom/qcom-pmx65.dtsi b/arch/arm/boot/dts/qcom/pmx65.dtsi
similarity index 100%
rename from arch/arm/boot/dts/qcom/qcom-pmx65.dtsi
rename to arch/arm/boot/dts/qcom/pmx65.dtsi
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
index aa0e0e8d2a97..a39f5a161b03 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
@@ -6,7 +6,7 @@
 /dts-v1/;
 
 #include "qcom-msm8226.dtsi"
-#include "qcom-pm8226.dtsi"
+#include "pm8226.dtsi"
 
 /delete-node/ &adsp_region;
 
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
index de19640efe55..59b218042d32 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
@@ -6,7 +6,7 @@
 /dts-v1/;
 
 #include "qcom-msm8226.dtsi"
-#include "qcom-pm8226.dtsi"
+#include "pm8226.dtsi"
 #include <dt-bindings/input/ti-drv260x.h>
 
 /delete-node/ &adsp_region;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
index b887e5361ec3..feb78afef3a6 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
@@ -6,7 +6,7 @@
 /dts-v1/;
 
 #include "qcom-msm8226.dtsi"
-#include "qcom-pm8226.dtsi"
+#include "pm8226.dtsi"
 
 /delete-node/ &adsp_region;
 
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
index 884d99297d4c..42d3867dca42 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
@@ -7,7 +7,7 @@
 
 #include <dt-bindings/input/input.h>
 #include "qcom-msm8226.dtsi"
-#include "qcom-pm8226.dtsi"
+#include "pm8226.dtsi"
 
 /delete-node/ &adsp_region;
 /delete-node/ &smem_region;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
index 6d1b2439ae3a..950fa652f985 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
@@ -4,8 +4,8 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "qcom-msm8974.dtsi"
-#include "qcom-pm8841.dtsi"
-#include "qcom-pm8941.dtsi"
+#include "pm8841.dtsi"
+#include "pm8941.dtsi"
 
 /delete-node/ &mpss_region;
 
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts b/arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts
index 116e59a3b76d..1df24c922be9 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-apq8084.dtsi"
-#include "qcom-pma8084.dtsi"
+#include "pma8084.dtsi"
 
 / {
 	model = "Qualcomm APQ8084/IFC6540";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts b/arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts
index c6b6680248a6..d4e6aee034af 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-apq8084.dtsi"
-#include "qcom-pma8084.dtsi"
+#include "pma8084.dtsi"
 
 / {
 	model = "Qualcomm APQ 8084-MTP";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index 60bdfddeae69..da99f770d4f5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-msm8974.dtsi"
-#include "qcom-pm8841.dtsi"
-#include "qcom-pm8941.dtsi"
+#include "pm8841.dtsi"
+#include "pm8941.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index 68a2f9094e53..23ae474698aa 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-msm8974.dtsi"
-#include "qcom-pm8841.dtsi"
-#include "qcom-pm8941.dtsi"
+#include "pm8841.dtsi"
+#include "pm8941.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
index 42d253b75dad..6c4153689b39 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-msm8974pro.dtsi"
-#include "qcom-pm8841.dtsi"
-#include "qcom-pm8941.dtsi"
+#include "pm8841.dtsi"
+#include "pm8941.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 8230d0e1d95d..c0ca264d8140 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-msm8974pro.dtsi"
-#include "qcom-pm8841.dtsi"
-#include "qcom-pm8941.dtsi"
+#include "pm8841.dtsi"
+#include "pm8941.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
index 3e2c86591ee2..325feb89b343 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-msm8974pro.dtsi"
-#include "qcom-pma8084.dtsi"
+#include "pma8084.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/leds/common.h>
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 11468d1409f7..0798cce3dbea 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-msm8974pro.dtsi"
-#include "qcom-pm8841.dtsi"
-#include "qcom-pm8941.dtsi"
+#include "pm8841.dtsi"
+#include "pm8941.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dts
index 7e97ad5803d8..247069361909 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dts
@@ -9,7 +9,7 @@
 #include "qcom-sdx55.dtsi"
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <arm64/qcom/pm8150b.dtsi>
-#include "qcom-pmx55.dtsi"
+#include "pmx55.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SDX55 MTP";
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index 51058b065279..082f7ed1a01f 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -8,7 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "qcom-sdx55.dtsi"
-#include "qcom-pmx55.dtsi"
+#include "pmx55.dtsi"
 
 / {
 	model = "Thundercomm T55 Development Kit";
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts
index 8fadc6e70692..e336a15b45c4 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts
@@ -8,7 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "qcom-sdx55.dtsi"
-#include "qcom-pmx55.dtsi"
+#include "pmx55.dtsi"
 
 / {
 	model = "Telit FN980 TLB";
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
index fcf1c51c5e7a..b87c5434cc29 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
@@ -8,7 +8,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <arm64/qcom/pmk8350.dtsi>
 #include <arm64/qcom/pm7250b.dtsi>
-#include "qcom-pmx65.dtsi"
+#include "pmx65.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SDX65 MTP";
-- 
2.39.2


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F26D461F6DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 15:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbiKGO4s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 09:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232588AbiKGOz7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 09:55:59 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E71E1EAF6
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 06:55:49 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ud5so30846224ejc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 06:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peqPpYnFW7+Rs7hp6IjDSHQLEWZVXzlWBaLlmgyChsw=;
        b=ENl+0sMBWJDwghJlAvMwZ0dXyBV4ryg5WKWcBFWbCrqfVwppnlvTwjMVH6A6HZrRIn
         +zVU7xw/XRHcUXqaDGAjneADIjlEIRIwWgBv173zAUU3IQjhRlBP6LkXQ3rtwv0gGbmS
         +CCtzoe3mVeyTonbzKL0brob2ha75lGxGTAOX4CqdPizYG/mcjbv52uweVfsiTW/KfZ8
         CJo0Vcto/t8IXphtqr+kUdzG2oxR2RqIbf/gei77bh1F7+f7RThd2mPQZPlIZsVvSMDC
         6hxn+HXgC+vCDRFQxn2UpYgY23AHk7UN4K8qNufFGVvLruPSuXCuSMO4vsO4/oHY8OiR
         q+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peqPpYnFW7+Rs7hp6IjDSHQLEWZVXzlWBaLlmgyChsw=;
        b=pyZT7QMSobAM33wvbbyf+XLIDdtoVJscTbDcoL+ritoYQxptaB2gmu5DoV5tVsBPii
         9aFGV9AvM84Z965xt9jpBJBx5wAomIsu9uc+bcfSTcu/SL7pH4AoPd2fv/3gnyrFlV2n
         T95d7rZRrh7EPWy4V1WggcvAR7DJh+Rx9MQa/7guj7KWCGFpqrROIGeztmhjobhw/Ini
         XBpbKbOSC1Vw6M6MqIQhqWdHoQjEHfQlUL77eESYvlsCs+zPDBQVb2GhGc/fr+eCN9Hc
         qlqKQHzKp1G92jInY9q5AgFdG7d6LnZtED6UrCYYKoxvHOFaVig05Nwf7tpPNUrY1D0T
         YrCg==
X-Gm-Message-State: ACrzQf0ZX9UxdDqRcJ8LMwcZWoglkYaIY1VR2isV2lwyO+OUlGt7L5i6
        o346o+Dw6JQZYwF6PGpbrHRcbUiseEE/CEeu
X-Google-Smtp-Source: AMsMyM66C/1QFJJogExu4sjkMOFFjaOHk1fPGc/+kITliG600LvmvyGoz6erYps1uhRBOKPaJZ8j6w==
X-Received: by 2002:a17:906:7c52:b0:7ad:c9e5:3ecc with SMTP id g18-20020a1709067c5200b007adc9e53eccmr42070771ejp.73.1667832948819;
        Mon, 07 Nov 2022 06:55:48 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id d1-20020a1709067f0100b0078907275a44sm3503049ejr.42.2022.11.07.06.55.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 06:55:48 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] arm64: dts: qcom: pm6150/l/pm7325/pms405: Fix up comments
Date:   Mon,  7 Nov 2022 15:55:21 +0100
Message-Id: <20221107145522.6706-12-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221107145522.6706-1-konrad.dybcio@linaro.org>
References: <20221107145522.6706-1-konrad.dybcio@linaro.org>
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

Make sure all multiline C-style commends begin with just '/*' with
the comment text starting on a new line.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm6150.dtsi  | 4 +++-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi | 4 +++-
 arch/arm64/boot/dts/qcom/pm7325.dtsi  | 4 +++-
 arch/arm64/boot/dts/qcom/pms405.dtsi  | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
index 3cfd3eadccbf..3d91fb405ca2 100644
--- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause
-// Copyright (c) 2019, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
 
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/input/linux-event-codes.h>
diff --git a/arch/arm64/boot/dts/qcom/pm6150l.dtsi b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
index 8a7c18b134c7..bab2e22835df 100644
--- a/arch/arm64/boot/dts/qcom/pm6150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause
-// Copyright (c) 2019, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
 
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi b/arch/arm64/boot/dts/qcom/pm7325.dtsi
index cfd4b80c6e35..d1c5476af5ee 100644
--- a/arch/arm64/boot/dts/qcom/pm7325.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause
-// Copyright (c) 2021, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index 634b0681d04c..ffe9e33808d0 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2018, Linaro Limited
+/*
+ * Copyright (c) 2018, Linaro Limited
+ */
 
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/input/linux-event-codes.h>
-- 
2.38.1


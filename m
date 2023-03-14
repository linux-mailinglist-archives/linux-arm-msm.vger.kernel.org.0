Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6251F6B9E72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 19:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjCNSbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 14:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjCNSbL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 14:31:11 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A2F8A6B
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 11:31:00 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so3930417wmb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678818658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zlKvK/qoHQY6rAwjMUbU+tla4aUvklVHkaE62d6X1o=;
        b=mAHZfWoHife7osWAwNO1qjf1eVt4tln5Im6PldiMduGLQ+6yF8xbQVPRGTryokoOYM
         tyDwJvmRrXHKoKmwlLwSuebsVS+SiMCR6np98xw+xyNTllnVxqC5UQRFyLUebAzXVce7
         ftS8+C6Qc4XlIC+UOSIMV/6ek8IRbrSpx/BV+pzaLj6mcxHLQyzUndX8C0HLljUFEdJr
         Pq3g2TmdV8zdbH3GH6BOZEAEX/kZPvPN7vYmX5Rv4MRt1Q7RJcFNValYkbMd4XjXpdRc
         VvbqwxhkfvVMpw9A5pkufi6nZpqVKa9DOVCXVosNh7DKyOOthkbe9cRUDWJd7TEMyqQz
         OGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zlKvK/qoHQY6rAwjMUbU+tla4aUvklVHkaE62d6X1o=;
        b=oTdBVWQ8pk4jQU/2A/iv1nhPUDOTxWCMcO/9PwvVAufVwxh/1nnE+XQVwPzqP83XuJ
         GRTIQAuKwvw2cet0xheNU60oO1v7sPMhR6SC9c6/8Qf6G44lKvzdiERLyQvicjIGrF5A
         n3+YR9PDcOxtfqOBTRl5zqlok4zoQRlIWIRDjkeB18N7fouCHZKUazcrmHYLzYLhwI5z
         M9QDDrFzpyWiIyDv2CznGAfH8VB5JHXGnUXA1LJE/h6KJGE+Y0Zra2MBSO+w7k+47aei
         f+P0euK9mheD4JU13NIVYOVDPOhCy5JG5aOCTFwSqvmsg3fkuqs9qJXiLQ4LFBVBe0e8
         kJow==
X-Gm-Message-State: AO0yUKUZnDcGyZjSHgLxaq1Zws1RheyKSSVTos6i8jX7hfBBFfmQG74a
        mq0TkIS8aaW4TQFUSPcbz3xgPw==
X-Google-Smtp-Source: AK7set+2HKkrVGqrTNUg3TAyDMmaIna5LmlK6gJkuIUP2bD5/Hv/QjF56Ha499VKZ5CBqQUCZ2vzgQ==
X-Received: by 2002:a05:600c:358a:b0:3e1:e149:b67b with SMTP id p10-20020a05600c358a00b003e1e149b67bmr3037171wmq.18.1678818658568;
        Tue, 14 Mar 2023 11:30:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fd14:bd52:b53b:d94c])
        by smtp.gmail.com with ESMTPSA id k28-20020a05600c1c9c00b003e209b45f6bsm4083938wms.29.2023.03.14.11.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:30:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 05/14] arm64: dts: qcom: sa8775p: add support for the on-board PMICs
Date:   Tue, 14 Mar 2023 19:30:34 +0100
Message-Id: <20230314183043.619997-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314183043.619997-1-brgl@bgdev.pl>
References: <20230314183043.619997-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new .dtsi file for sa8775p PMICs and add the four PMICs interfaced
to the SoC via SPMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
new file mode 100644
index 000000000000..77e2515a7ab9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmk8775_0: pmic@0 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	pmk8775_1: pmic@2 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	pmk8775_2: pmic@4 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	pmk8775_3: pmic@6 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.37.2


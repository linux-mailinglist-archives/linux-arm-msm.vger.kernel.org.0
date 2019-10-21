Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55E13DE9CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfJUKgs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:36:48 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32800 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbfJUKgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:36:19 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so8193202pfl.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=QjsxaA91mEwEtCjMqajdkCWO8TyKKmvK1rye+wLjlGg=;
        b=m844zhngeP6JmRlLw3Q9yAiYZVqDDiNowu3C0CL8lrG5BXKUahbeMsaww7iO0ty/za
         fdtGtKxaLgoykDPHWOWk5i6kx0Sh3TN/NUb3L/ijSG3akcBVehElk9CQm8G9cyQyd3N/
         r4BKGlQMdEACKR37SKoqApGxIeMST/1CDK/9ExvDKbPmWac8ZF8McT89JAxGLj7cDFYC
         /XZ5t6W5H7MsMzAASJRW4uZVR4XALG2ulxlNsaUiRdr8UUD0okq0fcUctBMQk/b/N1nC
         LjvBmWHEXbXx5EvaRbbsjeM5mTYO1VUyNPA2sdiF8G5iaVTOF1plngFLm6+jd6qXYTy6
         AEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=QjsxaA91mEwEtCjMqajdkCWO8TyKKmvK1rye+wLjlGg=;
        b=W905CNSXukG0T/RiHsUldS98FSRiFxKZi7VdlQDDmjKRZb4jkVXN4WaHMHzdS37riA
         2wowlUrHc3osf0Lb4QmnpWwzULk8a0rupE43tr1NsJXK+X/0TAqf8ak3vvqUxwYF5R7X
         uHdTjm42V/oT+HE5sJYewr+T3k8nWKxD2C02XsvKxCj0atLP8cqZhZbyQZxQCRSmxv6n
         sHHVSDD3ns8onofKyWiQNLwDj4N8gsmTTbV+m5Zxs0NOcoc1vHx4aFcCcJtk3mI6GVeW
         cZ6ep2YK06MUIatyCyF8HeeJqjVP56wsdz9tJXKwa+FzKHTygpLNbCpIF8lmz5j2Bjvb
         skrg==
X-Gm-Message-State: APjAAAXOxtBNQVdAO/OldUupwV86luqWINjEltasGX5MMQrQzYzOTuhp
        8YzNYaM13qdSLkjuRZYFSqHRHg==
X-Google-Smtp-Source: APXvYqy3A8C9r4CuE6DrW3r1dKAtN3bno4gt1UEh08PPn6ctTudHq+Irk12K+SPNnG1bjix7ZB6FyA==
X-Received: by 2002:a63:82:: with SMTP id 124mr26253814pga.112.1571654178595;
        Mon, 21 Oct 2019 03:36:18 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id q143sm15543184pfq.103.2019.10.21.03.36.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:36:17 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v6 10/15] arm64: dts: msm8998: thermal: Add interrupt support
Date:   Mon, 21 Oct 2019 16:05:29 +0530
Message-Id: <2735b57bb1e9477926bfef6f6b8ff84b926f5a1b.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c6f81431983ee..489d631a96104 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -816,8 +816,9 @@
 			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
 			reg = <0x010ab000 0x1000>, /* TM */
 			      <0x010aa000 0x1000>; /* SROT */
-
 			#qcom,sensors = <14>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -825,8 +826,9 @@
 			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
 			reg = <0x010ae000 0x1000>, /* TM */
 			      <0x010ad000 0x1000>; /* SROT */
-
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1


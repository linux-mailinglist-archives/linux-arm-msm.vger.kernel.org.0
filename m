Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826F2DB9A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 00:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441609AbfJQWTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 18:19:13 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40024 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388926AbfJQWTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 18:19:10 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so2511544pfb.7;
        Thu, 17 Oct 2019 15:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8JZTh5GOv/vPwyj1Z/f9GyQeqhW8aV/ynLQgCI/BrPs=;
        b=gASX5gWQMRaeKcinMDBoM1N8EXgDHtZviu7s6BZ2htkSiNOQfvkU7rGiZBP8dIUXKQ
         GUpRJxrCPZ+bNYjj8gM3eubGHRO1YsmxhA+7Yw8sLrCmBV6VpPsIOqt2/Wz6Abjya8R2
         mDTBwhJH47QGfFvM6YU6goBxEd1ZWh+eOKZOxn2ozQBJ773igmeFk+dDeiJ1d7JVpXu1
         4rwwqwemuoXSBmTFjHR/8dXRv57xZIjWzDy6AibvNeQ36kyNNvu+zOP11j/FTbYOqzmP
         Y0KXukY1wxELBi2Enpkd7KLoKZWKPbBlwcx5H/gt0jZC+AcNO+qtAwVrDaj2i7flFnIA
         J33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8JZTh5GOv/vPwyj1Z/f9GyQeqhW8aV/ynLQgCI/BrPs=;
        b=dLeQtLWfCa9ONr7yyp9YMNcKGtj8xTcbjmRwuDA5pYwO9FVi4Fr0zy/TJ3AzENzVTl
         lW9nApOkPRpzI6/R/fwcrvEAq/BnDD6JX53X0bEjmO7/s+mhdc0orn6iFs/Na/u2Ch/6
         nCv7ye8nrAkBRr0VLvOQQKJ838MUz7nFYGgjHRf6irkChS6LCepL+F/c9iC0hAIAT7zA
         6aUthhk+7ul6yRuc2mni7zOTrwZ2wA80KBNhYaxlToqlhX7GxtQOojzZf/oCLDOU5MVc
         U+hK4RYisNP7ZJ81mk47hnjVdvhjla8B2MrfW2BwyBnZTqJlaEQ/ef1mZDMZMQh6O3uL
         nIDg==
X-Gm-Message-State: APjAAAXxjXoVvAxU3uPs8IYl7AdXyqTN8K7GYqdAoTCjKnw1zpPB4xEZ
        0Hq+48YUpU3FRdi8TQuCNOU=
X-Google-Smtp-Source: APXvYqyT5pYhGkPtGA3klMmcwFm1aXTk0WQ7BdE9vjcp/7RSs3rStsEZKxZL4Q3f/XLgP0EvJnrlcg==
X-Received: by 2002:a62:4d04:: with SMTP id a4mr2719467pfb.60.1571350747912;
        Thu, 17 Oct 2019 15:19:07 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a8sm3441912pff.5.2019.10.17.15.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 15:19:07 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [RFC PATCH 4/4] arm64: dts: qcom: msm8998-clamshell: Enable bluetooth
Date:   Thu, 17 Oct 2019 15:18:43 -0700
Message-Id: <20191017221843.8130-5-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017221843.8130-1-jeffrey.l.hugo@gmail.com>
References: <20191017221843.8130-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bluetooth is provided by a wcn3990, which is connected to the main SoC via
blsp1_uart3.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
index 8c35c1f54e32..ab24d415acc0 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -60,6 +60,20 @@
 	};
 };
 
+&blsp1_uart3 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
 &dsi0 {
 	status = "okay";
 
@@ -209,6 +223,7 @@
 		vreg_l7a_1p8: l7 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
 		};
 		vreg_l8a_1p2: l8 {
 			regulator-min-microvolt = <1200000>;
@@ -249,6 +264,7 @@
 		vreg_l17a_1p3: l17 {
 			regulator-min-microvolt = <1304000>;
 			regulator-max-microvolt = <1304000>;
+			regulator-allow-set-load;
 		};
 		vreg_l18a_2p7: l18 {
 			regulator-min-microvolt = <2704000>;
@@ -284,6 +300,7 @@
 		vreg_l25a_3p3: l25 {
 			regulator-min-microvolt = <3104000>;
 			regulator-max-microvolt = <3312000>;
+			regulator-allow-set-load;
 		};
 		vreg_l26a_1p2: l26 {
 			regulator-min-microvolt = <1200000>;
-- 
2.17.1


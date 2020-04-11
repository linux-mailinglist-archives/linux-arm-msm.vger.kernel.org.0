Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 291091A534D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 20:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgDKSWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Apr 2020 14:22:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37433 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgDKSWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Apr 2020 14:22:06 -0400
Received: by mail-lj1-f193.google.com with SMTP id r24so4980044ljd.4;
        Sat, 11 Apr 2020 11:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QSRXD0SJkE7i7zRyJ4pGNc7KE9lIsIbXbbV9fBpZthE=;
        b=owwSHFGq/2YdQCd8N6ZZzQnsrMHwk4rGWnccaZ/eGwWRLhCxr/dyoDaxorSCbpo8EH
         ozxGt/48BuDgqx6HOjsNUu9zPh7s7M/L9Fg0P1j3DtQ9vCEwJHW+hvqh5V5jystQjyYy
         6omAJ9q7MqkrwmurQI0F4pXP9f3gNnsoBifn0xC5yC0b7v8ZMYemwwo8PKU7hYuJkNsd
         sZvch+kg2b1OiWi8LpZzVh8uyex1fohyrBtlU9T5LAugkST6vAMdadlqcd9xRuD9ONQk
         E6ZaEeqBe7ObnvOQ8P9+p54cA6xKIn1gX8KlRXBvI00TXZ0HSfux60SbnDri/Skl8Zu6
         SclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QSRXD0SJkE7i7zRyJ4pGNc7KE9lIsIbXbbV9fBpZthE=;
        b=qsg0d0veAaXhtQKyfFRihLnt7OfIWTxO7ywT9WgPC27SL57qoLnY1S+3KnuoKw9aOb
         fK3p+z8zQbuvul9Gx9h2Iz8fzsVuiKHbosHoWmC8QQ8BsS4kP1wexXDZBl6/zlZknQbl
         P7EuJUy36xnLd8lnV3eaiJgT9WSTMcOwsMJn2pHwiwUnDxY5uHySXiJH004a2rYmMJCl
         e/rB+3kvXsqVJn6kDgXvGjSGqaMasEzHdM/LpHqUBkKY1YEC/wUBf4rrDeJi5ATirkXh
         OYA2vEWPFJve+/hWTjJ8EN8bfFQqDeCbABPZ+p/aba+wSGUYodcIgL/IqXcOFKjvlma/
         ZdLw==
X-Gm-Message-State: AGi0Pub3XnVOPpwHFuO/bA9BGu1kewtg3TJDu9LIl+D7+Yr/HXMK8SMa
        vDh4TzWbi9IkDZsquyB5pFcielE1PBnh4Q==
X-Google-Smtp-Source: APiQypJH2lELAq0Eyb2oElTZoPOrmwIEq2/O2DcsseydqPgYS3u/vdlfREyL29Rxgx3gjPgcB9mEVA==
X-Received: by 2002:a2e:9b55:: with SMTP id o21mr5989347ljj.74.1586629322724;
        Sat, 11 Apr 2020 11:22:02 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id x80sm4307466lff.23.2020.04.11.11.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 11:22:02 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 1/5] ARM: dts: qcom: msm8974-klte: Add pma8084 regulator nodes
Date:   Sat, 11 Apr 2020 21:21:18 +0300
Message-Id: <20200411182122.2677248-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200411182122.2677248-1-iskren.chernev@gmail.com>
References: <20200411182122.2677248-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Daniele Debernardi <drebrez@gmail.com>

The pma8084 replaces the pm8841,pm8941 found in other msm8974 devices.
It is used for various things including gpio keys, sdhci, usb, dsi.

The voltages are pulled from the vendor source tree.

Signed-off-by: Daniele Debernardi <drebrez@gmail.com>
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 184 ++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index eaa1001d0a46..b6329f24c502 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -2,6 +2,7 @@
 #include "qcom-msm8974pro.dtsi"
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
+#include "qcom-pma8084.dtsi"
 
 / {
 	model = "Samsung Galaxy S5";
@@ -14,6 +15,189 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	smd {
+		rpm {
+			rpm_requests {
+				pma8084-regulators {
+					compatible = "qcom,rpm-pma8084-regulators";
+					status = "okay";
+
+					pma8084_s1: s1 {
+						regulator-min-microvolt = <675000>;
+						regulator-max-microvolt = <1050000>;
+					};
+
+					pma8084_s2: s2 {
+						regulator-min-microvolt = <500000>;
+						regulator-max-microvolt = <1050000>;
+					};
+
+					pma8084_s3: s3 {
+						regulator-min-microvolt = <1300000>;
+						regulator-max-microvolt = <1300000>;
+					};
+
+					pma8084_s4: s4 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					pma8084_s5: s5 {
+						regulator-min-microvolt = <2150000>;
+						regulator-max-microvolt = <2150000>;
+					};
+
+					pma8084_s6: s6 {
+						regulator-min-microvolt = <1050000>;
+						regulator-max-microvolt = <1050000>;
+					};
+
+					pma8084_l1: l1 {
+						regulator-min-microvolt = <1225000>;
+						regulator-max-microvolt = <1225000>;
+					};
+
+					pma8084_l2: l2 {
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1200000>;
+					};
+
+					pma8084_l3: l3 {
+						regulator-min-microvolt = <1050000>;
+						regulator-max-microvolt = <1200000>;
+					};
+
+					pma8084_l4: l4 {
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1225000>;
+					};
+
+					pma8084_l5: l5 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					pma8084_l6: l6 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					pma8084_l7: l7 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					pma8084_l8: l8 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					pma8084_l9: l9 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					pma8084_l10: l10 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					pma8084_l11: l11 {
+						regulator-min-microvolt = <1300000>;
+						regulator-max-microvolt = <1300000>;
+					};
+
+					pma8084_l12: l12 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					pma8084_l13: l13 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					pma8084_l14: l14 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					pma8084_l15: l15 {
+						regulator-min-microvolt = <2050000>;
+						regulator-max-microvolt = <2050000>;
+					};
+
+					pma8084_l16: l16 {
+						regulator-min-microvolt = <2700000>;
+						regulator-max-microvolt = <2700000>;
+					};
+
+					pma8084_l17: l17 {
+						regulator-min-microvolt = <2850000>;
+						regulator-max-microvolt = <2850000>;
+					};
+
+					pma8084_l18: l18 {
+						regulator-min-microvolt = <2850000>;
+						regulator-max-microvolt = <2850000>;
+					};
+
+					pma8084_l19: l19 {
+						regulator-min-microvolt = <2900000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					pma8084_l20: l20 {
+						regulator-min-microvolt = <2950000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					pma8084_l21: l21 {
+						regulator-min-microvolt = <2950000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					pma8084_l22: l22 {
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					pma8084_l23: l23 {
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3000000>;
+					};
+
+					pma8084_l24: l24 {
+						regulator-min-microvolt = <3075000>;
+						regulator-max-microvolt = <3075000>;
+					};
+
+					pma8084_l25: l25 {
+						regulator-min-microvolt = <2100000>;
+						regulator-max-microvolt = <2100000>;
+					};
+
+					pma8084_l26: l26 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2050000>;
+					};
+
+					pma8084_l27: l27 {
+						regulator-min-microvolt = <1000000>;
+						regulator-max-microvolt = <1225000>;
+					};
+
+					pma8084_lvs1: lvs1 {};
+					pma8084_lvs2: lvs2 {};
+					pma8084_lvs3: lvs3 {};
+					pma8084_lvs4: lvs4 {};
+
+					pma8084_5vs1: 5vs1 {};
+				};
+			};
+		};
+	};
 };
 
 &soc {
-- 
2.26.0


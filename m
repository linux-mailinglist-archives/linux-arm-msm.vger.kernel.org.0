Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BFD398F9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 18:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhFBQJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 12:09:23 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:40687 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhFBQJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 12:09:23 -0400
Received: by mail-pg1-f170.google.com with SMTP id j12so2618038pgh.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bGVJ1fEqd+Kmtn4CZUiicvmSxzhYZxgsSiEwCJsJFPs=;
        b=gaKK+caiwwpAV1acAj90mEj+I+G3WF84YlHQoghHtaMb21r1BPmcOdmERodSw7gckN
         v+rrAMqvANdGQ9qsYyLdAMup2LVONj2nqhjUPhtvOzKSVIP7ROgIHsc4qy4Rq4IQQGo3
         cho/IKi31EFebhHza+L5urNVrf3jB6bn7CgVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bGVJ1fEqd+Kmtn4CZUiicvmSxzhYZxgsSiEwCJsJFPs=;
        b=AiwgirvwJZvFVIq8QoBARKtT9qpDOak/s3jLDra8kMe67/IYNmcKG/DhenxlPq5f19
         KkB5Jlhhk3hkWfvSCDlpaaoqqYBEsiSPfZqrHQ0Q6eMOyok6X0my1ikl9lRBA3oaqGiU
         05nVr6Re3qUn+RygAKGoyQ37+isrQST1PEy6/DUVj/Md5T9I/Du46wYLFE09tCp+BIXB
         9qhNcp65Rs6dQf8xbbUO1X178cPhxFeYRPYEs48/TtdA6Zgs4tLd8T1Z7q2OcZ+MXGJu
         4EkC9BMQ3R7D/0TzZxnwAomANGoQeitQTrodi5MXUBNd/FAne5L272k1PukL+JrkkbQK
         Z/aA==
X-Gm-Message-State: AOAM532Wbhi5o0eJBsIyHpyHjY/I9hlrdmsPArxfRjNDBeK1gEZZmwXe
        5EMi/f0K+PwQgq3e9uEh0QPrVQ==
X-Google-Smtp-Source: ABdhPJyEAwrGnHc8J9VsjWkA60Q3J0sEYJly49WpAkjmIW6xj6PdM9vaVC+MXdKwGxM6v4qPP9MNcg==
X-Received: by 2002:aa7:9537:0:b029:2ea:2312:d2cb with SMTP id c23-20020aa795370000b02902ea2312d2cbmr3313322pfp.27.1622649983304;
        Wed, 02 Jun 2021 09:06:23 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d737:2805:1403:7c09])
        by smtp.gmail.com with UTF8SMTPSA id s6sm61385pjr.29.2021.06.02.09.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 09:06:22 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] arm64: dts: qcom: pm6150: Add thermal zone for PMIC on-die temperature
Date:   Wed,  2 Jun 2021 09:06:14 -0700
Message-Id: <20210602090525.1.Id4510e9e4baaa3f6c9fdd5cdf4d8606e63c262e3@changeid>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a thermal zone for the pm6150 on-die temperature. The system should
try to shut down orderly when the temperature reaches 95degC, otherwise
the PMIC will power off at 115degC.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/pm6150.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
index 8ab4f1f78bbf..de7fb129f739 100644
--- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
@@ -7,6 +7,30 @@
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/thermal/thermal.h>
 
+/ {
+	thermal-zones {
+		pm6150_thermal: pm6150-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm6150_temp>;
+
+			trips {
+				pm6150_trip0: trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm6150_crit: pm6150-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm6150_lsid0: pmic@0 {
 		compatible = "qcom,pm6150", "qcom,spmi-pmic";
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog


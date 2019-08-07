Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1909285320
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 20:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389245AbfHGSov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 14:44:51 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34067 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389080AbfHGSov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 14:44:51 -0400
Received: by mail-pl1-f194.google.com with SMTP id i2so42126423plt.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2019 11:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2IbDDVz7AIYvob9RX49OsdDKJDV+Vvct093/EWA0a4E=;
        b=ivbrRfGOojgPeGQehWsvM+H2yaojSbdm98/KpCKzNDvnH6WagBvNAY+3WDms9j8vo4
         pzdMB6A7o01aVBXLwSgyksmc8auXDgupC9dhQe/0nKqzYwrCGyV+q7R5GDPPcpcdAzkK
         1jc7mFG3yu0O/xjVyxKMhY8qPY+o+5MP1KGHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2IbDDVz7AIYvob9RX49OsdDKJDV+Vvct093/EWA0a4E=;
        b=K7mZJLr53Vqlw79PoNKHnK+nAXhj3qHNKd0ZNfKgDg3306ZoVv/YHLHG+GRdjlOeBc
         CaqTkO8UBp9UJaKY3VYcindzpiwdu3qCgigF9kyDaPUC6X0ssBeuZpcymwDpUJrgf2RU
         6IN4FU/1DGbUIqcCYdCSrUdkuK3VqhkAFroLUY3shFrRqG2rvSidyh6fFXhGgtslZPcP
         qrbdy2g5qMKr9L03WLyRipgh0uZL9zqwxpPXOG4y5+0mn4+MWmNec5ZEHE1y08/2jwRr
         eFCZGWV7gBZGTtef2YVqnpVbm+iaAij96khtNMnWyMBhId6XCIAUxcFYA4ONrd73Hw8R
         f3OA==
X-Gm-Message-State: APjAAAVBueU1Q5aWSt/DB2TPLOVXW+OnCQTZHbYgJqqdTjE7KaS8V78q
        9TNcJ4e5YBvDVR4EfQgdW/ue7Q==
X-Google-Smtp-Source: APXvYqyPo9mJdjvn0x0NHv6/e03SbunwEogzp2cEC7vzJFwflpHwGALnVpplo1Q0DE/O448sW9GX3w==
X-Received: by 2002:a17:902:28e9:: with SMTP id f96mr9127478plb.114.1565203490911;
        Wed, 07 Aug 2019 11:44:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id u7sm83048472pgr.94.2019.08.07.11.44.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 11:44:50 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] arm64: dts: sdm845: Add dynamic CPU power coefficients
Date:   Wed,  7 Aug 2019 11:44:44 -0700
Message-Id: <20190807184444.248984-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dynamic power coefficients for the Silver and Gold CPU cores of
the Qualcomm SDM845.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
---
just noticed that this patch fell through the cracks, resending
a rebased version.

Changes in v2:
- added Reviewd-by tags from Doug and Amit
- rebased on agross/for-next
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 78ec373a2b18..12ae58d76f8b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -194,6 +194,7 @@
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
 			capacity-dmips-mhz = <607>;
+			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
@@ -215,6 +216,7 @@
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
 			capacity-dmips-mhz = <607>;
+			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_100>;
@@ -233,6 +235,7 @@
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
 			capacity-dmips-mhz = <607>;
+			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_200>;
@@ -251,6 +254,7 @@
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
 			capacity-dmips-mhz = <607>;
+			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_300>;
@@ -269,6 +273,7 @@
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
+			dynamic-power-coefficient = <396>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_400>;
@@ -287,6 +292,7 @@
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
+			dynamic-power-coefficient = <396>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_500>;
@@ -305,6 +311,7 @@
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
+			dynamic-power-coefficient = <396>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_600>;
@@ -323,6 +330,7 @@
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
+			dynamic-power-coefficient = <396>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_700>;
-- 
2.22.0.770.g0f2c4a37fd-goog


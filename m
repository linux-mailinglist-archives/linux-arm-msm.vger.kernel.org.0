Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E342F2AAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 10:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405883AbhALJCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 04:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405884AbhALJCr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 04:02:47 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294A3C061786
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 01:02:07 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id p12so1186621pju.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 01:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=eeCVCRLwP6P2szW1+rqfHiYExfnP9uRBHbhFoniokeo=;
        b=qE4Vz320cuOtt6ewd+GhF0QkfiupJV1tfhkJMPa54k4i7HubhRusjXHSIdOohPBxIP
         YXDyw7FDeOB0bg/6M2rnQuFejAitqx3AqKzqScCPRWkuqjazf3EHpeS4IWh9xbBPB8F5
         YA2aQCnFlEivAc0k3veXLIDcfW3/RL4bEpMKck1qR65dYnW4+d2YYPUX7oFnkhT/qOBX
         +nbo+VvZJviwqa2Wpn6ZrxTQKVXZ2xVz+oQplDtEp5yHPRAMK3lx8BKP53M2aAKvD8Sn
         f2GoBo0nawBfP1eXWx5GGoS8QIVSjp6y05bi6/coF0t1Pj41MbzcS61Rdq3r70Yhd6JI
         lA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eeCVCRLwP6P2szW1+rqfHiYExfnP9uRBHbhFoniokeo=;
        b=VGJvkMlm9rBBjrCDiZTeMfV6oTlDrpJPKqtyGjCikiwOJ+mybY/Jul+EuMDKf++1pz
         nlyIvqzV9hOW1DlwX6FaADQeWxLJr8NoEmGkorJ04kvVWZG5pTm6IkZBA6mpD+9zmvIU
         /P693YbHWftMcUU7/848zsrC2/TsHgIyBFYvm3XgKF10clnmIFHditnVV0qCJ7uqJbOq
         HlJRdgTSP3xb1zkM9qez+Hg2ISU+ikTeQLt6TFO2rqBM0/hoyoLlpqLYzxxIoaXAWb0r
         LGoVOrfqoG03b70vlxlbQUkFM5rmOtMMrQQCzHpF7xss+1rspUIKDImpAohcmMkZeTXC
         g/Yg==
X-Gm-Message-State: AOAM530j7WRCwMNMoeIqlavb6PK3OyMytsEGABJTgsnVgMOxJ/u2AokG
        bQSp3TW/EthZDsoU8pQKEYVw1VvNFmwNXetC
X-Google-Smtp-Source: ABdhPJwUJzPK7ZqID06UDqXEnJno2XsjRxySyEgoa7QfZOURd71TZ3cnIYi7UCm4WElrBVTSp52jFg==
X-Received: by 2002:a17:902:6acb:b029:dc:2e9d:7ca with SMTP id i11-20020a1709026acbb02900dc2e9d07camr3838716plt.56.1610442126633;
        Tue, 12 Jan 2021 01:02:06 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id mv17sm1889860pjb.17.2021.01.12.01.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 01:02:05 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] arm64: dts: sdm850: Add OPP tables for 2.84 and 2.96GHz
Date:   Tue, 12 Jan 2021 17:01:40 +0800
Message-Id: <20210112090140.19867-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Steev Klimaszewski <steev@kali.org>

Running cpufreq-hw driver on Lenovo Yoga C630 laptop, the following
warning messages will be seen.

[    3.415340] cpu cpu4: Voltage update failed freq=2841600
[    3.418755] cpu cpu4: failed to update OPP for freq=2841600
[    3.422949] cpu cpu4: Voltage update failed freq=2956800
[    3.427086] cpu cpu4: failed to update OPP for freq=2956800

This is because the cpufreq-hw lookup table of SDM850 provides these two
set-points, but they are missing from OPP table in DT.  Let's create
sdm850.dtsi to add the OPP for them, so that the warning will be gone.

Signed-off-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  2 +-
 arch/arm64/boot/dts/qcom/sdm850.dtsi          | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 7929665aeaee..94390ae630f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -13,7 +13,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
-#include "sdm845.dtsi"
+#include "sdm850.dtsi"
 #include "pm8998.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sdm850.dtsi b/arch/arm64/boot/dts/qcom/sdm850.dtsi
new file mode 100644
index 000000000000..8e911e9723ba
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SDM850 SoC device tree source
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include "sdm845.dtsi"
+
+&cpu4_opp_table {
+
+	cpu4_opp33: opp-2841600000 {
+	opp-hz = /bits/ 64 <2841600000>;
+	opp-peak-kBps = <7216000 25497600>;
+	};
+
+	cpu4_opp34: opp-2956800000 {
+	opp-hz = /bits/ 64 <2956800000>;
+	opp-peak-kBps = <7216000 25497600>;
+	turbo-mode;
+	};
+};
-- 
2.17.1


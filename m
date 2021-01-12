Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6264A2F2AC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 10:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732874AbhALJHu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 04:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbhALJHt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 04:07:49 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410A7C061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 01:07:09 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id b8so1082394plx.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 01:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bBQomZb0UZFDjs2bc2TvWJzjfPhcCc3dkaWs1twGd/o=;
        b=r7iXwu2QQ1c5yRtRE7KBQu+niMjojECwm6XiPrBS+MgjOTC6FyTxvZ+PzVdGs7hczP
         jAYObcx9baVJT/dlTgM442mpUCsxl4zL9C2MIQJThi+u6SWovAvNyY6biz6khP0YdJcz
         1lVVih0O/EeEHc5TuSwPmfmjJ3HQdxtIq1+a8+wQ9ijGhZO99qLZ/ycUfp8PDglEotb7
         sl+1+zfemfC9yYVZVuLObitwCLyHaOyW08SMFbilOk0G1R0lq5/caN/DTE4JOKOfTWDQ
         YRALKgtNSmWbxPo1ZM4fTqBQXO1u58lzgLeizseRzXXThubLIVatTK+MdWsptL+y/r4S
         zC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bBQomZb0UZFDjs2bc2TvWJzjfPhcCc3dkaWs1twGd/o=;
        b=cQmmbSVw1luJidDbM/KfLECC7G6DskGesKuNnmQ0ekIUZfDw427uKpvF0mQ7/mJKM2
         otSfociVUcHX0JCYmtIbXnfqyYZafA9220PGmPpz7SdQ+PflNU8V/M9iWCu8kJ4BrmKM
         AEzdsCO60ZVF3VAFVOmC5iU2im4wz4eveJZG5JMIGeojqOVxLUASDvWANWwxd4ETfaX2
         PTrjcqMAruRfoMyLx6DlU9n1hPepjAmy8WK8GitXKmMjANFYBadF7Tlt9IMNDI+s/1sn
         NH0Pz7Uu4upPxy7hSRNq8gugnz+sfpGqdDjcQRx8SOeBPNch4VuPi6WkYi9aLHXbWrE0
         aAJA==
X-Gm-Message-State: AOAM532KZb7qZenuNLwejSLoavg4L6MmVCJJaiEwK3MVLQJQgVOk21rq
        Lsw7LsBW6ummbDoH+rZNharCyA==
X-Google-Smtp-Source: ABdhPJxaRGG7rNBI/tZ0A01aIOpqnrB/2tE8nUNHFSDaq0W/dP30B2RN74o3v6NsEI2hPOPzh8j6fQ==
X-Received: by 2002:a17:90b:8d8:: with SMTP id ds24mr3498383pjb.134.1610442428846;
        Tue, 12 Jan 2021 01:07:08 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id m8sm2473272pjr.39.2021.01.12.01.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 01:07:08 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH RESEND] arm64: dts: sdm850: Add OPP tables for 2.84 and 2.96GHz
Date:   Tue, 12 Jan 2021 17:06:40 +0800
Message-Id: <20210112090640.20062-1-shawn.guo@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm850.dtsi          | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
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
index 000000000000..b1c2cf566c7a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
@@ -0,0 +1,21 @@
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
+	cpu4_opp33: opp-2841600000 {
+		opp-hz = /bits/ 64 <2841600000>;
+		opp-peak-kBps = <7216000 25497600>;
+	};
+
+	cpu4_opp34: opp-2956800000 {
+		opp-hz = /bits/ 64 <2956800000>;
+		opp-peak-kBps = <7216000 25497600>;
+		turbo-mode;
+	};
+};
-- 
2.17.1


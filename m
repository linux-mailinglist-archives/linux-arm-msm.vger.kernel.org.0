Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5292C1E18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 07:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgKXGVp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 01:21:45 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:37516 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728611AbgKXGVo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 01:21:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606198904; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=cg4mCsOJyekdpypjBkEBPAnMQeOyE1zwdoSEfRWiALs=; b=fHOzD2qDVNsRTiyqsljKQNWGfjso2bdh3ID4z12x4z2lTNoTxzPpmdD7vElcPR7E38CmzetJ
 gwQoFw5WFD2Fze5EHd4gau/d5RMw8PGHHL3suevUSvTh7y/nzIuWbpnuoYgZ05Sk9QblA8HZ
 AfPaiyUvVRXO3UfJ4UgoLGOkzM0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fbca66b9e87e163523e60f1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 06:21:31
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E7A74C43463; Tue, 24 Nov 2020 06:21:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9EF6C433C6;
        Tue, 24 Nov 2020 06:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9EF6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, dianders@chromium.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        mka@chromium.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/2] arm64: dts: qcom: sc7180-lite: Tweak DDR/L3 scaling on SC7180-lite
Date:   Tue, 24 Nov 2020 11:51:15 +0530
Message-Id: <1606198876-3515-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tweak the DDR/L3 bandwidth votes on the lite variant of the SC7180 SoC
since the gold cores only support frequencies upto 2.1 GHz.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V2:
 * Updated the lite ddr/l3 cpufreq map to have better power numbers with
   similar perf.

 arch/arm64/boot/dts/qcom/sc7180-lite.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-lite.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7180-lite.dtsi b/arch/arm64/boot/dts/qcom/sc7180-lite.dtsi
new file mode 100644
index 000000000000..d8ed1d7b4ec7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-lite.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * SC7180 lite device tree source
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+&cpu6_opp10 {
+	opp-peak-kBps = <7216000 22425600>;
+};
+
+&cpu6_opp11 {
+	opp-peak-kBps = <7216000 22425600>;
+};
+
+&cpu6_opp12 {
+	opp-peak-kBps = <8532000 23347200>;
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


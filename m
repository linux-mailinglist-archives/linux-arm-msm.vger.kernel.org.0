Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDA41ADF4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 16:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731066AbgDQOGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 10:06:07 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:57714 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731065AbgDQOGC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 10:06:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587132361; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qxyMIZja2VBMnNSJ8eaNEwOk1Fr+zRXte9PY/FtGOKs=; b=E4qBnGu9DwOStBdgA2zARb7XZpTAQwAtAak/vtgVHotpjdUYg6JRbL/PTrf58P/wdaiRVq9y
 Ho2i0QeYDwWt+QWNXPLuw1MXXMkkO6HgGINmCzBXMENrP41TfYuZmhBEz005f8RYlJCx2NQY
 opZvKVmH+ZVsz6v89AIu++LDbXw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e99b7c9.7ff83bde0c00-smtp-out-n03;
 Fri, 17 Apr 2020 14:06:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1B331C38564; Fri, 17 Apr 2020 14:06:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86114C44BFA;
        Fri, 17 Apr 2020 14:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86114C44BFA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 10/17] arm64: dts: sdm845: Add sdhc opps and power-domains
Date:   Fri, 17 Apr 2020 19:34:32 +0530
Message-Id: <1587132279-27659-11-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the power domain supporting performance state and the corresponding
OPP tables for the sdhc device on sdm845.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 7a625ad..e6f1af1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2975,6 +2975,30 @@
 			};
 		};
 
+		sdhc2_opp_table: sdhc2-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-9600000 {
+				opp-hz = /bits/ 64 <9600000>;
+				required-opps = <&rpmhpd_opp_min_svs>;
+			};
+
+			opp-19200000 {
+				opp-hz = /bits/ 64 <19200000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+			};
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+				required-opps = <&rpmhpd_opp_svs>;
+			};
+
+			opp-201500000 {
+				opp-hz = /bits/ 64 <201500000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+		};
+
 		sdhc_2: sdhci@8804000 {
 			compatible = "qcom,sdm845-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
@@ -2987,6 +3011,8 @@
 				 <&gcc GCC_SDCC2_APPS_CLK>;
 			clock-names = "iface", "core";
 			iommus = <&apps_smmu 0xa0 0xf>;
+			power-domains = <&rpmhpd SDM845_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
 
 			status = "disabled";
 		};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

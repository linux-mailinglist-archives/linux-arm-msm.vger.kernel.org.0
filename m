Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADA2132410
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 11:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgAGKpv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 05:45:51 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59285 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727818AbgAGKpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 05:45:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578393948; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gO6EeLBOIsNfMvgZHVgrzmazm5A+p0Ce4ofELb5VHPY=; b=IfIkn4xXi5a+/fLIy0Aveo0jL4UYecxGwVqRd0pXqYlEuXTkdlPv7nUnqs0TNFVd1V6oFubS
 omjEsxJ48jUeuwCr4nNOdNk3hUukGKHMkMTBGYpmhbsjRjPkBs99br2taVG5CnRPpUdpe67R
 RMkq2GMD3+oT3pHY4iBf4dFIdlI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e14615b.7f9ba35e7fb8-smtp-out-n03;
 Tue, 07 Jan 2020 10:45:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 829DAC447AA; Tue,  7 Jan 2020 10:45:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37B0BC447A9;
        Tue,  7 Jan 2020 10:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37B0BC447A9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sc7180: Add CPU topology
Date:   Tue,  7 Jan 2020 16:15:26 +0530
Message-Id: <1578393926-5052-3-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578393926-5052-1-git-send-email-rnayak@codeaurora.org>
References: <1578393926-5052-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC7180 has 2 big cores and 6 LITTLE ones in a single cluster
with shared L3.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 4890537..3b9314a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -211,6 +211,42 @@
 				next-level-cache = <&L3_0>;
 			};
 		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+
+				core4 {
+					cpu = <&CPU4>;
+				};
+
+				core5 {
+					cpu = <&CPU5>;
+				};
+
+				core6 {
+					cpu = <&CPU6>;
+				};
+
+				core7 {
+					cpu = <&CPU7>;
+				};
+			};
+		};
 	};
 
 	memory@80000000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

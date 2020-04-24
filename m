Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C6E1B72EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 13:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgDXLRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 07:17:00 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:39740 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726890AbgDXLRA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 07:17:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587727020; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=+S6TTE3qIQR3bjpweChMEUVjD/kVHW4m2uU9Je20LDk=; b=XZHZkue7TOEI1F2t59A4vzfGncxuq8yqiHxWZG+HzdY0k9+zPs6BXBRri1Rnx58WcN7uH1Cv
 aN7kGrNUC2Da+a1dcIXNefCMwgqy5m8wW3syi4Nz/T3ptFlt8w4LHzt+J4c+UcpwgLLaT917
 TGWq6dhppvaqGx/n3p0f5wgv4Q4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea2caab.7fa192271768-smtp-out-n01;
 Fri, 24 Apr 2020 11:16:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 755C1C43637; Fri, 24 Apr 2020 11:16:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB17AC433F2;
        Fri, 24 Apr 2020 11:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB17AC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Support ETMv4 power management
Date:   Fri, 24 Apr 2020 16:46:44 +0530
Message-Id: <20200424111644.27970-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that deep idle states are properly supported on SC7180,
we need to add "coresight-loses-context-with-cpu" property
to avoid failure of trace session because of losing context
on entering deep idle states.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 4216b574c080..cab86194a870 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1621,6 +1621,7 @@
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -1639,6 +1640,7 @@
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -1657,6 +1659,7 @@
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -1675,6 +1678,7 @@
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -1693,6 +1697,7 @@
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -1711,6 +1716,7 @@
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -1729,6 +1735,7 @@
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -1747,6 +1754,7 @@
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

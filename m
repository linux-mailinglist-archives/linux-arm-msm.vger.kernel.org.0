Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C75227956
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 09:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgGUHOJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 03:14:09 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:44968 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728423AbgGUHOJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 03:14:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595315648; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=EVrMW6wwp3PC7r9kiDLlWKaxlbOinFQQjxzQoFiW00o=; b=ty2IEcoI8w0ZBMp6PPGiIT5dxz6/qmTEst2x5I+Yv69NxXXUCgQMeWWJ/PpsAcOZgCVn70e4
 LxrPXqIucf9su3CdaiP9Nma6lqVl5Vk9YYrFpmPWfIYmKczsh6l7cfGIytslHRcNFuzLOU+J
 lFGSQYQt6rhBQbh/qa7+2YWtLx8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-east-1.postgun.com with SMTP id
 5f1695b98423214e13e2efb5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 07:14:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 12391C4339C; Tue, 21 Jul 2020 07:14:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5441C433C9;
        Tue, 21 Jul 2020 07:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5441C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: Support ETMv4 power management
Date:   Tue, 21 Jul 2020 12:43:43 +0530
Message-Id: <20200721071343.2898-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add "arm,coresight-loses-context-with-cpu" property to coresight
ETM nodes to avoid failure of trace session because of losing
context on entering deep idle states.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index e506793407d8..0b5f063dcaea 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3016,6 +3016,7 @@ etm@7040000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -3035,6 +3036,7 @@ etm@7140000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -3054,6 +3056,7 @@ etm@7240000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -3073,6 +3076,7 @@ etm@7340000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -3092,6 +3096,7 @@ etm@7440000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -3111,6 +3116,7 @@ etm@7540000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -3130,6 +3136,7 @@ etm@7640000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -3149,6 +3156,7 @@ etm@7740000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


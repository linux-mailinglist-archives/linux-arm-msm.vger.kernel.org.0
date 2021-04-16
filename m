Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9E6361F6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 14:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243191AbhDPMFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 08:05:38 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43730 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243044AbhDPMFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 08:05:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618574706; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=TBWstCSRLjkQ9DjMg3pVMm44kSL31ze+B5x95FBUUtA=; b=Q/Udlp9auutyIJQ1y3u0l3EYd0OTtiWxWfDq3CrCeGTB6vEL6TMfAZ7VIoKKyA2KF+cLFiCs
 i86fq06kVZg2d6+KXU7HenwZ/caxCDqn7n3MnkQ3Y2eSzrtfkLjxNR6MSMGXCG4HDtSFB051
 ZEkCIE4hYWy88izENnvvNQMjJNY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60797d6bf34440a9d43ce718 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 12:04:59
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 384B3C43468; Fri, 16 Apr 2021 12:04:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 688FDC43467;
        Fri, 16 Apr 2021 12:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 688FDC43467
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, swboyd@chromium.org
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 09/12] arm64: dts: qcom: sm8150: Use QMP binding to control load state
Date:   Fri, 16 Apr 2021 17:33:55 +0530
Message-Id: <1618574638-5117-10-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618574638-5117-1-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
state resources on SM8150 SoCs and drop deprecated power-domains exposed
by AOSS QMP node.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 51235a9521c2..19f6bc268b9d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -5,7 +5,6 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -1040,13 +1039,14 @@
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&aoss_qmp AOSS_QMP_LS_SLPI>,
-					<&rpmhpd 3>,
+			power-domains = <&rpmhpd 3>,
 					<&rpmhpd 2>;
-			power-domain-names = "load_state", "lcx", "lmx";
+			power-domain-names = "lcx", "lmx";
 
 			memory-region = <&slpi_mem>;
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&slpi_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
@@ -1486,13 +1486,14 @@
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
-					<&rpmhpd 7>,
+			power-domains = <&rpmhpd 7>,
 					<&rpmhpd 0>;
-			power-domain-names = "load_state", "cx", "mss";
+			power-domain-names = "cx", "mss";
 
 			memory-region = <&mpss_mem>;
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
@@ -2110,12 +2111,12 @@
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&aoss_qmp AOSS_QMP_LS_CDSP>,
-					<&rpmhpd 7>;
-			power-domain-names = "load_state", "cx";
+			power-domains = <&rpmhpd 7>;
 
 			memory-region = <&cdsp_mem>;
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
@@ -2339,7 +2340,6 @@
 			mboxes = <&apss_shared 0>;
 
 			#clock-cells = <0>;
-			#power-domain-cells = <1>;
 		};
 
 		tsens0: thermal-sensor@c263000 {
@@ -2486,12 +2486,12 @@
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&aoss_qmp AOSS_QMP_LS_LPASS>,
-					<&rpmhpd 7>;
-			power-domain-names = "load_state", "cx";
+			power-domains = <&rpmhpd 7>;
 
 			memory-region = <&adsp_mem>;
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&adsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


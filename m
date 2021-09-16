Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B8E40DC32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 16:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238358AbhIPODR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 10:03:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51992 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238280AbhIPOCu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 10:02:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631800890; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=f5iIbuLPKvgeGVI683cGQ/hcCb7BByhH9/82WThKia4=; b=kKQk7TGc4LOJ3eReLdSxb23sQYkwFjdBITAwziUyE8I1bXM0Y7rAcFrh0zxa2KI/uS90Q6I3
 muxVADVCaA4nohx48J8k6I6FnjSHzg8lw3i6qhsKt5OSML6hC34/j6Ap7bZbFx302c+eECCE
 pqgFM5Xw3pmMlGHSJDaTVuZynpQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61434df9bd6681d8eda61d43 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 14:00:25
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3AC82C43637; Thu, 16 Sep 2021 14:00:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3178C4361B;
        Thu, 16 Sep 2021 14:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A3178C4361B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v7 07/13] arm64: dts: qcom: sdm845: Use QMP property to control load state
Date:   Thu, 16 Sep 2021 19:29:24 +0530
Message-Id: <1631800770-371-8-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631800770-371-1-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the Qualcomm Mailbox Protocol (QMP) property to control the load
state resources on SDM845 SoCs and drop deprecated power-domains exposed
by AOSS QMP node.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

v7:
 * Let's not miss adding qcom,qmp to ADSP/CDSP on SDM845 SoC.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d18f7b419d2e..39c136e25fb5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -763,6 +763,8 @@
 
 		memory-region = <&adsp_mem>;
 
+		qcom,qmp = <&aoss_qmp>;
+
 		qcom,smem-states = <&adsp_smp2p_out 0>;
 		qcom,smem-state-names = "stop";
 
@@ -862,6 +864,8 @@
 
 		memory-region = <&cdsp_mem>;
 
+		qcom,qmp = <&aoss_qmp>;
+
 		qcom,smem-states = <&cdsp_smp2p_out 0>;
 		qcom,smem-state-names = "stop";
 
@@ -2979,6 +2983,8 @@
 			clock-names = "iface", "bus", "mem", "gpll0_mss",
 				      "snoc_axi", "mnoc_axi", "prng", "xo";
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
@@ -2988,11 +2994,10 @@
 
 			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
 
-			power-domains = <&aoss_qmp 2>,
-					<&rpmhpd SDM845_CX>,
+			power-domains = <&rpmhpd SDM845_CX>,
 					<&rpmhpd SDM845_MX>,
 					<&rpmhpd SDM845_MSS>;
-			power-domain-names = "load_state", "cx", "mx", "mss";
+			power-domain-names = "cx", "mx", "mss";
 
 			mba {
 				memory-region = <&mba_region>;
@@ -4607,7 +4612,6 @@
 			mboxes = <&apss_shared 0>;
 
 			#clock-cells = <0>;
-			#power-domain-cells = <1>;
 
 			cx_cdev: cx {
 				#cooling-cells = <2>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


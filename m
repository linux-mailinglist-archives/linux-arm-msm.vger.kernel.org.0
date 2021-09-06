Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9170640186E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 10:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240978AbhIFI6I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 04:58:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:61416 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241017AbhIFI51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 04:57:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630918583; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=g/9m4i8E9wmmL6yBRJGILS2lSuUMAqT3e8cD/zECW3A=; b=s0qYlHV5EvKEboESlvjqPqyYlsVKR4tx+KT5GkH7bi0seia1/3F0JtoBLVET6iOgB2WhLsrM
 Cp7DQY+Pexg7zN3vISizoz2uFAhqo0rY6aDq1EyjBughB208CASNtETAW2qI6ZsxKChT9OLP
 2MWFO/ewFaxJRa50sdH2mTv3wi4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6135d7b11567234b8c857006 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 08:56:17
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BA09FC4363F; Mon,  6 Sep 2021 08:56:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9A10C43616;
        Mon,  6 Sep 2021 08:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E9A10C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, swboyd@chromium.org,
        mka@chromium.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 09/10] arm64: dts: qcom: sc7280: Add Q6V5 MSS node
Date:   Mon,  6 Sep 2021 14:24:44 +0530
Message-Id: <1630918485-15052-10-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630918485-15052-1-git-send-email-sibis@codeaurora.org>
References: <1630918485-15052-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds Q6V5 MSS PAS remoteproc node for SC7280 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index bd1ac93017ae..93ae3ee8c5a6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -699,6 +699,46 @@
 			#power-domain-cells = <1>;
 		};
 
+		remoteproc_mpss: remoteproc@4080000 {
+			compatible = "qcom,sc7280-mpss-pas";
+			reg = <0 0x04080000 0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack", "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC7280_CX>,
+					<&rpmhpd SC7280_MSS>;
+			power-domain-names = "cx", "mss";
+
+			memory-region = <&mpss_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_MPSS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+			};
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0 0x06002000 0 0x1000>,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


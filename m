Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5830333677
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 08:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCJHh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 02:37:58 -0500
Received: from z11.mailgun.us ([104.130.96.11]:52022 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231926AbhCJHhn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 02:37:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615361862; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=xuYPSMdgz8Yi0oiFGDEAJkTZb66LQ7xiQZRdBDqgi1w=; b=HcfttDcbr/UxozBG+avoH3o2glOXesvNYQj3X8IFfeNhwineiCqGlUeGaqZaa5pBCVeVeekQ
 K05vKCQ/4eKAJDxPB+fxygnZIdUDz9EuKu+Upf9+JgxWZAncc1vJ4JnU7kUdGBLzOoeqhYoV
 +bBoThCupQY+1kAbgYl2hJ11Ivk=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60487730e90f410d8813d95e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 07:37:20
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ECF2EC43462; Wed, 10 Mar 2021 07:37:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C375FC433C6;
        Wed, 10 Mar 2021 07:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C375FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
Date:   Wed, 10 Mar 2021 13:07:09 +0530
Message-Id: <1615361829-22370-1-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the WPSS remoteproc node in dts for
PIL loading.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
- This change is dependent on the below patch series
1) https://lore.kernel.org/patchwork/project/lkml/list/?series=487403
2) https://lore.kernel.org/patchwork/project/lkml/list/?series=488365
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  4 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 47 +++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 950ecb2..603f56b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -26,6 +26,10 @@
 	status = "okay";
 };
 
+&remoteproc_wpss {
+	status = "okay";
+};
+
 &uart5 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8af6d77..26dd466 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -53,6 +53,16 @@
 			no-map;
 			reg = <0x0 0x80b00000 0x0 0x100000>;
 		};
+
+		wlan_fw_mem: memory@80c00000 {
+			no-map;
+			reg = <0x0 0x80c00000 0x0 0xc00000>;
+		};
+
+		wpss_mem: memory@9ae00000 {
+			no-map;
+			reg = <0x0 0x9ae00000 0x0 0x1900000>;
+		};
 	};
 
 	cpus {
@@ -305,6 +315,43 @@
 			};
 		};
 
+		remoteproc_wpss: remoteproc@8a00000 {
+			compatible = "qcom,sc7280-wpss-pil";
+			reg = <0 0x08a00000 0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
+					      <&wpss_smp2p_in 0 0>,
+					      <&wpss_smp2p_in 1 0>,
+					      <&wpss_smp2p_in 2 0>,
+					      <&wpss_smp2p_in 3 0>,
+					      <&wpss_smp2p_in 7 0>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack", "shutdown-ack";
+
+			memory-region = <&wpss_mem>;
+
+			qcom,smem-states = <&wpss_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&aoss_reset AOSS_CC_WCSS_RESTART>;
+			reset-names = "restart";
+
+			qcom,halt-regs = <&tcsr_mutex_regs 0x37000>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_WPSS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "wpss";
+				qcom,remote-pid = <13>;
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
2.7.4


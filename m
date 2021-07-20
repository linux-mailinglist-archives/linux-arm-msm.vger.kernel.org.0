Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1604A3CF79E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 12:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236292AbhGTJe7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 05:34:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46683 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236423AbhGTJdx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 05:33:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626776069; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=U3oyy9Wy1/W3yM/7R55rDsV8ZZWtSfsaxO4axT11yWo=; b=I+6IX7OFGfgexH+KuIsWKwyxNjMpDZj+W006omzpefuS0vY4lbtblIGiwYixPaWOeY3rWiRI
 yUMEQg1YY1kOl81zV1WPXynE0fTe9bQELrwZz5+N97oLR7JWYGjYCgZQvjRKJbyUD55wF/nK
 xRta11WaV9jJhsrkoNnaoFC3Ud4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60f6a1f4fcf9fe7b78a2cb69 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 10:14:12
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 402DCC43143; Tue, 20 Jul 2021 10:14:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75DFEC4360C;
        Tue, 20 Jul 2021 10:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 75DFEC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, mka@chromium.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 08/10] arm64: dts: qcom: sc7280: Add nodes to boot modem
Date:   Tue, 20 Jul 2021 15:42:58 +0530
Message-Id: <1626775980-28637-9-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626775980-28637-1-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add miscellaneous nodes to boot the modem and support post-mortem debug
on SC7280 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 5ed7a511bfc9..3fb6a6ef39f8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -547,6 +547,11 @@
 			#hwlock-cells = <1>;
 		};
 
+		tcsr_regs: syscon@1fc0000 {
+			compatible = "syscon";
+			reg = <0 0x01fc0000 0 0x30000>;
+		};
+
 		lpasscc: lpasscc@3000000 {
 			compatible = "qcom,sc7280-lpasscc";
 			reg = <0 0x03000000 0 0x40>,
@@ -1219,6 +1224,21 @@
 			};
 		};
 
+		imem@146aa000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x146aa000 0 0x2000>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			ranges = <0 0x0 0 0x146aa000 0 0x2000>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0 0x94c 0 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sc7280-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


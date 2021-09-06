Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4571401863
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 10:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240513AbhIFI5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 04:57:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32392 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229494AbhIFI5L (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 04:57:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630918567; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Zv7enBkxyY316XloIYHRNYMXA4Y6hLRjVT/f1ruETO0=; b=Hjt8Smpek0mLsapwpaeiDeVRwre5mbH/gfpJP6RX9IxzxdkgFhDYeB97JZTqrPj1mO9+PTcV
 z8DR0CgOBm9eEoajt9lXGkj7zZFdjpIraJWHHmAGbIdflaGTj5aJWZgu6mXqvERLhhVbOD60
 3sGyPxvAk60zTfHlLro9J1Yzbi0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6135d79de0fcecca19f7472a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 08:55:57
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84CA3C43635; Mon,  6 Sep 2021 08:55:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EF2FC43616;
        Mon,  6 Sep 2021 08:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7EF2FC43616
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
Subject: [PATCH v4 06/10] arm64: dts: qcom: sc7280: Update reserved memory map
Date:   Mon,  6 Sep 2021 14:24:41 +0530
Message-Id: <1630918485-15052-7-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630918485-15052-1-git-send-email-sibis@codeaurora.org>
References: <1630918485-15052-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing reserved regions as described in v1 of SC7280 memory map.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 5e4f4f3b738a..894106efadfe 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -48,6 +48,16 @@
 		#size-cells = <2>;
 		ranges;
 
+		hyp_mem: memory@80000000 {
+			reg = <0x0 0x80000000 0x0 0x600000>;
+			no-map;
+		};
+
+		xbl_mem: memory@80600000 {
+			reg = <0x0 0x80600000 0x0 0x200000>;
+			no-map;
+		};
+
 		aop_mem: memory@80800000 {
 			reg = <0x0 0x80800000 0x0 0x60000>;
 			no-map;
@@ -59,6 +69,16 @@
 			no-map;
 		};
 
+		reserved_xbl_uefi_log: memory@80880000 {
+			reg = <0x0 0x80884000 0x0 0x10000>;
+			no-map;
+		};
+
+		sec_apps_mem: memory@808ff000 {
+			reg = <0x0 0x808ff000 0x0 0x1000>;
+			no-map;
+		};
+
 		smem_mem: memory@80900000 {
 			reg = <0x0 0x80900000 0x0 0x200000>;
 			no-map;
@@ -69,10 +89,24 @@
 			reg = <0x0 0x80b00000 0x0 0x100000>;
 		};
 
+		wlan_fw_mem: memory@80c00000 {
+			reg = <0x0 0x80c00000 0x0 0xc00000>;
+			no-map;
+		};
+
 		ipa_fw_mem: memory@8b700000 {
 			reg = <0 0x8b700000 0 0x10000>;
 			no-map;
 		};
+
+		rmtfs_mem: memory@9c900000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x9c900000 0x0 0x280000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
 	};
 
 	cpus {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


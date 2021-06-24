Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61D93B375E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 21:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbhFXTvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 15:51:43 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:29608 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232900AbhFXTvm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 15:51:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624564163; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=uy2UgJn9VnbimvmS+rn0BPGHZOSoGYR+n4+8dUKKs4o=; b=XjnIoC9JpyqfN806hBwL2PiBOvMerxh7LReRWOc30F4NH0VWSeL/Vq99WjeEe/MjDkqUi5Ca
 C2iSrO5S8jHdv0YjL6ChAzz/p+eRW0RgBVyljlOl7xeSiS/nnt6TSc/23zdpRcwAl/Zlj4PD
 hEorsSZTeH3ZS1GegGd2GTGdea4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60d4e1ac193894195580664b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 19:49:00
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 12B6CC43149; Thu, 24 Jun 2021 19:48:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A7FC9C4338A;
        Thu, 24 Jun 2021 19:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A7FC9C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 6/9] arm64: dts: qcom: sc7280: Update reserved memory map
Date:   Fri, 25 Jun 2021 01:17:35 +0530
Message-Id: <1624564058-24095-7-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing regions and remove unused regions from the reserved memory
map, as described in version 1.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 52 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 34 +++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 3900cfc09562..191e8a92d153 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -30,6 +30,58 @@
 	};
 };
 
+/*
+ * Reserved memory changes
+ *
+ * Delete all unused memory nodes and define the peripheral memory regions
+ * required by the board dts.
+ *
+ */
+
+/delete-node/ &hyp_mem;
+/delete-node/ &xbl_mem;
+/delete-node/ &reserved_xbl_uefi_log;
+/delete-node/ &sec_apps_mem;
+
+/* Increase the size from 2.5MB to 8MB */
+&rmtfs_mem {
+	reg = <0x0 0x9c900000 0x0 0x800000>;
+};
+
+/ {
+	reserved-memory {
+		adsp_mem: memory@86700000 {
+			reg = <0x0 0x86700000 0x0 0x2800000>;
+			no-map;
+		};
+
+		camera_mem: memory@8ad00000 {
+			reg = <0x0 0x8ad00000 0x0 0x500000>;
+			no-map;
+		};
+
+		venus_mem: memory@8b200000 {
+			reg = <0x0 0x8b200000 0x0 0x500000>;
+			no-map;
+		};
+
+		mpss_mem: memory@8b800000 {
+			reg = <0x0 0x8b800000 0x0 0xf600000>;
+			no-map;
+		};
+
+		wpss_mem: memory@9ae00000 {
+			reg = <0x0 0x9ae00000 0x0 0x1900000>;
+			no-map;
+		};
+
+		mba_mem: memory@9c700000 {
+			reg = <0x0 0x9c700000 0x0 0x200000>;
+			no-map;
+		};
+	};
+};
+
 &apps_rsc {
 	pm7325-regulators {
 		compatible = "qcom,pm7325-rpmh-regulators";
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index d1adf64e21e9..5ed7a511bfc9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -42,6 +42,16 @@
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
@@ -53,6 +63,16 @@
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
@@ -62,6 +82,20 @@
 			no-map;
 			reg = <0x0 0x80b00000 0x0 0x100000>;
 		};
+
+		wlan_fw_mem: memory@80c00000 {
+			reg = <0x0 0x80c00000 0x0 0xc00000>;
+			no-map;
+		};
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


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B081B29F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 16:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgDUOdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 10:33:17 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:10368 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729198AbgDUOdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 10:33:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587479596; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zUIxul+MMPfsh12ei00AH3Nxsqj3xaya17Mo9j0h5rs=; b=cwVudUnwrqDmVBV75cB4nuzbfoQOXNd0A6euRk8eMUm6ZFJTTKaEijRHilF5CkO36N2vy9kz
 TwN6zv+iBpfT6jv35Rs6ujqPjFZRHkCWBQzFyyCxW0jBkMqI5oLK1I222L9teza9jUZ/KFXn
 /9CrvRXg6TNqsRIqQaobdDXPLX4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f0424.7fe9faa7e110-smtp-out-n03;
 Tue, 21 Apr 2020 14:33:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79424C44788; Tue, 21 Apr 2020 14:33:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37789C44788;
        Tue, 21 Apr 2020 14:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37789C44788
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com, mka@chromium.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 5/7] arm64: dts: qcom: sc7180: Update reserved memory map
Date:   Tue, 21 Apr 2020 20:02:26 +0530
Message-Id: <20200421143228.8981-6-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
References: <20200421143228.8981-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing regions and remove unused regions from the reserved memory
map, as described in version 5.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V2:
 * move peripheral memory regions to the board dts [Bjorn]

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 53 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 33 ++++++++++++++-
 2 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 043c9b9b50240..5405cde1a32ef 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -28,6 +28,59 @@ chosen {
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
+/delete-node/ &aop_mem;
+/delete-node/ &sec_apps_mem;
+/delete-node/ &tz_mem;
+
+/* Increase the size from 2MB to 8MB */
+&rmtfs_mem {
+	reg = <0x0 0x84400000 0x0 0x800000>;
+};
+
+/ {
+	reserved-memory {
+		atf_mem: memory@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x100000>;
+			no-map;
+		};
+
+		mpss_mem: memory@86000000 {
+			reg = <0x0 0x86000000 0x0 0x8c00000>;
+			no-map;
+		};
+
+		camera_mem: memory@8ec00000 {
+			reg = <0x0 0x8ec00000 0x0 0x500000>;
+			no-map;
+		};
+
+		venus_mem: memory@8f600000 {
+			reg = <0 0x8f600000 0 0x500000>;
+			no-map;
+		};
+
+		wlan_mem: memory@94100000 {
+			reg = <0x0 0x94100000 0x0 0x200000>;
+			no-map;
+		};
+
+		mba_mem: memory@94400000 {
+			reg = <0x0 0x94400000 0x0 0x200000>;
+			no-map;
+		};
+	};
+};
+
 &apps_rsc {
 	pm6150-rpmh-regulators {
 		compatible = "qcom,pm6150-rpmh-regulators";
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 998f101ad623b..65c14a6d13fef 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -69,20 +69,49 @@ reserved_memory: reserved-memory {
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
+		aop_mem: memory@80800000 {
+			reg = <0x0 0x80800000 0x0 0x20000>;
+			no-map;
+		};
+
 		aop_cmd_db_mem: memory@80820000 {
 			reg = <0x0 0x80820000 0x0 0x20000>;
 			compatible = "qcom,cmd-db";
 		};
 
+		sec_apps_mem: memory@808ff000 {
+			reg = <0x0 0x808ff000 0x0 0x1000>;
+			no-map;
+		};
+
 		smem_mem: memory@80900000 {
 			reg = <0x0 0x80900000 0x0 0x200000>;
 			no-map;
 		};
 
-		venus_mem: memory@8f600000 {
-			reg = <0 0x8f600000 0 0x500000>;
+		tz_mem: memory@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x3900000>;
 			no-map;
 		};
+
+		rmtfs_mem: memory@84400000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x84400000 0x0 0x200000>;
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

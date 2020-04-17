Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FE91ADFD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 16:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgDQO0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 10:26:43 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:24037 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727837AbgDQO0m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 10:26:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587133601; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=exe0jDNrYU/8faitGLG2j62JBYVnZ+/ME/RBOzwrR7Y=; b=CiwsMXNsWoAIYzQk0cPaETPZMVxwm7CHOvjA8IOGNYccuiVFpoQPor1M67mAQ2iJApfW8+jn
 +Q6NNgogst28ttfOsUl9x9BUu4grwzyaW0qJ0cxkH7wDv653ppSl1Z3g+MCGJTy75dnLzzQN
 vYwAm8LvvzcZSTLVCpMPEn/kXZU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e99bc9d.7f540a9b5ed8-smtp-out-n04;
 Fri, 17 Apr 2020 14:26:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 63618C44791; Fri, 17 Apr 2020 14:26:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C1D7BC4478F;
        Fri, 17 Apr 2020 14:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C1D7BC4478F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        ohad@wizery.com, mka@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/5] arm64: dts: qcom: sc7180: Update reserved memory map
Date:   Fri, 17 Apr 2020 19:56:03 +0530
Message-Id: <20200417142605.28885-4-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200417142605.28885-1-sibis@codeaurora.org>
References: <20200417142605.28885-1-sibis@codeaurora.org>
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
 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 63 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 83 ++++++++++++++++++++++++-
 2 files changed, 144 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 17eadd80f15de..e613d70cc0198 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -28,6 +28,69 @@ chosen {
 	};
 };
 
+/*
+ * Reserved memory changes
+ *
+ * Keep all modifications to the memory map (from sc7180.dtsi) in one place.
+ * Delete all unused memory nodes and re-create atf_mem/venus_mem/camera_mem
+ * and wlan_mem memory nodes.
+ *
+ */
+
+/delete-node/ &hyp_mem;
+/delete-node/ &xbl_mem;
+/delete-node/ &aop_mem;
+/delete-node/ &sec_apps_mem;
+/delete-node/ &tz_mem;
+/delete-node/ &camera_mem;
+/delete-node/ &npu_mem;
+/delete-node/ &venus_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &adsp_mem;
+/delete-node/ &wlan_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &ipa_gsi_mem;
+/delete-node/ &gpu_mem;
+
+/* Increase the size from 132 MB to 140 MB */
+&mpss_mem {
+	reg = <0x0 0x86000000 0x0 0x8c00000>;
+};
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
index 853ba6e8a53ca..f73ffd74d4fcd 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -69,18 +69,97 @@ reserved_memory: reserved-memory {
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
+			no-map;
+		};
+
+		rmtfs_mem: memory@84400000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x84400000 0x0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		mpss_mem: memory@86000000 {
+			reg = <0x0 0x86000000 0x0 0x8400000>;
+			no-map;
+		};
+
+		camera_mem: memory@8e400000 {
+			reg = <0x0 0x8e400000 0x0 0x500000>;
+			no-map;
+		};
+
+		npu_mem: memory@8e900000 {
+			reg = <0x0 0x8e900000 0x0 0x500000>;
+			no-map;
+		};
+
+		venus_mem: memory@8ee00000 {
+			reg = <0x0 0x8ee00000 0x0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@8f300000 {
+			reg = <0x0 0x8f300000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		adsp_mem: memory@91100000 {
+			reg = <0x0 0x91100000 0x0 0x2800000>;
+			no-map;
+		};
+
+		wlan_mem: memory@93900000 {
+			reg = <0x0 0x93900000 0x0 0x200000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@93b00000 {
+			reg = <0x0 0x93b00000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@93b10000 {
+			reg = <0x0 0x93b10000 0x0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@93b15000 {
+			reg = <0x0 0x93b15000 0x0 0x2000>;
 			no-map;
 		};
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

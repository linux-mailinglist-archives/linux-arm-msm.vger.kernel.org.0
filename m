Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1484649F416
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 08:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346675AbiA1HK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jan 2022 02:10:26 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:29254 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346666AbiA1HKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jan 2022 02:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1643353825; x=1674889825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B3jIxh/VReGXCnnKjt4ZvVQmPhFcUA+BLGS5UUptUXE=;
  b=e3b/xnj3U7Vi3/LBLqF7xn8L2nP5jPVV/3xY8L/88DfIdc1/CFpbAf9U
   AtrYnkGoksEEXHwpkjx4e7KpPEGcbiTFFAlaTu1VDOKXXz4apDxbJ4ja1
   4cNPdyTL+KQgTfl0Fn/wR3qaDnpz4CDcpZAYJlqIDuQXn2eKHMvsaNOOz
   o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jan 2022 23:10:25 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 23:10:25 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 27 Jan 2022 23:10:24 -0800
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 27 Jan 2022 23:10:20 -0800
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [PATCH 3/9] soc: qcom: llcc: Add write-cache cacheable support
Date:   Fri, 28 Jan 2022 12:39:27 +0530
Message-ID: <e533680b3976330115fc5bd49f4c99440eda6a69.1643353154.git.quic_saipraka@quicinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1643353154.git.quic_saipraka@quicinc.com>
References: <cover.1643353154.git.quic_saipraka@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Newer SoCs with LLCC IP version 2.1.0 and later support write
sub-cache cacheable feature. Use a separate llcc_slice_config member
"write_scid_cacheable_en" to identify this feature and program
LLCC_TRP_SCID_WRSC_CACHEABLE_EN register to enable it.

Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index a06764f16023..79fce5a2ff06 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -51,10 +51,12 @@
 #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
 #define LLCC_TRP_PCB_ACT              0x21f04
 #define LLCC_TRP_WRSC_EN              0x21f20
+#define LLCC_TRP_WRSC_CACHEABLE_EN    0x21f2c
 
 #define BANK_OFFSET_STRIDE	      0x80000
 
 #define LLCC_VERSION_2_0_0_0          0x02000000
+#define LLCC_VERSION_2_1_0_0          0x02010000
 
 /**
  * struct llcc_slice_config - Data associated with the llcc slice
@@ -80,6 +82,8 @@
  *               collapse.
  * @activate_on_init: Activate the slice immediately after it is programmed
  * @write_scid_en: Bit enables write cache support for a given scid.
+ * @write_scid_cacheable_en: Enables write cache cacheable support for a
+ *			     given scid (not supported on v2 or older hardware).
  */
 struct llcc_slice_config {
 	u32 usecase_id;
@@ -95,6 +99,7 @@ struct llcc_slice_config {
 	bool retain_on_pc;
 	bool activate_on_init;
 	bool write_scid_en;
+	bool write_scid_cacheable_en;
 };
 
 struct qcom_llcc_config {
@@ -515,6 +520,16 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 			return ret;
 	}
 
+	if (drv_data->version >= LLCC_VERSION_2_1_0_0) {
+		u32 wr_cache_en;
+
+		wr_cache_en = config->write_scid_cacheable_en << config->slice_id;
+		ret = regmap_update_bits(drv_data->bcast_regmap, LLCC_TRP_WRSC_CACHEABLE_EN,
+					 BIT(config->slice_id), wr_cache_en);
+		if (ret)
+			return ret;
+	}
+
 	if (config->activate_on_init) {
 		desc.slice_id = config->slice_id;
 		ret = llcc_slice_activate(&desc);
-- 
2.33.1


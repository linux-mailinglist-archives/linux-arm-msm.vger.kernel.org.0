Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 716635BDD4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 08:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbiITGce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 02:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbiITGbS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 02:31:18 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26485E551;
        Mon, 19 Sep 2022 23:31:02 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K6DpU3031517;
        Tue, 20 Sep 2022 06:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=GydqGb27+64RCFiRn5sh0uPuMhU2BApFJTl+xlbCWOM=;
 b=fBQKD77idpc+UffvssPbQtnIzgosoK7V1BOjew6NGOTF4W+Azbjx2ZL+r0IcfQ8mZx7q
 1V+VttWGTnrnLATHr9OVwmXyQ67JKtBs+x1eKO+rCPMcXqeBEGlT3vdNXLqhsn8qEfDr
 ubsS3r3m7TTsah7OmKKBry76k9xHNLZSRS+S8pCMH/DRnSykO/tbwViMNrsRL8yRBuvf
 HTyMrDHEkpLokEhemKIcpuE1jajdHC2b3zw71TOyr61x34d5vA83c371WxlBBWQgG7g7
 55JceQGBdqB5MNDNndJvy9EdNBqJrXFciJNe0YYSGTSGKrIWWSAJ/nR+QmQl7fUtw94X 8g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jn6bupugj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Sep 2022 06:30:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28K6UL6T000819
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Sep 2022 06:30:21 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 19 Sep 2022 23:30:16 -0700
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <linux-remoteproc@vger.kernel.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh+dt@kernel.org>,
        <quic_plai@quicinc.com>, <bgoswami@quicinc.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v7 7/8] remoteproc: qcom: Add support for memory sandbox
Date:   Tue, 20 Sep 2022 11:59:18 +0530
Message-ID: <1663655359-1402-8-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1663655359-1402-1-git-send-email-quic_srivasam@quicinc.com>
References: <1663655359-1402-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aE3QowJB0Fil-8h0dudq85jnxfEuROOw
X-Proofpoint-GUID: aE3QowJB0Fil-8h0dudq85jnxfEuROOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_02,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200039
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update pil driver with SMMU mapping for allowing authorised
memory access to ADSP firmware, by carveout reserved adsp memory
region from device tree file.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
Changes since V6:
	-- Update smmu map and unmap function names.
	-- Revert adsp_ops const change.
	-- Move iommu check to within smmu map/unmap functions.
Changes since V5:
	-- Remove adsp_rproc_unmap_smmu, adsp_of_unmap_smmu, adsp_of_map_smmu and 
	   adsp_rproc_map_smmu functions.
	-- Remove find_loaded_rsc_table call back initialization.
	-- Rename adsp_sandbox_needed to has_iommu.
Changes since V4:
	-- Split the code and add appropriate APIs for resource allocation and free.
	-- Update adsp_unmap_smmu with missing free ops call.
	-- Update normalizing length value in adsp_of_unmap_smmu.
Changes since V3:
	-- Rename is_adsp_sb_needed to adsp_sandbox_needed.
	-- Add smmu unmapping in error case and in adsp stop.
Changes since V2:
	-- Replace platform_bus_type with adsp->dev->bus.
	-- Use API of_parse_phandle_with_args() instead of of_parse_phandle_with_fixed_args().
	-- Replace adsp->is_wpss with adsp->is_adsp.
	-- Update error handling in adsp_start().

 drivers/remoteproc/qcom_q6v5_adsp.c | 56 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index e463fbc..d89f3fa 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -9,6 +9,7 @@
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iommu.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -48,6 +49,8 @@
 #define LPASS_PWR_ON_REG		0x10
 #define LPASS_HALTREQ_REG		0x0
 
+#define SID_MASK_DEFAULT        0xF
+
 #define QDSP6SS_XO_CBCR		0x38
 #define QDSP6SS_CORE_CBCR	0x20
 #define QDSP6SS_SLEEP_CBCR	0x3c
@@ -333,6 +336,47 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 }
 
+static void adsp_unmap_carveout(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = rproc->priv;
+
+	if (adsp->has_iommu)
+		iommu_unmap(rproc->domain, adsp->mem_phys, adsp->mem_size);
+}
+
+static int adsp_map_carveout(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = rproc->priv;
+	struct of_phandle_args args;
+	long long sid;
+	unsigned long iova;
+	int ret;
+
+	if (!adsp->has_iommu)
+		return 0;
+
+	if (!rproc->domain)
+		return -EINVAL;
+
+	ret = of_parse_phandle_with_args(adsp->dev->of_node, "iommus", "#iommu-cells", 0, &args);
+	if (ret < 0)
+		return ret;
+
+	sid = args.args[0] & SID_MASK_DEFAULT;
+
+	/* Add SID configuration for ADSP Firmware to SMMU */
+	iova =  adsp->mem_phys | (sid << 32);
+
+	ret = iommu_map(rproc->domain, iova, adsp->mem_phys,
+			adsp->mem_size,	IOMMU_READ | IOMMU_WRITE);
+	if (ret) {
+		dev_err(adsp->dev, "Unable to map ADSP Physical Memory\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int adsp_start(struct rproc *rproc)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
@@ -343,9 +387,15 @@ static int adsp_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
+	ret = adsp_map_carveout(rproc);
+	if (ret) {
+		dev_err(adsp->dev, "ADSP smmu mapping failed\n");
+		goto disable_irqs;
+	}
+
 	ret = clk_prepare_enable(adsp->xo);
 	if (ret)
-		goto disable_irqs;
+		goto adsp_smmu_unmap;
 
 	ret = qcom_rproc_pds_enable(adsp, adsp->proxy_pds,
 				    adsp->proxy_pd_count);
@@ -401,6 +451,8 @@ static int adsp_start(struct rproc *rproc)
 	qcom_rproc_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 disable_xo_clk:
 	clk_disable_unprepare(adsp->xo);
+adsp_smmu_unmap:
+	adsp_unmap_carveout(rproc);
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
 
@@ -429,6 +481,8 @@ static int adsp_stop(struct rproc *rproc)
 	if (ret)
 		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
 
+	adsp_unmap_carveout(rproc);
+
 	handover = qcom_q6v5_unprepare(&adsp->q6v5);
 	if (handover)
 		qcom_adsp_pil_handover(&adsp->q6v5);
-- 
2.7.4


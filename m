Return-Path: <linux-arm-msm+bounces-36969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCAA9BBA3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 17:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A57931F22714
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 16:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261E51C82F4;
	Mon,  4 Nov 2024 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FFjajYEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C81C2339;
	Mon,  4 Nov 2024 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730737276; cv=none; b=PaTUIm4Hkn56pDseVLMOkdtbce0AG6+M2JcLYofJzuEX6ZTIqJC3rdfB2Raf9yh4s7gbtrTZcwSKvxF+XHlX85sCjeg0Pv2q4PNrL3XMUtYMeSntmuVekEiwQoiyMMV4mB8fcCr0JfhkXkL2dQA4eeWbUfRlQ9h8A9ENsp3PLYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730737276; c=relaxed/simple;
	bh=+a58vvypkDmsdRRhxdbS5smwmSCdolOtlAwqCVf8ICU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iBP7DCrHb9mfxYiOWbWY0zzgIknuDCLYShgqWZlm/d8vjiKWMNRwNFNEoe2roIQ3bPZMIFMhoIA28VgCe0NqSSuuyTgpkKuQaPBKnbg7/RsjVYJqBlPhwzATkg2OaWlPvmkg07uY1Z6+HDLNn2NVvEdimE7BtDHsPyCCj6cjPRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FFjajYEA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4AiF2T024363;
	Mon, 4 Nov 2024 16:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RMKmCINh8jc
	Jl65Hud0EMigbRbEQB5GA66fUtmVDuxo=; b=FFjajYEAcgakWH5829vJbsoQ7CG
	cX/LRuTvX2RJiRjWu9SpR4f1RAfCF2nV25Pm/186CDH+Pi12AXq0xmuMJto4a81B
	Ehj0lhjiVU4gMlOBHLecBwaek39ckTQXWKWWLXILGM1cv/+K6r6FkpCj3x5BINMK
	3rZSlDyLmZkf6eXexVJyWem6/+IDDILV4R6IeDW2MgeXkaOd8n0MkjqMrH5kWN5y
	jxt7OUX3e6Whju8y9skCOEw4qDR+Zfm7o+jYIZYn3iSIEWPxIrIdik1Z8HlH0shF
	/KqEBaitDpalagKKM7iqCTGIbEnv5S8Y7THp6x9soEZSK51TCrVjqRiWGLA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd8hcqvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 16:20:59 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4GKAwh032468;
	Mon, 4 Nov 2024 16:20:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 42nd5m2t1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 16:20:59 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A4GKwMW000890;
	Mon, 4 Nov 2024 16:20:59 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4A4GKwEe000887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 16:20:58 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id C475F641; Mon,  4 Nov 2024 08:20:58 -0800 (PST)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
Subject: [PATCH v3 1/2] firmware: qcom_scm: Add API to get waitqueue IRQ info
Date: Mon,  4 Nov 2024 08:20:55 -0800
Message-Id: <c8179357049e3ee800194de50225d076ed3fba7a.1730735881.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730735881.git.quic_uchalich@quicinc.com>
References: <cover.1730735881.git.quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u4QeLECsrL5cXaKaauxBWa27DPpgG6VQ
X-Proofpoint-GUID: u4QeLECsrL5cXaKaauxBWa27DPpgG6VQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411040138

Bootloader and firmware for SM8650 and older chipsets expect node
name as "qcom_scm", in order to patch the wait queue IRQ information.
However, DeviceTree uses node name "scm" and this mismatch prevents
firmware from correctly identifying waitqueue IRQ information. Waitqueue
IRQ is used for signaling between secure and non-secure worlds.

To resolve this, introduce qcom_scm_get_waitq_irq() that'll get the
hardware IRQ number to be used from firmware instead of relying on data
provided by devicetree, thereby bypassing the DeviceTree node name
mismatch.

This hardware IRQ number is converted to a Linux IRQ number using newly
defined fill_irq_fwspec_params(). This Linux IRQ number is then supplied
to the threaded_irq call.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 52 +++++++++++++++++++++++++++++++-
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..ec1205474a3a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -11,6 +11,7 @@
 #include <linux/completion.h>
 #include <linux/cpumask.h>
 #include <linux/dma-mapping.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -35,6 +36,11 @@
 
 static u32 download_mode;
 
+#define GIC_SPI_BASE        32
+#define GIC_MAX_SPI       1019  // SPIs in GICv3 spec range from 32..1019
+#define GIC_ESPI_BASE     4096
+#define GIC_MAX_ESPI      5119 // ESPIs in GICv3 spec range from 4096..5119
+
 struct qcom_scm {
 	struct device *dev;
 	struct clk *core_clk;
@@ -1830,6 +1836,50 @@ bool qcom_scm_is_available(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_is_available);
 
+static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
+{
+	if (virq >= GIC_SPI_BASE && virq <= GIC_SPI_MAX) {
+		fwspec->param[0] = GIC_SPI;
+		fwspec->param[1] = virq - GIC_SPI_BASE;
+	} else if (virq >= GIC_ESPI_BASE && virq <= GIC_ESPI_MAX) {
+		fwspec->param[0] = GIC_ESPI;
+		fwspec->param[1] = virq - GIC_ESPI_BASE;
+	} else {
+		WARN(1, "Unexpected virq: %d\n", virq);
+		return -ENXIO;
+	}
+	fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
+	fwspec->param_count = 3;
+
+	return 0;
+}
+
+static int qcom_scm_get_waitq_irq(void)
+{
+	int ret;
+	u32 hwirq;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_WAITQ,
+		.cmd = QCOM_SCM_WAITQ_GET_INFO,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+	struct qcom_scm_res res;
+	struct irq_fwspec fwspec;
+
+	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	fwspec.fwnode = of_node_to_fwnode(__scm->dev->of_node);
+	hwirq = res.result[1] & GENMASK(15, 0);
+	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
+	if (ret)
+		return ret;
+	ret = irq_create_fwspec_mapping(&fwspec);
+
+	return ret;
+}
+
 static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
 {
 	/* FW currently only supports a single wq_ctx (zero).
@@ -1986,7 +2036,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	/* Let all above stores be available after this */
 	smp_store_release(&__scm, scm);
 
-	irq = platform_get_irq_optional(pdev, 0);
+	irq = qcom_scm_get_waitq_irq();
 	if (irq < 0) {
 		if (irq != -ENXIO)
 			return irq;
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 685b8f59e7a6..ab0f88f5f777 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -143,6 +143,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 #define QCOM_SCM_SVC_WAITQ			0x24
 #define QCOM_SCM_WAITQ_RESUME			0x02
 #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
+#define QCOM_SCM_WAITQ_GET_INFO		0x04
 
 #define QCOM_SCM_SVC_GPU			0x28
 #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-30138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303019652B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 00:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD616283EFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 22:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBEB1B86CF;
	Thu, 29 Aug 2024 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QRbu8Lw8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2528618C006;
	Thu, 29 Aug 2024 22:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724969763; cv=none; b=W2c3QPeSNWEmyB1oHDOnJwwvN6IEd12cRtELtl7ChPJLanhLQZ0ZTL5P1Q/YKfh9R4ahgs5iLWo2fKN9qvhGpmJAMOtKXxI4JSzKC6iz2yJKiH4i++MLuzUbj7JNbZgx471MarWQ8pdi5UTbmmIdqkEtMU+6N6VJB/rUDGFhLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724969763; c=relaxed/simple;
	bh=M/RpNMSWxIigNmRDXEMFXeDF06wxssHdf4YOhVqz82g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PthSGa/4q3O2FlwMRn4K+7VQFf+CzQD0O5sO639evT2e7tSEFVAyF9K8BgbDOu6LwWzbdE+Jiw+F+9NbleYcxqwEgS6hdIgO/RQv5jDv/J6bQQUMGuUDAZSzjJVIiwQmtiZOpGrDImpvVL7c9zxWwJOQ69QQUEdMAAF3NpzFMJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QRbu8Lw8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGK3wn005704;
	Thu, 29 Aug 2024 22:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0UFqn4g3c5c
	1UjQgpfwzx/uBmcbEhjJv4GIaLqJUCu8=; b=QRbu8Lw8cRd0UIgqSTXb9uh1K2l
	G0IWSvLLSrO9C3GIuE3WudM6uMzaH0UFw2cagPbxjbO0zg1EWLffp4Fortoz9qVO
	opn2l+4XgPg3S9zE51N9nO+jslv2+JZk2A1hMSs7ogQTczhYNmuagLdyrFOCDgcO
	R0/0pA3NXWEvNT/nBkvvxlQBMGQY6o60rSBAxjSK7sbJ0hUUom4UPLvfA1PjvtmL
	2SlRakvycT2/H9LZnHyDEn9TeiO8f5pF3d6dIdROFwf88N41/5ONK4xsw/90kuJp
	hOo+5VND872/UXgypHnPNtztyruCyXl0eojPBup9LORu24dpVP0ShCCjxrQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putxups-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 22:15:58 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 47TMFwZt024654;
	Thu, 29 Aug 2024 22:15:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 41a69p3p5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 22:15:58 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47TMFwSi024644;
	Thu, 29 Aug 2024 22:15:58 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 47TMFv1t024642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 22:15:57 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id D6579639; Thu, 29 Aug 2024 15:15:57 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
Subject: [PATCH v2 1/2] firmware: qcom_scm: Add API to get waitqueue IRQ info
Date: Thu, 29 Aug 2024 15:15:54 -0700
Message-Id: <9acc746885d6b06c2333f0493413c44b85fa7f02.1724968351.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724968351.git.quic_uchalich@quicinc.com>
References: <cover.1724968351.git.quic_uchalich@quicinc.com>
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
X-Proofpoint-ORIG-GUID: lV10gWogBYpM0TzvNX0_SMQI13ZQVAxa
X-Proofpoint-GUID: lV10gWogBYpM0TzvNX0_SMQI13ZQVAxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290158

Bootloader and firmware for SM8650 and older chipsets expect node
name as "qcom_scm". However, DeviceTree uses node name "scm" and this
mismatch prevents firmware from correctly identifying waitqueue IRQ
information. Waitqueue IRQ is used for signaling between secure and
non-secure worlds.

To resolve this, introduce qcom_scm_get_waitq_irq() that'll get the
hardware irq number to be used from firmware instead of relying on data
provided by devicetree, thereby bypassing the DeviceTree node name
mismatch.

This hardware irq number is converted to a linux irq number using newly
defined fill_irq_fwspec_params(). This linux irq number is then supplied to
the threaded_irq call.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 59 +++++++++++++++++++++++++++++++-
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 00c379a3cceb..ed51fbb1c065 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -32,6 +32,14 @@
 #include "qcom_scm.h"
 #include "qcom_tzmem.h"
 
+#define GIC_SPI_BASE            32
+#define GIC_MAX_SPI             987  // 1019 - 32
+#define GIC_ESPI_BASE           4096
+#define GIC_MAX_ESPI            1024 // 5120 - 4096
+
+#define GIC_IRQ_TYPE_SPI        0
+#define GIC_IRQ_TYPE_ESPI       2
+
 static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
 module_param(download_mode, bool, 0);
 
@@ -1819,6 +1827,55 @@ bool qcom_scm_is_available(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_is_available);
 
+static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
+{
+	if (WARN(virq < GIC_SPI_BASE, "Unexpected virq: %d\n", virq)) {
+		return -ENXIO;
+	} else if (virq <= (GIC_SPI_BASE + GIC_MAX_SPI)) {
+		fwspec->param_count = 3;
+		fwspec->param[0] = GIC_IRQ_TYPE_SPI;
+		fwspec->param[1] = virq - GIC_SPI_BASE;
+		fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
+	} else if (WARN(virq < GIC_ESPI_BASE, "Unexpected virq: %d\n", virq)) {
+		return -ENXIO;
+	} else if (virq < (GIC_ESPI_BASE + GIC_MAX_ESPI)) {
+		fwspec->param_count = 3;
+		fwspec->param[0] = GIC_IRQ_TYPE_ESPI;
+		fwspec->param[1] = virq - GIC_ESPI_BASE;
+		fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
+	} else {
+		WARN(1, "Unexpected virq: %d\n", virq);
+		return -ENXIO;
+	}
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
+	hwirq = res.result[1] & 0xffff;
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
@@ -1936,7 +1993,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
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



Return-Path: <linux-arm-msm+bounces-36973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D18809BBCBC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 19:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22AF2B22D1F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 18:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733F01C8788;
	Mon,  4 Nov 2024 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b3XPW24x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7C224F0;
	Mon,  4 Nov 2024 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730743307; cv=none; b=EJZ4UqhqlLF0fNh7h8cX+R/F83CLUQ7QcLBywuIyOmHAQdjpo+0zQUXjVjucgjLa7yGtOXlvsSX1Iy8aVK5njvEP6z5nU8zEOeG7F+QVKNZxfOw08vbwCCOQH0yJ97EI5du5zWtBlJ+0+AaCpG+3TgwdW2NooN6OX8/4YmV6lKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730743307; c=relaxed/simple;
	bh=ddnuXxmZiP/t75TQ4cPkJGpSNLePbTTPyHHfhAZ76zQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bJ/jAIP4MQabnsA7aOSo2oLfKCO104MjY/NJpdtdNVR2q3hMjNdP4k5/y2xe7XoeBTIilVBInMOM8Sv3cg9TxTnWoE/GQyy/cZRufD7634QnOToArCK6XCbK3QB41LMlyj31ptkCRt5k/Jlf0oOBJudoXJ6zFmhhzgElgBbcKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b3XPW24x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BjXrb013477;
	Mon, 4 Nov 2024 18:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nbbdy95tuKl
	TrOS2QW/AfNDw950l9USl4cRU9DKdPaE=; b=b3XPW24xeDb4SknheyFCfAI1FK6
	60YxI0pFmDP4s8iJBtHXeiq03S1kQPSoTmiFNjoCe3NCed1fggebsCGBlNWWvSDj
	CTpxUh6nGa8ondJaKIlhdYK1V51eM3JxpkM9BVKhi5A1EOZBfca2zBkvkpzWqQsy
	f9PtLfE2snC+sp6cNxiRpVy/G//2b5MkvxW/Hx1VzHSpeN2ZqFzYtgCSXR/jND8d
	GNGLyTpfDAKm1Brdj95pXrmqHRbfVT1lusls+mWNlxlRYQS7jFbsBdJ0bQbqtWxx
	gm6zW8Q6YkF80JaI75U/3p8xs3kp+vvsCVn6fEXbo3yPkHIpLFnejVGjyuw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4un45j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 18:01:41 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Hv6Tx013273;
	Mon, 4 Nov 2024 18:01:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 42nd5mugj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 18:01:40 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A4I1eV8021157;
	Mon, 4 Nov 2024 18:01:40 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4A4I1eI1021155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 18:01:40 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 84CA1641; Mon,  4 Nov 2024 10:01:40 -0800 (PST)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
Subject: [PATCH v4 1/2] firmware: qcom_scm: Add API to get waitqueue IRQ info
Date: Mon,  4 Nov 2024 10:01:37 -0800
Message-Id: <eb9877fbf7fa9d96ed966c0ad6d01dbfd44259e2.1730742637.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730742637.git.quic_uchalich@quicinc.com>
References: <cover.1730742637.git.quic_uchalich@quicinc.com>
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
X-Proofpoint-GUID: WjIaWw5hi28YBKeQjdAupGAGo1laWVfa
X-Proofpoint-ORIG-GUID: WjIaWw5hi28YBKeQjdAupGAGo1laWVfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040149

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
 drivers/firmware/qcom/qcom_scm.c | 54 +++++++++++++++++++++++++++++++-
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..4cffd0684b78 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -35,6 +35,14 @@
 
 static u32 download_mode;
 
+#define GIC_SPI_BASE        32
+#define GIC_MAX_SPI       1019  // SPIs in GICv3 spec range from 32..1019
+#define GIC_ESPI_BASE     4096
+#define GIC_MAX_ESPI      5119 // ESPIs in GICv3 spec range from 4096..5119
+
+#define GIC_IRQ_TYPE_SPI     0
+#define GIC_IRQ_TYPE_ESPI    2
+
 struct qcom_scm {
 	struct device *dev;
 	struct clk *core_clk;
@@ -1830,6 +1838,50 @@ bool qcom_scm_is_available(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_is_available);
 
+static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
+{
+	if (virq >= GIC_SPI_BASE && virq <= GIC_MAX_SPI) {
+		fwspec->param[0] = GIC_IRQ_TYPE_SPI;
+		fwspec->param[1] = virq - GIC_SPI_BASE;
+	} else if (virq >= GIC_ESPI_BASE && virq <= GIC_MAX_ESPI) {
+		fwspec->param[0] = GIC_IRQ_TYPE_ESPI;
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
@@ -1986,7 +2038,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
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



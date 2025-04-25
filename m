Return-Path: <linux-arm-msm+bounces-55790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473CDA9D65E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 01:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A2614C5A38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 23:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5C9297A68;
	Fri, 25 Apr 2025 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgvFntlW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C6225E448
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624893; cv=none; b=HmeC9Yu/4sO/cDNKorW97rSMHx2EqGdsiA9W43MjXARFWXBOWMq0wuHewgpzZWxoeMhXtCvWk6cj8uRIuRwmE019x87n+qUST7BP8DhFPip1lwpMM61i6iA4ZhZhfb9PwDFpHMVqGP+VZTlUTaaMEe3H9QWVYwVlJ4QzmwIEfDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624893; c=relaxed/simple;
	bh=HwSmczY1BPfAzd6mqaQZTmW0WxFuAC6Q6eQmyL2FVcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACvm9W50CJVY9dS9h6cBKQEX/SOWlH5JVcIb/2gJcxHqs56UaGVtJcOTR57I9qs16CV6bNHaHrKEVtm8nzcbNHLvalVNT319qQtvlrYiO6wzFerlOK5SATa2fJWuItEUBJOn2HopHbeJ+oNm+IG9MB2ua8cvpqcUd08B4TR1rCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgvFntlW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJv2A032005
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7gZa73dpF26SkhvPxVhZQa4YDow7tdo2+PqHj6dpVRM=; b=MgvFntlWJRBpjfj1
	ctyOM+dV02WzYZTULRX4rG0IGA/Lva9BBRCGquFX7cfq1gz/5YgwWq3caYnmZxK7
	9IW3rK28YPTTVCpUW2pKZ2CY5TS0a4dYVxTwCFQxB6SKp76FZeufdVHGzwnDRpO7
	SlINXOzntXTtJW1Rv/BSACQ8C4QSEjZ4Hpoyt3IrvhIm+FUAjIauujSi9RoT9FUK
	zIyBVUeZsrR96hYA/xLWTIbCMARtUcUo3hIn/ZpwiMtG8vVR99au7UGkhLV8Y4Bv
	xt+pEbly4mHCUqQdjLtuJsMYOZT6HWqtw3PeIjK05vhbcOGYKUp2yyPHXnBwoAU9
	z0lSGQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgyagjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af5156fbe79so3155316a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745624888; x=1746229688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gZa73dpF26SkhvPxVhZQa4YDow7tdo2+PqHj6dpVRM=;
        b=FGjQxq7Zx6jPiw5/Xeg5aaNr7WfzKsN/DaQhlfC0SsnWzomQnFLvMhn0YP78t56Nqe
         gvcWtWXP3oc6BGuz5nf3HdJEZiYObikqZFeF7aN4oTNuDb+eiFghT4qDQNH4sftwKnOJ
         r5DYGcAziSKMh6jfvCUzLZaAGVmvfTjOBqK+EfXB3dOdlNIN+mvD7Lbgdsnm6ZmhtunG
         2TOScWUnDbt2lnHnARoanpxVCEMT3OkUtLev7Vjzkf7lfkL3EWXnfoFHtHxLSfIXsBU1
         V85c44vtYGWIyyAu3igau3SUDTIZg5Ogr/9od+j0EGxEbSW9DyUvsI2KiA/NxELnKWmH
         61YQ==
X-Gm-Message-State: AOJu0Yz/mCiTupjvo4bChI8gDIZAljzfX3GWIbEaiURzbC7k5QlSFmK3
	6ASLvy4jpNMokHojG9pTWP46VHKTOqO4xFNZsgkZgmIgTx9PuuwsvB4/jprZgZanrOmcp/9jX7R
	ZGic4RSD8wiGgrdjkRtD420jp2sSuoykBsIyv4IduC6kSve7hHoIJ9ScCkocqk3lqbQWcAdOx
X-Gm-Gg: ASbGncvygxTa/9yfmz67+wXz0MScFawmr1N1HHH1rhPikOO8rB0Sjw5Y5nLSxE/v5Cc
	CSxewrkAMa1juxP7JFSSFSqf60MRCVAPB5tjIupDkg/VF4OHvr2IVSRh9jYS+xlOz5y3uAoHslX
	9BdWu/onPrzrGNFszZil06T9VyGhvxlz/NBrr0bnE2nEwdL9nYHDQdqai/9iyvTzJSd+e9r2sHj
	kj68E5mxXO1oTL3f8Dhzj67yvAfQ7CLHD7+uouv4BO2+0PYIA4VPadzoSUiPVvhcYABIwXGdYKf
	BG6wNxPiOqeraVgZjiHzx/AXl8g68YWmxEOmh4YvAsxq1X9K4UqtTbjfG8dfN/RK37577Pl6UYW
	2Umo=
X-Received: by 2002:a05:6a20:3d93:b0:1f5:63f9:9eb4 with SMTP id adf61e73a8af0-2046a6f0de3mr1519269637.35.1745624888487;
        Fri, 25 Apr 2025 16:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwrDEc6Ma5eNwTZjAnXvfiCHVusufWG0jmBbY9U2tOihoJatkfDj4bF2BySc0j/Qd+JYlreg==
X-Received: by 2002:a05:6a20:3d93:b0:1f5:63f9:9eb4 with SMTP id adf61e73a8af0-2046a6f0de3mr1519243637.35.1745624888056;
        Fri, 25 Apr 2025 16:48:08 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a308sm3868948b3a.136.2025.04.25.16.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 16:48:07 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 16:48:01 -0700
Subject: [PATCH v6 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-multi_waitq_scm-v6-1-cba8ca5a6d03@oss.qualcomm.com>
References: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
In-Reply-To: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745624885; l=4335;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=HwSmczY1BPfAzd6mqaQZTmW0WxFuAC6Q6eQmyL2FVcg=;
 b=uDBkoWIyiXlYh0Cny/rX2dEV+G7u6bEMULbDg3HWxfc5BNFsYGmpNODZ8wpdviHmeNUdCLEj/
 IXbMilpSbdRBhR8zZJng++qWgGrvusNCJ30TkEe4tS0zSgsGNVmWm9T
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3MiBTYWx0ZWRfX899wdmxlQIrl 9uLjbe7tcmd1dEjH7gIHBVJc0189BvkquukMAfBTPzYk5tmeXbufzHlet1YBSkKGfR+CBfDGvoM WYV2dR0tYfkCAdzD0dsaFxQX/k/vqD0SjhfMMnBanTf7EE+gg7un+Bh9iUyJquBxYGybs5avPIp
 g2+v7qI3Yk4eG7oRMcp0fnxeokbZNWvW3YWFsVq5+XWqNGw5gC0kSnUnGn/6ES7/bYahx7vdtjN KYR1hNZl/byrYdvK7BIVfSlMalR656F28BpsnGayyjbN+J8Hq6WV/UK/IdWSPIybAvdCJ/yVGCH o9Oqweezzza8R/qj9J/wWeGg8Gdkdlv28rXxUGjeV0SPhIiCDuQ5biZ/d3hzkwno8G2M24Llidy
 41gSCBjzZn7EKtTElDoKVTs+PPh1wEb8HVXFZ+mv353YeqQ1X9caVlOG1cXFW1QsmWU5u3Om
X-Proofpoint-GUID: JKTHXMzAEoZGp3zQ69Ka_vEiwo0S07Zo
X-Proofpoint-ORIG-GUID: JKTHXMzAEoZGp3zQ69Ka_vEiwo0S07Zo
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680c1f3a cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BWC7kBQSOfkspHPoMaoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250172

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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 60 +++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a67efc77e0135c06db47bc14d0aeaa..529e1d067b1901c4417a1f1fd9c3255ee31de532 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -29,12 +29,18 @@
 #include <linux/reset-controller.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 
 #include "qcom_scm.h"
 #include "qcom_tzmem.h"
 
 static u32 download_mode;
 
+#define GIC_SPI_BASE        32
+#define GIC_MAX_SPI       1019  // SPIs in GICv3 spec range from 32..1019
+#define GIC_ESPI_BASE     4096
+#define GIC_MAX_ESPI      5119 // ESPIs in GICv3 spec range from 4096..5119
+
 struct qcom_scm {
 	struct device *dev;
 	struct clk *core_clk;
@@ -2094,6 +2100,55 @@ bool qcom_scm_is_available(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_is_available);
 
+static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
+{
+	if (virq >= GIC_SPI_BASE && virq <= GIC_MAX_SPI) {
+		fwspec->param[0] = GIC_SPI;
+		fwspec->param[1] = virq - GIC_SPI_BASE;
+	} else if (virq >= GIC_ESPI_BASE && virq <= GIC_MAX_ESPI) {
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
+	struct device_node *parent_irq_node;
+
+	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	hwirq = res.result[1] & GENMASK(15, 0);
+
+	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
+	if (ret)
+		return ret;
+	parent_irq_node = of_irq_find_parent(__scm->dev->of_node);
+
+	fwspec.fwnode = of_node_to_fwnode(parent_irq_node);
+
+	ret = irq_create_fwspec_mapping(&fwspec);
+
+	return ret;
+}
+
 static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
 {
 	/* FW currently only supports a single wq_ctx (zero).
@@ -2250,7 +2305,10 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
 	smp_store_release(&__scm, scm);
 
-	irq = platform_get_irq_optional(pdev, 0);
+	irq = qcom_scm_get_waitq_irq();
+	if (irq < 0)
+		irq = platform_get_irq_optional(pdev, 0);
+
 	if (irq < 0) {
 		if (irq != -ENXIO) {
 			ret = irq;
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 097369d38b84efbce5d672c4f36cc87373aac24b..7c6cb3154b394ab910bf7775a5ae07a28e0b57a5 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -148,6 +148,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 #define QCOM_SCM_SVC_WAITQ			0x24
 #define QCOM_SCM_WAITQ_RESUME			0x02
 #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
+#define QCOM_SCM_WAITQ_GET_INFO		0x04
 
 #define QCOM_SCM_SVC_GPU			0x28
 #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01

-- 
2.34.1



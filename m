Return-Path: <linux-arm-msm+bounces-49811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F014A49103
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 06:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1190418940B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2191C07F5;
	Fri, 28 Feb 2025 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkQlrIJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB437E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740721110; cv=none; b=ZMqn5AFctcFnLFmBf9Z57+fzNYab/oedSJ/u1V1LIbT6Yr/AV/h2vEy0qHE8Lrz7+Kv66/z7lcyFmPwnisRvLQjpwGiofKPvvjY2wQuPYV2PSjlpK44+hIIqKIBzFyh61voS8Uc7RDUHn020yR47SMyqnCwzR4WVlP0h2teAEO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740721110; c=relaxed/simple;
	bh=OqK+6bYKkV3iT+dYNoLFz1KU+sVRWlpSWMpzlk1uVVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjrMR92S0BDPQd/miLKX9FIoOUVrgs/cM7vPC6Gu7uVpc0ZbxuPRpSSW9cWh2XkKxd7K+ijsxXwxoIdz7ZNWAMyEoEx5AVVbc2igl4yEuGtBELe5SHtS0LbLFMkizkPXnQwbOWvdivz7r+9ZO82bxazDrSQ9tSiemKN7k5RAoFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkQlrIJl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RK9IRv017235
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeAUBEezRSTqnZ8QQPEqbP99bmXnWBvR5yC22Rhg6zI=; b=LkQlrIJlu4Q1J2tw
	28GQlaC9NA+W6HLjLTouu4LP5cIZd5zu7+t5VTv35CHDhLbYA6wnj8o+CKDXayAb
	Y+ykWspQ8OugsTjoQTKPF2Cv+qHJndWlm/HP3tH0kPppWijYBt5ueNSS6GioYdfp
	+wSZB4Z5eeIIXrtsZBQM1FKUS7qput7snikVR+4NkKFBDT1bXUqmRBfuBdtoGrBu
	gVbY6yHFp6X7BSeZNrmD6TXK8gH3mCU3OBOO7+3ylrSszEcFx4LbuETeL4cHvW7/
	VhnuR/KLHt9jdHX6+Nb+HpAbGzZpUzVGHfRtMtJJntBCL4ZaB+wNbfIeM68yksr6
	SPbxNQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452nqkjy1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:38:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2235a1f8aadso22005055ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 21:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740721107; x=1741325907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeAUBEezRSTqnZ8QQPEqbP99bmXnWBvR5yC22Rhg6zI=;
        b=dimMLDWoQepIQ9rASCMNd+OD3TIw+KL2Qxlis+VXpJjLhCAaKMFO7qghbHClwoZtEq
         ApJUx3K7IAlrxK2AujGe543A+goPMieJuAmXdv0ps8GnGNKab3jClLEvWoEpyiG2wTjK
         wlAFMFT3B042pvz+oJWVUbkVKLIC+QppWUbWCfvwq1ac2RDV3Azk8sNglul3c6rFmm4I
         psQFD72wrd8WqcPzQdLHE41lNC6c946R0MwFV7jJc8Nlf3HOJeDv6Afy0uoUqtCAYPSI
         pVNGrFXWos7YzJurtTgaTv3Hvnn8XVyGrmVU3VGlF8179O7cfgd4W5VtyLnRauUnzs1B
         r7uQ==
X-Gm-Message-State: AOJu0YwB5Ty9zYpt2rDcWIE2xoDw+r45Hx/mg4FJbykYq1uFJjH+zPfr
	62EKADpkizKtYebbhWkDtyrUdlhuIQbomyrmyV5Za8s6xQa9FO1cqEw7v//83U80cESIdx99pOt
	Dxb2DBTMkOqJwuvxoAJ0+RIZo8AMUii/GGGOhrJJrV97iSINBNXhXcv+7IDnVTeDl
X-Gm-Gg: ASbGncuaLr4sbfz4c9lWVD1gH12R8S3qaXgBV5tyiJfeY6iKWZwGqxH2FiGg5V+s7uP
	MI6vai0qZ3kaTSa9owWjdHx+sc55bpGnQsBZ4NNbyoa4JRduUwKzl2cZehqGXX4SLlOJlSsrpaB
	cPXuheimiKBU9qiOQfsiPNkFUy4EeHwVE6VTlo3Fi3B1RbnK3Dwb/6egFzseyF48awX28Fb/2g1
	R8cJzGHbeI/SoTunG6+x/fGcdykDedcnoJFkClDR5kw038Ezq3NYgQJdZfL4p6nwCJSg5DhYGlX
	HNEIiq/D35ZnzecoF+eRDsRBPXSbuDqe4AIMyiW8Vek8PPlJRTOhApiGQWgDj/PWls3yViHuRI6
	77LbhXdw=
X-Received: by 2002:a17:902:c948:b0:223:54e5:bf4b with SMTP id d9443c01a7336-22368fc9865mr32473935ad.25.1740721106995;
        Thu, 27 Feb 2025 21:38:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgV5VKVwopKTgY9qRNq4iqjChng95qgtYe6decZunYu96Dhn4SJhSTPcTp49FIb5Tf5GVDUA==
X-Received: by 2002:a17:902:c948:b0:223:54e5:bf4b with SMTP id d9443c01a7336-22368fc9865mr32473555ad.25.1740721106554;
        Thu, 27 Feb 2025 21:38:26 -0800 (PST)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc86esm25058925ad.172.2025.02.27.21.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 21:38:26 -0800 (PST)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 21:38:16 -0800
Subject: [PATCH v5 1/2] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-multi_waitq_scm-v5-1-16984ea97edf@oss.qualcomm.com>
References: <20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com>
In-Reply-To: <20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740721104; l=4268;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=OqK+6bYKkV3iT+dYNoLFz1KU+sVRWlpSWMpzlk1uVVU=;
 b=/FjwIud489kNkvfzeN/1ib3iISgcoC/q4fUHrnRY1SIb44gIOblUXga/9qYO6EC7ItfVL17LL
 S2TqzfOG+NMB1DRGuG3paI/CAJrklKU3Wusj36ZLDyg8sYXW6RKnKgF
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-ORIG-GUID: tw381hv6G_dAqVdFe2FPeh1VtZPsvJ6D
X-Proofpoint-GUID: tw381hv6G_dAqVdFe2FPeh1VtZPsvJ6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280038

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

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 60 +++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f0569bb9411f7175c97a4ede50b3775fece330cf..1aa42685640da8a14191557896fbb49423697a10 100644
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



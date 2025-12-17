Return-Path: <linux-arm-msm+bounces-85532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6AECC8393
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E5CE300B33A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889793A4ED1;
	Wed, 17 Dec 2025 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKReiNaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxxIDk5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA96033D6D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765982089; cv=none; b=Jz7w6YewF5ccRerVT9BnAjl0XdhY4awNA/zDizLLi0i7Fnu16yKhb3nw9zY/RI4aLN5ZVUtp1oVKcoDYIksQXuTNgmfMIGUG6yiAaFPA7da1hCxe7sPet6lUIvYSzEs3R8Fp7XDiqTWtUS8HZI4sHH6BXLKk6EXP6Z3uj9CBQOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765982089; c=relaxed/simple;
	bh=rv7a8HTbpagXq5CbqlBlG+4dVybo4RrSksM/IQFlae4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nu61naeaxztM/ihwu1GQXq9bGCHim+o9zg10H0L6ohdj7hYf+OiLtdQYQq0kCC5mjZb6U37cB/8Ov+cssWbMsZmjCB7yJl3zIUckci/g9RwcHImsgCsM9jMfeooNlvyTd/rdJN8t0TvTjoSO5/ds7551Rkf9vmvIas1u8YmnIp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HKReiNaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxxIDk5I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL7PB2503121
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frK0DQVLHreroSMSFB37phaXvuA6Eoc2Hn3hapEL7Y0=; b=HKReiNaXexsH4oHs
	Rs0PBqiU7dEUS/A6sFYdsGnuVnSEDtSrpyU3QSauWIcAguuCeupZhJjaeA7NfhKN
	sRz8u3t583utThsYUyb2sc9m7XuJBAUyM0+OJfNjLaZnUEIK7pHqClU5ADfEWhbo
	QVUwetgbxpv/uP89twtuqIKSqxJuRfpB1kNS8y0Y/tm2Mqdfe1FZKZOqluxwndq5
	trU2GEHM1tUGULslKuDtDXeBfGgKD2AjVxlsnma8y1On8R8daB++yN/1X7Oy67VY
	/apAyGDdL/7zFydpKIE59iJXuSHOV7tnbEjddAfJ/xFfwRQ7yonDSZmRQnJuvcbz
	wPIxYA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqa97fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34abec8855aso10862525a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765982083; x=1766586883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frK0DQVLHreroSMSFB37phaXvuA6Eoc2Hn3hapEL7Y0=;
        b=hxxIDk5InMkLIOLwQubje/uETjdOJVZz7LUTkanxzZhuHsmAAFWuphOi7qEPQw3G9m
         Gzp6NUWuNfeuH+e1o7HR8GV1dpw7WiRMOMWITT9nC9PEWWbQS8Y33UFSGIiuFfZIr8M+
         8AdUb9f298xTDoUp1ryz53/B1xVe1/9eOTdHYbMeRPwnpUzKFc/wUpPDvWGjx3Mvnwrz
         QqhdFBmw/1BWnxZ0pUz4Dbtv0BHIKJk4owKGDZVhVxsOMGt6e5Tr38bzNW8T+zKGBmgq
         gVIrIyMoVaqZbpQs+FggcXoOey8u5i4EuWjLC1oVu7Ll6X/y0z+OETBJllm3HerH+UMm
         T7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765982083; x=1766586883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=frK0DQVLHreroSMSFB37phaXvuA6Eoc2Hn3hapEL7Y0=;
        b=AyoLwzrg6EgkjbvELEhskCzmBm8waNPhElfQPZXRY2nvPF5KsfYk/FdhQ+SY6qryNJ
         sW1YEbcoWmhQti4K7ioDdG1+YfnL3jV6tAXOn5WFLgREe1UsOwuyd5s2qGKZOSzQFT0U
         fCZPPybQJMlT3sEOiBuvJgp+2DTunlWfbGzTrtHClGPwKiGZYuvkKIhjGEJhPVem5Ney
         RfU/9JLyb65BtrULMkxvosKQ7Xs0MBX8y/7kGx08nViTdXced81G61M2TOQfkAn1YEm4
         3QLp1DiCGGypClUk11hKcqx+Tq/QtZXuCx5TVAL8mYg1jhOVDbKu2SPFpD8iTOouJNBw
         3mUA==
X-Forwarded-Encrypted: i=1; AJvYcCWlK9f86GCD0BX+3cwxQUyoy5ozaTZaX6y1S+ICONX/BHeJc3hZVTsvM3c+llR7EFT0hkqRt/9VhAtisi5/@vger.kernel.org
X-Gm-Message-State: AOJu0YxiwO0/9IUXzLxkoyCtZyIWO4/7CbhIkxtfK0MJzNM/HtOJcCQQ
	70LVa8p0GGJ9TVf4iVeAh7+fe06CmGjM2RebDFTrFOTowmIDwxwx0aBnQwzvWSpe3mjclHpT+iF
	vHQMJiIrxph9z7SX5aLRIpGqBcC+b905lB418uepRdQE7wPulwasbruLYxlEUVifqnbPwUTSE4O
	WF
X-Gm-Gg: AY/fxX7dtKV9z68tyQwIqj9UekwAODvNIskAwwYJKk8t5uLYMQfTgHdVENwXM/q/K0+
	AKjfwxoXGyyUCN4CV5F5Dob2jUUvnymxv4dVIWGgCnEyvCduOUzFkjbibyDRug1Q93xyGh+/szW
	Ejfjfi9qINQLEyfb9VqkV+v4DRnszYJja9E+DtGKoFJrKU18XNQjFC68SUBN2/I9uFCIe178zZ8
	jRUl3Pbl9vS4vOaecl126BusEIhipHetUPXOdHbCKfwGxLpOJHtUQjFqOR7AF45fM4BWd5xnA06
	OFJu1mgFio5/OS1465p/HGbSfVpA6oo//ih9rDoRIYldUTrgRVICgnp0QWTk1Pod6cGYcy8gow7
	aqx7askhPnBmKwr/IVeoEROYBToq445coiEhwbF3k3sEPYA==
X-Received: by 2002:a17:90b:2692:b0:340:54a1:d6fe with SMTP id 98e67ed59e1d1-34abd6e705bmr17446716a91.15.1765982082930;
        Wed, 17 Dec 2025 06:34:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9e/nta+q+PGA44E/Mk4BlmitA2UaH7cKeo3l8rRY+Kcdvv0lls0LDwdMfeq9q3V+4ycB+GQ==
X-Received: by 2002:a17:90b:2692:b0:340:54a1:d6fe with SMTP id 98e67ed59e1d1-34abd6e705bmr17446683a91.15.1765982082321;
        Wed, 17 Dec 2025 06:34:42 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cfce5eb5csm2615529a91.0.2025.12.17.06.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:34:42 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 20:04:19 +0530
Subject: [PATCH v11 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-multi_waitq_scm-v11-1-f21e50e792b8@oss.qualcomm.com>
References: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
In-Reply-To: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765982076; l=4418;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=m+Pn8kiiNohB5gdgBNzYIusp6d2hMNRhmxDutGs99M0=;
 b=nM1ouAMqzmoJzQentCVAkd0bmq4bz6zr/jMCF6YmNFKKuXbqD3Ecocc4fOJ9B/1t9P1SDYmP3
 D4+MNl1tC/aB9FIgphE2XUyGw/g5Nity+Ilwl+KJaKWn77sfUS3YWlp
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: aBJOBWO-_h_8jASR3eDQISnU763anjFy
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=6942bf83 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=l69UaY8b6P0ZDUfUprYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExMiBTYWx0ZWRfXz2f2SrrQB17s
 bno1k1RVJ5wcV4CtYWav+QuCr3FMpSfqDIW1r5Ovta8ha22VXXhss/fj25d1D7izSveRKT0ggrL
 5nafbHg8kswKsoFgVPnpVoktf+zNc9fiPAuJ+bsPCVS49pcM0pYHGRs2WsIvhoNf8eAXZpFOY2P
 9hwWoqE/GgoK8xjiwA65OO6T0iH2sSP74Ruhvyb4jnAe/pKq/1UJnMv6uGBlFpQKafbNOBpXeOa
 GkRkd1gCfY5HFKjSp/6X6rv24Tvw3DqI1oHaqYbIXkoTbRqSc7hsdA70gDhfYZW7j1bYqnppeKt
 g4klstd+IWq4R3h3p/xHpjmnxqQL2PqZ1J0nyiW1P6q+tNasGlxwgi26kXJfSUCbOlniWf9DlvZ
 JlwLpx1WvdXgpkM4d5H1QA+0hJ7DkA==
X-Proofpoint-GUID: aBJOBWO-_h_8jASR3eDQISnU763anjFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170112

From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

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
qcom_scm_fill_irq_fwspec_params(). This Linux IRQ number is then
supplied to the threaded_irq call.

Reviewed-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 62 +++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e463e06a12814614cea20719c90a371b69..f45dbe5f49ed65f4fffd0748c2e3c704dbb9ee0a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -30,11 +30,18 @@
 #include <linux/sizes.h>
 #include <linux/types.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
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
@@ -2208,6 +2215,56 @@ bool qcom_scm_is_available(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_is_available);
 
+static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 hwirq)
+{
+	if (hwirq >= GIC_SPI_BASE && hwirq <= GIC_MAX_SPI) {
+		fwspec->param[0] = GIC_SPI;
+		fwspec->param[1] = hwirq - GIC_SPI_BASE;
+	} else if (hwirq >= GIC_ESPI_BASE && hwirq <= GIC_MAX_ESPI) {
+		fwspec->param[0] = GIC_ESPI;
+		fwspec->param[1] = hwirq - GIC_ESPI_BASE;
+	} else {
+		WARN(1, "Unexpected hwirq: %d\n", hwirq);
+		return -ENXIO;
+	}
+
+	fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
+	fwspec->param_count = 3;
+
+	return 0;
+}
+
+static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_WAITQ,
+		.cmd = QCOM_SCM_WAITQ_GET_INFO,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+	struct device_node *parent_irq_node;
+	struct irq_fwspec fwspec;
+	struct qcom_scm_res res;
+	u32 hwirq;
+	int ret;
+
+	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	hwirq = res.result[1] & GENMASK(15, 0);
+	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
+	if (ret)
+		return ret;
+
+	parent_irq_node = of_irq_find_parent(scm->dev->of_node);
+	if (!parent_irq_node)
+		return -ENODEV;
+
+	fwspec.fwnode = of_fwnode_handle(parent_irq_node);
+
+	return irq_create_fwspec_mapping(&fwspec);
+}
+
 static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
 {
 	/* FW currently only supports a single wq_ctx (zero).
@@ -2381,7 +2438,10 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
 				     "Failed to create the SCM memory pool\n");
 
-	irq = platform_get_irq_optional(pdev, 0);
+	irq = qcom_scm_get_waitq_irq(scm);
+	if (irq < 0)
+		irq = platform_get_irq_optional(pdev, 0);
+
 	if (irq < 0) {
 		if (irq != -ENXIO)
 			return irq;
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c41021e5a067d52b7d5dcc49107ea..8b1e2ea18a59ac143907a381b73236148bace189 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -152,6 +152,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_SVC_WAITQ			0x24
 #define QCOM_SCM_WAITQ_RESUME			0x02
 #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
+#define QCOM_SCM_WAITQ_GET_INFO		0x04
 
 #define QCOM_SCM_SVC_GPU			0x28
 #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01

-- 
2.34.1



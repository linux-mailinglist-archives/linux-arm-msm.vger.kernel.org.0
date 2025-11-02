Return-Path: <linux-arm-msm+bounces-80016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18DC28C08
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 09:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 506FE4E28C0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 08:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E35A24A058;
	Sun,  2 Nov 2025 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbItT67R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWZ0CXwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEDE1DE4C9
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762071535; cv=none; b=pIwu4bAHZs+yr1o9DVQi8/8sCFRrOlQS6tWhXGFl46NhiBUtX88V59PKSQ9/KX6t6ACubsCYLenhONbfgqmAvw9cYaD2zcBub7kVVPkBsfBHcvhfYYURy/FpVaDEN5knhFKljqsThWzMFJYxi/HMqQWn2sZqtu6wNr9l4Wh+3s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762071535; c=relaxed/simple;
	bh=ATUG8G3yQbf4mBIb5MogIZlnc2dGMSIJGAgAWTfqlWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NG8hzgucAE49Vp+kyDVT4h3d2DzwkAzSQaCrk9YzNBRz6z7KpSWXfbxUIAt8RmPYI0/kVzblkqTAf/+PB+XG6NS8SJtaMSiA8q7e4jkaX8ViYNLD9ukAdPYTuqEVL1C83KDWZDpKno6FafOtOSiLGQoi/UDgultKL6c9GS0NDbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbItT67R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWZ0CXwN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A25k20q3556438
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 08:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q8L4Z0sGRBsxvlfEy+AM5sITeDHdZpr64GpjFCroDCU=; b=SbItT67RitSamHrg
	rCxCCz82CtzS6MnVIL+bU4OAMhNBLS9kmuHb4ZwMLvMxKWsTDCEN6WoiuvkBq3fb
	ydbMKhN6dojnEWGSn1UicMl/48/ubjttloGsbVR8UMYHGuwoK3QNQhfcyeY47DcQ
	ZN/Pd028qhHnfr6HXINCvq72XJYJhjUjW9BG9MDO6oxHoIzgIw1ROnpiMy7WSdPf
	TSw5/SLoSPr+weOuoLm5c86tuANuJ240LpvpIbLR19cE40JxhgRlun7E11EisCm7
	Sjg0qzOytbT3mboTljnKttAc5x3NuhUrf707d0g5kpPQopJ05TxOKJOb4QDlaEVq
	65rRdg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ayf9sh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 08:18:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7810912fc31so3550931b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 01:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762071532; x=1762676332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8L4Z0sGRBsxvlfEy+AM5sITeDHdZpr64GpjFCroDCU=;
        b=BWZ0CXwNgMvIWoQa1eemsukp/E0qAMIlliiZbUS2QKeTroSybu+K2qIQ6No/8HQy1j
         lrPVEdfYzzX2hEWFv1iJSUjv5YFKy3pU+uO9tI0B1o4VewUmCbJLjwlXHetLN8qoUBrY
         GuJf8fGIpsUTRtdLc37g9NxrLFE/xmy8Bn/IpdHbfEveudcbhpSccvGKsxG/QdxtKouW
         t9Vp1Aba5sqQSSoon6rxU5AUf1efpv38MMkJyDgejYCvBefzDo1TGPu2trznJMpN62tN
         GhwX3NN7oxsgvjgYYTb4i3a/sYZ32tDzvpu5n4mqVVIpeHxDby3aAxMs3KRWfIQ8k37C
         OMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762071532; x=1762676332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8L4Z0sGRBsxvlfEy+AM5sITeDHdZpr64GpjFCroDCU=;
        b=vAx5DTTa4E8XGA5Bg9qkIpL9gaC3c7iRLjSJgXW50Tim4IR62Sl8TGjR+ByzA9O4Ee
         uAI+w//26d/gN3ORfTVPQxTZNH6NDCUBs7U62ktSFiuW9Nb969PadjsX8PwEdjWzo1aW
         WPWxDDGHRVfhFkmzAdoHx/A6IgH40ZqJVPketqgvJy+SISMdeS4YJRTrGpSjpdILyqiI
         GSzvA/rCfWqmJuJRZamtH5FNrHximXJkAvdsOXQTi8nraSZ8za++2g1BhhKFwbwYSOG8
         A9btQTkXGH2hvWH0YGKZD47x+YLCfLSbJHb+Jg6heUoyNNIavwya9pDSAk4enwF7DFyR
         TSQA==
X-Gm-Message-State: AOJu0Yye88Q0ltKgsYsdKtM4eEe/dea6V33GwrhTdDjE3sQxgJNDePvX
	vQHLEGIdNGkVn2TbtuHSVrStnGWN3iGlCbG+FsFNRLwPVU6MnCNki5vWp+K3ReM4Gji4YbHiRfh
	fpwoJIp4ncNebBidZQ6EIdq/ozemnOhyQWbPXO8W4g63y5SmKFmeLqgoALR7ADVxUlnmK
X-Gm-Gg: ASbGncu4eVoTrm8zjTCxpMCo7W16qHlx8u7LrYg4gyx/e7gS+d1e9RoJpgRDuA4XCJu
	OAvUiTfbQS1LzjJc+SeqJavS/DMkJo85xPgFjpVOTDScusvErCBLICwJZUN9NDaHxFmufp3oS8f
	Zpfd/a35Z44jUfrfO2CRtxIjnxcZv9x4A5an2hNfMh9gTY3Ig1ZCynJiuCLkTYQ5cB44xYKDJCs
	TqGHGYCn/n0CxSbIzyLezqCy+h6OjwcyHszB/UfPHJnI16sv90hgpm1Rtq39400MlrRD4kq3K1z
	UPLR8cl6twoq8Uafar9NJGi8u24YjKVbIz1qYvvnsZLqIJ0NUCo6z0TKOzIg5eFCQvgFmc2CYOW
	1YDDpmkC6m8iKm9shHvyvmezdthv61LJGJBY=
X-Received: by 2002:a05:6a00:9a5:b0:77f:324a:6037 with SMTP id d2e1a72fcca58-7a777381d3bmr10836902b3a.7.1762071532261;
        Sun, 02 Nov 2025 01:18:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF3+HLJWPThqZmT9Sx+1T1p9tAld+nc+P7FjEouwvNArim2iootc2jaQCj9sxH9o0M2IRbaA==
X-Received: by 2002:a05:6a00:9a5:b0:77f:324a:6037 with SMTP id d2e1a72fcca58-7a777381d3bmr10836884b3a.7.1762071531759;
        Sun, 02 Nov 2025 01:18:51 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897e862sm7440630b3a.8.2025.11.02.01.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:18:51 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 02 Nov 2025 13:48:45 +0530
Subject: [PATCH v8 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-multi_waitq_scm-v8-1-d71ee7b93b62@oss.qualcomm.com>
References: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com>
In-Reply-To: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762071526; l=4472;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1W8lqsQnD+0CQBLBPVZ0rCrv7zv7DVNbei5NYedDBcs=;
 b=ey0tZxx+h0VQ3R4Pr0WQ/IsrlvQm1j9XGv0zJOSrgf2p68k8aBRaw/Iy8+ENKdox9pFYweboK
 UkpBf9OEoM9AuTl9+Fgiphyy2Y93OOIH+6Ipi0rRJTebcxK5Vpbt2/s
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDA3NiBTYWx0ZWRfX+JEa7eLfxPOx
 /HLvvuHv/Sf9mrxFlF7xVgdgIQrylRGDyxMNPEemM/iXRkK8CXriUISLrGBMEXGzrt5/xcyptL3
 WQSwSleLkit60sOzs8EYz+jJdODZ8q7jBVeeuJsUuUFBlzMbEdlB+gLDqFKD3/Faaca6qmFbWVo
 aCWMb/1007YSDMAVDK+EFljloW306DrXf5ANRyiPuCo2iCE8H42iKoDC46Pk3yDeNkPJAUN6ISY
 J2AC6uhU2e3x9oYBt5L1GliCbTA+qc6d+aPiHnjxNEqaZincefLOsKPN/FzAGYiuSpeswDJiVVS
 y8OkynwV7MFKS7+odaSy8UmAZJki44e0Db3LG8nO10XhSJOGIJGSFYdJC3DxFpTexijorHV8yfk
 pBCTGA3gEK63L5XQYWBkSEm9FNb+pg==
X-Authority-Analysis: v=2.4 cv=Scj6t/Ru c=1 sm=1 tr=0 ts=690713ed cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=l69UaY8b6P0ZDUfUprYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dK8wMqtDTYiFsMhhCHFIzD8dtiUU5zv4
X-Proofpoint-ORIG-GUID: dK8wMqtDTYiFsMhhCHFIzD8dtiUU5zv4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020076

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
defined fill_irq_fwspec_params(). This Linux IRQ number is then supplied
to the threaded_irq call.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 62 +++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b127944fe112f453cae9cbc40c06cae..28979f95e51fbee94b84c1570a4d88a76f72db4e 100644
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
@@ -2223,6 +2229,57 @@ bool qcom_scm_is_available(void)
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
+static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
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
+	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	hwirq = res.result[1] & GENMASK(15, 0);
+
+	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
+	if (ret)
+		return ret;
+	parent_irq_node = of_irq_find_parent(scm->dev->of_node);
+	if (!parent_irq_node)
+		return -ENODEV;
+
+	fwspec.fwnode = of_fwnode_handle(parent_irq_node);
+
+	ret = irq_create_fwspec_mapping(&fwspec);
+
+	return ret;
+}
+
 static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
 {
 	/* FW currently only supports a single wq_ctx (zero).
@@ -2396,7 +2453,10 @@ static int qcom_scm_probe(struct platform_device *pdev)
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



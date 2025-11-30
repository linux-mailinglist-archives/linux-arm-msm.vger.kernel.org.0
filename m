Return-Path: <linux-arm-msm+bounces-83899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DB5C95059
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 15:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2B024E0EF0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 14:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E43279DCA;
	Sun, 30 Nov 2025 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrNcISqh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOhm66h1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0FE23ABA1
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764513678; cv=none; b=JY4DFxIgacwLuzs4hQvdfoA4hIH/OJ5L/hifaTdSDHNIXSkK8jfTgM8v0xMEeTi6AO2t7+NXhoyU6kZsQCSRmr5cH3s/TJcy6tNKt8T9/k/1ZHw39hYejhABxpu2JxD6gKajm0AS/hQJb5W9UIAGpBd/kXhDXibf6Lc0hnBnO1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764513678; c=relaxed/simple;
	bh=K+XCHjC8KWupOYTNWBlXk+nWg8FYug0wz5XSG4bR8J4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZM8IO+JsPxz1fWCqU0sHfg++WFaPkbisqp26IbnjdZ1vZhWSkJf9C5Q5q0b/pVo+EhSo3cAZ/MpMZrGRd7zwjJtIbXTxGAI+894j0hyWSnejs9jZFEQlO7zvdITsnHHofVZnXPUjZI0Voc6YOMIT89XHN8pQt/WHmPujwxQggOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrNcISqh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOhm66h1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUBdVLO1675767
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H5+ufLvy/HmVXY04G0FNH65Lg/GXMDaCxoGP3bQSCUs=; b=RrNcISqhPiXkxG6p
	i24yV+j8VtE4H6Kc1dkf2/r7U5pvdJELbEN44JTpSS095n1FfDTDK/0pAtEs4KUP
	ZuOFfZJh9PVJfOIgazkfQIk2SFVHK8kpQqQKLMQkKsB1MCla+nsO/RbxxFLq35qr
	1TEqUqoz/y/3LGN1KW6V/bPq9zDEIcSkO45DVGFv8DpIDNpopqS4DpMiasbSek6U
	HyfaFGC2cYxGiyNq5F4n6hwC2zmPkFD165bpr6h9QEiEigdzCjGpJFhzKbMVlN82
	2RY2nF3rrS3xIEVIiMbHLujmFYVXsbbdL1yt1pVuejQGiV7/uEHp15EalEdssMri
	8uBy0Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqs78ta2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso5469058b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 06:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764513674; x=1765118474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5+ufLvy/HmVXY04G0FNH65Lg/GXMDaCxoGP3bQSCUs=;
        b=kOhm66h1DgcX2YFKCGVjjy4QpPXSlBTbjNc92Mp2ZUbi5Ot6Yp/bGYkWLAasQ6iq6l
         PLapk6DYe/2ZnjESfesfYmDqAizj+9YH+7zADhx+yvkJ83nHQnItLaS7Ys6LvQwqnNZJ
         EO3cRFtyMJDwATmOBwGJ39HL3+dVJXsKNRFxdGroKJnYEABeXFxD+ifePy8PB/qTxZ7/
         fjzMesiI253MGV4hPwFQ8xkfX/KTGmTT6x6W3UabdsLdtWCuXzZJv1y3JqkpodiwdeYi
         XoKlwLoPsXM2KnY5r3O9UVK9tQ9sZjqXNF/edP8PXQEDM9Lx4LcMGf0c7B5yYNbFbGTu
         vwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764513674; x=1765118474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H5+ufLvy/HmVXY04G0FNH65Lg/GXMDaCxoGP3bQSCUs=;
        b=EPnfXMElLZePIkumPhJs/aQM9rxAff8CW8DvGl1THbR/0KAfL1glbjZoetxBuyqic9
         3bdywp19rpwSsKgPO1eRbqgtMJ+1GGHjaPqKGNFzWGZ9W2xyHmgrxRlQ9pNuCJyEQzYH
         BLehl+f8ZWg9iRKlhbrjDgjNRo3jKPnGGmM/JPah1VkJ+TYgA8pAXXEvJSgjhfD7ijiq
         nETxalkXCk10Wh/w40PJuR422wYaz0czm2U2i5kz1nU2J7HOa+x9shnrON6Sx5HOZBN3
         nKkD+C4QG1Ea2ReZMZIJtRUsY8ZKSt4Y1dHnH9wm7ofyAQhpWJQrZE4hhF/GNu1BB8BV
         mGqA==
X-Gm-Message-State: AOJu0YxCsChk6u7xKRUu1jziwNPCKsQyWVxfFran0xJWdaGua8i2t9hY
	7y8Jbj0b1/ZmbRY787CbGeTPe6C1UGKKVk3mC8fdy971QfbXSzfciq5tiH8o0g9bNl3Mb01JNaH
	nzRDbJ4rtKTCNlynFRRbU0ROhePjcj4jxWtezkG7wtCNzw9L18mZQgBltQwyoOTR5NMyc
X-Gm-Gg: ASbGncuFdWXhlCGEiKmYtBawcLCsDIehB0LDJLasBbPMiMTaIRRzZQQEuWeghtNikxY
	t5/k2L3vMc5f6SZTFlbyQWiAq+mLyqJEpqw0DfbaOvfiakVP10MoK17dG3Rclp6Cu+cgoF7ZuWh
	dtVBoGpmm86o3OEiylWrBSlSXushQruIXAimoceZ1XiAnQSDm8Z3//hBE3J4Bb5/109NrI6eLfT
	nTVqnFLF2i/e+KAGi8otLBU2XtUY4XjoyJjs7AEP226MzbQEV5p5eXmn86TOgHICRLMtcJW0R12
	HJQt1L4C1G8w5uroaWPmEdPIf2xFESzp/bJI/pKSw/taqnx5+IQzslTezEkLLCL/UeeqTFpC1Ou
	IwLzVTzN1Z1X13CxrDFw9jk7xEuElHQdI+Jt09/0Y+Exo1g==
X-Received: by 2002:a05:6a00:3cc8:b0:7a2:70c5:f74f with SMTP id d2e1a72fcca58-7c58eaf2ec3mr36784997b3a.32.1764513673618;
        Sun, 30 Nov 2025 06:41:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsgXvnKYqn7A6wSDwd2SNfOU+ke4D/AO+k7zsNV2oQCjWvwQCBiqkX2NXQo/RIjhbCsIBSBg==
X-Received: by 2002:a05:6a00:3cc8:b0:7a2:70c5:f74f with SMTP id d2e1a72fcca58-7c58eaf2ec3mr36784979b3a.32.1764513673174;
        Sun, 30 Nov 2025 06:41:13 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d54b003177sm5240065b3a.14.2025.11.30.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 06:41:12 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 20:11:02 +0530
Subject: [PATCH v10 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-multi_waitq_scm-v10-1-5a5f2f05a417@oss.qualcomm.com>
References: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
In-Reply-To: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764513668; l=4465;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KfWJv+YDd10f+5NwbiCP5vaNOv+wkhfxctDmxzsCvwY=;
 b=zo6kL7pRsmIF56G1Wl+o3tcDLjoaNZXc5fv9/xx1h3BagLoAheVYGdkaKc/xl/uMx4ozHb6+3
 eEmxo635feOBHKYjEVvcyl//bOeIbK/e5i2AI9D5HURXUOao+ARQPYy
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: Y1oc0JCSlZjxw33E9DQG-56_yi3F8_IA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEyNiBTYWx0ZWRfX1JnacoXjT5zt
 1J1/m2+L7674SCEupQQXdRZfRzMmFTVMeX+l3JQGX0Hc0bg7vfmUTG2u3mtii/dmbuyj4On6kCq
 MbymQqdgeyjTvhGsN8B10g17HCiLKh4Rf6Lx2lFdINryZd8ZUFba3Vuw4RTnHPjSqWZMPeLu/Xz
 AoYFyGvWXNQhpICiCeEOxNpOXbt/UQaTKTOGLU6iuxppJ/Ri20JvCamjKTrp3igGC6ZyiedQxa6
 FKtZVBJ3V7/Ewk+9OY6JjMuu6ePJJmxiaxQAxnpljbVenE2ZnZbPczYXLGcIK74UlFK763Hpdp+
 yrFZhKd9bbu7QnQBTwENDmrfbJ5zLcJhF4tCSGtjiyU1UPN9F8khSUUomWeTgi+EKZ3MBOhJiDj
 tSyyWcHdgJy5Za2v7GshCj4FkvNizA==
X-Authority-Analysis: v=2.4 cv=FdQ6BZ+6 c=1 sm=1 tr=0 ts=692c578b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=l69UaY8b6P0ZDUfUprYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Y1oc0JCSlZjxw33E9DQG-56_yi3F8_IA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300126

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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 60 +++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b127944fe112f453cae9cbc40c06cae..79ab1707f71b0157835deaea6309f33016e3de8c 100644
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
@@ -2223,6 +2229,55 @@ bool qcom_scm_is_available(void)
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
+	fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
+	fwspec->param_count = 3;
+
+	return 0;
+}
+
+static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
+{
+	struct device_node *parent_irq_node;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_WAITQ,
+		.cmd = QCOM_SCM_WAITQ_GET_INFO,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
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
+	return irq_create_fwspec_mapping(&fwspec);
+}
+
 static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
 {
 	/* FW currently only supports a single wq_ctx (zero).
@@ -2396,7 +2451,10 @@ static int qcom_scm_probe(struct platform_device *pdev)
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



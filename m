Return-Path: <linux-arm-msm+bounces-82999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD6C7E1CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 15:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 921074E414E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 14:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEA92D7813;
	Sun, 23 Nov 2025 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zq5byRrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jm6l/jeQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657AE2D3724
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763907586; cv=none; b=DbW0ulg8sUsQMOfWu9717Gc8IX91eXmDN3bgH8keLOjuWH1HnVOGZ16vpOjG3IUUrOsrojohIzBtDZRS5t6+RH58TNBhyT5uAJYgrHrhIaJ1i4H5wJYedu0mJSN+Ob3GQcf7EIoyOZwptCS6w1abj8BXHRUjdJddIPQQL+zJ7A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763907586; c=relaxed/simple;
	bh=ATUG8G3yQbf4mBIb5MogIZlnc2dGMSIJGAgAWTfqlWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S0G/Yn/8k2WnkKt9gC0NCfs+9434OAhOs0/O2dptd/9oTpNdgfglvn0TUDDAAhjOGFQIHTeO7bAl95itZCn6EyWRNvaJ3a0Q1/Lr0CJ2uunaMcfiM7MPC2AdRXIPjyryX+mYG7QYcujYABQhAaZ9WztYvBCQ7qie7r22qWqX5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zq5byRrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jm6l/jeQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANDo1wd1524984
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q8L4Z0sGRBsxvlfEy+AM5sITeDHdZpr64GpjFCroDCU=; b=Zq5byRrSZdzawPWX
	RVyJprAfQycsapAOjdtlnF+G1Y3sSwzWJ7vLqUs4VKX9K9X6NYKh+BoP+3DdAmUM
	5BP/SAlr4RNnEzvraXnvCBRrTJxFz2DGqfIxR6clxbRoW1MRvdTMHJnTy2bDQG2T
	OqiqWc1e1XTHi1Lx0JZOqiyRs4/HXGCWikjXt8kffZmeeLKRSZUWPUE12lZ/RNeL
	XV+EO39S+5wF0gjdRzrF2RdKAA+nEN9Eml/lW94yoSpKg7tortd1gE3MBCTHT0yA
	SCxHTNYI4o9EBg3W5SkCfxsWV99f+Zq3h/a5cbseH6/tSov8APNF/mwzc8jx6SpQ
	zpNGEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak691jg6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29848363458so87307395ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 06:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763907582; x=1764512382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8L4Z0sGRBsxvlfEy+AM5sITeDHdZpr64GpjFCroDCU=;
        b=jm6l/jeQl0ga2XnvK/lLDw7aMkuYt8XBbnswejVBKDGvGmjYMzJ++hOsXcuKUdtOIk
         g6C5wrM2SD4bgjiLjvYXiCpmvlxefTNc75Kz59u94yxxHqIZU6xl+9WqKXM2lCNipoe8
         NUpeP/BZdRXNQv+4/fM8NKH2r3+glFgR+Sqz0XocQ4cfeLQr72tbgG/yPjWePHXPeSL/
         J5XjgYsEmgLDHGd6LjKbzhdt8E6AUt8wGrFgYlmis1KHz7OqYtgtcCgQWititfuuHUpF
         9OQs4OAOluHwKecfqKjbVhrPSck1V4DqtRtR6Ep7guxiY2KiQXvTsRwCOELPcSfShhaD
         MXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763907582; x=1764512382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q8L4Z0sGRBsxvlfEy+AM5sITeDHdZpr64GpjFCroDCU=;
        b=Gor2tp6Rs2pbi6CYqFQVgVTqdhoFH+JtUddFgRRAvs9V/9rAsxMuRWlS6Z+oTEpn1y
         Az0On7+ACygTsrW4emTw+s6BvGolzdT/WFhh0HoehqfFDR/56JsNEhzAD6rv5kf2PX5M
         ScQTo6+Zmluclzgn4adhlUKFi6uP8BTV3l4/EwwCCprKVD5oOgH6NAOCLeizSC/eHuBZ
         aAI6a3q35JXte81nhkPf3476RIyaXUCdYbp4HU6+xiUsRg6mHUUh23KIRkYrp3V8Jjif
         XoLJ9HfoL8P+fA6qLDmwIpyVnd3VUrHF4dEm5gleBcaiAn3johOr8rzYDE8yY44uqVyP
         ZINQ==
X-Gm-Message-State: AOJu0YwiHTy3ZhyUjqdmknphK6FUPkVVoMmLLpYOaoCvTbGHEvi3HKnV
	1GHU5IWAIZP9sWHZyyEdawo30KDVqC6PWEcHYfsUEyajsTfQGSgMJo47LYL3dNics8j71W5fV9w
	ZeRvynwGgk0fqZnPqjHGAbZ7uNUcYu7WRV68K3jZnw5Pm2XKEIwc95nOjBqbZ4I7udpRu
X-Gm-Gg: ASbGncveumWMyGea6LVx9zyKHDbaGuQosfO15/oK9UTcAGL9ZDkCsgaHISVQ3JsjXP8
	gpALbnSkDGay9nruyqQYXvxLktFSDwI5FjFUY5GgWuSDk/6XmP9gUT69zjO4lwdMBn7fGgThGXl
	A9ZIbt7GYWFcQfgoNgd7A+VsPJKQ/kzeQgY0vAJZ0m2er8sew8LbzIesjQo00WHryjK6p5VLRQ2
	qNADEMksi7I59t5ZY2vt3VHyM4oRsXeGkOngXrTLQkUovAXqHU9J67Fc/5eUo/qvpoli1QDY+JX
	oL3Bd3poK0iHTQccySt4qDhp2+aOHCFeLm/TKDncrnb4NWJk1ktuN1cnVNGjps/x9z7xQo7O5/E
	pulUyBHgSFT8YVgYhAI5uWmdChlYYTavSIjX5SEctdg5DeQ==
X-Received: by 2002:a17:903:11c7:b0:296:ec5:ab3d with SMTP id d9443c01a7336-29b6bfa0be1mr102162455ad.61.1763907582136;
        Sun, 23 Nov 2025 06:19:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpBpE03zXiQm6rcmqhHUAY+NdIY52OOwJtrCquv0KZBY69pNF7OiasvzF3UAAUEZ/5tOARNw==
X-Received: by 2002:a17:903:11c7:b0:296:ec5:ab3d with SMTP id d9443c01a7336-29b6bfa0be1mr102162235ad.61.1763907581648;
        Sun, 23 Nov 2025 06:19:41 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af0ca952sm10135992a91.0.2025.11.23.06.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 06:19:41 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 23 Nov 2025 19:49:30 +0530
Subject: [PATCH v9 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-multi_waitq_scm-v9-1-0080fc259d4d@oss.qualcomm.com>
References: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com>
In-Reply-To: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763907576; l=4472;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1W8lqsQnD+0CQBLBPVZ0rCrv7zv7DVNbei5NYedDBcs=;
 b=yPwRYzvwIi+ElqCqLlQp8iNw4lRhL/ugJfJL6VRJVYJcbiuiWTJP++29w7SeCDqhgmUjQwh4Y
 0kcvRFfhoXmAU3JBummILSXdx3xBRbiAg3/hUXAse6VHRoQOyVZxsaY
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Be3VE7t2 c=1 sm=1 tr=0 ts=692317ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=l69UaY8b6P0ZDUfUprYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VJARJn9dfwOROues196K9r9-o9ype567
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIzMDEyOSBTYWx0ZWRfX45wpFLSTM4SE
 uSerEPM6DbkojQR25ITCgr12dhnVG6zqYUg8/LSUYmFJNUi9IykCOszYMLzZHE8Nj2MEgxIwFok
 nAn7iru3I88Cet4ohJtLy5c4cjj2XAQ3ZIQ0osRY+vapUuMY6Nf/XKnCCgyG3eeIsb2n06WkPy0
 MVAbHXdBDFQYdkuirX8DCGQb/IlL/gxPtDRgqjmCBQsXhgAgX6kyahfWnjXfkcV2UhzW1MKJjHm
 VhS8twtpSUQVvkmv52IFehFa9/Ta6CGE+2lwaLkDxIAebivoii+jUwNpI3U3w09P+1WgFlqI+YH
 8CnzERA+foGd9u+kGmcuQDDxl6rH4QnIU8dZIR3SK7HBIPTxWQxuvhY2XrQ+KisSFCAE66tv1An
 p5ptENL1dpL1Lw/DmNB5KENFq8HULg==
X-Proofpoint-GUID: VJARJn9dfwOROues196K9r9-o9ype567
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511230129

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



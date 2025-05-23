Return-Path: <linux-arm-msm+bounces-59261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B18ABAC2A38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 21:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001021BC66B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A89D29B220;
	Fri, 23 May 2025 19:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0XNEx5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B3929A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027277; cv=none; b=CMKkdmdrXkXdMtUP1skgCw4V5GwTtgtBpAkTcW+UGyNqBsiYuF1iGINipa7WLnKsi8cXYqXc1x/cDfTL7M6k1Fo+8NtVd9xZHxEm0HOxH85sk9S7L9o7s0w53g/p9L9AkPnDJHdfj8Zst9LHdcB7AH67mtMieoUTDe5zQBjrV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027277; c=relaxed/simple;
	bh=HwSmczY1BPfAzd6mqaQZTmW0WxFuAC6Q6eQmyL2FVcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4OzaDKXg4KS7HiT2OZ8Ds05Mm7IN/VHpnbwb1PSPvmtdXXtgR7gbwGPoaatTJwDPlvbkNhxVFST0XwzZkY7zp0AfEtgvHsCu0iGAhE7vnmgNVn0SsctxFWTVz3fKWsB9edBhh6K/gCc3bi/j1LuVEDA66pJ+mC4tGpvnmqYyaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0XNEx5f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBAXbA006639
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7gZa73dpF26SkhvPxVhZQa4YDow7tdo2+PqHj6dpVRM=; b=B0XNEx5fcG8KymWg
	KQfqbqCjHxIuR3xTiUjoths9dTazx+J5qI+6S6lsCRTHoVB3u1vfG9/TI8azX3nu
	gvdHd9NKxXUmud8JWrM3/R2mNjvkcw5TjiLnPoIybIWdgm6SpLApoW9if3OGdIug
	XKny6LLYZrvyx7QNNSXjWRsHixhFxUW+TK0SVoB1CfllsyaBjtvfF1/wVBkYON/w
	KCB+CEIiXcCz6l1KPbgbfiD6A+4nucdovBZCC48gUMNeD9QpWG0dpjpcmYKYPnK2
	FE+OoXXrhkfm8KDP2L5OaXN3dKPXzy9bn1cqTPW2b2E+1Gip4gR0xQu4d+qK0oVT
	cACAHA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0u4v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:07:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-231e3cfc144so1394975ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 12:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027274; x=1748632074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gZa73dpF26SkhvPxVhZQa4YDow7tdo2+PqHj6dpVRM=;
        b=rYXVln6iBr+a1XH/zUISejbKpslfaOcPw3iKSnOVYlNsage1SahTKTAYJX8w6nLevB
         W2ibd6EhI96l4L3tobpPsWY9eudikyqt0P30LSNdiujPQB1/qKdv/7DMWxArkhElWATg
         yQRzHNYm4QNXe/3iexlzk07cnRp/ndYRtc1bXeYNG2zQXvUIuA21HQtCYLinDk9HZCWd
         FIPyNgVUYBgK66HUCfOyUD3Y0N7OSOkva3+gzb2kJsbdLZvEKIbezHlVrSnV0YPnBCW8
         KuLN79iyvL8B1WQ4RcEyyPTKl/ZIed84vO/P2Yq/JSlOT+6ddJcl4LC6Jph9RpHkuiC2
         oL9A==
X-Gm-Message-State: AOJu0Yzs2v1fX81vTj6zCfENZTH0DbavRSygvrlMUC0clNyGJiVq4fuf
	5sjhliK55ArF77heGzLcuoYR6YPSVKX9ypcrb9NaKCCgFVDFXb8v5iK/yIX8C9D3qitPfM81vIo
	iq6Zy0deAScUIaJz97W1uR7qXX/1dSFaUK8okZFmWZ0hp+mpRKe4Og7ApA83dbSaoISVuHHu1lC
	Ji
X-Gm-Gg: ASbGncsBQn8OHAMHWd4tYoGjSPWaZHqV2lvE0jzbHPS+bUiKGaP+/owy+v8K36IPSdw
	fQ6xuDD9dFBYq16rXcTs8T0BMD80Kg9Z8dtNHmwStPeiYML5k40vicI/W9do9t6w8xomPzSMGq7
	N+cr+KtN1BkzNALj8HG1aEMjcr/3sERHAOTLqtHWzYkINzIEr+XU6vMA6apqsylCV51Tfdu+r3N
	542EcjjpggkNCL/eeRo07T+iSbys3qlXzdAZcZbkA8rMjbTaf+ka1nDRcVIMlY8zrSI3GSNm8c7
	30X5VTFrWqW3ksTLEhrcNiLVxnmFSU7gB0biE4d4pVhVxFO8qY6RS1eBM8Lh4Wcu/oSzWjzX0Xf
	2LvA=
X-Received: by 2002:a17:902:fc44:b0:22d:e5ab:5525 with SMTP id d9443c01a7336-23414fb18f4mr7684315ad.38.1748027273732;
        Fri, 23 May 2025 12:07:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9aGHMYSmK7SrV45BqIlcmsAhO42IMfLLXP73waFOUBZmCfBzFQvKjmp44IBDyYmX/NigZnQ==
X-Received: by 2002:a17:902:fc44:b0:22d:e5ab:5525 with SMTP id d9443c01a7336-23414fb18f4mr7683925ad.38.1748027273336;
        Fri, 23 May 2025 12:07:53 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97886sm126652165ad.146.2025.05.23.12.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:07:52 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 23 May 2025 12:07:40 -0700
Subject: [PATCH v7 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-multi_waitq_scm-v7-1-5b51b60ed396@oss.qualcomm.com>
References: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
In-Reply-To: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748027270; l=4335;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=HwSmczY1BPfAzd6mqaQZTmW0WxFuAC6Q6eQmyL2FVcg=;
 b=wGqF1n/ppHEqyGEgSw+8/sKO/e6uc7JfP1jmTIfWFlWNHi5jQAxPVqrQNdk39Te8twHGplxwb
 pktnaa/w5FPBvNiln+WThqcWOqUmBR0GUEZafXWkIPMEYzbc2X8JAzj
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-GUID: 1pqTxHaneYpC-Sp4wKCzRzt6toWDhnWl
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=6830c78a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BWC7kBQSOfkspHPoMaoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1pqTxHaneYpC-Sp4wKCzRzt6toWDhnWl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE3NCBTYWx0ZWRfX9u4J6XWJKs2y
 2epI29uXwqpQQMGbsc70raB29r1Y+UCjUMWwBG5jF8hKlOEUy3Cmf+eOUOaUtLJJBUHGPHu8wQ0
 T5lw9Pw9MvdBJByZBb31GNNdnz2TOGSBBciT+o4AkRg1SrT7+K1fhpiIM7f5vEpd3UNkt9MVdPG
 HlFgUOIeYm+6WLA32m42ESPUKOKzj+qd3Jj1RNpJF3TgIrSg7ffjIThPOlRfOPj7jtYW0r4pMHJ
 JjUOzhl474M8agR68xyTkZV/cTMUqckp2wmv7pjX1qqXhwPprQHvC7cD0QoUOLG535bKvX+v+kU
 Z+8oeCAi/o5XGdllRdPoCq1mLuMH/4+7Pw/nVD6/BaHibaIHDty7V9TYiVkwJtITjYocg6knpXf
 dPC24cmtKXmn9ffFVelbmAoBkC2ujQPwERHSYTb7jaW5TIxqlpm0Oz1pupBKcNEHIrUKKyBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230174

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



Return-Path: <linux-arm-msm+bounces-43604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C109FE380
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 08:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8846A161387
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 07:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9635E1A0AE1;
	Mon, 30 Dec 2024 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsjYB5m2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022D156C6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735545285; cv=none; b=cBJgktjQVaQSt9KS/eAKt0+XuxW29KEQHl9UZooHcT6TlGqDNBN2iO1QAmmP17XHJXWWjlYZwH6kHvL6rv2caU0oxwkVw2SFNf9tttf3CeO2gSrnSAS7rQSJ2Py8rXA09qz/ACgaE9zFqdSUqEb9HRWuH/HN14SsA9TqxE8VNRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735545285; c=relaxed/simple;
	bh=79hzgthwyngoM4BpEeXnmFJ6ovPLb0WBGK9JKyWpdQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tLHBkL3iF5dTWhMqXSuicjqSVHoN/5JzjPQIkwrz6iv92ZWXuySiE+NxRWrvHfmfzI2y6KACRLSExwPIS/fjrUygY8UcLP7OOEzAGZAqeyEGULe2ODoZBvEaQ/GJKHp3x1oVC7mZnjt9UpXbjPMBDU1l0NkLDJWnlLamCMSJ1ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsjYB5m2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU0jvII014029
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gBJuLcNHpA8puK83xiFzArM/wXiLOzeGaBA
	Bx3fDy/w=; b=OsjYB5m2bozEthmJA2K1b2ZsgYUz8FIZF29EYbTZq2W8NjZdno/
	wWM2+9ZExQts+icIl0zaOT/uLxU8kZDcwc+bwWE3hm9n06tEfEQeWmc3mqDjAXXw
	3F2RLCCZaH62uJVHz3C98Vr9u74xCW2LcOiOS67DAU4d5oPOQwrK4JZK7kdrQaQp
	4gSyNDUH2b/yx4XTS85CBXQJji5UjEYzLtpxUhxWS/GZijtkrWT/XcOQ/gEU1tqk
	yCZ2r4plQAKlgIWZlFsjxlieWQerOLEbzI89e/bKnCwIKMSbjcDmuPMZJskmuOFm
	j7vD/m0kxCgIu0sHzS2E3JZgiYqLv5TD9Dg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uh8e8p8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:54:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef79403c5eso18352209a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Dec 2024 23:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735545281; x=1736150081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBJuLcNHpA8puK83xiFzArM/wXiLOzeGaBABx3fDy/w=;
        b=LKnhwxF3zL3Y12+3+se7kVrHj+fPoUgrV0RHkXBgP/OLO0WoCx2UJdYWdyfkgBy9SC
         283QmL5V28/bEimzz/avt8qCJgL9Remqv62pbI7ufyGwkd2EpWvKUuEhSJXdwJCMNQJn
         sAvB9lyS9i8Q1/SyXtw5NpIZMuZ5DtVmSjHixn5SsBuifQUNtRBV50nWK5ENWquimJVI
         WbR5N9bd4oKlh/NrpBccv2r0IYWY9Ct6eETy6m5MIVD6yQu3rmb8zUVU/IwDjWVj3YE7
         RgaVxGOS86W1xrx5XRooCwlUuv+2hcaedlHEr5Kibz1ojp3heLKxQptNnUekOoUTd2nq
         0ufw==
X-Forwarded-Encrypted: i=1; AJvYcCXj13eC9DUoaCIMshZdzNB41YYdVMWpKt407pvLpZlrP+KMsmrvZ6e00z4DtwmK3LsEyxAKnkZaic3p8L2r@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7QFI6XwrzmkadKEF05TW6jdKcnXgkLaBAFbjEJmeSldIerGuS
	Ms2OLzdfM94b3iAm+PC7UeAg5A39m2TLlYuIL49r5+B6A/DKUL7qlJEjtmvWQ7ornUAKveSak1y
	iCtdvFf5getse6VvDHc9SOq4jDMNsv0U6NCcKSGIjzXPrcgtqzaRibtTuvVqIE++HKKpPn7zH
X-Gm-Gg: ASbGncuVj+G+j9kL8rQmQbnN8/ZBbA2wBXy5MF2Sq+TpfETlYeMsiIvgDzViHLmNPXB
	7MMkd1z2RWgFBZ6gnz4IfTyaqe/448Rpy7y7Vg7QFfUaRucTAOf+abA55UFBMPKoZ5OMvWlLUT9
	cl1prhO8t8W2sef6DKaCpRzOdpM6LnMUN4gMT1svzZTHC6yZ4fLFuyrIJNywHJtzXl87l8i7PlY
	MQhpziS68sORod8BHEi1HWCcxY3cEQOX/aaEodvmRQTKoHQq5jaZ9yNTxtwFCrDQAUDXFE6g4CX
	ytICLHuq
X-Received: by 2002:a17:90b:2c84:b0:2ee:d797:40a4 with SMTP id 98e67ed59e1d1-2f452dfccacmr58440643a91.8.1735545281170;
        Sun, 29 Dec 2024 23:54:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKHCgciY4fAbJOIz7jklcG5BtlTgjH2Bhu08Ido0AfuJjfu9wC/d7zyUJzqYVKRAXE52p+Og==
X-Received: by 2002:a17:90b:2c84:b0:2ee:d797:40a4 with SMTP id 98e67ed59e1d1-2f452dfccacmr58440625a91.8.1735545280818;
        Sun, 29 Dec 2024 23:54:40 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee071387sm24425912a91.37.2024.12.29.23.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 23:54:40 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: manivannan.sadhasivam@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] mailbox: qcom-ipcc: Reset CLEAR_ON_RECV_RD if set from boot firmware
Date: Mon, 30 Dec 2024 13:24:25 +0530
Message-Id: <20241230075425.2534765-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 07wAD8F1X2yuEsNIc_cUsuOysLPXseoX
X-Proofpoint-ORIG-GUID: 07wAD8F1X2yuEsNIc_cUsuOysLPXseoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300066

For some SoCs, boot firmware is using the same IPCC instance used
by Linux and it has kept CLEAR_ON_RECV_RD set which basically means
interrupt pending registers are cleared when RECV_ID is read and the
register automatically updates to the next pending interrupt/client
status based on priority.

Clear the CLEAR_ON_RECV_RD if it is set from the boot firmware.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Change in v2:
 - Corrected email id in the Sob.

 drivers/mailbox/qcom-ipcc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 14c7907c6632..0b17a38ea6bf 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -14,6 +14,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 
 /* IPCC Register offsets */
+#define IPCC_REG_CONFIG			0x08
 #define IPCC_REG_SEND_ID		0x0c
 #define IPCC_REG_RECV_ID		0x10
 #define IPCC_REG_RECV_SIGNAL_ENABLE	0x14
@@ -21,6 +22,7 @@
 #define IPCC_REG_RECV_SIGNAL_CLEAR	0x1c
 #define IPCC_REG_CLIENT_CLEAR		0x38
 
+#define IPCC_CLEAR_ON_RECV_RD		BIT(0)
 #define IPCC_SIGNAL_ID_MASK		GENMASK(15, 0)
 #define IPCC_CLIENT_ID_MASK		GENMASK(31, 16)
 
@@ -274,6 +276,7 @@ static int qcom_ipcc_pm_resume(struct device *dev)
 static int qcom_ipcc_probe(struct platform_device *pdev)
 {
 	struct qcom_ipcc *ipcc;
+	u32 config_value;
 	static int id;
 	char *name;
 	int ret;
@@ -288,6 +291,19 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 	if (IS_ERR(ipcc->base))
 		return PTR_ERR(ipcc->base);
 
+	/*
+	 * It is possible that boot firmware is using the same IPCC instance
+	 * as of the HLOS and it has kept CLEAR_ON_RECV_RD set which basically
+	 * means Interrupt pending registers are cleared when RECV_ID is read.
+	 * The register automatically updates to the next pending interrupt/client
+	 * status based on priority.
+	 */
+	config_value = readl(ipcc->base + IPCC_REG_CONFIG);
+	if (config_value & IPCC_CLEAR_ON_RECV_RD) {
+		config_value &= ~(IPCC_CLEAR_ON_RECV_RD);
+		writel(config_value, ipcc->base + IPCC_REG_CONFIG);
+	}
+
 	ipcc->irq = platform_get_irq(pdev, 0);
 	if (ipcc->irq < 0)
 		return ipcc->irq;
-- 
2.34.1



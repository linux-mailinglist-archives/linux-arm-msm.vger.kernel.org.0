Return-Path: <linux-arm-msm+bounces-43598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2919FE31F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 08:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C019D1881E53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 07:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857FD19E992;
	Mon, 30 Dec 2024 07:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrdFP0Ex"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8522F44
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735542485; cv=none; b=HT4iTNm9npnWn3498tEA6kyZwmE6NFCdwm8lrsaLe07FCd3xEcToXSAm09m70+8LFs7giRgCKoxUBDN2RWwGsu2noH8aOgKadkFBlsWNIiL4jNC9iAXsmK+FZs2+jkE1EmWSwuVQrTnYr1x2gaWMd73GyfkOHOitSaaBKBa6Mx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735542485; c=relaxed/simple;
	bh=/ZO/tih7zRKdfP8XFhIddcxoyihXiTorJEwMouJEbQw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GHWUK1bW/ghUbXujdMQAUxAUxPmkXhVWGVmp8a9j2IVUv/BAtorOF3q/b4xW8icDSLCEdbaElF0kSgL+2j7jE7Eh+RUZGSzslyiqRJ6A5bkM1qkcrm97PTgcW9BGllzsUcr/FHQmSg8IwGh2OxHkCJZCFwXFCby5Runu4bUi+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrdFP0Ex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTMd2wm014531
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4rqnU+/T1BqCcsEZeicSCdteCuwqPOO7bGk
	x07CcbBc=; b=nrdFP0Ex3Prj+5KVGwsOmm26lfFvYbPpRHICcxE2PRSI3F2qME1
	1uDTvsFrtjAJJxu9NQpDwXyr4pgGNZYVWvNhBVD+bGC2PfuIWQV0WD6+bo33swa4
	fU9BH9QZpNEDsJXijDg0js92C1NhiDaHJnlM6v4eavqp8hSGCJC0KS2Vr5qJ7BLW
	4OSaTBk4en3CCW4PYCHM/SkxaYKnCB6OryjD88D0TpZrQxqKF4+STDTBR0seK+0U
	idoh8lp9XZBuje3E9abGuWogHKj944qtJkdBwUrtWz1CtdW9/g+ua2Fp6p2pjRj4
	QethBTVHvdi0vacpQ8X5wRnCAlX291L1j7g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43u9tm93h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:08:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef114d8346so11849603a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Dec 2024 23:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735542481; x=1736147281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rqnU+/T1BqCcsEZeicSCdteCuwqPOO7bGkx07CcbBc=;
        b=WFwCFHzDakj7ujfcpR7z7egbOQqP6NbrtnM70dhgin5D7CfsFpNQJ2ySjk3yc7avcl
         nfeUognBs1Go6Wnc83wgJBMFSy6BFWP/YfumkZUUp/uj9F+gHmrW+0w86CV9DDpMRY2n
         HoPJNiZiP+HUnUUKXgVP+UDIa67HbLX6rEMnlPkhMCWwry14zNerDP3KPntMa9ha8NhA
         rNniyQPT7jL4XFCCQuYA4bG2C075c2LtGTug9PMcL8jTiM+zmHHzWsY7IzSh61t+QZ/w
         PMuSzy5FhHZTqvkYw8g7JUtJfikuoLK387NpajkyIJO8I847PcE1xt7fOE///nY650RY
         mqNg==
X-Gm-Message-State: AOJu0YwYquA4HKIP6PW8H9h++wQXIUuITsenM1S3yAvKN6y1AswidoN5
	wk4Zq6DXIqedu1rkOXHO1nolT7/lnY0T0YSxrme3y0mTI7pdpSqO9Oo0yXAXsIL/ceQJy1M3gWv
	5IsFLpG6pmpbT9voSkd13/bs1X5SYBwI/b4cnOKBcuJNUjuYWYJhgr3X53ltU6E4t
X-Gm-Gg: ASbGnctZKa5npB5ciOxBGSr5nv76JpC2tVBgVQF5otyl9twclzoT8YMmQSQ7L0v/l/B
	u/FpifUvt9Ed5tSx/5aC4SLkkDKXdygyDO77Cyd4JXM2w1MwMS7soFQ5X7wevfDK8SYSkvdgOCl
	Or4auAQ0OeRjE8LRNeCrjrZQv37q9OE7MGYV9/qVPLy3e5fMDUli+owSo2dtfnZ+SuRQ7/qqVU/
	8DyuuyVEBs4HcGNSaKSNTa4rZLeem9MLDuHw+QAliBCjGku1wwjYEyRnYpcIg03pswYdWJYqP10
X-Received: by 2002:a05:6a20:2d11:b0:1e1:b062:f3fa with SMTP id adf61e73a8af0-1e5e080283amr49953559637.34.1735542481549;
        Sun, 29 Dec 2024 23:08:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHWD5vLzxfrHu9wRcxilDoEnl/C3oXRCj5ziwvSSp7dnCvcIleRCk75qjbHiGfnr00af48PA==
X-Received: by 2002:a05:6a20:2d11:b0:1e1:b062:f3fa with SMTP id adf61e73a8af0-1e5e080283amr49953540637.34.1735542481185;
        Sun, 29 Dec 2024 23:08:01 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f44sm17131337a12.15.2024.12.29.23.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 23:08:00 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Google-Original-From: Mukesh Ojha <mojha@qti.qualcomm.com>
To: jassisinghbrar@gmail.com, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Mukesh Ojha <mojha@qti.qualcomm.com>
Subject: [PATCH] mailbox: qcom-ipcc: Reset CLEAR_ON_RECV_RD if set from boot firmware
Date: Mon, 30 Dec 2024 12:36:44 +0530
Message-Id: <20241230070644.2512780-1-mojha@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C8V2M_2IfMeHF3aolk_ARc87eL_KE8Fm
X-Proofpoint-ORIG-GUID: C8V2M_2IfMeHF3aolk_ARc87eL_KE8Fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412300059

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

For some SoCs, boot firmware is using the same IPCC instance used
by Linux and it has kept CLEAR_ON_RECV_RD set which basically means
interrupt pending registers are cleared when RECV_ID is read and the
register automatically updates to the next pending interrupt/client
status based on priority.

Clear the CLEAR_ON_RECV_RD if it is set from the boot firmware.

Signed-off-by: Mukesh Ojha <mojha@qti.qualcomm.com>
---
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



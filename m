Return-Path: <linux-arm-msm+bounces-24419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D591A449
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F732B23C19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 10:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F238E145B37;
	Thu, 27 Jun 2024 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bz8k20Z+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FC61419A1;
	Thu, 27 Jun 2024 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719485345; cv=none; b=e0v/2ZY7lSikum2tQfrcUHbshUh7WXu9/D0M+w+4hh6FNIhCBqb8vbliFg75luSItIOmlJKo1e6hsmSGETQ+1mSwjam0k4Uvf7JbBL4Bq0TMHvjq4CuOI04XRJD1csXERAdJmgErL1+kGL094rVBVLeJ7uJppAdLmYQ8ok2IkkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719485345; c=relaxed/simple;
	bh=3pgEnM6i2J+7DGXgR0F+G3i0H6PgvpHTFMGqF2cV/Yo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VZAYsL0xbSUzViYTKQ+wXOAKisR8eRK+LBYmfkJ4m5UA5RzcSjyxIgTZZwRUUFHIBnGl+yrDlnJIAMvjPO8j3QIa4JAj6NU9WOi+Gxt1BPz36YIQHQZnZFeCO0iMuUs1FSIGPwtOml3PLuM7ngVwpSxlU28/IucRHHmwEHz6iYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bz8k20Z+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R9s3PM015147;
	Thu, 27 Jun 2024 10:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KLTst6zS5Ja6NhC/OMtOEj0Z7FOw2nBH6kON7rRZHq4=; b=bz8k20Z+jD6Fmfnk
	BWEtWj0FqIfDQnaJUD65ATKibn4v+PRG80IfBBMi6kDNPLcsafs6minJwt1Mitis
	ezJXgYY9hVmnAnBhfGNochpL+TsO889CgQDZIWGZHNcL8xovk+AMUYA0QZNsCQZS
	uL+qch65jz7sLIYW2riEMNO+ZAK/8AvNvsLVdgPFqIQqeMlUo6mJ544ebBEKl7Fm
	Yhl8REmiTDDK7PYOWdp8yev3de4Y2livnCdx3Zv7+JOd0dJgyPNjchg0AhxSjF+Z
	VU7S8sjJnCCUSIw70dwy6/QQJ47FCZszInC5u8BCdZnajyaGZ7rVrZhwLyemuWfl
	eImspg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqshv9v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 10:48:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RAmwkC003735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 10:48:58 GMT
Received: from hu-sudeepgo-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Jun 2024 03:48:55 -0700
From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_deesin@quicinc.com>,
        <quic_sudeepgo@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH V3 1/2] soc: qcom: smp2p: Use devname for interrupt descriptions
Date: Thu, 27 Jun 2024 16:18:30 +0530
Message-ID: <20240627104831.4176799-2-quic_sudeepgo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
References: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: l2HNixGIjfphXgSw4n1i1BR_ki0T4p8C
X-Proofpoint-GUID: l2HNixGIjfphXgSw4n1i1BR_ki0T4p8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270081

From: Chris Lew <quic_clew@quicinc.com>

When using /proc/interrupts to collect statistics on smp2p interrupt
counts, it is hard to distinguish the different instances of smp2p from
each other. For example to debug a processor boot issue, the ready and
handover interrupts are checked for sanity to ensure the firmware
reached a specific initialization stage.

Remove "smp2p" string from the irq request so that the irq will default
to the device name. Add an .irq_print_chip() callback to print the irq
chip name as the device name. These two changes allow for a unique name
to be used in /proc/interrupts as shown below.

/ # cat /proc/interrupts | grep smp2p
 18:  ...      ipcc 196610 Edge      smp2p-adsp
 20:  ...      ipcc 131074 Edge      smp2p-modem
170:  ...  smp2p-modem   1 Edge      q6v5 ready
178:  ...  smp2p-adsp   1 Edge      q6v5 ready

Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 drivers/soc/qcom/smp2p.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index a21241cbeec7..696c2a8387d0 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
+#include <linux/seq_file.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/spinlock.h>
@@ -353,11 +354,19 @@ static int smp2p_set_irq_type(struct irq_data *irqd, unsigned int type)
 	return 0;
 }
 
+static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
+{
+	struct smp2p_entry *entry = irq_data_get_irq_chip_data(irqd);
+
+	seq_printf(p, " %8s", dev_name(entry->smp2p->dev));
+}
+
 static struct irq_chip smp2p_irq_chip = {
 	.name           = "smp2p",
 	.irq_mask       = smp2p_mask_irq,
 	.irq_unmask     = smp2p_unmask_irq,
 	.irq_set_type	= smp2p_set_irq_type,
+	.irq_print_chip = smp2p_irq_print_chip,
 };
 
 static int smp2p_irq_map(struct irq_domain *d,
@@ -617,7 +626,7 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, irq,
 					NULL, qcom_smp2p_intr,
 					IRQF_ONESHOT,
-					"smp2p", (void *)smp2p);
+					NULL, (void *)smp2p);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request interrupt\n");
 		goto unwind_interfaces;
-- 



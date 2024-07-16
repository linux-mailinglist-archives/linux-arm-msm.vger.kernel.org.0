Return-Path: <linux-arm-msm+bounces-26365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D50932F38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 19:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DA0C1F24AD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 17:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93DC19FA81;
	Tue, 16 Jul 2024 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bWnta3f0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702619E832;
	Tue, 16 Jul 2024 17:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721151552; cv=none; b=sGxQ1DvvGDxgvl+D/ZFts7FEq51QjojL3H/2Fm1rW/nLZcvnovUUW6G3tifGHDl0c5myU9IoKbsIaAUDmL4COEvGGI7RxVqXG7QYLGjSFKDoil29UE4rcjXQ1x0f2CzqgUwDW8fgHZymxHuIrfuFDfLBgXB2+0YvdaK3mDrJeEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721151552; c=relaxed/simple;
	bh=BM2YhD4gj8N5/eCJHcATdy2OlkJ1pJDbqXA60k9ftqA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WsrlxPLP5VYYcSgz+Ct7CcWKXNBJjgUQVTYYD0gU+taFqQpRv7izkDgbC92xxLRaT80zGNwCwvBCY6BF3fg1SNO3nATnMZBYnhB1HvWUR2VFSeIW3kMdqQU5sXoIVd4RiK5cg7WSWqmTLSU6QJI2OXxbQES+NcDAt+CZgm5Rmf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bWnta3f0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GD2dD2029609;
	Tue, 16 Jul 2024 17:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvQI+5EU2Q4PX3llxhhvtIO2fmNDLicwO2fmfHdQ7WM=; b=bWnta3f0cBJrgYdW
	Uylv95o1LNge22rxBIAlD8c7v/KUIlkOv6kLKRK2wiJ54ElF5G854D+rkK5ftjb1
	jLXKyAxbyLzWsJ2dEe5vjN3dJwxYVCUGfcY/YFa0ieaGu///H4E2qmb+iGWxFHMe
	GcKK06vFCUfxUJRQeCdT/EzohisiB2k39PBt5xXsIPtAGKpNPrttKz1lh2pSGqcK
	N7wxpaY1xz/OFxDwtcEhFHfZQD3AiXcRqtV2V+Og4fib9+Nu05LMiA19uB3pACjO
	Il52R619PSXIwm+WMqN547tEuGNfYsu6vS4GGxbT2/Z/4rd9HUDLNgkqhuC0ZFOz
	ptDe0Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bexnfyye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 17:39:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GHd4vw022081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 17:39:04 GMT
Received: from hu-vishsant-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 16 Jul 2024 10:39:00 -0700
From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>,
        <quic_deesin@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <quic_sudeepgo@quicinc.com>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
Subject: [PATCH v4 1/2] soc: qcom: smp2p: Use devname for interrupt descriptions
Date: Tue, 16 Jul 2024 23:08:33 +0530
Message-ID: <20240716173835.997259-2-quic_sudeepgo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240716173835.997259-1-quic_sudeepgo@quicinc.com>
References: <20240716173835.997259-1-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6ux-ZNGtzg5Olmez9Yvv_esiY9IXL0oK
X-Proofpoint-GUID: 6ux-ZNGtzg5Olmez9Yvv_esiY9IXL0oK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407160128

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
Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
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


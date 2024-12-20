Return-Path: <linux-arm-msm+bounces-42946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850A9F8F2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6611F7A2A3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685981AAE01;
	Fri, 20 Dec 2024 09:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ky9iSCJ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783EF19F42F;
	Fri, 20 Dec 2024 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687599; cv=none; b=MuTFgiBCFkWUzDh2KggxUWS2RhwohPfYD7AXxWqfVz7w6dDNL6FlzJ75NtP8eMEe7shQTIgdt7lqMO15fh7hIo7F3dbNZIgPscWJTf4CrCdJcqmmETUr+zbcqmbISMmb2Sf5VOeDP6SlfQ/MhtoDQXTkaAhciwF/bgTMbRX66xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687599; c=relaxed/simple;
	bh=i2AMNHzPe3FyxvZTH0UEIDviGzJelaLI3rkAXR25sKY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CvbgcxNn4lYUwvQWotoXYhFVqd0zFuZ+zwdKTaJ3BD/6kBh6HKKYQ7dlSok+6UOnhNLB40RXC00VfA9KzUD6zaAPOL2kRtSjvfP3PuGs5r7EgG1DWeMHNOq7UCD2JiouUxuHyXz7kWGUWhiSNng4LDkKERDJDDEq+kTt5gZqj7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ky9iSCJ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK795BF024266;
	Fri, 20 Dec 2024 09:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3aM+nBKZk2Kvny5qojqYdI
	On8NmxL8RGeK1kSZ9rXIU=; b=Ky9iSCJ4vpArG8xR4ArQdO18VPPbrz3wsmMqQM
	azbVAfsHAdph9zNyN8jZaByL75sllo9hzPzUEVhF7TRzIiARIolBaoi98b9svXb6
	ltRkZw4hOQin4nXaTxhrmWYpiFyUbvbfFadD+7Do2x0IwwSjHNm7bFzeJv8TfGA0
	qB4OgY0iIeONlQWZ7m34xQI3mffLNKlk2UGPO7MynTfu15eKBniGbGPHPLomzTdR
	Oyjjc0AzW06fWkWgsWgbtt4r6OLxALXXAEiHN470qHUCd9HfHnuB4DzxaZYxAMmj
	f24IRCKX3R0iCkGVoEQiQ4O8mAwYJVjFvCR3F8/U7hj/mMPA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3xjrdwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 09:39:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK9dcme014138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 09:39:38 GMT
Received: from hu-ylal-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 01:39:36 -0800
From: Yogesh Lal <quic_ylal@quicinc.com>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Yogesh Lal <quic_ylal@quicinc.com>
Subject: [PATCH v2] irqchip: gic-v3: Handle failure case of CPU enters low power state
Date: Fri, 20 Dec 2024 15:09:07 +0530
Message-ID: <20241220093907.2747601-1-quic_ylal@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gonb4XauVaqLoCnvy-dNg_E4wS0Mm12S
X-Proofpoint-ORIG-GUID: gonb4XauVaqLoCnvy-dNg_E4wS0Mm12S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=645 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200079

Adding a new condition in gic_cpu_pm_notifier to address instances
where the CPU fails to enter low power mode (CPU_PM_ENTER_FAILED).
The CPU_PM framework signals CPU_PM_ENTER_FAILED upon such failures.

When the CPU attempts to enter low power mode, it disables the
redistributor and Group 1 interrupts and reinitializes the system
registers upon wakeup.

In case of failure while entering low power mode, it is necessary
to re-enable the redistributor and Group 1 interrupts to restore
normal operation.

Signed-off-by: Yogesh Lal <quic_ylal@quicinc.com>
---
 drivers/irqchip/irq-gic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---
Changes in V2:

* Updating the commit message
* Link to V1: https://lore.kernel.org/all/1671734140-15935-1-git-send-email-quic_ylal@quicinc.com/
---

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index c19083bfb943..2a99ca5c3f1d 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1495,7 +1495,7 @@ static int gic_retrigger(struct irq_data *data)
 static int gic_cpu_pm_notifier(struct notifier_block *self,
 			       unsigned long cmd, void *v)
 {
-	if (cmd == CPU_PM_EXIT) {
+	if (cmd == CPU_PM_EXIT || cmd == CPU_PM_ENTER_FAILED) {
 		if (gic_dist_security_disabled())
 			gic_enable_redist(true);
 		gic_cpu_sys_reg_init();
-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-19850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BFF8C5AC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 20:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B21A1F230A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 18:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC231802B1;
	Tue, 14 May 2024 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LiyRcJ/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DCD2B9D7;
	Tue, 14 May 2024 18:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715709673; cv=none; b=HmNxmqn7fGx+fs1pU6AJMr5j/23rBKinlXpxrgJr9HpUUNqLnXvIyGx7XurfVKt03kj/1hR61s2tM+nWuIZ44zx+xlI0m4xS67kcIVNScsngZuPO4XPxYRX8mMzJRl8q0CAdQ/EvaZaV6KPfqT7hgqnjYpWgzNZZAztRhAaTOY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715709673; c=relaxed/simple;
	bh=JdWsjA5RdkgocSrr5UydnbHjGNwJ5hVOhvCzcBJGcaU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K0+E2+V/n6LFubgQN19aLZ8EgMJl5+nTG4SqAmKuoDdEwuysCBlZI/3qsDzDVGqGOEz/iZpyZFNAtIsR+xLylPseKGKLrHIKLGYFz2zDq6Fr7LM8gt6+Z5t5n4T6tYuDi+nPj/sKEW2f7ynB7hqELT+effOstL6+nWYkrxRd2GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LiyRcJ/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44EBoZ65004198;
	Tue, 14 May 2024 18:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=DKWV1Y0CzS9bbYgyG8c5
	nTh77jKTFAgVwlBqAJaLQX0=; b=LiyRcJ/f2V0dVcsH+CuDFQrZSO9+Oj3jsNcH
	NHZyMSbn/VXF6CeNd90aY1EpOnwgytckBXR5kOLdjqKR1P6M5jzZ9r3XuGe4Zn8E
	HKSaArYnNIcjng/7lYVC5/eHEwYVg+nf+Y3FsRxMDX9Nd110StNXwrAt75jjoNe6
	FugCUzUklfu+Ldsj6Ai5C5aRMG2lAljLI9KiDMiH6RDR5SCxwFA7wYkVX3k5T2yd
	D1aQAIQt+4LhqBXTD4O+wp1A00r8YprlHNe8WtDhGhqgKv2gXskYmmH9mKS8SLSV
	7g9wlCRnc5deHgMHP4ZBxrkIAC+gSDWA/bO6JXaEBm7vkX/6UQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47eg8yd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 18:01:05 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44EI0NoT022370;
	Tue, 14 May 2024 18:01:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3y21rmbx6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 18:01:03 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44EI13m1023598;
	Tue, 14 May 2024 18:01:03 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 44EI13Qv023584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 18:01:03 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 43E635CE; Tue, 14 May 2024 11:01:03 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
Subject: [PATCH] firmware: qcom-scm: Remove QCOM_SMC_WAITQ_FLAG_WAKE_ALL
Date: Tue, 14 May 2024 11:00:46 -0700
Message-Id: <20240514180046.543763-1-quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TNhuPX5eJ39dRjdANG4ECDCNUJA4FUys
X-Proofpoint-ORIG-GUID: TNhuPX5eJ39dRjdANG4ECDCNUJA4FUys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_10,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140127

This flag was never supported by firmware, so remove it.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 68f4df7e6c3c..d511ede6f172 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -114,7 +114,6 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
 };
 
 #define QCOM_SMC_WAITQ_FLAG_WAKE_ONE	BIT(0)
-#define QCOM_SMC_WAITQ_FLAG_WAKE_ALL	BIT(1)
 
 #define QCOM_DLOAD_MASK		GENMASK(5, 4)
 #define QCOM_DLOAD_NODUMP	0
@@ -1793,9 +1792,8 @@ static irqreturn_t qcom_scm_irq_handler(int irq, void *data)
 			goto out;
 		}
 
-		if (flags != QCOM_SMC_WAITQ_FLAG_WAKE_ONE &&
-		    flags != QCOM_SMC_WAITQ_FLAG_WAKE_ALL) {
-			dev_err(scm->dev, "Invalid flags found for wq_ctx: %u\n", flags);
+		if (flags != QCOM_SMC_WAITQ_FLAG_WAKE_ONE) {
+			dev_err(scm->dev, "Invalid flags received for wq_ctx: %u\n", flags);
 			goto out;
 		}
 
-- 
2.34.1



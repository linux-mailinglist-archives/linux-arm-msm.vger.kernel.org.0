Return-Path: <linux-arm-msm+bounces-36300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03B9B49B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 13:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE4441C2080C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBA3621;
	Tue, 29 Oct 2024 12:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dQqalt4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E09F623
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730205017; cv=none; b=YSfhwZVWPF2fjnidFhfpE+UpPl0lYUNtguTzW4pnaC7qdpTlmaXoRlQTrk10DLvcSnfefhWdVyXi9posc0Zwz05tOHBfgbV5FU3Qpna/ZKYybT4xLSgoMKHQuus2GY6awN7WQsuSw21Onu8pdUdVpGPxYnvyK+fYAjB9iO1fNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730205017; c=relaxed/simple;
	bh=5y8bxURitf2eKDKjC6WL1r3ht9h0uXIQKilOBtAncWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=W+FCBNlGkCvdQYYASZg1SQKowoSMdW+eb2MeC658F4AZEnf9luvE4eBaXpHORGtIqqKuHTIGB27Q4FSwU9jcAiywlqKm8mhKgrh90mTCHKmE0XjDz5XOne75f6Jd4TiOnmsJAstInXf06sHXKSK8DGzCd3nVGFJZkBudKTSLAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dQqalt4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TAJHOP028362
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 12:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IZn3jvrOiZ41UyBWbyPZ5k
	3LUA4VuQKRchvQUoMz7iY=; b=dQqalt4+IaR4wn1SES3563NhHDHCjy9aHc9Fy9
	Unrk0vBsOsNJPJhL4oNCoIx4+57+Ucw8yGNH+YppLq/3ofBg5rhzb8wIB0zgDAEJ
	HwmnUCgAhxM31/snYqpHfubPpXPMK0J7rVNTlzZM0bKuzZfgz37A62LphkFePJI8
	HP/Kiqrnu1cxXAuZ2FUrzBD+xSbj101Ie5oMRJW9Tb9PlmlY4nvr5qhg0PQ7twlW
	i3C7SYvOHUUtD6GtHpdIr+dl3T85xN13YX5yL9UkoG3H4vJAKq6v1C5uwM4zxMWe
	ZEBJx/Sc7F2jsD1tuu7aQ9cmZUJn9y6zBIZUXhmIWiFc3q1w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt70akv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 12:30:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TCUBeC026483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 12:30:11 GMT
Received: from shaojied-gv.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Oct 2024 05:30:10 -0700
From: Shaojie Dong <quic_shaojied@quicinc.com>
Date: Tue, 29 Oct 2024 20:29:56 +0800
Subject: [PATCH] um: Remove double zero check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241029-b4_branch-v1-1-edeabe23b355@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEPVIGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyNL3SST+KSixLzkDF2DZBNDC9M0s0RTA0sloPqCotS0zAqwWdGxtbU
 AhHx9w1sAAAA=
X-Change-ID: 20241029-b4_branch-0c4185f6a509
To: <linux-arm-msm@vger.kernel.org>
CC: Shaojie Dong <quic_shaojied@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730205010; l=927;
 i=quic_shaojied@quicinc.com; s=20241025; h=from:subject:message-id;
 bh=5y8bxURitf2eKDKjC6WL1r3ht9h0uXIQKilOBtAncWE=;
 b=2hdMnZjs0tPYpo7LEcN9IJ4mqf6G0xWonks0/pBm1nCWvxKKpPXajE1bJUwM//y224G3Zp9Qz
 uoTfokKmQzzCVkNHIM7LeeDQ2anirsjf6ulJAQ7f+D389fU7xKxonPc
X-Developer-Key: i=quic_shaojied@quicinc.com; a=ed25519;
 pk=33bgN72hchuZbXKwEWehpvql40CPvTfN8DSdi8JrU6E=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _QeG_hH0QZM6n1GQg4ssV7acWr6MTjdH
X-Proofpoint-GUID: _QeG_hH0QZM6n1GQg4ssV7acWr6MTjdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=654
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290096

free_pages() performs a parameter null check inside
therefore remove double zero check here.

Signed-off-by: Shaojie Dong <quic_shaojied@quicinc.com>
---
 arch/um/kernel/skas/mmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/um/kernel/skas/mmu.c b/arch/um/kernel/skas/mmu.c
index d3fb506d5bd6084046cf5903c629432cd42b5ab3..0eb5a1d3ba70134f75d9b2af18544fca7248c6d6 100644
--- a/arch/um/kernel/skas/mmu.c
+++ b/arch/um/kernel/skas/mmu.c
@@ -46,8 +46,7 @@ int init_new_context(struct task_struct *task, struct mm_struct *mm)
 	return 0;
 
  out_free:
-	if (new_id->stack != 0)
-		free_pages(new_id->stack, ilog2(STUB_DATA_PAGES));
+	free_pages(new_id->stack, ilog2(STUB_DATA_PAGES));
  out:
 	return ret;
 }

---
base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
change-id: 20241029-b4_branch-0c4185f6a509

Best regards,
-- 
Shaojie Dong <quic_shaojied@quicinc.com>



Return-Path: <linux-arm-msm+bounces-35792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839F9AF980
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 696471C20F55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDAC1BF2B;
	Fri, 25 Oct 2024 06:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KDnpmq44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBE013049E
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729836169; cv=none; b=JxJ4WHzZG9CIlWjx4AqJOyJ1z+DZP478I5nQBYTtyPpiiNz1G2FwSxqLE3yNSsPoxBn8boPITBQd6rf6U76nHuIVbxbEav907rAvfFB50BRI49zon+fosG+tbhd7mqyneppPDOfVhco9uMVlcWnrQgLRs0qASVYijZpmdadOYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729836169; c=relaxed/simple;
	bh=UqXr3bJKU8Ug1BYU/LyhxSLQypNBeqhcl6itD88CpBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=MrQqjWBoXJHH5uBNpACIkFJvnCFy8TXlQekijB1n/ocoUAR0qgZGCRWRijxAC6xRaczb8TM9SGX4sSzuhoaDjm5UbFTgg0CUNuPxhesbGaRgqZt6sZDfTy2d6EGljBxZmXZCD6Q6ym/XuNlUnvzWE4TR0ckfo2WWSXPa6hzuD0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KDnpmq44; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ONIkWI031244
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JIXwDfmqYlCmpRITj5mDJ+
	h4hS8gGhLFMNR3mKEHeNU=; b=KDnpmq44CcVtlxQW0reuyGodpEI8pBFeiD5kU+
	NOlpY/GUCXjxjrjuXm1RR+OZ3it99tMCf9cZfGdG7sBFGnCk13sR8L0cB8fo1gNM
	axWj9/cJAhVy1eo67Jp41Y0W6ypUlRt304KrOj7KvuT/OKFymRBp4nkAJk8CQSvT
	lYL/k9cs0cWsr7GjqrdGVh101dD0t+80UEXU7hcssscbQVJLjr9agM54B4so3fas
	gZUXgAAN3qj0bf9qBUZm3Yt1BXAI7A/FTlgCK3ku4W+TANdZBVo3Y8Ta+nJRstPF
	h7rMD2cqq1cog6IlN4dWLoKmjYSiVamcJeCPUxNwyNFqwWKw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xqwt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:02:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P62kRC025661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:02:46 GMT
Received: from shaojied-gv.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 23:02:42 -0700
From: shaojiedong <quic_shaojied@quicinc.com>
Date: Fri, 25 Oct 2024 14:02:20 +0800
Subject: [PATCH] um: Remove double zero check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241025-upstream_branch-v1-1-4829506c7cdb@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGs0G2cC/x3MQQ5AMBBA0avIrDWpBlFXEZHBYBZKpoik6d01l
 m/xfwBPwuShzQIIPez5cAlFnsG0oVtJ8ZwMRpuy0KZS9+kvIdyHUdBNm9I1WkJrbNnMkKpTaOH
 3P3Z9jB8tPVFzYQAAAA==
X-Change-ID: 20241025-upstream_branch-06a9ea92948d
To: <kernel@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729836162; l=1054;
 i=quic_shaojied@quicinc.com; s=20241025; h=from:subject:message-id;
 bh=UqXr3bJKU8Ug1BYU/LyhxSLQypNBeqhcl6itD88CpBA=;
 b=9S2HnPpUK/vT9CB9uj7pSaA7J5+mupbeT2HFjtGMTzXmTgpLFazGV1A3Ss7jwPe4gRwWkr1OG
 Dm25W4HqF/dC2kgcDEEVkpSq8/44K6U/wZHkvhS3R4/1Gz4TSuhALfe
X-Developer-Key: i=quic_shaojied@quicinc.com; a=ed25519;
 pk=33bgN72hchuZbXKwEWehpvql40CPvTfN8DSdi8JrU6E=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EPnfX-0aMo8r2rDjn-3XlUgOvVSErVK9
X-Proofpoint-ORIG-GUID: EPnfX-0aMo8r2rDjn-3XlUgOvVSErVK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=658 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250044

free_pages() performs a parameter null check inside
previous code also does zero check as following
    if (stack == 0)
        goto out;

    to_mm->id.stack = stack;

therefore remove double zero check here.

Signed-off-by: shaojiedong <quic_shaojied@quicinc.com>
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
base-commit: fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
change-id: 20241025-upstream_branch-06a9ea92948d

Best regards,
-- 
shaojiedong <quic_shaojied@quicinc.com>



Return-Path: <linux-arm-msm+bounces-35833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B39AFD94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 11:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D09E61C24EC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 09:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149CC1D90C8;
	Fri, 25 Oct 2024 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AglFB3Hq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC61D359C;
	Fri, 25 Oct 2024 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846999; cv=none; b=HUTUQhNO5L5jz+QyOAmNj2rU3kqs3q3xt7l8d17VoI3QEnsYq7bUEkqhoDFkd15G1ZR7fkCfSJME5NZ1IuOmR9ZV54DWhOBXaZvC7puJ2uNH2Yjvad/hQDF2MMGzNW56Ka/hFn768DKojqJUo+w1d9xEivIy1CSAMQLob9UOjWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846999; c=relaxed/simple;
	bh=Uf1vEBTwHbgxfJRUBR0KvPulBh7lDI+M5ckZLrbCmxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=kZprP9l0YI8jBqN2m3/rtkH21VLR5/kiiAMWFleZPXkLrJ9JHo17hwaWiwC1tn00peWWk6cQjawKN6XDn3TK5hhLqZCflNjHzo9chzXr1KQS47XP5jFkitVR8fbVH2CAvmz6NgSGEHXL7O/H83mZrYQefObmZ39bo16qkr3hVdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AglFB3Hq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P7SHFe020881;
	Fri, 25 Oct 2024 09:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=44TX79ALW/lpoOXazIpFa0
	2hliovVgFvnIMZ51zPpdU=; b=AglFB3HqdjmTUSrNhzm9SIWmoH5xGe/NvPU3Jr
	c/m9J7W+EVsiKlpjssY0mCxdEmB/plAyahMTzhXjK8SGFG1c1aScCEUROyzPdkll
	VI6K53+pUTH2jt0P88wxlBe4IQ+hUupEtD+y8ZSBZNChLrvpfWxclBzMGU9cDOw1
	OHvnIERNDcRV6zS2ILhdYb8tgcJgO4eAhl8MvTUNlT1nY/L6xawJTirS9QHMIt/M
	mlHE2Lz5NE15csNVekrmvdnsvW88yBZrN24+lB5xb+FXAEByfdHCiSkoR0IZ31Hz
	Q3U9V7iLqK2aqFIq+5BU4rpwZRCJ+3d5VpdnFzwBNd0qFsZA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g6y90804-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 09:02:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P92sBJ005636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 09:02:54 GMT
Received: from shaojied-gv.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 02:02:52 -0700
From: Shaojie Dong <quic_shaojied@quicinc.com>
Date: Fri, 25 Oct 2024 17:02:37 +0800
Subject: [PATCH v5] um: Remove double zero check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241025-upstream_branch-v5-1-b8998beb2c64@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKxeG2cC/4XNQQ6CMBCF4auYrq2ZDqWlrryHMaa0g3QhYKtEQ
 7i7xZ0xhuX/kvlmYolioMT2m4lFGkMKfZej3G6Ya213IR58boaAUgCW/DGkeyR7PdfRdq7loKw
 ha9DIyrN8NURqwvMjHk+525DufXx9HoxiWf9bo+CCywpNCcpp5+vD7RFc6NzO9Ve2aCOuCJgF0
 Ahg6sZqD79CsSIUWWgUOaWBAEH9CnJFkFmojNJe1IpsYb+FeZ7fidxJ1XYBAAA=
X-Change-ID: 20241025-upstream_branch-06a9ea92948d
To: Richard Weinberger <richard@nod.at>,
        Anton Ivanov
	<anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>
CC: <linux-um@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Shaojie Dong <quic_shaojied@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729846972; l=1623;
 i=quic_shaojied@quicinc.com; s=20241025; h=from:subject:message-id;
 bh=Uf1vEBTwHbgxfJRUBR0KvPulBh7lDI+M5ckZLrbCmxQ=;
 b=mo83FOlyWbhvDbwn+tiD6uW3yrB/cNPDohWefBvoY09HMQGoU69oM11RSJvdFgcYZ4dij+9z0
 cVYz26TSBYXAAZaFFn3ftQuUe9j2Wx3FFrds8OKLOXXr7R/BkzlSXr4
X-Developer-Key: i=quic_shaojied@quicinc.com; a=ed25519;
 pk=33bgN72hchuZbXKwEWehpvql40CPvTfN8DSdi8JrU6E=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o2PROcHqkRpxQ_8rS2VLYdNHMm6Uqq2R
X-Proofpoint-ORIG-GUID: o2PROcHqkRpxQ_8rS2VLYdNHMm6Uqq2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250069

free_pages() performs a parameter null check inside
therefore remove double zero check here.

Signed-off-by: Shaojie Dong <quic_shaojied@quicinc.com>
---
Changes in v5:
- EDITME: fit the git setup and simplify commit description
- Link to v4: https://lore.kernel.org/r/20241025-upstream_branch-v4-1-8967d1b6ea3a@quicinc.com

Changes in v4:
- Link to v3: https://lore.kernel.org/r/20241025-upstream_branch-v3-1-f6ec670e0206@quicinc.com

Changes in v3:
- EDITME: fit the git setup and simplify commit description
- Link to v2: https://lore.kernel.org/r/20241025-upstream_branch-v2-1-072009bfa7d0@quicinc.com

Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20241025-upstream_branch-v1-1-4829506c7cdb@quicinc.com
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
Shaojie Dong <quic_shaojied@quicinc.com>



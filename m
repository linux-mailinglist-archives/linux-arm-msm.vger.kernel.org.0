Return-Path: <linux-arm-msm+bounces-35809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1359AFA53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D41BB28277A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4117E1B3923;
	Fri, 25 Oct 2024 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bc64xZPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DE7175D5D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729838954; cv=none; b=HCHygM/tkQR9/LiuVrkN3URx77ok4rWJMaX4+j8R93WsXr26UvVHzv4/RKy06r+XpmpKzO9+6Io3Etyfe4wIVxdFOuEp2eMoe8Jle/iBnJfstVK0rJipBVXphO18npJmoXHZdWmqgS6fD9aXMpfPsXi9QPHc4iNHadg16hBdVIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729838954; c=relaxed/simple;
	bh=jFmruB32Ynj+DeUMdtSeQKP6Ggv3cA3ZCKhWTiEWT6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=sjYmszNJxlUeYo95EEo63ZZUgsc+voY3JRGfa891O/0K5T7cZMv0SwZkZwx/TqIjME/ewh+ScCbDRiYuIkH/0oZ2ZT5xnp7wnqbrMdZlfppMqFzV7QglhjpxXyONEK7SjMDUt8d9fqLngXIpz4I6qg9pBVuiUgychjoZo1EjmHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bc64xZPg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OM8nYI032117
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a+flvlHu9EgSvjpKTZGDCl
	nsFbR/z8nANlv386mfbA4=; b=Bc64xZPg+06gLzbMq5mMfl5fKUjZ+GTK9i9rmr
	V8iBdcgBTs/e3xuL2QzT2JA9ztKuqSjmcn2px/sihBJRKgqPZrk4Zri+D55mnAcR
	r1IbuQKruORquZ72wTSGG8gO8WA9tG1A+McAtrKRa5uDOqx5eKP8AFrj2qaXQ/ur
	B9zXZTDxxXupf9ZPQ9pr+hLSLlNHlyBIfMwjFvESgrZlZHglUiVQzntXbYI3JChi
	hOi25zaNmLQcTAiYhl/k/2fOXg9RkiVrV9DW67hGEIoyScQLVATkohj17jRCWP0Q
	dirNA2qtt9Dt7IBmcONfRCkwmzsVHRcSrgIxKkOjgy/OQinQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w03e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:49:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P6nAEL019050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:49:10 GMT
Received: from shaojied-gv.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 23:49:07 -0700
From: shaojiedong <quic_shaojied@quicinc.com>
Date: Fri, 25 Oct 2024 14:48:49 +0800
Subject: [PATCH v4] um: Remove double zero check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241025-upstream_branch-v4-1-8967d1b6ea3a@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFA/G2cC/4XNQQ6CMBCF4auQrq0ZBmipK+9hjCntIF0I2ALRE
 O5uYWeMYfm/ZL6ZWSDvKLBTMjNPkwuua2Pkh4SZRrd34s7GZgiYp4AFH/sweNKPW+V1axoOQiv
 SClVeWhavek+1e23i5Rq7cWHo/Ht7MKXr+t+aUp7yvERVgDDS2Or8HJ1xrTma7sFWbcIdAaMAE
 gFUVWtp4VfIdoQsCrUgIyQQIIhvYVmWD12REus0AQAA
X-Change-ID: 20241025-upstream_branch-06a9ea92948d
To: <kernel@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729838947; l=1557;
 i=quic_shaojied@quicinc.com; s=20241025; h=from:subject:message-id;
 bh=jFmruB32Ynj+DeUMdtSeQKP6Ggv3cA3ZCKhWTiEWT6M=;
 b=OH6cN3H4gULu8MDA1bMH0YyNL+9OKlPgCU+J488RS0t3+LBrJiqX1odpkWTxOo9P9fbv1BrwZ
 6JtgfEZY86GCYE011/9fOJtZT3ZJdHDsYdmKcDuPokipnXZhjG11TT0
X-Developer-Key: i=quic_shaojied@quicinc.com; a=ed25519;
 pk=33bgN72hchuZbXKwEWehpvql40CPvTfN8DSdi8JrU6E=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -ExTwgdmiP5qNIpN87Gy-PvtX8uwSPYV
X-Proofpoint-ORIG-GUID: -ExTwgdmiP5qNIpN87Gy-PvtX8uwSPYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250051

free_pages() performs a parameter null check inside
therefore remove double zero check here.

Signed-off-by: Shaojie Dong <quic_shaojied@quicinc.com>
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
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



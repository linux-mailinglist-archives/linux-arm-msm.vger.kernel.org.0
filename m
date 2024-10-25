Return-Path: <linux-arm-msm+bounces-35807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 391BE9AFA3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A9D31C22A25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADC518CBFF;
	Fri, 25 Oct 2024 06:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SBx1j47I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE5018A95E
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729838756; cv=none; b=I8jl97v71bSdpDgcMCjex3277eTK/GYLd1FG2D6uB6XAqsHG0a9UcKZz3xKzyAMABeh9V8pqv11L0d+VN79ndKAh30XL5qc4Ymyzdy83eE3oC5KKpcD74coXEogBomS96E36Ky6apeY58BM20WKS03BR2QkGVVj7qggYQ0HF238=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729838756; c=relaxed/simple;
	bh=dt+sm/oFzMa9Ru0kP8gZeomBfeGUXXPsa+O1/3htP2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=awgkKZWsAhw+7AMpyY1aMK6SLS7DE87ar68ykkRwvwZCJRS6sK5FusaL7klc9wrba9JzPTv8AMBXtLrTrhONjWAX6HPURM2u0nhq/6voZJT6Vq+G6Jg3x953F98gjYhlJJIEHddfGOcP9VIlR6CFR74c8IbgXXeRKoxxiUhqf3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SBx1j47I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P1ILQr025445
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1zWq47CzOcVIcKu2X8Evjf
	TVRe1KG4zUAs02ZKm8c3o=; b=SBx1j47IGjtXsSDpcfpKiHB0ecT34JJoBva2Wc
	vxJy0Gmja3kv1SH3ybDG8mw6QuBOoEp7Ustw1QYa2bIPRKzF5AnXeut1CrBInjMA
	iaoigVRnjYTVPC/OpgMJiWeMgwJudlf7OK/otr2VmZfpAajpppDqzuxK44hXmAsc
	pANiJo/ASxzQdZqyPUjN1nDW86JWGiWO8s2GH649MHkhjHf3+vlQOyXd5lXeS7sU
	v9ilNzOs3f6e6LlnzN+AL75xG2veeQj0dk4ehq4uiH/z4QrcPOA3eazmvdnGHYd4
	5glCA3XlOfNVcsLRwCafUd/bprDOcT7FVffg3O3hg5BNAglw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em40g18q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:45:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P6jrRI025226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:45:53 GMT
Received: from shaojied-gv.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 23:45:49 -0700
From: shaojiedong <quic_shaojied@quicinc.com>
Date: Fri, 25 Oct 2024 14:45:37 +0800
Subject: [PATCH v3] um: Remove double zero check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241025-upstream_branch-v3-1-f6ec670e0206@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJA+G2cC/4XNTQ6CMBCG4auQrq2ZjvzVlfcwxpS2yCwo2EKjI
 dzdws6Fcfl+yTyzsGA92cDO2cK8jRRocClOh4zpTrmH5WRSMwTMBWDB5zFM3qr+3njldMehVNI
 qiTKvDUtXo7ctvXbxekvdUZgG/94fRLGtv60ouOB5jbKAUlfaNJfnTJqcPuqhZ5sW8Y+ASYAKA
 WTTqsrAt7Cu6wczTKxt8gAAAA==
X-Change-ID: 20241025-upstream_branch-06a9ea92948d
To: <kernel@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729838749; l=1333;
 i=quic_shaojied@quicinc.com; s=20241025; h=from:subject:message-id;
 bh=dt+sm/oFzMa9Ru0kP8gZeomBfeGUXXPsa+O1/3htP2s=;
 b=6CZWfe7uf254iOf/mAIReNwA5AHDvd/csTha+Tq6FywoLXxDIz4vgoVkjfsFVc1g95NWSkRq8
 5k/MY84z/RTAL4JzcvOpIGqAiV5Fp5XUMWuCT6ixidm2WaFIS/6kOKE
X-Developer-Key: i=quic_shaojied@quicinc.com; a=ed25519;
 pk=33bgN72hchuZbXKwEWehpvql40CPvTfN8DSdi8JrU6E=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zASBoinKYh3AwKyo-NQZHjoOKuZXMLAz
X-Proofpoint-GUID: zASBoinKYh3AwKyo-NQZHjoOKuZXMLAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250051

free_pages() performs a parameter null check inside
therefore remove double zero check here.

Signed-off-by: Shaojie Dong <quic_shaojied@quicinc.com>
---
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
shaojiedong <quic_shaojied@quicinc.com>



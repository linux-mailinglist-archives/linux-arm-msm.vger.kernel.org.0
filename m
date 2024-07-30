Return-Path: <linux-arm-msm+bounces-27409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DF2941148
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 13:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 616FA1F24008
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 11:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A590A199230;
	Tue, 30 Jul 2024 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OFlALMlJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95B197549;
	Tue, 30 Jul 2024 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722340747; cv=none; b=Lq71ab9RoXqR9fBDuxiUc41SRDReedPQuBQ7w9ubzqMTq3xBTbKDGQstoj5Yp++HY3RXpG60yvk5LlkDbNPon6b/sfcydRySWApkLJegzKNpbw3M9C+ICoNQd6hmA4WjbN7o6j95wXg+JqR1nutYfYPr5kzc9gblsRLXA5+vqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722340747; c=relaxed/simple;
	bh=CBzJ/XQ7jCwzDepR7+M6Ng71nTAIo18v/AtmpekHPRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S3Laqzcwtf8CAH+uWjY4sIhX/XzzMPPaNHQ+8WIH9Zi2u09WKyECZG9minK5SLd/SgzwR9T1cNam4xK+RDTY+34Mwa/tAMEgvcxVNoA+Ng7+0m/Hj6IsmHRctUZ2t1P9DO02mDC1imlHoGPzJRW/avywmhm/jPOIef4qINBvkpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OFlALMlJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UAA9Cx027258;
	Tue, 30 Jul 2024 11:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eJB/EQUdvYV
	zgrx1h5A7cObBQZm/7JAtGvsELvKEUpM=; b=OFlALMlJRGRL2xT72YBwwvk8ZsV
	vHhDizDiZyIdSjxGtBz7+CFCJshm/W2SdCDJpd7cOsu8v8Fn9kXAyhdlXRQFmmAj
	qdZsGnGO4eKPCMJCFEZp7qLbN7cRoYvlECI66dRmjpDr1yKYDEdG4O/TWt5SXoqX
	hR5kIoVIlIX3+HhGE3EZx5VPEJjkI3/ElBFWEBV2eUGWxrSc1YcdDoSX+Hi5s101
	fLT52XSYVp56o2FnGSDNReQIYNYuApvtIOmMtzXxW088k/6Pn/xXtI7ZlhWnkTQk
	OeN8tRUCIrRy/2DHhni8N6CcRhGcwHcdIN36LtRwQ/BaTX4P2FpQJEsATxw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne72s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UBwfIA001360;
	Tue, 30 Jul 2024 11:58:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 40msykdx63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:41 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UBwfEO001323;
	Tue, 30 Jul 2024 11:58:41 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46UBwfe4001316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:41 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id B8BA8411DE; Tue, 30 Jul 2024 17:28:40 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
        adrian.hunter@intel.com, quic_asutoshd@quicinc.com,
        ritesh.list@gmail.com, ulf.hansson@linaro.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, dm-devel@lists.linux.dev,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_viswanat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
Cc: quic_mdalam@quicinc.com
Subject: [PATCH 2/6] md: dm-crypt: Set cc->iv_size to 4 bytes
Date: Tue, 30 Jul 2024 17:28:34 +0530
Message-Id: <20240730115838.3507302-3-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730115838.3507302-1-quic_mdalam@quicinc.com>
References: <20240730115838.3507302-1-quic_mdalam@quicinc.com>
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
X-Proofpoint-GUID: TiQ_qy4t0R4o6cqr1fMSJpytzgBY2eYc
X-Proofpoint-ORIG-GUID: TiQ_qy4t0R4o6cqr1fMSJpytzgBY2eYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300084

Set cc->iv_size to 4 bytes instead of 8 bytes, since
this cc->iv_size is passing as data unit bytes to
blk_crypto_init_key(). Since CQHCI driver having
limitation for data unit bytes to 32-bit only.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/md/dm-crypt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 37add222b169..c0257d961968 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2490,7 +2490,7 @@ static int crypt_select_inline_crypt_mode(struct dm_target *ti, char *cipher,
 	}
 
 	if (ivmode == NULL || (strcmp(ivmode, "plain64") == 0)) {
-		cc->iv_size = 8;
+		cc->iv_size = 4;
 	} else {
 		ti->error = "Invalid IV mode for inline_crypt";
 		return -EINVAL;
-- 
2.34.1



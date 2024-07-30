Return-Path: <linux-arm-msm+bounces-27411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED816941154
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 14:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1CD285602
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 12:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCA619FA64;
	Tue, 30 Jul 2024 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YCLq4CIb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE57419FA6B;
	Tue, 30 Jul 2024 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722340753; cv=none; b=Kq6ezDu9ZxOumc74wNziPXWZRK3sD11GQIs9CBwb78vqr1acAAwJW9V0s5maKhf0WNLU7DWzITHB6FPBHoQL1eIF7FhFi2g2Xa4AeKGkryB+0dGUVdMgG20ejKtiLj5LghFaNrmt/RCvrZDUyS8D6QbsvxnnKRt3FPPagIaq5Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722340753; c=relaxed/simple;
	bh=hGgDP1gL2w1YTSFhueLa5TetHiLPDuSsZq+JORplF+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P+HNiHBeLn4PqWv7TqAQYZuL3WilXF+ByVQh32Kzz37rLBAQMJv6b+le91FKTPtO+n1Kuc9Nrp7/E9qdXoHc9HJDpnzeBibQAcs6+x8Zm0RZnDA6Xbz+zRWDNn/FcsLWOeps7tgdeOdwL/oHGe5I38y7HTqhys6I2HeaJbTyusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YCLq4CIb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UBeW2i029956;
	Tue, 30 Jul 2024 11:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gFK/NCHK7SX
	Pzo5eVrIo0HDxPHZySq5CPbnYp27q89w=; b=YCLq4CIbsMogVPl+THz6updfiiI
	Iub1SmiH6kICOQpT57CfMZyls7yoOE0Qli5ZbOKZmdUDuMLWvLg24uCoewsru9e2
	Y1TZEivs+LwTUa30DrHk8I2MVdu6HM+lcPaWIBGuPtfqmUwEsS9LL96wYwhmHaT1
	7nTQEpywDgfiD3Hc/9OrlosG9OJv1chu5y86/Gkat3jpFuhcgCZELkIk+fl5PED+
	dEbvm+xL1m7lYJF7ByemZ7Itd4lAjItnfixeGsbKcC5OuXHw8tuJbFLhspRa5P+D
	EiP5YyGMBKI9bPcuVH24HWyETzx0Ep7snq1GoaMQBQiAGO2KMGgrXQqeRGQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pq521b9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UBwfwO001359;
	Tue, 30 Jul 2024 11:58:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 40msykdx64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:41 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UBwfuA001321;
	Tue, 30 Jul 2024 11:58:41 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46UBwfXM001318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:41 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id BD1B841255; Tue, 30 Jul 2024 17:28:40 +0530 (+0530)
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
Subject: [PATCH 3/6] blk-crypto: Add additional algo modes for Inline encryption
Date: Tue, 30 Jul 2024 17:28:35 +0530
Message-Id: <20240730115838.3507302-4-quic_mdalam@quicinc.com>
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
X-Proofpoint-GUID: _B7o_HssZdZsIPwVNohUwsA7umSHcByo
X-Proofpoint-ORIG-GUID: _B7o_HssZdZsIPwVNohUwsA7umSHcByo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300084

Add AES-XTS-128, AES-CBC-128, AES-CBC-256 algo mode support
in blk_crypto for inline encryption.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 block/blk-crypto.c         | 18 ++++++++++++++++++
 include/linux/blk-crypto.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 51b51d6b07f3..43dc34e17d6a 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -19,6 +19,12 @@
 #include "blk-crypto-internal.h"
 
 const struct blk_crypto_mode blk_crypto_modes[] = {
+	[BLK_ENCRYPTION_MODE_AES_128_XTS] = {
+		.name = "AES-128-XTS",
+		.cipher_str = "xts(aes)",
+		.keysize = 32,
+		.ivsize = 16,
+	},
 	[BLK_ENCRYPTION_MODE_AES_256_XTS] = {
 		.name = "AES-256-XTS",
 		.cipher_str = "xts(aes)",
@@ -43,6 +49,18 @@ const struct blk_crypto_mode blk_crypto_modes[] = {
 		.keysize = 32,
 		.ivsize = 16,
 	},
+	[BLK_ENCRYPTION_MODE_AES_128_CBC] = {
+		.name = "AES-128-CBC",
+		.cipher_str = "cbc(aes)",
+		.keysize = 16,
+		.ivsize = 16,
+	},
+	[BLK_ENCRYPTION_MODE_AES_256_CBC] = {
+		.name = "AES-256-CBC",
+		.cipher_str = "cbc(aes)",
+		.keysize = 32,
+		.ivsize = 16,
+	},
 };
 
 /*
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index 5e5822c18ee4..da503a05c5f6 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -10,10 +10,13 @@
 
 enum blk_crypto_mode_num {
 	BLK_ENCRYPTION_MODE_INVALID,
+	BLK_ENCRYPTION_MODE_AES_128_XTS,
 	BLK_ENCRYPTION_MODE_AES_256_XTS,
 	BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV,
 	BLK_ENCRYPTION_MODE_ADIANTUM,
 	BLK_ENCRYPTION_MODE_SM4_XTS,
+	BLK_ENCRYPTION_MODE_AES_128_CBC,
+	BLK_ENCRYPTION_MODE_AES_256_CBC,
 	BLK_ENCRYPTION_MODE_MAX,
 };
 
-- 
2.34.1



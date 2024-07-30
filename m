Return-Path: <linux-arm-msm+bounces-27410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BA394114B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 13:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AEE31F24485
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 11:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086F619EEC0;
	Tue, 30 Jul 2024 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZICAx6h4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135021991C9;
	Tue, 30 Jul 2024 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722340748; cv=none; b=XXEXqyi8jdz3Co+VgAybVzTNTKm47XyytSQOgyez7KtogfPdzhgQeCnTqjzQp5waRqaz0pTn4Q3sIezRJgmw5vVs8qDnmyTfrXYerM16f5UxAhUdFQNKGnZbYtibBPe3gE82+6nk6oarL6nWmvZIVERr5i95K786A04Iut3g5zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722340748; c=relaxed/simple;
	bh=GxHR9FbrFOHh3eICDq5NTEDaq7EcmKWJLH33WHd6mCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i+lP2zpCefgtg7Gj4CrWtvKe8he3OPJWknthr10GYf0yZ6h2zJ/aa70Kosh2cyWT+9zVMAGS7MliSWVd+MPY1EzMbdi120pSKnJ6y9LCF8ARGaMz9xM0olZAsNtvo5ZiDB2Yx9oi4+p/vnODE3YrfDJMg2Vuo38Rxx9665wczNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZICAx6h4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UBOfN4024039;
	Tue, 30 Jul 2024 11:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m9qXXr2LCTh
	AgRYmDfS+26Cs2ZSy/3juNTy7OOF/9bs=; b=ZICAx6h4DpwCMVLktff3EiitkN7
	CvlFmY6LOzV78hhed5ImRsicrB6P8z9sFtavX4XOF0m8BXsFlDu+t0CbiPA0LI9a
	TWqVoCRo34HWvo/hKPI1jVfkEyHqnbOOS+xIYyvgkhN4XT4tsgaRdtRtVJGVmj7T
	zSSvVL7C7EHUZcXnvJaH/ADJWN8yI9Pe1YKOHHve77iIWBsMAADl1FGt1OpPzPVT
	9OPty8PNfXdy+0wid9I+dktuTP3EwlE45s9oIZ4y/WMkE1oqpvfVveI+kP5x+2La
	I+s1Acu4tP3cIZFLOG64l/gnBSRR3yv9gh3nCozAdVI0VwJRMRUts01lpFQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne72s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UBwfiI001366;
	Tue, 30 Jul 2024 11:58:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 40msykdx66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:41 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UBwf83001325;
	Tue, 30 Jul 2024 11:58:41 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46UBwf02001320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:41 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id B39DC411DB; Tue, 30 Jul 2024 17:28:40 +0530 (+0530)
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
Subject: [PATCH 1/6] md: dm-crypt: Fix compilation issue
Date: Tue, 30 Jul 2024 17:28:33 +0530
Message-Id: <20240730115838.3507302-2-quic_mdalam@quicinc.com>
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
X-Proofpoint-GUID: 7F2gJjVNyKu4Ca7peWrUNmjfbZoySie6
X-Proofpoint-ORIG-GUID: 7F2gJjVNyKu4Ca7peWrUNmjfbZoySie6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300084

Fix compilation issue due to inline encryption change.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/md/dm-crypt.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index eb59b02f9bf2..37add222b169 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -233,7 +233,6 @@ struct crypt_config {
 
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
 	enum blk_crypto_mode_num crypto_mode;
-	enum blk_crypto_key_type key_type;
 	struct blk_crypto_key *blk_key;
 #endif
 	u8 *authenc_key; /* space for keys in authenc() format (if used) */
@@ -2485,10 +2484,6 @@ static int crypt_select_inline_crypt_mode(struct dm_target *ti, char *cipher,
 
 	if (strcmp(cipher, "xts(aes)") == 0) {
 		cc->crypto_mode = BLK_ENCRYPTION_MODE_AES_256_XTS;
-		cc->key_type = BLK_CRYPTO_KEY_TYPE_STANDARD;
-	} else if (strcmp(cipher, "xts(paes)") == 0) {
-		cc->crypto_mode = BLK_ENCRYPTION_MODE_AES_256_XTS;
-		cc->key_type = BLK_CRYPTO_KEY_TYPE_HW_WRAPPED;
 	} else {
 		ti->error = "Invalid cipher for inline_crypt";
 		return -EINVAL;
@@ -2512,16 +2507,14 @@ static int crypt_prepare_inline_crypt_key(struct crypt_config *cc)
 	if (!cc->blk_key)
 		return -ENOMEM;
 
-	ret = blk_crypto_init_key(cc->blk_key, cc->key, cc->key_size,
-				  cc->key_type, cc->crypto_mode, cc->iv_size,
-				  cc->sector_size);
+	ret = blk_crypto_init_key(cc->blk_key, cc->key, cc->crypto_mode,
+				  cc->iv_size, cc->sector_size);
 	if (ret) {
 		DMERR("Failed to init inline encryption key");
 		goto bad_key;
 	}
 
-	ret = blk_crypto_start_using_key(cc->blk_key,
-					 bdev_get_queue(cc->dev->bdev));
+	ret = blk_crypto_start_using_key(cc->dev->bdev, cc->blk_key);
 	if (ret) {
 		DMERR("Failed to use inline encryption key");
 		goto bad_key;
@@ -2537,8 +2530,7 @@ static int crypt_prepare_inline_crypt_key(struct crypt_config *cc)
 static void crypt_destroy_inline_crypt_key(struct crypt_config *cc)
 {
 	if (cc->blk_key) {
-		blk_crypto_evict_key(bdev_get_queue(cc->dev->bdev),
-				     cc->blk_key);
+		blk_crypto_evict_key(cc->dev->bdev, cc->blk_key);
 		kfree_sensitive(cc->blk_key);
 		cc->blk_key = NULL;
 	}
-- 
2.34.1



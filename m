Return-Path: <linux-arm-msm+bounces-61786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC41ADFCBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 07:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39D9D189C45F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 05:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA6D24113D;
	Thu, 19 Jun 2025 05:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQYQpTIg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648454764
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 05:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750309837; cv=none; b=UGTFqa5cV2uKbN1gy+3qvP8K2rLH9Lvo1d/ygU5SgMiN4xVwHPQoCC/JK8u6qhgj51AUCPesLJTauK6ai0wISfK8fmSAXXZ1+HR9YEcFHqN59fF1lKzpyBl9upj4uJxXbrCp1z1aGZmEDZFTcqPK9ZCDLLSZpcwG0MmAQ56NymM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750309837; c=relaxed/simple;
	bh=olvrA9VoAgGHjSGsRlyP5LDLiH3fWWRwt9BuHkcOrYs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CU8WJhDSS05eusV4ZFMf6w+YaVcUb0wGmrU6BcsBxeG4awPUCFftA1b9CGXX+P+eToPlUUeUGJRSg+POGtShdPEHrw3+F+qGwE/UDjFtQ05fmu7yvjt7KudM4VudKLYPFWiJxf/RUpFdW1xxpAjhJVJJSXy/KOprC4IzaFPrKgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQYQpTIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IJ3Bqf027539
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 05:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yBSzG2njIyjzGMlaHr5sTGjTp0z/ExZCJsw
	dGgzeFLU=; b=pQYQpTIgtxWm/1W7ghUqnJkFV7qvxjQQ+QSzv7u9+f6EMrqz3+f
	AWnkeLqOK3ek/+1/FzB/qLN80ffRNf37VXDOkVatWWCRaKCMwSCA2CkPDKd4OtOc
	RfDVcYIspZPueM3umo5wPDzzmvV98bMDzGHcqoRrWp/UFJIygGkRFwhNU/Y6Lg4V
	vXKgTc/5iHInW6+wRXEpNNbyUsZseteUGgMu2gkgqY+fCqaL8tdTADI7hvE1Lj2r
	PE7Sg+OF8CXNvXiGNTlGZVv9uzakKHqhSCheK0ZMql51We85rqJJgMowzrJZqNTA
	AqFBNbo71S314pLaxxQZBYjINnfbuBp1tQQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd6p4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 05:10:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748f3613e6aso207340b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 22:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750309833; x=1750914633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBSzG2njIyjzGMlaHr5sTGjTp0z/ExZCJswdGgzeFLU=;
        b=cFZzziDnSDEOoMcFYiNUI883nyq3N4P+LOEvOH6atViaM/Tdzg7esiu50JhlNh+5tu
         +/XVIM8BRbV+P1/phny0QfRv41aINkMfGLrkcePry9xj/Od03biRxH9l2T27HecQ4gjR
         m7UM9kV47Dmar7VI3kYayTF2cD1Hia9Bc6aNyk0BD/vZIgJdprPvHToo8MEOvIeodxg2
         XfP8MEV3hi0sSDlQhhqR5B/g59oa1W88hph3q+XNjCxEIfRrdl4Y6PaSBXa2Z9yjdGyL
         R/1XZOnKm4h80+Oq3oVmlrCNIDcdS2Hf8JZjd148NHXg8eeckm79dZfm7i9d5CQofarN
         rPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8qQ3uj3Po0b6kEFSgE9fuFEcqzJIQXAIdCyCZ18C1FCbw6dnoLhATQdUg9y0ELKAv8pI5N426gJYN7PWm@vger.kernel.org
X-Gm-Message-State: AOJu0YwbmoXHBHUoy6Jcz0mfetZRXefJkIwOVGqfExtn815UQVEsW9a2
	ZWP0pV3fcXyyJnUxsDIHfmbxkXb9KtEE26FWhqmTyby3W77G3+kt4woC4z9X/1PBgly/woo2VBi
	81EVn4+O3H8jD28WaxIqExVzAE3q3VZszeCw/mzsFPlAcCvUXSX2AAhBK/rF9vFc4dp8m
X-Gm-Gg: ASbGncsgEF5olIuwzhrv7i5MZ9kabVYhbOxuIUpo8ywYwYJxIwocOTdfvMzZiC7d4Qr
	WTArOInFRDL9ktPUCsSFRipIEo2dKAi1f6Cp7TBgrcXhfsyVoi69hl7nvqZMvuoyiK9t2uXfGGF
	W6e4GI0BTL6xIWzcsVKDoYDTNb5AF4Okhz6dao5gvrhZ8bBspmXFH7nxz/xTd8rNlPIkqYpaZzg
	Ndr6hnSDyAchRx6UgD9WMLQsPwP0214eNJmhxa6REWQtxUzyJZ3Eui0Ww5bh8Rf/vmq7Uls+IPO
	XJxviQO1b+PZDNp4XRAJaL0z1blpc6kgXQgU5zIX9JzwQHGAvcWKT0Q=
X-Received: by 2002:a05:6a00:2d8e:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-7489cd5c0b9mr26579015b3a.0.1750309832745;
        Wed, 18 Jun 2025 22:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA/WHenrVOufZGpGW9L1DNeVeFkF/dZeZeaY+6zyszeiKYWdLj6ZMmiPckF+pSaxxsR2z9iQ==
X-Received: by 2002:a05:6a00:2d8e:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-7489cd5c0b9mr26578984b3a.0.1750309832315;
        Wed, 18 Jun 2025 22:10:32 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900e3a09sm12124060b3a.180.2025.06.18.22.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:10:31 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v2] misc: fastrpc: Fix channel resource access in device_open
Date: Thu, 19 Jun 2025 10:40:26 +0530
Message-Id: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA0MCBTYWx0ZWRfX8zHd2+AIX2xv
 q6tZn/FIRa67PTpkZGDH6mUEyRlbn4bOUTBvpIzE4k9E9Qwch3H5tpiGjXuuqW2CpqZjKm3d8QS
 /lKQFj+h4sPRg3B14F0BNfX823WEJChYBeMyWJAoXSehDKFE8E9810r5ZyqE7VnCd1O+dL9jrND
 u/tawE+ksdT1fyB/dEBBOb/lDrl2vEM73jb6SMTavn3Ge7ToAmKCXVL7cvinCVBB3n3HUQkvARP
 jVdpI1uKuSgOtYBWQxkWFHdpl2oE9rqf2zcO4lVxtqz1YVcHZPlGqt31G6SZ6+Plpjc4wurKoLw
 KUoov4OiwCb0LIBr+Vt3c588jI8MmF+a3+21dpG8Sm1gA4iUecvbHGQ3qAeBMcpmXS7Pd+bssS5
 TDWSRL4AdkARYEzI0V/QWIHVpLSTKrqk6ooSsmVSi1xPPzxbIQqKV6X/0JKC08Bz7JGAoEKW
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68539bc9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pYQKlj0DQmeGCljNor0A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: WqA6yEpRa2_buWmd-6IdYOZsog3VRSp4
X-Proofpoint-GUID: WqA6yEpRa2_buWmd-6IdYOZsog3VRSp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190040

During rpmsg_probe, fastrpc device nodes are created first, then
channel specific resources are initialized, followed by
of_platform_populate, which triggers context bank probing. This
sequence can cause issues as applications might open the device
node before channel resources are initialized or the session is
available, leading to problems. For example, spin_lock is initialized
after the device node creation, but it is used in device_open,
potentially before initialization. Move device registration after
channel resource initialization in fastrpc_rpmsg_probe.

Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Patch v1: https://lore.kernel.org/all/20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com/
Changes in v2:
  - Moved device registration after channel resource initialization
    to resolve the problem.
  - Modified commit text accordingly.

 drivers/misc/fastrpc.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..f9a2ab82d823 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2326,6 +2326,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
 
+	kref_init(&data->refcount);
+
+	dev_set_drvdata(&rpdev->dev, data);
+	rdev->dma_mask = &data->dma_mask;
+	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
+	INIT_LIST_HEAD(&data->users);
+	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
+	spin_lock_init(&data->lock);
+	idr_init(&data->ctx_idr);
+	data->domain_id = domain_id;
+	data->rpdev = rpdev;
+
+	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	if (err)
+		goto err_free_data;
+
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
@@ -2353,22 +2369,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		goto err_free_data;
 	}
 
-	kref_init(&data->refcount);
-
-	dev_set_drvdata(&rpdev->dev, data);
-	rdev->dma_mask = &data->dma_mask;
-	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
-	INIT_LIST_HEAD(&data->users);
-	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
-	spin_lock_init(&data->lock);
-	idr_init(&data->ctx_idr);
-	data->domain_id = domain_id;
-	data->rpdev = rpdev;
-
-	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
-	if (err)
-		goto err_deregister_fdev;
-
 	return 0;
 
 err_deregister_fdev:
-- 
2.34.1



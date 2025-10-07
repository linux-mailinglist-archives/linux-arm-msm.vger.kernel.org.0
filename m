Return-Path: <linux-arm-msm+bounces-76201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED4DBC1585
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 14:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDDB31884C2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 12:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA882DCC01;
	Tue,  7 Oct 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jy1eqSnq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714558BEC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759839531; cv=none; b=LELZnfbfAnF9pqxqWocV9Wbq3tVlfgNRufsT/Ga9+gIY3qSdMZc1qusgyB8TWhk+HxtMIP4JJrRTVPP6rFBOYu4mPwpp7yPPGBHMoEgAZHqJ527gD8MDmkBYj8GdbYdzGPRbNStC9zYIkXbkKyiP0ckBDk7sBpOIZUcvaQ+Me3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759839531; c=relaxed/simple;
	bh=YeRRAE3IIizN91lW0V80oKuphT6zonQ16WmnGEnH3lE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hdN/6cG4Z2WJxw8YEkBDTo/b1J6Z5L0/tOC8wE0lNT3DH7vge3GQ0nUPQHWoSUKzq5nHs/9Buzz6BbuSLgCBgF7YFPwI71TEcMcL5fyRG1/dE3ttiILyrQdFjn1mVqOAhSSkG0VFYmMiSBFcST/twyR4Fxf4kU1hj3CZGDMuRcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jy1eqSnq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972VtuW013397
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 12:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5dWz3ECxHXJJo7so4Ok0l1Cq4x4gampn3mT
	o1GLrOWI=; b=jy1eqSnquNtQLr8vUZ5rqa6talz3DHZE5MzK+RIim9W02QO6hC/
	mEo79N6ARJ6QfOA/tXIvKglnzXWDn4KeYMDR+CjBxAiUvzMsGNcy6LtJkh5/BxuS
	4wuKTq9t5p9RXTaTnQoueC+C01IuMN1doSF7V5/IwbAnYjIleewEFCR1jD4ZaPGd
	Llw8+aiyYaUyzuHWEj0wS9sSGhP0p6YNYfATCDvz8m1t910fV2ijK7ZhkY8siy9E
	+71tCtUp6WWTbkzJ2cf+NCXppMvmuMVvCsrt80Su+VrmTEPec7F9kzwtzMAX/YWL
	Unr1o6mfSZEOA5F/oFBQ/CNvx5QkC8L/CIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhpyg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 12:18:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d602229d20so118257981cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 05:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759839527; x=1760444327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dWz3ECxHXJJo7so4Ok0l1Cq4x4gampn3mTo1GLrOWI=;
        b=ALsl4wiA/vZMVolpfUYRbz8nYudUNrA6maB8bDWrPTMzMker65nydLUMdl1l+wXkyx
         aOlB/yGVF2kLhfYSjRzzVH9OmlZ9GR/IXq99aPuSjB2mYv7mUUr7Jtg4fpmhodYTlbq7
         DYCgpGOyHi0AP2ncL78Q3saNBUrhC7gG5s6XpV9nulY2If+0NrhIMHV53t55gV6EA9My
         lIn/KsJtcjoz8n3CmmbsOKxzKI1ktgEewq/KpqrFQ+FjmzSiM/VoSU7Z2c4ZTjXN038U
         Uy8G3ZrOwfBJtxe0Iyxiw7Yh5HVwOau4jOVcIw3LNvSubXgwbh7QoxhI/1nE827a3O/O
         aTqg==
X-Forwarded-Encrypted: i=1; AJvYcCVIsRixhSZwEZiC8+wu4MRCr1lJnSXiIhaxurBAJaOLh6i9X2LgKyE2dxZa/wTux0zI9bOrwixrWb2J4kwA@vger.kernel.org
X-Gm-Message-State: AOJu0YzOEZBvYksIVTSR+qW7Vr//+7TTRPMW4UHvug6cSJxOIUXAv/Tv
	bxutxHSIhzaCLoYE73kcQTl49fQ+x7qTRTX5jN2hVl8yn2jUmZXdEhNldLZh91FmJkHoGmbPfkH
	//dI37F2uCNoN32s8OvhJv6blaa4gZBLKq1MgR4+3nD5ZaBiiJoiBkQM/bNe5dVw70v9u
X-Gm-Gg: ASbGncs9k0LEY+Mhn3scCYTQcm353UOk1bExZlra/lGmKQZslmmhNTsT65lSjLNzLtt
	GUTnSZ98ewWmI1uptpaojU7TbrCjxORHbQKpKYZGnTiIJjffwYyGtzwoNjnGjeS4CZud/neuwZ2
	D9fusQJ9dRyGQ4SSnpEj6UZ0SJbl/lRVyaiHqlKGkz2sd/atl3B1BZl46OLrPcaNlkplhYL7+0C
	YZA1zI78DaAoHrFokIu0inY+b3++KiwKsZS1LM+No4iJt0ceK6K3033SX/7c0+PuEPitLDWjPBs
	QRaoU5iW8m1m5RPxJcXT/voMQDE1PzM4Mn+pG0c/1qqbOMuZnuDq/6dVawDTqwY/lwHGZl/BegT
	R6OO2fnhatA==
X-Received: by 2002:a05:622a:4012:b0:4b7:aa99:5459 with SMTP id d75a77b69052e-4e576af2716mr221230691cf.76.1759839526776;
        Tue, 07 Oct 2025 05:18:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6SQQh91mohrrjxHh6JP8YOjkEi4tK0iTQoftOGQeGK+nLYdlU4L68WfYoOUfov+vajrKWJw==
X-Received: by 2002:a05:622a:4012:b0:4b7:aa99:5459 with SMTP id d75a77b69052e-4e576af2716mr221229981cf.76.1759839526230;
        Tue, 07 Oct 2025 05:18:46 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b315sm1383081066b.64.2025.10.07.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:18:45 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Use kvcalloc() for slice requests allocation
Date: Tue,  7 Oct 2025 14:18:45 +0200
Message-ID: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfX2lUAt0FVe37Z
 zUh+Uhz96NjFp8PmsAyGV26RisFgOKVLRHjhyho76Qi0AkCPtH4svgyeG7hOMe7UAygTUVkUaIl
 zc5E6lEQZV8MBq2qL3J38i/mC81+tl2xa8018Wu3KgEMLOoBuDuTS/fMg5PZx5Dh3HFCOZU5c/1
 gPaw5NW3jGIolgKUCU5pRa/CobpdAsBFBFybxya1dvoKKtlDmAkRQac96KClb+eVaMbuUx8nmYU
 IwjSbke3Ew55tu/LEkv/UKiDwgFFB2EEktDMNz1iIrV57SBCnkbZOQC0Gb9FRpXy31JyF+Rz9uK
 tT5C8xHZEbLL6J5UYy24T3RM2+xWeIJ634ZEy79XtJuwKwMmvGUltCqLNo/PHLuIcgk12veYScx
 MFmwU/5b13Gc0qc2Qa9HYUhZVEaIVw==
X-Proofpoint-GUID: pFbUf79l0NpqxVbSASA634RzPHbFnZCt
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e50528 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=CJ3JEFviXy7-Y_lWR7YA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pFbUf79l0NpqxVbSASA634RzPHbFnZCt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036

From: Youssef Samir <quic_yabdulra@quicinc.com>

When a BO is created, qaic will use the page allocator to request the
memory chunks that the BO will be composed of in-memory. The number of
chunks increases when memory is segmented. For example, a 16MB BO can
be composed of four 4MB chunks or 4096 4KB chunks.

A BO is then sliced into a single or multiple slices to be transferred
to the device on the DBC's xfer queue. For that to happen, the slice
needs to encode its memory chunks into DBC requests and keep track of
them in an array, which is allocated using kcalloc(). Knowing that the
BO might be very fragmented, this array can grow so large that the
allocation may fail to find contiguous memory for it.

Replace kcalloc() with kvcalloc() to allocate the DBC requests array
for a slice.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..27c24eb351c7 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -165,7 +165,7 @@ static void free_slice(struct kref *kref)
 	drm_gem_object_put(&slice->bo->base);
 	sg_free_table(slice->sgt);
 	kfree(slice->sgt);
-	kfree(slice->reqs);
+	kvfree(slice->reqs);
 	kfree(slice);
 }
 
@@ -404,7 +404,7 @@ static int qaic_map_one_slice(struct qaic_device *qdev, struct qaic_bo *bo,
 		goto free_sgt;
 	}
 
-	slice->reqs = kcalloc(sgt->nents, sizeof(*slice->reqs), GFP_KERNEL);
+	slice->reqs = kvcalloc(sgt->nents, sizeof(*slice->reqs), GFP_KERNEL);
 	if (!slice->reqs) {
 		ret = -ENOMEM;
 		goto free_slice;
@@ -430,7 +430,7 @@ static int qaic_map_one_slice(struct qaic_device *qdev, struct qaic_bo *bo,
 	return 0;
 
 free_req:
-	kfree(slice->reqs);
+	kvfree(slice->reqs);
 free_slice:
 	kfree(slice);
 free_sgt:
-- 
2.43.0



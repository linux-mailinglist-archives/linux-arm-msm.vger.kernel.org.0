Return-Path: <linux-arm-msm+bounces-60383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D45F3ACF701
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3930D7A72AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B9527E7C0;
	Thu,  5 Jun 2025 18:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdAgdvEx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2F827A135
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148361; cv=none; b=OoRowU6y1CtAatX7xSOXw3Fub8iGeZNdQqHt87BF9rbhTA+PNN9wj9SRH2ljnY32UvhtuTCrCrcfb9BohKL1dp/BdBQiYPXNKJwPJLINiOV5Z53r0ENomMnfwv8nEOGEsQ3OQrQ69xeJH4TsQiuio07FNyo8pmjWemxSfVUVLJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148361; c=relaxed/simple;
	bh=CbdUzDS0r5evR14HE2y2m9T+o2DmOJlOXmMaAhyMoOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYOwOhICsElVmIn5/Gn/l4aftU6uxtpZ2BQdFpbI2zU40HzzLBKy8CzNolRmQ0Svt2fXmlFJ+ruKMUpfPCIW3qSTNm28w68XuSi7ikCVvQm7T6KqfhBfvx//JXSN+YuM/F6qfEHtaZtZzGJCE6PcwxIlP+Siam9uGrsksK/FiFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdAgdvEx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HNMa3013506
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vb+Q3ccg7Qa
	sQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=; b=TdAgdvExjgLyGj34idphX4xSZZ7
	pgITHojzHMnYNLmEHWmE4ZKRINmCWwMX2v/X9Bb1lCsAC/BXVtoG7/9cXZwKhEqh
	cftJJCR1uhcgs8LQ/FvCcVbuS/AFDM6Hs599yk/7hqAieIUmy8FekRqeZIxwV2t5
	ZBDkDCf8Blm4LxPgQ7NzmScNC5n1fNjVTAkx82Le/2vMFA9CIigDoV5gZTwiMKOm
	HeyPvANF+SLmQ3aud4HAprnJH9KDH9COrJIcobX18Ckmc+TF9NNtxutC5fbhxN4t
	jPJn3m1/0pgkL62zsyVZgzVV6A+8CiS9ootUTpFz3I6AIFRsGhSqNRf6C9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nt9sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so6206575ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148358; x=1749753158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vb+Q3ccg7QasQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=;
        b=RB9rysAX9vL8m9xsS9zEBxaKEz/yql0zFT9FrWk2JmN8eWUaGk0O7PuolSflKCt8vh
         FrLIwYWlzdboV1FAQPOHznf9Gptcyi5dWTGSc3gBIMsTJyUtnnGYMTPgImREQO4hkrfM
         PJTYhSlw2TkK+m2eQasEqVQqkSagDrf47RfMMN4HUkACTTBLeJvGLyUmJc7O9iICZoOW
         QBk2WSeRZst8HjbiDvGJAHirk1R4CyNB0MWDpWoHcNk+EPF2UzvkJfbH2mSURPDaiGiw
         +xCY76vRu5HjibTQyseqphtMl4seZGkZcrF/JTQhLIMS6cSsh0w8GzYtgtpSRCLWAQvR
         NVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrigbzwP3+G+pqVoPUXLTX2V1n4HrqnwjEa2p2X6v20vH31yETOOH6R1RY0kMGcXecWdn9Vuiitvv9H2GX@vger.kernel.org
X-Gm-Message-State: AOJu0YzuAxsOyEQdhXvgZkNhVLb3EZREh7Lv5XTXLeK4W6q4nYs0gSZr
	At/7JUaW2pII9phgOLcECQcEgtQkvSzhrMwB3RKBwb/emShyUAGCkbaPapn14GR/eZhyHsR87w+
	s3112Mh2mB0x1RYjjlsTqfR17JFqqGoqJlq0xQwRnFYVb9bNckEYS8xXCzvkT6ry9y1WM
X-Gm-Gg: ASbGncsNFT6nILIW9ZgfZu/yywMrGlIB7XrCS/SqsshFssh6yT1QoyqEIygMV6Efyx4
	ReFMBsxcWCQLgx4h29k9SDuPkQEqcIPqewvwtv/NmvIfPILIMf2sUcORW83l1e8ITVe0D+me1R1
	RlAKRWNqY++gpyQpneqSz5gIaKNasWy6C9TUWeXB8YPSQNOImk1n7xX6ARu88hGSK96Au6V67pk
	D3Z+x6R4ZZOMeDSev7lo3/GjAZAS7v8sGizpOUFxELBcni7uejFsVSZF/Zit2RI/WcOeUGf5sTL
	3keFyebxeKyDZpBT527sBQ==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr6602455ad.38.1749148358331;
        Thu, 05 Jun 2025 11:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhgBS88FiFnJWBPK5j4gpjhnAM+FBu71NhFYDWj/9txYixjz/XfgZjlMTKenwua3ROM/Jrug==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr6602035ad.38.1749148357957;
        Thu, 05 Jun 2025 11:32:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-235e1e4ec12sm30594695ad.11.2025.06.05.11.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:37 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 10/40] drm/msm: Refcount framebuffer pins
Date: Thu,  5 Jun 2025 11:28:55 -0700
Message-ID: <20250605183111.163594-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nOt6Hj8EAOy4dyg8_f7NNgqntsCsqacW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX4UIkH2sZwvvD
 naZblx1u0B5nrurUjlJdp7JKen9t2o3GSx8wN0EfbA97QtMW0LstWH/8KVPAWjoe+ixMBOZxu9p
 4/KEATu40j+qDsGHs8zuO30EgqSByFLJrJ3U3UP6c4WbQR+p9BnCHBB3iqt7QhvYlhRtOpAthFF
 anTfE7LWL0/vodNcEO1ZScbVbcViUcGvlDMYlsckIvjMBN/CkkfOCvtOHjNjCL1xcNbRA07+/al
 0WYBRC3P5Sh189i8b7OCuUDRWozr184ZiadN10yEjBS6+Up7QUR870lDktjrBRK/AFjucPYMyeg
 B3+HO9a3346kZgwbsKH4cEOpnaCeb32xW0xJhLriMzazbvv9SKtA021wyKZyCP6/9wzl2bciqqJ
 aIV2x5ZZnJ/Gu/hrFoTbZgXONxGrOyqScvqylIhigiOuvce2p6XEiOeogDpfdMRlobqiXFiT
X-Proofpoint-ORIG-GUID: nOt6Hj8EAOy4dyg8_f7NNgqntsCsqacW
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2c7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.49.0



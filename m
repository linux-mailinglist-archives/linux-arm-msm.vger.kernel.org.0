Return-Path: <linux-arm-msm+bounces-62942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB09AECD6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DFF63B216F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF417234963;
	Sun, 29 Jun 2025 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJLTgvGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C90A21CC7F
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206057; cv=none; b=bewIzkZ+udmuMdujaXigx0zclovbY+WXxdlLdztm49Y1C5F9yXaPOCSBuxmTFzmqBvXpaEZx6uTxD5KXpNR+LFQPIJ7AMMYRDcqB+EtoiI/J08sgcmJuzwPLvkKAfuqrpNKWq+MiMYZvNj5xRtKLrjcOl2FA57XeMgSbnBr9ubQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206057; c=relaxed/simple;
	bh=LF3WmOXEduF0Yox49Tqnc+p3MIWedMqeUKG9yrG7bm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4OnOg/V1j7i2qTZkQixgikxZN6+H7YHQfr9xphRFqYzJfXxTOd8yG+AC1Ct+FkOQDkSUib8AZ5w5/uA4mUa6DWYq3YtD628ahsW1hhzVBvjMIHjKmK2wOc9j6fkIdfJCxf7ySBx6e23OhFTLZ2X7fJXXlAg4XwfqiqECQLFZiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJLTgvGv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCL5FH003704
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gBDfAmEkonF
	ZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=; b=EJLTgvGv7cM4pboAKIJUs/p0bC4
	u2ueRvFtICLimKNsS1h/VIeJUofb1d6od40yXmuGaEkw9HhzltPfGUbz6+qrncCv
	MiszvmyK/rZ5XIGyEU0XXxqNRXbUvyd+s9SjSV8MC7QQUipnzfLrBHm0rNZ6tfOO
	xT5z9oH2sFLbvpauyBPLWnvOSigzOT9YwA385m1jRebwmExy7S0NT/giJ0ZdF5JE
	DWctCccqYpzUNB2LK5fXsClVcbFNzuWlSiKqEQDqSpINBxTDB1k5pkFR4UiFytIL
	PXP9rCvvabH8QKuyaqoyei5woBqhITCbonti3xvNHvbJF2fny29dW2RwqvQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm282n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso2356505b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206054; x=1751810854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBDfAmEkonFZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=;
        b=jKI4EKypWsNHfDNFrlJ6a3m5kXE6/4RQzXev4d7C3i9+pI9KdfX+Jpe12kcdSkv+xg
         lGzGDUqwWl1zFusQaM4iglq86yLFpHYbvMyR7pBu9PxUsFKIK9fwxmZlLdSDYuUnbNMs
         LuzqUK1FGC4LRU8SA3L8QX/LYwAYHYJ74/pcgKgKWCSMNVMTT4iFEUUy5jThuUhqLjtt
         FVsrYWHVSnu/2gwQAk9xiX8GJA67cvzCLSpYnDnPZ21yOG0TOTgjkl7JqgFulHElZk9V
         STPzoQ8jx+rk+8IifZ3aqv5yxzbJkxUO3ei0i0OVbtI3ttQHGdihTtsYfH1sLKKDIRBY
         fT8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVprGiE1E4UdKeCOizZLd2a6cbXdbaMBO7Su/imJN/XxGPt45fSoO2YGVTcKtcDhXQD5poiaTw54YFVodvJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl9M+HJ5qZ0enB9m/O0LOJMY6Tc6YlXy699JgdfrW+vfd8YEE+
	T3OzpopEn6bG9oz1uWjVNS16g3iOHsX6FVUZpe8nJxst5eXA1vzfQ9H7lSIX6XURZWluSTOVtXu
	+pvWoZRVPsRFGtJLBxdzapozsm/uvlqwbyB1EkZonxSJXURLJD+780ZSvohLt109VGoMv
X-Gm-Gg: ASbGncsVoZBGOi8Ze63s6hHJxqaTStzTiuLta3QQXx3T0ZWE6J8InlTLIcIRP1rxyli
	CB67tLMlOCT8oAVqjEzUECm9j6gGl31i3t+usGqeG6Ni+TiYFLP+nWcHibiC8sreZmnLWBXjUV7
	ku3dQk69DPALPKjxn8Yk/JqEE1ajgMZm4sOKCq7MwnqqsKE4nilihzNLn9QCzI5BOsmV/rssbTe
	kpblKQlfj2cGQj9UmJ/N2K6GUeLIOYkHwbk8Zomj93tn61tj7KlJxoFZMGOKosMSnd3WXJZu5ll
	CkLeuj3eYUpGnC3Q2Ts5RPu+j3rYaWF+
X-Received: by 2002:a05:6a20:a11c:b0:218:59b:b2f4 with SMTP id adf61e73a8af0-220a17f7369mr13582065637.42.1751206053798;
        Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU+uDb51M4Be0+7RJfEMhzdKWdXH2VX5GhX5PZfc1zJAcJo7bdy/zfcmW3N5NdF26UuMWOGw==
X-Received: by 2002:a05:6a20:a11c:b0:218:59b:b2f4 with SMTP id adf61e73a8af0-220a17f7369mr13582043637.42.1751206053451;
        Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af54098b9sm6581953b3a.33.2025.06.29.07.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 12/42] drm/msm: Refcount framebuffer pins
Date: Sun, 29 Jun 2025 07:03:15 -0700
Message-ID: <20250629140537.30850-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148a7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: xnHPjXrWL-HepByqkdacy1SFNYSJoTns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX0ujn521013Uo
 FafLX6800/Vwd1r6kU3zrp0xriEKMflirMCNOhWvTfBAtGj8c/zJ7O75qnAkRWi6TtCwuvySq7h
 yUil/BOjA+I8RhY9tyoDXbNhpBbHAvtBm26IU7XzC2ovjOYnqtDA0OkOgJFjteUTF4picNEV4SD
 /nq05nrqnzH0PlCDcucFns3Uoat+Lv62q2KW2IeQCrkd39s2YlfMnFuq9CEKvXE0jcNLSsYQJhZ
 2hip89/JSK65W0chwn0rWA5pdeqRV1suqqlLcwIqa8RFiBMNb/vvZl4CjtEkb+MeSdWKSj1rOWr
 57jNq9uUGcYyTIoslzW4+q1R+7jrc92kMR0nsUrnDf7ZLgYR71mGuPLJL9lv3C3hBiNqMREVVQ/
 YMFZLQTZYca04GNtATMM8zmXxF9cy9+rswOdZUnxzfMvXa12Xlr1rfkp4552b8/tH3CC/ISb
X-Proofpoint-GUID: xnHPjXrWL-HepByqkdacy1SFNYSJoTns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0



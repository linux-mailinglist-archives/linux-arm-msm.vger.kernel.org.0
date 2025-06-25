Return-Path: <linux-arm-msm+bounces-62542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9C3AE8DE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA21D3A9123
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F4F2F548D;
	Wed, 25 Jun 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzcpaVVY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160192F5319
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877951; cv=none; b=uzKD3D1Q3SabKaHiMdvWo5+9CfHTIzK+tZWUPKw0NWT55GvnU+7zr06uW9fJZLvt9q+n8qrj+X3m/Qtd016qlrmW+33sTkzzrI9ys4mz4ILaYcXkboltB8M+x5LHgNApT3V0Ra6wuXacnaDl00+RreKkebR+T2qlnfNLPbH5y4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877951; c=relaxed/simple;
	bh=npcaXqJDoSyMBRhF30x2mSPk/8hD8RjcLAdanR+hf0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0HNaKZa0lZ+uEs6kwbQFtPOI58+jEsGBxn9f6VBuP4GB2+Bh4Tpu8BoEXGlgNA9iSWQNsFXQRU4ypr2fGOqS4adf3eTLvIkAk0akBtYnlKaClzLo60/u5h5CC1qDso8JXhQmlb3Az3ddcjWwSu6Eh6fOEnb5A03mIQ2krEshv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzcpaVVY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB4PHr001124
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YGw3pq0xuYX
	eB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=; b=fzcpaVVYOQkPu+AqJEW5xxL+2Dr
	sJP3/k/nXVodPhaR9Z9hZrRWY4HMU8w72ygsq5YB1dpf13DKZvItcuz5f+wAi/VP
	hOkxdqxdmV04cGSmv0e4Ir5FV3NVrrAmO+78pQZnaYgFKyN/+tdvGxwTqxv1cVgy
	I8xv22yU/UiN2LtRjtwIVKf+E+4NpmGe+N/fm0xsD0hk2coNB8Ywp9hChf14zoPX
	LFp0IMswHz3huuewD0tzkhUC3dnTqqDRiqHA9/gc1wIEbt0YW65/VVjz/K/coDHz
	ULLt+3jqg5VHX70xrK6un1LsCfZSL0CPM8mxbFZv8n8PpoqyPCw8Q2jDsug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1yh1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e7550f7bso1590695ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877947; x=1751482747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGw3pq0xuYXeB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=;
        b=sKeeYyQrPxrNLlHPMZcwZ19Df5pHwMrCzKTEAajLW95VE4TcHLGJBmwd+EKFddYKVc
         HFNOecYsm7Qs4lAt38tfx42nAQr2FPnHIubGPLNvaQ7x6NpptnhQz2/LHRuitjgjUXdI
         WFsV1Xx+xbewiOUh8teJ1pw317fqfdlquQqjGZtJmD6Cl9SE3fWH4LRTtXJxL0a2H9il
         uEukLxq5tJSkSnU2vXG3H8ct1uoYnr5bN3rtT5T0sNx75ba/oc7GWKuppPKNKHyh/NQu
         /gdS98tczxhqkIomkeDSE08g9bdDWg8Sr6WBij4helpANTHfy3hCy/lnpic9xxRWSzCF
         +bVg==
X-Gm-Message-State: AOJu0YytbIm1S4QdL752p7xuVzG39ATjxEkPG/N+NbGINjV7ed/N641M
	cAOM5GdSs6PbAm6E7Nold+qSA1LseFMpjIhFGYCltVe2rQfCgGTcLkyMnITSxmqPtAUwZULCdrW
	HQBTysaLF7/V93bL0D0ANiraWud6zy61NnO6nhMqux2NIEyBBjGlA5+7LP0lyxKZPbrdw
X-Gm-Gg: ASbGnctZSjVfNfhOTeKPgRiWOZwbSCjRrW77zdQHrtSUnRlnGlda0LeK8GJIpsFl3MN
	+oadaaQIxXY8A4/nQktkNIuKgyxFoiI86r9+4699L/e7/fDzaXOOhmqnV7fsaC5jLlwSyVO9IAZ
	6voWiZosVyc5dcfbxcTS8614Ni/BtyTfJYOY9V5TnvG+Oqg7bCPKFfI1ioahnxZcPoY/qneO9eU
	zG3TSmxdJGbGveF6D1Qho0aoynWUUHLO79Nek6yIOdasmkA5KChY8+oYvrWPtsdyhKTtEWl4fEL
	Xp+jKDDBS/pT15ohkhuqRz6tjOMQPAUA
X-Received: by 2002:a17:903:2bcb:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-238240f5674mr63435605ad.21.1750877947528;
        Wed, 25 Jun 2025 11:59:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWujkmyQJzCosZxG0/o9huVMzGmefy+6BjUnqrS3MSq6Cgpe4WC/Xv+9jKHpehtNVJ8NIU0w==
X-Received: by 2002:a17:903:2bcb:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-238240f5674mr63435275ad.21.1750877947137;
        Wed, 25 Jun 2025 11:59:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86628ffsm137223375ad.156.2025.06.25.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 30/42] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Wed, 25 Jun 2025 11:47:23 -0700
Message-ID: <20250625184918.124608-31-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c46fc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Qb1dxlN5FpjXLlt41XZg3XTUcQ0JAKYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfX4gBy0/KTiRSK
 pe+lMlmOZ1lEujp+URVQ33pu7V2TvtN1Icj2dBvyiOhx6pICZ+9aArQfh90Upe5/Cgi8dWB2m5l
 Od5P9K98q/OOqR0JxcdpYKk1g/ovDoRyFgO7yhlZRbVKMSTnIVs4CsWyQ1kR0kK83HkL/VIqTpb
 xh/86wokfSKBV5bo4f5Apk6uM4pneq+86BPCCEC4vJhcNx74uNUcz6ApT5Zl9mReKNK/+rt3AtH
 +hWsFHfjsmmI8aryBCroyLhI1We1a9TrvZHCe7qtYSp6np4lfhrOoVh6wvZkB2+lgQM3MpSdJQX
 rsYZkvnn6JNywm6Pn6WogZ02COTDBDyxNtHwZJ9UPoCvJ79C7SMByl7R2uiavKY0M2jHcazNHbE
 yAosogXaTEEpR2OgERuMeL/gRxUSDDwnKEeLV/hC7wzj8GImHblMPTg29lZK4kw+RT3M89pb
X-Proofpoint-ORIG-GUID: Qb1dxlN5FpjXLlt41XZg3XTUcQ0JAKYC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142

From: Rob Clark <robdclark@chromium.org>

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ec349719b49a..106fec06c18d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -97,8 +97,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -903,7 +903,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0



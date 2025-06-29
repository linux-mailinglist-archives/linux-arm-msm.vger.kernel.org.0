Return-Path: <linux-arm-msm+bounces-63026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E2AED0EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE2173A70B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857102652B6;
	Sun, 29 Jun 2025 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otwO/6/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895B3264626
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228239; cv=none; b=HVcud6FGJ372skEg3q6fS3m2d0KDuIwrur+Rr86Wye5bkowxASV00WYTM1kiD4QA97H4FQlZVfVyl3OYaGKlOVH8WJE7LeJJ0aIheiAJgNJOPjHOVC7e2OJiCQYhdKEQrheA5Wsv2el9lqFi8Auc+kqy96HJwme9QKtTRQMH5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228239; c=relaxed/simple;
	bh=gTdjIx8wy++YElnZqgMmZAa5qptcrzEPn6AG4VdQe9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggsE16vLZy9grMEbMC+BqiUzYxhujPnCVerTOdR74PQSRGz9hSSKzVrrJgF8+drRqMS5EKtb30SnSLqlvAC1Yn2qnUmApEieDZ+zojScaSZuKbub9l7LB1NOvtRqPuftatauc5Kj4+kZ1jx4N10LQ2P+iJgQN5stqrN6HlhJ5/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otwO/6/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TKDVl3014373
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ufkxvlCaXqE
	+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=; b=otwO/6/QlbufEGIIqV3elURmoR5
	wmZaq0AzynUV8kft65Y8NbAAcDNbInMYLYrGRj08kPp58lLq0q4cbfGrAuijlpM0
	hEn9AoB+RVt9NflNd2jHG+exUbH9f3WzmUTzhaL4fREj5GN5C1ts1Kfnlm5vl36w
	8mEHa3lROIUKe058VXHnc0Ar431lBJiDsXevih5IdyFM8uXNVsyiK+A8Q/1IiRs0
	0D5gPAtedVAQHDWSVdkxXRUtGmK2lZuWftjlN+WX1pT3bRF+40r+5Mx/PRFEBmFR
	P6IZKg2lQ7CG6cTUxcPSKgZgbMKmbD9WdSa4DygOLZSQMgQHyi110G3hi5w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801tmqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234f1acc707so8125495ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228235; x=1751833035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufkxvlCaXqE+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=;
        b=UxhNJ5ifWDxnL9W9sXYFj6ae1ISIRMtO7gUX/llwt/U7dTKPqRrpiB9Hr2OU+Qy32v
         ssvZJgt/5c3qYWS7QLqITIjXiDx2KkrzCELtHW3sxXHxjc3KeDguxdRx6HVCEc18W8/U
         3jovaWZ7AHs3402gD0MLqL9Zb7dE1s5OwaDduaOJ/IwHNiJpEmSgt0t3nAMFpT2GqZ2c
         w417tL3LUFOCXxV17EXQLdJ5ZBqDQarJvbJWfmbkPo4rDvQOmnxQn8/Q0klfFNvNiWmP
         mOW1tnnEPTsef6SJuW0d56KLFg/u2TYg/GWfFNHne6PHI9fCz+IiEsusbePwEdtCcv8F
         31NQ==
X-Gm-Message-State: AOJu0YyAM064Vyd1OVxyoPdQfVhYLQJ4FxVfm+12nr3Ub4Quo8kPWJYs
	arJ7eqXdqb9wenVOFfUzhBEn+dT6o+Q2GH+vrTYmSp6tQRIxjnd2Kb8e7k55yIvYpN0VHvouaVK
	sHkqMPziws/gNPHqdrytM4KtydaQvY7M3jFwSinLLQYg3JWcWUoaIUnwDyT3KAb5j3Mfv
X-Gm-Gg: ASbGnctWPXUtevxf4y0/tOlS6r33Ee3rOD0+u2yZhfK9opM9Tn7O8clkPiNpVrJSLuF
	KJrjOmlbT9YrGPVXcAMnFOgFlAMminMfJE7+o7aO9NlyOrAPurCuPLetHyPY0P3Nq1u7TlmYWa/
	xQe+V+7OAhRETjPKBgRrFiKaSa3MduY/JIXGnOGOjQKI3C9Ig3sYUggeqXoeBLwf23yFimv4zZ0
	oY9gIbYW6mN5FFbZQzDhGHNlMzdfPK5/H43i85G1jgB7208UnTjJjWJkZduOnCbXIjhsLNJEXcZ
	o27SB+1YzoDkITbE4JKzdPDqwtqSQWFT/A==
X-Received: by 2002:a17:903:1a27:b0:234:b735:dca8 with SMTP id d9443c01a7336-23ac2d86b33mr141348235ad.6.1751228235228;
        Sun, 29 Jun 2025 13:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJvTw3e2vrywZVxfjZlEoy2MYDh/wxsQwXvulz3VBukHFPPCVpgZZypcbvOisjgkgC2KTm8Q==
X-Received: by 2002:a17:903:1a27:b0:234:b735:dca8 with SMTP id d9443c01a7336-23ac2d86b33mr141348005ad.6.1751228234806;
        Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f24c7sm63539985ad.82.2025.06.29.13.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 39/42] drm/msm: use trylock for debugfs
Date: Sun, 29 Jun 2025 13:13:22 -0700
Message-ID: <20250629201530.25775-40-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SHgvlEBHzc-WYXHjoYXWWNhQeqBCRJr8
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68619f4c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: SHgvlEBHzc-WYXHjoYXWWNhQeqBCRJr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX17oSqrEfayma
 TSS2nW9f/TaJN1edW0n3KCCPProa+4b9Pyan/zudFksdxcz6c7/lsd7HAcY4uIcpqVr3+tnrsGJ
 6ktsSXU5h5Hl1pkRBJ3+W38YGvKSWnCyULkR6nJXU/RQx7Mo8LitPJq5msiDE2fiQlDzt8fkyW3
 VBpy00iedwDA2hFDcH5YX+9Y2skshtpa+eYKywAULoLus+uBwO7mPshPdzx30zt6l6DF8FaTVdO
 vX62BOpUcXaKnB8YWs/fMkBfFkCM4JtV1rq5J1dJzSsRTcv92xbUIs1L/g61hAcrjHsFBd7N+u5
 f/RfpqXJk7j4geRup5vbW/FzUtvaFoJWxCFTbTlwg9PtNM94gPH2Cm0J0nCaXtJtYYHz+9UsXQ5
 J+KiRZjtULdgy98BMUeEfkCLMSBw0GLPef9dhy3nfd1pBgtFZg4mG57PBFCf1lKvUNlmDfkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e3ccda777ef3..3e87d27dfcb6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -938,7 +938,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ce5e90ba935b..1ce97f8a30bb 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.50.0



Return-Path: <linux-arm-msm+bounces-63013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C5EAED0D3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C591B172D60
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBB725B31C;
	Sun, 29 Jun 2025 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXakVDdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222423F413
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228218; cv=none; b=R50NxGiKt4aKJ40q4twhwnu2aroOZyb6QHIhUNgIf9ogwtM+yLKccp8CO+bWxJlmIqr20QjN9+LjN9VbxbDcvcin0cK3JMDD9vUL+ycS6ChzbV9ajalEsoSq5bLpJX6alM7CAlNlztlhsRnXuymMNWekY2Z/EyasxHNuaFY7sYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228218; c=relaxed/simple;
	bh=r1zmu/qH1gARr8JF3JlMKkzrZ4FQv9/Rjdy5KUlvpfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEYP36pBLPSpFvnJF2HNHc017WT5+ghOjB65T8cz5Ohws6OIq63FKyCrQIo9yGwpRa09beAOeH6seSszEIGVB/ZB6MBs/0ZfjmDDR4d2EpKybJgg9c/HGL5G9DB919/i5NvNH362BMjdsEx2ULBK+7gtbZrBLPIQEyhIfiAdXkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXakVDdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFHZIr017027
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=POLN6v5Lpeq
	4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=; b=jXakVDdUTAXAmDbl8kMVcFG7Poy
	NYeUqU4wYtJYTznqIKlLMdkB64iRMu4VxGlEf7rUxr6V4aj+EYwBcXxScLXkN6E+
	I17FoWrVG36f3ft2xOxNoPEAjMBXmiAgkiLPyDdPKJoabrfhrPjuHs221FxmkK00
	BFAUYDkiYV0/LwyzilPfBq1FwSAIGfWz/P/7RhHz0wLC2tGT1lgh5EvudVXMnX+2
	hPAKJ6sRQbLVDztGxyC9ibOo7aq3SHFXMImizRKHK7Zj388KHIyqoOrtN5PkhhFQ
	UCGdhhGMrAYEszD5UH6Dbq5b8B0/soxZczk9roq+doV6UvaNyxg3Al/YcMQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjps8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74880a02689so3017129b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228215; x=1751833015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POLN6v5Lpeq4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=;
        b=GIdAHbElX5Kwboz9H0tUPbBplQb8GhrPx41VAKu++IkmWY6ha0yrALEOSS62/vmz7y
         +B00LmAATroIBqoS24RacHe02g8LN0rt07iXYy5P3Pud5/istULOHxITXHSckU0/OOAc
         /H+5pRm07dahgAK1JPO/JPHhTFs+Tu4tojbfwHWIldl5a0Wbew+rOg283zd4rxYTP9w2
         Ur4j86e4TeYR8oTaGBUsbhkMMvMX4/qd6x99G8KhxbsAHD9p1wu/ciGjTXM2quxPQ9oK
         kEurrz0DSfqERWHKdtkYPmCKb1RuZRj07z/al7Il2ENn4cS4wfkEMVZ/pjSfMdJCAy+q
         F5/g==
X-Gm-Message-State: AOJu0YwHl1cTVmF/kGeebDxfOvrJkF5wOhv8Dbb8DyGDXZ0JhqULGACB
	kKUsALPUmBrLKOgfGcwgIsrtzNX7Nw7nHo2wgzsz4cb+Y5JyNkGFSk4PsbG36ao2rICkHf0fkQK
	LT8YILoy1c98vW4mhOIG0Vcv4+rVkbtxZ4HwLV+UKv695CoptBj36wRQqh0Rqe20IqwhP
X-Gm-Gg: ASbGncunTMAlag5NPCD58rB8QK+oQTtS2sajtiGJRC9Hyz5LFU4tkzqzWGvFqwPWq1m
	EktRsQJT+Km2tES/JTVCcKXZiUHhfP4PDW+Jnt9jfmD4Q0AiSmas75gA3AGEtPb76zwqe8aqbe9
	LTjCkRkNHSm5hW3mgdpwvwRBWq8Uw854FBkuDQNlL6MosUD7yxq3oYqdmVj4kWn4B1txPqY8cHc
	og7sqLwOZBEHsLX71Xt4pG9qLp2rjwxAfW/it7+eWA8VFjLB49605BApbTDYkvLNrg09T0S8k4a
	Q+FzirGojPR5biMvGR6925CYX1pvuFKxpQ==
X-Received: by 2002:a05:6a21:2d4c:b0:220:5c12:efa3 with SMTP id adf61e73a8af0-220a17fa94fmr14766038637.38.1751228215051;
        Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHLdPOpOfhHnUXca9fxgn7Is+j9F3do3zCU7Zho79ZKpG8mV5KD0ItKS+VliQr14UVvffFHA==
X-Received: by 2002:a05:6a21:2d4c:b0:220:5c12:efa3 with SMTP id adf61e73a8af0-220a17fa94fmr14766020637.38.1751228214658;
        Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af54099casm6902136b3a.3.2025.06.29.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
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
Subject: [PATCH v9 26/42] drm/msm: rd dumping prep for sparse mappings
Date: Sun, 29 Jun 2025 13:13:09 -0700
Message-ID: <20250629201530.25775-27-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: mWX6gPvXjylbnnbV36CFDOUL34byKL1a
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f38 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: mWX6gPvXjylbnnbV36CFDOUL34byKL1a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXxw4Q2fDdraTN
 PnmHDYcHp2a0E/nNno7RiiBm190viZOFJ4FthDs6L7XV+zbnbOeLvl62CaZrdlwXoK/hmMlIMEO
 YV1enKYCTu/XQAZxFLrMlZHu1Vqz5qyVz4NCFGbgPoXJ+mL383xS4CR8XDmfy3APTrO+9sc5BiG
 PF/g9TB1W6d9JK1S7s/VW3u6lTzFmZpRa4ekvlFHfhm7pyx52D74AtfHxt0p5eOeyDkbr7uCe13
 B2MiE1D8PkpfnnYnEbgqEcZrfzn4ZkxtJiqn+ANk6ZKO4W/lled3ekrb63L7gfLVeA9B11I+I3G
 RyZCDe8o9f702rfV/2Lb5WZ+RvvK+9egjRzl3LiyCCvZqJmfs/4vnJ1gy/mk9z6KynYDsZmf7Au
 a47Rf2snnqi68oH44BgKke/L825Wd52++BVO95nJP7TPkqgKQ8QWeZRIxMCdZ/wSWdmUy1Oi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f2631a8c62b9..3a5f81437b5d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -403,14 +403,4 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
 void msm_submit_retire(struct msm_gem_submit *submit);
 
-/* helper to determine of a buffer in submit should be dumped, used for both
- * devcoredump and debugfs cmdstream dumping:
- */
-static inline bool
-should_dump(struct msm_gem_submit *submit, int idx)
-{
-	extern bool rd_full;
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
-}
-
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 39138e190cb9..edbcb93410a9 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -308,21 +308,11 @@ void msm_rd_debugfs_cleanup(struct msm_drm_private *priv)
 	priv->hangrd = NULL;
 }
 
-static void snapshot_buf(struct msm_rd_state *rd,
-		struct msm_gem_submit *submit, int idx,
-		uint64_t iova, uint32_t size, bool full)
+static void snapshot_buf(struct msm_rd_state *rd, struct drm_gem_object *obj,
+			 uint64_t iova, bool full, size_t offset, size_t size)
 {
-	struct drm_gem_object *obj = submit->bos[idx].obj;
-	unsigned offset = 0;
 	const char *buf;
 
-	if (iova) {
-		offset = iova - submit->bos[idx].iova;
-	} else {
-		iova = submit->bos[idx].iova;
-		size = obj->size;
-	}
-
 	/*
 	 * Always write the GPUADDR header so can get a complete list of all the
 	 * buffers in the cmd
@@ -333,10 +323,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!full)
 		return;
 
-	/* But only dump the contents of buffers marked READ */
-	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
-		return;
-
 	buf = msm_gem_get_vaddr_active(obj);
 	if (IS_ERR(buf))
 		return;
@@ -352,6 +338,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
 {
+	extern bool rd_full;
 	struct task_struct *task;
 	char msg[256];
 	int i, n;
@@ -385,16 +372,25 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++)
-		snapshot_buf(rd, submit, i, 0, 0, should_dump(submit, i));
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+	}
 
 	for (i = 0; i < submit->nr_cmds; i++) {
 		uint32_t szd  = submit->cmd[i].size; /* in dwords */
+		int idx = submit->cmd[i].idx;
+		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
 		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!should_dump(submit, i)) {
-			snapshot_buf(rd, submit, submit->cmd[i].idx,
-					submit->cmd[i].iova, szd * 4, true);
+		if (!dump) {
+			struct drm_gem_object *obj = submit->bos[idx].obj;
+			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+
+			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+				     offset, szd * 4);
 		}
 	}
 
-- 
2.50.0



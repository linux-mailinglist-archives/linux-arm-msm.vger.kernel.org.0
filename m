Return-Path: <linux-arm-msm+bounces-62538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B7BAE8DCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E00F1C23763
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A942F3C19;
	Wed, 25 Jun 2025 18:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1I0mv/m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866722F3622
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877945; cv=none; b=skTRFsc+WWN6bb9YZOkLGbAhh8IqBOfcVW5QIY178DHN4HYFkUodey4ejJfR8jCTfEe3NDI5eIjJT+/VNPcrZbvotLPl9IQHxsw4grXwajElWNZq4F+SmS1Qc0kAS9DfIHlz0b15XvjzLHVJL1vN9DvMQAwBv6U+Afkd94xopMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877945; c=relaxed/simple;
	bh=jAFX8qN/ZOAZrSo0QLmGzc4udiuEqBJZUE1qEmE5rxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PsFTY3Vmji9J0W+xy+a3OaHxmVsIv0JzlzWqUsoYlenbWAYNo/6R6FEw2bJG7ff6GVqEWS/SdrtdbWoipko0h1XI0dbMJ/GE+QT8JY/58dP4t2eDJqt7NiRBgh9py9+ndsJIqjfOt6fuCU/88w5Ok4RMUV7Q/M3MUAEG7kF52CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1I0mv/m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDHfGN014609
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QOMNbElsFZP
	lX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=; b=N1I0mv/mQZH9Ks7Xc+fzl1wwXv9
	OSzf5PDmPgVa5lhXD1CrTcDbi1mb2IqBpsVHKeKLEPZEJW2Gp3K23zjWh9HeJD7w
	d1hpTdKpjSssePA6CZoXIj5OK+LtD8hp1WMpQ4JNO4aWeON1D4Kf5FjBJktuZhhn
	fJ2VVerzw+VTMZtk37xxvyKVInipKcUzw3Y2yj7/c1VQ6Kcc2GK5n2wytLTCsVb4
	9/NX2X9br0q2+y7Wz6K6WV2/pA2GXeJoKH1Q0hF8uM5Fpja3R04Ktp2w7YdpmmoS
	pCkd0pNsDDRd41wFJ0U5S/PRPLqGK/3GF/vdmkLqHnASPcXO7Uhe4qn1Uiw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5t1qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74913a4f606so207643b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877942; x=1751482742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOMNbElsFZPlX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=;
        b=MDpa1f/0jF1k89t51cTnKVNC08MYXRB6p4g8k7WUwtrbjmhxMXh1JkPXHdqrNnjumO
         29xYk5vLVceBosof85tCf6r/XlEL+IaUCUDCHzvcEY2LwWY/JEhU6yvkSjYuA3IVbDCv
         lGw1r2yxIBBIQ5iHN3NBSRtwRUokfXARw59ftPIV1DSHjdOuOf+6oxDMGIWFoSQ8Dgs9
         bX4FEWP1MpykYBCoJcDqo1qm2s9jOP6mxDOPFb9GgtUPNQ+orVkwN+ij/6G2YW9heCWZ
         IfvQlctRh5vDTlybNu6KDde5eWIwnol8KquC+Ez9FVk6YphiJKQJlMC1AYwLvK0xHiAd
         Ok5Q==
X-Gm-Message-State: AOJu0YyblEJrF+p3PEAQPFPijzZlXaHsmi0mNjOBQUKnLmJESwPt/dGE
	PNXDPeVkgv1S28l+dLtOLqVZA7Q8ARsdpK1OdAyR0DB1p8OkQZRGmn3yOFhd3y2qajbWFAM8L6f
	EG9t2EQEC6VzP7lu6MIqzkNY69N4WwsgfTbfvFW9bPW944vt2+BPswTlHMyRwkFsmg8DW
X-Gm-Gg: ASbGncvz6bwYEVXOSq/m5HeqStLpwch9ZlIr5ja2RdBeK0EGwAxqbB0rICTRe5rdu9y
	ZaWZofaqA2uX1COqdhpkU52mLKBxhKPfKkIJdCWS5QtJhEsJ5M2Qq0uWLlOOWY+JpjmJ/abB5XU
	Yd39Y3zrkZA9r79ipCloijQ0PJIK8yr99/rv6gT/6AS10FGa0OU7PS3r46lsxgN1a9BhTZKs+vN
	4L3cCni4E6XMtzruy5QgOfMEVlFjxisEFiheNY3YY/cFwp6lpgxox//mbyCCJKQIHe5Uu2Wi2Xg
	gc31IHsyDTl9U633qWUKzbP7yeIsL9lH
X-Received: by 2002:a05:6a00:1a91:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-74ad45bcfa8mr6497890b3a.18.1750877941669;
        Wed, 25 Jun 2025 11:59:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNIpJthfggdVhg6h4YytmxITyHayu+CLw/csQVSnZlQgLg/GHx0v96sgTadkVnx72wDQ0ltQ==
X-Received: by 2002:a05:6a00:1a91:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-74ad45bcfa8mr6497858b3a.18.1750877941248;
        Wed, 25 Jun 2025 11:59:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8854943sm5355763b3a.138.2025.06.25.11.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:00 -0700 (PDT)
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
Subject: [PATCH v7 26/42] drm/msm: rd dumping prep for sparse mappings
Date: Wed, 25 Jun 2025 11:47:19 -0700
Message-ID: <20250625184918.124608-27-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: v8LJU97tpCqhC1R3gBL0X9EYAximoWW6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX5xBcsY35JqYw
 1KvuwquA7y2sIxhE1aSzMuYAux5/4Ms+UcjqqQSZVSBnL3pdqREeC3Ghv20un/m8bM0p5gfBRyb
 Ll9if2yzs0pvLlMjycMNyQxTX8JqoB5EEmuO39r/cFk17eyQzHKW+pyI6NUBX8Twwq4eHQLCZ//
 sGx00ihn6toB5xyaZ16c6BdmWTaNTmuDCCuTB9quFqrAYq3IXSo50PRU/WqhQCtW/gTxSD0MsHW
 s5ewD5iGBYm1UO3HuiUzYSEUM/vUmvk6chxDvN/cq8t9MR9MnXUB/bDPP98ahFXtsGXDODbqxBM
 3ue3Br4g+QLFnPC5ASvqEUUItKeuLF+aMAmPCDhdoLWZ15BmHjpbfVjsgastWMiWf7vTHZL9zOC
 myluZAXtJ5ux8KLk55X7Bfuoj19abJwljDzWat8PJQcUzd1OLGva54/fhGutde2mtnA83rJ1
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c46f6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: v8LJU97tpCqhC1R3gBL0X9EYAximoWW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 5e8c419ed834..b44a4f7313c9 100644
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
2.49.0



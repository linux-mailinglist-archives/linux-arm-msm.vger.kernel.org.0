Return-Path: <linux-arm-msm+bounces-60398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2DACF724
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D3E61657A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99057286D49;
	Thu,  5 Jun 2025 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsuQiSsJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D165286434
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148389; cv=none; b=CFZ5CONwvLO21rUleB+rMwkUsIQgi0QBTty4fTMtbSc45ecTAnt+78FdmAFP0n5wDvCwe0fCRqh4FEBVbdKZk74g5OyP1h4o8JgDHKM12HiLwQtp/tU1zmso/kTsy/ueMTz3aawjmcWwXRcSfP74rs7dci2gzpm3XBFn0Oq4rZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148389; c=relaxed/simple;
	bh=qCbhnRnuW+mHLXXemWgEWHentAADrrysxUd/juV5+7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNP1KCwe1p+5SFMd8GnYNNQuh+VHRU6Cx+9g3/P/py8fTHrNuYpyFKXIJ8O/coW4LuN47CcK2gPW8CYOLPAiFU50Sw9eSpDoHC68xpoSaIzAtMqFrBcr95NmJeGbjH19PDio8TKYwwJIAMrkL3gaKLFE3VTNctZgZ1j3fECiz5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsuQiSsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555AYG2m022637
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zZ0/1Hg9ehG
	RWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=; b=fsuQiSsJj30cmtJOeqGzFAOFOOi
	Mo9g9UZe8WJq1PPD7eQVIt8R5IZUIh67C1TGbNLloUQIsOTxpMNAv67WMWJTDFNT
	B6tRE2tNQKmSJCfsGadiw3A24jpEeY51zWCBGKhANib6A8v8Rp4B2b27lLQcOnzF
	HZuQSbSmzu71tfRzKSMeGj5AKOr5W+oPGWhEa7ojUooMJfCn0rEoElpo99QzmmN3
	ekLfyOl7t2TgoE4isly4ZCs+sPVXtv8YXJHk6PiSOJgv7TwS2usKykUNPE1vGuQz
	N2ka+cPVXlqAWV/5xR+xBOUo65tCfP5hyeAlYlda0jF1PwHM7/UCm2UEYXQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn04kca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22aa75e6653so10627395ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148384; x=1749753184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZ0/1Hg9ehGRWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=;
        b=cdV99mY6UrlEERcRDbtHIofyvldFqKcv6ZuCvhDyBXaVxFkBFgXTw94gFNRKoeQAob
         mElat+yXWtqFxgWbVv71exB+7CUG1jDXfJsLZQ3GmF0YftVp8LY717bm7qeX4vMKBRct
         a52fc9L+CrdbxaL1JqLTWUFzyt+1BaRawjJq/iod672SelfW5nLxQyubwBW6Nqn4Ojge
         YYZN2z/KKv18tFmrFHBZJp3k14hzhkjb4mgdv+dSmgFRYnO0F4Vnn2b0cIi0il5P2s0M
         czNx0EQSgHgrGvOs6VIGYIUsRZpeYOeCbOukeMjZcJnh6qyCid4VZUC1x9lybZiTuI4N
         rXgg==
X-Forwarded-Encrypted: i=1; AJvYcCXtLu/MAwzWpkuVSetjGTEGoQBjEC5LgLVsD+8A67andxLGtPt1CzqsSr/5MFKVwEgJRo/yFwooxrQqmAjo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp9Sl3nKyPBHiOqaoSXL5xK7SmpvG13ZQjnXSpA8Xiul/R4Ykq
	Rp4HUOna5ZW9FBs2KoVlMzapT09sn3IKQ3PBicmcNzcOKyH2AmIaoLPWmu+/dLbLw0R/gX9bNt8
	MwEutBFriGc7/D6fUua6WFfOPqgw50O6SWy5WPVNrrM25PIGqGP+aRSMDIso6xfFMiwfZ
X-Gm-Gg: ASbGncv4XH61gIiX38BGuorp+ACH5MXspuYDp7IZN6qPgCHKdue5AOQVjQ5uWKfY3tV
	8Z3Olu+0hpLRZX15qORs/49QhlFofaiL0V5/rS4s3FkX0MZvN7Sp6MrpC+8/TSRiHxT7iK7GvYn
	Obm6kzZ28giWUwUHkawyc2LBPZXbAwVpVT/c+dUqeuN3/wgFd4PLEmTB2CAZ5FUSeU/d4YGsFjx
	lUSgbr+VhufnzQsNeh6J5NPy12VdfNyH6uzButEuphjAI9i4BHKufdKy97cFrv74L3d2vvRW8Wy
	mDi1443iesRKQbYZUqC1hg==
X-Received: by 2002:a17:902:ea04:b0:22e:4d50:4f58 with SMTP id d9443c01a7336-23601d19e7emr5805095ad.31.1749148384407;
        Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE26cHcfxJduxTai3lL8l1HHuGp3dVml0D45JxZwDr8TR1f4qPISu/CmoAgjVwvP7kZpTw7SQ==
X-Received: by 2002:a17:902:ea04:b0:22e:4d50:4f58 with SMTP id d9443c01a7336-23601d19e7emr5804655ad.31.1749148384001;
        Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf471asm122647135ad.164.2025.06.05.11.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 26/40] drm/msm: rd dumping support for sparse
Date: Thu,  5 Jun 2025 11:29:11 -0700
Message-ID: <20250605183111.163594-27-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: N8aXY4ODvaeND-1JN3OYlDlxjnkreAnL
X-Proofpoint-GUID: N8aXY4ODvaeND-1JN3OYlDlxjnkreAnL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX1LHQFRT1UPvr
 YsFGjZuTLUllj0z2tGpr2yL9IYGpYtadJqbqVHcveZzTeon6kHAtXDF+8bKMgzxRMrTpo2qJy11
 Xt/HTPFu+WthILk8ZEARRDekNf7A8WiIKwiD7AQaGOIqeVL3/uU/uy3v20fS7D/DAXap2AIU1Tl
 VKJrM5dAx9lJVwYwqV8KYAC4hwpYoRzzpwrgm6OrkMnl2L6UrqpAGvB9gd40kf5HF+516RTj39n
 7e0i/AwEOr7nRS8AP5/C8k+d+QHo8OI9JXDE0Kl9ygu8v/df2Y2sa7NxKLHwHHaN58I/UFccP3j
 8Rh3aR6QDlNWl8HQ20CR1+iASse5gWg1MnCATAlVyNlt4TtvSnNaO9AStR62cmjpAKWQU0mILX/
 6IMuw0DSVgVWrW3qshYDWZ478n1p7W6X0RcuBBN4U/v7PAXxj6vA79QbsIH0Nf+jbaGSTps0
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=6841e2e1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..54493a94dcb7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		drm_gpuvm_resv_assert_held(submit->vm);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.49.0



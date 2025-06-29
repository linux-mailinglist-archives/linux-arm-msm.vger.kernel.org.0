Return-Path: <linux-arm-msm+bounces-63015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61810AED0D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58040189474D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB1225C83E;
	Sun, 29 Jun 2025 20:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDnx0LU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5783325BF0E
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228220; cv=none; b=uKDxJgwHySNGLQYetJCy6NTyHxoSwq6CokNbWwAiYef2tDYIsBho5S82gPOa/6MCQ5NJCyvfBuGNNkNmbYUjQPxtuLvVzxZ/p8fy5Po3R+JQOrXkPWX2DXSTQsCocWRUAI4RnS3OLFCzvufXVhGiDHatgX816xsBd7uRdaGUjcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228220; c=relaxed/simple;
	bh=oSLD17tD3i/SIJGyBuomwvpM409qt9O5IQtczoH19mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzkZdLQDM79cQ8hQceTUVevSlxjCKIX3ZyI3x2vkdvsGE1mMdFQhSKF/Sj8DdFBSqHpoLRyCt3JLHyscnCpVLeU9gMLMYGilZ28N7xr+p8fhyFlv6bPgLtWM9MlA6tL3qlZhs2uVUIa0dyAdCzaYJSyujDL6Jjnxt7hLwuAknPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDnx0LU4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TGxd3q003666
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiAM1wF2+vU
	wkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=; b=fDnx0LU4V7NKf/OHFe3W029fWfR
	KMLSNdTZblHmLjLR4dw5jo8GT82U7nL331ZLB4da2Ebv10vQNaHHN7wZYlOuN8ZA
	AbFWH6WOffGfZEmZF9Z6umoVB38M2p+bvwxkZjlRfEtUafuRHAkoMrD7ZqVMFqxw
	C/wj1zYnnTqFzIOV13KLVfR8lPZcoyixUOICiTP9IO+PHn7PHMw0j9f9Y411uV69
	LPatx/1jiGL1ixD9ax+1Kdq96MaiCpufalbmnhKIHKoUzcNVs7nCgmR9sa5BiLpx
	03EXbT0njybEpmzmMwpMb+Ljh0cdiabMHwcOrRVWZyc+L8vBhEg1JIn33xw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95htk78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31315427249so3217967a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228218; x=1751833018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiAM1wF2+vUwkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=;
        b=eCHrc/WeTZsGhKrpd6O+W+bHZhsaa0YH8cFkArMd93JrXjXq/kNBmOQljB9tYdfFe/
         775axEKxfEQ2JTyVJHzR8BWQVGN4oGuFbo1eqtoMcZQAKnmHLOpXOeT+CfWJpYcZ6g3Q
         f9tyWzT70ejNdhDpIxoulaNikuR1pkJpUMjcrjQA235x+aFvygX2K9zk0CX0EIM+aXsK
         YQG8+moj1MWjmX/89//KCKI2u8J0izKUTtgImaZpCtw+DJCfC3bTZms7w2F7/0rK8X+6
         8TwIR5iTPOCUxQ18iSUi3KvpO2EV+3GoYTIOUg8EquLAzgSt2Ansrlt1z+E6eJUHIu5n
         772w==
X-Gm-Message-State: AOJu0Ywr8R85k9T1BpJEo/bwGG+VYEwRGB00+yfACVPSkLG9ClwNzDXv
	Uje6mDo1ad89bEXHWGpvtAgNm+AOTbWe51L/ivlHDITBXlnGC83T/2gkREbwACK+R2PQcQLZ2Rf
	yYGY0qFxcnsAn/nD87xrk/GeJmROqp+yiTbtip2NlnDWTK6sAo0Gv+KGbaRud+0aGTTCs
X-Gm-Gg: ASbGncsPQmBWENtyxWAn2CJ6kCgXt7WzG4/77RjkQprf6fh+11Okrr8zAWSzg3LbCyF
	6aTjAzBOV/Xbbe74+KI+3jDwVSvGIUpQHGaSNQ/P4YAJ8W49CnLApiX/QRXlYWY6gBv48GgBty1
	wBN4yEyISgF1yAErTP4ASQHZ9KqjaujimL5vdjk0S4JH/05w6cZolyy2emkx7j7hsPWsvNSq+tc
	k2uuGRUa2NYyr7qItDi86YsyyXROC9bdTI+HzMUhpoV6mlBcxqAL3hjrdqvt1LV1pN4KVbjNHiR
	oiSsOzca5BFownDQAQ1jWxUGf+yc5o95Bw==
X-Received: by 2002:a17:90b:47:b0:312:e76f:5213 with SMTP id 98e67ed59e1d1-318c9256c7emr14508882a91.28.1751228217635;
        Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp24Z6Ubl0Mg+UKuim2CPGQfJhFY6T/tHTvs17eA1pXtmVUu5AgaaxuE8ttGSFY1Jqy5xm5A==
X-Received: by 2002:a17:90b:47:b0:312:e76f:5213 with SMTP id 98e67ed59e1d1-318c9256c7emr14508860a91.28.1751228217278;
        Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5382f02sm11646942a91.1.2025.06.29.13.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
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
Subject: [PATCH v9 28/42] drm/msm: rd dumping support for sparse
Date: Sun, 29 Jun 2025 13:13:11 -0700
Message-ID: <20250629201530.25775-29-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX/Vcp3U0l/+y1
 J5y4KlPkwQRtgSO2mnJaWMLk49Qij2hDduqHoyUEIkkOUnTQz0TGxPfhgAnZWhvymzvjgGOlC5f
 M1PVrflI0Oabk2szRAfxpcSxxQFWACfazuXZ6jr/n6pg6VGKVmvw2yQE0oXsgs1W988oSyugp69
 zcqCFIshrkr+ZH8DrR57RTxSu82E0o8wuW4MUatRjDyCh/RHMNCWToagaq2GBCFGfUfiwKJGGhq
 mSMFQ21zWmm3che5X1KAnKdV7vSFMFgqou6Le6e0/6Knp8Q3MlJGNQeepGSKHU2OdqXPu0dnv0x
 GJ6WISUKyhOfPxmfr34cUQ6Ua/6SrP+9civP9oIBPzNTM5tYRRa8ZUEzE6L8y5HgP//QelhKtYK
 qTU13v0AzP14Xg9RvwdYMmrBDAKUrqntc1cuU/8GdWQz4N2RS44tMp78YLLnAeRSF2SBveZ4
X-Proofpoint-ORIG-GUID: l31Hx1UlGLqF6sdKANP0dvTTrMZ7R-I4
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68619f3a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: l31Hx1UlGLqF6sdKANP0dvTTrMZ7R-I4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290171

From: Rob Clark <robdclark@chromium.org>

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0



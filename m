Return-Path: <linux-arm-msm+bounces-62958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F4AECD94
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BEC41618D3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA1724169E;
	Sun, 29 Jun 2025 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+ygvKBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D99623FC66
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206085; cv=none; b=RRCDH8biNbGeG6Iu//sapjqjxVtI2V16qsDhocHa3C2ts9f/XR6hNMbUIaJblzvllxMMNlWEjTpr0Slbcx5BMyXVw966ukhDxKAPYD1Sjt83HJ6Jyjevu4XY+TKn8NKX3J57Bx/lmVwpZFeOQSIz10Dc5A7NLVTPWqJh+pNzVjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206085; c=relaxed/simple;
	bh=oSLD17tD3i/SIJGyBuomwvpM409qt9O5IQtczoH19mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dzb1AJGAxt3gHHfcXSwgENbBTA5DRrkoCDdFObSPY98oko+9uADDhG8Hqy8eWrE8Eigo/Gqzhzkyuyr0QQnZXCDj6fPyqDmg2Nx9npxUQcVT2hXEGEcTdZgN6S+EBLcfvpeqMSGYtOVuTMbWaWSGbpob5ROPhhCkWHU99jDsMYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+ygvKBn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBoGTQ031706
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiAM1wF2+vU
	wkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=; b=Z+ygvKBni9pEGYCiM9rf0Iu/F7C
	zRLq730rCjKrBWdpuwX27f6nyqZdi3lT7Jq7LK1I2pia9HYJqFYwB/hm9SKdKo0S
	AwC2wEiIUrnaWEqw22IAIJZY5I4eoLHWhkhN7fof12jicGGKcLNBzr7h4T3+ym72
	1RVxlpE+Ozyn/4sOU6J45MGsUtockHqzazJMEPTC6vqyEtYIwZqJCiFg+I8QGbb0
	KSap0cruUndl6TnXrRX38wibe/qP3r9aWoObkNVYxHdq6QQSiKiOzFOFowGQcIK0
	c4dzxkmRrZp5t0FK47c9K9rxoExEkggy84pXyNf+ZpOevRson4X6hxweAWg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a603-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so1003785b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206081; x=1751810881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiAM1wF2+vUwkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=;
        b=ZrWALRbbXzd5uhUZ1s/xC8rfgCK1VwRqyAQmjGmiXwkA9ZQWzsjW7f/J3wFPhW5K4R
         4a3mF83R8UWdckE4ELiOj5pLV861pQqNeyA/OfTuQ/LS55R7N+xh0pPJbE4dRShWSiaj
         stjqbyQDKMcFrr5XyCJCUL0fs1SHTDZxcYrFvK2bZBwr1LxBAyQWxeVgHWqUXkU8/dwz
         qYshpKxfBWWZhcuXGVHR9ny23jAhBsvzKzB5aiNxBm3HeHJBp5MPH0QYw0xh26wOE3Wd
         JzP9roNM7I2XmNiCSKg3WOu4b3Ms2O4NV7tJ0OjnAUf9xP41hRS4H7EbT6r876DIjbnN
         oksg==
X-Forwarded-Encrypted: i=1; AJvYcCUI+bPVPTxXH4ASJSlVY5xz18UoifsNZacXx4nBvRWiGyrv3LO7juBmOTjYiRtvSkOuMUQILyTL2GvWIsQJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyDEIEoyyKIdjUc92NvbAZkQ9lVNiaa12dIF0tgouJWljRkt8XH
	86ISNpNjTbR+j/DVyE+oPj3aW5/GU0tPx1xoPcARKAQS0RJ2aerPL8ZWfalo/ersllD9+7llvBc
	eF9qI//cFqhAEJJf1E/CZX0s8YLVK138VGL/wvRelWnQMkI6+/Ao9JZ5k8dmTbmSbel52
X-Gm-Gg: ASbGncvq4IqKv8DNSbyivAS0ZmIJCTPmsYYCPLXMAuv2D0D8cKJm3kzzhRGVBFc6kki
	tTfxWya6tuqJRW4a6qFVzje7FQWgaVvqVd4bsPR9JR/NCpGbTaV82KQxN19cfWqYYXoBuaDZ1LI
	FfljwTdMm3dKu82um1r3VYLyR5dQi16z/fcbHgnnQT39mcaKFEEJVkhFbdVujTKvxBYj94BX3QD
	hiYj8cjQE43dy6IyVTIp+c2upWNHhcCFEwQ3/ur1w7+HbHZnXdFaTqoyJ9qrZsAc7oPpV7D2z/Y
	LsjXrdL8iBT1nwAAWI1rwdrc9We5OMp6
X-Received: by 2002:a05:6a00:4b0c:b0:742:8d52:62f1 with SMTP id d2e1a72fcca58-74af6e61b06mr15386834b3a.8.1751206081300;
        Sun, 29 Jun 2025 07:08:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmEjFT9YhO9qCARxAsGvGVKPjEex9KKnkOxbT8IIcaWHUwA/BA945pWU2NB5DkhvJU1gw/lA==
X-Received: by 2002:a05:6a00:4b0c:b0:742:8d52:62f1 with SMTP id d2e1a72fcca58-74af6e61b06mr15386802b3a.8.1751206080907;
        Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557591asm6977022b3a.99.2025.06.29.07.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 28/42] drm/msm: rd dumping support for sparse
Date: Sun, 29 Jun 2025 07:03:31 -0700
Message-ID: <20250629140537.30850-29-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148c2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: XC96cnYF0rhiOKIBbjWPccucF704c2_q
X-Proofpoint-GUID: XC96cnYF0rhiOKIBbjWPccucF704c2_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfXyL/tM7H8A653
 0bvg98RVLQQkwbz0zy/Te/UUsf5LwWYnazGiRbVHP9rpsDBuBwmDCmmYGO12wKJyoPPZxmLKJhv
 oFAAlraaUZx5oRfXLEMmdw2A/GHdT2hb9VbyaUKhTXBn2MOwIO5BRTMs/up2UIy/A9qN5gzoiFX
 iB2eh6J00tD/X3VayfAzI8flV3qBPaiSz8HctMjqP+6xbYiOzstrsMJI9WbMDZOmaNY2S30/JQQ
 mf56s3pI9mzHpvUvudl28QdLoD93V+7If7IjbL1I3VFF7UVFN8/T116ERQKztUYFQdI8QH4E08U
 DdtkorPSSfITv65pzAKrJYkwUQhseoZKnQO6GSho4e0RKZ/sZXmykY2wfAGDFIawjU0gNTExm9u
 ogBNW31SOqLaeORsHCASQs3GyovztwXGyM8EDOSc+pTLlFdrI3+o3RXwEAYqCf0ypWWOp7s/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118

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



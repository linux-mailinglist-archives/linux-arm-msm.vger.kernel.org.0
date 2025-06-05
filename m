Return-Path: <linux-arm-msm+bounces-60397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E9ACF720
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28A5D1885056
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A86C2857FB;
	Thu,  5 Jun 2025 18:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DK/cxvkV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04FB28469A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148385; cv=none; b=ei17PJnBVCKBV6HAPWTIoW4aZoCBxCnUZ8HMddrAGnZRCgeutejR7xlJlpGHm9FcRT37MozyDWtHrcDO/Cz6eXXNrvQK+e0VZKTQFowRNuPovjQH4qbX8KKR73Jzi/l3GoRkaxNMdKZ2i3SiGS4+uZEiUV0iru/u0WO+lSli0Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148385; c=relaxed/simple;
	bh=jAFX8qN/ZOAZrSo0QLmGzc4udiuEqBJZUE1qEmE5rxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Du2sAz6NRfckPHLLsZAeWA4C/W0q7PiRPEj7fPyje/TJjrFpuvngq6tNagF03u5AWBMjZSuu6gX+lsF30bNwI+H8wLTc+AyxxcjqR0jaYGzzyboTrJivkmOeZsPYZ370gxTdQGx5HqK2Cli309w9lTSQT2PkWyhjfOzwjahlyBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DK/cxvkV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GoWp9022437
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QOMNbElsFZP
	lX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=; b=DK/cxvkVFPdbTRAAbXd5RjsD9Vx
	8v1j9sP812BsQNvgU4jcIshXINVo/is6E1Q+5+Uqpto1FHGgun3r2hPC0abkzMPu
	Osk6yDURYZ5mTV+38Kmcl9F5Pi1fO0Q9kRXvc2agJHyuYPwfaLlxeZ/p+lm0WmwK
	ZvKcyjfIVdxJ9WocnbCXSaVcRSpfzpdbTgVe5Poe7Q5sganhvLnzeo0KM3cZi73K
	i5c6+q4Zc2efEY5f2O1sGk3yy3JG3pjcXjI6HXWIhDYp1V2PSBBWKt/n0MKEERIu
	qhgxUWrEvm9LgVVSiIMor/6qQn+7FbShaNc6Q6ZGSqz2iXM+oIudO7WK6wA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2act-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73c09e99069so1446713b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148382; x=1749753182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOMNbElsFZPlX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=;
        b=futjJNMsaiKczagHak6/FqccDvlQ7p7Nytkrsa11DEGa/VIOIEWKW8QriJlQ2pAVgH
         0BTj7btaQCuUzQYBXOnr8eztmTjiCdlXDXJ+W8kHSDuy8mUPsWR9KSRZ3nGw2Pu8lwN8
         A/8YZpUcZZcT1XLrxxpJpEVe1WVbnEjgYJ7p0owz4wkebvjjNg9N4q76kSR/wikzNGww
         W5QzTi8dR4Tvqx3pZL2dOwfodXCKZPgF8GX6KqG5/IK9D++HuzMej1RbFZm45NU8WjIL
         xXb7JBRtVvljHzYtJmPUU0Hjx4CouPiwcBapufAvopJj4yprDxPxgEtTsP14sHLX0jVr
         Denw==
X-Forwarded-Encrypted: i=1; AJvYcCX3Q+PzIcct9BoFZjqky2eoaNXxCDU0IutkIFlDo4LR4gJW2gN2Y250UfrRwAGYfzy7clgLKtVk6lnvkZsD@vger.kernel.org
X-Gm-Message-State: AOJu0YxSxDKoRgSqcZYCM9LhKGMkgFE16311IHItxfaJ6LaPaMQPFIyW
	hUb+XIb3WDH/20LAf/iJ0lQwsKuRC3tnb8xZ9kyuyNDWyEV/uRLmJUJBJU3tGCFV0bp9R2/QXpc
	/HttAi9PLsUb9UDYRCg2W/LWCkzCjxF0rKrC+RHcHNoUUYqrRmxlBwOu8OjSIfQmuqdRC
X-Gm-Gg: ASbGncuCsJKkZZFmsKy+9TYkwuXP/PjNY+FZYz4SfanNRjyqfgObI5iVbpksOsSkC97
	/etB0aBm5BfuPASpODNS9Zw1a60izYROEhggh6FHcevD53GD3mgmAbHQgg68e7rJb8gJu02rg9f
	7uDXAmqkC2+LdMjTdw27TZs7rZK/u6+6paBCSUFcczQTF/6VgeaXO8L32rV58GUei919oLFJU0R
	+F7G44Ib+ZcpXPfl/3bmQwyhWwnAcxaaar3g/ElrPOX7Ru92shPI88768BMFWpCJy7MOld86cUR
	w8IYr5PRRqvov+w9h4DTew==
X-Received: by 2002:a05:6a00:9292:b0:747:af1c:6c12 with SMTP id d2e1a72fcca58-74827e7b12cmr913710b3a.9.1749148382117;
        Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDrhL3Dn+k59t+JotHvK+0jIuQye7jcSS/bDJ3Rw3Z0zwKOzep8XVvL5+334VNT3dzfxxg1A==
X-Received: by 2002:a05:6a00:9292:b0:747:af1c:6c12 with SMTP id d2e1a72fcca58-74827e7b12cmr913677b3a.9.1749148381745;
        Thu, 05 Jun 2025 11:33:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe96799sm13679698b3a.15.2025.06.05.11.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:01 -0700 (PDT)
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
Subject: [PATCH v6 24/40] drm/msm: rd dumping prep for sparse mappings
Date: Thu,  5 Jun 2025 11:29:09 -0700
Message-ID: <20250605183111.163594-25-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: wZRssgufOrAr1hUDYLxuxts29TXcGwqZ
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2df cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: wZRssgufOrAr1hUDYLxuxts29TXcGwqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX7Qr9xQbaFUdo
 Fuvu+wLhC10jRxbJCoahQTpMC3pEwfRbLr5uGnszs6mMzALpusLCJEHcpUoxqsHxx+tbfKMavEB
 +WsHAUlL5U1IeiYusmeKMCAnbblO01mLx9L/j6FfsKsT2+4FD7HLFdlcEy5Sm5DdhFVtDN8fsMs
 cRvfme6bsuYvRoEnlXTqmO3zbOthRBS1/3gres1n3Y/FpkoFNQ3roZnkofHYJgo+5y8x0SghTqL
 ENrIVZM63nYUaIp+6XfM+ECzxNrgaHUGOHSRZ17IKxypkC7wpOAywz/Qm1i8OKcMjJUL6c/NUes
 E0MoJQz3HpmdSLwIo0Q4IbT+04aIMD/EWRa8Z+hHlKnU/xwkzKS9RUInUVADfnRw0XzNY/98XUD
 OTAOvPT8rlSBaahvDfnyXYqn/Rt1Q7nyWme2doV1zZVLWIsds9J/iTlVNphC9AGosbQlA0rv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

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



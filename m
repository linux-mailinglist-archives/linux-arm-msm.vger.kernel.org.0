Return-Path: <linux-arm-msm+bounces-62551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDA0AE8DEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F363C7AF111
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684F12FCE1D;
	Wed, 25 Jun 2025 18:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2yRjw6+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9F72FCE04
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877964; cv=none; b=e1MN6pVFyy45kwWxdFhpgYhvWAXeVMiKJ4UVNdpsn67ERy4TicD/GE91ArCJUjrc3Nrc4QcGpJTbBnMH4SKzVFqSbOHpNuogpzVsgVxphit24Rux9GfaraowU2cAOLO6+E8MLP5kiDr14KtWLV8U2YT+2jXxawcQGvG9eNUCWkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877964; c=relaxed/simple;
	bh=eFxBT0OAg7rchLVBxX/NKfn/olJKKvoe8oSOxRdtsVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yf3VLvypbAy/EiBYGF83qte79doOuJt5gFY7T+ggcMOpDjCGLaT+I+T5Hxzi6sAStqwxWjRmuy9s0oty7D03b4tMu1b5hWbvgKq65n3KYLR0YdOsBmtw/LxmWG8wkKmB7fp4OJ7OD8TmAnNNauyFJbvrCEgXyXxxbeGGFRlY0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2yRjw6+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBDwYr021620
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eqq9rbaAioE
	9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=; b=F2yRjw6+OVLjPctkQ7sN/SPa2Dw
	9I0eoXTefhTcUVJuB44zerx7wk9plj3WgmZuB+U1NDuOkBpjgYQcanCPgttNDshZ
	LHjG+vrltCf1AEry4+JKwdu9sSWZ02G5naJKvSMsQg5Z8JKeiy9R3/Yd6nzG4BYn
	s8X+WgmXDKd7rTxqiFSUOnKHK5a2BpPVFoW1NEKlhTjBeO3npBS/cIOjhn+9e6j5
	UTxIXgzyXpKuyL6PNx2SNAZk0QDls7E69jcx4ej049FUCgLJt9PS27MxaP60f9dp
	cKxpjB0Ix3eQIf/kl8UIy66kqb7yahG/p7KEzezj23KejTA6AUHVwsM1tWg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26b69w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c36951518so161440a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877961; x=1751482761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqq9rbaAioE9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=;
        b=Uw+qCYipv3u+hYDrZND7SO/WWXzQTs5LIpK4FyB4cB50i+pVuQTNrzoVsHVtR/iP2Z
         aFQ5BOFkyzf22IDqq4vc77FhXz+cKwTVeSW92prjAEyLDg6tkkoi/VfDdyaznJeuFaZk
         ElxLcPmjgN/6cOTvRo3NEBKoL1S7KPpiOYmMSsQjWsyXGMHHMfAiSqayTsamzxGX80K5
         HpQKEAlIS8mi7T3wXTI677hfVKHzqpo7RSL2mmquwFK8WmSWe9wS/vmfzrdxQBmrzY5E
         LcutcJ5Vjl8XAYGP1CwrMgkmexb+HOK4MJO//r4o4nuEO/xyWHbxt/2tWFW/qqAx6FDS
         NqxQ==
X-Gm-Message-State: AOJu0YxqCei3Rtpoc6nEy3dImKflyuyCq7Bhg/a8yL1QSktFLlbTBvbc
	9jwenCIhhf0rKrR5+bk/CFZ1Ah4/f1s/9rdqarh/gWdIeMCqeYIxE+IlEmUc/cUN7h3b8OAAKYT
	K7nFTt6KjHYllPQx5wPYO9oMG+2rCn3TQasSmL62BEDd24/JcbGHM4TorpSo4botsBxNN
X-Gm-Gg: ASbGncubFt+uFuilEbSsyYAgtl3iqbtMK5+VcDQ8eHeL7luzMBR9jANkiYRUX4MCJXa
	r5sh97Rut0AvKCUJuEu0df0gHQ3c7ugq/G797aud4BKfEasucoRieBhLRqjst064omQ8JZAi2ga
	jq1I9LKvwHbblbPbAzEkC2nznQTuP0EzNFyF0+B5nnO8hp7gwhLq1G9DUhQyjsA8OWgRDS8XSeo
	Sqm+RW7WzqNi+xop9gwKbR4D++M2Q72p8sYBTs3apSCk3oUF7qxoPxZLOH9qssnAHVbuUCxNBkx
	TN6G1pRdK3gXQ1lESi72NPYoDb2lzG3q
X-Received: by 2002:a17:903:1aab:b0:234:eea2:9483 with SMTP id d9443c01a7336-23824087b81mr74601485ad.51.1750877961045;
        Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH/9u8r/LxodxXtXwo7w52l7fdtoIYCsGzY2nyZs0qLi0VBSXghq7mfLQgk/HczC7JkARW8w==
X-Received: by 2002:a17:903:1aab:b0:234:eea2:9483 with SMTP id d9443c01a7336-23824087b81mr74601115ad.51.1750877960671;
        Wed, 25 Jun 2025 11:59:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a8a8sm136322695ad.132.2025.06.25.11.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:20 -0700 (PDT)
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
Subject: [PATCH v7 39/42] drm/msm: use trylock for debugfs
Date: Wed, 25 Jun 2025 11:47:32 -0700
Message-ID: <20250625184918.124608-40-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX696y1O7IS1bW
 ll46Y7r0tyJRNAQ8OZ+2GRB0uEF5qiRIoM8cj/xh2X7sgXn5orpYN6+dDXXkHWFUwc4/5bk0oXf
 WnYfOi5NWxgIdC1YgvYwi2NSVAUPUJzOa1rYSHOYz3a5XjR6byNjn27gC6OtxTNOrfN+dJklwWK
 kEzalni0xeb2mSz+EqAm6D4pQusSf9zF8khxcjlOjnkx3qY53f7irFWmVXA0JDJI1rdzZu94SFI
 +22+xES5PcHHyGVlXh5M9mEmmOYzh1QgDjUASMau7oPJntXCQ+jSjDJ9qNfeDwSJQ0swt9VHANs
 Ynebe2cPi3Fn2/BBcju9xTN/UWDRppOqriq+gsvp0Otbf2jSXVG5rMnLk//sXFYimFx1+YIo1tl
 7R/Sx7ZeBK86qzZ04jHrqDDgt31SVb6OEwQWrFuW6tY1DlR6XczAzTlTa217UXfn6Skc5BQT
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685c4709 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: CfrUUBw4SK-_39LZ3k0j6iKrSgBlAE7A
X-Proofpoint-ORIG-GUID: CfrUUBw4SK-_39LZ3k0j6iKrSgBlAE7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e415e6e32a59..b882647144bb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -946,7 +946,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 57252b5e08d0..9671c4299cf8 100644
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
2.49.0



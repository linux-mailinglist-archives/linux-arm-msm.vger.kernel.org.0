Return-Path: <linux-arm-msm+bounces-103844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMCuMZOo5mnTzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:28:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AFC434AA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A281302AD25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 22:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB96A3D0901;
	Mon, 20 Apr 2026 22:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCA7oha0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+t4oQZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5833CFF7F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776724040; cv=none; b=W9UsFwVonTFnXbLTLCFXFZqDdeqE0JriZiDCxYeJGiCZEdXpOHLivd7JpkkzAIfKFtvPPGl44gtJYjY14aLQgKHRgqY/XPIWpoWT/h8njQuPOhbilROeB3F/CKxDUDvRxk5zfHCmEbZNXc38akqrkfD8M7xKDzkV39YeinMK0ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776724040; c=relaxed/simple;
	bh=TovQNSZqjCEshCVvfyvXUtlIbRz8ZEIrT8kec7Go7n4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nDWp5hUhtTBC9jyJP99xhrfE0Q/UKhhZfWeDw9vEeY8mm19qbJ+LivNDOC5tD59ExruKWzwaCxSk3fn9EY/80TaKHkRaL6+8n2hbqm6H5IGOpK9AXG9ZOrnUv0lHqt0tBtE2RbiSOCKbncby1aPgTwNgBL4lU2VrCa2Pu3dr21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCA7oha0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+t4oQZo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFZthQ084436
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r+OvOunmdBc
	9THaENORBIW5PHKBLtBVoo569H18ircs=; b=OCA7oha0Aj/9YG2D6ryGq7JDErz
	GGqw+1sEwN9wthnAeyyeElfv8Kti2EYCdgfFK9CUbjOdDnat3UYZxfvauzjzPnK1
	X/I1+vIg8wj+aHV1Lg7aDco2SoALYwdGTh6kT1kv1cStan+Nq8450FoOjmsrlAQ+
	cttRrVCPKYEQqrzfvsiQHASqXi4FAcyo0uTMx081qqW1Wy53N6w/u/i59JfH6wrM
	BvqWs1BXA8MWJa9eDN8ykW4WB6DhgmON0ME985UI0RZ0UKWkuGmVyYamwwCkVgel
	uUBb2800BZoj1PvUJV2s1D7n1v90UCmYncKQg9OFkDoCU20UMvCOTvRtXcQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81jsen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7867bb92dso5977855ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776724037; x=1777328837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+OvOunmdBc9THaENORBIW5PHKBLtBVoo569H18ircs=;
        b=b+t4oQZoJ9fEXvlY1kQMfkCUWuXRcO6T04nVucV/33evMKVRMkuGJ+ll+d/i5WbzYb
         sLbcY0pmrlMVuCZi/vcgitIExNnkFvi1Fp0gYOLc204Ff+dBh1wANMZe8bDfQ6pckyci
         BNk3MYL4qNpfKXSUu6VcMYxqIUXT1snaNXKg/W6lNpZlvrRbpRz8s7qrade+7HPAByvF
         sn2OvhvF7CP3z3Xx6U7PkVmQ2lW6T2mQW3toQ3OhC6Q0BWvCHq7HC5YGdd5SIKZN6vRE
         jY858UYmOTenQBIUWnoS+dPek1fjTA/ZxnB5ImdsYu/AmGVRpwzFqKLOlsg//WXe7DuT
         Hn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776724037; x=1777328837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+OvOunmdBc9THaENORBIW5PHKBLtBVoo569H18ircs=;
        b=SrOinKOip0dTsy8fgQbM6b/AlXpQ5c6Q4M/7Bk0ucRyQweMt6rDnUElD7Gi22rEXKC
         uOg3ci/ltNtFrRJ5ycjwSYB5WZPfQItWrd95XXu8+JgM/TGUPfxnr0LVWdcrp2b7PtWe
         1YO3psaAuL2LpdtO3/W55kX+NOFJgQyKV+3Uki60qb/IeQLvXmqhIudm3qAXzYvGFssd
         /PbB/j2AueEdRUXi2fUTc249NFCNLwqULc8SeuKGxpC0e/f49kwfgFqGsHvcXJ4FWytb
         crWgw+8WpBXpOOaVpw8dK3aluP1+ws/5jQzV+0JErAjxxzHbf8EHx3EaepfbDllEpGHd
         LtDQ==
X-Gm-Message-State: AOJu0Yyv3XsMiCigXPmJyYjf5a7xVfzn7wf1K04ZwKgye72rknKTXCNy
	Eqf28BHrHdost21olRbxfUtbfZUCnN7bPbH2OMlVE0GkYneb7v6HAHKd3qjBoYnHlL/ivb23MAy
	WLzh7iNJJNBcU+FXwz5iYKDyIOCz2uhPoK4JD6wNNS/O9Xu7Z7RjpmGxrYXyMZeQG/4w9
X-Gm-Gg: AeBDievmoh+mmmi07Keoh7tlQxdNDHQlKAkSELaExu4EzQxq5/DtHm5/GEwOyKP13si
	jAj1sPp6B4ti48SgSJvXQZzQUEEBUtj8s4TblW2mEXJ5NKdgkmc3UC/bXv1BoD7pfYA6tbKZnnN
	CEXsMLNnYafq5u77zNHhQgGLGSwtBRTiuJYRlANFusWDpM3gZ+oqdibXV6C6ujF3k0Obwd99l8j
	IrsIITay5syo4tJoUgDWBuDcu8xEiVVXGLeSyeNi2EfVf4zPvJbINd/MZ3PyFjMoBVp/i+xXeI5
	HUrWUS8B2VoH85/zudTQXymyR9vWGe42TX2+xVbZceu8aID20QnQOd4z/di4dloj4rLWtFvxJqD
	qVD8SxpVRyj3gFOat2kpaZBZPBm3q5E/tByoro8T2hEU=
X-Received: by 2002:a17:903:3e02:b0:2b4:5a2e:98d9 with SMTP id d9443c01a7336-2b5f9f7abd6mr116583495ad.37.1776724036873;
        Mon, 20 Apr 2026 15:27:16 -0700 (PDT)
X-Received: by 2002:a17:903:3e02:b0:2b4:5a2e:98d9 with SMTP id d9443c01a7336-2b5f9f7abd6mr116583215ad.37.1776724036384;
        Mon, 20 Apr 2026 15:27:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20c4fsm142124185ad.59.2026.04.20.15.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:27:16 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 06/13] drm/msm: Add a6xx+ perfcntr tables
Date: Mon, 20 Apr 2026 15:25:28 -0700
Message-ID: <20260420222621.417276-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIyMCBTYWx0ZWRfXxDwvqHceemY6
 xNq4MOCoQCzUIOlQexzxuROcbJPpIhxeF+8ATc9Emn53sSZ/navqSBZ6xAfJg31szoMh2k20YMR
 Wogjn6mT+S1yzVX4Bb+5p2mHBjHzpKnnAGRBz92GT/8BVSDj/jWik23ax5a4onQck3o6D2EcPvf
 j/XowumCkKGmXzrDwdhitm192tUQkWOCEFiEe7l/8g+hKg5eMl1T2dsC53V9ZDqMxjiyYCeaS74
 WnmzQXAdsvPVcbGyZpCmehYybeE3GscEZxP1sEY+2OR1Vmax0afXp9KrlT12tlgD/TLPfNs1t52
 BpcRYmPMlfCDlX0o5bLd87sxgw7x1dX0bF/SR8vMJPaaiCCI/RY5zE5JJ9La7Iq+RGwZM1qIr7+
 6ftoEOfwY6cjcblwq48hl0yuOvjIKu8bEkfgKOIBF0ovh4ROVQb6wW7EqNvwaQ24zlB1qlUdqh5
 sZpoX1SV5Mzflne3q8g==
X-Proofpoint-GUID: xnzzyCABR2IiqjSa2GzV9e_UdTrvNWR2
X-Proofpoint-ORIG-GUID: xnzzyCABR2IiqjSa2GzV9e_UdTrvNWR2
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e6a845 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=4FiFnV2saKvSNFYXgKsA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200220
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103844-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54AFC434AA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wire up the generated perfcntr tables for a6xx+.  The PERFCNTR_CONFIG
ioctl will use this information to assign counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++++
 drivers/gpu/drm/msm/msm_gpu.h         |  4 ++
 drivers/gpu/drm/msm/msm_perfcntr.h    | 57 +++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e578417a4949..727281fbef36 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -5,6 +5,7 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 #include "msm_gpu_trace.h"
+#include "msm_perfcntr.h"
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 
@@ -2637,6 +2638,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu = &a6xx_gpu->base;
 	gpu = &adreno_gpu->base;
 
+	if ((ADRENO_6XX_GEN1 <= config->info->family) &&
+	    (config->info->family <= ADRENO_6XX_GEN4)) {
+		gpu->perfcntr_groups = a6xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a6xx_num_perfcntr_groups;
+	} else if ((ADRENO_7XX_GEN1 <= config->info->family) &&
+		   (config->info->family <= ADRENO_7XX_GEN3)) {
+		gpu->perfcntr_groups = a7xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a7xx_num_perfcntr_groups;
+	} else if ((ADRENO_8XX_GEN1 <= config->info->family) &&
+		   (config->info->family <= ADRENO_8XX_GEN2)) {
+		gpu->perfcntr_groups = a8xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a8xx_num_perfcntr_groups;
+	}
+
 	mutex_init(&a6xx_gpu->gmu.lock);
 	spin_lock_init(&a6xx_gpu->aperture_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 78e1478669be..8c08dc065372 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -24,6 +24,7 @@ struct msm_gem_submit;
 struct msm_gem_vm_log_entry;
 struct msm_gpu_state;
 struct msm_context;
+struct msm_perfcntr_group;
 
 struct msm_gpu_config {
 	const char *ioname;
@@ -262,6 +263,9 @@ struct msm_gpu {
 	bool allow_relocs;
 
 	struct thermal_cooling_device *cooling;
+
+	const struct msm_perfcntr_group *perfcntr_groups;
+	unsigned num_perfcntr_groups;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
new file mode 100644
index 000000000000..64a5d29feba1
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __MSM_PERFCNTR_H__
+#define __MSM_PERFCNTR_H__
+
+#include "linux/array_size.h"
+
+#include "adreno_common.xml.h"
+
+/*
+ * This is a subset of the tables used by mesa.  We don't need to
+ * enumerate the countables on the kernel side.
+ */
+
+/* Describes a single counter: */
+struct msm_perfcntr_counter {
+   /* offset of the SELect register to choose what to count: */
+   unsigned select_reg;
+   /* additional SEL regs to enable slice counters (gen8+) */
+   unsigned slice_select_regs[2];
+   /* offset of the lo/hi 32b to read current counter value: */
+   unsigned counter_reg_lo;
+   unsigned counter_reg_hi;
+   /* TODO some counters have enable/clear registers */
+};
+
+/* Describes an entire counter group: */
+struct msm_perfcntr_group {
+   const char *name;
+   enum adreno_pipe pipe;
+   unsigned num_counters;
+   const struct msm_perfcntr_counter *counters;
+};
+
+extern const struct msm_perfcntr_group a6xx_perfcntr_groups[];
+extern const unsigned a6xx_num_perfcntr_groups;
+
+extern const struct msm_perfcntr_group a7xx_perfcntr_groups[];
+extern const unsigned a7xx_num_perfcntr_groups;
+
+extern const struct msm_perfcntr_group a8xx_perfcntr_groups[];
+extern const unsigned a8xx_num_perfcntr_groups;
+
+#define GROUP(_name, _pipe, _counters, _countables) {                          \
+      .name = _name,                                                           \
+      .pipe = _pipe,                                                           \
+      .num_counters = ARRAY_SIZE(_counters),                                   \
+      .counters = _counters,                                                   \
+   }
+
+#define fd_perfcntr_counter msm_perfcntr_counter
+#define fd_perfcntr_group   msm_perfcntr_group
+
+#endif /* __MSM_PERFCNTR_H__ */
-- 
2.53.0



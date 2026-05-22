Return-Path: <linux-arm-msm+bounces-109387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHouLv+WEGpTaAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:48:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BD5B8867
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0201D30C9CDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CB237C11F;
	Fri, 22 May 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQDEDyut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6z5XL/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14707368D7B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471308; cv=none; b=Q48N+lVLU9wPwf/LEUeFMAbaYBJTNCGr5bNo+Yh1/we8SF94JLJsEx+zxF/09WM4I9vl2H+NdYB4RK2PSsFFgsuhx7HGUiUx+TmwWy2rH6mOrLBkXrY9Q9ko3iucpp10S2fNQ0cpPM76FqbhpYNhRtEmJ3VeuTtjyRZu3/YQGZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471308; c=relaxed/simple;
	bh=4rVVgVBEf6GrRyN/zps7nfJfYvlgQEeeAmXiStwD2AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJ/tJXvizwK1C1c+a67IU9w5O1jNs67xSuTiDFWXh806tP4emBf4ybCENyXpmiDRW7/Pc34ma9pDJu7w6dAEHr1WlE6QCadaguHMCkxnC927IWCivCyTLIBq2hwyNDIp9Z+rLc8fK93obVQWU4imJ5lo2Avzg7tct1qi0rZEciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQDEDyut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6z5XL/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG90pf313099
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1tGhWrYEDjg
	RYDa+ngJmbZZtf1XotyQcZpThlI2HifQ=; b=KQDEDyutQ/6z0aSuSgSBZVr/U1u
	mzizDLzl1uqw6m4O/sgafrgVschGIpad0yDaOtihvx0/zFf7SAoeGFYtMIUxk1R7
	kcyf6Do85rLDcFvNHT5XZe0tkQIieaLqR6xOyqZjvGP+ak6PapGIuURuJnbxQbYj
	XiG3IEJ3IafqUDTZ+U0cvbHXa+/Kfh5xNRGwcZBQREQWuyS1030CPwiT06VhuDJX
	3OA2yAsnbdDEoJwjM0T5x1quuuK8x87YHagcA4xzbgx5NaQYh7eprhsBYizpsB9f
	B1XFUuDtJoChzSGnfET9CjOjlTOpApAHWIbQw3lTWexEGbmxgUIFcNXCdOQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea88350jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babbeff9e4so82108725ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471301; x=1780076101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tGhWrYEDjgRYDa+ngJmbZZtf1XotyQcZpThlI2HifQ=;
        b=f6z5XL/OazTXem15P0i8LE0G02eyU66mvzxnC4F48LyF8NdPIL+/UK0/KHuP2tc8dC
         ioOmye1yA2HxnDTph3QGqle9Rn+nzENx4t2E+lGwxaM3cmi8VrVipBif19GDFfZdPvDl
         78zFf/ZwI/tkYCpP8vh7Pi3Js0DNGxogtlsJ3ZhdZpkbJqXx9Vv0MKJksOoDLEHqpOEj
         CuGhtyKj0HR5rS70JHf/DPV+YQZ2bvFMu4ALaDc7NfIBIztau6BiAMP5Ryn1eTnUnYmF
         ahjGBr6UrUH8kAdq0FNcTr/ub+ZyFnzNOUY1iCNnX8Kd+Upw1cfOHYi35ErMJrr8BKkz
         GG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471301; x=1780076101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tGhWrYEDjgRYDa+ngJmbZZtf1XotyQcZpThlI2HifQ=;
        b=LB8reMP6k2G9MP3iUq3M7BxFLHx5AxBWPZjFOyiFBwM+M0r1yB43F1GH+yqQeuzizn
         whLQEi7RC/48GV9av5YGkvNnMmOANyZ9MF/uE5T0s6tMuxVjj58ddtmhpzgCHzjNvATk
         zuC9Zfc7lqVB0P/OGA0Zlk8dKBjQaIz7L+hpLfsxkmzNM93tu84/69V3b8vzWpSDaqRS
         KCno2pASLBRfl61VxDXfb+FiuY2OxACG22iZwzTyHsyT9RtbBizvzTidkKN3KjL5SrLm
         uKgM5W2OMwJbVaWpE6RMHH0gXHLVFggCljasFIsfwr5hvbHqO1KZQTFZh+NwpfFPBk6S
         1pCA==
X-Gm-Message-State: AOJu0YylZCp7+ZC5z2DVbXZC3jlNt2rg7s8mLSTGKbbN3U7g0fgBZbyq
	fBIlR7qH2/gYUFakwfXOmHVxxHo62yuTJMHfjsKC/3wbZGt2BNKOlmXEtseVUWQ2hi+wbuW3usE
	ZSBpN+V6MCExj5PIkDc2LLOGgekMqDQ2fL3CHWPrLtUhM8MJexIhT3LEtjYffsgv0kwNo
X-Gm-Gg: Acq92OE/TLURDd6bDYZgjdbnlstTic1qidv4DBmspGg8PN+s+TIl3k5rE196Oze295f
	6dcW3U9psW4okmnqm5Ge/ogmv0DjSgXiztaSWoqtnToacoElJ5a2MMO50cANf/1+2YhiuonCyxt
	sT6o28R7Z91eBydVwyznYfSDIlQO0V6NI/dCEqzOX5fzFO8+yy1Zwzzarq4qO8UhcV+roaAvna8
	mozBHGlJrF4rwWi/NIzyFr8Sp9LOgzTfRDirZD+DqVeWHyEZ3MRPWbApNP/kUIPvnWSTjIf5q1W
	8oLJTHS4qBCNejHm8tOTdJbaomLDFDbWosZijncttF5SXzNlAMcxVluiyUpRE3LGh9rz81c4R4O
	QOOylNEsgYfCmNOHE2FJM4qYOYUqEOe3OlDybkJ1jjRk=
X-Received: by 2002:a17:903:11c9:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2bea20a2d54mr76707975ad.5.1779471300759;
        Fri, 22 May 2026 10:35:00 -0700 (PDT)
X-Received: by 2002:a17:903:11c9:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2bea20a2d54mr76707675ad.5.1779471300127;
        Fri, 22 May 2026 10:35:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b9fabsm32874415ad.23.2026.05.22.10.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:34:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 13/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Fri, 22 May 2026 10:32:59 -0700
Message-ID: <20260522173349.55491-14-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
References: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfX8xafPExpW134
 m4hs0NI2Bf+hJE1guk/69XEL73NltBHnG66fLk/27zFJr4KalrrTl2f76pzdjVvsdZ1wxoj1yeq
 7bTyhooVHcHl+RqgObRT6C+p0Wx3HPzJNJopOmDStW9c5d5G2Z0jltNjaWOrQxEEh3/hQQzPvVf
 kTRnyIoHMCGdyCh95C7fr85hnebyKpeEGZ9c2NG5rFbOjnVdhRf7CrT15NdpPIriG1xOryP2171
 UqM5Gg1W6oKTV+OzuM74b+FidmPoZyPNLEHT1znTahazHX1KDg/8uY4+nSXF/MP5rf0zr4OtJ4o
 ijZ3AGg5oq9NKLNg7U4Zf7tZ9duqmhbYE1f3yiNHshmNJbtpWsp0CU6gUGvB8kBgsgUqCSZ7c0u
 c9pqtXwwkv5AYwxM6HHbwe+UvsmX9cZPY8eHU6W1VBjKE6WX+SErMgqdppBwS52TcptajEmRN3Y
 4TTJeScho2LMfHn3Low==
X-Proofpoint-GUID: Wgu6fqDN4CGHT_olwJ0fXSMNYeYSPDS5
X-Proofpoint-ORIG-GUID: Wgu6fqDN4CGHT_olwJ0fXSMNYeYSPDS5
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a1093c6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=QTPdvVFHA_ZOYi6V7VMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-109387-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 366BD5B8867
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add new UABI and implementation of PERFCNTR_CONFIG ioctl.

A bit more work is required to configure the pwrup_reglist for the GMU
to restore SELect regs on exit of IFPC, before we can stop disabling
IFPC while global counter collection.  This will follow in a later
commit, but will be transparent to userspace.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c      |   1 +
 drivers/gpu/drm/msm/msm_drv.h      |   2 +
 drivers/gpu/drm/msm/msm_gpu.h      |   3 +
 drivers/gpu/drm/msm/msm_perfcntr.c | 526 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_perfcntr.h |  51 +++
 include/uapi/drm/msm_drm.h         |  48 +++
 6 files changed, 631 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3066547f319b..0a7fc06113e0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -801,6 +801,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_PERFCNTR_CONFIG,   msm_ioctl_perfcntr_config,    DRM_RENDER_ALLOW),
 };
 
 static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f00b2e7aeb91..204e140ac8e9 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -237,6 +237,8 @@ int msm_ioctl_vm_bind(struct drm_device *dev, void *data,
 
 int msm_perfcntr_resume(struct msm_gpu *gpu);
 void msm_perfcntr_suspend(struct msm_gpu *gpu);
+int msm_ioctl_perfcntr_config(struct drm_device *dev, void *data,
+			     struct drm_file *file);
 
 struct msm_perfcntr_state * msm_perfcntr_init(struct msm_gpu *gpu);
 void msm_perfcntr_cleanup(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index dc2eaada18cb..22cbafe75a07 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -353,6 +353,9 @@ struct msm_perfcntr_state {
 	/** @stream: current global counter stream if active */
 	struct msm_perfcntr_stream *stream;
 
+	/** @sel_seqno: counter for sel_fence */
+	uint32_t sel_seqno;
+
 	/**
 	 * @groups: Global perfcntr stream group state.
 	 *
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index aeea60cd002e..419e797478e8 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -3,13 +3,44 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include "drm/drm_file.h"
+#include "drm/msm_drm.h"
+
+#include "linux/anon_inodes.h"
+#include "linux/gfp_types.h"
+#include "linux/poll.h"
+#include "linux/slab.h"
+
 #include "msm_drv.h"
 #include "msm_gpu.h"
 #include "msm_perfcntr.h"
 
+#include "adreno/adreno_gpu.h"
+
+/* space used: */
+#define fifo_count(stream) \
+	(CIRC_CNT((stream)->fifo.head, (stream)->fifo.tail, (stream)->fifo_size))
+#define fifo_count_to_end(stream) \
+	(CIRC_CNT_TO_END(smp_load_acquire(&(stream)->fifo.head), (stream)->fifo.tail, (stream)->fifo_size))
+/* space available: */
+#define fifo_space(stream) \
+	(CIRC_SPACE((stream)->fifo.head, (stream)->fifo.tail, (stream)->fifo_size))
+
 static int
 msm_perfcntr_resume_locked(struct msm_perfcntr_stream *stream)
 {
+	if (!stream)
+		return 0;
+
+	/* Reprogram SEL regs on highest priority rb: */
+	struct msm_ringbuffer *ring = stream->gpu->rb[0];
+
+	queue_work(ring->sched.submit_wq, &stream->sel_work);
+
+	hrtimer_start(&stream->sample_timer,
+		      ns_to_ktime(stream->sample_period_ns),
+		      HRTIMER_MODE_REL_PINNED);
+
 	return 0;
 }
 
@@ -25,6 +56,22 @@ msm_perfcntr_resume(struct msm_gpu *gpu)
 static void
 msm_perfcntr_suspend_locked(struct msm_perfcntr_stream *stream)
 {
+	if (!stream)
+		return;
+
+	hrtimer_cancel(&stream->sample_timer);
+	kthread_cancel_work_sync(&stream->sample_work);
+
+	/*
+	 * We can't use cancel_work_sync() here, since sel_work acquires
+	 * gpu->lock which (a) in suspend path can already be held, or
+	 * (b) in release path would invert the order of gpu->lock and
+	 * gpu->perfcntr_lock.  Either would cause deadlock.
+	 */
+	cancel_work(&stream->sel_work);
+
+	stream->sel_fence = ++stream->gpu->perfcntrs->sel_seqno;
+	stream->seqno = 0;
 }
 
 void
@@ -36,6 +83,485 @@ msm_perfcntr_suspend(struct msm_gpu *gpu)
 	msm_perfcntr_suspend_locked(gpu->perfcntrs->stream);
 }
 
+static int
+msm_perfcntrs_stream_release(struct inode *inode, struct file *file)
+{
+	struct msm_perfcntr_stream *stream = file->private_data;
+	struct msm_gpu *gpu = stream->gpu;
+
+	scoped_guard (mutex, &gpu->perfcntr_lock) {
+		struct msm_perfcntr_state *perfcntrs = gpu->perfcntrs;
+
+		msm_perfcntr_suspend_locked(stream);
+		perfcntrs->stream = NULL;
+
+		/* release previously allocated counters: */
+		for (unsigned i = 0; i < gpu->num_perfcntr_groups; i++)
+			perfcntrs->groups[i]->allocated_counters = 0;
+	}
+
+	/*
+	 * In the suspend path we use async cancel_work(), to avoid blocking
+	 * on sel_work, which acquires gpu->lock (which could deadlock since
+	 * other paths acquire gpu->lock before perfcntr_lock) or already
+	 * hold gpu->lock.
+	 *
+	 * But since we are freeing the stream, after dropping perfcntr_lock
+	 * we need to block until sel_work is done:
+	 */
+	cancel_work_sync(&stream->sel_work);
+
+	kfree(stream->group_idx);
+	kfree(stream->fifo.buf);
+	kfree(stream);
+
+	return 0;
+}
+
+static __poll_t
+msm_perfcntrs_stream_poll(struct file *file, poll_table *wait)
+{
+	struct msm_perfcntr_stream *stream = file->private_data;
+	__poll_t events = 0;
+
+	poll_wait(file, &stream->poll_wq, wait);
+
+	/* Are there samples to read? */
+	if (fifo_count(stream) > 0)
+		events |= EPOLLIN;
+
+	return events;
+}
+
+static ssize_t
+msm_perfcntrs_stream_read(struct file *file, char __user *buf,
+			  size_t count, loff_t *ppos)
+{
+	struct msm_perfcntr_stream *stream = file->private_data;
+	int ret;
+
+	if (!(file->f_flags & O_NONBLOCK)) {
+		ret = wait_event_interruptible(stream->poll_wq,
+					       fifo_count(stream) > 0);
+		if (ret)
+			return ret;
+	}
+
+	guard(mutex)(&stream->read_lock);
+
+	struct circ_buf *fifo = &stream->fifo;
+	const char *fptr = &fifo->buf[fifo->tail];
+
+	count = min_t(size_t, count, fifo_count_to_end(stream));
+	if (copy_to_user(buf, fptr, count))
+		return -EFAULT;
+
+	smp_store_release(&fifo->tail, (fifo->tail + count) & (stream->fifo_size - 1));
+	*ppos += count;
+
+	return count;
+}
+
+static const struct file_operations stream_fops = {
+	.owner		= THIS_MODULE,
+	.release	= msm_perfcntrs_stream_release,
+	.poll		= msm_perfcntrs_stream_poll,
+	.read		= msm_perfcntrs_stream_read,
+};
+
+static void
+sel_worker(struct work_struct *w)
+{
+	struct msm_perfcntr_stream *stream =
+		container_of(w, typeof(*stream), sel_work);
+	struct msm_gpu *gpu = stream->gpu;
+	/* Reprogram SEL regs on highest priority rb: */
+	struct msm_ringbuffer *ring = stream->gpu->rb[0];
+
+	/*
+	 * If in the process of resuming, wait for that.  Otherwise sel_worker
+	 * which is enqueued in the resume path can be scheduled before the
+	 * resume completes.
+	 */
+	pm_runtime_barrier(&gpu->pdev->dev);
+
+	/*
+	 * sel_work could end up scheduled before suspend, but running
+	 * after.  See msm_perfcntr_suspend_locked()
+	 *
+	 * So if we end up running sel_work after the GPU is already
+	 * suspended, just bail.  It will be scheduled again after
+	 * the GPU is resumed.
+	 */
+	if (!pm_runtime_get_if_active(&gpu->pdev->dev))
+		return;
+
+	scoped_guard (mutex, &gpu->lock) {
+		guard(mutex)(&gpu->perfcntr_lock);
+
+		if (stream == gpu->perfcntrs->stream) {
+			msm_gpu_hw_init(gpu);
+			gpu->funcs->perfcntr_configure(gpu, ring, stream);
+		}
+	}
+
+	pm_runtime_put_autosuspend(&gpu->pdev->dev);
+}
+
+static void
+sample_write(struct msm_perfcntr_stream *stream, int *head, const void *buf, size_t sz)
+{
+	/*
+	 * FIFO size is power-of-two, and guaranteed to have enough space to
+	 * fit what we are writing.  So we should not hit the wrap-around
+	 * point writing things that are power-of-two sized
+	 */
+	WARN_ON(CIRC_SPACE_TO_END(*head, stream->fifo.tail, stream->fifo_size) < sz);
+
+	memcpy(&stream->fifo.buf[*head], buf, sz);
+
+	/* Advance head, wrapping around if necessary: */
+	*head = (*head + sz) & (stream->fifo_size - 1);
+}
+
+static void
+sample_write_u32(struct msm_perfcntr_stream *stream, int *head, uint32_t val)
+{
+	sample_write(stream, head, &val, sizeof(val));
+}
+
+static void
+sample_write_u64(struct msm_perfcntr_stream *stream, int *head, uint64_t val)
+{
+	sample_write(stream, head, &val, sizeof(val));
+}
+
+static void
+sample_worker(struct kthread_work *work)
+{
+	struct msm_perfcntr_stream *stream =
+		container_of(work, typeof(*stream), sample_work);
+	struct msm_gpu *gpu = stream->gpu;
+	struct msm_rbmemptrs *memptrs = gpu->rb[0]->memptrs;
+
+	if (memptrs->perfcntr_fence != stream->sel_fence)
+		return;
+
+	/*
+	 * Ensure we have enough space to capture a sample period's
+	 * worth of data:
+	 */
+	if (stream->period_size > fifo_space(stream)) {
+		stream->seqno = 0;
+		return;
+	}
+
+	if (gpu->funcs->perfcntr_flush)
+		gpu->funcs->perfcntr_flush(gpu);
+
+	/* Keep local copy of head to avoid updating fifo until the end: */
+	int head = stream->fifo.head;
+
+	/*
+	 * We expect the GPU to be powered at this point, as the timer
+	 * and kthread work are canceled/flushed in the suspend path:
+	 */
+	sample_write_u64(stream, &head,
+			 to_adreno_gpu(gpu)->funcs->get_timestamp(gpu));
+	sample_write_u32(stream, &head, stream->seqno++);
+	sample_write_u32(stream, &head, 0);
+
+	for (unsigned i = 0; i < stream->nr_groups; i++) {
+		unsigned group_idx = msm_perfcntr_group_idx(stream, i);
+		unsigned base = msm_perfcntr_counter_base(stream, group_idx);
+
+		const struct msm_perfcntr_group *group =
+			&gpu->perfcntr_groups[group_idx];
+
+		struct msm_perfcntr_group_state *group_state =
+			gpu->perfcntrs->groups[group_idx];
+
+		unsigned nr = group_state->allocated_counters;
+		for (unsigned j = 0; j < nr; j++) {
+			const struct msm_perfcntr_counter *counter =
+				&group->counters[j + base];
+			uint64_t val = gpu_read64(gpu, counter->counter_reg_lo);
+			sample_write_u64(stream, &head, val);
+		}
+	}
+
+	smp_store_release(&stream->fifo.head, head);
+	wake_up_all(&stream->poll_wq);
+}
+
+static enum hrtimer_restart
+sample_timer(struct hrtimer *hrtimer)
+{
+	struct msm_perfcntr_stream *stream =
+		container_of(hrtimer, typeof(*stream), sample_timer);
+
+	kthread_queue_work(stream->gpu->worker, &stream->sample_work);
+
+	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->sample_period_ns));
+
+	return HRTIMER_RESTART;
+}
+
+static int
+get_group_idx(struct msm_gpu *gpu, const char *name, size_t len)
+{
+	for (unsigned i = 0; i < gpu->num_perfcntr_groups; i++) {
+		const struct msm_perfcntr_group *group =
+			&gpu->perfcntr_groups[i];
+		if (!strncmp(group->name, name, len))
+			return i;
+	}
+
+	return -1;
+}
+
+static int
+get_available_counters(struct msm_gpu *gpu, int group_idx, uint32_t flags)
+{
+	struct msm_perfcntr_state *perfcntrs = gpu->perfcntrs;
+
+	/*
+	 * For local counter reservation, anything that is not used by
+	 * global perfcntr stream is available:
+	 */
+	if (!(flags & MSM_PERFCNTR_STREAM)) {
+		return gpu->perfcntr_groups[group_idx].num_counters -
+			perfcntrs->groups[group_idx]->allocated_counters;
+	}
+
+	/*
+	 * For global counter collection, anything that is not reserved by
+	 * one or more contexts is available:
+	 */
+	guard(mutex)(&gpu->dev->filelist_mutex);
+
+	unsigned reserved_counters = 0;
+	struct drm_file *file;
+
+	list_for_each_entry (file, &gpu->dev->filelist, lhead) {
+		struct msm_context *ctx = file->driver_priv;
+
+		if (!ctx || !ctx->perfctx)
+			continue;
+
+		unsigned n = ctx->perfctx->reserved_counters[group_idx];
+		reserved_counters = max(reserved_counters, n);
+	}
+
+	return gpu->perfcntr_groups[group_idx].num_counters - reserved_counters;
+}
+
+int
+msm_ioctl_perfcntr_config(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	const struct drm_msm_perfcntr_config *args = data;
+	struct msm_context *ctx = file->driver_priv;
+	struct msm_gpu *gpu = priv->gpu;
+	int stream_fd = 0;
+
+	if (!gpu || !gpu->num_perfcntr_groups)
+		return -ENXIO;
+
+	struct msm_perfcntr_state *perfcntrs = gpu->perfcntrs;
+
+	/*
+	 * Validate args that don't require locks/power first:
+	 */
+
+	if (args->flags & ~MSM_PERFCNTR_FLAGS)
+		return UERR(EINVAL, dev, "invalid flags");
+
+	if (args->nr_groups && !args->group_stride)
+		return UERR(EINVAL, dev, "invalid group_stride");
+
+	if (args->nr_groups > gpu->num_perfcntr_groups)
+		return UERR(EINVAL, dev, "too many groups");
+
+	if (args->nr_groups && !args->groups)
+		return UERR(EINVAL, dev, "no groups");
+
+	if (args->flags & MSM_PERFCNTR_STREAM) {
+		if (!perfmon_capable())
+			return UERR(EPERM, dev, "invalid permissions");
+		if (!args->nr_groups)
+			return UERR(EINVAL, dev, "invalid nr_groups");
+		if (!args->period)
+			return UERR(EINVAL, dev, "invalid sampling period");
+		if (args->bufsz_shift > const_ilog2(SZ_128M))
+			return UERR(EINVAL, dev, "buffer size too big (>128M)");
+	} else {
+		if (args->period)
+			return UERR(EINVAL, dev, "sampling period not allowed");
+		if (args->bufsz_shift)
+			return UERR(EINVAL, dev, "sample buf size not allowed");
+	}
+
+	/*
+	 * To avoid iterating over the groups multiple times, allocate and setup
+	 * both a ctx and global stream object.  Only one of the two will be
+	 * kept in the end.
+	 */
+
+	struct msm_perfcntr_context_state *perfctx __free(kfree) = kzalloc(
+		struct_size(perfctx, reserved_counters, gpu->num_perfcntr_groups),
+		GFP_KERNEL);
+	if (!perfctx)
+		return -ENOMEM;
+
+	struct msm_perfcntr_stream *stream __free(kfree) = kzalloc_obj(*stream);
+	if (!stream)
+		return -ENOMEM;
+
+	uint8_t *nr_counters __free(kfree) = kzalloc_objs(uint8_t, gpu->num_perfcntr_groups);
+	if (!nr_counters)
+		return -ENOMEM;
+
+	uint32_t *group_idx __free(kfree) = kzalloc_objs(uint32_t, args->nr_groups);
+	if (!group_idx)
+		return -ENOMEM;
+
+	stream->gpu = gpu;
+	stream->sample_period_ns = args->period;
+	stream->nr_groups = args->nr_groups;
+	stream->fifo_size = 1ull << args->bufsz_shift;
+
+	mutex_init(&stream->read_lock);
+
+	guard(mutex)(&gpu->perfcntr_lock);
+
+	if (args->flags & MSM_PERFCNTR_STREAM) {
+		if (perfcntrs->stream)
+			return UERR(EBUSY, dev, "perfcntr stream already open");
+	}
+
+	size_t bufsz = 16;  /* header size includes seqno and 64b timestamp: */
+	int ret = 0;
+
+	for (unsigned i = 0; i < args->nr_groups; i++) {
+		struct drm_msm_perfcntr_group g = {0};
+		size_t sz = min_t(size_t, args->group_stride, sizeof(g));
+		void __user *userptr =
+			u64_to_user_ptr(args->groups + (i * args->group_stride));
+
+		if (copy_from_user(&g, userptr, sz))
+			return -EFAULT;
+
+		if (g.pad)
+			return UERR(EINVAL, dev, "groups[%d]: invalid pad", i);
+
+		int idx = get_group_idx(gpu, g.group_name, sizeof(g.group_name));
+
+		if (idx < 0)
+			return UERR(EINVAL, dev, "groups[%d]: unknown group", i);
+
+		if (nr_counters[idx])
+			return UERR(EINVAL, dev, "groups[%d]: duplicate group", i);
+
+		if (g.nr_countables > gpu->perfcntr_groups[idx].num_counters)
+			return UERR(EINVAL, dev, "groups[%d]: too many counters", i);
+
+		if (args->flags & MSM_PERFCNTR_STREAM) {
+			if (g.nr_countables && !g.countables)
+				return UERR(EINVAL, dev, "groups[%d]: no countables", i);
+		} else {
+			if (g.countables)
+				return UERR(EINVAL, dev, "groups[%d]: countables should be NULL", i);
+		}
+
+		int avail_counters = get_available_counters(gpu, idx, args->flags);
+		if (g.nr_countables > avail_counters) {
+			/*
+			 * Defer error return until we process all groups, in
+			 * case there are other E2BIG groups:
+			 */
+			ret = UERR(E2BIG, dev, "groups[%d]: too few counters available", i);
+
+			if (args->flags & MSM_PERFCNTR_UPDATE) {
+				/* Let userspace know how many counters are actually avail: */
+				g.nr_countables = avail_counters;
+				if (copy_to_user(userptr, &g, sz))
+					return -EFAULT;
+			}
+		}
+
+		group_idx[i] = idx;
+		perfctx->reserved_counters[idx] = g.nr_countables;
+
+		nr_counters[idx] = g.nr_countables;
+
+		if (args->flags & MSM_PERFCNTR_STREAM) {
+			size_t sz = sizeof(uint32_t) * g.nr_countables;
+			void __user *userptr = u64_to_user_ptr(g.countables);
+
+			if (copy_from_user(perfcntrs->groups[idx]->countables, userptr, sz))
+				return -EFAULT;
+
+			/* Samples are 64b per countable: */
+			bufsz += 2 * sz;
+		}
+	}
+
+	if (ret)
+		return ret;
+
+	if (args->flags & MSM_PERFCNTR_STREAM) {
+		/*
+		 * Validate requested buffer size is large enough for at least
+		 * a single sample period.
+		 *
+		 * Note the circ_buf implementation needs to be 1 byte larger
+		 * than max it can hold (see CIRC_SPACE()).
+		 */
+		if (stream->fifo_size <= bufsz)
+			return UERR(EINVAL, dev, "required buffer size: %zu", bufsz);
+
+		/* There aren't enough counters to hit this limit: */
+		WARN_ON(bufsz > SZ_128M);
+
+		stream->period_size = bufsz;
+
+		void *buf __free(kfree) = kmalloc(stream->fifo_size, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		FD_PREPARE(fdf, O_CLOEXEC,
+			   anon_inode_getfile("[msm_perfcntrs]", &stream_fops, stream, 0));
+		if (fdf.err)
+			return fdf.err;
+
+		INIT_WORK(&stream->sel_work, sel_worker);
+		kthread_init_work(&stream->sample_work, sample_worker);
+		init_waitqueue_head(&stream->poll_wq);
+		hrtimer_setup(&stream->sample_timer, sample_timer,
+			      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+
+		stream->sel_fence = ++perfcntrs->sel_seqno;
+		stream->group_idx = no_free_ptr(group_idx);
+		stream->fifo.buf = no_free_ptr(buf);
+
+		/* commit the allocated counters: */
+		for (unsigned i = 0; i < gpu->num_perfcntr_groups; i++)
+			perfcntrs->groups[i]->allocated_counters = nr_counters[i];
+
+		perfcntrs->stream = no_free_ptr(stream);
+
+		msm_perfcntr_resume_locked(perfcntrs->stream);
+
+		stream_fd = fd_publish(fdf);
+	} else {
+		kfree(ctx->perfctx);
+		ctx->perfctx = no_free_ptr(perfctx);
+	}
+
+	return stream_fd;
+}
+
 /**
  * msm_perfcntr_group_idx - map idx of perfcntr group to group_idx
  * @stream: The global perfcntr stream
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
index 14506bc37d05..198856b18445 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -7,6 +7,11 @@
 #define __MSM_PERFCNTR_H__
 
 #include "linux/array_size.h"
+#include "linux/circ_buf.h"
+#include "linux/hrtimer.h"
+#include "linux/kthread.h"
+#include "linux/wait.h"
+#include "linux/workqueue.h"
 
 #include "adreno_common.xml.h"
 
@@ -42,12 +47,49 @@ struct msm_perfcntr_stream {
 	/** @gpu: Back-link to the GPU */
 	struct msm_gpu *gpu;
 
+	/** @sample_timer: Timer to sample counters */
+	struct hrtimer sample_timer;
+
+	/** @poll_wq: Wait queue for waiting for OA data to be available */
+	wait_queue_head_t poll_wq;
+
+	/** @sample_period_ns: Sampling period */
+	uint64_t sample_period_ns;
+
 	/** @nr_groups: # of counter groups with enabled counters */
 	uint32_t nr_groups;
 
+	/** @seqno: counter for collected samples */
+	uint32_t seqno;
+
 	/** @sel_fence: Fence for SEL reg programming  */
 	uint32_t sel_fence;
 
+	/**
+	 * @sel_work: Worker for SEL reg programming
+	 *
+	 * Initial SEL reg programming (as opposed to restoring the SEL
+	 * regs on runpm resume) must run on the same ordered wq as is
+	 * used by drm_sched, to serialize it with GEM_SUBMITs written
+	 * into the same ringbuffer.
+	 */
+	struct work_struct sel_work;
+
+	/**
+	 * @sample_work: Worker for collecting samples
+	 */
+	struct kthread_work sample_work;
+
+	/**
+	 * @read_lock:
+	 *
+	 * Fifo access is synchronied on the producer side by virtue
+	 * of there being a single timer collecting samples and writing
+	 * into the fifo.  It is protected on the consumer side by
+	 * @read_lock.
+	 */
+	struct mutex read_lock;
+
 	/**
 	 * @group_idx: array of nr_groups
 	 *
@@ -56,6 +98,15 @@ struct msm_perfcntr_stream {
 	 * the ioctl call that setup the stream
 	 */
 	uint32_t *group_idx;
+
+	/** @fifo: circular buffer for samples */
+	struct circ_buf fifo;
+
+	/** @fifo_size: circular buffer size */
+	size_t fifo_size;
+
+	/** @period_size: size of data for single sampling period */
+	size_t period_size;
 };
 
 uint32_t msm_perfcntr_group_idx(const struct msm_perfcntr_stream *stream, uint32_t n);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index b99098792371..7f2e594be4eb 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -491,6 +491,52 @@ struct drm_msm_submitqueue_query {
 	__u32 pad;
 };
 
+#define MSM_PERFCNTR_STREAM	0x00000001
+#define MSM_PERFCNTR_UPDATE	0x00000002
+#define MSM_PERFCNTR_FLAGS	( \
+		MSM_PERFCNTR_STREAM | \
+		MSM_PERFCNTR_UPDATE | \
+		0)
+
+struct drm_msm_perfcntr_group {
+	char group_name[16];
+	__u32 nr_countables;
+	__u32 pad;         /* mbz */
+	__u64 countables;  /* pointer to an array of nr_countables u32 */
+};
+
+/*
+ * Note, for MSM_PERFCNTR_STREAM, the ioctl returns an fd to read recorded
+ * counters.  This only works because the ioctl is DRM_IOW(), if we returned
+ * a out param in the ioctl struct the copy_to_user() (in drm_ioctl())
+ * could fault, causing us to leak the fd.
+ *
+ * If the ioctl returns with error E2BIG, that means more counters/countables
+ * are requested than are currently available.  If MSM_PERFCNTR_UPDATE flag
+ * is set, drm_msm_perfcntr_group::nr_countables will be updated to return
+ * the actual # of counters available.
+ *
+ * The data read from the has the following format for each sampling period:
+ *
+ *     uint64_t timestamp;  // CP_ALWAYS_ON_COUNTER captured at sample time
+ *     uint32_t seqno;      // increments by 1 each period, reset to 0 on discontinuity
+ *     uint32_t mbz;        // pad out counters to 64b
+ *     struct {
+ *        uint64_t counter[nr_countables];
+ *     } groups[nr_groups];
+ *
+ * The ordering of groups and counters matches the order in PERFCNTR_CONFIG
+ * ioctl.
+ */
+struct drm_msm_perfcntr_config {
+	__u32 flags;         /* bitmask of MSM_PERFCNTR_x */
+	__u32 nr_groups;     /* # of entries in groups array */
+	__u64 groups;        /* pointer to array of drm_msm_perfcntr_group */
+	__u64 period;        /* sampling period in ns */
+	__u32 bufsz_shift;   /* sample buffer size in bytes is 1<<bufsz_shift */
+	__u32 group_stride;  /* sizeof(struct drm_msm_perfcntr_group) */
+};
+
 #define DRM_MSM_GET_PARAM              0x00
 #define DRM_MSM_SET_PARAM              0x01
 #define DRM_MSM_GEM_NEW                0x02
@@ -507,6 +553,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
 #define DRM_MSM_VM_BIND                0x0D
+#define DRM_MSM_PERFCNTR_CONFIG        0x0E
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_SET_PARAM        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SET_PARAM, struct drm_msm_param)
@@ -521,6 +568,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
 #define DRM_IOCTL_MSM_VM_BIND          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_VM_BIND, struct drm_msm_vm_bind)
+#define DRM_IOCTL_MSM_PERFCNTR_CONFIG  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_PERFCNTR_CONFIG, struct drm_msm_perfcntr_config)
 
 #if defined(__cplusplus)
 }
-- 
2.54.0



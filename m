Return-Path: <linux-arm-msm+bounces-105801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOL8CaDv+Gl93QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:12:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F64C3091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5881B309C4A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D6F3EFD2D;
	Mon,  4 May 2026 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/B9Mp5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvK/Oh6g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E41E3F0742
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921723; cv=none; b=EEXLy8HXGGlbZaTmZlaq5ax0VoV7RcVUCOEW9LpKPhy17xbZkx0rdDhZGh64Rto9VEJbTIFSjHmCtN3Xi13c8EtAXgkHRst7VqctyWmrlbaWpMgkYh8Zq71QKz7ZcNff3wabGVgivlRpAC5FCx2lvo/8hhbc5eP+5OyyYcOIJ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921723; c=relaxed/simple;
	bh=YfwF72A26xQIgnm636RdmNO/o1nQSq51T4AIXz8sygU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppwt9tIgnYuJKjPx3Jcn3Tppd4pBeCeMuSmLvR05EwVoE+G6yipw8nRTFhkVAVH1JtwNP9b8L20nZBGJGaZWL+mxtp4Hn7mQ84fqZuzWu+YTWCqgLi4HQ5192+4ogIY2vgL6VjmzLsb2iy/wIwDCVE+c8M1lvHXHHPxG3i5EAmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/B9Mp5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvK/Oh6g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644EMNtv1961285
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oXRxDAUX39B
	YpjgioMxBEHD8AgKubH5XAXMjQerhyrE=; b=B/B9Mp5cBtdGZdbvuJMAwazFEFw
	GKuIeZ96aNT+IMr9ijuUKw87gbS+bPmDfoyauTHDfyq/PBibRtU/Jjy0skMhxeOw
	hEi/gn0l1nGxHM2vUr64PiKsyqg1jNryuH1AC0WdikBk0pUzwX4lYe6oyC6ApRiP
	ZhkrSE44FFqWK9t74/0F+F9O7TvCGhAUoxXwA0dn5yj0vZDayIboKTL/c3DUZAmu
	XZg9GSDPW8vCJt6EaHH1tSIS7tIItKKfPVFe1YqkLxPhKNbPT1VtLThmGKxDjOAz
	rRQUeUIbmRORTSpRRYnV7VTE4AoBDqK4ZuhpJz8bBBjDbME0sw01rhgCCLA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5ds5n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c81086bf930so617243a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921720; x=1778526520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXRxDAUX39BYpjgioMxBEHD8AgKubH5XAXMjQerhyrE=;
        b=jvK/Oh6gUEz0gKVsBzRUqUDKcS+exuCaMfE6g8/X9/HRriOTaMsCvR6CKCc7zpBGZW
         NIQZMj+Q0PA04Gxdv7bk/ad+q2lUpn3VTHYgN9XjttNGRciLTZUZ/JqJ7JZwTfJldJH6
         WUUUgitKykKP4IsF3pmHH1F9vDymLPe3QUroRDMqvQaefvJAiwzrhUnVGQgpWrgjBhvn
         kHkOs5ZAIm2kMLWBdERDOePXiHp8Uuuncm/r55DpF0f9o01P7L+QTx+jMfovcnHNEofu
         UFhmJYiBBzVt6BHZ7thtgiAFUsH2kAVhV6XxsblL1n0RogLO2FgGaUajXIUB+0z2NPHj
         IRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921720; x=1778526520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXRxDAUX39BYpjgioMxBEHD8AgKubH5XAXMjQerhyrE=;
        b=WUoI+ejEdy0w7a3n5f+pUWp7wWzyBfoCvYh4J5YAObC1ljs8+d1AzhCmUOHlCgEOKb
         sWonx5tt4bmAvt9KsSRQOjcNzcR93KCa64i0+bSV0c3qXUPUcHMOT0I3YHIHhbgm1f+l
         D+kywicQjMpif85gA8JGJzLxr3PLW7rkFz+dUQ/FbCv3WlBzVtvkMarggg4EebHvrKJS
         9qtMA9eQUyiJ+Tlkw4fTsqxgCXU6T2ctN2YoJH1mwqfuL+KWM9aApAOY5/aebSvRLf7e
         g/f4LEq33spAy5SQHoU9nCLjHisJIBlavkBr8N76laCt7dsa6d81g/bbg/fEA1XMufi3
         Hxnw==
X-Gm-Message-State: AOJu0YxUopr0YvfFWXXuTMLKYnBNteHiumUvXLP9MCzbupanhcvR0qnU
	N3VLM6rYh9Al7qnpQj5xpMmCDBGpNUKGW6+agAucEDtIG0PF+8fIlD2WLogOeZ5Nyvan6HhgYeU
	3mJoyYPB3vTpmkEh//s50deu+8MNJcqQdNAJ1cbNTVHazm5gVmgWCA4Gi29kjNZbJwhO2
X-Gm-Gg: AeBDiety+GaoX8I5fYGTcXDJK5odqyCvqKOnooCZ4fFPuBZqB9Pj5vliURKWe1wh2P4
	cfFezKxX6Lq+GPZ4qt3hhBqldi5Cs6KHzYiSxAOA/LwyhGPmEKfK8x3o9Ij98UaadKuh/qet3J4
	zlgQxtXlUXGfziVMPqy2oPb4t58LQ5Nprf/VRqLzcu9np57du21COUpFSUiLoz0hSxHaxEpzQLx
	jm85alsiEyFJNaLgyIQ+GGkr0XSGNVfBj3Gw0nrFALWduwpVFJOM7g1AeO45J/BuNi3rQqdk1m+
	Kub26OCUUiOqcS36sB/tBABbFjHpg9vYMa1nvxcDJXyC5Wb3lN5mvBSLHLW0M23her3DF7BDHu2
	lv/+RKHO1Ig8QmTo/YNHhIbvjNYDNR1gYGyR3oIvXMXs=
X-Received: by 2002:a05:6a20:7489:b0:3a0:b65a:5df5 with SMTP id adf61e73a8af0-3a9f771bb4cmr586612637.30.1777921719714;
        Mon, 04 May 2026 12:08:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:7489:b0:3a0:b65a:5df5 with SMTP id adf61e73a8af0-3a9f771bb4cmr586582637.30.1777921718997;
        Mon, 04 May 2026 12:08:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbc6f042sm10654308a12.21.2026.05.04.12.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:38 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 10/16] drm/msm: Add basic perfcntr infrastructure
Date: Mon,  4 May 2026 12:06:53 -0700
Message-ID: <20260504190751.61052-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
References: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfX7k2LIyKDdP3E
 QCEMTNk2ipY7RJH8txNtA0OBzdqRcZ/wcxT1pOwhR9fs9LqgQm2VeCKOEfsAlYgbR819IjH3v9k
 vZ44tNFV5pmBvaXJQ8wHR5fnXF3//j4PRz33e3rTWVnT54NwRaVtqN3NatfntCmB3ab33e/rTyL
 EnLdHP7t7ts/6mTmBMVNi+gsMR/hPKjrXzR+LFzDnfwRwarh8ptYGrsgmnQBddkPCmCkjcdHyxN
 8FYcmZGtpF4NuwCLJvccml5DbHFMWL7gKtJHFlKNt0Z3wWZO1Jziioc747QWRHarkyuTXhS5OxA
 9F09a2Ul8UJEN/hoI8LdGCnuM92qpNqshcJ36UgMSCA96JmEwIw7FJ2QmMtQlqrPMz0tT0uDVhY
 /s7+2QTVuKzvNFIS9l8ZlGcyIqXWacVl3/A4oune7BoR0EhEJ/D2+G8GsOM9RNIUZywjQNtWuAD
 E4p+YT/0W07u4oueXpg==
X-Proofpoint-GUID: tEj8XMdab4VpAkBsGMTfzkNNdRRyZ8S3
X-Proofpoint-ORIG-GUID: tEj8XMdab4VpAkBsGMTfzkNNdRRyZ8S3
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f8eeb8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=hddbS_E73Iye693R-v0A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040175
X-Rspamd-Queue-Id: 799F64C3091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-105801-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the basic infrastructure for tracking assigned perfcntrs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile               |   1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |   8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   5 +-
 drivers/gpu/drm/msm/msm_drv.h              |   6 ++
 drivers/gpu/drm/msm/msm_gpu.c              |  12 +++
 drivers/gpu/drm/msm/msm_gpu.h              |  57 +++++++++-
 drivers/gpu/drm/msm/msm_perfcntr.c         | 120 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_perfcntr.h         |  23 ++++
 8 files changed, 226 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 337634e7e247..2466cb32dac5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -122,6 +122,7 @@ msm-y += \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
+	msm_perfcntr.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fc38331ce640..7f20320ef66a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -307,8 +307,10 @@ MODULE_DEVICE_TABLE(of, dt_match);
 static int adreno_runtime_resume(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
-
-	return gpu->funcs->pm_resume(gpu);
+	int ret = gpu->funcs->pm_resume(gpu);
+	if (!ret)
+		ret = msm_perfcntr_resume(gpu);
+	return ret;
 }
 
 static int adreno_runtime_suspend(struct device *dev)
@@ -322,6 +324,8 @@ static int adreno_runtime_suspend(struct device *dev)
 	 */
 	WARN_ON_ONCE(gpu->active_submits);
 
+	msm_perfcntr_suspend(gpu);
+
 	return gpu->funcs->pm_suspend(gpu);
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 72b71e9e44f0..ee0bcf985934 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -702,11 +702,10 @@ void adreno_recover(struct msm_gpu *gpu)
 	struct drm_device *dev = gpu->dev;
 	int ret;
 
-	// XXX pm-runtime??  we *need* the device to be off after this
-	// so maybe continuing to call ->pm_suspend/resume() is better?
-
+	msm_perfcntr_suspend(gpu);
 	gpu->funcs->pm_suspend(gpu);
 	gpu->funcs->pm_resume(gpu);
+	msm_perfcntr_resume(gpu);
 
 	ret = msm_gpu_hw_init(gpu);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e53e4f220bed..f00b2e7aeb91 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -235,6 +235,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 int msm_ioctl_vm_bind(struct drm_device *dev, void *data,
 		      struct drm_file *file);
 
+int msm_perfcntr_resume(struct msm_gpu *gpu);
+void msm_perfcntr_suspend(struct msm_gpu *gpu);
+
+struct msm_perfcntr_state * msm_perfcntr_init(struct msm_gpu *gpu);
+void msm_perfcntr_cleanup(struct msm_gpu *gpu);
+
 #ifdef CONFIG_DEBUG_FS
 unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
 #endif
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 1bac70473f80..bf6845e5719e 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -1028,6 +1028,17 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	refcount_set(&gpu->sysprof_active, 1);
 
+	mutex_init(&gpu->perfcntr_lock);
+
+	if (gpu->num_perfcntr_groups > 0) {
+		gpu->perfcntrs = msm_perfcntr_init(gpu);
+		if (IS_ERR(gpu->perfcntrs)) {
+			ret = PTR_ERR(gpu->perfcntrs);
+			gpu->perfcntrs = NULL;
+			goto fail;
+		}
+	}
+
 	return 0;
 
 fail:
@@ -1066,6 +1077,7 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 	}
 
 	msm_devfreq_cleanup(gpu);
+	msm_perfcntr_cleanup(gpu);
 
 	platform_set_drvdata(gpu->pdev, NULL);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 19484774f369..92710da5009b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -25,6 +25,7 @@ struct msm_gem_vm_log_entry;
 struct msm_gpu_state;
 struct msm_context;
 struct msm_perfcntr_group;
+struct msm_perfcntr_stream;
 
 struct msm_gpu_config {
 	const char *ioname;
@@ -93,6 +94,13 @@ struct msm_gpu_funcs {
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 	void (*sysprof_setup)(struct msm_gpu *gpu);
+
+	/* Configure perfcntr SELect regs: */
+	void (*perfcntr_configure)(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
+				   const struct msm_perfcntr_stream *stream);
+
+	/* Flush perfcntrs before reading (optional): */
+	void (*perfcntr_flush)(struct msm_gpu *gpu);
 };
 
 /* Additional state for iommu faults: */
@@ -266,6 +274,11 @@ struct msm_gpu {
 
 	const struct msm_perfcntr_group *perfcntr_groups;
 	unsigned num_perfcntr_groups;
+
+	struct msm_perfcntr_state *perfcntrs;
+
+	/** @perfcntr_lock: protects perfcntr related state */
+	struct mutex perfcntr_lock;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
@@ -311,10 +324,52 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
 	return false;
 }
 
+/**
+ * struct msm_perfcntr_group_state - Tracking for the currently allocated counter state
+ */
+struct msm_perfcntr_group_state {
+	/**
+	 * @allocated_counters:
+	 *
+	 * allocated counters for global counter collection.  The
+	 * corresponding counters are allocated from highest to
+	 * lowest, to minimize chance of conflict with old userspace
+	 * allocating from lowest to highest.
+	 */
+	unsigned allocated_counters;
+
+	/**
+	 * @countables:
+	 *
+	 * The correspnding SELect reg values for the allocated counters
+	 */
+	uint32_t countables[];
+};
+
+/**
+ * struct msm_perfcntr_state - overall global perfcntr state
+ */
+struct msm_perfcntr_state {
+	/** @stream: current global counter stream if active */
+	struct msm_perfcntr_stream *stream;
+
+	/**
+	 * @groups: Global perfcntr stream group state.
+	 *
+	 * Conceptually this is part of msm_perfcntr_stream state, but is
+	 * statically pre-allocated when the gpu is initialized to simplify
+	 * error path cleanup in PERFCNTR_CONFIG ioctl.  (__free(kfree)
+	 * doesn't really help with variable length arrays of allocated
+	 * pointers.)
+	 */
+	struct msm_perfcntr_group_state *groups[];
+};
+
 static inline bool
 msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
 {
-	return refcount_read(&gpu->sysprof_active) > 1;
+	return (refcount_read(&gpu->sysprof_active) > 1) ||
+		READ_ONCE(gpu->perfcntrs->stream);
 }
 
 static inline bool
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
new file mode 100644
index 000000000000..09e6aa4b6620
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "msm_drv.h"
+#include "msm_gpu.h"
+#include "msm_perfcntr.h"
+
+static int
+msm_perfcntr_resume_locked(struct msm_perfcntr_stream *stream)
+{
+	return 0;
+}
+
+int
+msm_perfcntr_resume(struct msm_gpu *gpu)
+{
+	guard(mutex)(&gpu->perfcntr_lock);
+	return msm_perfcntr_resume_locked(gpu->perfcntrs->stream);
+}
+
+static void
+msm_perfcntr_suspend_locked(struct msm_perfcntr_stream *stream)
+{
+}
+
+void
+msm_perfcntr_suspend(struct msm_gpu *gpu)
+{
+	guard(mutex)(&gpu->perfcntr_lock);
+	msm_perfcntr_suspend_locked(gpu->perfcntrs->stream);
+}
+
+/**
+ * msm_perfcntr_group_idx - map idx of perfcntr group to group_idx
+ * @stream: The global perfcntr stream
+ * @n: The requested group_idx
+ *
+ * The PERFCNTR_CONFIG ioctl requested N counters/countables per perfcntr
+ * group, but the order of groups is not required to match the order they
+ * are defined in the perfcntr tables (which is not stable/UABI, only the
+ * group names are UABI).
+ *
+ * But the order samples are returned in the stream should match the
+ * order they are requested in the PERFCNTR_CONFIG ioctl.  This helper
+ * handles the order remapping.
+ *
+ * Returns an index into gpu->perfcntr_groups[] and perfcntrs->groups[].
+ */
+uint32_t
+msm_perfcntr_group_idx(const struct msm_perfcntr_stream *stream, uint32_t n)
+{
+	WARN_ON_ONCE(n > stream->nr_groups);
+	return stream->group_idx[n];
+}
+
+/**
+ * msm_perfcntr_counter_base - get idx of the first counter in group
+ * @stream: The global perfcntr stream
+ * @group_idx: the index of the counter group
+ *
+ * For global counter collection, counters are allocated from the end
+ * (last counter) to minimize the chance of conflict with an old UMD
+ * which predates PERFCNTR_CONFIG ioctl (since UMD assigned from 0..N-1).
+ *
+ * Returns the index of first counter to use.  An index into
+ * msm_perfcntr_group::counters[].
+ */
+uint32_t
+msm_perfcntr_counter_base(const struct msm_perfcntr_stream *stream, uint32_t group_idx)
+{
+	struct msm_gpu *gpu = stream->gpu;
+	struct msm_perfcntr_state *perfcntrs = gpu->perfcntrs;
+	unsigned num_counters = gpu->perfcntr_groups[group_idx].num_counters;
+	unsigned allocated_counters = perfcntrs->groups[group_idx]->allocated_counters;
+
+	return num_counters - allocated_counters;
+}
+
+struct msm_perfcntr_state *
+msm_perfcntr_init(struct msm_gpu *gpu)
+{
+	struct msm_perfcntr_state *perfcntrs;
+	struct device *dev = &gpu->pdev->dev;
+	size_t sz;
+
+	sz = struct_size(perfcntrs, groups, gpu->num_perfcntr_groups);
+	perfcntrs = devm_kzalloc(dev, sz, GFP_KERNEL);
+	if (!perfcntrs)
+		return ERR_PTR(-ENOMEM);
+
+	for (unsigned i = 0; i < gpu->num_perfcntr_groups; i++) {
+		const struct msm_perfcntr_group *group =
+			&gpu->perfcntr_groups[i];
+
+		sz = struct_size(perfcntrs->groups[i], countables, group->num_counters);
+		perfcntrs->groups[i] = devm_kzalloc(dev, sz, GFP_KERNEL);
+		if (!perfcntrs->groups[i]) {
+			msm_perfcntr_cleanup(gpu);
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	return perfcntrs;
+}
+
+void
+msm_perfcntr_cleanup(struct msm_gpu *gpu)
+{
+	struct msm_perfcntr_state *perfcntrs = gpu->perfcntrs;
+	struct device *dev = &gpu->pdev->dev;
+
+	gpu->perfcntrs = NULL;
+
+	for (unsigned i = 0; i < gpu->num_perfcntr_groups; i++)
+		devm_kfree(dev, perfcntrs->groups[i]);
+
+	devm_kfree(dev, perfcntrs);
+}
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
index 7f0654182496..bfda19e01535 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -35,6 +35,29 @@ struct msm_perfcntr_group {
    const struct msm_perfcntr_counter *counters;
 };
 
+/**
+ * struct msm_perfcntr_stream - state for a single open stream fd
+ */
+struct msm_perfcntr_stream {
+	/** @gpu: Back-link to the GPU */
+	struct msm_gpu *gpu;
+
+	/** @nr_groups: # of counter groups with enabled counters */
+	uint32_t nr_groups;
+
+	/**
+	 * @group_idx: array of nr_groups
+	 *
+	 * Maps the order of groups in PERFCNTR_CONFIG ioctl to group idx,
+	 * so that results in the results stream can be ordered to match
+	 * the ioctl call that setup the stream
+	 */
+	uint32_t *group_idx;
+};
+
+uint32_t msm_perfcntr_group_idx(const struct msm_perfcntr_stream *stream, uint32_t n);
+uint32_t msm_perfcntr_counter_base(const struct msm_perfcntr_stream *stream, uint32_t group_idx);
+
 /**
  * struct msm_perfcntr_context_state - per-msm_context counter state
  *
-- 
2.54.0



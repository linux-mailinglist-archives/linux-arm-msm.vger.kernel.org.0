Return-Path: <linux-arm-msm+bounces-107621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN8hOH7VBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:00:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BE0542B0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16ACA30B3065
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B499140759F;
	Thu, 14 May 2026 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYe7RVF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XClG+8P0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1240245C
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766879; cv=none; b=nK4wWQBdTcOs64wqoM1eA1rQvf1gk83N/B99qQckhErAMWs/OprN5/p8li0uecDcMG3SwLGWrC/+2sjqnhx74GuAMbBldKRFb4TqeQyV1fbUkt7zpBihUetQpcJBVUih4yofBg9LZGyQcRAwkjhFdqTxkQQDNXN5YuAHtmMO9Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766879; c=relaxed/simple;
	bh=TJ0is2J3ziBWvMeON4s6qtfYxjer7eFmrioUbcyC0Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yhm15TSbfh9ZKyK7rSP2f87a3fhc0zLhIDpMEzeT8HCPZ1f1ajMSDQFxC75qY7QANUvNJ0GNABN0sk0Bhe7EDIK6qxZnppLrzeufaQ7XD4MAI2w6xGTEcBkSPX2Il2VoXLQY3/8ChTICseg/7PnisAPVri6RRKxvt9pEOohMq4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYe7RVF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XClG+8P0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeWEN2841099
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yZQt5Z60cUf
	moMerqECpQueGDcB1E/D0+Zhq6Y860II=; b=bYe7RVF1Qu5Ch2yTmq2kW+121Xy
	mPR21HLeUiiUCYu9qLxD+C+jU8xI7wWzl2q42zxDUDA+n03n/yzJNz8QFqGOyRQQ
	LBfK4ogPGHM+gQ+HZc7YOeNOA1ThV9cCmDj6aZYzRc3DPVjsuXKm7C0ycepHnWgM
	+EXN/0mIhm1KDA/sSJk3cZ2fr41Lk1t9LdM1dua6EBunJMvz8EjybeNncwY4HNJe
	PhVk1YCf9UROxvW99flPlVmgB991f48n653NjPEm1Q0ZSeetMVMBxsMeasfCC0vG
	+Tz5ZkQd5QZ19P55JUeU98Lz47AHJ5UBnQv2jDVpeLscqYw23VbbE+8hERg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899sn6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so7747029a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766874; x=1779371674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZQt5Z60cUfmoMerqECpQueGDcB1E/D0+Zhq6Y860II=;
        b=XClG+8P0ihNPR4kWLXmrVbCWduqukpqJBaPXJJWZQy91PMYtG5J3BLHF5wTvBXEwfU
         35qY1n1hdz8EMZFA5N6YvIO+/Yomf06gLs3mUF/5zCwQnZP25Ddxj+crvnj2TRXIdy+0
         27xJqyDXyCiZH4Xef1ScnpUz4jmE3n9k8P3rzUGJKFIOF0LwVrM57DYm6ceHYewg05ln
         3/mlqbJUh7ug9zYBUlRjTii/odK9s7JASV7zDaqd+lrj/fNp1WzcHiwADxTwJ590HOyP
         W1dEtl+bDBQl+amhbSIT8Te83lhBWtUbyYSPQOBiIkEI71ss1GJJ3C8RG5wdmOCaQPGX
         Doyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766874; x=1779371674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yZQt5Z60cUfmoMerqECpQueGDcB1E/D0+Zhq6Y860II=;
        b=jQkcAd2hrIMt+CBz5vPGv+TVrIBuf6K8iwKDHMux7of6eFmij/FIL1QK7W1okg9t+R
         ERo7Af0w4r2Z+34bPh/1WjTOabaGaBdAMtcO5zsLMP1QvM8btwKSuBrEK/8NtVaP8rla
         5oCROSPXlf9Y4kJ8/QL8jXxpTSVMCr0XRtxh7NHHuAJ9z3BiW1cQ5MRDfbaWVcEZgUz3
         ZmqJNNYd6EYuuuoBQQsS6T0cPAT6zz/UtC0cUrPOLmpPVnx8UtTO7bNhttZ/UMrrq/ij
         GrfCCyysn0rfjeTjRGevB3Vyt92ikgsLW9dBCaiTC2lkFcOK/RFARKX+oRYW35tBEg/9
         vB1w==
X-Gm-Message-State: AOJu0YxC4qDl400Ol7UjPTWQgzIJRd+QlCB5S48WkiSI2MGvgysSwKcG
	oOnC4UHmoloccz+p9ADjkugUdXECJN3Ax2/lrdCoeOiRBeqmhX32IP/s5r2hz9tEzvEr571ffWM
	WpI6DRQFjqjbuZvCs3x8pYDOCTn7VBRLUDDZyaDiIsSrI6krVDngS/pBKNzsdcRZCTptv
X-Gm-Gg: Acq92OHuJCbOn6qKlQbGIfH3QEiWIYCc92C3/FdI5S2IU0ffuOCgFgKmbHD+mZt8jkj
	pPn8s+IY4js71xtyaqG0/HqE8egMycDpGkS7FBFp3rXKHvTRnYWcmZ/yhKUSUlYVOaHcXvfKfYx
	D+tOQpe5jzh1tHgCrXFr19QqV8EIHtdjJ+POZz2QNiBKHwjf8/yyP7p2RytZHqu0QUKCaBrXrKR
	CciY2diRNy1EnBNnQNHS299KPmhyrDYR9ztKZ+APaqCo+zIDCKZhDhXiZuxDelfg1ckMeOxbCpz
	7tYMWnG8eeW87I4FLxAJd9NTGRIYsbWmUcqJADoCZphZAJREhkfeVVpuVfa8IGSlwCahhetsq/m
	+qdxw3z/ECHeOFFaqb4F/+/oYc4xdWieB
X-Received: by 2002:a17:90b:2887:b0:366:4a47:f26d with SMTP id 98e67ed59e1d1-368f3d25c79mr8670024a91.14.1778766873720;
        Thu, 14 May 2026 06:54:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:366:4a47:f26d with SMTP id 98e67ed59e1d1-368f3d25c79mr8669979a91.14.1778766873143;
        Thu, 14 May 2026 06:54:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3694f5bddaasm49095a91.2.2026.05.14.06.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 10/16] drm/msm: Add basic perfcntr infrastructure
Date: Thu, 14 May 2026 06:39:58 -0700
Message-ID: <20260514134052.361771-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
References: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfX6BZQHDGY2SFi
 tEzPhhnVXyR5MaGYDeTFn0tbRvM/IjxCzJpAIPQ8c/6sWXmx6jxv5YktcKMfIj0inReo9B9kCY/
 0WXj7z8hYQJO5OeczGGqRV/BpHE8AkA9rCee/LpQBzn6Y9d+AwdaXXQyjnrc7jHqmIuKTeXj48G
 zFo/3Huo95NZo8GrC3eCdooEBsw1sB+XhtRSPejzrz7hH4e0fiadAk/c16lL27+AcrM+6Dh5iw8
 uqtt753nIKR6UYTAJHGJwnsuaYWxlU1UHwt37TH+5lFOuu9shqvfZ97erpMlXtcZqLPTTep7NCU
 2/y0tdsEzAGiGXygxv9ByjSwastcK99hp1pxtiScoKwo1kWYkSFu0D0BdvEXWp2wBGL7hurVcaL
 qivmu3xI8ODlRvdn3keHXynkyknAnKduxzDTEQbVPQy5XIrZQ4DlK27oSoglaFD4518rpmrFtYA
 3QIVriEeXfm8jWRd6fA==
X-Proofpoint-ORIG-GUID: YQsoQVlXooIdYAH3VPnrr2zo-MOeUS0X
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05d41b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=hddbS_E73Iye693R-v0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: YQsoQVlXooIdYAH3VPnrr2zo-MOeUS0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140
X-Rspamd-Queue-Id: 47BE0542B0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107621-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the basic infrastructure for tracking assigned perfcntrs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/Makefile               |   1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |   8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   5 +-
 drivers/gpu/drm/msm/msm_drv.h              |   6 +
 drivers/gpu/drm/msm/msm_gpu.c              |  12 ++
 drivers/gpu/drm/msm/msm_gpu.h              |  57 +++++++++-
 drivers/gpu/drm/msm/msm_perfcntr.c         | 126 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_perfcntr.h         |  23 ++++
 8 files changed, 232 insertions(+), 6 deletions(-)
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
index 19484774f369..be922641a14f 100644
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
+		(gpu->perfcntrs && READ_ONCE(gpu->perfcntrs->stream));
 }
 
 static inline bool
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
new file mode 100644
index 000000000000..04407260a4e1
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -0,0 +1,126 @@
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
+	if (!gpu->perfcntrs)
+		return 0;
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
+	if (!gpu->perfcntr_groups)
+		return;
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
+ * (last counter) while UMD allocates them from the start (0..N-1).
+ * Since UMD always allocated them from the start this also minimizes
+ * the chance of conflict when using old UMD which predates
+ * PERFCNTR_CONFIG ioctl.
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



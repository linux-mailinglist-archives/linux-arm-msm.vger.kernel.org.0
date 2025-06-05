Return-Path: <linux-arm-msm+bounces-60392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3519ACF715
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6551C17AF43
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9A6283CAC;
	Thu,  5 Jun 2025 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkWZuV7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22A428312B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148381; cv=none; b=rQOQQ3TJT3Ikc34/+2SQWeszz0x3Jk8ag1O4WRxks+rCD8Ex4F+khiTDum4tu9iD9x5eao38lXXtDAoa++eDjSuaqJ6FETBavzxAWMZERGUmBx+1oRdYHbn4BteZboKrNaMd/hX9IvaBXxDBlEjGYzuTJ4gLeOUXYvhEoKx3Tso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148381; c=relaxed/simple;
	bh=ftDEYghv9ZPaM93JeZPk7reVm7j6fvbEKPYYqLyUebA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1XEUpCOS8iOmRIRK2ptBDN0MlKZN8N8I543KEzdsg8TRMPH0fftOdHa0PLRRbSnaVkYzFAavkQr4B6C5kUMLd3OmC8fOXo/DJVlzVEtj/HLHIzGXiAcsaC1KQNPXz78/mJ3uy5tXuM0fan/R+Hy/nRniQdOfNzBoxaaieugJgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkWZuV7a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GjXnr004287
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GjwdFtRmZCc
	ujedmTouJ/e/3QiW6i5MklXvEyiWEeF0=; b=kkWZuV7avWl80lhhB/hYQfk7lUC
	6ExfCDrzM83Xwna53MMUjXxiazcxrSxAsGzeE65ihvVDCymzW84/GWfwdqWB4sa5
	C16lWV87dXMvGc6HZ92FI0PbHMYkOmUt4wblVak9HqGGe0uen1FBf2BsjNJAEwjy
	/c/2iU+I+K3rbtane0VO8QWDqyaiWL2U2zoG66heRi0cbYyOQ/ikJvzek73kWwh1
	D1tjYiOrm5vT6Ymg9bWJWJJHwwtzugOwkPgijgVJ7wR4hEX1/5dzmXsnndVMLM3Z
	MHTIGDiCa1zKKVJTH9bQFm+f+vGZo7HFMibe5ROQ7oyFXdwou8/2Re7O8Ng==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s2c69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7425efba1a3so1170599b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148378; x=1749753178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjwdFtRmZCcujedmTouJ/e/3QiW6i5MklXvEyiWEeF0=;
        b=RpDffkWLcGC9p+U2XqNRU2H5EfIyNcIY+6bGQ9+UMJ+OFa8XGSnh3xH7FltEveTXg+
         zJgIoNyNQeAuRJvMoWg1KtXIwCPDGrfSuCIxTA42M2jd2F6MREfcJD4OYgc3msqptSyA
         2mu1vvIuKT7w/cRKt44sjPBC10I/zN+E7zPD8eGZLzJCEKwA5eMpEdujyfuWlEUe11Nc
         Dt14JhONp1UjrYQlI1pjHLrYbix/TRPQ4vdbRuefeL6SSME22TTDX3a7keUVEnoFQf+y
         pYXBjWKAXONMbZ8jdam+pWsYwbsSV4olmuszRAetWGHdOBlcZJMTzp+Q3E7ya3GfWZB1
         OIZA==
X-Forwarded-Encrypted: i=1; AJvYcCU7DZVrnL2i/gFSHN+pPwk+AuA8lG8Bn+xlS28sKXqvGG5oVuHeC8XS2yu1R9CzSzuNg8jiDhEuFkOS0jP0@vger.kernel.org
X-Gm-Message-State: AOJu0YwxCPu24aeunxWrswtUtRAStI34deNBgQUlR3ARSL9eYI5kpDWR
	ZUtfp6+m3VNd0IJedcWnfubQHWIDHYmb5f30p+htEnxE6VjBNmWbhnZNfK8ETU8WHNbzLSqvefz
	z3udZGhYqUpSg2x++o1LHFSHGzCzT95icTFDhg7nVK0HeIRft9eKd3g1u7a5+CAFMuhoW
X-Gm-Gg: ASbGncuLODWtQN1hFTI0mdp/xfTO6cUDw1IIcOx1BbiYx8xjm4gKwjUuGHzuZCBl+5p
	gteJSy33LgWRRWEvHErEcJVeRc6hKi7Vc/xK20K8sDSu/1bnILFry2SqbviyoeNxtqpztSE/qYw
	mY2LiOAaTcOMVwOYWWTIyY8FgiGakZH9ScWWLjyyAQkK42v0rEF/ZZPMDkXfVYVzdnsuHxgFYvv
	ZzG/zq8fa0OKVqGAbcEXWr0gt2GBX4xI70XMCQ5T0cnNU8xtL9aOhNInz3T65Y/wLJ3FvxCEG+O
	szd9/PWC0JmK1iT2nSGkTg==
X-Received: by 2002:a05:6a00:f06:b0:742:a24d:aede with SMTP id d2e1a72fcca58-748185160dcmr6346507b3a.8.1749148378386;
        Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuKpjDQOHpbnp+mogU9n35DFZViXAwwcqPGcim05ueVVuUmQIJFSRRzTywH2aBcEBZ1w/yng==
X-Received: by 2002:a05:6a00:f06:b0:742:a24d:aede with SMTP id d2e1a72fcca58-748185160dcmr6346484b3a.8.1749148378012;
        Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcfa19sm13531812b3a.132.2025.06.05.11.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:57 -0700 (PDT)
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
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 21/40] drm/msm: Mark VM as unusable on GPU hangs
Date: Thu,  5 Jun 2025 11:29:06 -0700
Message-ID: <20250605183111.163594-22-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: eQAZWsfUEeXSYUAOccd91WD_JIEm4r6R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX9rJgNth7TB7k
 Ywd6EwsxrlN+vbuSrNibiHtMcqD09HtZ5yCTLqJPnn1WArM2UXQ7jtGtn05Do0k4Bfr6Aep84RV
 tZJp46EhxwkAoEdDHagvPAU8QvtpehKAte1XAVjIAB0pnWqGEeu5GuB1x6Sl7xt4g7e/f5pcBHS
 eKZWufhEUp4BYPfSdLYX6OdNAb6hAsAwO85wS1/at0m+qPJCYIjXqI7rhemRsm06BAxOw1i0yyy
 kP8LMpJf+r/3KL0RFCnkURxqhntgNKQxLbR9DMWBZZEfcmQitd9/tWno5IN2W8gbxpzYxfKUSqN
 Rslwqu0ddAzbCF1NAjpi6xHOoU3o2qAqTS35KULyqGdGWaJpH+CQ9MYgHA5aeQPbTPqGgwjHSew
 rbLvQ2gw5sXhO4xsfNuGvstpj5gA7nPk8Kg3VElLycxR2NA+LknzGnZmxPm5GRFkHRLQSNHk
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6841e2db cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: eQAZWsfUEeXSYUAOccd91WD_JIEm4r6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ec1a7a837e52..5e8c419ed834 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9d58d6f643af..fe43fd4049de 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -679,6 +679,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0314e15d04c2..6503ce655b10 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.49.0



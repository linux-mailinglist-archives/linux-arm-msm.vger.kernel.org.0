Return-Path: <linux-arm-msm+bounces-117780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k4L0BPmKTmpiPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:38:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C9729490
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:38:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S6xaUCnT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T+Qis4Fe;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117780-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117780-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AEBA30A29BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 17:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9764A13A0;
	Wed,  8 Jul 2026 17:34:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAD8301471
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 17:34:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532077; cv=none; b=KG+4YsLLzJtAK/WWTQCvm6u3iK8y2RaQ6Awx/ETQnLYjqlcJBon99TPMybBTcEiCqo3ZVTIMIS1waakpTz4goGKpqg/VddtTXHwA/yuhDAq27dOAtrEbW0I9EVtyKYqXqOW0Uld+JzIANo3gojYsPEo6fBgepXQGWGTDCI8ADoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532077; c=relaxed/simple;
	bh=OkUH3ciOjWFg60h81ovKGMQgQf7pTQ48VJSsIXSetmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZvW930lvvRaVOZ2cr6GacKLAqKz8OXIquAKJ8anzv9vw3YssYkWfVdH89qoCzLRrMMYOOekHLCUbGj/6dx2wfPtUFVGL1dKQf7INrhi0YiZ1qsSJSBWAdVMHVuLOv8BBphNIrFBbnJldRfOOvh2TBhn69kULY1yDG6RHiqLEnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6xaUCnT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+Qis4Fe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GL5Bm3125741
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 17:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vOFiS3gWQCJ
	aLhFgxBelkuMdy2oPlvu9rT+AQ3nGeTg=; b=S6xaUCnTQnFBBaVo/g2/kFoTUia
	+Wdp8+ZznsOU9ZoACXIvPFMZlSbGyVVAmeeEzEL42RKkxSqR4cNE3MrqUGZvVUku
	B/TS1/UIQ51DIWbkwbTqzNe4VqoUUo3Xj/Ksj1DFDw3t+PMAGb2qN35T/2GOqCII
	UxTfZvDvQnWqKnpID33AmWJHqoWo9P106iqWFnfW4gAR89Pu65Z69SRxLDQjOQGq
	CWCQ28OF6bLaxBy2T+eRgo9SVJ4UOD2DuTl80i4WgqCae+d8CjEJ8SRsLFBPi+Nk
	Ys/62emyyIfvmT5/K94JC89aRAnv6u6YcNTfj42R0rcw5EFlqaZeTZ46FkA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s9a0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 17:34:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848452dd146so2368830b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783532074; x=1784136874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOFiS3gWQCJaLhFgxBelkuMdy2oPlvu9rT+AQ3nGeTg=;
        b=T+Qis4Fe6O0oT1Bq0DxUivnkn/JAV2zhnL0yTBuG21L6Q52A/1DhHIiUeHaw2DDA7h
         J/bLbcJP34Q5DG/d18eguwrelK2sH29YJfJ1pXUplDZEICghjcUswyW04wV9IILp277q
         jhb/qShJb3rqZThu7paP6MpSR7yTzrzMu8brl+/ffAylQwMjE2KrNxrTOLRBrvSAklNW
         qrMuiepTWALfX1qct+32rRMdf9+WuKiErRxLh+zQn6X9unJh0NEPYV8YVmg7gyTS/rWi
         0QqRNHtLPKJsgFszbzqIh3y3819aqeQtF2DFwLdRwJzf4k4W+x5dDQ1LEz/piAloYnNL
         kU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783532074; x=1784136874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOFiS3gWQCJaLhFgxBelkuMdy2oPlvu9rT+AQ3nGeTg=;
        b=OCcrd5VAqvVV0yQVc/fqtvDTW6i4FseDCh5y5i3+zTLdNY0uvkKRwILXhtNVgjm4a8
         vhptl2lcez1cDNxtktc3EwMeXZ8TGf0zH5WjXgmpfY0R/MSjXAF0V+Vk1NAm0u2ePZg1
         WbE7r1cfyfCpKW1I/CmALR3cma0tr3HmeLieclxt4uxbjnq0IhE1WLCX6D1MOuFxx88N
         IOOd6DmwY5URtuJIhOdz0OI4/xwiOVhzAWDYcgbnekfba4fj8Oy307ZyWqGbcnNYRV2l
         pxNrZ83EUnMcKeSQJ2xzuauEJ+hjf0+R8v0AvWAhtWUuvAkmketUcp7FRTSPlx24PQdX
         9wqQ==
X-Gm-Message-State: AOJu0YwTcvb4QP/vfsKgL4TF719zLbXd/peuO6lmJLwYw+oDPj84yHwv
	aQ+p/sSyiEe/k9Q9N1ZWSn9S7NC5qVEQ0g54nnspYpElPsHx4NwQ1csmkQsmbEG1bFQEoYy2o7f
	xvOZRb35WoRthscfs5IjS9DR4euDhhrAn+nxOx9b/u2AnSZsHM4WPk0M03QfD2VUUUHdK
X-Gm-Gg: AfdE7ckUqGxQjQLv7EhyAlNlDSoSLFXIZE3rDqVnLOlw7M5/auRU+xFnBhsHNN5frTn
	QafPhvEDANTXEqzj9fbooF0fn/mTNiH1gDq0gq/0B0glvXuZCUdKFCaxoldtoLd09bAI9bMjSdh
	jgCoLIEyjU5DumBDELDtg64v3BZO4Sl505kVduK2BJcPG1jewlqmtGLS6erXVk3n5YTwXRovrfO
	CEqQKP7GLuZ6NRSnP6bCGeZDgPlB6+fKJpCNewHIf2XuXTtqVYHA9RzK/0BBxdLX6y9aHxSnH2M
	upIFJ4uE9ghewPzAGVpzlKmAKHaM5IcGMr3RWH4/AomAE+NN5OFRRDxJFmBzVfohYHcCZeJuZKZ
	Nghp7AqN93pK4Aw07rpRt1GbwRVpnIAh+L6EshPtJKE0WCi6p8YukPM9liQ==
X-Received: by 2002:a05:6a00:17a0:b0:848:55d3:c890 with SMTP id d2e1a72fcca58-84855d3c8cfmr187827b3a.30.1783532074379;
        Wed, 08 Jul 2026 10:34:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a0:b0:848:55d3:c890 with SMTP id d2e1a72fcca58-84855d3c8cfmr187797b3a.30.1783532073913;
        Wed, 08 Jul 2026 10:34:33 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848414a34f7sm1423977b3a.44.2026.07.08.10.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:34:33 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/6] drm/msm: Block VM_BIND for shared VMs
Date: Wed,  8 Jul 2026 10:33:50 -0700
Message-ID: <20260708173356.578713-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708173356.578713-1-robin.clark@oss.qualcomm.com>
References: <20260708173356.578713-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfXzpj37aVETlnI
 Y9vZOhR93CoIRjun+w4XWMWnKNkFBA2dEOPtocOnxM5U5zVs27gxL4jhA+ctgXPykiUGdc1hOGq
 nZdQzJH5KIcdiadLRyAl0hpfHP+qmRKU+ap9WBYRu626PKU3owNWL8+k36eirelL3dbCl3g0y9x
 ztMjLboQpkHMqu3K/absGlVWjEUz+yNg08CnRg5e14qHrooch7CFRdnwBkijpOwOvvYY7WI6eSq
 BlAszcHH0GkAxtMyOPK+c2s2QVg1CnEe66hVW4mXdsLnV8snbuYRBbXWCATV26hhBoCtDd3C0AO
 W7qU5CEdPZrbJ8YRBElQcci3nyB3DACMM0Iz3fvB5ayAux/kVa+NQtdJ8phesi8x5cAwcVt6V0R
 FyY9bK8tcXg/etiX9ZSO0B0QP0ocmAIA4lqTeVo7K8SeoQb9hVXH72IJae/CqWxHs2Pv7IweJD9
 WMNGwc9YyLE/j6yU2jg==
X-Proofpoint-ORIG-GUID: PnMgSDwEhf6vZHoLDk1cmMsfno5sARgh
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e8a2b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=GoQzj6LmqzT0DKjVJ_UA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX6oCHTuVehj3M
 e1MZWVBOYaWMzhwpgmDISt78iu808925gNbjQkSswFBvw3NIu7P0mjoW4zd2Lp1gusJ1Gj3vJ+v
 TLc1dDWVHIIicrjOLt47V0s0Sn4ztzc=
X-Proofpoint-GUID: PnMgSDwEhf6vZHoLDk1cmMsfno5sARgh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117780-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 647C9729490

We already block MSM_PARAM_EN_VM_BIND where per-process VMs are not
supported.  But in error paths when we actually try to create the VM
(allocation failures, etc) we could still end up with a shared-VM.

Since we need to create the VM lazily, for backwards compat, there
isn't really a better place to return an error.  But this isn't to
happen in practice.  Just block VM_BIND ioctls in this case so we
aren't giving userspace a way to manage the shared VM.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 3ed05ab0eeef..06a3f2aa3ef0 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -954,7 +954,7 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 
 
 static struct msm_vm_bind_job *
-vm_bind_job_create(struct drm_device *dev, struct drm_file *file,
+vm_bind_job_create(struct drm_device *dev, struct drm_file *file, struct drm_gpuvm *vm,
 		   struct msm_gpu_submitqueue *queue, uint32_t nr_ops)
 {
 	struct msm_vm_bind_job *job;
@@ -971,7 +971,7 @@ vm_bind_job_create(struct drm_device *dev, struct drm_file *file,
 		return ERR_PTR(ret);
 	}
 
-	job->vm = msm_context_vm(dev, queue->ctx);
+	job->vm = vm;
 	job->queue = queue;
 	INIT_LIST_HEAD(&job->vm_ops);
 
@@ -1430,6 +1430,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_vm_bind *args = data;
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 	struct msm_vm_bind_job *job = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
@@ -1448,7 +1449,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	 * Maybe we could allow just UNMAP ops?  OTOH userspace should just
 	 * immediately close the device file and all will be torn down.
 	 */
-	if (to_msm_vm(msm_context_vm(dev, ctx))->unusable)
+	if (to_msm_vm(vm)->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
 	/*
@@ -1456,7 +1457,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	 * place, if you haven't opted in to VM_BIND context.  But it is
 	 * cleaner / less confusing, to check this case directly.
 	 */
-	if (!msm_context_is_vmbind(ctx))
+	if (to_msm_vm(vm)->managed)
 		return UERR(EINVAL, dev, "context does not support vmbind");
 
 	if (args->flags & ~MSM_VM_BIND_FLAGS)
@@ -1479,7 +1480,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	job = vm_bind_job_create(dev, file, queue, args->nr_ops);
+	job = vm_bind_job_create(dev, file, vm, queue, args->nr_ops);
 	if (IS_ERR(job)) {
 		ret = PTR_ERR(job);
 		goto out_post_unlock;
-- 
2.55.0



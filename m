Return-Path: <linux-arm-msm+bounces-109389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ts2jCeaWEGpTaAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:48:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A26935B883F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 092DC30C594C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07F4368D6B;
	Fri, 22 May 2026 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emQzGiIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BezLCCAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34C8379C4F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471310; cv=none; b=WQQCdBCwzibXh2ipXBtBb3kRKXOgTJBplk6yaFr1D1pwKgp2+5uKu3e0NtQOaLjeNUDABv62GGPub7oQDG/1kg8q0w6EFjm7THPZLqkmwcdD+FsPqH1SrFEOwKjI1HIsAgLFOSzTdG+YgRaYC0NsjyI6azzu9/nnbylhUJL8b9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471310; c=relaxed/simple;
	bh=QDxGdJcOm7v2xhLyXx98tkrDyQD4MKz8WoNrPdRznaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBJC4vh029hy+GViIDvv63GLt3Gwo0rZAQjjsDPDHEVNnN0oM7/4c15vLMeBY9D/9LXkjQpzwPLgcVrzyFInNfGnuxKoaIrUd87LunH+wAZ3Epi6UXWPW6nn+RFvQEx68JOILWlOj0E0ctKrnmvFA9nb6YHGY03pqpY8ADDQLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emQzGiIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BezLCCAd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFv9Wf3005107
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Deid5R3Lmtq
	Z0P+RFoa9IB3pG13iRkpjEqosdnVWrfw=; b=emQzGiIaIwUSh3vZFwhRt7U5tum
	NLbask7oToJUR7ULN4HKSoohBeBdHxzYkodxz4o9aF79zYzWU+bEwGR3Eho9YPyE
	L/adbM+XVf+Q1bR1k/DF5608W+0MGLl5rv/lv4HE4um/RAWoGlBjT5qWqZnUa+Y+
	aCCflJdFi10DxSWGRhoSFgUd3s0f6MEVkNsdDFKEq8NOeHv9bKWZuv4ht5YFNCcx
	5p7agD/a6KaOIp2g/om4a63GqLTlhPJ0EWkQvR00G2ac98SPk1jWgU3GdkgWBPM4
	2gi+9Rb5RXb8K7A7B6WlTCFWAz7o2XOiaU9UFFh8b3G/W+ohWf/5dclrcxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtb8aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4530a90fdso136524135ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471305; x=1780076105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Deid5R3LmtqZ0P+RFoa9IB3pG13iRkpjEqosdnVWrfw=;
        b=BezLCCAdiHFKUhXo9n5jHf3fgr7CgQJ40TIQ7Y4svV0q5Hqn+M75dScaO6gCR18J5l
         TGLIoRIXDVx3kPxj4H+tsm+0SehwUzzBmkoehRCCc6Oti2sEl4sXQ+6Ap/4cGfc0RR5D
         tLVykVDkIlILDi9papDyU1BRDev0okxVzCrObFyuJ+vLpyFTYeO5Tt0XUnjBSkQLNibG
         GrGNu8y2AVJywNM1Shic5wtP79166f/HFbygVGe1g6L6YN1h2/DGaiRUITrz1advkSQW
         DpoQlIGY2h1PTNDMTMMDYyQTxgoocj/wbSVdmTC5fQF/1HFRiMruPxyHrUpLdbYmrcfZ
         fa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471305; x=1780076105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Deid5R3LmtqZ0P+RFoa9IB3pG13iRkpjEqosdnVWrfw=;
        b=oNSHoLmkqmUmPXfepaBXFQLdetHVrWfRu1U1lQ0Uie83CQ1RvZABm+R9X1KzuufyA+
         smUZoSIM+KfUsMHiA3Tu0N+Td7FuP0zYyKSjqQK8KEIvDgbxi3rwK/vQz0GQEvQAyD1N
         GOR3N1BFd0sJvxh+O/gdYJc1XEpWr4LFHu0H1Zu2bNGtrl8MlmX2XesCXv+5RaD2vJ83
         51i9WW2BCo2des9RA0U1CYrinxUwRyVrPgL4JogHiJnTbVPtSsclfSBn8VrLXqQD42GZ
         L0YqcnkOAFcVKkesZ2gQqLKlEynpssQSE278iQcAyrL/JD7hRyKxbEDioXj57PuTvJs7
         4Muw==
X-Gm-Message-State: AOJu0YxC+JGellE3KeD4OYvDoG/I3tO2EdvxWsST60lhIj2JS/PjDppT
	j4/lBAAgKpbE5zyRgdmXqGRBPBI6stumVTKv0Fm4jjBdOJAeWv04nWzcCMEcUkOc/uGaSzwLdUW
	azHYvKr9aWHhcN6nlAb88afuoxvvQnZ+kIRf6f5M4PkS7+1lXlOd2eF99hcGxHsrw7Znb
X-Gm-Gg: Acq92OFI5XmAEmTYy/pDtbuYFnPRAZYsF00BiTTSh9CmJTL+cq0qVq1SPCXiGn+Ulf0
	kgoDHc5bgsxvj2wHLp44wyBKuJXRP0HpYmP1xlMF2+InPTLFaMlzx/Uk0R+GJb+HmubVYLU73mt
	VSw1G9st/NXZmlRPUjkviEnRVv/ybbmoVL51XQywv1zuJwzOX9dnyqNRXc1lM7HqM+PB5DlLIJh
	ipi2WMjE3Cx/yvrGc+YBYuWVxvauI9quLIRbvfRBQn2cUj1QxyF+Rkn8GpEhXRDSim9a0Hm54LE
	4qMRiEkga/XqGQyx6gQekkCL5gjOEtQ3jyEbyYHV2XQxqdAdn0+kJXgdTiFIU/zH+im/7+oQzHW
	3FkzStkKNn8iCKZJJV6vc9eutDYPeLokO
X-Received: by 2002:a17:902:f650:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2beb038f177mr55487045ad.1.1779471305471;
        Fri, 22 May 2026 10:35:05 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2beb038f177mr55486635ad.1.1779471304953;
        Fri, 22 May 2026 10:35:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2e8csm20708725ad.41.2026.05.22.10.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:35:04 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 16/16] drm/msm/a6xx: Allow IFPC with perfcntr stream
Date: Fri, 22 May 2026 10:33:02 -0700
Message-ID: <20260522173349.55491-17-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a1093ca cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=5obZvuzjGUYrwyXX1KsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfX1mb7zY8zEIiE
 BsKRXndZS9x6kFwd7HA9mzq1bjmoOpZW6IIPF53zgK0ElECeSsAvYcDgCw5M2YnMK2en2bwM4Ee
 T6mQ4kk5jmqmGB+4njEXlgLqr1S8bdCO5OR5JgpvTChTmn/LdLnjD7aOtKhseQhdY939SpP4qR6
 N8Uc/TZpTFpfL19jvDbHrH4I+VwlwNkLRya0bNcXZaxbUnM97gBgKAjEfqhQ8beARkXlJfcgQLz
 m+5AJyx8ND63psOMMdraVY/OjRJfkFdREu+gmR7666JBvV3UO5GnPmWEmo3l/fy4btIlJ8nE00c
 3yNdFtCdLFOXmyXndNCD2tuQPPResnq1bwjYEyoKqD7yX5Mh0G61IgSy/JtRGsRRX0f1VkvnkZw
 v+yaIuUWmfC9eUHUi0pCukJnvygwbYhMH1QSi5RxzwALmVT+chZMY7Jzd3V3WSu9xJV3WP+wjOi
 3qdZmopVGpUo9Xj6PVQ==
X-Proofpoint-GUID: X1RxLUV47QlVKCP5g6SAICoEAbly2CeA
X-Proofpoint-ORIG-GUID: X1RxLUV47QlVKCP5g6SAICoEAbly2CeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109389-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A26935B883F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that the dynamic pwrup reglist has SEL reg values to restore
appended, so that SEL regs are restored on IFPC exit, we can stop
completely disabling IFPC while global counter sampling is active.

To accomplish this, we re-use sysprof_setup() with a force_on param
to inhibit IFPC specifically while the counter regs are being read,
while leaving IFPC enabled the rest of the time.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         | 10 ++--------
 drivers/gpu/drm/msm/msm_perfcntr.c    |  8 ++++++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  2 +-
 5 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index aba08fb76249..0a7d49a2c877 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2034,9 +2034,9 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 	return irq;
 }
 
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
 {
-	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu);
+	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu) || force_on;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index b72fb58bf223..f60a0801a62d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -281,7 +281,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu);
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 22cbafe75a07..3d8f1ea5335b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -93,7 +93,7 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
-	void (*sysprof_setup)(struct msm_gpu *gpu);
+	void (*sysprof_setup)(struct msm_gpu *gpu, bool force_on);
 
 	/* Configure perfcntr SELect regs: */
 	void (*perfcntr_configure)(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
@@ -378,13 +378,7 @@ msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
 static inline bool
 msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
 {
-	/*
-	 * For now, this is the same condition as disabling perfcntr clears
-	 * on context switch.  But once kernel perfcntr IFPC support is in
-	 * place, we will only need to disable IFPC for legacy userspace
-	 * setting SYSPROF param.
-	 */
-	return msm_gpu_sysprof_no_perfcntr_zap(gpu);
+	return refcount_read(&gpu->sysprof_active) > 1;
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 419e797478e8..fbcf8822ce61 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -256,6 +256,10 @@ sample_worker(struct kthread_work *work)
 		return;
 	}
 
+	/* Inhibit IFPC while accessing registers: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, true);
+
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
 
@@ -290,6 +294,10 @@ sample_worker(struct kthread_work *work)
 		}
 	}
 
+	/* Re-enable IFPC: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, false);
+
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
 }
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index a58fe41602c6..1a5a77b28016 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -42,7 +42,7 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 
 	/* Some gpu families require additional setup for sysprof */
 	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu);
+		gpu->funcs->sysprof_setup(gpu, false);
 
 	ctx->sysprof = sysprof;
 
-- 
2.54.0



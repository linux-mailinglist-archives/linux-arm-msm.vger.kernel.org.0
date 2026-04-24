Return-Path: <linux-arm-msm+bounces-104477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LLfH1+I62n8NwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:12:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2D46098B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09554300C6C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCC82D3ED2;
	Fri, 24 Apr 2026 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVI7UgBA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="On+RODZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D32BEC27
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043532; cv=none; b=sG6VuzYwkjmyQN2RG/lWY8vaU2MuoobOyp8nGV9SHBmba9qsU59NsefsAtnrjfVo0JxJCUI2ma4sYYvL8AQqISQiuQM8L/Y5cUrbU08Sv9OSEZFC4RGJc7LUJmu7gFY4fBilmhf8fGhWOnL6EwaepE4sjGdf+uF92Nz7KfslEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043532; c=relaxed/simple;
	bh=zYOgVLyZNeidj4aaYpoO3VeqCvvcIoZVOtE0oKhwRBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6CHY0F+XfyPak2w2oUGtBrvYZUERYyDSUYucGYvFoOwTCoCtKoXHZcwTJ6xP8HOHBm3eL2wkAwMp04B0+Xcvm0AgW46KKxY/5Boe2kkagZtLLhQ1s/1v5lmSHYl2wLruPN3cGunKnpRRUKGWP8YRZBG/bJn2qcIqg6QRHgrGW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVI7UgBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=On+RODZR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O94Jjo2710099
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cFtUg4FJvx5
	MF1DaQQ57KRHQULyf4GIu8b9MO2ARFjM=; b=iVI7UgBAK3aMEMV4Xjsh7tZEE5I
	uZcJ0XXcoiOXIzgliX/B/QG/jwXlIvZcJn+s7AmOA3HaCyagKNVVXS5dqYC1JXp8
	V0HF7g41PMgoB+qIcCiZRvXyBeq9KErsKo/ohnkiNIwDuHVFqKg/MEKW10NFfaHu
	maeB5osyUCmuKTKq4dHRj9nK1Zvr3Ajb6nkic51pCcTIAwVHm6gqWhtFRPJTiwHb
	WkjXOnlWHS0NZGelTOA8+2zCplbHhSDIf9+n4yzXFgi9NdcGiPP6hnRMhYV7Di5m
	ccgKPvVSiIuH9VXNR1AAxmVqpq0rQFAgoIvOy7rWEiusJ/4kSrYhv/ygcSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9vr8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24af7ca99so107545305ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043528; x=1777648328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFtUg4FJvx5MF1DaQQ57KRHQULyf4GIu8b9MO2ARFjM=;
        b=On+RODZR194kH/P5XDP+UY2UfOJr6Wiw7u3aYw9YMiaexJD3CYrsP9C3g6egP7eLpF
         udFjryZFRKUs9uEKHDcqZjNLKH1C85tTB0wlTMP/Q0vfbaadIw3seAyFyPvJlsYy6y5m
         7/6AJ1YTvMEvaa6awfpbyzDFokG/ljAmPeoVrafC6LTl3JUMnNhyH/H5OnulCJRRCloO
         UEjEB0IMekCW/jFZru0o/Cy7wAf9gvyJHYUw+UwzQWLOmk3FM9doX2frX6WsMWz5dHSS
         ouvpOcTE60erK9NnUlZXSuwbbEswTvRX0SKDal0ip+VT8DG3nJCsfoZ2UDqLqKn2JMdK
         K7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043528; x=1777648328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cFtUg4FJvx5MF1DaQQ57KRHQULyf4GIu8b9MO2ARFjM=;
        b=FaSEN5Ml+IGTHASwjgzTLN83ZsOzHQDzk/RPadNE8TP0zdL83Y5E41680pgj0oH9MP
         U7TAKSITH0UtdvEU+++TR5kAlJifTtzlgVOl9XsKil7YeOqH8EETwXFEmhGsSQMDbWmb
         HPiU6808S9Ld3ry1g6Ga18/hAMm5vHh2KLoE6sZrVflQQg58o6AwiqHv5T/+SrMzj8bt
         9kxZHFZunt9yDYAchFLJOmmamgttQl3oupu7D3DG7bn5B1CyF460xxVisf+7EUXEIyVd
         n5sBx/B4Q/yHoFhpt8mrk1i9GV1iClyheICQfotga+10tozaeDle9TgZPA5dO/b3zSrF
         7bLg==
X-Gm-Message-State: AOJu0Yy3m0Np1aYnTiIEU9ocbW0756GTj0JaUBravMOgihmDBkrERizB
	wP5ITnTjpsX3yIwDC42W7zOKtGAZ4U8LO2GFHntgAguU+P96qbwvVsWA017y7bWkElc+5nkmvXa
	d3USG0hYaeiimBt3HqElG2NVYNiLTJwpLhxR70s3qiFpXGqsOcxXjEhzaaGb8euxvFfYO
X-Gm-Gg: AeBDietZKikBZ/lUm3g13PcSvacFhr5kN5UGNcGfmnrQJYNs2Xhmxc0q5rakEhv+si+
	p+lACvwe737ePkEBJ4CqTqTYY4Tbq498BI+G53O7I21s27ZCEOS0H6wDa2AJ8spu86Z++DbnwMG
	UlNVVgMBvSr9x1YTmDDdI/LBqy5exNcmaDcQsRxfbta2pP7p1je64jPTj97iQo8LKc8uo3OYzgQ
	o+sgEJj44dXRsvDQEj7PK48iecA5plbuafN0jFMwP29pL5qTG1RoJd0T202AkKZduz3oNed1Ikw
	BivBiHK8E8fDwHBpzsoCj5y1ZU2roKeDhKCcX3/rAgjPt1ktdI/i4PWUgoBh8m6fbz/wqqhJqEO
	CAlT9OhexJeD74e3Ns4u3gZwaYFJ1iDbtL0kuj9hI4HE=
X-Received: by 2002:a17:902:8649:b0:2b4:65ab:57cd with SMTP id d9443c01a7336-2b5f9fbdd39mr245951145ad.36.1777043528193;
        Fri, 24 Apr 2026 08:12:08 -0700 (PDT)
X-Received: by 2002:a17:902:8649:b0:2b4:65ab:57cd with SMTP id d9443c01a7336-2b5f9fbdd39mr245950785ad.36.1777043527613;
        Fri, 24 Apr 2026 08:12:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab29398sm233545215ad.66.2026.04.24.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:12:07 -0700 (PDT)
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
Subject: [PATCH v2 07/16] drm/msm: Add sysprof accessors
Date: Fri, 24 Apr 2026 08:10:42 -0700
Message-ID: <20260424151140.104093-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
References: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PsVCBoIpRKWGZ3ygA4-YNy6DRZTC-l1b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfX5j5z0kGjzlyn
 BzeS2S/Fx8HExIYm1SRqi2PMP048j9bvGyf9Cv3mUuJPm1hLHqSMcSfw4dPk/q2XawuKBNF8SWV
 VpTUsWG2RxlgX90XXsO2E7RlYESNZflwPjpON4wFm/ucFAOGgzuzzW8Rj0SJ4GUlZ8w72POx/8Y
 JJdyz5/5dzBp0p18X5azCA36SzevRhiAqtf05u1gbPgLtv0tFQhzn2fBxQqJGuzjxFdJ2teWdf0
 j3lPKAwzPrUbB1S/1h1QZoA5fr2xVjBv+mtqTMduDUPGK4MVFBo/7Ae867e+R+WrQ05k+w9umfo
 QSAR7bBCKjFxMBA1ZL8jKVE6007LwYp7IB2OomnsrfWX4U4Ravu0AqTa81d231M3af33WMRtvnB
 nxwSfgqfCKS9ndLC7YBxEJIlUOSg7v5bwY+Zbg8BUOJRmjMKiiow83CD1sd+tbwGFqhqDszMR8g
 L9s+y0AmloKebxCQUyA==
X-Proofpoint-ORIG-GUID: PsVCBoIpRKWGZ3ygA4-YNy6DRZTC-l1b
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb8849 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=v4b4B-quZFKF0PxyZCUA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240147
X-Rspamd-Queue-Id: 7FB2D46098B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-104477-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Currently the sysprof param serves two functions, (a) disabling perfcntr
clearing on context switch/preemption, and (b) disabling IFPC.  In the
future, with kernel side global perfcntr collection/stream, the decision
about disabling IFPC will change.

To prepare for this, split out two helpers/accessors for the two
different cases.  For now, they are the same thing, but this will
change.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  8 +++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  5 +++--
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h             | 18 ++++++++++++++++++
 6 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad8..aba08fb76249 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2036,10 +2036,10 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 
 void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
 {
+	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu);
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	unsigned int sysprof_active;
 
 	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
 	if (!pm_runtime_get_if_active(&gpu->pdev->dev))
@@ -2047,15 +2047,13 @@ void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
 
 	mutex_lock(&gmu->lock);
 
-	sysprof_active = refcount_read(&gpu->sysprof_active);
-
 	/*
 	 * 'Perfcounter select' register values are lost during IFPC collapse. To avoid that,
 	 * use the currently unused perfcounter oob vote to block IFPC when sysprof is active
 	 */
-	if ((sysprof_active > 1) && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	if (sysprof && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-	else if ((sysprof_active == 1) && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	else if (!sysprof && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 
 	mutex_unlock(&gmu->lock);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 727281fbef36..71f54ab5425d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -203,7 +203,7 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		struct msm_ringbuffer *ring, struct msm_gem_submit *submit)
 {
-	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	bool sysprof = msm_gpu_sysprof_no_perfcntr_zap(&a6xx_gpu->base.base);
 	struct msm_context *ctx = submit->queue->ctx;
 	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -1608,7 +1608,7 @@ static int hw_init(struct msm_gpu *gpu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
 	}
 
-	if (!ret && (refcount_read(&gpu->sysprof_active) > 1)) {
+	if (!ret && msm_gpu_sysprof_no_ifpc(gpu)) {
 		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 		if (!ret)
 			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
@@ -2854,6 +2854,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a8xx_progress,
+		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a8xx_gmu_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index df4cbf42e9a4..1e599d4ddea1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -261,7 +261,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
 
 	/* Enable or disable postamble as needed */
-	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	sysprof = msm_gpu_sysprof_no_perfcntr_zap(gpu);
 
 	if (!sysprof && !a6xx_gpu->postamble_enabled)
 		preempt_prepare_postamble(a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index ccfccc45133f..e022c9a162a4 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -849,7 +849,7 @@ static int hw_init(struct msm_gpu *gpu)
 	 */
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
-	if (!ret && (refcount_read(&gpu->sysprof_active) > 1)) {
+	if (!ret && msm_gpu_sysprof_no_perfcntr_zap(gpu)) {
 		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 		if (!ret)
 			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_preempt.c b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
index 3d8c33ba722e..6cb53a071801 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
@@ -242,7 +242,7 @@ void a8xx_preempt_trigger(struct msm_gpu *gpu)
 	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
 
 	/* Enable or disable postamble as needed */
-	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	sysprof = msm_gpu_sysprof_no_perfcntr_zap(gpu);
 
 	if (!sysprof && !a6xx_gpu->postamble_enabled)
 		preempt_prepare_postamble(a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 8c08dc065372..9e5c753437c2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -311,6 +311,24 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
 	return false;
 }
 
+static inline bool
+msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
+{
+	return refcount_read(&gpu->sysprof_active) > 1;
+}
+
+static inline bool
+msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
+{
+	/*
+	 * For now, this is the same condition as disabling perfcntr clears
+	 * on context switch.  But once kernel perfcntr IFPC support is in
+	 * place, we will only need to disable IFPC for legacy userspace
+	 * setting SYSPROF param.
+	 */
+	return msm_gpu_sysprof_no_perfcntr_zap(gpu);
+}
+
 /*
  * The number of priority levels provided by drm gpu scheduler.  The
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
-- 
2.53.0



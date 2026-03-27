Return-Path: <linux-arm-msm+bounces-100164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 69CJHy/MxWnNBwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:15:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C8533D6DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14D0430465C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A028BE571;
	Fri, 27 Mar 2026 00:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOjxcWib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbVXkgS6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6F9188596
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570488; cv=none; b=APS5FPTneOB7gEcGALz5cXeqEYIXrQES2EQnxejAlof/GB1w+QEZhDPiIQGaCtyoHgXIeSb4axzF8Jg72EdV4Q2oUVyc/QreUNxZTT3cSS02Dx/Zck6RqPSj3iDnourE7tfLRIfZp/DSfU9NfGXTDf5gEAwsU3MQjzs1IExQm2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570488; c=relaxed/simple;
	bh=4sNlSSX01xvTjnuR3bo4sHiMTLNkYzfz+0imYgUO+AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmqMZ85hO8SXp1CpE1NmOKl6NSpFEqD3mHOyl6EcnP1BSlW9Y6xPow5xnrO6Ci7+QWYHtoeommsQyqnKU87E2Pdym2CDXl4pTKRqhJnLVQHtuCAUpbPQxNcOJAXSaIUrgKDuxKyXO2pKWb4dQcN+kkteLS/cvvsYoLY0q9SSCss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOjxcWib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbVXkgS6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QMCjVR2583514
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ypVmLmZoKp0ZQrPOn04KrEzrtKR2UKnrkXkHej2c9lo=; b=YOjxcWib7A38DVxc
	RCQcQ7z/4YxztOfn10nn0ZsnYUllMs47RszsCGdPDpGmYQ9kXW/bmx64vabchvNa
	oirZ1J0kVlkXL4IQDEIPuGZp+mMN8Z8TgXqTM99Xjn1bpFJ7I8MTo5/c1UQwvHZm
	TFyXws0z3cypikMSuANfnaI6c/+6xSqL8OqB/fPuaxetLK9O6i/8HrQDnRHR7YEc
	Ul8jLRMmRL4xYYWLfBxuDW90tmMJbalvIpGtoQl9y6CJORgFrSYf5oycQhJDXeTc
	5lLlSWFw2BkEsmXysjMBk+UbjECkiFk0E6GdUttS6PUHl7pFyNoYoq/tkm9KlmJW
	3qjLuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6g91f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a0b51eb23so1283206a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570485; x=1775175285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypVmLmZoKp0ZQrPOn04KrEzrtKR2UKnrkXkHej2c9lo=;
        b=WbVXkgS6ImHMKe8dOJ5W3iSUuUl0mSRiaDJb8nO8mnNyM/dj436lwoPrPtkLbdcr+n
         a70R2devTGHNJQF+lZ7lWEhZolixn2W9BYeBuOX37b4xrjEj6dG0Xa0Q+b1y7Gew9umb
         5HEF7wK6Q2T3E4Fx5M03uN+Gr1K/jWZPDK7lzV524WUtni3ZXc5F/krRwjaoeI5jJNrx
         /JcU1H0KN3OQCIbUjjzAxoCvWDXiju9Hx2cThs0i2tZP9RAe8sNVcZh5g7o4xEA/rUoE
         p1x4Hbhcv65yYluSEgwkHroqpR4hxuF173ogSdKF5V821Qds+U3twYKrQbkwJFAgBXD/
         0aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570485; x=1775175285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypVmLmZoKp0ZQrPOn04KrEzrtKR2UKnrkXkHej2c9lo=;
        b=NMhUQlg6p70MMgxQgwySy6QTrUZe4soyslZtGD7ANAdA7K/m1nJQGVkPFFs9g00ykD
         w2FDI3kx/+KMHEUS701fCL8BTKyXcV5Gdwnf12ah8f2wu2kFk5cE/I3fCjsc58YoDZix
         K2CoIvqFCv3OAkgJ0lKbqG7KZWBh6FGnIlxaZMxno7rjj9H0XWtMbhp59DnrtgHw1LGZ
         QiJWf78kMODu4xqnGnKWKAs3UYv9rcicLxIujT3yq6ESwUv7s4t/wfNHM3/w67QOde3S
         3RZY47dsGkRGIRwTq9NI7ATP+vFPG2xLYeLFyXnaMOFegjxyJK1bMYR9FUo+AdcKiHwN
         xTKg==
X-Gm-Message-State: AOJu0YwMgQFj8Rhzfwu2GLYmHfeNIMD5VwwX6v6E1kIkCxEgRDdR6hti
	NKpD0geo7d1SwBZa7JfqQ2qrgdzyN8vxZVJfai968s0cbC4OChyDTHnh2+yLXWziIrWzpOqz7F9
	n/9QKK/aH4EJpg0s7zC0LHohFTkG2MhxbBaphk+zOID2fai/qwRJr8KKwImLvnjI4698q
X-Gm-Gg: ATEYQzziRpJn1+aAg6pA0mhxrWxJ5ajRHiVblQraPoEVzBpZX0SfWS30leUj3yt1iWM
	LyrUokidQ1hZuq/Csj7A7ScSpqIvlkNIVAfhILqq1IlwgwSRRy0umEP17nZdhZEwXlruZbiR0mc
	orEakgqkUnHnqqWCWxc5Fq5dAIwsXe0J0bdsjz2V8Ym9iqEU84ouFOWGD9G8BxFYz1/DZbSkR/L
	WFaKrW5VDnoCGp7sxgfu1xvieFUKc0JDdvcr4fCG8AnHhgLWIOk+uQvMQfP851wZA5x4lhWJ7lw
	kPxEtwNZMFaiU4t8GNHijR79oS6sN+d+HgOV+CLZQnSQ4t9gjzhuzCvDH1uAVbPNMJspWXCOdro
	2AeQ896eJQSCgsb3/Z0LxsPxba3l0LAXC4OoAnaHa41w8HQ==
X-Received: by 2002:a17:90b:4c8e:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-35c300ba450mr459563a91.16.1774570484618;
        Thu, 26 Mar 2026 17:14:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8e:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-35c300ba450mr459523a91.16.1774570484033;
        Thu, 26 Mar 2026 17:14:44 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:14:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:43:51 +0530
Subject: [PATCH v2 02/17] drm/msm/a8xx: Fix the ticks used in submit traces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-2-2b53c38d2101@oss.qualcomm.com>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=9033;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4sNlSSX01xvTjnuR3bo4sHiMTLNkYzfz+0imYgUO+AY=;
 b=46/uTwtLhlypkw7TNF9KlOd+hv8EjygBujiXy/XCtNsoC/2mP0dzG0gCljqXP/6drRoDQiOBf
 Wn90MhhodBCAulHMuH9eYe8SV+w2+Ds3RAkZ8yphS0rj7Fe/x37z5J/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c5cbf5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=wZqpmLHwZRrC_MsAvYoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: vvNNS3fjiLYyTgY4eULYw-x5nWli9pM6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfX6TZgGSmpZQER
 DBnLE+QWd2ZVbar0mUeHA+QkNQ53UTX3i2UxevO9fTzmQ2sN8jShOaxFuLG7VJQK5RJWX2Hkr/Y
 TLz9hJHfQBkxAjo7nxCjojTvywU/Un6QNsSKsohHcHS3KllAwmoWxADgnyFE4403CPIomh476zi
 sLS+dpxhMon3WhVRGSzAO+9FlN5dSbSRaqjN5o5KmN83qF37dDmwqEHheiZa8sogUt4KRH8I6Rd
 jFctAIpBwpUeEpS7KPqEo8CDD3v/tamcCmN7FPPcHPrA/GZ0eK5X2jvTYsf35DN901O57TLLU9Z
 pa3HJep0LKBKSsevax5kaJ7zzcSf5IHzj/FY4Klgz/wP+9BFNgvdRZG6/whx4ODFV+5z+CSsE3U
 /zHraplxw1kHwVJXr0iWcJEasyCcf+waq7OXioHpC4t0bM/dywREJ3vWVAE1l9akT/6H2sJBcq2
 L0EZ3fbUjdzc8Ht/pUQ==
X-Proofpoint-ORIG-GUID: vvNNS3fjiLYyTgY4eULYw-x5nWli9pM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100164-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gitlab.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0C8533D6DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

GMU_ALWAYS_ON_COUNTER_* registers got moved in A8x, but currently, A6x
register offsets are used in the submit traces instead of A8x offsets.
To fix this, refactor a bit and use adreno_gpu->funcs->get_timestamp()
everywhere.

While we are at it, update a8xx_gmu_get_timestamp() to use the GMU AO
counter.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c             |  6 ++----
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c             |  6 ++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 23 +++++++----------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c             | 20 ++++++++------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c           |  6 ++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h           |  2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  6 ++++--
 8 files changed, 27 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index db06c06067ae..0ed8bf2b5dd5 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -604,11 +604,9 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
 	return 0;
 }
 
-static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+static u64 a4xx_get_timestamp(struct msm_gpu *gpu)
 {
-	*value = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_CP_0_LO);
-
-	return 0;
+	return gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_CP_0_LO);
 }
 
 static u64 a4xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 56eaff2ee4e4..79a441e91fa1 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1435,11 +1435,9 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
-static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+static u64 a5xx_get_timestamp(struct msm_gpu *gpu)
 {
-	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO);
-
-	return 0;
+	return gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO);
 }
 
 struct a5xx_crashdumper {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..50bd7aa4e792 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -16,8 +16,10 @@
 
 #define GPU_PAS_ID 13
 
-static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
+static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	u64 count_hi, count_lo, temp;
 
 	do {
@@ -404,7 +406,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
 
-	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
+	trace_msm_gpu_submit_flush(submit, adreno_gpu->funcs->get_timestamp(gpu));
 
 	a6xx_flush(gpu, ring);
 }
@@ -614,7 +616,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	}
 
 
-	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
+	trace_msm_gpu_submit_flush(submit, adreno_gpu->funcs->get_timestamp(gpu));
 
 	a6xx_flush(gpu, ring);
 
@@ -2414,20 +2416,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
-static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+static u64 a6xx_get_timestamp(struct msm_gpu *gpu)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-
-	*value = read_gmu_ao_counter(a6xx_gpu);
-
-	return 0;
-}
-
-static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
-{
-	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
-	return 0;
+	return gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
 }
 
 static struct msm_ringbuffer *a6xx_active_ring(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4eaa04711246..a4434a6a56dd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -320,7 +320,7 @@ int a6xx_zap_shader_init(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
-int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value);
+u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index b1887e0cf698..840af9c4d718 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1174,23 +1174,19 @@ void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
 }
 
-int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	u64 count_hi, count_lo, temp;
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
-
-	/* Force the GPU power on so we can read this register */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	*value = gpu_read64(gpu, REG_A8XX_CP_ALWAYS_ON_COUNTER);
-
-	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	mutex_unlock(&a6xx_gpu->gmu.lock);
+	do {
+		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A8XX_GMU_ALWAYS_ON_COUNTER_H);
+		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A8XX_GMU_ALWAYS_ON_COUNTER_L);
+		temp = gmu_read(&a6xx_gpu->gmu, REG_A8XX_GMU_ALWAYS_ON_COUNTER_H);
+	} while (unlikely(count_hi != temp));
 
-	return 0;
+	return (count_hi << 32) | count_lo;
 }
 
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..785e99fb5bd5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -391,13 +391,11 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return 0;
 	case MSM_PARAM_TIMESTAMP:
 		if (adreno_gpu->funcs->get_timestamp) {
-			int ret;
-
 			pm_runtime_get_sync(&gpu->pdev->dev);
-			ret = adreno_gpu->funcs->get_timestamp(gpu, value);
+			*value = adreno_gpu->funcs->get_timestamp(gpu);
 			pm_runtime_put_autosuspend(&gpu->pdev->dev);
 
-			return ret;
+			return 0;
 		}
 		return -EINVAL;
 	case MSM_PARAM_PRIORITIES:
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1d0145f8b3ec..c08725ed54c4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -79,7 +79,7 @@ struct adreno_gpu;
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	struct msm_gpu *(*init)(struct drm_device *dev);
-	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
+	u64 (*get_timestamp)(struct msm_gpu *gpu);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index c4e00b1263cd..33404eb18fd0 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -141,8 +141,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x1f9f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
 	<reg32 offset="0x1f957" name="GMU_LLM_GLM_SLEEP_CTRL"/>
 	<reg32 offset="0x1f958" name="GMU_LLM_GLM_SLEEP_STATUS"/>
-	<reg32 offset="0x1f888" name="GMU_ALWAYS_ON_COUNTER_L"/>
-	<reg32 offset="0x1f889" name="GMU_ALWAYS_ON_COUNTER_H"/>
+	<reg32 offset="0x1f888" name="GMU_ALWAYS_ON_COUNTER_L" variants="A6XX-A7XX"/>
+	<reg32 offset="0x1f840" name="GMU_ALWAYS_ON_COUNTER_L" variants="A8XX-"/>
+	<reg32 offset="0x1f889" name="GMU_ALWAYS_ON_COUNTER_H" variants="A6XX-A7XX"/>
+	<reg32 offset="0x1f841" name="GMU_ALWAYS_ON_COUNTER_H" variants="A8XX-"/>
 	<reg32 offset="0x1f8c3" name="GMU_GMU_PWR_COL_KEEPALIVE" variants="A6XX-A7XX"/>
 	<reg32 offset="0x1f7e4" name="GMU_GMU_PWR_COL_KEEPALIVE" variants="A8XX-"/>
 	<reg32 offset="0x1f8c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE" variants="A6XX-A7XX"/>

-- 
2.51.0



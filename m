Return-Path: <linux-arm-msm+bounces-108837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO31F4rgDWoN4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:25:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB96591E7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFFC9301603B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7500936BCDE;
	Wed, 20 May 2026 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jj9HbAUm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDH9COeB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E2C369D4A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294317; cv=none; b=uyfzmX/yOxSKSMVG86WPeyzd6ESCf6gz0HCWQ81Iu7o4HzKx3jF/SuvE1n3ahlv0ADdxa0sgOXRQDwXbxZf0oj/WQFSPWhHyoCX0B2LLIAD10pPrM+xg+k1O4gmzCL3174nLdiFZdd4+Jv2YJnfLphN8FSeNY/voZkrTSS+EU3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294317; c=relaxed/simple;
	bh=Ezp3XKTj8w3PXTeXpCKggLS4oX5laIQGKlB6QGkxR6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vC5RgztchkTkOvHMh1azi0NhsAPAxo4TrG55qTNpgiVMKxdxs8Qkz2M+k4AKRY7XBS3eYVNhrTngQQG/fY4Vr8e2a8yCIJItgYfoI1agM/wK92Ktp5RpUZF9CYsUihFyDosib35YwQRvf/GCZqmx7QiLxGjOh2OVMeUm1V9CrBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jj9HbAUm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDH9COeB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZYpf3085003
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rIZeePmgZG3
	CJ4or0446JStMniwHZJ9VKj0ljLl99G8=; b=Jj9HbAUmdvpsPniGdwUtxKYSRER
	ZEE8jbiwd1gH09trbEn+eh4E6x1sRDd1O1m3v/3HUjBT1YsQ7Aey4k+/t+WWd3Dk
	8AZf3R6TEKw3j/BK0aa0z8yXUn+TEadViNmYpnjjZomgO3B3xedJtym+60eNhZFe
	onfMc3stLXxW4Zmdkyn8dYDNaZxMUC9OA+0XV+3XBvj+TEDMTyhgc1cKEDHdE+qp
	g1mI5dRUWovnRptcoS0J8QWIIdYUIubI+vHU9+sEZAeCBgU+KRkcBjuLBgDrufVt
	5OngGTqHfZZT5pypOuEscrOekPf3ob6qOjoLeCmMuIwPwdvY2YR/SxUGxNA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f156g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828cee4fcdso2570953a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294313; x=1779899113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIZeePmgZG3CJ4or0446JStMniwHZJ9VKj0ljLl99G8=;
        b=iDH9COeB4EFxAYBdah4LJUteWu6UHcJiKLwxMi77MRn/CUZihjNFm+0xChfUapuIou
         jE4J9JvOc+0u00IEgsUt13AisI6thCwpMBwn1d+xRcG9W9nKaY+LAYb8a7iZUI69JhrV
         dm61oWT/E7o0U/u8eZNknT9MjhHVbz6VwpbDYTx08c0vLUBYLp+sOsvvyKwT7OQRZhoc
         2mVbpFFbT0wqW27jsZ5qitrzAQNB6fW11uV5ggtr5TVmJ+Uu0R3nQxQbRIINUe9w9MI4
         YIn960XPAtJTiPcGusmsXT4YXDVw5r3RfGENS2IWT934QScWHZCOUg0YBfw/ti1Z0KSS
         oLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294313; x=1779899113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rIZeePmgZG3CJ4or0446JStMniwHZJ9VKj0ljLl99G8=;
        b=IzQZ+Phct4TYa0AjW40/v+AanRMDhXipXeCNQlb9ZHbqzUSip+uy+BXK29QXRiIB5g
         JNCdy5Jm38o4SJcboLwNhfqg4YVfys8om2/ADsaNR9csOowl+Uzqs88Xya5OWj7na2iK
         qDmHdJ6sI+U002S85ZvCdw8lJmTcgFkbWeUpdZYJoLtxkfaq80CvOApH6Y0zWlDKXPxU
         +JTQOqJLzC2/P6M2G9kozxcBo3siWRayidliPSt9EEPzOGOeJ4bZYny7cv4Xs6/BBZ05
         ICGAupimQ70t6zIDc65VVdGyblS+E3xJorNLWKafH2aSrgZY9n3C+mWLI39RVj/4SKe1
         utaQ==
X-Gm-Message-State: AOJu0Yzu7/qNLTXf0+0g/8Py8GrPbbSSviMJIP3Tb6hRnScpHn0y0gL/
	Pkv2wMEVUiQa2/DywvH88dU4iFqZ9DurLyMh6o/4BJXhjf79pXJr2TEshdxfa4E51vapmZnBPyT
	22OEfQhLXYGW1aryKoQhVoLfQCd9M66fwCp/HJ3vrLN+vzcPW3i1dc7nbwP1NV9d9jX9m
X-Gm-Gg: Acq92OH3aGxYQL724o0WcQCsNmO3IGuZNFOMBktLjhBej9YuZzihc/NufX78MudmgCb
	g6/9iRjkkxpjvVejxrjfA/9+wb3ZOMNb5S5VtILpZiWDMEA3Cs6uF48yzsX1+/9eHVPZHsjDvI3
	DP7W8OC0N0Mv7Q1FSBqA0nK3XM2i+nrDlBwU3IQHAcvl51PHQfOjVlaEXrYGq/tzuWeK2HWWzn8
	SUdPq8mRTlmlDmTWDhc2AbthXdG+AZUJnXonfNoeIJ7C9xMTHS/0vhL/ahh6BkHnl2ivG6ogK3h
	yP/2qNnL88fslQ/tdQGoUIwkxtMcCzmyi76nlLpUWR5lsDbooQl/BIulNIS5E83dcIBaO87geo5
	YBv9UcZNppH5LKhfz4+EfOCxV+sS7M4gJ
X-Received: by 2002:a05:6a00:94f8:b0:83d:6c12:a632 with SMTP id d2e1a72fcca58-83f33db80b8mr23313278b3a.50.1779294312621;
        Wed, 20 May 2026 09:25:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:94f8:b0:83d:6c12:a632 with SMTP id d2e1a72fcca58-83f33db80b8mr23313233b3a.50.1779294311975;
        Wed, 20 May 2026 09:25:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19661261sm27508299b3a.3.2026.05.20.09.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 01/16] drm/msm: Remove obsolete perf infrastructure
Date: Wed, 20 May 2026 09:23:48 -0700
Message-ID: <20260520162454.18391-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
References: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0de069 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=istQItjhLDCz62CzcYoA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: G6QcmIkfthuEO3nwimeq8PU4A9r9s1Sp
X-Proofpoint-ORIG-GUID: G6QcmIkfthuEO3nwimeq8PU4A9r9s1Sp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfX7Qj9FvaSJ0q2
 VtG3gscaadpB6Fi2rnu37HbkSz7uzV3L8bdLEFZS+bMborrKB1AX/DQDK0e15bsxvfxymQWYzdb
 nmX9arCJtS+uGe2hs70jYKdTCQQwh0JYmh0z6Ye6pagndW6zVwhZ/agr8ZB0+JsIcPeERWrtbid
 nNIaTJ2SSd1qWu9pUvcJeC4Pi9Pe6BaVdPzNiW3j2jqGY21Dt78zWjed0ycE+R4F0gVNON7Agxt
 N7puineoxsKkKQxaQl4JX95fMmAitQnFtHmfZolFIDTa7/3bL2LxoradYQrAy0xZXBDnpE00Bdp
 1XWx+G+oIvezoxqyAsmWi0lFDbiIn+JdP46bc3VASukcL1ePhBxWGaiBIo5QqWwqoKj1lcxoDcQ
 S+O1E+m0XztySdt2z2+FWzS+pmA6U2l8QK9+HHugoShSYKnUmzYIsoTWVZWZanNaKFlk1A+FDo/
 gDvOTQcbHdbVgSmWkzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200159
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-108837-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BB96591E7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Outside of a3xx, this was never really used.  And it low-key gets in the
way of the new perfcntr support (or at least it is confusing to have two
things called "perf").  So lets remove it.

This drops the "perf" debugfs file.  But these days, nvtop is a better
option.  (Plus perfetto for newer gens.)

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile          |   1 -
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c |   7 -
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c |  16 --
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c |   3 -
 drivers/gpu/drm/msm/msm_debugfs.c     |   6 -
 drivers/gpu/drm/msm/msm_drv.c         |   1 -
 drivers/gpu/drm/msm/msm_drv.h         |   5 -
 drivers/gpu/drm/msm/msm_gpu.c         | 107 ------------
 drivers/gpu/drm/msm/msm_gpu.h         |  31 ----
 drivers/gpu/drm/msm/msm_perf.c        | 235 --------------------------
 10 files changed, 412 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/msm_perf.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index ba45e99be05b..ce00cfb0a875 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -122,7 +122,6 @@ msm-y += \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
-	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index d5a5fa9e2cf8..df4cded9143f 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -489,10 +489,6 @@ static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
-static const struct msm_gpu_perfcntr perfcntrs[] = {
-/* TODO */
-};
-
 static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 {
 	struct a2xx_gpu *a2xx_gpu = NULL;
@@ -518,9 +514,6 @@ static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 	adreno_gpu = &a2xx_gpu->base;
 	gpu = &adreno_gpu->base;
 
-	gpu->perfcntrs = perfcntrs;
-	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
-
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 018183e0ac3f..c17e9777beae 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -266,12 +266,6 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	/* Turn on performance counters: */
 	gpu_write(gpu, REG_A3XX_RBBM_PERFCTR_CTL, 0x01);
 
-	/* Enable the perfcntrs that we use.. */
-	for (i = 0; i < gpu->num_perfcntrs; i++) {
-		const struct msm_gpu_perfcntr *perfcntr = &gpu->perfcntrs[i];
-		gpu_write(gpu, perfcntr->select_reg, perfcntr->select_val);
-	}
-
 	gpu_write(gpu, REG_A3XX_RBBM_INT_0_MASK, A3XX_INT0_MASK);
 
 	ret = adreno_hw_init(gpu);
@@ -508,13 +502,6 @@ static u32 a3xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
-static const struct msm_gpu_perfcntr perfcntrs[] = {
-	{ REG_A3XX_SP_PERFCOUNTER6_SELECT, REG_A3XX_RBBM_PERFCTR_SP_6_LO,
-			SP_ALU_ACTIVE_CYCLES, "ALUACTIVE" },
-	{ REG_A3XX_SP_PERFCOUNTER7_SELECT, REG_A3XX_RBBM_PERFCTR_SP_7_LO,
-			SP_FS_FULL_ALU_INSTRUCTIONS, "ALUFULL" },
-};
-
 static struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 {
 	struct a3xx_gpu *a3xx_gpu = NULL;
@@ -542,9 +529,6 @@ static struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 	adreno_gpu = &a3xx_gpu->base;
 	gpu = &adreno_gpu->base;
 
-	gpu->perfcntrs = perfcntrs;
-	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
-
 	adreno_gpu->registers = a3xx_registers;
 
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index e6ab731f8e9a..6392126f48f2 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -652,9 +652,6 @@ static struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	adreno_gpu = &a4xx_gpu->base;
 	gpu = &adreno_gpu->base;
 
-	gpu->perfcntrs = NULL;
-	gpu->num_perfcntrs = 0;
-
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 1059a9b29d6a..f12701e286ec 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -344,12 +344,6 @@ static int late_init_minor(struct drm_minor *minor)
 		return ret;
 	}
 
-	ret = msm_perf_debugfs_init(minor);
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not install perf debugfs\n");
-		return ret;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index edc3b4af14f4..3066547f319b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -87,7 +87,6 @@ static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_op
 
 	msm_gem_shrinker_cleanup(ddev);
 
-	msm_perf_debugfs_cleanup(priv);
 	msm_rd_debugfs_cleanup(priv);
 
 	if (priv->kms)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6d847d593f1a..e53e4f220bed 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -45,7 +45,6 @@ struct msm_gpu;
 struct msm_mmu;
 struct msm_mdss;
 struct msm_rd_state;
-struct msm_perf_state;
 struct msm_gem_submit;
 struct msm_fence_context;
 struct msm_disp_state;
@@ -89,7 +88,6 @@ struct msm_drm_private {
 
 	struct msm_rd_state *rd;       /* debugfs to dump all submits */
 	struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
-	struct msm_perf_state *perf;
 
 	/**
 	 * total_mem: Total/global amount of memory backing GEM objects.
@@ -442,8 +440,6 @@ void msm_rd_debugfs_cleanup(struct msm_drm_private *priv);
 __printf(3, 4)
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...);
-int msm_perf_debugfs_init(struct drm_minor *minor);
-void msm_perf_debugfs_cleanup(struct msm_drm_private *priv);
 #else
 static inline int msm_debugfs_late_init(struct drm_device *dev) { return 0; }
 __printf(3, 4)
@@ -451,7 +447,6 @@ static inline void msm_rd_dump_submit(struct msm_rd_state *rd,
 			struct msm_gem_submit *submit,
 			const char *fmt, ...) {}
 static inline void msm_rd_debugfs_cleanup(struct msm_drm_private *priv) {}
-static inline void msm_perf_debugfs_cleanup(struct msm_drm_private *priv) {}
 #endif
 
 struct clk *msm_clk_get(struct platform_device *pdev, const char *name);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index cf244fd529aa..1bac70473f80 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -699,104 +699,6 @@ void msm_gpu_sysrq_kill(struct msm_gpu *gpu)
 	}
 }
 
-/*
- * Performance Counters:
- */
-
-/* called under perf_lock */
-static int update_hw_cntrs(struct msm_gpu *gpu, uint32_t ncntrs, uint32_t *cntrs)
-{
-	uint32_t current_cntrs[ARRAY_SIZE(gpu->last_cntrs)];
-	int i, n = min(ncntrs, gpu->num_perfcntrs);
-
-	/* read current values: */
-	for (i = 0; i < gpu->num_perfcntrs; i++)
-		current_cntrs[i] = gpu_read(gpu, gpu->perfcntrs[i].sample_reg);
-
-	/* update cntrs: */
-	for (i = 0; i < n; i++)
-		cntrs[i] = current_cntrs[i] - gpu->last_cntrs[i];
-
-	/* save current values: */
-	for (i = 0; i < gpu->num_perfcntrs; i++)
-		gpu->last_cntrs[i] = current_cntrs[i];
-
-	return n;
-}
-
-static void update_sw_cntrs(struct msm_gpu *gpu)
-{
-	ktime_t time;
-	uint32_t elapsed;
-	unsigned long flags;
-
-	spin_lock_irqsave(&gpu->perf_lock, flags);
-	if (!gpu->perfcntr_active)
-		goto out;
-
-	time = ktime_get();
-	elapsed = ktime_to_us(ktime_sub(time, gpu->last_sample.time));
-
-	gpu->totaltime += elapsed;
-	if (gpu->last_sample.active)
-		gpu->activetime += elapsed;
-
-	gpu->last_sample.active = msm_gpu_active(gpu);
-	gpu->last_sample.time = time;
-
-out:
-	spin_unlock_irqrestore(&gpu->perf_lock, flags);
-}
-
-void msm_gpu_perfcntr_start(struct msm_gpu *gpu)
-{
-	unsigned long flags;
-
-	pm_runtime_get_sync(&gpu->pdev->dev);
-
-	spin_lock_irqsave(&gpu->perf_lock, flags);
-	/* we could dynamically enable/disable perfcntr registers too.. */
-	gpu->last_sample.active = msm_gpu_active(gpu);
-	gpu->last_sample.time = ktime_get();
-	gpu->activetime = gpu->totaltime = 0;
-	gpu->perfcntr_active = true;
-	update_hw_cntrs(gpu, 0, NULL);
-	spin_unlock_irqrestore(&gpu->perf_lock, flags);
-}
-
-void msm_gpu_perfcntr_stop(struct msm_gpu *gpu)
-{
-	gpu->perfcntr_active = false;
-	pm_runtime_put_sync(&gpu->pdev->dev);
-}
-
-/* returns -errno or # of cntrs sampled */
-int msm_gpu_perfcntr_sample(struct msm_gpu *gpu, uint32_t *activetime,
-		uint32_t *totaltime, uint32_t ncntrs, uint32_t *cntrs)
-{
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&gpu->perf_lock, flags);
-
-	if (!gpu->perfcntr_active) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	*activetime = gpu->activetime;
-	*totaltime = gpu->totaltime;
-
-	gpu->activetime = gpu->totaltime = 0;
-
-	ret = update_hw_cntrs(gpu, ncntrs, cntrs);
-
-out:
-	spin_unlock_irqrestore(&gpu->perf_lock, flags);
-
-	return ret;
-}
-
 /*
  * Cmdstream submission/retirement:
  */
@@ -899,7 +801,6 @@ void msm_gpu_retire(struct msm_gpu *gpu)
 		msm_update_fence(gpu->rb[i]->fctx, gpu->rb[i]->memptrs->fence);
 
 	kthread_queue_work(gpu->worker, &gpu->retire_work);
-	update_sw_cntrs(gpu);
 }
 
 /* add bo's to gpu's ring, and kick gpu: */
@@ -916,8 +817,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	submit->seqno = submit->hw_fence->seqno;
 
-	update_sw_cntrs(gpu);
-
 	/*
 	 * ring->submits holds a ref to the submit, to deal with the case
 	 * that a submit completes before msm_ioctl_gem_submit() returns.
@@ -1009,9 +908,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	void *memptrs;
 	uint64_t memptrs_iova;
 
-	if (WARN_ON(gpu->num_perfcntrs > ARRAY_SIZE(gpu->last_cntrs)))
-		gpu->num_perfcntrs = ARRAY_SIZE(gpu->last_cntrs);
-
 	gpu->dev = drm;
 	gpu->funcs = funcs;
 	gpu->name = name;
@@ -1043,9 +939,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
 
-	spin_lock_init(&gpu->perf_lock);
-
-
 	/* Map registers: */
 	gpu->mmio = msm_ioremap(pdev, config->ioname);
 	if (IS_ERR(gpu->mmio)) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 07abbe33d992..78e1478669be 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -22,7 +22,6 @@
 
 struct msm_gem_submit;
 struct msm_gem_vm_log_entry;
-struct msm_gpu_perfcntr;
 struct msm_gpu_state;
 struct msm_context;
 
@@ -168,18 +167,6 @@ struct msm_gpu {
 
 	struct adreno_smmu_priv adreno_smmu;
 
-	/* performance counters (hw & sw): */
-	spinlock_t perf_lock;
-	bool perfcntr_active;
-	struct {
-		bool active;
-		ktime_t time;
-	} last_sample;
-	uint32_t totaltime, activetime;    /* sw counters */
-	uint32_t last_cntrs[5];            /* hw counters */
-	const struct msm_gpu_perfcntr *perfcntrs;
-	uint32_t num_perfcntrs;
-
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
 
@@ -320,19 +307,6 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
 	return false;
 }
 
-/* Perf-Counters:
- * The select_reg and select_val are just there for the benefit of the child
- * class that actually enables the perf counter..  but msm_gpu base class
- * will handle sampling/displaying the counters.
- */
-
-struct msm_gpu_perfcntr {
-	uint32_t select_reg;
-	uint32_t sample_reg;
-	uint32_t select_val;
-	const char *name;
-};
-
 /*
  * The number of priority levels provided by drm gpu scheduler.  The
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
@@ -689,11 +663,6 @@ void msm_devfreq_idle(struct msm_gpu *gpu);
 
 int msm_gpu_hw_init(struct msm_gpu *gpu);
 
-void msm_gpu_perfcntr_start(struct msm_gpu *gpu);
-void msm_gpu_perfcntr_stop(struct msm_gpu *gpu);
-int msm_gpu_perfcntr_sample(struct msm_gpu *gpu, uint32_t *activetime,
-		uint32_t *totaltime, uint32_t ncntrs, uint32_t *cntrs);
-
 void msm_gpu_retire(struct msm_gpu *gpu);
 void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
 void msm_gpu_sysrq_kill(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.c
deleted file mode 100644
index 7768bde6745f..000000000000
--- a/drivers/gpu/drm/msm/msm_perf.c
+++ /dev/null
@@ -1,235 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2013 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-/* For profiling, userspace can:
- *
- *   tail -f /sys/kernel/debug/dri/<minor>/gpu
- *
- * This will enable performance counters/profiling to track the busy time
- * and any gpu specific performance counters that are supported.
- */
-
-#ifdef CONFIG_DEBUG_FS
-
-#include <linux/debugfs.h>
-#include <linux/uaccess.h>
-
-#include <drm/drm_file.h>
-
-#include "msm_drv.h"
-#include "msm_gpu.h"
-
-struct msm_perf_state {
-	struct drm_device *dev;
-
-	bool open;
-	int cnt;
-	struct mutex read_lock;
-
-	char buf[256];
-	int buftot, bufpos;
-
-	unsigned long next_jiffies;
-};
-
-#define SAMPLE_TIME (HZ/4)
-
-/* wait for next sample time: */
-static int wait_sample(struct msm_perf_state *perf)
-{
-	unsigned long start_jiffies = jiffies;
-
-	if (time_after(perf->next_jiffies, start_jiffies)) {
-		unsigned long remaining_jiffies =
-			perf->next_jiffies - start_jiffies;
-		int ret = schedule_timeout_interruptible(remaining_jiffies);
-		if (ret > 0) {
-			/* interrupted */
-			return -ERESTARTSYS;
-		}
-	}
-	perf->next_jiffies += SAMPLE_TIME;
-	return 0;
-}
-
-static int refill_buf(struct msm_perf_state *perf)
-{
-	struct msm_drm_private *priv = perf->dev->dev_private;
-	struct msm_gpu *gpu = priv->gpu;
-	char *ptr = perf->buf;
-	int rem = sizeof(perf->buf);
-	int i, n;
-
-	if ((perf->cnt++ % 32) == 0) {
-		/* Header line: */
-		n = scnprintf(ptr, rem, "%%BUSY");
-		ptr += n;
-		rem -= n;
-
-		for (i = 0; i < gpu->num_perfcntrs; i++) {
-			const struct msm_gpu_perfcntr *perfcntr = &gpu->perfcntrs[i];
-			n = scnprintf(ptr, rem, "\t%s", perfcntr->name);
-			ptr += n;
-			rem -= n;
-		}
-	} else {
-		/* Sample line: */
-		uint32_t activetime = 0, totaltime = 0;
-		uint32_t cntrs[5];
-		uint32_t val;
-		int ret;
-
-		/* sleep until next sample time: */
-		ret = wait_sample(perf);
-		if (ret)
-			return ret;
-
-		ret = msm_gpu_perfcntr_sample(gpu, &activetime, &totaltime,
-				ARRAY_SIZE(cntrs), cntrs);
-		if (ret < 0)
-			return ret;
-
-		val = totaltime ? 1000 * activetime / totaltime : 0;
-		n = scnprintf(ptr, rem, "%3d.%d%%", val / 10, val % 10);
-		ptr += n;
-		rem -= n;
-
-		for (i = 0; i < ret; i++) {
-			/* cycle counters (I think).. convert to MHz.. */
-			val = cntrs[i] / 10000;
-			n = scnprintf(ptr, rem, "\t%5d.%02d",
-					val / 100, val % 100);
-			ptr += n;
-			rem -= n;
-		}
-	}
-
-	n = scnprintf(ptr, rem, "\n");
-	ptr += n;
-	rem -= n;
-
-	perf->bufpos = 0;
-	perf->buftot = ptr - perf->buf;
-
-	return 0;
-}
-
-static ssize_t perf_read(struct file *file, char __user *buf,
-		size_t sz, loff_t *ppos)
-{
-	struct msm_perf_state *perf = file->private_data;
-	int n = 0, ret = 0;
-
-	mutex_lock(&perf->read_lock);
-
-	if (perf->bufpos >= perf->buftot) {
-		ret = refill_buf(perf);
-		if (ret)
-			goto out;
-	}
-
-	n = min((int)sz, perf->buftot - perf->bufpos);
-	if (copy_to_user(buf, &perf->buf[perf->bufpos], n)) {
-		ret = -EFAULT;
-		goto out;
-	}
-
-	perf->bufpos += n;
-	*ppos += n;
-
-out:
-	mutex_unlock(&perf->read_lock);
-	if (ret)
-		return ret;
-	return n;
-}
-
-static int perf_open(struct inode *inode, struct file *file)
-{
-	struct msm_perf_state *perf = inode->i_private;
-	struct drm_device *dev = perf->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_gpu *gpu = priv->gpu;
-	int ret = 0;
-
-	if (!gpu)
-		return -ENODEV;
-
-	mutex_lock(&gpu->lock);
-
-	if (perf->open) {
-		ret = -EBUSY;
-		goto out;
-	}
-
-	file->private_data = perf;
-	perf->open = true;
-	perf->cnt = 0;
-	perf->buftot = 0;
-	perf->bufpos = 0;
-	msm_gpu_perfcntr_start(gpu);
-	perf->next_jiffies = jiffies + SAMPLE_TIME;
-
-out:
-	mutex_unlock(&gpu->lock);
-	return ret;
-}
-
-static int perf_release(struct inode *inode, struct file *file)
-{
-	struct msm_perf_state *perf = inode->i_private;
-	struct msm_drm_private *priv = perf->dev->dev_private;
-	msm_gpu_perfcntr_stop(priv->gpu);
-	perf->open = false;
-	return 0;
-}
-
-
-static const struct file_operations perf_debugfs_fops = {
-	.owner = THIS_MODULE,
-	.open = perf_open,
-	.read = perf_read,
-	.release = perf_release,
-};
-
-int msm_perf_debugfs_init(struct drm_minor *minor)
-{
-	struct msm_drm_private *priv = minor->dev->dev_private;
-	struct msm_perf_state *perf;
-
-	/* only create on first minor: */
-	if (priv->perf)
-		return 0;
-
-	perf = kzalloc_obj(*perf);
-	if (!perf)
-		return -ENOMEM;
-
-	perf->dev = minor->dev;
-
-	mutex_init(&perf->read_lock);
-	priv->perf = perf;
-
-	debugfs_create_file("perf", S_IFREG | S_IRUGO, minor->debugfs_root,
-			    perf, &perf_debugfs_fops);
-	return 0;
-}
-
-void msm_perf_debugfs_cleanup(struct msm_drm_private *priv)
-{
-	struct msm_perf_state *perf = priv->perf;
-
-	if (!perf)
-		return;
-
-	priv->perf = NULL;
-
-	mutex_destroy(&perf->read_lock);
-
-	kfree(perf);
-}
-
-#endif
-- 
2.54.0



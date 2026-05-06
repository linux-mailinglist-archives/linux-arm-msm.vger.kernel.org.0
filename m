Return-Path: <linux-arm-msm+bounces-106155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J/sMWF2+2lVbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFFD4DE9FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E14A330028DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0E83F787C;
	Wed,  6 May 2026 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fqxlpo6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W806j+21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362A64A2E0A
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087513; cv=none; b=U2laooZAWhiDZLun/n3U5FE9qljkJNIggHkhgfdoml+V/Di96QIw5zCp5uBvSGCjXX5r4m832ArRS9fiN0osCdOXO0jtxCnHSRFzRvpItaVyB7cHGPmU+Z8ptjxsWLc6aPoEI26ZHO9lLp5CkSug6eAQGpxAGDkTITCwY3JK75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087513; c=relaxed/simple;
	bh=/M+/a+r12QHfMgCf8JxpMAyb7h2f6oH3taybG+TRobU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iy/ZSdIJcjxmC5ZlS3jagbIKPaZh3iX1idS/AxCkZxh6pZoEAoFR6G9P8eXn+W1n4e29aKIahfcAZch/1EV8somTxYvdyyd9fYAOdNxipt+uppipk7H39xszQl5ZwrrJ/Yc3XgzMlCYP6AzDgf3zJfaf50tGtTV3q7m5NKodlso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fqxlpo6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W806j+21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646BECdW2581411
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nqMgdImuqVd
	SMyG9e22SagxNDTmMY+hSgwvw/8tybbo=; b=Fqxlpo6yVEn/sg7/fGeNvconcXW
	5r9tO+NFuhTEnHLF1OIoZ4Dl70JCAfJ2RU+EPnGEZFGA3SaCp3ET7f/HaN+PRc/g
	CM+l8kOF3BrFIIqct/L3fxT6ErSPN4FRv1KOYYmKcniJlrJBTWlfpGXrH9mMruBw
	GUbxVJ/JtYim99sQsKmtkJfMOuD/Jwj7z+lgBnprULgQ2D08q9OqhUeB6ZsFcOWH
	E7XXz47zIEMM/bajsXzuK/R7R3+YATs+lXnozAfP/BdCFfn6Eub0ZPPrxBcGYhvH
	SjbwvLpqgYMRO/PDPApCV3q0Y6V2MKeUMnh591o8xFM537yH4jL7/9QrIDw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyyvw2mwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:11:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3653638874cso4422291a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087504; x=1778692304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqMgdImuqVdSMyG9e22SagxNDTmMY+hSgwvw/8tybbo=;
        b=W806j+21K2geoP1DQe8Bu0PUUpKNj88688i7JL5Zmm02KyYw2rm9D5PeQp1rbV/bnJ
         bCiqPqHaslZlWSmGJXcw9pqK2Z9b4m+faghh0TvH7BMpECCzsVWeQp5fx+YUIjcpIBpq
         A/NoCM84qES9896lShd7Pg8T9Rsrmn8yX3Zi06LbznofI/wdHjfCQO5OrqUPSj0vCEuF
         bDk4sHQOB8OJ1VoFhr4duqZzU16rOWfy8bWQU5P6W2IP9VypPNg1Y1rw+SYNY9QMCx3w
         3wyzXYBGctcQNfOiIM0N0t/dZpdLtB+EH8Cd98uW/wTMxTCG1AJ+4KtW6GTAFLvjaF2v
         2q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087504; x=1778692304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nqMgdImuqVdSMyG9e22SagxNDTmMY+hSgwvw/8tybbo=;
        b=HZk7si+D58cgjFifs1mKk782LkFhGKDeBtPuGHvnByP0snlqX//jCpB9hghn16KG4n
         uBHycwoAJ8IIbbQvkCYTVCjqJImfZxXJxN0AnY7WmWnZfbh9Zin59TuCYFmwaACkKjxN
         ytt/0H16jaP6LuBg2jK/cF/6Q4/oHfyIpIOw5JYFdRXi6e2+kvIBODJwDOrfEi4hysvY
         aKlKH2Zs/VR4zd1gE/LwHUvvjEoZsUBwmiEqfCL+mMhZUpC90GOYkmBaQEgl9CNxdzbM
         5MpzCO3QvQM5t6tQa8ZD3WR4aFDtxb6+xOZ6jiwk9Jxt7FgQ4nZhmrn1ps5cbSjq56Ew
         dNDA==
X-Gm-Message-State: AOJu0YwdR4Sc1WTlXLIYgZVr8F1nCLnppGiKrHjhcIy2ygafjC5TzFG3
	6+yn4NpPW8a6rhTmbRKoddjJEVxfjL1O0WjdPyXKSvVucAejCvyQn9q7Y/5MJg4CufMZegHlhxS
	x/B6YbGADE/cP9HRl30CMeWRcSGRA3cRcecBkRnWm7IX6ihD2HA6MjyG06Lhb+yaIL7OS
X-Gm-Gg: AeBDievoPS9ghKG43ZiqNYuTZlIj5Ixz8MMnfDmqn5sHUK0QVbTVVgQ8FD81A+sjgXe
	ntnKXwu4oKgFamVXKn1VvHDlfCiL1TQW0opcqgryVbhs9hKeMOc0XA4aUQ3qQqY0DdWGiTfNx6/
	vWU3lbxAeaj4qLBaQGXS7+bz+Szy8t1qlrAd6Tcbf2eqZWsMhla/roZcyJuNbLCBCx7bivGEOYL
	BjMJsarag4Fy5joM1OPnfcuDvtMyShs0U6yinBOulsLy1UPOohZoD5g1Wzc62Ni9gGRIiSPicwC
	/1IdhowLelvROV8NmOLuEdcC6WLzRje59EbdIKCR5ZE8+GNKqP3hU7PljqawxVR8IOnhpSgXCVO
	X9EEKjetfce0UP1oIbI9jvYdRYAK4GmMVx6T0YnNYLKQ=
X-Received: by 2002:a17:90b:4fcd:b0:35f:b6d3:da7a with SMTP id 98e67ed59e1d1-365abe8a3f2mr4564389a91.15.1778087503425;
        Wed, 06 May 2026 10:11:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4fcd:b0:35f:b6d3:da7a with SMTP id 98e67ed59e1d1-365abe8a3f2mr4564333a91.15.1778087502882;
        Wed, 06 May 2026 10:11:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4cba340sm4012303a91.17.2026.05.06.10.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:11:42 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 01/16] drm/msm: Remove obsolete perf infrastructure
Date: Wed,  6 May 2026 10:10:25 -0700
Message-ID: <20260506171127.133572-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
References: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYCNIQRf c=1 sm=1 tr=0 ts=69fb7650 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=istQItjhLDCz62CzcYoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfX0lXJ4FJxRfkC
 tb56fcCmxr7gi539ZrIzOw2kR6JJIxP9aJdT67EUZsIGOw/uUcl61swT749BscxRztqt8QBrovZ
 cJ8WoPY2nRtN1XSVb0zA4TkuZpfH4iCfaN8YJnui4L3qrHM5gTTPUZ1Mow0Jc9I1fqml6db36AA
 tT4mJvNAxyfJeXWGGdp8Dc0i27Je3zOumvx8XcedxLKH++ayd7xgivFMIDol0IARZ2uZTUlt0qR
 9C4dqBCS9HwbEnnMTSrWTCKIIl3ZNDZtn8auUq77AIGAj4vovcg+2ciT1nfuiiAmSOll8cUU9ZQ
 N5i71CK5la+ehNhmpBipEw73w12ULIJfeP0fdrwBiVgOBlfnsBCvOB7dM3hWHe7xDjMlq5o/GJI
 rV5+ViGcGiSrTeY7L5H72CJdGwLNe5HZylvVilV/eRtSdSaECYB4NNACUxcyEIK53OwL/rtcGRc
 pKuz6V1kFWkVGozEyBA==
X-Proofpoint-ORIG-GUID: h1kp_ZQEqbq6hkiRAhbn8PjoMasnwyIj
X-Proofpoint-GUID: h1kp_ZQEqbq6hkiRAhbn8PjoMasnwyIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060168
X-Rspamd-Queue-Id: CCFFD4DE9FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106155-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Outside of a3xx, this was never really used.  And it low-key gets in the
way of the new perfcntr support (or at least it is confusing to have two
things called "perf").  So lets remove it.

This drops the "perf" debugfs file.  But these days, nvtop is a better
option.  (Plus perfetto for newer gens.)

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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



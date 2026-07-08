Return-Path: <linux-arm-msm+bounces-117781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id At19E0iLTmp8PAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:39:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA272949E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:39:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MQascg2Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OO6oVCpx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117781-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117781-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A52130D6647
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 17:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4124C0427;
	Wed,  8 Jul 2026 17:34:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070CB4C040F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 17:34:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532081; cv=none; b=O84LMJ9qAc/FBNMcQNp/p/IfqkWiICbSkOYWqeNmT2HnIXffTArJkQLfsBJNS2nz8HXvYj9gY+EQ4EgSVnW/Xp0FTIRs4kMgBCmykYPn98ZbpaR9N/KviQMFFPdil4oNdx/3RYUzchE5ipbQyq4EeABSUuNDaA8W5fshMxMRm9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532081; c=relaxed/simple;
	bh=2p5x9/agcrww/2CnFOxfT2Jfqi0IRk/KULI//snGIzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWv2b2VNmGdx7DS0hNjfW1+G00z6uEM7skwcM63Hq9D3se8JLYWuzB3einJOVOg4cdzJf6vqk9L5G/2MZ+E8JlJ+TIi8Y5vQgwUKyBdsmXRzJvuyUcXoYew34lThWD1OUqKzzT7D1AYpHfnTv6UnBzqMRUgd0UsVxKQ9PsOoWNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQascg2Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OO6oVCpx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GL4Nr3347340
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 17:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F2lLFVQBkCP
	nTnJ/UWIANHD/oq/CxWFvXtTUGL+m60Q=; b=MQascg2ZVBCkz2MZGg7FtMDgJ1B
	87BiOgr3V9ujZIsNHjPQsRyI4LMd+VdMBgTzr8YKwc8sw+SNY3bljU5pMzKKtbIv
	63JOTk7xaS+3XmregnEGcwOaoekNMPUE4hYVI4G/DTNUsTY4GQ3BCI+bywDvSDjR
	rLbMVsuo2XYZcKRHo/mSImoyZTWpSwChzHQ25q0wznPaMu7CHhydZOvENwqRBHop
	boYK1blOVuw4VtHkRtbNd5XarWswMf0hOXsVxpG/jdKAyzXY3tsMWFx2XMGG7GAh
	yP+izT2eiYnRvIf/DoZ5T8i/926wCgyVxv5evere+pu/J5VzT2mz1m/tvhw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqs8d51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 17:34:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccafc5e82cso12925235ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783532076; x=1784136876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2lLFVQBkCPnTnJ/UWIANHD/oq/CxWFvXtTUGL+m60Q=;
        b=OO6oVCpxXylIegoDB2ZCq3G99AjYKoGWY/mWPJ3mbZmJ4htpGC67zOCiB4t95bkBtu
         KLLvNtrmrQu6PEuFVfwHfXgE+uoV5WSMEcavojk0QYvwqzNks1Atms3h9wxHNFMlXdjt
         N0VkXq727VWT0NEbJrvIc8c3+zxiEiZPfnN3Vhmu8MuHf8LMpudaHZP7jquvhUVrspsC
         7LrdZdeX90Kk0PODs76WJyI6dlNpigoNGBqXbdl5QF1DxVbh+b6Fbx53PSIplVA7eCci
         NDUr/mPz8dPpsNtmgkTUCkNlV5F1UfUQd/8FcW+uA81A0mx3LkFmdjqe3o6WOnCJZ1JG
         eUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783532076; x=1784136876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F2lLFVQBkCPnTnJ/UWIANHD/oq/CxWFvXtTUGL+m60Q=;
        b=USaPXc2lbJgdzlWizMn1mFFxxnhsB14eceFxeaWgyqU1Y/AvPjUH2Fsx3H5ubxEBwz
         sYHyW6ITlsESFe4NCXMBGcJKuoyr81zEUfMOo/+M6sXISZ2H5UyXwHx9siBkb2E1g4v7
         T2B4TvNhpEhFxM5QDCvBRUNP4Jdpc+tPd+CeycHd1IDVwe61XfoYVFb+sPqAiSe9Vjph
         qCOPQaR/BFtNRutKBEsNALL2PAPlUTIrwFYne4WdDYh5lpI63qIJTMxB1XDaXe38be5R
         5jArPhnuHKKp6VTI5mQBKcw3+s3ZDB/X84cUrQA+q5AZf/ycHzbIgNjoiPdbYtOsE33p
         /uOQ==
X-Gm-Message-State: AOJu0YwGM0hvKqJnB6kLbzkYY3mpF3k1COaQ58vhC9tD0t/DGvAak3CC
	SAqSFeAVbPWYPZEoxW6gge656xXFAhmo2MxydCTw+wFObzon1rWep9OSLhJN6lxfFybotEXB/cy
	eJ9VKPaYZe4+QrW/jqsqS0HMnxVUeRw13mCz/kLrrmDzYb+8MZE5C4aNDUBbNEhUVOZsQ
X-Gm-Gg: AfdE7ckxla6s26+Afr89DbmZxu0t08Lbb9eKgvzVTlNh1CpVl5D+yi91rFe3es6Xdkk
	IlIm/ceStiVvq0Bfk+3ZAg0YztodpenkZQLjm97Lb/nX83ipWOkCXeA3FYS65vzB/kpHZk5Y4mJ
	paTHpL9pWkKdlYui7pkpGX8O19eYPXyNJYH5W+58+wN4ZIE9GcuQY5rwb1+XFdr8RXHH4vFWCJs
	RaHw2EsGz0mreV5Us9uqnhpBGyQ/U+2A40JH5E8Pk6rC/t4wJtGDBQfF5ePte5tGoDDAXZCB9HU
	25CbpAAoTfys1q6jB1kfRe6tUj6ul7aD2Xuh+2m/mBOhqOXrlF/114xdTraN1T/qr8NmLf5MpVW
	snzDrhhVT3sDOPvBP5fi9bDSh1tzwlnfLnqAFAs/uk6WLdqw3DFut+RwvQQ==
X-Received: by 2002:a17:902:f685:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2ccea40b669mr33698075ad.22.1783532075697;
        Wed, 08 Jul 2026 10:34:35 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2ccea40b669mr33697755ad.22.1783532075114;
        Wed, 08 Jul 2026 10:34:35 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfb7aesm31438345ad.29.2026.07.08.10.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:34:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 3/6] drm/msm: Validate lazy VM is created in GEM_SUBMIT
Date: Wed,  8 Jul 2026 10:33:51 -0700
Message-ID: <20260708173356.578713-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX4sErqE33LpYf
 rUNu5J7TMqAiABZthMMnCryNHFrEu89UeemFnit7iVCNqa5AxPviCr6Z3DijAgyrYlxt+Ny1MOQ
 HcORnTNCx6vK+SChgdtQVUvnnZzNKt4=
X-Proofpoint-GUID: vjYFDE3qdNXTr9UbfIiEC51-y8uLNf9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX3ILoSGQNqjyj
 6X3lkXWjnE1E+/josHsfjjMBG8Hy3T4CqDjzG0bVHvPBJ7WANcTVT/B96pz8UmNCr6vhx10mpfk
 MfkHiYotxPfssC6CTWbj7HHaF24a4S+oOs6f4Vk53EQx/JD5s3HR4OqEfrsGKjS4KsiF+F/Q3yN
 1s1WEWh3dJr8/8H3Zr8O4R0Z5sgZaV5viZ3b5Zu0y/WBfHY6N9mdp0J0+o5LlSBdewv679uelAv
 IcN6byaSKN/LmWMw03MWSiy02b7cO5U/vUo4IsKP+5DzaYKQPD0/9w7qwB5OBsFPikobP3KFtDN
 7aXrXY5W5nbk0CgJUMUk9x0/EftJ0CXWhSJFwuaGlXwK9hAEG5BDLlQNDzUpijtKkPXxQn1IQSo
 WQ/O7wRQBw8kvug143XwrSA8LOOvZVBAGoB1fRvYiBp1GvHlA3m9leQtpOlaPWyK9kQIH2aQH6l
 Sg98T+xPrZ2yte8ZI/Q==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4e8a2c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZH_LIYEqPuu6AAuj7cUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: vjYFDE3qdNXTr9UbfIiEC51-y8uLNf9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080172
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
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-117781-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:sashiko-bot@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: E2CA272949E

Otherwise a GEM_SUBMIT ioctl before any BOs are mapped could cause a
NPE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3c6bc90c3d48..56929e821200 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -30,7 +30,7 @@
  */
 
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
-		struct msm_gpu *gpu,
+		struct msm_gpu *gpu, struct drm_gpuvm *vm,
 		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
 		uint32_t nr_cmds, u64 drm_client_id)
 {
@@ -66,7 +66,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
-	submit->vm = msm_context_vm(dev, queue->ctx);
+	submit->vm = vm;
 	submit->gpu = gpu;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
@@ -554,6 +554,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
@@ -572,7 +573,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (to_msm_vm(ctx->vm)->unusable)
+	if (vm && to_msm_vm(vm)->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
 	/* for now, we just have 3d pipe.. eventually this would need to
@@ -609,7 +610,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds,
+	submit = submit_create(dev, gpu, vm, queue, args->nr_bos, args->nr_cmds,
 			       file->client_id);
 	if (IS_ERR(submit)) {
 		ret = PTR_ERR(submit);
-- 
2.55.0



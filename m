Return-Path: <linux-arm-msm+bounces-117779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YUDWKfSKTmpcPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:37:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE672948D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:37:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=J1UjfpTv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iKmhvKvN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117779-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117779-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4550530A06EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 17:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2054C0419;
	Wed,  8 Jul 2026 17:34:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF64C6EF8
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 17:34:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532076; cv=none; b=LJKXgBpotDBG6BFWBe9i2Gx6/dZNICkk2POH63XBGiRtcNfQKmQK5tfLqRfo3R2OgacsfZlT0XxqgNbjg0zIkUSm5Pyu1bq4QAgCvli7FedzIanCN27W5R5U4IeICExAW8Fbqy8HDUHB3IKnoLlmgLVbFXU4RnYxQ3LjvR47h1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532076; c=relaxed/simple;
	bh=GxVogIMhu1mzW4YRsiI52i5vAv+yBYbcef61tqhGQOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTKLFMkxsidQpZiv+hRg4OuEILm1cmdyK98igvYiJPBLhhRww5Qfgw1cESmM/ghpLtZi66pc6iUGB+rfWzjgtWBgsUZgg5v8mNPErc8D1q1ie7/WdmWD+Uo/q644Ypk1jRoji+ZmqVYMkHlRGAEWQtp+vKSkhj/vq5UvGcdOfMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1UjfpTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iKmhvKvN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLMSZ3170768
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 17:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YHzHGsRPIUG
	VAMOUo6qKw+18SGmm5iq6ipy2Wi/zZYE=; b=J1UjfpTvutthxNKGybDQMylMX0+
	bWW/hswSmLHfwZJIqwbYZ4iljIWp1jCoQ3Nuq8EKbMFGxLfO5NJu9LaVDILEzF6A
	68YDRp+wkPropf0aEmWV4o4gnrOlx2t1iVOXRAPwMezV6fpVLSr4oqXTDep09T7t
	oCdTuskuLeBGcc8tJMWiZ8Xd6nBJ8HzxkM0rE83WzyMeRpFtLx1vaaY1YVUSffBN
	q1Av5LM0CZv45GjzcGtnt46ksJq9VmPZVDLMalLfNfa/GJzHLXAWHL7+GzTuena5
	O8QFDz/cjPNgSGMuDkjSVEnN+dCiKKfjfY9C0BgqOfQt7phipMjUhjbnh5w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gc2md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 17:34:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso9552085ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783532073; x=1784136873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHzHGsRPIUGVAMOUo6qKw+18SGmm5iq6ipy2Wi/zZYE=;
        b=iKmhvKvNEtqD5HzAGJnEAAh5Nga7Aemx1Y9yBCFti+D08KNsJYE07R73lj+8WWZov9
         ds4m4ZotXfCghkWyoJ0yKm6/maYnKV1aPGigthJw/bW/CQ+86KWZMZ6jNuuXj/MhNsI6
         1vq4/fgp317u/GSmR3DY1c78Q2bsitf21zpZp04cML1fOInuGjf/Bjd7KHUvHQos1o6O
         LiMujBNlW3wVdzImr0rlLs9uWxTtK6WmEvQ+8GdIio8XY2AnaTkwY6z2GqmGIMGtRHi7
         qoEZvfl/KVgRRDP6vlpyB/3ShxS5J1uz3yO+xyqR+XCLCQmOp3RC7WuTWUKf7GfvfAnL
         rI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783532073; x=1784136873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHzHGsRPIUGVAMOUo6qKw+18SGmm5iq6ipy2Wi/zZYE=;
        b=NbsivHMXk6deIOpMugac8izl8agdpmblxqtL1wZrp58KrEW3RquiewaC2TX4RlLhVH
         u55O5Rd4f+8dLZJvVUPqy7RmCKuBbKey7S1XdcOqzZyCrJ+zvdmgPwdwC5hNnPm+t1vx
         72h0zGLuK5NcKTNwf8q9quN4RqJRIfiBKU8S2wO/X+v4h8qK19L+hAwGn9h2/O2B8ZHy
         rJyPh1szjYdYJ2HNg4UdjpR0ouX/oYlxI7ACGeQUrIKJVrY3aBEGqkhOYXw94aoCM7j9
         wnTW2hvz9QYGQg8Zb0YFbV0Jur0hHJ0XhF6YjHZFVYcnUiIJNof8lYXYZFv7hwmr2Lk8
         5LnQ==
X-Gm-Message-State: AOJu0YwmLOyKr1Dtb0WkJXUfKvP+O1rVkTKISjGRXjPDSTXVmK7LFGiY
	Yy7Y2rjSwQbtj4haiZvBZdXNkegSv2OSH8nFwkMdwMa5MWCwQQSgNQtWdQEt845gnrHE8N7ryB2
	YA5w/6jBzc0uSj5T0c0UMa2nflNrvZrYMrij5zqmBBDwPnMwJW2beeqJbEiuWOgIU0RiA
X-Gm-Gg: AfdE7clSCH0KMH031+3wtSZI3Kc/2zxNIbY+4L2XanUIa6nkuPsudA5hpDsmexWMAJ4
	8rpuukyvjay8jVyRIT7N3siygrFDq8ZJHcXI7dhrs+ijUNYvSZlInSERiVC15nw2LGoaAT3+WyK
	SV3gCC4d5gFRqeSAJngbedlIRdT9lGiQsN84XAstcryn+2tktabcZRv8bOiO0mxVbZMsk2+27EU
	sEU38RBSLkPTHQ1HPgBcDflhaFYt0IyuphuhbngQ/9JpvUt5oUtukoMDnl8zgN8L4LjdG9cLd1q
	BLaChlxypAoJ0eaLG6B9EPmIdBIOdcWC7izfgUm8g3FG3MnuUmg0RkVQiDah8BIwN1Se86zdqxX
	6/xZg3fdr7IRgTU5uHOeFMJZzFMm3wBdBI4scMO4p502u6e0L/oQt0VoXwQ==
X-Received: by 2002:a17:903:1a2f:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2ccea287d5amr32556545ad.0.1783532073226;
        Wed, 08 Jul 2026 10:34:33 -0700 (PDT)
X-Received: by 2002:a17:903:1a2f:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2ccea287d5amr32556245ad.0.1783532072654;
        Wed, 08 Jul 2026 10:34:32 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb7e9sm32420615ad.10.2026.07.08.10.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:34:32 -0700 (PDT)
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
Subject: [PATCH v4 1/6] drm/msm: Fix barriers accessing ctx vm
Date: Wed,  8 Jul 2026 10:33:49 -0700
Message-ID: <20260708173356.578713-2-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX285B387xV3IW
 E6XQYbY18173Fk75AUN3DQfVQv4GbwlvpiOQn/aNYmm07DPWzb+Y8O2FElEWvRXOETa5dsk5Lhn
 3NWDIlM52Z6hFfoGmqkzhVwf35cFsC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX6yJz989JTKLQ
 a2/HIKdWzoTOLaqcLYfU8EZXKUhQu/KC4pwJPqtkPpyV0D9dvWp6ijiTvZaeFNAuJJB+KOatt1t
 qFE968vfr1l72/kfvojocieSkGl5w6uAdAHow2tTaQvCNDy/R7d7H//8h6xovJybHd3EEuKv5GL
 ihoyu21RZ9SG9i5JlRT4/U+TBgtVjZTJRdZk4djsstMYtQZFCAbjdiXDgPUGD70G2ezjRFLyWJN
 TUTjDSDFPzOwoAwsOopg1loB23KGJ8MDJx3TmGYIGpe9duV5WGnKBLPGynwK3AS5Rz2nnEQEtAq
 O/kAwiUuiC87+zvw5y8WzDvEh+slC4ZkuoV1zIr3JB9nr9w+rPDnH5V5PYtxaEknSi2fciX0ZOo
 xOSiCZ1lpMIx3XrmCq4Jh/w+3eJ+XKpI9HQaIwcjj07AyUPASWoOloV8c4Z+MofjYOBtCUy1jaF
 3S585yK+ZozNeNRTkSQ==
X-Proofpoint-ORIG-GUID: A-5-q6Roo2GrbsLuFRvUNV7dVQHZOpJR
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e8a2a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PXeb_Y4BrUyLDKu8J0IA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: A-5-q6Roo2GrbsLuFRvUNV7dVQHZOpJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080172
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-117779-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CDE672948D

Don't rely on store ordering to protect us from caller seeing a
partially initialized vm.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: feb8ef4636a4 ("drm/msm: Add opt-in for VM_BIND")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 32d5ebea2596..ec88155e0ed7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -224,18 +224,19 @@ struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx
 {
 	static DEFINE_MUTEX(init_lock);
 	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_gpuvm *vm = smp_load_acquire(&ctx->vm);
 
 	/* Once ctx->vm is created it is valid for the lifetime of the context: */
-	if (ctx->vm)
-		return ctx->vm;
+	if (vm)
+		return vm;
+
+	guard(mutex)(&init_lock);
 
-	mutex_lock(&init_lock);
 	if (!ctx->vm) {
-		ctx->vm = msm_gpu_create_private_vm(
+		vm = msm_gpu_create_private_vm(
 			priv->gpu, current, !ctx->userspace_managed_vm);
-
+		smp_store_release(&ctx->vm, vm);
 	}
-	mutex_unlock(&init_lock);
 
 	return ctx->vm;
 }
-- 
2.55.0



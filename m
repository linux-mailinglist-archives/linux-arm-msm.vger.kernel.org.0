Return-Path: <linux-arm-msm+bounces-117784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DsBiDnSLTmqLPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:40:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D6C7294B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:40:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RGh5PJqY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j97Uy2Ip;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117784-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117784-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E7EB30F5805
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 17:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894304C77C3;
	Wed,  8 Jul 2026 17:34:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14644C6F16
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 17:34:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532083; cv=none; b=hUMseFdT3nCFUmlNYIUQovwJ6UxuHeYpJk+uzeiVIYr4tA0bqCIzleSVtRb4K3OOYFdwCUTDhgohJ8lDzf1bkIMHi4joZirAe8kUqIyqzvhIsgsDU2NFF3fEtWqc6PMszjmfzIMcaz+B6YcXIHVDsQBrVGemURa8e05+WfBjWFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532083; c=relaxed/simple;
	bh=BCZ9gxEtHbFunXcuEn1RP6YpAHiMBUKxnhNwFVlf8Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/MtRxXHqsSkD5kjmOBfzSpgKAlHV0UQXlqQmiRPNlqTyHQh4sMw/zgDXGjIpmwV/E66iHEuPGb8JJV0zRg/XS695Upzm4fIcMdATxYdYWrCWs+9146kfYzDsvWhrRS1K8R+rxSwcGDcQshp5p4EpDE9yRBNb+PBdBfZATm/SKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGh5PJqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j97Uy2Ip; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLIkI3170652
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 17:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jO+ZQEMTAut
	fU7hx9qwLY9HF5Xgg9vMbG+XmEcF/E20=; b=RGh5PJqY0fPWIzSS7aHw7yBNWx2
	KKAQNxvzc9bKgQp7jj8Gu4K4mkBll4qgEg7aN9dQcubR4UvyUvnXKVuDwW/ESqMG
	O2fpFdg4zh0HmD/S/2Pcr2nnC0YdnG5ZS8HoDTMmkX8kqRdpovUkp99NcS0RmqeI
	pceqwJILItb98ZuZg9dzPDZABW7rhwhq95vPGdVaWkx/G0U6hXccldTouuJCM29w
	L9F96MjjAFWWGQGHUSefZqlIlhIfESDgDfKaPa2dFjtudpmn/e02mtcrFvaqBLZ6
	PtRSlWUijYdnnvC+iiQM2VDhEfFdIMsQc6PNCNJuy/fZuZOwsBiPVWDnkRA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gc2n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 17:34:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce870a060so608585ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783532080; x=1784136880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jO+ZQEMTAutfU7hx9qwLY9HF5Xgg9vMbG+XmEcF/E20=;
        b=j97Uy2IpsFJ0y+ox+N11P5XpD2giK6rGplrqpt0u4zZQHvfJOfnYg35YBpl074bbju
         gwwrQQVmA9xRB5p15DMsR8WPlea0Qdr5rkA1s1N5e2u+U6W3vLHrgazPHlH440PjsD5s
         jJ7/XXbQeVOThQca4w/PMUwBd2opQcukAtP9AyhZNWu0VzIWqH6fRRvqJdReCWsnFDdg
         OMcIaiGqDYPTTrDe/7z7p+S22hpDYm3ZJxvdodSuPKsuJsry313CXH9fB5k1QFhGNu91
         tNGVI5JJUgIR3UP2q1+3h+UebNFcWiCYIkJKgmMh2XLIdjvkTEJpfAkvHT7P+F1FG/KU
         oNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783532080; x=1784136880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jO+ZQEMTAutfU7hx9qwLY9HF5Xgg9vMbG+XmEcF/E20=;
        b=pc0e+XjaXuTRxcUkyoJewl2RTYlOH6MnSFqXE9DYUCPNh1/utmlpAcPmYzrITbKktT
         mIQgHPgo/kmib4Ob+gW+KRCOyQ7ntg0PAPhvF2N7ybFauE/oMkifUsJLvxsV58l0a1+R
         uVTkzxjV0qMcvR3SJVLIa9WsYzZlIvMEuBiunzaS3bQJ9uWTuZSi9bSGai6RKnKjdAvj
         9b8qweTuDi8WCOquUhN/FiJLl7T+tfgwldwRW7fiVT5PsMZPxXUCFHh0L9I3eGGgVQWc
         uTw0ivFxPR1+9Nquz5LGBcGpGbp+AhGhS53QmOF2/nUPjunUncmXTYjNYX6PjAyyi6PK
         SufQ==
X-Gm-Message-State: AOJu0YwwGHaxjrHl4WqiwL2R0rp9crjc/vFG1hw6Q+slNQClUEsOgKdK
	wMano02g0/r8TbxihQjbMPGewLtmSP03AoQrcV+dGx+r+ftXGDYzkboPOgZG2UIsJgP8rTe5aQy
	69IrMf0bBhephh00VyWBZzGq5+9MXCeNiep+8OqqJ5KP2O4s+uc20rnGNwoJiZajyu5KeXOmhhz
	AO
X-Gm-Gg: AfdE7cmWD8PDnFjzihXcLsiVamTpmc33eqFDsN+u33PHrOiOoiXZ2xL6MzuQLKuXq0Y
	JbVT0sR43bp2ONh8Avsax8TwRYVWAye5Y2kmVV+2AQs3XtX1XauxcdfmII1oxlijvtfJAaJZowX
	clSyVvRWrQGDX4rx5zCjqn+uwy811KwbGjTreTpQtrFRjrwuBvveSEBCLWEzw+jEBNEZ/JndjDt
	3DXYEdBM5BYE1G8eduOrdKHjBvcEVAc5jXO0nJzAT0Qk8DvvChB3RV6Q61fy7CtW+rkSdlfuSMT
	qAKZYxytgQUk3IsjIXjy7myh/0Pbxkn9FuhmSEwyxhutdJWF6Dc6IuUMMbWJnvpK28mDcCmtS/0
	W1RqGrG14YBSG9EQFxYQkKOOpg1DYe7wnUlpJP2YUNPElBcaimNIjvCqwpw==
X-Received: by 2002:a17:90b:1c0f:b0:381:18c3:1b99 with SMTP id 98e67ed59e1d1-38941205917mr4211069a91.23.1783532079721;
        Wed, 08 Jul 2026 10:34:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0f:b0:381:18c3:1b99 with SMTP id 98e67ed59e1d1-38941205917mr4211039a91.23.1783532079282;
        Wed, 08 Jul 2026 10:34:39 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38903295585sm938106a91.2.2026.07.08.10.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:34:38 -0700 (PDT)
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
Subject: [PATCH v4 6/6] drm/msm: Remove invalid overflow check
Date: Wed,  8 Jul 2026 10:33:54 -0700
Message-ID: <20260708173356.578713-7-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX1c+sUVweYHJ8
 oQbCLQc+w5VTiffqilj7s7KzGetEiYUQsPG6o02FCbqNZKScSSqZiijs4+K8YsDmqnna5ow50Df
 3jUkfeP52cQu3yaWsy7N1CwvQZxpBG8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX3d2QuDOQF317
 v7OdYjiJ0wv+ZLI7jfKXQQt3dU2SWjmG75NVEAOl+jf6wx4P0Iu8c8+70VORTcxnfdURh5IgnPU
 5CqBzHLhSg8jR8vEDVExsC5sYKFPJg461D2iyN/FTzLyyxZlMr02gf2/Qczg1Gsbn8sXaw7lpBp
 PwuNuLjQoKXcyemjjEJ/59QNXH9iKKerg+jdFC3p17nLB/qx2H58770mYopyQ7tOd4Ulx8c+dA2
 MPS/9BDZfT/GQ6QaG4egyWVYoPD66y+A72zR6Wz8fU0xolG8fXt96LkGbSe4Oc4CETMXOLC8P01
 l3V8N86wNEeLVFmqNJmqhcM9aL1Y9vjMsRF2T4/tMWW9TY83VT5W6y653zLmUOlKxqbDwhmaCnJ
 NWx1tZ9uanVa2ZfOhR54BYlY5LT9Pn7dhdJoYEU91kgqR9FIc6jy5XGJwelr9mqxLDPh7yvsWbu
 KoswpNgCqEmb0RXy1zQ==
X-Proofpoint-ORIG-GUID: cLvkV7PVFwB1qv0XyjokMi1fN7ZMTk1x
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e8a30 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0g9OVxrcTuodNeR8YWUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cLvkV7PVFwB1qv0XyjokMi1fN7ZMTk1x
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
	TAGGED_FROM(0.00)[bounces-117784-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 91D6C7294B4

On overflow struct_size() would return SIZE_MAX.  But kzalloc() (and
friends) check this already, so we can just remove the check.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 56929e821200..3113faedd04c 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -36,15 +36,11 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 {
 	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_gem_submit *submit;
-	uint64_t sz;
+	size_t sz;
 	int ret;
 
 	sz = struct_size(submit, bos, nr_bos) +
 			((u64)nr_cmds * sizeof(submit->cmd[0]));
-
-	if (sz > SIZE_MAX)
-		return ERR_PTR(-ENOMEM);
-
 	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
 	if (!submit)
 		return ERR_PTR(-ENOMEM);
-- 
2.55.0



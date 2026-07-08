Return-Path: <linux-arm-msm+bounces-117783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sb2qEUiLTmp7PAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:39:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD472949D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:39:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GsFV1zUD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZbVovCZS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117783-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117783-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44BD230D5F82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 17:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3134C6F17;
	Wed,  8 Jul 2026 17:34:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6554A2E02
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 17:34:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532081; cv=none; b=svd6tlnTFsjf7l8lr/4eKHWskLyhm1VA7Vt7dOGw+avKp/BoafpfjeGZjbH7BJuiIsDtCRMekKfOSs/x4qhwqKZur7M6xByNyXyzJyceLiTWUwnAyfdL0KCvmRxK82YJib4QtpxXqzRj/9CZrvj72PGY98T3aX2JYjh5BM2wUdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532081; c=relaxed/simple;
	bh=2JBv2Dx0yN9cj/0vtOJrmtab8cG2Ab/R2H32fmdXzgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCJyow0lCK7wNar9vhPqxhaIRWFQ0JvAf/E6MXyYAMhwaYiit/VeK+2BAHZkrta+ywg9sKVdPrJ87TRrO411W0R2Qqzh4ZznkmNcvL5tDLz8mu2AeQu1kEIK6Lx7QXv7XesW/JxKBzixF4xlnq7EZJV7S5ijqKvi/ea347aCDsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsFV1zUD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbVovCZS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLnpd3312743
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 17:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=il8ffV2n6Of
	1AbVqvM2H1wzaQBsji1DJs+ts5z9fiOs=; b=GsFV1zUD8LoeoHXrsCAOY4Oh3LS
	nL0mOK9f5l3yyJiurMX9MTNThAT1BOTk6sHRzfRniUOiIGMoDjf3XlLoyoyWjMWp
	ziI8bF7rzk4PR6R1kWNHlG+RqIdulaybdD+vbGVUs948XOkpSSCmQgniaTSiMhye
	Xj9godHQfn0Ds5sqc4MzEkrnLneROoKP/PduTaoiIYfAlmkeUNrspWhuPCRkodDz
	8lw1GOqCf28yku/is8aYqwx/RXEQd/8WA/h0/UwQFuZl2CyBCAFqbol1O7nwtRx5
	t/KXSoStrF2lX8+SCoXITbgxk+lCPFupbPAIayyIwapj+D5WTuobRG+LS9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6abxd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 17:34:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc8bde6318so503015ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783532078; x=1784136878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=il8ffV2n6Of1AbVqvM2H1wzaQBsji1DJs+ts5z9fiOs=;
        b=ZbVovCZSIfT1RRRkY2bPNmLNyBWxjXaRDPfIMMqalzCLsy3NxBMmlsdOTFhUjms/R3
         kU3VsJRIGMoVJD6nUP9PjuvgcvUWzq3D69qZ+xCsAbnoVuHNfzx/Ul19OKRlvYHvaGxP
         ulJBsnuZMJkusDmnU5MRIIusO/zkt3YJ1PU+xUIzhmovEdf7QXBdsHnKl5DmKAs5tj7w
         IAt1eNys2zHNXMQqe1EjIXNHe7T6pgWgiiTovZCifVxWBDy3XZE8sFzdWFmXy1K3/yrP
         ih8V+0UAm4Nu1ZqzTu55VDmnzwptxcaaG+9vE77J+u1H81m71o9mWmdtL0FpvhCFh4wk
         KzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783532078; x=1784136878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=il8ffV2n6Of1AbVqvM2H1wzaQBsji1DJs+ts5z9fiOs=;
        b=LfnlER90W2etyH2FFi5n7/QG9MTq8mrdZdcF1OZltEEO6yboVsqYl10cbULntP6ro9
         KU7UsWx8tWsFayqKyIqA2EBWJd7ulSb6tfz15mdhUIZPfZOSKivBmkXi5I+LQHTZE3Sv
         9t9WvFZgmyspZgLuUXjy+/6F3/999l1/PICbx2mId3dMCfGNjmxDoHrB8RzkuOKT4QgX
         Ki2EonJAdnU6KwYJXLc/TDYh4or1FlgXOmKH2eNBkoE4DgynZSeYrbvmknQ8B7bc+M76
         o1u3vi+b2f5a75w3h4Fn+dDntbQgn3yWQdy8Fe6O0nggHAqktopdNQ9QGCsVk9jw4vFr
         aS9g==
X-Gm-Message-State: AOJu0YwSyixHkL9GcEXcdR61vwE7IH7csw98RR9fEDdW3Fb97qRSkeGV
	e7BTpVIpy8334YqGJRbOIV+Z8F+uxRs4eoWULb+B8eEwKmJw7i2tWwK0YAwbyuvypAFD9M84xL2
	rKZ6pfEqRex4d79MYTu3ENhFjtAVRPF7YUk91lR+2RrDpzcMtCrhDM4h3Vb0aZGOYIIxZ
X-Gm-Gg: AfdE7cmzWIre+PIUfuJYSdQAnqZQlVL5JibSz+uWmtqksk0Ww1nhw+pqtf4zKVCRqqG
	fHZL/PeJ5inU37+DEsFDYzCKG8bkCziUWb1WXyCVO/MVxHf4tJ3Mtfzg0t9ywMkf1MC+8NLm8LS
	/oLLSNLI7bLOSJ9JApUUufCGIuqtYBTJgFCK4ixctxj26vdKUcPh/SsfffcIXHneF5yzzkIy2j/
	k9wzzUZtaHxCTmrccExF/ktlbh5g/65IoNZF7Dgb/SsvDRKfeekcY/FwUM0efhT0hkULxpZPX/l
	Yxj906vE89BVfxt71GTjWb1v9gnr1hSJUdkjcha2epTFw9p+Y2w3C0R0Vrn/0Blg0C7xeaXfBJK
	rhMu18KpXISft4P50r8lXONBbT6LRsx6PQcRNnLLqaRUHQK7Mss3ryCwtgg==
X-Received: by 2002:a17:902:f691:b0:2c9:a247:171 with SMTP id d9443c01a7336-2ccea371dcfmr36609345ad.1.1783532078334;
        Wed, 08 Jul 2026 10:34:38 -0700 (PDT)
X-Received: by 2002:a17:902:f691:b0:2c9:a247:171 with SMTP id d9443c01a7336-2ccea371dcfmr36608985ad.1.1783532077898;
        Wed, 08 Jul 2026 10:34:37 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm31168865ad.67.2026.07.08.10.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:34:37 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 5/6] drm/msm: Fix per-process-pgtables check
Date: Wed,  8 Jul 2026 10:33:53 -0700
Message-ID: <20260708173356.578713-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX10Ab/K66CUus
 kGu1pL3zVgHoZfsZZUhl0rVvzGEvyK132NcB/ilm255WqfZCM4iLJKeE+T785TuuNwNStdBvLwi
 TIooKVssDRyap4h3vuRFouieGY5EL9KvgW8f/Z/8pBzlj/2MavFagBPcg3upHtceOlPNFG/e0SA
 d7F9LqmvgIrhSkL/rbOYzS9+Yq3aSGxeJLK1x6mwzDamY9xFzhHgGeImxk1SR0wkgY9aLBe1bT8
 4bieaI67TyMUH8czmmAbhtwKTGGazUP7cvflGkhX5yxTXz+n1qFA7WKuIC5Gzm8RxrPZ5PewK1r
 w9Qby/x8u6ewJcURxXUxX1dEEDPugaz3FPIMzcCT5nHRx0dH/zCF1pSRw8DqJEbpLszbUoVdaZk
 IkABJDqDKDNVekXCbd/lLvuhwso6Xphm3YB0JXeS5FkOQxSb7piNXyosPuZWTDYI+NqA5DyWyMn
 E+bmxQCcsVA2OwBPlOA==
X-Proofpoint-ORIG-GUID: gyK9FZp1rl4hotVA4PALD3hBateaZfQ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX+XjsowzGlWjX
 TzDS++tFhFtOINJ+fz/zXv4KNqdXMYad7qsSgtlND74o6/fjWTmCjgm5Q2GGGkxgJ/nVbzbV3DI
 /7BWKxHruYBnjVdhVU9c4uSwAK0yW3s=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e8a2f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vtH2vi951kckHO5NeAIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: gyK9FZp1rl4hotVA4PALD3hBateaZfQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080172
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-117783-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:sashiko-bot@kernel.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 98DD472949D

ctx->vm should not be inialized yet (or if it has, an error is returned
immediately following this check), so this isn't a valid way to check
for per-process-pgtable support.

Instead just check if create_private_vm() is supported.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: feb8ef4636a4 ("drm/msm: Add opt-in for VM_BIND")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c62c45bb0ddb..bff2a773c0d4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -505,7 +505,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return msm_context_set_sysprof(ctx, gpu, value);
 	case MSM_PARAM_EN_VM_BIND:
 		/* We can only support VM_BIND with per-process pgtables: */
-		if (ctx->vm == gpu->vm)
+		if (!gpu->funcs->create_private_vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
 
 		/*
-- 
2.55.0



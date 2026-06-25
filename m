Return-Path: <linux-arm-msm+bounces-114571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TN/mC4N+PWrI3ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 21:16:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AC06C8546
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 21:16:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gC9PAyCO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PZiLIjk7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114571-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114571-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38485305EA73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 19:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DB034887E;
	Thu, 25 Jun 2026 19:15:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E233EAF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414948; cv=none; b=IJxWBhdpiaj8lpT04twb47D007EKBKTAXled5jApsfmB1TlvdP9SvOR9BrDbVJmM3xMMamPu/+cNTTb+5+I7bZvVHxPVf4tq+hFHQMOCTsdvof3m0Uxy2HQF7H8macg+qYd2MPufbZzFzIJDpWqFr+GfPwFcipPr61nd6zKubqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414948; c=relaxed/simple;
	bh=/p15D98oWQTSYv5HabnMOz6/z7N7M8gk/34A7MEKXiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxzYLFpRPB2m061m1Cu87pNekLQu3BmIhBP1OJ11WCqlqHAXTJIflMeWaYUbneSKuxWB85Rj937lnZacJ9kSJa3sFjK4SqAwV4QNW0LQqeytLnn5KAPQCISwCAKGs6YMicAd+oO0eMItjHiG3zqlPydOmN+rYAAARKXWYr72H3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gC9PAyCO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZiLIjk7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFe0MP3872724
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7V7Err/Z+6B
	Igi6OReMeeTwMA3vE41djVqJiMjm/22I=; b=gC9PAyCOZ5Bl5QHzHhezRGKj3sq
	tUw9NpPq9E5rpuZ0GVmFyDTb3DaB5kHRPf9bWFqhvsin/ejgfKcrrPzhcvpY/yCj
	1i1tr5ju8PES7NbSmcWvCxZkxD4vqDIiupI1szSPHvljElaYnfzlQnK4HzVpdQfc
	04q1G38bC4ktyNO1OhLrKQ4ixWOQjRvqihhMQMg917QUZFMygYzHtFzyZ0lmzXd9
	3j6LGnvR038ehGflw7CE4Xb5Yss//Re+YrhpvVSA2zaZpXBzLhpdSBrEhB+wNVE+
	8RvFZbiyqefhDeakuwZbGChxw08/gosWo2uvIVNvxtpPlgKpBYq7TYIB9GQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yyntw4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso92221b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782414946; x=1783019746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7V7Err/Z+6BIgi6OReMeeTwMA3vE41djVqJiMjm/22I=;
        b=PZiLIjk7iUADVU2sih/2DJ3kzPJeifEP4OxNzJUNgxfao5pRCnxvkF9IRbfehB4Fzv
         YlvHnL2IHEdtGtb9fzA9ixE4CJo4obDgSHj18JBPmVHi0JRoz5Tm+1NvRrZj3kWk7QeG
         ccGw4puu9NirrfMK9lfUv0iI+u/c9ltOCXB7194UrObkgv+JkhBtBEr6vcMuJxnGh3c0
         QsWB2m9G/9Ue2FzJiJGXqm+8RpdTQ/qHgFk2YAgrBXpuPz3xgwMLIYiq3QJYL0Qw7RF8
         pA3hnt5uAFOCtIiF02TnPYbwM5CFRNxSTV6DEli/11pp9GZtRtd5tPEm/0m902alPxJy
         yixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414946; x=1783019746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7V7Err/Z+6BIgi6OReMeeTwMA3vE41djVqJiMjm/22I=;
        b=IryEpmxW+8O51HRKYdnmxoA8r7aJUjeGZtmIWdNjAqZ7GkWYeNQ5kC2xxKWFC4+qi7
         2IFFQhorryMi/ydCwhun3h5Vf6zJFwNNrGkmdfY9dfLBh8RAyZmKh7KDfu95Wh3TjCC5
         g63g46mxNz+zAObQ7rvVaQKxkqYfPoFnbw9V+4SwtpG5LFlvTk+qgNU5wVxdf6aOxMKN
         u6/sNcOgwqPbXu5vT1oY7tBPiP5uEO+SCDPDcWVn6lyVlUO0EBPk/d/tK6sDnwbG55vE
         JqUxp7YNGEs7mdXWWvzDxAnGMFwSEqzEVmcTS5YhIivBzERSvgT3aPdJ4/Y6n5Zs7cba
         967g==
X-Gm-Message-State: AOJu0YwJ3tZBjSHf/z4lIg78/UhM4VTfDcWNhSdFowQouQvWn470cgIL
	ELxivpZvnsi9rFCyZWlHlidsbzus8tSHPY0kRypMtu/7ii85f8WAfqAOjjjo1zkekz849efLcFs
	Dbre6BPUijdzKkRbEY4Qowe8LoJysq67GFhpm5X19OiyN4R/MsczZcwyTm6TKVJHy4GJy
X-Gm-Gg: AfdE7cl2mr42K1cwwCNP5jDiMnK1u0+ENh/TvJyEojcoq/3mhx7EYJtd0lAebguuGTQ
	LvE3AloMjelfIHKHeCRakFwbqYVnWa5NTxMIifVavdo6ukxCg1jsCPzYrra5SvDi4dfju2iJtH/
	g7aYYeV592PFP7bglRjjGSJCie69goR2XmWrKxni6SV267DkWqAC5wHs021NMUAhA7ImJb5iSbc
	50o2wez/Pl+3fRyTbGxxi89Rj08chOAZwMhToH3H3DRFfRf80dwvTfaYLQ/9kXRKQasH75+mikd
	iuANPSfImunrBChSVUjCrmR663ouAUxA6FUyw3/oyqPehfQdQ4tdfYvUkjTQ5U43YfkvylUXIk9
	0B+dzfSxMBa4a03oLUaq2ICHgGEc7PMXS0pAr4K4DZyG14xRzvA8E12EAzw==
X-Received: by 2002:a05:6a00:10c5:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-845b3abb83amr4599816b3a.14.1782414946096;
        Thu, 25 Jun 2026 12:15:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:10c5:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-845b3abb83amr4599797b3a.14.1782414945593;
        Thu, 25 Jun 2026 12:15:45 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d2459sm5133513b3a.32.2026.06.25.12.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:15:44 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm/msm: Validate lazy VM is created in GEM_SUBMIT
Date: Thu, 25 Jun 2026 12:15:34 -0700
Message-ID: <20260625191537.47965-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625191537.47965-1-robin.clark@oss.qualcomm.com>
References: <20260625191537.47965-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE2NSBTYWx0ZWRfX8jgUEC+MbN+q
 7gzNKBO/x9VIujJFUKC8TXusCcSU93rcvHQaGSni+TEbLOcKri1iY+TQYpzr1qEyhHL1QoNqXq4
 WBuNVYCwUih6HU0biTQ7pi59KDW5TVM7DolesNcVy623UU19cg+YyrzixmceXFXMd0lZxn9Q4W/
 oFEi51GKHPNSZ2W1tgQaa2+TrymWjCiGkiZbLAKzx7bVkZOO5VZYpIlHnQvDhP3uqt8gT2zWptJ
 09pqgAjHMyvE87ROPkICxlrzPX+HP+1dSr6BAXIkIVR22E3V5F1+tD1Oz7XAoNJQ/Y2bioAK54T
 E6WwRon/rdhQFh/7XOHVK0fGs979ky719Gr07Hlm1JodJtDM389D7FICb3/IY+ShHPC6pziu7Xe
 tcFmlU75LElr3ZdaePHEnsLfxXgeOLVgj2vkAL0Ob+TPMbQ6IZsXM0rAEQJFeUFHobHB5y0fm8K
 3OqBgGFsxO9rSpUM+4A==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3d7e62 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZH_LIYEqPuu6AAuj7cUA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 7kXBZSoqfp5fyD9h2MCv6yUJdf4w-uxH
X-Proofpoint-GUID: 7kXBZSoqfp5fyD9h2MCv6yUJdf4w-uxH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE2NSBTYWx0ZWRfX/tkrwGZAKQnC
 azdUZ3JU70+B85wGW4TIyoUoawUKl78+FQvKOUEPjyB8jw4ijM2UDHo+HTrP520FCMjN3BGiilc
 n9qYWkNffOhtIrn9cFC7AJ5u5fsEVy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-114571-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,oss.qualcomm.com:server fail,vger.kernel.org:server fail,tor.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:sashiko-bot@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66AC06C8546

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
2.54.0



Return-Path: <linux-arm-msm+bounces-109652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPXRDwJEFGqmLQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:43:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9627D5CAA27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D7F5301BCE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065F6382384;
	Mon, 25 May 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kRhdGVbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChRtsGNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A6A38228E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712951; cv=none; b=H/dOenTqvefla1zUtm+XqTZT5TKN7hnUqUrF+uYTB0rw9ZJyYicWnzBwbTEDbvRxd5jI1ey0Gb1ThtnqvSxWiS8YtqxNz5Z8wJIyl8nOj15W+7s6vlkcfqSXXMHL7CiURNhJUTVYhA+pbOFYqz0Ji3eHD00Kkx73krnGH78Gx7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712951; c=relaxed/simple;
	bh=cKySdc3wDGMGQNU6OFE+qNwjlkwK51EH0yLKilD/OOI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lpQjwImZakpoeDEEaIDtSUk7B5Ne66ofWBj6fLQ7Ciogh9MCCIxdoPmEbxee4gYeYP5d8A0uxKISowdyHiri/77Kgr3ZrvqEmKjms7ycFfDJt88qnBYBMl6QoSovr7iNXa8k8qOA2+l4o4FxAD2ytOSyID3XDkDx6cfaDL7ZuJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kRhdGVbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChRtsGNL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7QGaD3063355
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gspTz+RCdd00FlSjfdVj6tl1b3B4ut3IzjE
	OfEUzLJI=; b=kRhdGVbpWTbKCytAZ8IksU24QLSo/2mOmI+OoxIahZpf2/zyX89
	EfHL56uZifaPsSQTqPfNPtRd1pCC2vPRVwBnof36KcXCVSi053bo5YqKELoXlg3Z
	4Kzw/UXqmQzxpxtk0M5IUACUXrEZ2NdQfpOzuS4b9d2lhWFENEPnXYMT2L0ZmEEV
	W2oEbq7NP0OrBATUkvm9l46V88Fx1rUlhPyGF6fsSNMvmkwrTOSG9ScgLLfmmyPy
	Y7CQsLN/Rqzm1WxZhNWzdnbLR4K1U3pKlMiCWraqaejFbmO+7swgocJV5FfpfKIO
	+746FT6wcQKvtzA3d4OxZmc6jCYo2dV65yQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gh3r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:42:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd00a65673so73081175ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779712948; x=1780317748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gspTz+RCdd00FlSjfdVj6tl1b3B4ut3IzjEOfEUzLJI=;
        b=ChRtsGNLqKFF7B1hyiRCqvRIO48HoW28bTNfYc6W5lnFokvYcjI/JhK5QuAIY9k6Yl
         w8+Eh9GMVLWQamwic20bI1WikwpvDofm9lOtuOKVBb2238Frx1lyld3mRun5fnN5mX0b
         IhQuxVfKSsPbYqvYpjAIwqex4MNZtnLHZx0CCbAlj+p05lH0tpvnYkfAE9cnfVNDaIhx
         8Nj6lgRD1AFDRcu2973WHGJihNyO2M2yHGo7fx1YIViXxlo6L3U5S2x+R5Vjs4e5NCOo
         1AglEw6lVNa5lKlmyRiGeZiCjdRkPTGI3pEs1om8IXjDqesWQolO2xxIAILv2RxR7Spy
         20gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779712948; x=1780317748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gspTz+RCdd00FlSjfdVj6tl1b3B4ut3IzjEOfEUzLJI=;
        b=l2G2cytyMfMFGmteJq7iEe959P0z2Ck1bYzwkxqHRApYWaYgqracAsrtkPiGIT10Yl
         HG6vU747cwW4sfHC7ZUY2UCitjkPqwpDa6EjEGPUXDJ3wt6OBuxgaLMOufwOVl3pPN10
         Fu9KJxzrLrHj6irqRyR+7yCJ0vCYqhtPx6zQ/eMwdX5z/Cr4yEepm6yDrK1M8KEHvmAk
         7T7X9GBx79oNbtjBdxChZy4y7FAuFbPnVHeQRA0kSkdpW9v6n1eM0u6WpF+MYS9+QyUw
         rH8gTd8bYRivAiMbgOUvPywJQCHJKWmac85Sn42Zi2ycCAOpz8AmEkoQ3nB8zO1Nrtpt
         Kauw==
X-Forwarded-Encrypted: i=1; AFNElJ+hRgVRZcIfADDGOs0sAHT7hjjv1gKVVveud+yj44yu8Kxfa/ZNx+TbAzvbfFkj33tS5TMPj7X1ClIWL/wc@vger.kernel.org
X-Gm-Message-State: AOJu0YxlhBJx4DYoksmgERQkjoB6fv+oVgtqsjkD0drrW8UdijXTUkUc
	HVRVG4urB5nguW/fLra3nF3LDPy2gHQq7rTwk1nwSsFMVLmReZ1aFTw2mpx1yVrlkvjZ9J5ovCw
	KCaH8SflKkCTQnCNuFEv3u3jU5+O4yPKzTyehpP3as01zmdieCDjyZyN9aDAbZhsfumbT
X-Gm-Gg: Acq92OGCZmBR3uRW0jfL275pETuGJHd1CSDIaIQ/nGrAS8mn/heKGve3e1vHpdmlu+j
	sWqL4mLXXT2voau20fMY1X/+kblX8cydBHZvvb8PvmtV5U4BB0gt0024Jy81ai+tEXP1M2bIkDe
	ts5+dEq/8fIAOzLHsVorvKMXsfK7jJfzlf2Pwy+nj/mWhOJlJB6qLwXO0HDMNnvdKGFVCcwEO7b
	WAdE98KdNDnOYTmtzUt31u+xdfC4iiZJybjcfxSxvnkgr75sK6tGSyOK+pD8fuc7J0a6sdBfUua
	eTiQZyVWCdy5y7x+SlxZQpfK1q9b2/WwDsvzXwEvjnX0ZwM5beoVmRNndhI9cqh+5ZsHvbbq/XO
	gqm8NGB6sREY+oZlDJ+qe0vY4RAgDgR4gZwhVOIn/aaArstBwtstT2a0=
X-Received: by 2002:a17:902:f709:b0:2bc:dca9:f0ed with SMTP id d9443c01a7336-2beb087b062mr115484125ad.15.1779712948082;
        Mon, 25 May 2026 05:42:28 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2bc:dca9:f0ed with SMTP id d9443c01a7336-2beb087b062mr115483825ad.15.1779712947431;
        Mon, 25 May 2026 05:42:27 -0700 (PDT)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5205f16sm95717745ad.0.2026.05.25.05.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:42:27 -0700 (PDT)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v1] misc: fastrpc: fix context leak and hang on signal-interrupted invoke
Date: Mon, 25 May 2026 18:12:22 +0530
Message-Id: <20260525124222.3082420-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CvIkisAu4LtX9CBlwdGkpsjOTsd4BJKg
X-Proofpoint-GUID: CvIkisAu4LtX9CBlwdGkpsjOTsd4BJKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMSBTYWx0ZWRfX6Q8fW+UBge4u
 uxtdodN8QXq5LS6zom+oGAfSsMIADEfb+dag/6jS6W4K742umnLZKY82IBOJpedxbwWsVJmbGnQ
 5XZ1TmbT06uCu2h3oWKfRUNXTMhA9sO5AJM8lM2toOdAhugKivJb4zDsx7Ltd/KkTJ3iNosgxxb
 pjG07PQ2IPfp04lpPPN9tb8Jbb5Ia1a7aVcAo+ob+pxqwP8Gjl+WYOA1ZolfKrLHoLYTXtaTBNt
 j6B0N+RZmi1JnTfGOwznxvTXmYZkpxU+x0DSwQ6htW3Mh11nG+DTe3HGNruS2hv/jANLKOEwKR0
 8OfiNO9t6lCd4mf0/cMLKQYO7Th1GVwzDf9fCh7pd4yW7yuuFEpvIVHi+KL0La6ySBv4tXi7yqD
 tNkNU1+sTCTCB+pLP5SDfzRsVsk6OdIQbcD4zmRT3pPoZ8CSAiBn1wmV20leCq32N7LWt3fzDzN
 wnWOtiK77CbgKjlR3sA==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a1443b5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=htDFEa73CQMYf3Ekz7QA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250131
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109652-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9627D5CAA27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fastrpc invokes work by sending an RPC message to the DSP and blocking
in wait_for_completion_interruptible() until the DSP responds. If a
signal arrives during this wait, the syscall returns -ERESTARTSYS and
the invoke context which holds the in-flight DMA buffers and
completion state is left stranded in fl->pending.

On the next syscall attempt (either auto-restarted by the kernel via
SA_RESTART or manually retried by user-space after EINTR), a fresh
context is allocated and the RPC message is re-sent to the DSP. This
has two consequences:

  - The original context leaks in fl->pending until the file is closed.
  - The DSP receives a duplicate invocation. If the DSP was mid-way
    through processing the first request and had issued a reverse RPC
    call back to the host, the retry sends a new forward request
    instead of the expected reverse-RPC response. The DSP thread
    waiting for that response is never woken, causing a hang.

Fix this by saving the interrupted context to a new fl->interrupted
list on -ERESTARTSYS. When the same thread retries the invoke with a
matching sc, restore the context and jump directly to the wait,
skipping context allocation and message re-send.

Also drain fl->interrupted on process exit and complete any sleeping
contexts with -EPIPE when the rpmsg channel is removed.

Fixes: 387f625585d1 ("misc: fastrpc: handle interrupted contexts")
Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 69 ++++++++++++++++++++++++++++++++----------
 1 file changed, 53 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..22d0b0592c10 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -280,7 +280,6 @@ struct fastrpc_channel_ctx {
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
 	struct fastrpc_buf *remote_heap;
-	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
 	u64 dma_mask;
@@ -297,6 +296,7 @@ struct fastrpc_user {
 	struct list_head user;
 	struct list_head maps;
 	struct list_head pending;
+	struct list_head interrupted;
 	struct list_head mmaps;
 
 	struct fastrpc_channel_ctx *cctx;
@@ -542,6 +542,36 @@ static void fastrpc_context_put_wq(struct work_struct *work)
 	fastrpc_context_put(ctx);
 }
 
+static void fastrpc_context_save_interrupted(struct fastrpc_invoke_ctx *ctx)
+{
+	spin_lock(&ctx->fl->lock);
+	list_del(&ctx->node);
+	list_add_tail(&ctx->node, &ctx->fl->interrupted);
+	spin_unlock(&ctx->fl->lock);
+}
+
+static struct fastrpc_invoke_ctx *fastrpc_context_restore_interrupted(
+			struct fastrpc_user *fl, u32 sc)
+{
+	struct fastrpc_invoke_ctx *ctx = NULL, *ictx, *n;
+
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(ictx, n, &fl->interrupted, node) {
+		if (ictx->pid != current->pid)
+			continue;
+		if (ictx->sc != sc || ictx->fl != fl) {
+			spin_unlock(&fl->lock);
+			return ERR_PTR(-EINVAL);
+		}
+		ctx = ictx;
+		list_del(&ctx->node);
+		list_add_tail(&ctx->node, &fl->pending);
+		break;
+	}
+	spin_unlock(&fl->lock);
+	return ctx;
+}
+
 #define CMP(aa, bb) ((aa) == (bb) ? 0 : (aa) < (bb) ? -1 : 1)
 static int olaps_cmp(const void *a, const void *b)
 {
@@ -1197,8 +1227,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   struct fastrpc_invoke_args *args)
 {
 	struct fastrpc_invoke_ctx *ctx = NULL;
-	struct fastrpc_buf *buf, *b;
-
 	int err = 0;
 
 	if (!fl->sctx)
@@ -1212,6 +1240,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		return -EPERM;
 	}
 
+	if (!kernel) {
+		ctx = fastrpc_context_restore_interrupted(fl, sc);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+		if (ctx)
+			goto wait;
+	}
+
 	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
@@ -1227,6 +1263,7 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
+wait:
 	if (kernel) {
 		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
 			err = -ETIMEDOUT;
@@ -1250,7 +1287,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		goto bail;
 
 bail:
-	if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
+	if (ctx && err == -ERESTARTSYS) {
+		fastrpc_context_save_interrupted(ctx);
+	} else if (ctx && err != -ETIMEDOUT) {
 		/* We are done with this compute context */
 		spin_lock(&fl->lock);
 		list_del(&ctx->node);
@@ -1258,13 +1297,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		fastrpc_context_put(ctx);
 	}
 
-	if (err == -ERESTARTSYS) {
-		list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
-			list_del(&buf->node);
-			list_add_tail(&buf->node, &fl->cctx->invoke_interrupted_mmaps);
-		}
-	}
-
 	if (err)
 		dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
 
@@ -1598,6 +1630,11 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 		fastrpc_context_put(ctx);
 	}
 
+	list_for_each_entry_safe(ctx, n, &fl->interrupted, node) {
+		list_del(&ctx->node);
+		fastrpc_context_put(ctx);
+	}
+
 	list_for_each_entry_safe(map, m, &fl->maps, node)
 		fastrpc_map_put(map);
 
@@ -1637,6 +1674,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	spin_lock_init(&fl->lock);
 	mutex_init(&fl->mutex);
 	INIT_LIST_HEAD(&fl->pending);
+	INIT_LIST_HEAD(&fl->interrupted);
 	INIT_LIST_HEAD(&fl->maps);
 	INIT_LIST_HEAD(&fl->mmaps);
 	INIT_LIST_HEAD(&fl->user);
@@ -2435,7 +2473,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	rdev->dma_mask = &data->dma_mask;
 	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
 	INIT_LIST_HEAD(&data->users);
-	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
 	spin_lock_init(&data->lock);
 	idr_init(&data->ctx_idr);
 	data->domain_id = domain_id;
@@ -2467,13 +2504,16 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
 		ctx->retval = -EPIPE;
 		complete(&ctx->work);
 	}
+	list_for_each_entry(ctx, &user->interrupted, node) {
+		ctx->retval = -EPIPE;
+		complete(&ctx->work);
+	}
 	spin_unlock(&user->lock);
 }
 
 static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
-	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
 
@@ -2490,9 +2530,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->secure_fdevice)
 		misc_deregister(&cctx->secure_fdevice->miscdev);
 
-	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
-		list_del(&buf->node);
-
 	if (cctx->remote_heap)
 		fastrpc_buf_free(cctx->remote_heap);
 
-- 
2.34.1



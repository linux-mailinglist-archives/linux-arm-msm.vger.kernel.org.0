Return-Path: <linux-arm-msm+bounces-107915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCJXLAYaB2rnrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:05:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBD4550267
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FD2C317865E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0476A47ECCE;
	Fri, 15 May 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfonqrYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hf80f5Sz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8588947DF8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848981; cv=none; b=GafF/QR9fjytEX9IpRv257novypfxisAnDgS+C6dD+Ho+i34WzQzAMuBxGAobnAHGfwNEOgcbiLY8O6IZCcb6ZhEO47/D0CKt4fwN8AkOjkKB5UFF/R97WqshxGJch7IWG3i3y0ofnLj/r8XbKfyftm2yMUinrzRfJPdg0v1nhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848981; c=relaxed/simple;
	bh=zwgk6epnRWY8Wv5vG6Mf9eFSqZrrY7jCN5ujBz1hPqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NaNNSeBbuzCuraVwQ2nOVqd1wIuhzoURmCxalJVc+xgmDXewmt6CVMag7gugT9ICqygSPrRTjRNxi6WPMzaQAyoKT0yWE/SWQ+dXj7oR2DJH7nxamuYGBpQmcp9Z42NcnNskym02MlkI8XMeUFz0T0qg8bR1QdTjsv2UJgsVmhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfonqrYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hf80f5Sz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB3RxM4008241
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F4ku8bhGpeG
	5gSXCtpcrJJX6a8V20679dhsPTygcnWI=; b=MfonqrYNZml3WtDu0pRbeI4aKMN
	/s9FNCElzmNU+sXhxiBVl0tFO2V5RTtin6OJE34zqUgEjwDSnLYx2Ry0i1v4jlW0
	9GfEL4uVBUHqu/hc6j2VDD8FKqM766YSNz/SdXBfX0vvp+2gcp9I57IUcv3ecY+c
	AzMOuQ35TboxQFdctWmU4u2GvLKW9FlVL3J1yW3H9ep3J4/eJuuNzgQQsyJ1lKNS
	Uw4yjzLz4R4Qkwt5djpOKR998rIw1yviU4pQXbJGLAvIyGgj4AZe5jVshLv3ug1x
	vZXn/OGqsHQ8OoF+3KO46YgeZ0Fk0v67YxshjkHp77BAGjK+FpMyfZqKt/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su9m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso85388955ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848978; x=1779453778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4ku8bhGpeG5gSXCtpcrJJX6a8V20679dhsPTygcnWI=;
        b=hf80f5SzU/L2AMEn16Yb3UqCgyuT7ccZQJCh+bWv6O3auu5T4s5sQVI8wU8yzsbqC6
         CQl17avh82f3rMkcz6Kq8oBTBgXdutLT0wLcKVUXyWra5TWwFOa0IglH4rUrpQ6qEFFQ
         b5HRKTVWTfM36+HuvoAVEOPvU/a/bzOJ6p6KMjYwPFZm/+RGQ4cHyBN9EXFaXQ5LkThw
         pnKbnQOjm9DgoP8Z2ErGq95cdyFlDSksAOZ+v2/9dk83QffssR3A8sCO1MewTVOg60L2
         7P8DdI5ma4XDl3HpiPrNnIgwVHLCQfjDllUdSZJmwT44X1mS+w0whHuhS52fEM3wq48/
         Xuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848978; x=1779453778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4ku8bhGpeG5gSXCtpcrJJX6a8V20679dhsPTygcnWI=;
        b=BTRQQUrMfHOoy8Rq7nMJAKQYiOtVCWz+b9TYEmeepH7hZnlwzDOCaq6Apx0Suw897U
         PobnB+N6aP8vcxBYFO1uTPagK3JymzpcEWQCQ4NUYsSmILqNEHDWHtkfz9OxF+dY/Cos
         lF4DYpBx0anmcBJsr6pU+5Qvl7E5Il8t5PdACvaz8Fv4nF8lR/eUXqAve+0y4aAPwvv+
         lY2XYZetufWGW/G6xzzGRzpcAaF4FrQQNbBmnMFeFG5m1awoxAXJRkTlfYDjdrmZNmOh
         Gm2v5GUyjQMKsRfLJMvea5f+xXlej/vMnDcXPGOPT/Y18Ontfvu3nHgZHqmaDDW3kNaJ
         OBJg==
X-Forwarded-Encrypted: i=1; AFNElJ8SD3kYGqytH+V54KArOMiKUE0KXHFoC91KN9rQe28ey2KUSo/+Sz008wX+DXb5HK4SdeCShaViUOzEBFdp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QOgm0ZxH3tYpjtRNmoIdXn9VQZWTVUBS+zSI4Aa7sK6oIQrw
	xGjTkxJzBajV+c21m4Lt1jsEk55oJnn8M3bDK7S24tnd4KZb1TP5zXmmiT41m6mREM38tyErYUl
	cp6uR8kP3BD8z4aoUPymw32GGj1urm0xiIsVx3rhUsV4ORiH3GmIHl2CcaSRxEfVDcUyq
X-Gm-Gg: Acq92OFn/Slp6FfAVk6z8P3IU4wrx2rUE185GIbsgnRrLqtSlTv71wwPRQgpQ6BT1vv
	01f0lRHoVoOqZaIh9GctR98By3rxgtOsZxTfiDqEnXDdKMEaUfgJYx90IEDZ2iJk4JvUegKx6NX
	prnBoUgECQvoXoiE+76vALO4rNQ2oltz+cXqAQ7D4bsaJIpJ3/oXfq/M9OS52xXpmVIPdtCuNuT
	wS1txFer4dior8NDgIG7EKTnQWGS4cXt/fUKfWXbJQtnoBrmIg5Gtp2+15bNdqR53BUYD5fQ3Lh
	CQXPVA3ZN/NVtl/pdBkOmZNDciRoRBusUis2HimdtIkDsURqUNvT02mBhpPedmaEFapxOpu9Kzc
	Los8JKORVhH3X9GOZOUXJ+d3tD/i09JUd4LPepXpHml2dvgx7OPvnM5fxElMnW/J68JZ075N4st
	+xFJXIaQ2JGQf6R2sjedo=
X-Received: by 2002:a17:903:990:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2bd7e784bd9mr44811595ad.6.1778848978193;
        Fri, 15 May 2026 05:42:58 -0700 (PDT)
X-Received: by 2002:a17:903:990:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2bd7e784bd9mr44811275ad.6.1778848977719;
        Fri, 15 May 2026 05:42:57 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm56119395ad.25.2026.05.15.05.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:42:57 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v5 5/5] misc: fastrpc: Allow fastrpc_buf_free() to accept NULL
Date: Fri, 15 May 2026 20:42:17 +0800
Message-Id: <20260515124217.20723-6-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k1kOxMBB9TfBbqrZyQR0Z1yoZqri9wMf
X-Proofpoint-GUID: k1kOxMBB9TfBbqrZyQR0Z1yoZqri9wMf
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a0714d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=GmafkBk8WXepDEkBruoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyOSBTYWx0ZWRfX018iav3kklK5
 +B8teYalUIf0Yrqqlyz1+a9BgTmZtMDyyoIA9FJ8I6lktZMnCQkUC5qhocLzkTZD8LMmVHyi/zf
 Rsj+bPBNv6lyc7Rp/n2Wr8jt0vP5fPJMm3wxSiVcQY8t9o9+pK7tKKuFr+LmwEUcpUdg4xhnoUy
 X3jCGIvzUnMqWFynlc4li8ioteYMvJQYc2ZS4BthTjTjedhOfNuAoQjKBU3BXGvOu0Ju+GDjVLR
 nK3DVYwMk02+GKZif7d3A8dYGBT8rcUm76p/E2ttYExwaGE/OQ8kgR2o7PL+yCZ6lm2JxW8c3I8
 VZxC1TDsnI9svoao9tJt/c3IhEBsldbvANNAzUP/pJ+6LTsdnC8NDQhTIetgZu3VcxnlKajM9Bt
 Za6nwAnen4hFjEToz9ybkCgif59HnV3FyXT+USa0bGPYTt6cPyFTQtGVVAlgzhrtCxYdOEth6PU
 iIT4AowqdkS+xHHnUsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150129
X-Rspamd-Queue-Id: 0DBD4550267
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107915-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Make fastrpc_buf_free() a no-op when passed a NULL pointer, allowing
callers to avoid open-coded NULL checks.

Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9c70788afa0f..82bfbf342725 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -416,6 +416,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	if (!buf)
+		return;
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
 			  fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr));
 	kfree(buf);
@@ -512,8 +515,7 @@ static void fastrpc_context_free(struct kref *ref)
 	for (i = 0; i < ctx->nbufs; i++)
 		fastrpc_map_put(ctx->maps[i]);
 
-	if (ctx->buf)
-		fastrpc_buf_free(ctx->buf);
+	fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
@@ -1564,8 +1566,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	list_del(&fl->user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	if (fl->init_mem)
-		fastrpc_buf_free(fl->init_mem);
+	fastrpc_buf_free(fl->init_mem);
 
 	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
 		list_del(&ctx->node);
-- 
2.43.0



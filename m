Return-Path: <linux-arm-msm+bounces-109788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE8sOD+AFWr3WAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:13:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 444C55D4BA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3809F300CC33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43F93DEAC0;
	Tue, 26 May 2026 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJBbWzLW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JusWcy0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72A33DD87B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793922; cv=none; b=tLKrqnaO7++VykzP6gbasJVj2gYJGYJwNXkzBQhgSZjacgqDEh1WX05eOn9DANmRPPcDHAE9UGuFAxPXY+1ZDwC/ZtcpQS3cSBYvcdjwJ7FwxWSNjlZfIORnqbIHNdD798eetmk2yo11FteqnJylN8k4LYxjRG0/4avBdzE9qaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793922; c=relaxed/simple;
	bh=SpYFOdNS7gnBf/9Kq+Ug6hzz85x84LyutbiS5RMAVCU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IA5+67JEz7EI04qeLcrV5rEVTEI1TzsKVCxRL67zHXTtLb+uct+9v0AKLRuTicbZXfly8SleYHInRF1LEfQ5Vrfjns7vUJAjHMkBccyutAymr37Ng3Br0In8FElN/Fik4dJ2+QaG9wp7YQ4cqS0sE+odCwJ9KlbK1UVccyKCxXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJBbWzLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JusWcy0t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q9Rfdc4117468
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VhYbVLEP74Y
	0H1uCZ5BG5cAHB/9WIR0BIz6pt5j6WzM=; b=EJBbWzLWaqxe+JQct1UrsjZIufP
	6JZkeWQVxdln6F+30j60S7EZHsQPJZ3kbl2Xzk4LVVmQuoYttqvPdcghmlgmKHJf
	DiuUPNY0RUycuMhMPfrJDhXEu6DP9LB9S6mElzGRWXnG+tBSVpfnZB1JT+tY9fex
	zR1GRhC4oIg0vKh+gZugmJdK+JouGdM4U5WCnegAPQ7tq1xPq+lYlE2BzbEoF3pt
	KtTRgJkAajEM1qP3L9ofkZlIyVWb58TNXkeF/S/mQytD0RmDkmkye442jDUgSomF
	HxZu95BaVoJf6vC1G2aoWctKZeQsyXikQe/wT3Ow2Sg1w5dv/cdpwXLicNw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudbjv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366015bca9bso8573439a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779793919; x=1780398719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhYbVLEP74Y0H1uCZ5BG5cAHB/9WIR0BIz6pt5j6WzM=;
        b=JusWcy0tvUOnWRWmXTqanrn15eH5xdJoe+UF46sKi1v420kZRtq0grPPu2En7i1UXQ
         551TOTIFSfj4R8SCPxemB2XSBUAl4Gom7xWPMVfN6y1o0n5Mg8c/iQ9k/r1yAMhXNsyp
         otAc3xUlV2VsgCQEJt1gIoPBCicQM5LERY6+J7c2y6IAtyG3X3HcKsAlIZlbPEiYM/ea
         VkDuane4NbnMk4MB5P5XgxKQVNZM1c6osWnBwHTxodQbbGlOrzel/2GsIOUjjcxsDl40
         qpcwuYwAVyKL+Dv8mhCGtbw9yAUsCkZJgUJyQ+RpvZPrDzEa6gAuHMSmvs0sAHZjPQ80
         MB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779793919; x=1780398719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VhYbVLEP74Y0H1uCZ5BG5cAHB/9WIR0BIz6pt5j6WzM=;
        b=WtkETy7mF/rvU+JomJpGCXckZUx4o3ZX85UEVbN3MWzzRJaLlUKELhsEZ7KKftHG6p
         LbUDuhQadDw2Z/sAuOYibi6nMYJ83ULYkKC6dbxLyyuBr5XIdyzp2HPQjOpGnQd0m2GA
         ma/BxGSgWRBvn3wOqv7nYc5MRXWpz4Dw+BGnBaGpps2YMxJ2Lpr5sA4RkPOSn+R/97wE
         gi0Qgcd/jqy09Vl5vCAbZm4srJ+Bf42WhjVrjRZ8P5TAs1bV/GP9qDUgKkNXMswSAUbY
         7XzklnD7AOjovO74fYMP/psquX4cV4BwqJAD9hjMhhoXSUYNEGumajiWcaaUJUth+Ima
         3E2A==
X-Forwarded-Encrypted: i=1; AFNElJ9gkNAxCsVABny2KnLrGjzzFw7EtnDY/ngLM6GROJcSteA8++7gvf7ZRR9aMe6Vj2inVgR77ONC4AAk48ae@vger.kernel.org
X-Gm-Message-State: AOJu0Yy24R5QH5lMViBWqd6lGL20+smSzVtLh60rlUbDb1G5sg/mF5TD
	v9+YiPC68WzS+EC5vywmMl/DZ8iOnelsuKDVAQ8RviQZQJtHzGm0jhJb91Y5N3plaBWGlVi+ZrU
	MeL8b4qNoiQ8VsNCXGkyXktgAceYlwqGPiyKc+5IQncAqC12UenvHedYanigJbmvaJuB4
X-Gm-Gg: Acq92OGXY6L56kVoiUn5Uu1dB9hITr3kCCTBTVbO1hTW9dtuqpeiSxZXJmpsZT6so8a
	Klwxw74dRdPGBwOSfT6z9lHy3MtPlnJYD3pPLXnwlXSERF9GquqEyHBLujb5AGIXig2bpCiGbZp
	jH9kEFtskzkj74voJULAmhg76qGQanKHcWiaEsLQExt+dTYOyye42UGCs7I7qPTf1KE8TjI0Bge
	WtH4tBvAxqkYcO6GnAVT8UvSURZ1kdUhs0CK83Vde5Fxj6ZwA2KbRmfP4FojoB5DCetZFkYaCme
	mpaRKHKEGaAdjQWOhS7UPaOQyzpLxQC8HetX7i9Jq5KrL200DRZo8bkQ3kfVsJo5Jp64kZHcdS3
	N2EdYmSaXmMDv8ATj74OhTXZS36VzN4KMlTab1eY5jIhAhlRnEtnUNJsP0MizCOvbm5iBSMFCPm
	Eov2w3XHCxJNCQxwq4vA==
X-Received: by 2002:a17:90b:2712:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-36a6c79dd38mr13454542a91.12.1779793918498;
        Tue, 26 May 2026 04:11:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2712:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-36a6c79dd38mr13454520a91.12.1779793917996;
        Tue, 26 May 2026 04:11:57 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4ce6bsm12104253a91.11.2026.05.26.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:11:57 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: [PATCH v6 4/5] imisc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Tue, 26 May 2026 19:11:23 +0800
Message-Id: <20260526111124.515-5-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526111124.515-1-jianping.li@oss.qualcomm.com>
References: <20260526111124.515-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 289J5ilgQdIAvOnCzVGiaGdAGscrtezf
X-Proofpoint-GUID: 289J5ilgQdIAvOnCzVGiaGdAGscrtezf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NyBTYWx0ZWRfXweJFnuKoo4is
 Y3Brl+FFmii3FkDPIIp8KK7CYCqq+bakkvIIr4utn5yp+K1QcBFf8wj76g1WSkNDE+Fmx01Sbba
 PDuyjwFWXIvAvjdPdqTB5Yd6xeKNvm3Jr87Ysfi0uEsyR9DBtv25gzwkDr35c3fkQtD7qxIjz/Z
 fm0nveUU7IXNTdVBF2R9CV6Po5EbKAJGWLuxKm0M84reR93NGZ88QmPRYKsENvgL10VH+SGv1CH
 4K9hqo5jLG2vq9JBoV4iIeohjKXwLylGu+8+D8Q853kQ3C8c8vYQMTQjd2SG/wNDncKgduQjX+l
 Tz2yR2ZGOP6an69v+5jXsHiWjQoshPBESFF3hxkV/T5b8hgsrCG+VeBBejQ0PYIJ1+wvVihAQVD
 8SqsQwgGnyU8omkzHJz6B5jtRTvfm0tjk0QeQ9ch78F+MNqwt55UxgnVRSdmBD2IvSH1uVds800
 1fDNKH+417X+7TLg3XQ==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a157fff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vXPY0jRleWu_0xqwLycA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260097
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
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109788-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 444C55D4BA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allocating and freeing Audio PD memory from userspace is unsafe because
the kernel cannot reliably determine when the DSP has finished using the
memory. Userspace may free buffers while they are still in use by the DSP,
and remote free requests cannot be safely trusted.

Additionally, the current implementation allows userspace to repeatedly
grow the Audio PD heap, but does not support shrinking it. This can lead
to unbounded memory usage over time, effectively causing a memory leak.

Fix this by allocating the entire Audio PD reserved-memory region during
rpmsg probe and tying its lifetime to the rpmsg channel. This removes
userspace-controlled alloc/free and ensures that memory is reclaimed only
when the DSP process is torn down.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 103 ++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 53 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f46a8f53970d..0208208c2d27 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
 	bool valid_attributes;
+	/* Flag if audio PD init mem was allocated */
+	bool audio_init_mem;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
@@ -1344,15 +1346,16 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
 	struct fastrpc_phy_page pages[1];
+	struct fastrpc_channel_ctx *cctx = fl->cctx;
 	char *name;
 	int err;
-	bool scm_done = false;
 	struct {
 		int client_id;
 		u32 namelen;
 		u32 pageslen;
 	} inbuf;
 	u32 sc;
+	unsigned long flags;
 
 	if (!fl->cctx->remote_heap ||
 	    !fl->cctx->remote_heap->dma_addr ||
@@ -1383,31 +1386,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	inbuf.client_id = fl->client_id;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
-	if (!fl->cctx->remote_heap) {
-		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
-						&fl->cctx->remote_heap);
-		if (err)
-			goto err_name;
-
-		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
-		if (fl->cctx->vmcount) {
-			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-							(u64)fl->cctx->remote_heap->size,
-							&src_perms,
-							fl->cctx->vmperms, fl->cctx->vmcount);
-			if (err) {
-				dev_err(fl->sctx->dev,
-					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
-					&fl->cctx->remote_heap->dma_addr,
-					fl->cctx->remote_heap->size, err);
-				goto err_map;
-			}
-			scm_done = true;
-			inbuf.pageslen = 1;
-		}
-	}
 
 	fl->pd = USER_PD;
 
@@ -1419,8 +1397,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	spin_lock_irqsave(&cctx->lock, flags);
+	if (!fl->cctx->audio_init_mem) {
+		if (!fl->cctx->remote_heap ||
+		    !fl->cctx->remote_heap->dma_addr ||
+		    !fl->cctx->remote_heap->size) {
+			spin_unlock_irqrestore(&cctx->lock, flags);
+			err = -ENOMEM;
+			goto err;
+		}
+		pages[0].addr = fl->cctx->remote_heap->dma_addr;
+		pages[0].size = fl->cctx->remote_heap->size;
+		fl->cctx->audio_init_mem = true;
+		inbuf.pageslen = 1;
+	} else {
+		pages[0].addr = 0;
+		pages[0].size = 0;
+	}
+	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1438,27 +1432,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 	return 0;
 err_invoke:
-	if (fl->cctx->vmcount && scm_done) {
-		u64 src_perms = 0;
-		struct qcom_scm_vmperm dst_perms;
-		u32 i;
-
-		for (i = 0; i < fl->cctx->vmcount; i++)
-			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
-
-		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
-		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-						(u64)fl->cctx->remote_heap->size,
-						&src_perms, &dst_perms, 1);
-		if (err)
-			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
-				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
-	}
-err_map:
-	fastrpc_buf_free(fl->cctx->remote_heap);
-	fl->cctx->remote_heap = NULL;
-err_name:
+	fl->cctx->audio_init_mem = false;
 	kfree(name);
 err:
 	kfree(args);
@@ -2425,12 +2399,21 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	if (domain_id == SDSP_DOMAIN_ID) {
+	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
 		struct resource res;
 		u64 src_perms;
 
 		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
 		if (!err) {
+			if (domain_id == ADSP_DOMAIN_ID) {
+				data->remote_heap =
+					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
+				if (!data->remote_heap)
+					return -ENOMEM;
+
+				data->remote_heap->dma_addr = res.start;
+				data->remote_heap->size = resource_size(&res);
+			}
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
 			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
@@ -2438,7 +2421,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			if (err)
 				goto err_free_data;
 		}
-
 	}
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
@@ -2519,6 +2501,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int err;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2536,8 +2519,22 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	if (cctx->remote_heap && cctx->vmcount) {
+		u64 src_perms = 0;
+		struct qcom_scm_vmperm dst_perms;
+
+		for (u32 i = 0; i < cctx->vmcount; i++)
+			src_perms |= BIT(cctx->vmperms[i].vmid);
+
+		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+		dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
+					  cctx->remote_heap->size, &src_perms,
+					  &dst_perms, 1);
+		if (!err)
+			kfree(cctx->remote_heap);
+	}
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0



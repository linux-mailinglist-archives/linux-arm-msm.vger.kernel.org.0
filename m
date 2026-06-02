Return-Path: <linux-arm-msm+bounces-110735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOhWJ5uEHmqhkQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:22:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC7629941
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CDAF30546DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991B9CA6B;
	Tue,  2 Jun 2026 07:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZhhK0eW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNBHzPMy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B07935DD1C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384703; cv=none; b=M6dyVkf4L5p2/QEnoLyXG3/D704QZMTmqV8kdq3R84NUZkQfEnAsy706WfrDWuQvi8Soc0FFvnhY83l0mAagj2ge5fOVsxLaTBqFD3rrfJuEuI2T/UA+lRjZmdGuSYrbXbgRLnz36gpGusAB6PnHhj8ntM7qNpBV4fP6bCr2Lj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384703; c=relaxed/simple;
	bh=LaEl+yypMKeLK5rR8sTmYcYFF/hVieL3wAX2zHj57Fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M22VBSLhAL4zYAzWduXD31vzgJ0izdpF5QggwHrUWO65w0uf9rTBC3DyWa3qk1exngHz5JHN+pp+rOQpgNWOjaEkNcjUcjeAxkjhtzxf1AzP2JuYOciyAF28ZQCkztoMmYy+zI72V8hOXBf7pIvTeEiFcD0vEk5Q87G6NUV971Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZhhK0eW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNBHzPMy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tZXl4012485
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HU4ZtcghD0M
	28On2VNhDRQP9LlC0xqJF34085t8tRAU=; b=lZhhK0eWBbNrvuuk9NZsrLbeJVC
	Fr2cHMY5Ev1KSDWse+dEPHqxxPOvyQo0NvHfUrNX0QfzkL3nvzxkhOwLyvgTF8VB
	ZJFBFKOIN9E/Kvg9WrkDKUJWaEADt4vnlhN0kI0ansOspTcJKSuz5BpUA3W+j9sF
	b+7BoRqAIRALrPocHNeE8LrMpN1AdvjTebCLOmavG+PQ0yO2Xks22cmtw4VrhMNT
	6X1ndFN6N9zo+s5t12scC8B0vd9/24zKB0Sgea5eorKhnoXEHVk5gVW8P4M0Cjcq
	dZ+pgVK8A8fSFP4MGXs1KFgwlDZJkIs33KRVucojqkzO5BIMf0fb4sUNxmg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4gan0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:18:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so4050215a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384700; x=1780989500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HU4ZtcghD0M28On2VNhDRQP9LlC0xqJF34085t8tRAU=;
        b=cNBHzPMyEOCCDCbFcGwVA6AtNExEWHnd7bvT8m/sPoKYI1qqAnj/4K7ZJHZt4V8C9r
         2LIf1OFDQDidEkTj8GzphH0kEZEn9PDiCEDx9sbvylm662u0GbhYby7nU8uFkq1eFQZE
         PIfEoXddDAJGC0x4Ryu9AvkO3/G+KvD7z9oVa62OGxaiTto8L/tm6biZANtdNKQVAn5n
         sL0hLKQHmkuK0JWUAm5AOofvj2atULks6jDIh86gXxXSatL32M7So+OB/4KAA/99lrH8
         5I/DZSaje/Pyt+5gLRcRaU/owjqCdi0GdgBG/UISRh7ZrlbdRRAU47uNzzTr31v+QLwg
         xEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384700; x=1780989500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HU4ZtcghD0M28On2VNhDRQP9LlC0xqJF34085t8tRAU=;
        b=cUUqiEyJJnAFnwWNDPM1S2/VRZ/1m7OIZI8+UUgctDE2mgwxu/XuvnYaftAkU6rHKB
         WnvjHfMQWMZzhTT6s1MaWHwBKz45oHgDkWfyWu/RXOSXOmBzoALDEbbjP9+/jjrI+o86
         X7osiku5d+kNBJWgjeoD7bIvxuc/+J/vbge2CWuzz/gzRNEnpND4oCGZpgkuxoU9Nqw5
         RVk3lnslc5Ap9LB1358gtsb/UUleKvfnnT01qM8zsbTLUBntpkIoiOgR+uNcn72qoKYw
         9glFjeB0YMk88fhDJ1frtrOHyNXmhox+ikQRm86O89t3fv/Xu8jEVRle+NGhd1GdowrM
         FKGw==
X-Forwarded-Encrypted: i=1; AFNElJ/o93GhDv0ZlqVu8ZdnTyV4tsDC4IDZXVLuCi/G7BsEJk++77uJkXte/4q+9D7WyzrtQtoaKYIf7QuC8iBr@vger.kernel.org
X-Gm-Message-State: AOJu0YzExIOtDhfv6KqkA4zgC42BGd/fCyxTGvfD57CiPPrFxYV8VCOq
	yYV3ZxgzYYOO0m25Q13AVvGK6ReIB4K2gyI4lbjxSqBVtApuEu9mDfortwN/dwHRgsEmnB9EwKm
	p/4lKO1K8/LqZqF9mVovsdqxnp2/Z9aSgvXk73nycE+EuZs3P00R7oyHuL8DrXbwe6/S7
X-Gm-Gg: Acq92OFmxzk/aWMCyG0YZgh9bRMAtDCAtyw+Qff7DrotjtReNM0ehhYNmTXPQCQDFpG
	1Z1rA6KbzKRdZeHusMSf+cKmEunRXPZ1IkoSQvBtHfT/BRUG1xHCCMQQzxcL7AiKMyPSUkF28rn
	/s5zxmf6d0ugT9UT6n09R8O43LGWiJYJgQZAe/5G2LooXjEpU27Om5waPbP3w2D50QgMA4NoGjx
	oPGNc4YAADUEg1zfiIL0Uj/Cb6BqQcd9AmO6uiawW/RNUbugb2fMnzFqAdX1HOu44xPgn0WgoUa
	F3q/OmEuh6OrUAdD8nRRVUkBOZv01vcTlE65XhPTSGx7D3i4r8+pd8fbHU5WE7mrg94EjGEz/xC
	EtXHPWl8dCiJYj89gWoLH62iH69TOK7cQfVsTR9n60fWSu8qY4BkUySXhaO9Jhe06ax67KO1J07
	h/CJqSElF4WjAhuEyhtixolaD998iR5w==
X-Received: by 2002:a17:90b:520a:b0:36b:a162:a1be with SMTP id 98e67ed59e1d1-36dd91f0f42mr2277824a91.4.1780384700324;
        Tue, 02 Jun 2026 00:18:20 -0700 (PDT)
X-Received: by 2002:a17:90b:520a:b0:36b:a162:a1be with SMTP id 98e67ed59e1d1-36dd91f0f42mr2277800a91.4.1780384699782;
        Tue, 02 Jun 2026 00:18:19 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91c9991sm1766279a91.7.2026.06.02.00.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:18:19 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: [PATCH v7 4/5] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Tue,  2 Jun 2026 15:17:49 +0800
Message-Id: <20260602071750.526-5-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NiBTYWx0ZWRfXzNFfplVaSo+N
 /ipScmuwyK/KOcrrTitMbENqaI1teVOrBHaNLvGeDumSlgqMPTreFt9/g20q5l7dirON14hc0o3
 w/ynZU/eG6Az7MfcPc19qjbIf3Fq72UstbvygGWz4Ggh8/f4M9P1bn25MMWX1wNKu3290pqo/0F
 okPxjHPjTJ1Hb28R6A4fp2EIxGn+Ev9NvwYkGhLoHDkqPDpKm7VcMQJPviyOQNb6OjGe1pYnX6W
 ixuQc42181qXzPo2EFwy5rsHI3WVWw+XmzZdCrH3SQgPhmTiNet7YW+yb3IXLYtFW1ycg15Y5Wq
 MwMwgIXE6VO99rgb5gpiht6WMgB64D3mhQi+Aq5BnSWc1KmUkkHgOWWKuypN/niegAYqQotR4PO
 LcHN9LDAQXifI27y8OG273Iql6QdwNlYmOLI7qONb8apgcKXFvYK/3+NstTqmI85dm34hj/rIa3
 h5dGfU49ACQf5+L2ldw==
X-Proofpoint-GUID: VMVpLG86FDV-9cTZLfEjGBaxEphvUm-u
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1e83bd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vXPY0jRleWu_0xqwLycA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VMVpLG86FDV-9cTZLfEjGBaxEphvUm-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020066
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110735-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BDC7629941
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
 drivers/misc/fastrpc.c | 96 +++++++++++++++++++-----------------------
 1 file changed, 43 insertions(+), 53 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f46a8f53970d..33be8bed6a0b 100644
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
 
@@ -1419,8 +1397,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	spin_lock_irqsave(&cctx->lock, flags);
+	if (!fl->cctx->audio_init_mem) {
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
@@ -1438,27 +1425,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
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
@@ -2425,12 +2392,21 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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
@@ -2438,7 +2414,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			if (err)
 				goto err_free_data;
 		}
-
 	}
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
@@ -2519,6 +2494,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int err;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2536,8 +2512,22 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
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



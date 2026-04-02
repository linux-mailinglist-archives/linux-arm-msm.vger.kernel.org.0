Return-Path: <linux-arm-msm+bounces-101428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HZJNesDzmk/kQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:51:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 524973842D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 584A030D8DCE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 05:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F85C34D3BE;
	Thu,  2 Apr 2026 05:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eu4yUDoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrZ+Vd46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF3537C11C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 05:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108990; cv=none; b=QYu8vyRM1u52Og8bGN8n75mIPii0YnAIomojUcOM2l7yt7Ibi5m6oAJYQDaPwKl3HIFFu54ISh1JipiSzwYDjywptt7tuOn9sVhZhc51zNN9NGYVNGdmoqnUNN9DiJiSHpQvvojLgvkowz9/TsHhgkDPTz1CMSHHfH7BLkCJe7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108990; c=relaxed/simple;
	bh=X6VY0q9L+uUtnqFcREzObboFHxTVQ0lMp1x19HwGxis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z1sgBpbKWLSsIVxYS+/ajEDw76tQClModCCRq36JIylgmS2ck/ADtRFzM7HP8UsKjVVrgCwaRI+ea5Ubx85l5fifXi3Jugj+NOv99jktaeJAvya7BJUDZlD11u1zFZ5rfXpPhC/SxUVM7dvi34Lr64ujkrle+zAr8/qAvsCinGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eu4yUDoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrZ+Vd46; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M3xws3745870
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 05:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7oB02y7DFV4
	f1UWHYqajk1w575aCaNpMNr02LPqXAcI=; b=Eu4yUDoRtYt7fCso2YhZMhuz9Iq
	WMd1xwGL0ebWGKctydfo25iZKUU66w9s8XmZxv4SUIOqzR6zwMdHy3QVxY1khflX
	pBc6S3OboAI0Au2rvHxWmTbIWuHsayu9nzgi/9ij7hTibffVatkEHctpoRzvirD+
	FNQca2Fj+QLy5iMQ/edMTSszHuIqUawOhbnrkIn5vk7V4cQDRYUpKTXhQdQXp+Rg
	+Z1b4Mz6RgXBSF738Ttv2j1/MhGatNPNwCEp486KixIFa5YBjR7vxNIJTo/YUFkG
	We+SiackFMR2M8rAKsMux8sDulXYD4Pidb7uqAM83yO9pNLylEQ1iCkLY4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324kkgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 05:49:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c646e980bso315880b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 22:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775108987; x=1775713787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oB02y7DFV4f1UWHYqajk1w575aCaNpMNr02LPqXAcI=;
        b=DrZ+Vd4620+EC0DnMZk344EfjnNp49OCto5gZyRHhUbF5Bf92IDMgeBxpdn5fhX5cV
         o0aQ41EDnwbzPbN6C6h4+ZbpiOmDYWnB3hBA7lxg5w3mi6u1f5+a1dX1IWfkU1Sd5wE5
         5mwP2k7fLsBejrkU10FcRX2f3uBGUm9LkPfH8tSZkOV3Vnk9d5vUlrE9Zduu9/cNp7kW
         mi7NqxpR1UK5q56bK/Kh1lWbjZFt5SCUubnM2Z5JV8iA2vEKbNQpGPYOh8rDWn1HYADZ
         zPu1B8Wy/TK+f+uxXAqj4iLy+7Bd0pBaBKGBBKlwSggN72hQZmNDXjq6LGcR4Xz+ArQP
         ZFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108987; x=1775713787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7oB02y7DFV4f1UWHYqajk1w575aCaNpMNr02LPqXAcI=;
        b=HBEFExhYGDREzjoP9FJ8cajj6AW9lV28ue/PYVJPsCjPHJvNhF2sYnpgbl6hdm2jgH
         5bwTw9sGN/eQQLXTJ9UzAuRFxJH5NCqoR2oip/hsMGVn0/2uwxp9b6Wjt46aADNKiy+F
         GWBwoSCsbetUx9u7TUariqGrlvCVRQ9JEOvqJF0jFbzUyOld85SrsjgxzOQFJOUe7qB5
         ePsWGB6+cmFp3WK2I0ccoB/W6nsSZ+zVlXO5uMy8GcneqKdaXfg8Is8FxSyBuAWKcYw2
         jOwINgD5/qfK57H+OdKniy/n4ZEr08PwpCeUPOeDeTWiGudsjvg4E5tRGna671AhMFgQ
         PSyw==
X-Forwarded-Encrypted: i=1; AJvYcCUNuwFKGkDWwe9m+GflWRQVOQySpjJy+kfTPUZNl2ODOvAxaYQzuLtFE/WvT0He9RYjcADWSY2YFVshAa5h@vger.kernel.org
X-Gm-Message-State: AOJu0YxBkpNmLZzASqgB1P0d2JXkJD1tol0z4kBb45vvxoYXvBlHXAzw
	8iUDX1FyD5VH8hT+GLKQw0Gb7m+fHCgYFIOhYOCOCYM+WkvMyBTo4GniuJtqwaoW+BJFHur1jXW
	ag5El/reXNE5GWl83S2kYFjfGG5M/pxNRavsI1tBFtNkTgpHNRi4arVkBDZ55jFK4vq/D
X-Gm-Gg: ATEYQzxuUm5OyQ6gh7Co5IUa9BwsZ0FB52S4iPItGxrN491kJdGoY30d9Z78VKstvpV
	gQC+AnmrnLfPzHYQm7Hsm+DEL3yAqx4r7ERggFPH02TFvhqX62c98BrC/NVLdt6K/juLNDHh9RG
	VQyjNgFzOzyLz0pG14F3hYDk/EfQWRg6Ku8QyHdUhOnoJgvj4Jmg/XciYB/1dh5eYWd0+kA1tsM
	E6J1kSs5OrjUNQV4ZSyVG092L1jAY/FpA8dqZCEut7YTjHvTAwiqVy/MNVOyNsdkcvhyCTLEBW6
	kS4ePvPOMFrAN/Er6ykjKbS+XkLhG3wGiYi5nNCwPBSe8XoqD51Y1MqmA1pvwTi/P/sb7Vz+JPj
	5TVxFjLcGCVPNZOw0zXR5497HeHg9YbmFZob7KcBXrFOnHdG3cNeDMA==
X-Received: by 2002:a05:6a00:1c84:b0:82c:e76b:c68c with SMTP id d2e1a72fcca58-82ce86e2e62mr7119032b3a.0.1775108987077;
        Wed, 01 Apr 2026 22:49:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c84:b0:82c:e76b:c68c with SMTP id d2e1a72fcca58-82ce86e2e62mr7119003b3a.0.1775108986562;
        Wed, 01 Apr 2026 22:49:46 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm2167747b3a.26.2026.04.01.22.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:49:46 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v7 4/4] misc: fastrpc: Add polling mode support for fastRPC driver
Date: Thu,  2 Apr 2026 11:19:23 +0530
Message-Id: <20260402054923.3061925-5-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
References: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fX4SryIvOvk-upAeuH-rUtNU_3X_hqDQ
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69ce037b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=TEHdEMHTk_fMHrPBF0kA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA0OCBTYWx0ZWRfX9zYlNO40wMuL
 fTgUciyxkl6rXG/uLQJZICLyRyfjG+Jh1PRkuDjBjxmwuC1aVTE079zxlSzB/7fG1YvZ4OFabB3
 y8PnDQmAos0geGU2MNYDq8j7b+oXUvKln/L/uU/kpSl6l0uyXMeWrP5uJQ/yP7Ry1XC+fMuldRH
 LSmNbM6T2caiVbMEnzcp4KgJ2/FEbY/M06YiQXyyFBmCKGBPTYkhpAPIke1l05VTYsMcILqJ9Ew
 +b/UYPEMpda9M96Vt36IffnR786kTg9hw//I6egjk4Ts1J9PF2vizZ8sJQmf5aUjpi3Ck1YNERY
 p8FvkBwelGU1jHuMUGPcplOlWeGhCCKxpscBzfQlf9NMR5g0QUI/HT0Xp5KXmyIjf7saQybfJtA
 maYu/vdFjLMnfMZ9Zipv/Ca+mEVd6UeBi/LySMb5hnhdEZavK5GW6wcCQEgk6xBI1rtlbvcgEhq
 HaEkFhRMaZGVuLG+YcQ==
X-Proofpoint-ORIG-GUID: fX4SryIvOvk-upAeuH-rUtNU_3X_hqDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020048
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101428-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 524973842D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For any remote call to DSP, after sending an invocation message,
fastRPC driver waits for glink response and during this time the
CPU can go into low power modes. This adds latency to overall fastrpc
call as CPU wakeup and scheduling latencies are included. Add polling
mode support with which fastRPC driver will poll continuously on a
memory after sending a message to remote subsystem which will eliminate
CPU wakeup and scheduling latencies and reduce fastRPC overhead. In case
poll timeout happens, the call will fallback to normal RPC mode.  Poll
mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
request with FASTRPC_POLL_MODE request id.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c      | 132 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |  10 +++
 2 files changed, 135 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4363e0cc296b..25f385f4704d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -24,6 +24,8 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/bits.h>
 #include <linux/bitops.h>
+#include <linux/compiler.h>
+#include <linux/iopoll.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -38,6 +40,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
+#define FASTRPC_MAX_STATIC_HANDLE (20)
 #define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
@@ -106,6 +109,12 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+/* Poll response number from remote processor for call completion */
+#define FASTRPC_POLL_RESPONSE (0xdecaf)
+
+/* Polling mode timeout limit */
+#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
+
 struct fastrpc_phy_page {
 	dma_addr_t addr;	/* dma address */
 	u64 size;		/* size of contiguous region */
@@ -236,8 +245,14 @@ struct fastrpc_invoke_ctx {
 	u32 sc;
 	u64 *fdlist;
 	u32 *crc;
+	/* Poll memory that DSP updates */
+	u32 *poll;
 	u64 ctxid;
 	u64 msg_sz;
+	/* work done status flag */
+	bool is_work_done;
+	/* process updates poll memory instead of glink response */
+	bool is_polled;
 	struct kref refcount;
 	struct list_head node; /* list of ctxs */
 	struct completion work;
@@ -308,6 +323,8 @@ struct fastrpc_user {
 	int client_id;
 	int pd;
 	bool is_secure_dev;
+	/* Flags poll mode state */
+	bool poll_mode;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -923,7 +940,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32);
 
 	return size;
 }
@@ -1019,6 +1037,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
+	ctx->poll = (u32 *)((uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_MAX_FDLIST +
+			     sizeof(u32) * FASTRPC_MAX_CRCLIST);
+
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1188,6 +1209,74 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 }
 
+static inline u32 fastrpc_poll_op(void *p)
+{
+	struct fastrpc_invoke_ctx *ctx = p;
+
+	dma_rmb();
+	return READ_ONCE(*ctx->poll);
+}
+
+static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
+{
+	u32 val;
+	int ret;
+
+	/*
+	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll
+	 * or until another path marks the work done.
+	 */
+	ret = read_poll_timeout_atomic(fastrpc_poll_op, val,
+				       (val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done, 1,
+				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
+
+	if (!ret && val == FASTRPC_POLL_RESPONSE) {
+		ctx->is_work_done = true;
+		ctx->retval = 0;
+	}
+
+	if (ret == -ETIMEDOUT)
+		ret = -EIO;
+
+	return ret;
+}
+
+static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
+					    u32 kernel)
+{
+	int err = 0;
+
+	if (kernel) {
+		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
+			err = -ETIMEDOUT;
+	} else {
+		err = wait_for_completion_interruptible(&ctx->work);
+	}
+
+	return err;
+}
+
+static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
+				       u32 kernel)
+{
+	int err;
+
+	do {
+		if (ctx->is_polled) {
+			err = poll_for_remote_response(ctx);
+			/* If polling timed out, move to normal response mode */
+			if (err)
+				ctx->is_polled = false;
+		} else {
+			err = fastrpc_wait_for_response(ctx, kernel);
+			if (err)
+				return err;
+		}
+	} while (!ctx->is_work_done);
+
+	return 0;
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   u32 handle, u32 sc,
 				   struct fastrpc_invoke_args *args)
@@ -1223,13 +1312,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
-	if (kernel) {
-		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
-			err = -ETIMEDOUT;
-	} else {
-		err = wait_for_completion_interruptible(&ctx->work);
-	}
+	/*
+	 * Set message context as polled if the call is for a user PD
+	 * dynamic module and user has enabled poll mode.
+	 */
+	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD && fl->poll_mode)
+		ctx->is_polled = true;
 
+	err = fastrpc_wait_for_completion(ctx, kernel);
 	if (err)
 		goto bail;
 
@@ -1812,6 +1902,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	return 0;
 }
 
+static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_ioctl_set_option opt = {0};
+	int i;
+
+	if (copy_from_user(&opt, argp, sizeof(opt)))
+		return -EFAULT;
+
+	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
+		if (opt.reserved[i] != 0)
+			return -EINVAL;
+	}
+
+	if (opt.req != FASTRPC_POLL_MODE)
+		return -EINVAL;
+
+	if (opt.value)
+		fl->poll_mode = true;
+	else
+		fl->poll_mode = false;
+
+	return 0;
+}
+
 static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_ioctl_capability cap = {0};
@@ -2167,6 +2281,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_MEM_UNMAP:
 		err = fastrpc_req_mem_unmap(fl, argp);
 		break;
+	case FASTRPC_IOCTL_SET_OPTION:
+		err = fastrpc_set_option(fl, argp);
+		break;
 	case FASTRPC_IOCTL_GET_DSP_INFO:
 		err = fastrpc_get_dsp_info(fl, argp);
 		break;
@@ -2518,6 +2635,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	}
 
 	ctx->retval = rsp->retval;
+	ctx->is_work_done = true;
 	complete(&ctx->work);
 
 	/*
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index c6e2925f47e6..c37e24a764ae 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -16,6 +16,7 @@
 #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
 #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
+#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
 #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
 
 /**
@@ -67,6 +68,9 @@ enum fastrpc_proc_attr {
 /* Fastrpc attribute for memory protection of buffers */
 #define FASTRPC_ATTR_SECUREMAP	(1)
 
+/* Set option request ID to enable poll mode */
+#define FASTRPC_POLL_MODE	(1)
+
 struct fastrpc_invoke_args {
 	__u64 ptr;
 	__u64 length;
@@ -133,6 +137,12 @@ struct fastrpc_mem_unmap {
 	__s32 reserved[5];
 };
 
+struct fastrpc_ioctl_set_option {
+	__u32 req;	/* request id */
+	__u32 value;	/* value */
+	__s32 reserved[6];
+};
+
 struct fastrpc_ioctl_capability {
 	__u32 unused; /* deprecated, ignored by the kernel */
 	__u32 attribute_id;
-- 
2.34.1



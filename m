Return-Path: <linux-arm-msm+bounces-92868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIs6DzAPkmlJqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:23:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFF613F61B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5B8C301F9D2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 18:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CE313E02A;
	Sun, 15 Feb 2026 18:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JuWDinaw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gy8WGiEO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2C227CB0A
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771179720; cv=none; b=XsS+DOr3821EYmw2OVqTKVEqFW1jsdIiyNo9dGOG2LVRSdGEbpPVd7dibbUh//l/q03zZLo5xAerBfO+56xygZr0IbJtK2oVrI1LZLzSNbWsK3wQTup3EeyAKVGhGutu+QlBDz5EIKVV5yAcOE0Yz2twaI8R5qY+7Z15LmjUVYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771179720; c=relaxed/simple;
	bh=STY/1vpCxJE+Z5mXhfQq3qbVCUwkW8XKChaHH3/w+TQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CSkx2GkBHab3fsziO0oGD3UUnhq2s+uF87TCKO68ucAc5zxAfG42HPlb9+1fEjiwqKugjbuTF25XQ7KSYIFgkceGlJQq1ztnqfCxKbrWUKF/L+0IWPGnkBmxYnd6KKUyR3B6iQU9NwirR5DqfZtLfXJVR87ycOHbrmhg0hNRKk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JuWDinaw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gy8WGiEO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61F2apGT721962
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gGsuTZLqUpw
	Y7hBhRIBjA23F5oruK4sDevnmC00HExE=; b=JuWDinawK4rIemrbhe67N3ndm5I
	CCQm+M1r9uRXN3kY1ano5HhqIdcq3YXaVw+/4lmwFXR6gd/KuEj+9Yxn4fdGCwEw
	h3pBY8bthhkvwnfl7GmESir16JE7KzhmhVF5eI2XtJtadS4bt4zJXU7iUVNTq/0o
	TLREoi1inxSImpYi7zKN7ymmm47004gp16CzvkHOJOHIqSTBUanxRdOo30tS0bvm
	WsvFERx7E11HFNaqqSAJgbpZdQnNZPRRQoduo+WvJvbqSqNDPPnG7XLE/BO7f/l7
	PwIaS2IAUBe5W8o+yqXWMz+1ASeYY2gRodU0/Bey3LeLIHisJB8j2GcmEgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4sjp4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a7701b6353so32119925ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 10:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771179717; x=1771784517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGsuTZLqUpwY7hBhRIBjA23F5oruK4sDevnmC00HExE=;
        b=Gy8WGiEO34Boj3G7sT1xnf3FY0VxRnx4Cn8ovZ4n9NfUdDof7UFYzxCrSlce+Eqlti
         2C9wJy1DOcaSBiVTRV1Bkx7wnlqFqSIKl/vy7+zwxSVc72XafOq6fW/XmcbTFMTxZzV8
         pihs8Mg6A14K2/0flz1IrdtlxbHHPPa1vzavL8z1w6eTXf1uj6Fy0+KHrF6v+/tH01SI
         6ywWCtic2O5ddTXQecWAD9jZV3uZF76XHlpubC9xHak3SCWT0rMYIDxMDwjr5zWgN4lw
         6DZqDJO6njFwOTWWPb3ka8YOIlGgRf3U7FHzStQwCyymBNTwSbIbg2qW/4hr3ZlCuIXO
         JKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771179717; x=1771784517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gGsuTZLqUpwY7hBhRIBjA23F5oruK4sDevnmC00HExE=;
        b=UKPU0SSy5G8jhXiGw2ZPdcOHZDUZ1BI/pE1n0nJwbET7sSA17InoxV426xCzq+n7Ad
         6hG5GhbeGeKEaC5WC7TczZOMBCa7pm7Z8X0qFpFlwfQc3c2xuhAuVFqvD+2hV0Id4waF
         iMGhQdUOHCgi7hhSmCO1lBja60lPPMjBrZwzVNzL9/AY6595JD2tktwh+dE5rEbv4JF/
         yHDxVBVIXyg8K0NP+vRb68Qn0s9em41Uhys6rAEPUbuSc2SaNOoOn07Gwbujic+VMKTo
         FmHa8Oapi4dCCGli+N6MfIi7c7yDGvjlgrM3PE89EMZC1jGnW3ZBdJEzgoWzoOGdA6HT
         mOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrNASx/fwsgPIPqLHuMGd9mDg0ev/9MifaIDNuvK9xOCG4DhwFZNSaBUkVr6vKh+msH/f+mQL+VAJfoSXt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ben1PUoxjECkVLYBnJfUJCz1jv7geOEHK1oNX+K3v91NEA8l
	tk0Rm32RRzjsUIsrUdpUk8MrIJquzCGlAe58/SxQiKhRe3pXu9JgRlzyBAv3kfePhBc9kUWL0pr
	oVBN0Lu5QRxTjnQx6pmJF1+i4EA4A8nkPFmSB74kociq0I8su7bDT0MCuEeIBErUdOhufAxEBao
	cJ
X-Gm-Gg: AZuq6aKzMAxtsdvNGjYS2t+T5qOcCwn+CYb4wVCNTpLc26p//9fb4O6OYmxS3N1oULI
	MMD7M2VP/TN0RIHH9AwyHqlsUf2RZ2J/OwcWGXoAUmWwf6V4cxyMWZxCt6ae50ALRqAzZpuL/u9
	r2lJzoB9Rs0ZxQXQYckY6xtOSDLfLF9CK9n8iZtA4OmIWV23A9P+i8dn1hUrezaaU7hdJZVazJf
	PCAefQSDpuc6+6Z9EKfYjyYiTnZMWp3oVJOZlO1hd32EcfDLJkobc8xjPiW3sFn7dHX/LqPMhLB
	rzjodaNVtTegCpH1iuR6Sn6kZ/NKomRRxGQJ1KFRbXOJ5ANmk0OcQnk6DTdcGysHxnHFMkpRnLr
	yTXefE7meee7SEJUHN4VRhmYnQChGLUpv88T/9NAc7DID2gXaSep7fg==
X-Received: by 2002:a05:6a21:7a97:b0:392:e5eb:f0a with SMTP id adf61e73a8af0-39483a3c323mr5039725637.75.1771179716717;
        Sun, 15 Feb 2026 10:21:56 -0800 (PST)
X-Received: by 2002:a05:6a21:7a97:b0:392:e5eb:f0a with SMTP id adf61e73a8af0-39483a3c323mr5039711637.75.1771179716098;
        Sun, 15 Feb 2026 10:21:56 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e537desm17425381a91.4.2026.02.15.10.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 10:21:55 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v6 4/4] misc: fastrpc: Add polling mode support for fastRPC driver
Date: Sun, 15 Feb 2026 23:51:35 +0530
Message-Id: <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NCBTYWx0ZWRfXxZDd0V9GBqeU
 m+vhx3pkhhSm02ubSX1eNs+4b4UzUUenSpdkxv/Xv6SwjsSRZsOq5sjfN+jb1Ei1nnKVqD7Npjo
 UXY/Zj4P+4+t5sXt6mM1mP1R1uBAX3q1KGjaJQuyIFm2T+7YKQeghpxJn8mT+K4x+G/jiplqE58
 McjrVr0GphdZ1V3N9vn4J5lmJYwPnOaT5FvvXjo6/fWkkR5+ol4rF7uNthrk6OEOel937gAUZM3
 /2UhdkxPIfIj0TX6EC2noh4hx36alG3cqzze2NPulHLeVHw6FR1SMSyZUcd0b1yWjl/vRUf055r
 BGpGh3MwRsXbc5RtykxuwLwLI+qruc13+H+CSliDT2X/uRMyLzsJORxs1DhLPqw2+6WENKU2FD2
 jR5AU/BLELQ++x/f0/Q4zrTXtLpyuFbHXT7C3DqSmCiFv+OtQKTD0HpUu4U7D/IOY6ct94qcQOu
 ZaFgtkqr9SZn7ue7KLA==
X-Proofpoint-GUID: UwYBoxtK9k0EFl6GGgvt_tH-peRdU1JL
X-Proofpoint-ORIG-GUID: UwYBoxtK9k0EFl6GGgvt_tH-peRdU1JL
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=69920ec5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=TEHdEMHTk_fMHrPBF0kA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150154
X-Rspamd-Server: lfdr
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
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92868-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EFF613F61B
X-Rspamd-Action: no action

For any remote call to DSP, after sending an invocation message,
fastRPC driver waits for glink response and during this time the
CPU can go into low power modes. This adds latency to overall fastrpc
call as CPU wakeup and scheduling latencies are included. Add polling
mode support with which fastRPC driver will poll continuously on a
memory after sending a message to remote subsystem which will eliminate
CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
request with FASTRPC_POLL_MODE request id.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c      | 142 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |  10 +++
 2 files changed, 145 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index e935ae3776b4..c1e67dbacf2c 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -23,6 +23,8 @@
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/bits.h>
+#include <linux/compiler.h>
+#include <linux/iopoll.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -37,6 +39,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
+#define FASTRPC_MAX_STATIC_HANDLE (20)
 #define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
@@ -105,6 +108,12 @@
 
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
@@ -235,8 +244,14 @@ struct fastrpc_invoke_ctx {
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
@@ -307,6 +322,8 @@ struct fastrpc_user {
 	int client_id;
 	int pd;
 	bool is_secure_dev;
+	/* Flags poll mode state */
+	bool poll_mode;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -924,7 +941,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32);
 
 	return size;
 }
@@ -1020,6 +1038,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
+	ctx->poll = (u32 *)((uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_MAX_FDLIST +
+			     sizeof(u32) * FASTRPC_MAX_CRCLIST);
+
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1188,6 +1209,75 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
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
+				       (val == FASTRPC_POLL_RESPONSE) ||
+				       ctx->is_work_done, 1,
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
+	return err;
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   u32 handle, u32 sc,
 				   struct fastrpc_invoke_args *args)
@@ -1223,16 +1313,26 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
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
+	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD &&
+	    fl->poll_mode)
+		ctx->is_polled = true;
+
+	err = fastrpc_wait_for_completion(ctx, kernel);
 
 	if (err)
 		goto bail;
 
+	if (!ctx->is_work_done) {
+		err = -ETIMEDOUT;
+		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
+			handle, sc);
+		goto bail;
+	}
+
 	/* make sure that all memory writes by DSP are seen by CPU */
 	dma_rmb();
 	/* populate all the output buffers with results */
@@ -1812,6 +1912,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
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
@@ -2167,6 +2291,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_MEM_UNMAP:
 		err = fastrpc_req_mem_unmap(fl, argp);
 		break;
+	case FASTRPC_IOCTL_SET_OPTION:
+		err = fastrpc_set_option(fl, argp);
+		break;
 	case FASTRPC_IOCTL_GET_DSP_INFO:
 		err = fastrpc_get_dsp_info(fl, argp);
 		break;
@@ -2518,6 +2645,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
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



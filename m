Return-Path: <linux-arm-msm+bounces-104052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHxwOO+T6Gl9MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:25:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 860D7443EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2561B302E98D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2723C3436;
	Wed, 22 Apr 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gm926Zw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVEabfMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC663C3BFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849879; cv=none; b=NS4tYwwsIcdzIAvl02FLRADE7PSGlXUbpvixyMW1OGRXJ/wB/wNmatCmyP429VzZ7wVCW/P8k9KtqW6fJWCyT/35pXYMQdlHEfEtnJO2H4DNb9kBkFXGQa9QyJqfyPirFZGSp93+bjftxj3dA4ow2Z/UyHctWU3HYS9eFIl7Qec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849879; c=relaxed/simple;
	bh=itn53tNkzwYhiQqg+IkczKrgxHVPJ46JGHM0lImXrGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cZrj50oNMFPrcjCIlvzQTcsL7Bb8kvWgmIMeL4lenbczLJ4HkQf5fN9/tGdOf4wjDyvvRjpSNT3qDP5chdjsQSkp2I8zetUCllNsIGnPeLWNvqoTEUiYqXA79dPj2OX4TtvLs/wzErSine1EQtcLGQcs8PuJBX0l/ne1pP86jXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gm926Zw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVEabfMw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99aUT1444300
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZQDUrJEV+z2
	kPQWitWweHCXDKrk3VVOPqd9K6vCaXR4=; b=Gm926Zw764GygkemnEbtGO5aejR
	DgsXAi1c5fwn3g4FB5qjHgMaxMs2cvBK8Lcj9dP5wVskZBRf+AdQ8rB1yO7Cx4CH
	JWXOs24WX5RBEorE0p24yrRhG7P8guGjN/tUpjSc7n9lwcOLlwvqD1TmbZV83h30
	suea1Hv0Z45b8Qa8ify7pzP2HJBXuzzRTHJ8hAh4TcwULMkryfGkdzEKZqyiePTh
	MN8zoID2Ic5Bcxs7qO9w9JHCADVetQ5WYT22RLlGsY6FjiWHvkRrMB6+LLhprPld
	dMP7mBpbCcufZUd4QoW8818A2XVa+6mSIOf7HQp1XDi9WOSAaidnUp4hLZA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftmd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so5307015b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849874; x=1777454674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQDUrJEV+z2kPQWitWweHCXDKrk3VVOPqd9K6vCaXR4=;
        b=HVEabfMwjDaiOJlRNe/5VpAS3V9TUi3vxZj0oeMUmwLI8bMRM2BB+eKn8Ov4FNxqRU
         YcpegpzcxADbXCeczYgNeaAoLhudoCSR8H5xmKfTq4adbQgYHf+a7DKZ4PpeRbHncHKJ
         0OCi1ngOX9cpJcU34+gcRDBn+aSrRz0BP6q8FImpyuws/fkDw2NT60Zm+zLUtemcbR6o
         zR1DEjm1trxyA2J3K4skNSyLvUIRoGgN5LItDG77fBHDlXrdRrErDw3jZ6RRPLJ/KMLg
         L63QjMyFlPjRy+IcnC4lk7ZS3NNSDjDbCUHmK2YCXbp1oflxPbGcUDB15hs7/qGE583s
         +7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849874; x=1777454674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQDUrJEV+z2kPQWitWweHCXDKrk3VVOPqd9K6vCaXR4=;
        b=n7AAoj50FewJqFQ13G1j7uHxNy4P2JJNDDIIA4EPjv81TliwdGr+Lx/gl5I7hgkxoL
         Hw35VQzFGJhtmF901i6843iMwtdhYQWZeGmJvM+94ory9yUUQBhRgzaQtzuGjCUutVqC
         5Xf7qaVkg8F15hCVampiX3ah//tstrVSBMzAInpJoNugZJu7qZ1emiMT8ledoZ6yrfPE
         KNu82pJaJ0fJZW8ySfZiOXBxORBg73Mplm4x3GOTDWa/kl0m12OF7hHIK7QzBFuUGoG7
         4EDYVgomos3bUQfme2Au2iSWlztAU/ZWm37X2WUNW0bb+58ivtmq8UDraJJnH/aQLy4g
         eYUw==
X-Forwarded-Encrypted: i=1; AFNElJ/tR0z5gDJsumOsnGs0n29l40BWTVqmOua+TuPUmm1e+6upV9L56VrBtTCetyHhRVzOnYvAyDrCpPRVlk2f@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3PdYQ7+d/77gGz7Y08TKL6m93fpkEzWVvtPUtYyU80mDea+bC
	oImGrAf8jNGwsrVngPOAB6SjtD9X+gfWnOwZecLdszFoIfDrZf3t4SJhcT8cgjfg8tGZuDvbUWj
	irl0Q8qQGUnZml68pDEjmd07nYWnyUBxCJvhum3shuUL11r9TgGAvRe3o1F7l4C3JOO+d
X-Gm-Gg: AeBDiev75omizg16zzE7E7lzAMLTBxZs+F1NL9tB6o3y3xjDyS8xAs/3SlM4M6D8TaS
	0NfXelJ8+rDAW/EH25Jf7jUjc+gJhlLNcGioMak2sb5Waz4hMXpkmWpDjosJXQD/m4qpqPvupU0
	5YsKjz6kVjMA3JDPoa9ApN9/PSPgeP21b/g01YrE9CIMop+dutj7oNKC0bGdMH0tsJx/Jg/OpoX
	jA5ZPjL7IW3jbZHmWj2f1OzA7tTD8nPlWr2R4wnD9G91nt9v0DuEIrpTsE69iOhf+o8MD1sXmPi
	wlt70WDFVbdop5DRPTe6Vklwcwb72oiT3ULyCckJaevwYMVwYr5EZSZP0VXzhD0oru0se58cAJ8
	rZICaxFSrywrmpLODWygSgDzsIjAR3mAOFqvaK1hVl+yeR0l/QeqSNelg4UN0MPHq
X-Received: by 2002:a05:6a00:3491:b0:824:a635:4181 with SMTP id d2e1a72fcca58-82f8c827148mr22551879b3a.15.1776849874504;
        Wed, 22 Apr 2026 02:24:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:3491:b0:824:a635:4181 with SMTP id d2e1a72fcca58-82f8c827148mr22551830b3a.15.1776849873992;
        Wed, 22 Apr 2026 02:24:33 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb38ddsm15778576b3a.34.2026.04.22.02.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:24:33 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: [PATCH v9 4/4] misc: fastrpc: Add polling mode support for fastRPC driver
Date: Wed, 22 Apr 2026 14:54:09 +0530
Message-Id: <20260422092409.4107093-5-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
References: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RGHXtbUHh5t6ifFsBxUTUNZWEh90C7ML
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e893d3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wn3mZlvuqqDVgct7km0A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4NCBTYWx0ZWRfXyCOtdI7L1SRP
 TpxeQDmEO5yzEhOOxhuf6k5KSIbqxCi3eY2/pDqY0IpYMD9e1rpaAarY3457GgwpA1PGkj1ZU7k
 6aibnQmAKuO1bx/Abu68ofT+gpmUZM0cZoRBdZNz8zzLKpKBSKNDsDS6UaS4xV2tmpHtE9/6eXO
 c1QBtx4yAHwcj2AmWrPvkSp4zw0lBr376o6rlvme+TelPgkdvN/mmDdRPJA8S0nuT6XdEm6u5a4
 EAB9EdKDZOst0jIGkZLJ/LaFxrbMfY7tSSV6bd/E998paWe9mtkPbvMTYzamc8zEeiBtb9Ykspq
 B94Ic3uuaLu0QWbv6AjWAXfc5IwOS8Ipukum+XnbF4yVwBG5ZLCB0DD+NbkRzrK+fLrl3Xly/54
 PFvllq3tVvNUsThCKUZ/ctxIhBqU4/HeLHsGq/kEwR+a01fGqyAa2jvhIYhiDNWTJkL1BmbNEOI
 fLt21kAiQwup40aXKWw==
X-Proofpoint-ORIG-GUID: RGHXtbUHh5t6ifFsBxUTUNZWEh90C7ML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220084
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104052-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,quicinc.com,vger.kernel.org,lists.freedesktop.org,arndb.de,oss.qualcomm.com,gmail.com,kernel.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 860D7443EC0
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
 drivers/misc/fastrpc.c      | 148 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |  25 ++++++
 2 files changed, 166 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c4a3547a5c7f..7445e2aa3c3c 100644
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
@@ -38,6 +40,12 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
+/*
+ * Maximum handle value for static handles.
+ * Static handles are pre-defined, fixed numeric values statically assigned
+ * in the IDL file or FastRPC framework.
+ */
+#define FASTRPC_MAX_STATIC_HANDLE (20)
 #define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
@@ -106,6 +114,12 @@
 
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
@@ -236,8 +250,14 @@ struct fastrpc_invoke_ctx {
 	u32 sc;
 	u64 *fdlist;
 	u32 *crc;
+	/* Poll memory that DSP updates */
+	u32 *poll_addr;
 	u64 ctxid;
 	u64 msg_sz;
+	/* work done status flag */
+	bool is_work_done;
+	/* process updates poll memory instead of glink response */
+	bool is_polled;
 	struct kref refcount;
 	struct list_head node; /* list of ctxs */
 	struct completion work;
@@ -263,6 +283,7 @@ struct fastrpc_soc_data {
 	u32 sid_pos;
 	u32 dma_addr_bits_cdsp;
 	u32 dma_addr_bits_default;
+	bool poll_mode_supported;
 };
 
 struct fastrpc_channel_ctx {
@@ -285,6 +306,7 @@ struct fastrpc_channel_ctx {
 	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
+	bool poll_mode_supported;
 	u64 dma_mask;
 	const struct fastrpc_soc_data *soc_data;
 };
@@ -308,6 +330,8 @@ struct fastrpc_user {
 	int client_id;
 	int pd;
 	bool is_secure_dev;
+	/* Flags poll mode state */
+	bool poll_mode;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -923,7 +947,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32);
 
 	return size;
 }
@@ -1019,6 +1044,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
+	ctx->poll_addr = (u32 *)((uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_MAX_FDLIST +
+			     sizeof(u32) * FASTRPC_MAX_CRCLIST);
+
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1188,6 +1216,61 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 }
 
+static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
+{
+	u32 val;
+	int ret;
+
+	/*
+	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll_addr
+	 * or until another path marks the work done.
+	 */
+	ret = readl_poll_timeout_atomic(ctx->poll_addr, val,
+					(val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done, 1,
+					FASTRPC_POLL_MAX_TIMEOUT_US);
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
+	if (ctx->is_polled) {
+		err = poll_for_remote_response(ctx);
+		if (!err)
+			return 0;
+		/* If polling timed out or failed, move to normal response mode */
+		ctx->is_polled = false;
+	}
+
+	return fastrpc_wait_for_response(ctx, kernel);
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   u32 handle, u32 sc,
 				   struct fastrpc_invoke_args *args)
@@ -1223,13 +1306,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
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
 
@@ -1813,6 +1897,33 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
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
+	if (opt.request_id != FASTRPC_POLL_MODE)
+		return -EINVAL;
+
+	if (opt.value) {
+		if (!fl->cctx->poll_mode_supported)
+			return -EOPNOTSUPP;
+		fl->poll_mode = true;
+	} else {
+		fl->poll_mode = false;
+	}
+
+	return 0;
+}
+
 static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_ioctl_capability cap = {0};
@@ -2168,6 +2279,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_MEM_UNMAP:
 		err = fastrpc_req_mem_unmap(fl, argp);
 		break;
+	case FASTRPC_IOCTL_SET_OPTION:
+		err = fastrpc_set_option(fl, argp);
+		break;
 	case FASTRPC_IOCTL_GET_DSP_INFO:
 		err = fastrpc_get_dsp_info(fl, argp);
 		break;
@@ -2323,6 +2437,7 @@ static const struct fastrpc_soc_data kaanapali_soc_data = {
 	.sid_pos = 56,
 	.dma_addr_bits_cdsp = 34,
 	.dma_addr_bits_default = 32,
+	.poll_mode_supported = true,
 };
 
 static const struct fastrpc_soc_data default_soc_data = {
@@ -2331,6 +2446,22 @@ static const struct fastrpc_soc_data default_soc_data = {
 	.dma_addr_bits_default = 32,
 };
 
+/*
+ * Older platforms that use default_soc_data but whose DSP firmware
+ * supports the FastRPC polling mode.
+ */
+static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unused = {
+	{ .compatible = "qcom,qcs8300" },
+	{ .compatible = "qcom,qcs9100" },
+	{ .compatible = "qcom,sm8450" },
+	{ .compatible = "qcom,sm8550" },
+	{ .compatible = "qcom,sm8650" },
+	{ .compatible = "qcom,sm8750" },
+	{ .compatible = "qcom,x1e80100" },
+	{ .compatible = "qcom,x1p42100" },
+	{},
+};
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2397,6 +2528,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
 	data->soc_data = soc_data;
+	data->poll_mode_supported = soc_data->poll_mode_supported ||
+		of_machine_get_match(fastrpc_poll_supported_machines);
 
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
@@ -2521,6 +2654,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	}
 
 	ctx->retval = rsp->retval;
+	ctx->is_work_done = true;
 	complete(&ctx->work);
 
 	/*
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index c6e2925f47e6..63346e27d5e9 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -16,6 +16,7 @@
 #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
 #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
+#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
 #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
 
 /**
@@ -67,6 +68,24 @@ enum fastrpc_proc_attr {
 /* Fastrpc attribute for memory protection of buffers */
 #define FASTRPC_ATTR_SECUREMAP	(1)
 
+/**
+ * FASTRPC_POLL_MODE - Enable/disable poll mode for FastRPC invocations
+ *
+ * Poll mode is an optimization that allows the CPU to poll shared memory
+ * for completion instead of waiting for an interrupt-based response.
+ * This reduces latency for fast-completing operations.
+ *
+ * Restrictions:
+ * - Only supported for USER_PD (User Protection Domain)
+ * - Only applies to dynamic modules (handle > 20)
+ * - Static modules always use interrupt-based completion
+ *
+ * Values:
+ * - 0: Disable poll mode (use interrupt-based completion)
+ * - 1: Enable poll mode (poll shared memory for completion)
+ */
+#define FASTRPC_POLL_MODE	(1)
+
 struct fastrpc_invoke_args {
 	__u64 ptr;
 	__u64 length;
@@ -133,6 +152,12 @@ struct fastrpc_mem_unmap {
 	__s32 reserved[5];
 };
 
+struct fastrpc_ioctl_set_option {
+	__u32 request_id;	/* Request type (e.g., FASTRPC_POLL_MODE) */
+	__u32 value;	/* Request-specific value */
+	__s32 reserved[6];
+};
+
 struct fastrpc_ioctl_capability {
 	__u32 unused; /* deprecated, ignored by the kernel */
 	__u32 attribute_id;
-- 
2.34.1



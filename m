Return-Path: <linux-arm-msm+bounces-103286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM4ACnV332kATgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:33:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 878FE403D74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01DF3314CCC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A9937B028;
	Wed, 15 Apr 2026 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKAS8NFI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+bfmRZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A16F367F3C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252356; cv=none; b=WJam7H2TEDBD8Fynqc52ysXen67qeiDeFjMgh+EpMytHFR+Klk7yEt8j+vhdwW5jiThMzOTlMJVNSZGXR/uA+RtyPMk3pgkr1dAIJyy7JA2qkYH97ozFjXGegX0Upu9t3v8lGhfIQeArqOsDf56r4DBsPLm0cDaxjQT9Kmrt/zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252356; c=relaxed/simple;
	bh=9NtfT/xeDbpPS5zh1vRL//BeR89KETtiI2+PapMo87g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mPqnQqJBGbeH2lPmMxK3faTII5x7AsE4rZtavHNktC0gNtsd4njUR7pI1MmJFHJVqJotdUE4jAKZM/u98YKZ+gGqumIDFv96gIGC7rbOtamaAax5M/47AYjFDeLvAPkLCrkl8W9w6DrYvwD779cokRkJgujhdqkCIQs1+fMbKtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKAS8NFI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+bfmRZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8Nn5X2972602
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s16jXTEpX8d
	jsndW4awZ3LPPzFOFOS9R2ZCv2wz6JVs=; b=aKAS8NFIgE6foBgEvADXwMMke6k
	K7AF8nzOprGnb6nCSks9qWm1n4DPYI1Ndpy6aDSYaUitylYGJ+wFGEM/CE2ZTgWu
	5hCzovLcNVZWXtJqEDNy1zKFwu7oxKlatPSFPs18ulksHZHadLCreG3/sOBzEuIl
	xaxX1ePdBicL2UuxovEzRUhKanAOvonAPqUQzx+iIKNDCqbTJNESuhwM+FMFVr1m
	1HNIuGeUGhsH3rWA45c1ftGuYWX5mc29Dg4JClCpAJH2AiQqwaMDQ6tuCct3wgq1
	5DddXwj1RFzsKoX+qlIkETJNHugpnBjFrmxHXFqF3c+hnfvE3TJ03N3MKqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74g8k47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4530a90fdso77894715ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252353; x=1776857153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s16jXTEpX8djsndW4awZ3LPPzFOFOS9R2ZCv2wz6JVs=;
        b=V+bfmRZ8oBOjHcAW7H0aYRy03DdD5z9sDaMsbHDxJjYrSAjzH9v2H1Y5/xSZyflYcb
         28E8wfoHBuHYiaJgpKZ9Mgo5rYJ0MdN9A8y7JvMl+52hATcQbcrg2NdOlv5qeVf6QMYT
         8iYjWvAAt1GuXdLd7a84HA5wTptFNq0mjdtI2OD6Ay13dGGh7fJFrSlrzT0mJQSzrL70
         PuzvEw0c32aG7zP3Kkd4waAvzlOb/dMqz30LO3ArSbRZ8YCaAa929RUWRkZrgLPeImDp
         GqaPeD8uOg75xgKQqSgvpTyGs8LbwnGHdnE3Hq1B7MifmhnL/tD40OudqGw4wLjrlseH
         S37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252353; x=1776857153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s16jXTEpX8djsndW4awZ3LPPzFOFOS9R2ZCv2wz6JVs=;
        b=UXkTh5kBhiUaVKBliuRpAjDZ8y3qm24MCx47qJVHlTfoP6fBxIgWH/i4Gt2Kz/fv9I
         eJeGt9VLgtuOvjKi7BvPt0vCDXCbHc8GIctg4I0vE/UxMlXLA2Cm2vkMv4dO8Wk2o5Z6
         PFn0pdVI5Zr2cOgWIXVeE61leSInW4YFRkpSateY7meN0HLy3adsuOqY9UDHDvCwY+6R
         Hbo3oGtQpDZ2d8FKwJ/EdVO2Ixvjixkgg7xwQBmzTtQvZxr2ZPyT8SjZK71bCA7tsQXz
         N+6djcUA0POYFsPg9oiMhIwuRH44cCz3fc2YSGgIDyxGfAgqyEHcNQ808yD6zslqeVij
         G+gw==
X-Forwarded-Encrypted: i=1; AFNElJ+9+wSToAhYgNCy74eTsulQSaCwDjdEwUrLDTbRVY4kay95EjvdSh5YPiMHWfMRNi/6JYCuPr+vaJLuFvoB@vger.kernel.org
X-Gm-Message-State: AOJu0YwX4am6ttjeRCz0xiP5UVO012Bg7tQxqGhoCG/J2dh9uKkkvZgm
	KoGNNBpqOCPSzhTzhLYVo/RTTsI9SlOBJj0BbqvfvROHtvevmGXRws6P2RE2zT9C/BNilGzyVUW
	P+0bqvhXSBeXvIN8VfPsUeMJBcSpVlLpIciWjtQKuTNWUMOTJTufDWVROY1ZtSl9LAlR0
X-Gm-Gg: AeBDievW9kfhSCLk9YAoB+eO96NICo0uDdI5lyDXZ2xxEgkJuvG2X/v4yyn/GNtuLN+
	iWxRqE27ew+SyTnkjAAP4vKFzBqAu6/W0J4zXurif0VwJLixVIrQ+Te+8gFRILV0kok8fD59UYy
	1KZN+dVsOx/bK+yjc+0kK8ZfS3Y3Kcq/CZwzBsKRQzX+LJ7QdOy54hir5KRIohCLhmjEMt1qw3C
	cB9l7SzwY0QLa75E2eL1N/VA8QbpZWynwCTcvaXH5cXPwaKkMABPpybNVljiwXO46BPFx6zGFJ2
	gtXh/8XhWeWbXl9DGb45Zl4RcDLx/Hw4sgQUelu1AeiUxi1k950Tk5J+79CD2nEHK6N8r1sqACg
	lFYMsJ4z3fr9TZwmx5h4nBQ9JvraRuA8/0az+fJfqctHXpPpxNIXnkKq9tqOTnMv/
X-Received: by 2002:a17:903:2c04:b0:2b2:ddfa:3a1e with SMTP id d9443c01a7336-2b2ddfa3e92mr183732235ad.30.1776252353030;
        Wed, 15 Apr 2026 04:25:53 -0700 (PDT)
X-Received: by 2002:a17:903:2c04:b0:2b2:ddfa:3a1e with SMTP id d9443c01a7336-2b2ddfa3e92mr183731865ad.30.1776252352515;
        Wed, 15 Apr 2026 04:25:52 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b6fd8sm26794325ad.73.2026.04.15.04.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:25:51 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org
Subject: [PATCH v8 4/4] misc: fastrpc: Add polling mode support for fastRPC driver
Date: Wed, 15 Apr 2026 16:55:30 +0530
Message-Id: <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
References: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfX7sUgLAXpc6th
 gbkJLpe91fgbZzIMRPtUvZceBB6V2W+9432t8bFxnMv6psXcl+dr4lsjZ2xAqazzQInP78ji56i
 P/NN/lFGGoW5iYhq8cJQlIOvdJ+jMuJRwLFQJIy0MmakPOeSzxZMe7w7kD1SzWlp7jbQYCqpaMX
 PJm4k2+zPjAlPEBUtcB8tS7N71SYj/ZsdTS7T4TnWEueOmjCQQ9ZsGVOI//En8TNpCnAkFiAsX6
 mVQqb8BrTzx2g1aQCyFlLLRo039MxueD2mLJq3Pei4mTouO4d9T/WndHdtlR+4clBGggmCUmyxd
 mz7HAil6KXol7hxCemeGbXXVkx3N/Q3j2APiFLz1UN8Mi1tZRKHXFEqZkolWhVNJ6C4yq9PeGxr
 M0nzT1q4DptbmXmMwvCDiOEt0GvBU2Mu6OF5ywY2BD7j/wjjkwU7TGp3UYN2EXXZuq5VbPxQfBl
 dvWWPY/2D1IAtx7HfSA==
X-Proofpoint-ORIG-GUID: ycSLy90InkSmialR1FFixu17BbWZjUTj
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69df75c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=TEHdEMHTk_fMHrPBF0kA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ycSLy90InkSmialR1FFixu17BbWZjUTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150105
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
	TAGGED_FROM(0.00)[bounces-103286-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 878FE403D74
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
 drivers/misc/fastrpc.c      | 137 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |  25 +++++++
 2 files changed, 155 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c4a3547a5c7f..5311a4ba4bb7 100644
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
@@ -308,6 +328,8 @@ struct fastrpc_user {
 	int client_id;
 	int pd;
 	bool is_secure_dev;
+	/* Flags poll mode state */
+	bool poll_mode;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -923,7 +945,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32);
 
 	return size;
 }
@@ -1019,6 +1042,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
+	ctx->poll = (u32 *)((uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_MAX_FDLIST +
+			     sizeof(u32) * FASTRPC_MAX_CRCLIST);
+
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1188,6 +1214,74 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
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
@@ -1223,13 +1317,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
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
 
@@ -1813,6 +1908,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
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
@@ -2168,6 +2287,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_MEM_UNMAP:
 		err = fastrpc_req_mem_unmap(fl, argp);
 		break;
+	case FASTRPC_IOCTL_SET_OPTION:
+		err = fastrpc_set_option(fl, argp);
+		break;
 	case FASTRPC_IOCTL_GET_DSP_INFO:
 		err = fastrpc_get_dsp_info(fl, argp);
 		break;
@@ -2521,6 +2643,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
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



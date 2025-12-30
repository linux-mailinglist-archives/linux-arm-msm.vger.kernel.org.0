Return-Path: <linux-arm-msm+bounces-86917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DEFCE8CB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 040DD3031CEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 06:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7DF2F28EF;
	Tue, 30 Dec 2025 06:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpK0g9Mi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YB5JsUgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA282E973F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767076133; cv=none; b=mVEKuLWOc+jkoR84TARxulrGi74JXXeiBGFJVC5C7si8hgVJcmLaUNemazG49zcLsyYRfaopNkJ+P9TcJCF4X4lURRcAyKj/cHofVyByaZD04XmNKWbLjWOSrYNvtoVEg+k0gSlNeZ+RfYwThAzjsA7Z7jgVsaoyNKatqt6LlWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767076133; c=relaxed/simple;
	bh=DsrVqkzoOh91LhP+OVCHGfehP1lnEGNGugMDlR9RqUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KeA4YJ9DCo+z+mz0Vd7HZL9tGG6yQanj8OQKkLfUvJF/sDT++K2BfkSwOppDNg27CAyBlfMxoobxwP7qyBkh7nlpfeJc5BEsisdxaFpu7ZZuf9BfItT3Fv/n4YmXVm/MTC90VTVuA2z9C94F2+wPIDq4C+IiLICHkRYsNUXGAqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpK0g9Mi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YB5JsUgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU5RRbD898836
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F84JmaDZwv5
	YExecCbKuY9iZ3gotWGmX8OZPfkyrBJI=; b=YpK0g9Mi0onHuZNwtMSwE47KpSq
	UVnWyyVTHk3rtybu+voF815jgG3m5VmTjex/LbHojctwqoeDtSjvijn5AOplRX9P
	8rekp2d5+dWsuvU4xccWo3SxHGGykCRSRkv5jBsh/4VB7+O0l+BzzpX1vKOS0jqN
	Ls5G1ns0INMFUYCO19lyM+UcgrXhTxekmpuCoIAwgN5wO8C6LRYO/qH7BYs1yucE
	fBr3i2v9pUGCOIv3pHNByJG2yzvZopRp7rqVmEzKiLnIhXfgzgT87ZtzrKqTeTq0
	HgFz8mektw31uVvBBM1dsGf1lldyRlXWwzgdZJ602uqrx+PwpNswUnC7K8w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky049b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c2f670a06so12535155a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 22:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767076130; x=1767680930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F84JmaDZwv5YExecCbKuY9iZ3gotWGmX8OZPfkyrBJI=;
        b=YB5JsUgi21XcCWjxknbDkqsplqs4WrxI/bsdwqfoImiYC92mjL9PfY5s6besRoBdg6
         VqoFLoL8oGiKjGDDcLVn4jI3Sp6fdWoBk2CzbY2ud/DtUfjqzKLM149YfbP6DC0lUu6I
         OSSbhGPKgYvUyKiALVK8Mj77AMv+yCcG+L6qABUK5+Y7cvMMfOvOE9WNjemcBI9EGpqe
         oc7X6Ouo5u+Ko1clQjEcGO8WV/96sJQHCcF/Bsmdu8tunAvW9QOS6FWdP+o2shagcxpE
         +b3csazlaj2ICUdZvapPSU7ZpSmyMQVXKMNTegxzVA320t1F8ooglL4yVH9LD0DNUiyD
         ZNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767076130; x=1767680930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F84JmaDZwv5YExecCbKuY9iZ3gotWGmX8OZPfkyrBJI=;
        b=ZorOqXcmm4+1tlj9je4XLa3ytaEWFB6ARupbKMeRt0mrgXX26vQkl3zOCIcjSI1Rkh
         xtnkkVqt/ndEQqkzOuOkFa7SCRu/441sC/VEK4EImDP2WJim05Wircir8jlRbRrlK2b2
         UOHAoo7PdC8D5JwVpzhC6CWlB+G6QuzVf/oelyFF18KZsevtLoMEMHA0c3jE8o9u5KVi
         oLxMKvaonUKfYBL2K21nfbR/RyNAP1SMIfvGHmDk2i8cOF68Fd1KhdUxhG9J3HpNbakC
         reNXmOGJUzcTEKO+z9NfMIPKLaYWJuG6VgltIsIn61hCAETI30/2HPr5c86e1FcG9//j
         t9cw==
X-Forwarded-Encrypted: i=1; AJvYcCXhCFdKg08dxXj9bX2COP10IlrF5orYh1HNFyq1kLJQWGcHIC06erGrujnbYC2ZRHsndasN6UTwBq7PsUSi@vger.kernel.org
X-Gm-Message-State: AOJu0YwZStAQ79bQw6GTu3NhP9XNxj6R6dxKqdXi282VmRAcDFbBpTTO
	+Mk6etEs6XVwJsxi1LDDAF7irPofVrLxUgy3UN+13MhpCp9GqMQd9+zkw8c//E00pj6uL6ZWNwc
	qG3D+rKKJbOtNjk7uI0MOhw6ODeUiR/zlT3jw1PjPoQMPaXYx/6eoDJipaJERSpAMTtec
X-Gm-Gg: AY/fxX6yg1zcDzQRvk4QRCz6eJR5Wpy2+9AhEeGpdmFB819CcVIDtI9a9sjOCLVfO2+
	iRKFFKitREimZNxyvpWOg5WkuH7S2cxPjiSGf2g0Ad62JdoctloV9jzAlj5oNRDkVizInC9x9I8
	G9ImBVtyNZb36vCec03dz2guqzT2w4w7pTcDF1WTt3eXrG8enLsVstp05UD5kG6XHJf66/Zq3IA
	wl+bFFQQjnqJQyrxEjNZbHDexinAgTL3JhutAZvYHViQZMxqHHmNKi25R58PSgq1UqNjVEGLdNM
	YehKtdppAP/BEPJz46E9LKhxbDiDCgEOePBFwJ9CKupjCPTvwmHOpOWiZTHN/3A66RlBC9jI462
	sERkajGt/xKqOCWPi3HAFEln2SWpOlI21sq35btJbrA==
X-Received: by 2002:a17:90b:5804:b0:340:2f48:b51a with SMTP id 98e67ed59e1d1-34e9212a47fmr28583228a91.15.1767076130028;
        Mon, 29 Dec 2025 22:28:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxN0SX4cLAXGqd3srmGONGCl3+tBbwB9OFbYSPKDNg38CUgZeOEQmctAmg3LWdfmj+UDwoRA==
X-Received: by 2002:a17:90b:5804:b0:340:2f48:b51a with SMTP id 98e67ed59e1d1-34e9212a47fmr28583215a91.15.1767076129538;
        Mon, 29 Dec 2025 22:28:49 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961b4d0sm26491536a12.5.2025.12.29.22.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 22:28:49 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v5 4/4] misc: fastrpc: Add polling mode support for fastRPC driver
Date: Tue, 30 Dec 2025 11:58:31 +0530
Message-Id: <20251230062831.1195116-5-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1NyBTYWx0ZWRfX0NZF+BPBO+66
 s9L7Eygx7LbAvvhmaMqQx38dyR702y+Lfl1iA48xuXAGsmUKzZrE5MrxkXtkw7M7/OWvz+fDHiL
 p3Si10EA86ZMapqRouYa3wtM/i60I2WMgcOrskBcHfK6qoDYGEeOkIO49kKxVmM1r1DgehSyPc0
 s7o6PM5lrIvS6AwtravjPbQVIT2epD92smiUzBEDo6ZXQ28G0ca29MMsVhJJuCt2eyyi0AM1rTL
 n5bQAZ8DMmXaJCyzA6UIvjnG1ogKK6LmHBC21wtUskUDW7Rjfc5GI1izpuETxUvYjwm2PinvJPQ
 5CTPg7ncNpcC+k/MLfAguOioxkO9fpHebpAVZ1RF5N7UH6yrqRyb1iI2DSRN0zR/4fQD1Nq+PQL
 e65067YkHa3NMvg9ecVrhzyROqjoIJBDT8gjfIqQSQ+iqRs2XOWFhaDnkEYi1g3/rN3zdY0BTPq
 Qgo2Sa+wce6d0qHxT1Q==
X-Proofpoint-ORIG-GUID: 8nEhYTIn3xDcBB6eX-6sHIzC7HZPLuuo
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=69537122 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TEHdEMHTk_fMHrPBF0kA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 8nEhYTIn3xDcBB6eX-6sHIzC7HZPLuuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300057

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
 drivers/misc/fastrpc.c      | 139 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |   9 +++
 2 files changed, 141 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 222ff15e04bd..d95d31d27b82 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -22,6 +22,8 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/compiler.h>
+#include <linux/iopoll.h>
 #include <linux/bitfield.h>
 
 #define ADSP_DOMAIN_ID (0)
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
 	u64 addr;		/* physical address */
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
@@ -301,6 +316,8 @@ struct fastrpc_user {
 	int client_id;
 	int pd;
 	bool is_secure_dev;
+	/* Flags poll mode state */
+	bool poll_mode;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -894,7 +911,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32);
 
 	return size;
 }
@@ -990,6 +1008,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
+	ctx->poll = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST + FASTRPC_MAX_CRCLIST);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1158,6 +1177,75 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
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
@@ -1193,16 +1281,25 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
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
 	/* make sure that all memory writes by DSP are seen by CPU */
 	dma_rmb();
 	/* populate all the output buffers with results */
@@ -1780,6 +1877,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
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
@@ -2134,6 +2255,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_MEM_UNMAP:
 		err = fastrpc_req_mem_unmap(fl, argp);
 		break;
+	case FASTRPC_IOCTL_SET_OPTION:
+		err = fastrpc_set_option(fl, argp);
+		break;
 	case FASTRPC_IOCTL_GET_DSP_INFO:
 		err = fastrpc_get_dsp_info(fl, argp);
 		break;
@@ -2465,6 +2589,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 
 	ctx->retval = rsp->retval;
 	complete(&ctx->work);
+	ctx->is_work_done = true;
 
 	/*
 	 * The DMA buffer associated with the context cannot be freed in
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index c6e2925f47e6..3207c42fb318 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -16,6 +16,7 @@
 #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
 #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
+#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
 #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
 
 /**
@@ -66,6 +67,8 @@ enum fastrpc_proc_attr {
 
 /* Fastrpc attribute for memory protection of buffers */
 #define FASTRPC_ATTR_SECUREMAP	(1)
+/* Set option request ID to enable poll mode */
+#define FASTRPC_POLL_MODE	(1)
 
 struct fastrpc_invoke_args {
 	__u64 ptr;
@@ -133,6 +136,12 @@ struct fastrpc_mem_unmap {
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



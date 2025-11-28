Return-Path: <linux-arm-msm+bounces-83687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4964C90DEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 06:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAE383AC615
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 05:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6DA2D3732;
	Fri, 28 Nov 2025 05:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ay8Gv1OI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4wvaGxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CAE2D3A60
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764306357; cv=none; b=r4e/vLA389GzBI1L1R+kTb1vB9fAMASvq/vhPkSDXeMTfwi+WEsIoSb/cGbvw5tN/Z7fkbhBiMkKEwTWf5ctGhcgw2zMjt5vFf+3W7HnTqQjWIvwHQEKC/r29C7TNAuNSP7oqH7OSGrGGexVwSvxpXSvjPPz34pwDAf2/xNRiyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764306357; c=relaxed/simple;
	bh=DsrVqkzoOh91LhP+OVCHGfehP1lnEGNGugMDlR9RqUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hq7HhF6MTmqF7az0B/+bzPDOO73JO7H36odURLb4DHIvIgFmfhmjB7TUhLYVvYLdRrvysg9AsS3gs0b2KS5jdlyErh0IFvG0OidwPBW+r+sI3BqNAjDTFWHVcMrWAR7TdsuCn9Nzwisbm7wjD5L8e5TosRJ5kMh7txy25r0MKNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ay8Gv1OI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4wvaGxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARN1ZPh1826428
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F84JmaDZwv5
	YExecCbKuY9iZ3gotWGmX8OZPfkyrBJI=; b=ay8Gv1OIytR9x6lsHI9YxhB6nqB
	N4oTwgVW/C5wzE6ZxEcwgaKDN5uqjrHuUehUjRMNZA4gxfvzfYARUraa7JlpU+L+
	lcHOBAnd5/5Mc8z1+3GiLr5E8uHLXFs4DkNkxHubGNXDOMlYYsJR7SH6AXAZ5NvM
	AjaUBDOTv4uLsyEak8e4/pNgtD6hjHDKsn9LWR9ZwAE4cwrp1+Dpoo8+epT/sYhk
	hcGsuWPAgJcg9bBIb7cTWvjBsbwBoABQL2LlxZehItE2PUJT4YwVMnt+L/ZZgTZ6
	0xYG9Q+MiUY0NLUzckuAo+X60x0V/4gzYBtxPee6KpEtkI2+SvYqm/CWGfg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxj3ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2958c80fcabso32097055ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 21:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764306354; x=1764911154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F84JmaDZwv5YExecCbKuY9iZ3gotWGmX8OZPfkyrBJI=;
        b=C4wvaGxd5qX4xtHMW5ipS0RpHX49K793fu/YCjX597MY/SE9PpyBXcmEU7kBGnG6Jg
         mtjJ1x2PKsgg6ZSej9OyLLFCqbiiBH/JQXZUQpeKIZfiK3FJBnC3gzjQbu2EtTSUsAvw
         hOnqzU+bjwPQmcpIAaECTIz1lZFMJj1I4co9opVwiS6yBAnAkU6nT57AUODtXvL/gLI4
         uc7peDW+yg4rYm0izim6ZRZYS4pv8jdfoAWb2uuBQzVeDRPD3J6SW9Pi4b/aBkXTobnO
         K3uGJQH+pp1pfF2a4Q923BjZfgBgPcs3uA9yJ6G4+2iBf6HsawSh5oLEDKSl9d2/BLY4
         e26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764306354; x=1764911154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F84JmaDZwv5YExecCbKuY9iZ3gotWGmX8OZPfkyrBJI=;
        b=poMr7GuhtDrZgaeYDPouz8BfqUM/xfCGf1wJnk4znDcdYTgBVuDDdZI2EJmybrdd/V
         SVceLAUdBg8I7U9bb/s/yYMtNkdiu+9yvktC56spQWBNg4r/wl0Z2/dEn8pO775/zb5z
         KmujdpDBvmvDm8S3JBbuitPq8k/V5p6/3Hm4hXMMna7QDYonc5TjETZV1BYU1xVMJio5
         6YUbrdfzBKtpmsAxUrSwar9tV030g+tcRnWwrvzeCBGAicYD+2Xf68TzUYTh46nE/sZ5
         KqMo6kpPdxUhXfBN/kVgIJjiOMQuOq21gzFfoqNMxxaRr01L25mcbcdeRfP6kJvUJl01
         +wQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9TcJcVsnZCtevz7f2Dv4J2V/emDCfw/cDVL38sJR4zAz1c5VMCj9o28CrOcMeM/wq/MGhOBh4wPu3EOgT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/NcpCqd+Ciko7ZSmzlsLrK0DBhcbQ6l9JAUtE+DMsi+auk3n/
	i8Leowr8BLaSvODJNz47SihUluIlL3r/3aX7cAJcHC/TEpUMLOw/5TJSozKnJUyag5fIFCltzI7
	pt0Hyoubw6TIewL++8TrIhV6uo8SEYmntGrT2ny8jSs5bjwD10nVROm/StuMpIt4VDsoa
X-Gm-Gg: ASbGncvsnON9MAshFQtqc/EaF9I1QoMt4Z2CvtY+P+Kj8SqZwcfJrLyhmFVsybS1jDU
	8fjwsvcg1WQHPo9XMbY5DJYRFQUCMjl5dFsTQsM7PiWndJkbeEkanVOAiv0cD41Xx4k36k+bABq
	0sWFn0bV+09B5i5f3U1q1CX5nol6SsYZj5r83CAzDjpjk7U/WhQJ7OipP/g8APjcqC7ohBeuqFD
	dItSL0TJhUWGOfNeePsNVVIC1BdJ0RiAWlwKYJCtYvYtYTyAxZXQSFTm5vcM2kFOcb7/9uDBGgl
	1bVYn7Ll1Mg8S3rT7ircWthNTilKpD20U6IEsR7uwvQNf9cCR1qGeN3lAE7qPAdTYtrgtRK8uMp
	zFJ+Ho+KFLM3lOcMJ+0nFP3Oy/Y6J+aVoqn88WSGl3Q==
X-Received: by 2002:a17:903:2c10:b0:298:42ba:c437 with SMTP id d9443c01a7336-29b6bf75998mr276868775ad.50.1764306353548;
        Thu, 27 Nov 2025 21:05:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx+ZM65ovnezE/50mkowLC52WseDJJY7+kJipd677+JzTFJsFEqOV99JXJDXZ6jJ+ICtzGLQ==
X-Received: by 2002:a17:903:2c10:b0:298:42ba:c437 with SMTP id d9443c01a7336-29b6bf75998mr276868425ad.50.1764306353085;
        Thu, 27 Nov 2025 21:05:53 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm31952075ad.73.2025.11.27.21.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 21:05:52 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 4/4] misc: fastrpc: Add polling mode support for fastRPC driver
Date: Fri, 28 Nov 2025 10:35:34 +0530
Message-Id: <20251128050534.437755-5-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=69292db2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TEHdEMHTk_fMHrPBF0kA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: vAw7xZKaOLLrWhgcbiR-fvLbu9IX7hGt
X-Proofpoint-ORIG-GUID: vAw7xZKaOLLrWhgcbiR-fvLbu9IX7hGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNSBTYWx0ZWRfX1u0uS+f3EP5f
 K/xrw1OFoIWMZbW1rSj2rC0Px6oiSeWc9XBcM6eYpSRTTkv5mhGIKD1xqccnBmb5LNFqhRwe897
 Jf2CEKubcel5c4w3qSxOUmO2j/hWWzrnLn2dUOpWTWNpLt/1iZ2sa9Z9L8wa+KQrd5JWnDoTy5p
 ZruDFDinek8jfpWQQgJxp56GCNTMUWXHtZ9huIPou7wTb68bmKgERIhPjU4tOc0uSYF7eFfJxaX
 HTGruf2IZ8d+NZWYDmRwq6lcsBETYmFDaRVsZwmPIdzi6Cf+nUr/qOS80XNdPcLYsL5TlNNfA01
 pKlQ9g3lYt9SZJpiLRVQABNML7Xxu8W/94lROSu6waxNCsc5YdtBWKa5oTKKnvswTB673egLogF
 AsJoJsRdF5BITVX2f45QRONA+bzqwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280035

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



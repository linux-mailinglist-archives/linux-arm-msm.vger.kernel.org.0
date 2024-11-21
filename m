Return-Path: <linux-arm-msm+bounces-38631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8869D492A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 09:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D49842824DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 08:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7AF1CBE83;
	Thu, 21 Nov 2024 08:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xrk7vjRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AA41CB33D;
	Thu, 21 Nov 2024 08:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732178856; cv=none; b=cCy8A2sdSfTMYgVdip6LL4PALlsqnKtXL7Ve9wg364000TOzCXko1rT3vWVmoOo84PaZkJGNHwGz+DloN7O1jrhmFF11wZK2Uoh3DTOvcxeCouGkMg/17VFcBSxL7/AilfrOcgvrTqJkF2cOxyR6u3yGEHkzsHHR/qc+CpH7ybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732178856; c=relaxed/simple;
	bh=dvm0ilTvTk7HTKDp06S1hUM1P7SXJA1NzgufPHrTkuk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ad7iCofLUAx2M/5MZ2NUvcJ5d23qrO5HObpx+Yh/mwN3UXb4rzuHJoUNQ82R024eDpxXi5XmA8VnWzFM0CRWpnTkfD1bu6u+bX+vUXzmsqtjH8EIWuscopiD2qOenBneY3XB6fGkK3uoYJ0kkNc8Tf+5hWCZmu0fvpNBBlDCdcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xrk7vjRC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKTmAB025897;
	Thu, 21 Nov 2024 08:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZDjre79w6Ut9vpMK9B+Vygi8pBe5Ek99/m2+205Zdc=; b=Xrk7vjRCcE2sarvO
	xG+Oa0/KWNegPbWJsjt+tflub+zD9I1N9UJdZft4cYM6CL5TddoVLYsHO2V+HbXh
	2ta2+YKyRfD91WDpTsocAhwsLOdOcAxf+P1HzD17FA7F9Ep81cib+B42w5h+2RAh
	2Oa6AS26qciwZ5yaA9KCpYlDez1wEI1og4bxc97IVEs02glkpHoC4/RUCIiEpDUC
	pKAJl3ZraZ9YHyqOxdBXZE60ZrCt3O7MSpTleLPEXcTNOgqisgGZne/b7uxBFOyp
	b76CkoAVcr2sIZ1MP+atq79NSwGxX8RV4HkpI8UMaNoPqu6j/dPtUIIOERMsns9G
	Gf7J1g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431byjkevu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 08:47:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL8lTV8006689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 08:47:29 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 00:47:26 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v4 1/2] misc: fastrpc: Add support for multiple PD from one process
Date: Thu, 21 Nov 2024 14:17:12 +0530
Message-ID: <20241121084713.2599904-2-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121084713.2599904-1-quic_ekangupt@quicinc.com>
References: <20241121084713.2599904-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -Qb1a8e-itsdNcTY_ZMcqRPGsCRHHrXz
X-Proofpoint-ORIG-GUID: -Qb1a8e-itsdNcTY_ZMcqRPGsCRHHrXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210068

Memory intensive applications(which requires more tha 4GB) that wants
to offload tasks to DSP might have to split the tasks to multiple
user PD to make the resources available.

For every call to DSP, fastrpc driver passes the process tgid which
works as an identifier for the DSP to enqueue the tasks to specific PD.
With current design, if any process opens device node more than once
and makes PD init request, same tgid will be passed to DSP which will
be considered a bad request and this will result in failure as the same
identifier cannot be used for multiple DSP PD.

Assign and pass a client ID to DSP which would be assigned during device
open and will be dependent on the index of session allocated for the PD.
This will allow the same process to open the device more than once and
spawn multiple dynamic PD for ease of processing.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 74181b8c386b..08f223c95c33 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -39,6 +39,7 @@
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
 #define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CLIENTID_MASK GENMASK(4, 4)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -299,7 +300,7 @@ struct fastrpc_user {
 	struct fastrpc_session_ctx *sctx;
 	struct fastrpc_buf *init_mem;
 
-	int tgid;
+	int client_id;
 	int pd;
 	bool is_secure_dev;
 	/* Lock for lists */
@@ -614,7 +615,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
-	ctx->tgid = user->tgid;
+	ctx->tgid = user->client_id;
 	ctx->cctx = cctx;
 	init_completion(&ctx->work);
 	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
@@ -1115,7 +1116,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	int ret;
 
 	cctx = fl->cctx;
-	msg->pid = fl->tgid;
+	msg->pid = fl->client_id;
 	msg->tid = current->pid;
 
 	if (kernel)
@@ -1293,7 +1294,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		}
 	}
 
-	inbuf.pgid = fl->tgid;
+	inbuf.pgid = fl->client_id;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
@@ -1395,7 +1396,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
-	inbuf.pgid = fl->tgid;
+	inbuf.pgid = fl->client_id;
 	inbuf.namelen = strlen(current->comm) + 1;
 	inbuf.filelen = init.filelen;
 	inbuf.pageslen = 1;
@@ -1469,8 +1470,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 }
 
 static struct fastrpc_session_ctx *fastrpc_session_alloc(
-					struct fastrpc_channel_ctx *cctx)
+					struct fastrpc_user *fl)
 {
+	struct fastrpc_channel_ctx *cctx = fl->cctx;
 	struct fastrpc_session_ctx *session = NULL;
 	unsigned long flags;
 	int i;
@@ -1480,6 +1482,7 @@ static struct fastrpc_session_ctx *fastrpc_session_alloc(
 		if (!cctx->session[i].used && cctx->session[i].valid) {
 			cctx->session[i].used = true;
 			session = &cctx->session[i];
+			fl->client_id = FASTRPC_CLIENTID_MASK | i;
 			break;
 		}
 	}
@@ -1504,7 +1507,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
 	int tgid = 0;
 	u32 sc;
 
-	tgid = fl->tgid;
+	tgid = fl->client_id;
 	args[0].ptr = (u64)(uintptr_t) &tgid;
 	args[0].length = sizeof(tgid);
 	args[0].fd = -1;
@@ -1579,11 +1582,10 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	INIT_LIST_HEAD(&fl->maps);
 	INIT_LIST_HEAD(&fl->mmaps);
 	INIT_LIST_HEAD(&fl->user);
-	fl->tgid = current->tgid;
 	fl->cctx = cctx;
 	fl->is_secure_dev = fdevice->secure;
 
-	fl->sctx = fastrpc_session_alloc(cctx);
+	fl->sctx = fastrpc_session_alloc(fl);
 	if (!fl->sctx) {
 		dev_err(&cctx->rpdev->dev, "No session available\n");
 		mutex_destroy(&fl->mutex);
@@ -1647,7 +1649,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 {
 	struct fastrpc_invoke_args args[1];
-	int tgid = fl->tgid;
+	int tgid = fl->client_id;
 	u32 sc;
 
 	args[0].ptr = (u64)(uintptr_t) &tgid;
@@ -1803,7 +1805,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	int err;
 	u32 sc;
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->client_id;
 	req_msg.size = buf->size;
 	req_msg.vaddr = buf->raddr;
 
@@ -1889,7 +1891,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->client_id;
 	req_msg.flags = req.flags;
 	req_msg.vaddr = req.vaddrin;
 	req_msg.num = sizeof(pages);
@@ -1978,7 +1980,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 		return -EINVAL;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->client_id;
 	req_msg.len = map->len;
 	req_msg.vaddrin = map->raddr;
 	req_msg.fd = map->fd;
@@ -2031,7 +2033,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.pgid = fl->tgid;
+	req_msg.pgid = fl->client_id;
 	req_msg.fd = req.fd;
 	req_msg.offset = req.offset;
 	req_msg.vaddrin = req.vaddrin;
-- 
2.34.1



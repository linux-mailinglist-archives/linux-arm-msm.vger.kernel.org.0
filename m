Return-Path: <linux-arm-msm+bounces-1345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A26DB7F2BAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 12:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D26A2827B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 11:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67674A2E;
	Tue, 21 Nov 2023 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XKxEZzNZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F7798;
	Tue, 21 Nov 2023 03:25:12 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALA8UYs008889;
	Tue, 21 Nov 2023 11:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=7IOTVfCbvSUPGBQV9KfSBf5KQxnkGEB+stp/H1lLn8g=;
 b=XKxEZzNZxOKnWAYiX45I/4CClvqX2dj2sLe6Hxrf11R5AQaNcvinw48MaCgU6lR4Q8R5
 m/mL8c6zh9MUn6Iva9zW6bmY9e8/hzHGoF9IOavueQKJYheT35Qhrx7z7Ob2WavN0vGu
 Sn65uZyj92XXhVwcq8NwnRtUqyLPbF8nX365PRmqS+4fya74+m4NgvBsC5oEM9VPelsi
 TpplG1KD15jjkTqA12lCVUJz/jkDhYp7JuOoy/C15hMtT86AAQHd8Nnh5eeIUEikZyd0
 hV21o2x3QdufSewd0dlcQZUTEKvfclyH+cm3veGWyTZhj6cWCTJuIuM4WucYpb9EDC+6 9w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugr85rk6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 11:25:10 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALBP8vY015770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 11:25:08 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 03:25:06 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/5] misc: fastrpc: Add polling mode support for fastRPC driver
Date: Tue, 21 Nov 2023 16:54:51 +0530
Message-ID: <20231121112454.12764-3-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231121112454.12764-1-quic_ekangupt@quicinc.com>
References: <20231121112454.12764-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T_642ZLzh914_oc7AtN4QFJVy4wYpXCx
X-Proofpoint-ORIG-GUID: T_642ZLzh914_oc7AtN4QFJVy4wYpXCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_04,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=948 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210088

For any remote call to DSP, after sending an invocation message,
fastRPC driver waits for glink response and during this time the
CPU can go into low power modes. Adding a polling mode support
with which fastRPC driver will poll continuously on a memory
after sending a message to remote subsystem which will eliminate
CPU wakeup and scheduling latencies and reduce fastRPC overhead.
With this change, DSP always sends a glink response which will
get ignored if polling mode didn't time out.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
Changes in v3:
  - Rebase the patch to latest kernel version

 drivers/misc/fastrpc.c | 49 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 6b6ac3e3328d..4f8ecfcdf89f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -109,6 +109,8 @@
 #define FASTRPC_RSP_VERSION2 2
 /* Early wake up poll completion number received from remoteproc */
 #define FASTRPC_EARLY_WAKEUP_POLL (0xabbccdde)
+/* Poll response number from remote processor for call completion */
+#define FASTRPC_POLL_RESPONSE (0xdecaf)
 /* timeout in us for polling until memory barrier */
 #define FASTRPC_POLL_TIME_MEM_UPDATE (500)
 /* timeout in us for busy polling after early response from remoteproc */
@@ -380,10 +382,14 @@ struct fastrpc_user {
 	struct fastrpc_buf *init_mem;
 
 	u32 profile;
+	/* Threads poll for specified timeout and fall back to glink wait */
+	u32 poll_timeout;
 	int tgid;
 	int pd;
 	bool is_secure_dev;
 	bool sharedcb;
+	/* If set, threads will poll for DSP response instead of glink wait */
+	bool poll_mode;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -1376,6 +1382,11 @@ static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx, u32 timeout)
 			/* Remote processor sent early response */
 			err = 0;
 			break;
+		} else if (*poll == FASTRPC_POLL_RESPONSE) {
+			err = 0;
+			ctx->is_work_done = true;
+			ctx->retval = 0;
+			break;
 		}
 		if (jj == FASTRPC_POLL_TIME_MEM_UPDATE) {
 			/* Wait for DSP to finish updating poll memory */
@@ -1451,6 +1462,15 @@ static void fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
 			if (*ptr_interrupted || ctx->is_work_done)
 				return;
 			break;
+		case POLL_MODE:
+			err = poll_for_remote_response(ctx, ctx->fl->poll_timeout);
+
+			/* If polling timed out, move to normal response state */
+			if (err)
+				ctx->rsp_flags = NORMAL_RESPONSE;
+			else
+				*ptr_interrupted = 0;
+			break;
 		default:
 			*ptr_interrupted = -EBADR;
 			dev_err(ctx->fl->sctx->dev, "unsupported response type:0x%x\n", ctx->rsp_flags);
@@ -2065,6 +2085,32 @@ static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
 	return err;
 }
 
+static int fastrpc_manage_poll_mode(struct fastrpc_user *fl, u32 enable, u32 timeout)
+{
+	const unsigned int MAX_POLL_TIMEOUT_US = 10000;
+
+	if ((fl->cctx->domain_id != CDSP_DOMAIN_ID) || (fl->pd != USER_PD)) {
+		dev_err(&fl->cctx->rpdev->dev, "poll mode only allowed for dynamic CDSP process\n");
+		return -EPERM;
+	}
+	if (timeout > MAX_POLL_TIMEOUT_US) {
+		dev_err(&fl->cctx->rpdev->dev, "poll timeout %u is greater than max allowed value %u\n",
+			timeout, MAX_POLL_TIMEOUT_US);
+		return -EBADMSG;
+	}
+	spin_lock(&fl->lock);
+	if (enable) {
+		fl->poll_mode = true;
+		fl->poll_timeout = timeout;
+	} else {
+		fl->poll_mode = false;
+		fl->poll_timeout = 0;
+	}
+	spin_unlock(&fl->lock);
+	dev_info(&fl->cctx->rpdev->dev, "updated poll mode to %d, timeout %u\n", enable, timeout);
+	return 0;
+}
+
 static int fastrpc_internal_control(struct fastrpc_user *fl,
 					struct fastrpc_internal_control *cp)
 {
@@ -2079,6 +2125,9 @@ static int fastrpc_internal_control(struct fastrpc_user *fl,
 	case FASTRPC_CONTROL_SMMU:
 		fl->sharedcb = cp->smmu.sharedcb;
 		break;
+	case FASTRPC_CONTROL_RPC_POLL:
+		err = fastrpc_manage_poll_mode(fl, cp->lp.enable, cp->lp.latency);
+		break;
 	default:
 		err = -EBADRQC;
 		break;
-- 
2.17.1



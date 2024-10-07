Return-Path: <linux-arm-msm+bounces-33338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D70A99276B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 10:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FB88B23A9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264E218C02B;
	Mon,  7 Oct 2024 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bMPsUDnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C45F18C00C;
	Mon,  7 Oct 2024 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728290742; cv=none; b=BOgmUILqRYI7jx1cxHmxmLpJlS/Vz40V7WnaCkEizy8iLuSXmaf2nPh/+8Bg2W0Y8HlG4ojVyOtIn4t9GHUqXYEtwiY2x3N49KbTMcNEYWGvJ/eMFVtS+pgx0ABwcwKwwDYtR+KnrmrmtZ4GVr6oH/7TGxdHdO+SaGakQeC7+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728290742; c=relaxed/simple;
	bh=NQVpztLiZphmfHVc6jh5dzykNAw+rNTIU6MaSQ09BrI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dTVfxoMFbaS/qjKFPs1fIdqzOnY6/dOw1Xp2DSXzuCcoq8XUEQ+IfhkQo8TzlDWClCKcV/31oZHJOijYMebkNVL3hDBQG7k89TtqBLK7Zhtr51j+5MaK0Jix7fN7MoTlOOWj/6YaZNwW3pf3rL6z09oZ62OaALmYLwKPraMSH8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bMPsUDnW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974U2L5001587;
	Mon, 7 Oct 2024 08:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nWSOYJhjzpP0W0nvkO2lgq7nzrutmo7bmQx2dGfd6IA=; b=bMPsUDnWMUhOiGxG
	hg3xwLwABoYUIC4pKkH3tJPF/xdp3sZ4o9M7jNbROeoY29vkuEYp7yy11gIO5G4b
	jgJwmNU3lQthKYWDkeFGmDURte8o0G3269+iD+rc2FMyLMFDrupRV8SZHIWlN6NJ
	VyxYBsQRyusIByKqj60LG5EidAS6uCdCyaONgGrqs+FRJHiE45bl2+m9udqLuHNE
	UvBEXaLuKSMRt6GJazCiZYMUY9poVCIQjN9omqvCWW3ly+qVtZpDRSbZFJLVP1Nq
	bYICcq+JRpPSzC1WYqS1+wH57ANWGLY62UiTjnwiIO1T2+gQzn27s6bEvAx1OlsT
	yCW+Xg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv8bff3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 08:45:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4978jXZY030668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 08:45:33 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 01:45:30 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2 request
Date: Mon, 7 Oct 2024 14:15:15 +0530
Message-ID: <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -E70nRih5kxIgiKcs6eX7iGZMqqamnNP
X-Proofpoint-GUID: -E70nRih5kxIgiKcs6eX7iGZMqqamnNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410070061

InvokeV2 request is intended to support multiple enhanced invoke
requests like CRC check, performance counter enablement and polling
mode for RPC invocations. CRC check is getting enabled as part of
this patch. CRC check for input and output argument helps in ensuring
data consistency over a remote call. If user intends to enable CRC
check, first local user CRC is calculated at user end and a CRC buffer
is passed to DSP to capture remote CRC values. DSP is expected to
write to the remote CRC buffer which is then compared at user level
with the local CRC values.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c      | 161 ++++++++++++++++++++++++------------
 include/uapi/misc/fastrpc.h |   7 ++
 2 files changed, 116 insertions(+), 52 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 74181b8c386b..8e817a763d1d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -573,13 +573,15 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 
 static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 			struct fastrpc_user *user, u32 kernel, u32 sc,
-			struct fastrpc_invoke_args *args)
+			struct fastrpc_invoke_v2 *inv2)
 {
 	struct fastrpc_channel_ctx *cctx = user->cctx;
 	struct fastrpc_invoke_ctx *ctx = NULL;
+	struct fastrpc_invoke_args *args = NULL;
 	unsigned long flags;
 	int ret;
 
+	args = (struct fastrpc_invoke_args *)inv2->inv.args;
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
@@ -611,6 +613,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	/* Released in fastrpc_context_put() */
 	fastrpc_channel_ctx_get(cctx);
 
+	ctx->crc = (u32 *)(uintptr_t)inv2->crc;
 	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
@@ -1070,6 +1073,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	struct fastrpc_invoke_buf *list;
 	struct fastrpc_phy_page *pages;
 	u64 *fdlist;
+	u32 *crclist;
 	int i, inbufs, outbufs, handles;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
@@ -1078,6 +1082,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
+	crclist = (u32 *)(fdlist + FASTRPC_MAX_FDLIST);
 
 	for (i = inbufs; i < ctx->nbufs; ++i) {
 		if (!ctx->maps[i]) {
@@ -1102,6 +1107,12 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 			fastrpc_map_put(mmap);
 	}
 
+	if (ctx->crc && crclist && rpra) {
+		if (copy_to_user((void __user *)ctx->crc, crclist,
+				FASTRPC_MAX_CRCLIST * sizeof(u32)))
+			return -EFAULT;
+	}
+
 	return 0;
 }
 
@@ -1137,13 +1148,12 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 }
 
-static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
-				   u32 handle, u32 sc,
-				   struct fastrpc_invoke_args *args)
+static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct fastrpc_invoke_v2 *inv2)
 {
 	struct fastrpc_invoke_ctx *ctx = NULL;
 	struct fastrpc_buf *buf, *b;
-
+	struct fastrpc_invoke inv;
+	u32 handle, sc;
 	int err = 0;
 
 	if (!fl->sctx)
@@ -1152,12 +1162,15 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (!fl->cctx->rpdev)
 		return -EPIPE;
 
+	inv = inv2->inv;
+	handle = inv.handle;
+	sc = inv.sc;
 	if (handle == FASTRPC_INIT_HANDLE && !kernel) {
 		dev_warn_ratelimited(fl->sctx->dev, "user app trying to send a kernel RPC message (%d)\n",  handle);
 		return -EPERM;
 	}
 
-	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
+	ctx = fastrpc_context_alloc(fl, kernel, sc, inv2);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 
@@ -1239,6 +1252,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 {
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
+	struct fastrpc_invoke_v2 ioctl = {0};
 	struct fastrpc_phy_page pages[1];
 	char *name;
 	int err;
@@ -1248,7 +1262,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		u32 namelen;
 		u32 pageslen;
 	} inbuf;
-	u32 sc;
 
 	args = kcalloc(FASTRPC_CREATE_STATIC_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
 	if (!args)
@@ -1313,10 +1326,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[2].length = sizeof(*pages);
 	args[2].fd = -1;
 
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
-
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
-				      sc, args);
+	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
+	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
+	ioctl.inv.args = (u64)args;
+	err = fastrpc_internal_invoke(fl, true, &ioctl);
 	if (err)
 		goto err_invoke;
 
@@ -1357,6 +1370,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 {
 	struct fastrpc_init_create init;
 	struct fastrpc_invoke_args *args;
+	struct fastrpc_invoke_v2 ioctl = {0};
 	struct fastrpc_phy_page pages[1];
 	struct fastrpc_map *map = NULL;
 	struct fastrpc_buf *imem = NULL;
@@ -1370,7 +1384,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		u32 attrs;
 		u32 siglen;
 	} inbuf;
-	u32 sc;
 	bool unsigned_module = false;
 
 	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
@@ -1444,12 +1457,12 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	args[5].length = sizeof(inbuf.siglen);
 	args[5].fd = -1;
 
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
+	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
+	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
 	if (init.attrs)
-		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
-
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
-				      sc, args);
+		ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
+	ioctl.inv.args = (u64)args;
+	err = fastrpc_internal_invoke(fl, true, &ioctl);
 	if (err)
 		goto err_invoke;
 
@@ -1501,17 +1514,18 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
 static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
 {
 	struct fastrpc_invoke_args args[1];
+	struct fastrpc_invoke_v2 ioctl = {0};
 	int tgid = 0;
-	u32 sc;
 
 	tgid = fl->tgid;
 	args[0].ptr = (u64)(uintptr_t) &tgid;
 	args[0].length = sizeof(tgid);
 	args[0].fd = -1;
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
 
-	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
-				       sc, &args[0]);
+	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
+	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
+	ioctl.inv.args = (u64)args;
+	return fastrpc_internal_invoke(fl, true, &ioctl);
 }
 
 static int fastrpc_device_release(struct inode *inode, struct file *file)
@@ -1647,45 +1661,77 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 {
 	struct fastrpc_invoke_args args[1];
+	struct fastrpc_invoke_v2 ioctl = {0};
 	int tgid = fl->tgid;
-	u32 sc;
 
 	args[0].ptr = (u64)(uintptr_t) &tgid;
 	args[0].length = sizeof(tgid);
 	args[0].fd = -1;
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
 	fl->pd = pd;
 
-	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
-				       sc, &args[0]);
+	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
+	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
+	ioctl.inv.args = (u64)args;
+	return fastrpc_internal_invoke(fl, true, &ioctl);
 }
 
-static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
+static int fastrpc_copy_args(struct fastrpc_invoke *inv)
 {
 	struct fastrpc_invoke_args *args = NULL;
-	struct fastrpc_invoke inv;
 	u32 nscalars;
-	int err;
-
-	if (copy_from_user(&inv, argp, sizeof(inv)))
-		return -EFAULT;
 
 	/* nscalars is truncated here to max supported value */
-	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
+	nscalars = REMOTE_SCALARS_LENGTH(inv->sc);
 	if (nscalars) {
 		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
 		if (!args)
 			return -ENOMEM;
 
-		if (copy_from_user(args, (void __user *)(uintptr_t)inv.args,
+		if (copy_from_user(args, (void __user *)(uintptr_t)inv->args,
 				   nscalars * sizeof(*args))) {
 			kfree(args);
 			return -EFAULT;
 		}
 	}
+	inv->args = args;
 
-	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, args);
-	kfree(args);
+	return 0;
+}
+
+static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_invoke_v2 ioctl = {0};
+	struct fastrpc_invoke inv;
+	int err;
+
+	if (copy_from_user(&inv, argp, sizeof(inv)))
+		return -EFAULT;
+
+	err = fastrpc_copy_args(&inv);
+	if (err)
+		return err;
+
+	ioctl.inv = inv;
+	err = fastrpc_internal_invoke(fl, false, &ioctl);
+	kfree(inv.args);
+
+	return err;
+}
+
+static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_invoke_v2 inv2 = {0};
+	int err;
+
+	if (copy_from_user(&inv2, argp, sizeof(inv2)))
+		return -EFAULT;
+
+	err = fastrpc_copy_args(&inv2.inv);
+	if (err)
+		return err;
+
+	err = fastrpc_internal_invoke(fl, false, &inv2);
+	kfree(inv2.inv.args);
 
 	return err;
 }
@@ -1694,6 +1740,7 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
 				     uint32_t dsp_attr_buf_len)
 {
 	struct fastrpc_invoke_args args[2] = { 0 };
+	struct fastrpc_invoke_v2 ioctl = {0};
 
 	/*
 	 * Capability filled in userspace. This carries the information
@@ -1710,8 +1757,10 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
 	args[1].length = dsp_attr_buf_len * sizeof(u32);
 	args[1].fd = -1;
 
-	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
-				       FASTRPC_SCALARS(0, 1, 1), args);
+	ioctl.inv.handle = FASTRPC_DSP_UTILITIES_HANDLE;
+	ioctl.inv.sc = FASTRPC_SCALARS(0, 1, 1);
+	ioctl.inv.args = (u64)args;
+	return fastrpc_internal_invoke(fl, true, &ioctl);
 }
 
 static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
@@ -1798,10 +1847,10 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
+	struct fastrpc_invoke_v2 ioctl = {0};
 	struct fastrpc_munmap_req_msg req_msg;
 	struct device *dev = fl->sctx->dev;
 	int err;
-	u32 sc;
 
 	req_msg.pgid = fl->tgid;
 	req_msg.size = buf->size;
@@ -1810,9 +1859,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	args[0].ptr = (u64) (uintptr_t) &req_msg;
 	args[0].length = sizeof(req_msg);
 
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
+	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
+	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
+	ioctl.inv.args = (u64)args;
+	err = fastrpc_internal_invoke(fl, true, &ioctl);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
 		spin_lock(&fl->lock);
@@ -1856,6 +1906,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
+	struct fastrpc_invoke_v2 ioctl = {0};
 	struct fastrpc_buf *buf = NULL;
 	struct fastrpc_mmap_req_msg req_msg;
 	struct fastrpc_mmap_rsp_msg rsp_msg;
@@ -1863,7 +1914,6 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_req_mmap req;
 	struct device *dev = fl->sctx->dev;
 	int err;
-	u32 sc;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1906,9 +1956,10 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
 	args[2].length = sizeof(rsp_msg);
 
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
+	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
+	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+	ioctl.inv.args = (u64)args;
+	err = fastrpc_internal_invoke(fl, true, &ioctl);
 	if (err) {
 		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
 		fastrpc_buf_free(buf);
@@ -1957,10 +2008,10 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
+	struct fastrpc_invoke_v2 ioctl = {0};
 	struct fastrpc_map *map = NULL, *iter, *m;
 	struct fastrpc_mem_unmap_req_msg req_msg = { 0 };
 	int err = 0;
-	u32 sc;
 	struct device *dev = fl->sctx->dev;
 
 	spin_lock(&fl->lock);
@@ -1986,9 +2037,10 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 	args[0].ptr = (u64) (uintptr_t) &req_msg;
 	args[0].length = sizeof(req_msg);
 
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
+	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
+	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
+	ioctl.inv.args = (u64)args;
+	err = fastrpc_internal_invoke(fl, true, &ioctl);
 	if (err) {
 		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
 		return err;
@@ -2011,6 +2063,7 @@ static int fastrpc_req_mem_unmap(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_invoke_args args[4] = { [0 ... 3] = { 0 } };
+	struct fastrpc_invoke_v2 ioctl = {0};
 	struct fastrpc_mem_map_req_msg req_msg = { 0 };
 	struct fastrpc_mmap_rsp_msg rsp_msg = { 0 };
 	struct fastrpc_mem_unmap req_unmap = { 0 };
@@ -2019,7 +2072,6 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 	struct device *dev = fl->sctx->dev;
 	struct fastrpc_map *map = NULL;
 	int err;
-	u32 sc;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -2055,8 +2107,10 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 	args[3].ptr = (u64) (uintptr_t) &rsp_msg;
 	args[3].length = sizeof(rsp_msg);
 
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
+	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
+	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
+	ioctl.inv.args = (u64)args;
+	err = fastrpc_internal_invoke(fl, true, &ioctl);
 	if (err) {
 		dev_err(dev, "mem mmap error, fd %d, vaddr %llx, size %lld\n",
 			req.fd, req.vaddrin, map->size);
@@ -2096,6 +2150,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_INVOKE:
 		err = fastrpc_invoke(fl, argp);
 		break;
+	case FASTRPC_IOCTL_INVOKEV2:
+		err = fastrpc_invokev2(fl, argp);
+		break;
 	case FASTRPC_IOCTL_INIT_ATTACH:
 		err = fastrpc_init_attach(fl, ROOT_PD);
 		break;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index f33d914d8f46..406b80555d41 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -17,6 +17,7 @@
 #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
 #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
+#define FASTRPC_IOCTL_INVOKEV2		_IOWR('R', 14, struct fastrpc_invoke_v2)
 
 /**
  * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
@@ -80,6 +81,12 @@ struct fastrpc_invoke {
 	__u64 args;
 };
 
+struct fastrpc_invoke_v2 {
+	struct fastrpc_invoke inv;
+	__u64 crc;
+	__u32 reserved[16];
+};
+
 struct fastrpc_init_create {
 	__u32 filelen;	/* elf file length */
 	__s32 filefd;	/* fd for the file */
-- 
2.34.1



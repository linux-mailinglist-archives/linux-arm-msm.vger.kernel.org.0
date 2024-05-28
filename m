Return-Path: <linux-arm-msm+bounces-20717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D068D1974
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D047AB23338
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038A616C6B1;
	Tue, 28 May 2024 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V8bh8MXG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D86182B3;
	Tue, 28 May 2024 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895826; cv=none; b=oEZrfpZ+JWQqRCZzQFhCb8ad5i+ST+veKTDCSGGN9J+8MQeynmL40nftRtPblZxBo1ZnVyOm3tCfB+Gv33BUFSO3nOmciuaehg567zSiWlN89N5LCERhX5t3lm13oObjRzq518R2Cjr9OflWuQO2oxVqPmYqPF1UiCb6YsQHRbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895826; c=relaxed/simple;
	bh=BRFwAoyJ/b7Y/ZsGoH+pLi+5j/4fPFWAifpLCTnJxEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HjC+D+hsYvqfeedHuNYnWhfy4pWNf0NOS4Qn3IeUaXrIN2Q3BHntg6Jnbzm+VVjElFEqLhgsJszBLpSy6kndO8lIxsmnUWd4gyRNG7aBfmunm7WxqGsj4iKOKygoc5NrsJ8qkRjlsVFRwKdlX5iO+RGjPfMfwOjmLsF/tJo5LrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V8bh8MXG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RNP6KD013116;
	Tue, 28 May 2024 11:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/25Lv+m2pI0JLuJAbcXNEupUkVgeoF+6ky2d5EQN7Gg=; b=V8bh8MXGa+1M3gos
	1MCp9vVXIiLCVKHaTWolcuW++dxH/EJSXa9SvpAZs/GH/dMZaVIHjZrUvCDgCDBV
	9pJ8J54kFidOK/gcO1o1UeTQZR6GvUNAYYvxZd7M2qjjhDK2dGqhQ5soyeFjiYc9
	M8D4isK4JQSdchfdF8ggfhqTM7If4QR0oG1gHt47lNwrWYAbJ9ZOKGXjSXeIk3Sk
	ovfejNNpeeGX72rrF/xvRLWol1edYxxmjwyNLw5KGdBKCWm5MOihO5w3v6dy9GUz
	fEzo4BnRMuXFmcsPbTaUJ32l+obSIcGtPfBsaSpiNmO4RzHJz+5Pb3xZs2DcwH3G
	rf+Ycg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ybadx5uwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBUKFr007677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:20 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:30:18 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v2 5/8] misc: fastrpc: Redesign remote heap management
Date: Tue, 28 May 2024 16:59:51 +0530
Message-ID: <20240528112956.5979-6-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 5d8TeNF-ofUcDV_KOGkXGFj-pQq3bGDk
X-Proofpoint-GUID: 5d8TeNF-ofUcDV_KOGkXGFj-pQq3bGDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405280087

Current remote heap design comes with problems where all types
of buffers are getting added to interrupted list and also user
unmap request is not handled properly. Add changes to maintain
list in a way that it can be properly managed and used at different
audio PD specific scenarios.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 221 ++++++++++++++++++++++++++++++++---------
 1 file changed, 175 insertions(+), 46 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7796b743cc45..1c0e5d050fd4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -210,6 +210,7 @@ struct fastrpc_buf {
 	struct dma_buf *dmabuf;
 	struct device *dev;
 	void *virt;
+	u32 flag;
 	u64 phys;
 	u64 size;
 	/* Lock for dma buf attachments */
@@ -273,6 +274,7 @@ struct fastrpc_session_ctx {
 };
 
 struct fastrpc_static_pd {
+	struct list_head rmaps;
 	char *servloc_name;
 	char *spdname;
 	void *pdrhandle;
@@ -298,7 +300,6 @@ struct fastrpc_channel_ctx {
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
-	struct fastrpc_buf *remote_heap;
 	bool secure;
 	bool unsigned_support;
 	u64 dma_mask;
@@ -1283,6 +1284,53 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
 	return false;
 }
 
+static void fastrpc_mmap_remove_pdr(struct fastrpc_static_pd *spd)
+{
+	struct fastrpc_buf *buf, *b;
+	struct fastrpc_channel_ctx *cctx;
+	int err;
+
+	if (!spd || !spd->fl)
+		return;
+
+	cctx = spd->cctx;
+
+	spin_lock(&spd->fl->lock);
+	list_for_each_entry_safe(buf, b, &spd->rmaps, node) {
+		list_del(&buf->node);
+		spin_unlock(&spd->fl->lock);
+		if (cctx->vmcount) {
+			u64 src_perms = 0;
+			struct qcom_scm_vmperm dst_perms;
+			u32 i;
+
+			for (i = 0; i < cctx->vmcount; i++)
+				src_perms |= BIT(cctx->vmperms[i].vmid);
+
+			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+			dst_perms.perm = QCOM_SCM_PERM_RWX;
+			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
+				&src_perms, &dst_perms, 1);
+			if (err) {
+				pr_err("%s: Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
+					__func__, buf->phys, buf->size, err);
+				return;
+			}
+		}
+		fastrpc_buf_free(buf);
+		spin_lock(&spd->fl->lock);
+	}
+	spin_unlock(&spd->fl->lock);
+}
+
+static void fastrpc_mmap_remove_ssr(struct fastrpc_channel_ctx *cctx)
+{
+	int i;
+
+	for (i = 0; i < FASTRPC_MAX_SPD; i++)
+		fastrpc_mmap_remove_pdr(&cctx->spd[i]);
+}
+
 static struct fastrpc_static_pd *fastrpc_get_spd_session(
 				struct fastrpc_user *fl)
 {
@@ -1309,9 +1357,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
 	struct fastrpc_phy_page pages[1];
+	struct fastrpc_buf *buf = NULL;
 	struct fastrpc_static_pd *spd = NULL;
+	u64 phys = 0, size = 0;
 	char *name;
 	int err;
+	bool scm_done = false;
 	struct {
 		int pgid;
 		u32 namelen;
@@ -1357,25 +1408,26 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		goto err_name;
 	}
 	fl->spd = spd;
-	if (!fl->cctx->remote_heap) {
-		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
-						&fl->cctx->remote_heap);
+	if (list_empty(&spd->rmaps)) {
+		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen, &buf);
 		if (err)
 			goto err_name;
 
+		phys = buf->phys;
+		size = buf->size;
 		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
 		if (fl->cctx->vmcount) {
 			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
-							(u64)fl->cctx->remote_heap->size,
+			err = qcom_scm_assign_mem(phys, (u64)size,
 							&src_perms,
 							fl->cctx->vmperms, fl->cctx->vmcount);
 			if (err) {
 				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
-					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
+					phys, size, err);
 				goto err_map;
 			}
+			scm_done = true;
 		}
 	}
 
@@ -1392,8 +1444,8 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->phys;
-	pages[0].size = fl->cctx->remote_heap->size;
+	pages[0].addr = phys;
+	pages[0].size = size;
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1407,10 +1459,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		goto err_invoke;
 
 	kfree(args);
+	kfree(name);
+
+	if (buf) {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &spd->rmaps);
+		spin_unlock(&fl->lock);
+	}
 
 	return 0;
 err_invoke:
-	if (fl->cctx->vmcount) {
+	if (fl->cctx->vmcount && scm_done) {
 		u64 src_perms = 0;
 		struct qcom_scm_vmperm dst_perms;
 		u32 i;
@@ -1420,15 +1479,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
 		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
-						(u64)fl->cctx->remote_heap->size,
+		err = qcom_scm_assign_mem(phys, (u64)size,
 						&src_perms, &dst_perms, 1);
 		if (err)
 			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
-				fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
+				phys, size, err);
 	}
 err_map:
-	fastrpc_buf_free(fl->cctx->remote_heap);
+	if (buf)
+		fastrpc_buf_free(buf);
 err_name:
 	kfree(name);
 err:
@@ -1909,17 +1968,16 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 	return 0;
 }
 
-static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
+static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, uintptr_t raddr, u64 size)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
 	struct fastrpc_munmap_req_msg req_msg;
-	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
 
 	req_msg.pgid = fl->tgid;
-	req_msg.size = buf->size;
-	req_msg.vaddr = buf->raddr;
+	req_msg.size = size;
+	req_msg.vaddr = raddr;
 
 	args[0].ptr = (u64) (uintptr_t) &req_msg;
 	args[0].length = sizeof(req_msg);
@@ -1927,11 +1985,38 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
+
+	return err;
+}
+
+static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
+{
+	struct device *dev = fl->sctx->dev;
+	int err;
+
+	err = fastrpc_req_munmap_dsp(fl, buf->raddr, buf->size);
 	if (!err) {
+		if (buf->flag == ADSP_MMAP_REMOTE_HEAP_ADDR) {
+			if (fl->cctx->vmcount) {
+				u64 src_perms = 0;
+				struct qcom_scm_vmperm dst_perms;
+				u32 i;
+
+				for (i = 0; i < fl->cctx->vmcount; i++)
+					src_perms |= BIT(fl->cctx->vmperms[i].vmid);
+
+				dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+				dst_perms.perm = QCOM_SCM_PERM_RWX;
+				err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
+								&src_perms, &dst_perms, 1);
+				if (err) {
+					dev_err(dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
+						buf->phys, buf->size, err);
+					return err;
+				}
+			}
+		}
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1945,6 +2030,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err = 0;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1953,20 +2039,48 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
 		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
 			buf = iter;
+			list_del(&buf->node);
 			break;
 		}
 	}
 	spin_unlock(&fl->lock);
 
-	if (!buf) {
-		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
-			req.vaddrout, req.size);
-		return -EINVAL;
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock(&fl->lock);
+			list_add_tail(&buf->node, &fl->mmaps);
+			spin_unlock(&fl->lock);
+		}
+		return err;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	spin_lock(&fl->lock);
+	if (fl->spd) {
+		list_for_each_entry_safe(iter, b, &fl->spd->rmaps, node) {
+			if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+				buf = iter;
+				list_del(&buf->node);
+				break;
+			}
+		}
+	}
+	spin_unlock(&fl->lock);
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock(&fl->lock);
+			list_add_tail(&buf->node, &fl->spd->rmaps);
+			spin_unlock(&fl->lock);
+		}
+		return err;
+	}
+	dev_err(dev, "buffer not found addr 0x%09lx, len 0x%08llx\n",
+			req.vaddrout, req.size);
+	return -EINVAL;
 }
 
+
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
@@ -1993,16 +2107,34 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
+	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
+		if (!fl->spd || !fl->spd->ispdup) {
+			dev_err(dev, "remote heap request supported only for active static PD\n");
+			return -EINVAL;
+		}
 		err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
-	else
+	} else {
 		err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
+	}
 
 	if (err) {
 		dev_err(dev, "failed to allocate buffer\n");
 		return err;
 	}
+	buf->flag = req.flags;
 
+	/* Add memory to static PD pool, protection through hypervisor */
+	if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && fl->cctx->vmcount) {
+		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
+
+		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
+			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
+		if (err) {
+			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
+					buf->phys, buf->size, err);
+			goto err_invoke;
+		}
+	}
 	req_msg.pgid = fl->tgid;
 	req_msg.flags = req.flags;
 	req_msg.vaddr = req.vaddrin;
@@ -2034,26 +2166,17 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	/* let the client know the address to use */
 	req.vaddrout = rsp_msg.vaddr;
 
-	/* Add memory to static PD pool, protection thru hypervisor */
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
-		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
-			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
-		if (err) {
-			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
-					buf->phys, buf->size, err);
-			goto err_assign;
-		}
-	}
 
 	spin_lock(&fl->lock);
-	list_add_tail(&buf->node, &fl->mmaps);
+	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
+		list_add_tail(&buf->node, &fl->spd->rmaps);
+	else
+		list_add_tail(&buf->node, &fl->mmaps);
 	spin_unlock(&fl->lock);
 
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		err = -EFAULT;
-		goto err_assign;
+		goto err_copy;
 	}
 
 	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
@@ -2061,14 +2184,19 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	return 0;
 
-err_assign:
+err_copy:
+	spin_lock(&fl->lock);
+	list_del(&buf->node);
+	spin_unlock(&fl->lock);
 	fastrpc_req_munmap_impl(fl, buf);
+	buf = NULL;
 err_invoke:
 	fastrpc_buf_free(buf);
 
 	return err;
 }
 
+
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
@@ -2292,6 +2420,7 @@ static void fastrpc_pdr_cb(int state, char *service_path, void *priv)
 			spd->servloc_name,
 			domains[cctx->domain_id]);
 		spd->ispdup = false;
+		fastrpc_mmap_remove_pdr(spd);
 		fastrpc_notify_pdr_drivers(cctx, spd->servloc_name);
 		break;
 	case SERVREG_SERVICE_STATE_UP:
@@ -2443,6 +2572,7 @@ static int fastrpc_setup_service_locator(struct fastrpc_channel_ctx *cctx, char
 	cctx->spd[spd_session].servloc_name = client_name;
 	cctx->spd[spd_session].spdname = service_path;
 	cctx->spd[spd_session].cctx = cctx;
+	INIT_LIST_HEAD(&cctx->spd[spd_session].rmaps);
 	service = pdr_add_lookup(handle, service_name, service_path);
 	if (IS_ERR(service)) {
 		err = PTR_ERR(service);
@@ -2604,9 +2734,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->secure_fdevice)
 		misc_deregister(&cctx->secure_fdevice->miscdev);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
-
 	for (i = 0; i < FASTRPC_MAX_SPD; i++) {
 		if (cctx->spd[i].pdrhandle)
 			pdr_handle_release(cctx->spd[i].pdrhandle);
@@ -2614,6 +2741,8 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 
 	of_platform_depopulate(&rpdev->dev);
 
+	fastrpc_mmap_remove_ssr(cctx);
+
 	fastrpc_channel_ctx_put(cctx);
 }
 
-- 
2.43.0



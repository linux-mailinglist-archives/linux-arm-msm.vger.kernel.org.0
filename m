Return-Path: <linux-arm-msm+bounces-21986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DF78FF340
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AE711C26021
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCA919AA5F;
	Thu,  6 Jun 2024 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cf+wVnAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60A21991AB;
	Thu,  6 Jun 2024 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693235; cv=none; b=TzAgtqUaAU+b7y6CJRnlZtcLwaEtvjPvjg6ymnbEkifid/iJwJrj8PrGtum5IykMRNAEr7DDjxq/MTWFqPFSyVkGV8SC6xio+dwgJgKwI6ivdUcG+yk84dv4nZ41A4tgRERkTiMssW1RhOeCc8R10BDIpV2WYxyodICca7V7bAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693235; c=relaxed/simple;
	bh=m6r75pHrYZ+QlMMG17vHAwdWJbiWhlnYmf9K2PsWwnY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGIIYGGpjr1MUyTqhz0kDBM8wbWPhhhytfBIo0FFcV3rV3OX2gnsDk7CVRDOa+cTGKRw+BScQMfkGmkp14qLFhK5E9foJu77PP+BlV7CJCRJizbyZ33iZ4dhY5i27OqIDrRZw7sHzApcHQ9AjqAUYww7wHZueROhmIqWhCtMQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cf+wVnAd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456ALKGt027443;
	Thu, 6 Jun 2024 17:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFYgExhThgscEsHhsUWDLwWrHcVzWbJ2J5xZVh8xZAo=; b=cf+wVnAdk8mTFnd3
	8CRKZZ517eKsT0IRJRcd7qgSObL+BQZr+ZLcFyrNWF2SW3wa9QTfz/V2LZQxTtBQ
	yQU8NC91WRKQUaDMVWu/X6qg/QcY3DwxMlrtgeie8PNTGEN9WmwQGJY4VlKUMOP+
	vBXI6U1jIiSwlP2+UCew//v8W0aY7ny940EbarsgSX1kmcXkmat0pk6xvtbRLhjx
	FnVvyzINZsWt0Lxakuqd2RLalyAwHePAQixYLF/fS6iUcPLLc5a24kJ8i6eMrP8E
	JQbVsWS+pFcUXU4q/ZKLicjKrA9madWhtkuXA5LEsKogmt7nqK+epvijwMM5mZ+2
	w4Nniw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjq2tknqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 17:00:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456H0Eas007021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 17:00:14 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 10:00:12 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
Subject: [PATCH v4 09/11] misc: fastrpc: Fix remote heap alloc and free user request
Date: Thu, 6 Jun 2024 22:29:29 +0530
Message-ID: <20240606165939.12950-10-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: TBNncCVpiLe43Z3AdoJbs4DAiZjUqYUK
X-Proofpoint-ORIG-GUID: TBNncCVpiLe43Z3AdoJbs4DAiZjUqYUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060121

A static PD daemon process can request for remote heap allocation
which will allocate memory and change the ownership if the VMID
information were defined. This allocations are currently getting
added to fl mmaps list which could get freed when there is any
daemon kill. There is no way to request for freeing of this memory
also. Add changes to maintain the remote heap allocation in the
static PD specific structure and add method to free the memory
on user request.

Fixes: 532ad70c6d44 ("misc: fastrpc: Add mmap request assigning for static PD pool")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 129 +++++++++++++++++++++++++++++++----------
 1 file changed, 98 insertions(+), 31 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 68c1595446d5..32f2e6f625ed 100644
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
@@ -1924,29 +1925,54 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
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
-
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
@@ -1960,6 +1986,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err = 0;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1968,18 +1995,45 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
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
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -2008,15 +2062,34 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
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
+
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
@@ -2049,26 +2122,16 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
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
-
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
@@ -2076,8 +2139,12 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
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
 
-- 
2.43.0



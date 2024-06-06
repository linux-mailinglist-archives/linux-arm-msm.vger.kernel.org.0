Return-Path: <linux-arm-msm+bounces-21983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D537E8FF339
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DECC71C241FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E89B1990C9;
	Thu,  6 Jun 2024 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m7y5/wQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA71990C6;
	Thu,  6 Jun 2024 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693226; cv=none; b=hH1RdGO/m3WgDYeaBEIYQGxtYRH0jadT9sp+dC9JE9bRV9AivvH/vfgAMx/U3R4JgRNbZM4mqSsyhMpcJFOB6NK9vjRXjYXp7rl6OT9WOXfpcpXAfTO7itO9wGRuYfK9spR5igqzWBYq8gqxJBdeoAkDTtiaq6NlO6tye7foY5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693226; c=relaxed/simple;
	bh=p32yhajzquNPpIr8ptp+zIb1zAawxh6ByX7nztgK8UA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwHf1A2AFkqQ4KND/k804JMXNUY2k+KdfJ6IA01ErV6/syASMA5AJBe4P0UXdFjYpMOTnLfEZCpz8nSRZnZt7xAl9J2GF7vBKNVTf1No5qZPoJK6+mncmxI9SG5nF2uopWZYd0g3Cj6LU3GEqyZSXlSZZ3KtR/x0lVRE77nLgzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m7y5/wQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45698twx015611;
	Thu, 6 Jun 2024 17:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COLFFfWQxCC7JEak1vrmE4ylG3ORBwbp4vtz+cQHS/g=; b=m7y5/wQNsDxDCWW1
	+mphCT8BLGYJ5Mp95rNlm7DOp5i1MxYUuUjHCPqFbA9mehtM74IVZ5FnJ9mk+XrO
	8vjcCbYgCkR/MHzZCozrdAsoKWAx6Fdn80vRq+YuTySfZb4Kc1tpPIq2FjEp+UXb
	CYN6m0Uj4hkttsvyQHm/+mYgYwPRYcnLO4GBOraa6CwpJIfaYob5yCb/OWcvn6d0
	r18wIgCo97bcItqZvGlG2mochIAk9xL2pLovE/VAkE7fLwl9w3h3j2jkUFe8xcKc
	ht8maqX/5MR7tPJm3AqU97+C1meP+Fwb4NfwqTvSMSROh/+vUWWElUz7ir7Ol27M
	dgaFng==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yka7p93bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 17:00:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456H0Hiv026103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 17:00:17 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 10:00:14 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
Subject: [PATCH v4 10/11] misc: fastrpc: Fix unsigned PD support
Date: Thu, 6 Jun 2024 22:29:30 +0530
Message-ID: <20240606165939.12950-11-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: Onrx-GaOPwn41nYji4-zb9gw2kta6cxC
X-Proofpoint-ORIG-GUID: Onrx-GaOPwn41nYji4-zb9gw2kta6cxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060120

Unsigned PDs are sandboxed DSP processes used to offload computation
workloads to the DSP. Unsigned PD have less privileges in terms of
DSP resource access as compared to Signed PD.

Unsigned PD requires more initial memory to spawn. Also most of the
memory request are allocated from user space. Current initial memory
size is not sufficient and mapping request for user space allocated
buffer is not supported. This results in failure of unsigned PD offload
request. Add changes to fix initial memory size and user space allocated
buffer mapping support.

Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 180 ++++++++++++++++++++++++++++++-----------
 1 file changed, 133 insertions(+), 47 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 32f2e6f625ed..5ffb6098ac38 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -40,7 +40,7 @@
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
 #define FASTRPC_CTXID_MASK (0xFF0)
-#define INIT_FILELEN_MAX (2 * 1024 * 1024)
+#define INIT_FILELEN_MAX (5 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 
@@ -327,6 +327,7 @@ struct fastrpc_user {
 	int tgid;
 	int pd;
 	bool is_secure_dev;
+	bool is_unsigned_pd;
 	char *servloc_name;
 	/* Lock for lists */
 	spinlock_t lock;
@@ -1488,7 +1489,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		u32 siglen;
 	} inbuf;
 	u32 sc;
-	bool unsigned_module = false;
 
 	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
 	if (!args)
@@ -1500,9 +1500,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	}
 
 	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
-		unsigned_module = true;
+		fl->is_unsigned_pd = true;
 
-	if (is_session_rejected(fl, unsigned_module)) {
+	if (is_session_rejected(fl, fl->is_unsigned_pd)) {
 		err = -ECONNREFUSED;
 		goto err;
 	}
@@ -1985,6 +1985,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
+	struct fastrpc_map *map = NULL, *iterm, *m;
 	struct device *dev = fl->sctx->dev;
 	int err = 0;
 
@@ -2031,34 +2032,75 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 		}
 		return err;
 	}
-	dev_err(dev, "buffer not found addr 0x%09lx, len 0x%08llx\n",
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(iterm, m, &fl->maps, node) {
+		if (iterm->raddr == req.vaddrout) {
+			map = iterm;
+			break;
+		}
+	}
+	spin_unlock(&fl->lock);
+	if (!map) {
+		dev_dbg(dev, "buffer not found addr 0x%09llx, len 0x%08llx\n",
 			req.vaddrout, req.size);
-	return -EINVAL;
+		return -EINVAL;
+	}
+
+	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+	if (err)
+		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
+	else
+		fastrpc_map_put(map);
+
+	return err;
 }
 
-static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
+			u64 size, u32 flag, uintptr_t vaddrin, u64 *raddr)
 {
 	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
-	struct fastrpc_buf *buf = NULL;
 	struct fastrpc_mmap_req_msg req_msg;
 	struct fastrpc_mmap_rsp_msg rsp_msg;
 	struct fastrpc_phy_page pages;
-	struct fastrpc_req_mmap req;
-	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
 
-	if (copy_from_user(&req, argp, sizeof(req)))
-		return -EFAULT;
+	req_msg.pgid = fl->tgid;
+	req_msg.flags = flag;
+	req_msg.vaddr = vaddrin;
+	req_msg.num = sizeof(pages);
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		dev_err(dev, "flag not supported 0x%x\n", req.flags);
+	args[0].ptr = (u64) (uintptr_t) &req_msg;
+	args[0].length = sizeof(req_msg);
 
-		return -EINVAL;
+	pages.addr = phys;
+	pages.size = size;
+
+	args[1].ptr = (u64) (uintptr_t) &pages;
+	args[1].length = sizeof(pages);
+	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
+					  &args[0]);
+
+	if (err) {
+		dev_err(fl->sctx->dev, "mmap error (len 0x%08llx)\n", size);
+		return err;
 	}
+	*raddr = rsp_msg.vaddr;
+
+	return err;
+}
+
+static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
+			struct fastrpc_req_mmap req, char __user *argp)
+{
+	struct device *dev = fl->sctx->dev;
+	struct fastrpc_buf *buf = NULL;
+	u64 raddr = 0;
+	int err;
 
 	if (req.vaddrin) {
-		dev_err(dev, "adding user allocated pages is not supported\n");
+		dev_err(dev, "adding user allocated pages is not supported for signed PD\n");
 		return -EINVAL;
 	}
 
@@ -2091,36 +2133,16 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		}
 	}
 
-	req_msg.pgid = fl->tgid;
-	req_msg.flags = req.flags;
-	req_msg.vaddr = req.vaddrin;
-	req_msg.num = sizeof(pages);
-
-	args[0].ptr = (u64) (uintptr_t) &req_msg;
-	args[0].length = sizeof(req_msg);
-
-	pages.addr = buf->phys;
-	pages.size = buf->size;
-
-	args[1].ptr = (u64) (uintptr_t) &pages;
-	args[1].length = sizeof(pages);
-
-	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
-	args[2].length = sizeof(rsp_msg);
-
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
-	if (err) {
-		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
+	err = fastrpc_req_map_dsp(fl, buf->phys, buf->size, buf->flag,
+				req.vaddrin, &raddr);
+	if (err)
 		goto err_invoke;
-	}
 
 	/* update the buffer to be able to deallocate the memory on the DSP */
-	buf->raddr = (uintptr_t) rsp_msg.vaddr;
+	buf->raddr = (uintptr_t) raddr;
 
 	/* let the client know the address to use */
-	req.vaddrout = rsp_msg.vaddr;
+	req.vaddrout = raddr;
 
 	spin_lock(&fl->lock);
 	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
@@ -2129,16 +2151,14 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		list_add_tail(&buf->node, &fl->mmaps);
 	spin_unlock(&fl->lock);
 
+	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
+		buf->raddr, buf->size);
+
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		err = -EFAULT;
 		goto err_copy;
 	}
-
-	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
-		buf->raddr, buf->size);
-
 	return 0;
-
 err_copy:
 	spin_lock(&fl->lock);
 	list_del(&buf->node);
@@ -2146,11 +2166,77 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	fastrpc_req_munmap_impl(fl, buf);
 	buf = NULL;
 err_invoke:
-	fastrpc_buf_free(buf);
+	if (buf)
+		fastrpc_buf_free(buf);
+
+	return err;
+}
+
+static int fastrpc_req_map_create(struct fastrpc_user *fl,
+			struct fastrpc_req_mmap req, char __user *argp)
+{
+	struct fastrpc_map *map = NULL;
+	struct device *dev = fl->sctx->dev;
+	u64 raddr = 0;
+	int err;
+
+	if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && fl->is_unsigned_pd) {
+		dev_err(dev, "secure memory allocation is not supported in unsigned PD\n");
+		return -EINVAL;
+	}
+	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
+	if (err) {
+		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
+		return err;
+	}
+
+	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
+				req.vaddrin, &raddr);
+	if (err)
+		goto err_invoke;
+
+	/* update the buffer to be able to deallocate the memory on the DSP */
+	map->raddr = (uintptr_t) raddr;
+
+	/* let the client know the address to use */
+	req.vaddrout = raddr;
+	dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
+		map->raddr, map->size);
+
+	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
+		err = -EFAULT;
+		goto err_copy;
+	}
+	return 0;
+err_copy:
+	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+err_invoke:
+	fastrpc_map_put(map);
 
 	return err;
 }
 
+static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_req_mmap req;
+	int err;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
+	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && !fl->is_unsigned_pd) {
+		err = fastrpc_req_buf_alloc(fl, req, argp);
+		if (err)
+			return err;
+	} else {
+		err = fastrpc_req_map_create(fl, req, argp);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
-- 
2.43.0



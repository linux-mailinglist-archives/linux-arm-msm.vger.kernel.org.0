Return-Path: <linux-arm-msm+bounces-21083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C18D498D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 037C71F21A7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D821822E1;
	Thu, 30 May 2024 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QYj8rcaM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196FF17E467;
	Thu, 30 May 2024 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064467; cv=none; b=oXS7QLAMiRa0Z9ygFiI8ZROU64Y3d1Hkq58RQvIS74cbx4fj2XlAYQB0uNWSlwAsaMozs3c2Fm6kyBtJ0Ni1cXz933qHmsFKFb/UKCb9wKnpvVn9PZzwdk6vPjJ7v/HRmQ3vYGmTslHtMQ1C1yJIoGbKtCgQaXJwbLTHm0Tyh1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064467; c=relaxed/simple;
	bh=6KdX+5njdymJKO0qcdW+dnYulR6DY/GbtrLYVUntsvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lYsdaR+dT61f+TySmarIvchpgjwTY0OB5jgDESdLH0U9SAiBJmr/MZynpeFwBJWxBpju2sGViYpTN/Vi4N0zH4ZIo01aSzFV5p/RwanCUUeezE2bObv1Vj6/fsHMDHcuSgy+UONPN6n4GekEKh1WuSVaXgxwMdqpGfF3DLWG28o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QYj8rcaM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U8xLxe012513;
	Thu, 30 May 2024 10:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	US63t+Yz1Uf22K3LrCU7j64FxBUX2lmKIMBiTQrgHFk=; b=QYj8rcaMwzzb2vII
	vHG+cZ9G4s66uU8D5i5g/Jg/VQpD13d7TCuwe2uAOlSbr9qWWfq4SZS1CqtqMy9z
	IU0hKV55sygpfiBpU9UpbFTwxutBoIscOfnm2+gAb+GJdr6Jhl8HDM1nWbomr6ib
	Jpw/BZk8SWG3Hv39rjbsdeBYcCsXDEdAVyY6T4mOIcQ9/80xd8lVuWr9bVdKn0zB
	kTMVDzYCJ5+EELm0FXGFHvTLnBpr7OR83xVR6ar/UALFbBmua4bI7O6/nLQwumC3
	v0FyVnRliNXjLJOJwQJb6yg9OKftRZtYutNJi1nM1DMD07kQlCVzb6RhHDRFzwPq
	MwJxeg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qknv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:21:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44UAKxsK020577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:20:59 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 03:20:56 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
Subject: [PATCH v3 6/9] misc: fastrpc: Fix unsigned PD support
Date: Thu, 30 May 2024 15:50:24 +0530
Message-ID: <20240530102032.27179-7-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: 0mXgfIR3c7xyP_V_YoXeKYHx3MAMXyX2
X-Proofpoint-ORIG-GUID: 0mXgfIR3c7xyP_V_YoXeKYHx3MAMXyX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300078

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
 drivers/misc/fastrpc.c | 221 ++++++++++++++++++++++++++---------------
 1 file changed, 141 insertions(+), 80 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ef9bbd8c3dd1..d9d9f889e39e 100644
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
@@ -1500,9 +1500,10 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	}
 
 	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
-		unsigned_module = true;
+		fl->is_unsigned_pd = true;
 
-	if (is_session_rejected(fl, unsigned_module)) {
+
+	if (is_session_rejected(fl, fl->is_unsigned_pd)) {
 		err = -ECONNREFUSED;
 		goto err;
 	}
@@ -1986,6 +1987,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
+	struct fastrpc_map *map = NULL, *iterm, *m;
 	struct device *dev = fl->sctx->dev;
 	int err = 0;
 
@@ -2032,76 +2034,49 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
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
-}
+		return -EINVAL;
+	}
 
+	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+	if (err)
+		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
+	else
+		fastrpc_map_put(map);
 
-static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+	return err;
+}
+
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
-
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		dev_err(dev, "flag not supported 0x%x\n", req.flags);
-
-		return -EINVAL;
-	}
-
-	if (req.vaddrin) {
-		dev_err(dev, "adding user allocated pages is not supported\n");
-		return -EINVAL;
-	}
-
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		if (!fl->spd || !fl->spd->ispdup) {
-			dev_err(dev, "remote heap request supported only for active static PD\n");
-			return -EINVAL;
-		}
-		err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
-	} else {
-		err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
-	}
-
-	if (err) {
-		dev_err(dev, "failed to allocate buffer\n");
-		return err;
-	}
-	buf->flag = req.flags;
-
-	/* Add memory to static PD pool, protection through hypervisor */
-	if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && fl->cctx->vmcount) {
-		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
-			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
-		if (err) {
-			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
-					buf->phys, buf->size, err);
-			goto err_invoke;
-		}
-	}
 	req_msg.pgid = fl->tgid;
-	req_msg.flags = req.flags;
-	req_msg.vaddr = req.vaddrin;
+	req_msg.flags = flag;
+	req_msg.vaddr = vaddrin;
 	req_msg.num = sizeof(pages);
 
 	args[0].ptr = (u64) (uintptr_t) &req_msg;
 	args[0].length = sizeof(req_msg);
 
-	pages.addr = buf->phys;
-	pages.size = buf->size;
+	pages.addr = phys;
+	pages.size = size;
 
 	args[1].ptr = (u64) (uintptr_t) &pages;
 	args[1].length = sizeof(pages);
@@ -2111,49 +2086,135 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
+					  &args[0]);
+
 	if (err) {
-		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
-		goto err_invoke;
+		dev_err(fl->sctx->dev, "mmap error (len 0x%08llx)\n", size);
+		return err;
 	}
+	*raddr = rsp_msg.vaddr;
 
-	/* update the buffer to be able to deallocate the memory on the DSP */
-	buf->raddr = (uintptr_t) rsp_msg.vaddr;
+	return err;
+}
 
-	/* let the client know the address to use */
-	req.vaddrout = rsp_msg.vaddr;
+static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_buf *buf = NULL;
+	struct fastrpc_req_mmap req;
+	struct fastrpc_map *map = NULL;
+	struct device *dev = fl->sctx->dev;
+	u64 raddr = 0;
+	int err;
 
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
 
-	spin_lock(&fl->lock);
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
-		list_add_tail(&buf->node, &fl->spd->rmaps);
-	else
-		list_add_tail(&buf->node, &fl->mmaps);
-	spin_unlock(&fl->lock);
+	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
+		req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && !fl->is_unsigned_pd) {
+		if (req.vaddrin) {
+			dev_err(dev, "adding user allocated pages is not supported for signed PD\n");
+			return -EINVAL;
+		}
+
+		if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
+			if (!fl->spd || !fl->spd->ispdup) {
+				dev_err(dev, "remote heap request supported only for active static PD\n");
+				return -EINVAL;
+			}
+			err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
+		} else {
+			err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
+		}
+
+		if (err) {
+			dev_err(dev, "failed to allocate buffer\n");
+			return err;
+		}
+		buf->flag = req.flags;
+
+		/* Add memory to static PD pool, protection through hypervisor */
+		if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && fl->cctx->vmcount) {
+			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
+
+			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
+				&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
+			if (err) {
+				dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
+						buf->phys, buf->size, err);
+				goto err_invoke;
+			}
+		}
+
+		err = fastrpc_req_map_dsp(fl, buf->phys, buf->size, buf->flag,
+					req.vaddrin, &raddr);
+		if (err)
+			goto err_invoke;
+
+		/* update the buffer to be able to deallocate the memory on the DSP */
+		buf->raddr = (uintptr_t) raddr;
+
+		/* let the client know the address to use */
+		req.vaddrout = raddr;
 
+		spin_lock(&fl->lock);
+		if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
+			list_add_tail(&buf->node, &fl->spd->rmaps);
+		else
+			list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
+		dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
+			buf->raddr, buf->size);
+	} else {
+		if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && fl->is_unsigned_pd) {
+			dev_err(dev, "secure memory allocation is not supported in unsigned PD\n");
+			return -EINVAL;
+		}
+		err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
+		if (err) {
+			dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
+			return err;
+		}
+
+		err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
+					req.vaddrin, &raddr);
+		if (err)
+			goto err_invoke;
+
+		/* update the buffer to be able to deallocate the memory on the DSP */
+		map->raddr = (uintptr_t) raddr;
+
+		/* let the client know the address to use */
+		req.vaddrout = raddr;
+		dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
+			map->raddr, map->size);
+	}
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		err = -EFAULT;
 		goto err_copy;
 	}
 
-	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
-		buf->raddr, buf->size);
-
 	return 0;
 
 err_copy:
-	spin_lock(&fl->lock);
-	list_del(&buf->node);
-	spin_unlock(&fl->lock);
-	fastrpc_req_munmap_impl(fl, buf);
-	buf = NULL;
+	if ((req.flags != ADSP_MMAP_ADD_PAGES &&
+		req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) || fl->is_unsigned_pd) {
+		fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+	} else {
+		spin_lock(&fl->lock);
+		list_del(&buf->node);
+		spin_unlock(&fl->lock);
+		fastrpc_req_munmap_impl(fl, buf);
+		buf = NULL;
+	}
 err_invoke:
-	fastrpc_buf_free(buf);
+	if (map)
+		fastrpc_map_put(map);
+	if (buf)
+		fastrpc_buf_free(buf);
 
 	return err;
 }
 
-
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
-- 
2.43.0



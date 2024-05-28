Return-Path: <linux-arm-msm+bounces-20718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5050C8D1976
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BED661F232C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2277316C84D;
	Tue, 28 May 2024 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="No8CWxVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D8016C862;
	Tue, 28 May 2024 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895830; cv=none; b=uT7IvDdDcksZyB3cLXXf9ay0EK5kyddCEQqPYFcZT8tHCYrnCXBEtrSKGEFErKebwb2Ca50dKPdwJ3KoqQv92Gbl11VN9iBghyRwMSL83jxdSgD3iVFyBKHO8Rkx+O5zCqWLT8vBVL03/ISSpAJUJX4RhN13MVwnDIto43eoN0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895830; c=relaxed/simple;
	bh=GGPEFyzdkqFePe+1NEUDwoSleY9w+XMpe5aRBUHvTVE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r7mXoIRbODuJWppJHryoypiGoaHUKxOAnw4rdN52ETofob9FImGC0CmwedQDREMCkIo40iDfttLPwfFbkInuSaCZvhB7yqGBGueToxPMatA0Ef1d2eiuOXvN2g5vKLZ7aKJsXN9iTbkUeSaPne7n5kEFs+e4gbxM/MtQOY9VaG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=No8CWxVt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RNjQXf014007;
	Tue, 28 May 2024 11:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5UxKo/khzjb9DNkjj5+rQwoA5eCGOuDH8oBnKUEod4=; b=No8CWxVtESIfU5dJ
	TEDWNMpAmomf3WI5AozdzEk80d/Wa9K/ZSUFuLNNRYfa4g1ld+juxWZzhEtHnX64
	w6AARBTEkPBPR3xnUzPwEhMoXOmjpcAwv747w+xmq3fKuIzvgDIOwNhdhalLPK8S
	nVhiI1tDxLeHUehdShnfhvriqcmidXtfKJmFPV8YaiFU1/SjL7bd0Cyl1fcC8gJS
	wzmj5GvBIOgATa5TIurxr1O621kTLT7hNEnGikHWXz5iqMuSidxE1HaZlkiMnwsH
	Kd3mu5lfazPrwWU02TxcGyJwN5ycW+nsN+tWwqWrmoRYvUrvcRfmilXHarulLnqy
	yG6vZw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ybadx5uwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBUNNw028014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:23 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:30:20 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v2 6/8] misc: fastrpc: Add support for unsigned PD
Date: Tue, 28 May 2024 16:59:52 +0530
Message-ID: <20240528112956.5979-7-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: egUKivdPp3s5xxVvagvfrkxKIketbJRI
X-Proofpoint-GUID: egUKivdPp3s5xxVvagvfrkxKIketbJRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405280087

Unsigned PDs are sandboxed DSP processes used to offload computation
workloads to the DSP. Unsigned PD have less privileges in terms of
DSP resource access as compared to Signed PD.

Unsigned PD requires more initial memory to spawn. Also most of
the memory request are allocated from userspace. Add support for
unsigned PD by increasing init memory size and handling mapping
request for cases other than DSP heap grow requests.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 227 ++++++++++++++++++++++++++---------------
 1 file changed, 147 insertions(+), 80 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1c0e5d050fd4..23dd20c22f6d 100644
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
 
@@ -119,6 +119,11 @@
 #define SENSORS_PDR_SLPI_SERVICE_NAME            SENSORS_PDR_ADSP_SERVICE_NAME
 #define SLPI_SENSORPD_NAME                       "msm/slpi/sensor_pd"
 
+enum fastrpc_userpd_type {
+	SIGNED_PD			= 1,
+	UNSIGNED_PD			= 2,
+};
+
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
 						"sdsp", "cdsp"};
 struct fastrpc_phy_page {
@@ -326,6 +331,7 @@ struct fastrpc_user {
 	int tgid;
 	int pd;
 	bool is_secure_dev;
+	enum fastrpc_userpd_type userpd_type;
 	char *servloc_name;
 	/* Lock for lists */
 	spinlock_t lock;
@@ -1515,7 +1521,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		u32 siglen;
 	} inbuf;
 	u32 sc;
-	bool unsigned_module = false;
 
 	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
 	if (!args)
@@ -1527,9 +1532,10 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	}
 
 	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
-		unsigned_module = true;
+		fl->userpd_type = UNSIGNED_PD;
 
-	if (is_session_rejected(fl, unsigned_module)) {
+
+	if (is_session_rejected(fl, !(fl->userpd_type == SIGNED_PD))) {
 		err = -ECONNREFUSED;
 		goto err;
 	}
@@ -1742,6 +1748,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	fl->tgid = current->tgid;
 	fl->cctx = cctx;
 	fl->is_secure_dev = fdevice->secure;
+	fl->userpd_type = SIGNED_PD;
 
 	fl->sctx = fastrpc_session_alloc(cctx);
 	if (!fl->sctx) {
@@ -2029,6 +2036,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
+	struct fastrpc_map *map = NULL, *iterm, *m;
 	struct device *dev = fl->sctx->dev;
 	int err = 0;
 
@@ -2075,76 +2083,49 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
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
+		dev_err(dev, "buffer not found addr 0x%09llx, len 0x%08llx\n",
 			req.vaddrout, req.size);
-	return -EINVAL;
-}
+		return -EINVAL;
+	}
 
+	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+	if (err)
+		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
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
@@ -2154,49 +2135,135 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
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
+			req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && (fl->userpd_type == SIGNED_PD)) {
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
 
+		/* let the client know the address to use */
+		req.vaddrout = raddr;
+
+		spin_lock(&fl->lock);
+		if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
+			list_add_tail(&buf->node, &fl->spd->rmaps);
+		else
+			list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
+		dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
+			buf->raddr, buf->size);
+	} else {
+		if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && (fl->userpd_type != SIGNED_PD)) {
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
+		req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) || fl->userpd_type != SIGNED_PD) {
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



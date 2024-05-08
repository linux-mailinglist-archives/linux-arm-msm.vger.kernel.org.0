Return-Path: <linux-arm-msm+bounces-19462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27A58BF5A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 07:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79DCA285726
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 05:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB3223772;
	Wed,  8 May 2024 05:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J84qVRFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9975822338;
	Wed,  8 May 2024 05:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715146990; cv=none; b=SfiDsGoAbNXc4zNqGlLmguZwJSiUAr1skktJy2Dc+NydxfIcyXQdfwb4A2Jl4jcImuIqDt1kdBFrexgqRg8b2eoGXXDzA7RweYvN6sDj0iSt77Nt6nlN9aGFdanpm0hpE9JXtEh9NLI9A8xcdkSqNpZ1rHAnRLYIbU5CcoBdYgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715146990; c=relaxed/simple;
	bh=wDMLl84sNyRxvj3sb83VHmq1lNqPIUejEGPRFKMwKjA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JHan9JNPj0sCkGdWh04t4/rxmAO/idRjxHouimflYWRED26+W0I2xpftjwlbe4GwySBZM2ERaWMNYKE30/ylpI3u2MzZyB7OXJgLR9weqdDfkQQwDfqaEzee/fBv2wlKMNl6i8Fe2TuYyOB2c4BsI5FX3BvASHA7hL1IHdWd3lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J84qVRFR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4484CHdT002221;
	Wed, 8 May 2024 05:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=JnnPJAye/s3LgP7qkKjWEHTVJ4aGryzQ1UG+TtVdsnQ=; b=J8
	4qVRFRfa0lDQLZQHvWZCImTmdEPRHUI1Xyzjz/MIGYPTFMc57kCCYhZx8jpZ81L8
	dvEHkjelfTNtVdpDv2pfO9RNTW3ThLtx2JvljEtnY/QnbbNxqhbayBjxP+oDgBsn
	LxgciBkajD3VtudY0M6imW8up+gQLFLoiTun158gvv8zfsBiCkgsGkIWiXm92FBk
	BnuDHDLM/MLRsyVHEtzvX5pZ79aSIuruEWB/U0J4p/w3PITycDJiMEIIF8CJbSLY
	7mErmdzBWCaMXcB26BGjaG7991nBMhF29YB23gBmO8Fwr5TQ5uLYdf6rQXP8+1EQ
	woPBNUFYOiUpdiw834iA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysg4s1yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 05:43:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4485h47h004154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 05:43:04 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 22:43:02 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/5] misc: fastrpc: Add support for unsigned PD
Date: Wed, 8 May 2024 11:12:45 +0530
Message-ID: <20240508054250.2922-3-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508054250.2922-1-quic_ekangupt@quicinc.com>
References: <20240508054250.2922-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: 6BtoK4iZ1C8VTD3DnGpYE9yoYNmUU90n
X-Proofpoint-ORIG-GUID: 6BtoK4iZ1C8VTD3DnGpYE9yoYNmUU90n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080040

Unsigned PDs are sandboxed DSP processes used to offload computation
workloads to the DSP. Unsigned PD have less privileges in terms of
DSP resource access as compared to Signed PD.

Unsigned PD requires more initial memory to spawn. Also most of
the memory request are allocated from userspace. Add support for
unsigned PD by increasing init memory size and handling mapping
request for cases other than DSP heap grow requests.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 188 ++++++++++++++++++++++++++---------------
 1 file changed, 119 insertions(+), 69 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c0c85bc4c413..258f2b9da039 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,7 +38,7 @@
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
 #define FASTRPC_CTXID_MASK (0xFF0)
-#define INIT_FILELEN_MAX (2 * 1024 * 1024)
+#define INIT_FILELEN_MAX (5 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 
@@ -302,6 +302,7 @@ struct fastrpc_user {
 	int tgid;
 	int pd;
 	bool is_secure_dev;
+	bool is_unsigned_pd;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -1409,7 +1410,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		u32 siglen;
 	} inbuf;
 	u32 sc;
-	bool unsigned_module = false;
 
 	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
 	if (!args)
@@ -1421,9 +1421,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	}
 
 	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
-		unsigned_module = true;
+		fl->is_unsigned_pd = true;
 
-	if (is_session_rejected(fl, unsigned_module)) {
+	if (is_session_rejected(fl, fl->is_unsigned_pd)) {
 		err = -ECONNREFUSED;
 		goto err;
 	}
@@ -1960,6 +1960,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_mmap_rsp_msg rsp_msg;
 	struct fastrpc_phy_page pages;
 	struct fastrpc_req_mmap req;
+	struct fastrpc_map *map = NULL;
 	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
@@ -1968,96 +1969,145 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		dev_err(dev, "flag not supported 0x%x\n", req.flags);
+	if (req.flags == ADSP_MMAP_ADD_PAGES || req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
+		if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->is_unsigned_pd) {
+			dev_err(dev, "secure memory allocation is not supported in unsigned PD\n");
+			return -EINVAL;
+		}
+		if (req.vaddrin && !fl->is_unsigned_pd) {
+			dev_err(dev, "adding user allocated pages is not supported\n");
+			return -EINVAL;
+		}
 
-		return -EINVAL;
-	}
+		if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
+			err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
+		else
+			err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
 
-	if (req.vaddrin) {
-		dev_err(dev, "adding user allocated pages is not supported\n");
-		return -EINVAL;
-	}
+		if (err) {
+			dev_err(dev, "failed to allocate buffer\n");
+			return err;
+		}
 
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
-		err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
-	else
-		err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
+		req_msg.pgid = fl->tgid;
+		req_msg.flags = req.flags;
+		req_msg.vaddr = req.vaddrin;
+		req_msg.num = sizeof(pages);
 
-	if (err) {
-		dev_err(dev, "failed to allocate buffer\n");
-		return err;
-	}
+		args[0].ptr = (u64) (uintptr_t) &req_msg;
+		args[0].length = sizeof(req_msg);
 
-	req_msg.pgid = fl->tgid;
-	req_msg.flags = req.flags;
-	req_msg.vaddr = req.vaddrin;
-	req_msg.num = sizeof(pages);
+		pages.addr = buf->phys;
+		pages.size = buf->size;
 
-	args[0].ptr = (u64) (uintptr_t) &req_msg;
-	args[0].length = sizeof(req_msg);
+		args[1].ptr = (u64) (uintptr_t) &pages;
+		args[1].length = sizeof(pages);
 
-	pages.addr = buf->phys;
-	pages.size = buf->size;
+		args[2].ptr = (u64) (uintptr_t) &rsp_msg;
+		args[2].length = sizeof(rsp_msg);
 
-	args[1].ptr = (u64) (uintptr_t) &pages;
-	args[1].length = sizeof(pages);
+		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+		err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
+						  &args[0]);
+		if (err) {
+			dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
+			goto err_invoke;
+		}
 
-	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
-	args[2].length = sizeof(rsp_msg);
+		/* update the buffer to be able to deallocate the memory on the DSP */
+		buf->raddr = (uintptr_t) rsp_msg.vaddr;
+		buf->flag = req.flags;
 
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
-	if (err) {
-		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
-		goto err_invoke;
-	}
+		/* let the client know the address to use */
+		req.vaddrout = rsp_msg.vaddr;
 
-	/* update the buffer to be able to deallocate the memory on the DSP */
-	buf->raddr = (uintptr_t) rsp_msg.vaddr;
-	buf->flag = req.flags;
+		/* Add memory to static PD pool, protection thru hypervisor */
+		if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
+			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-	/* let the client know the address to use */
-	req.vaddrout = rsp_msg.vaddr;
+			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
+				&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
+			if (err) {
+				dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
+						buf->phys, buf->size, err);
+				goto err_assign;
+			}
+		}
 
-	/* Add memory to static PD pool, protection thru hypervisor */
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
-		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
+		if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
+			spin_lock_irqsave(&fl->cctx->lock, flags);
+			list_add_tail(&buf->node, &fl->cctx->rmaps);
+			spin_unlock_irqrestore(&fl->cctx->lock, flags);
+		} else {
+			spin_lock(&fl->lock);
+			list_add_tail(&buf->node, &fl->mmaps);
+			spin_unlock(&fl->lock);
+		}
 
-		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
-			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
-		if (err) {
-			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
-					buf->phys, buf->size, err);
+		if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
+			err = -EFAULT;
 			goto err_assign;
 		}
-	}
 
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		spin_lock_irqsave(&fl->cctx->lock, flags);
-		list_add_tail(&buf->node, &fl->cctx->rmaps);
-		spin_unlock_irqrestore(&fl->cctx->lock, flags);
+		dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
+			buf->raddr, buf->size);
 	} else {
-		spin_lock(&fl->lock);
-		list_add_tail(&buf->node, &fl->mmaps);
-		spin_unlock(&fl->lock);
-	}
+		err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
+		if (err) {
+			dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
+			return err;
+		}
 
-	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
-		err = -EFAULT;
-		goto err_assign;
-	}
+		req_msg.pgid = fl->tgid;
+		req_msg.flags = req.flags;
+		req_msg.vaddr = req.vaddrin;
+		req_msg.num = sizeof(pages);
 
-	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
-		buf->raddr, buf->size);
+		args[0].ptr = (u64) (uintptr_t) &req_msg;
+		args[0].length = sizeof(req_msg);
+
+		pages.addr = map->phys;
+		pages.size = map->size;
+
+		args[1].ptr = (u64) (uintptr_t) &pages;
+		args[1].length = sizeof(pages);
+
+		args[2].ptr = (u64) (uintptr_t) &rsp_msg;
+		args[2].length = sizeof(rsp_msg);
+
+		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+
+		err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
+					      &args[0]);
+		if (err) {
+			dev_err(dev, "mmap error (len 0x%08llx)\n", map->size);
+			goto err_invoke;
+		}
+
+		/* update the buffer to be able to deallocate the memory on the DSP */
+		map->raddr = (uintptr_t) rsp_msg.vaddr;
+
+		/* let the client know the address to use */
+		req.vaddrout = rsp_msg.vaddr;
+
+		if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
+			err = -EFAULT;
+			goto err_assign;
+		}
+	}
 
 	return 0;
 
 err_assign:
-	fastrpc_req_munmap_impl(fl, buf);
+	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR)
+		fastrpc_map_put(map);
+	else
+		fastrpc_req_munmap_impl(fl, buf);
 err_invoke:
-	fastrpc_buf_free(buf);
+	if (map)
+		fastrpc_map_put(map);
+	if (buf)
+		fastrpc_buf_free(buf);
 
 	return err;
 }
-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-21984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ED88FF33B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7E9291729
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17E619A2A2;
	Thu,  6 Jun 2024 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hANdAVyw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B1219596A;
	Thu,  6 Jun 2024 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693231; cv=none; b=c6HK0hV+eEA+Fme+gk6TijyxxfiUtEHhyRjdFNpVnIMoeoVLYkhtBFYx+xFTMCmiYUxiy47c9V3wn16Ixypv6JO1BJpbGdfjPOUTKiJjyG8siruNPj4y0WImBbmt1/cFROTm1M482SfFjAX8XaLbepZa3puZrMHTqAToCktKnEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693231; c=relaxed/simple;
	bh=61gY3hTQriREDzwpsfPz5vE82xlNQq0cH2aNCderw3g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MWQh2mVhCuDcx3GWm2FPurFEltZzHqi39/ZI4iiCMrLYVPA2WHF/qeaF+F5EnJ3q23zL0sVbr6bEZOBaxl2sk08ODAaPQjfWNmg7y3bQjNTnEEq4a3bILTNKLIJACY61cfTZUuSQjW5KmoP2kWQVRz/kjb8MsVhxSl9ooNZxTCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hANdAVyw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456Fm0Q0028989;
	Thu, 6 Jun 2024 17:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	72X1LtE0KF1BC5pgvv80neHbryarkq6FZsVg1ZmpLyc=; b=hANdAVywUDp21sFS
	nIBzmyrNMPHTIN/FiG31Ab0RXKOv8oeqYn0F9blhbBvSEcPK0/dZFNkVXcWUq98x
	JyrLqQyzibeA8/tdbhxnh/k668/Id4LOHyCmjMKgtubJ+hUviMzuGVAA0QAfrij/
	w/UnAjW28yfAMWgj6FjvPV1NsZL2j87mSSU7hlbjR3TY08XnweflbJwVMxLIa0/C
	nXxW6JJWUmiTYTOt2nVrx4QU3BT7Cew+Qr18BSJd4h6UTl9vSU9J+xQxtvUSfocH
	7FHWvpZnHxGVuTqaHXfAWz/tM6FHPs/gnn7w7QmO+s+1+HbkEwpWa8Hp9G9CtWtj
	vNO9PA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ykg2qg5t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 17:00:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456H09VD006618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 17:00:09 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 10:00:06 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v4 07/11] misc: fastrpc: Redesign remote heap management
Date: Thu, 6 Jun 2024 22:29:27 +0530
Message-ID: <20240606165939.12950-8-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: TuDeWkU4JUjoiytx2mCWKGgF1IgIGyyd
X-Proofpoint-ORIG-GUID: TuDeWkU4JUjoiytx2mCWKGgF1IgIGyyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060121

Current remote heap design is adding the memory to channel context
but here is also a possibility of audio daemon requesting new remote
heap memory using map ioctl. For this purpose, it's much easier to
maintain these types of static PD specific remote heap allocations
as a list. This remote heap memory is only getting freed during
rpmsg remove but it is also needed to be freed when static PD is
shutting down as this memory will no longed be used by static PDs.
For daemon kill cases where audio PD is still alive, the init IOCTL
will again take the same address and size to DSP which DSP would try
to map again which would result in mapping failure the PD might
already be using the memory. In Daemon kill cases, the address and
size is needed to be sent as zero and DSP will skip mapping in this
case. Add changes to manage remote heap in a way that it can be added
and removed as per needed and the information is sent as zero in daemon
kill cases.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 94 +++++++++++++++++++++++++++++++++---------
 1 file changed, 75 insertions(+), 19 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7ee8bb3a9a6f..3686b2d34741 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -274,6 +274,7 @@ struct fastrpc_session_ctx {
 };
 
 struct fastrpc_static_pd {
+	struct list_head rmaps;
 	char *servloc_name;
 	char *spdname;
 	void *pdrhandle;
@@ -299,7 +300,6 @@ struct fastrpc_channel_ctx {
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
-	struct fastrpc_buf *remote_heap;
 	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
@@ -1256,6 +1256,53 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
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
@@ -1282,7 +1329,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
 	struct fastrpc_phy_page pages[1];
+	struct fastrpc_buf *buf = NULL;
 	struct fastrpc_static_pd *spd = NULL;
+	u64 phys = 0, size = 0;
 	char *name;
 	int err;
 	struct {
@@ -1330,23 +1379,23 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
-							&src_perms,
-							fl->cctx->vmperms, fl->cctx->vmcount);
+			err = qcom_scm_assign_mem(phys, (u64)size,
+						&src_perms,
+						fl->cctx->vmperms, fl->cctx->vmcount);
 			if (err) {
 				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
-					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
+					phys, size, err);
 				goto err_map;
 			}
 		}
@@ -1365,8 +1414,8 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->phys;
-	pages[0].size = fl->cctx->remote_heap->size;
+	pages[0].addr = phys;
+	pages[0].size = size;
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1382,6 +1431,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	kfree(args);
 	kfree(name);
 
+	if (buf) {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &spd->rmaps);
+		spin_unlock(&fl->lock);
+	}
+
 	return 0;
 err_invoke:
 	if (fl->cctx->vmcount) {
@@ -1394,15 +1449,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
 		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
-						(u64)fl->cctx->remote_heap->size,
-						&src_perms, &dst_perms, 1);
+		err = qcom_scm_assign_mem(phys, (u64)size,
+					&src_perms, &dst_perms, 1);
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
@@ -2250,6 +2305,7 @@ static void fastrpc_pdr_cb(int state, char *service_path, void *priv)
 			spd->servloc_name,
 			domains[cctx->domain_id]);
 		spd->ispdup = false;
+		fastrpc_mmap_remove_pdr(spd);
 		fastrpc_notify_pdr_drivers(cctx, spd->servloc_name);
 		break;
 	case SERVREG_SERVICE_STATE_UP:
@@ -2401,6 +2457,7 @@ static int fastrpc_setup_service_locator(struct fastrpc_channel_ctx *cctx, char
 	cctx->spd[spd_session].servloc_name = client_name;
 	cctx->spd[spd_session].spdname = service_path;
 	cctx->spd[spd_session].cctx = cctx;
+	INIT_LIST_HEAD(&cctx->spd[spd_session].rmaps);
 	service = pdr_add_lookup(handle, service_name, service_path);
 	if (IS_ERR(service)) {
 		err = PTR_ERR(service);
@@ -2567,9 +2624,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
-
 	for (i = 0; i < FASTRPC_MAX_SPD; i++) {
 		if (cctx->spd[i].pdrhandle)
 			pdr_handle_release(cctx->spd[i].pdrhandle);
@@ -2577,6 +2631,8 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 
 	of_platform_depopulate(&rpdev->dev);
 
+	fastrpc_mmap_remove_ssr(cctx);
+
 	fastrpc_channel_ctx_put(cctx);
 }
 
-- 
2.43.0



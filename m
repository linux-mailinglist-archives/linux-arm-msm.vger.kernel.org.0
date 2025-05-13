Return-Path: <linux-arm-msm+bounces-57658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55336AB4A8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 06:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78391165E00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 04:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4C51E5B6A;
	Tue, 13 May 2025 04:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Go2jo/RJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173A41E570D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110521; cv=none; b=aSrcbT9Puh5q/wNyerUY0AxAGBRUrlhldITmVuLrGHtLvBctOtg+1zYz0FOLMITgzPPHqI0YnaTVJSDzc1A7LWfZIt9ztsIjGchBAffBDI96uhs/pIbfBVExqiQX3jgS/DZ6QQJaYz9bx/wWms5AnVwTY8Fw0mTtFUhVA8M5hpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110521; c=relaxed/simple;
	bh=oWCR1gkWJ5Ozp3f18wS0ekIwbkaN21aXHvSV+DM+JQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dO0K41RSjqWnmuzrysGOA1Eh0uYw+jgnmjDaxRmiUXiRsNoi72+viSfMLx8aAno3SWOwtpBAniY147i6/tGFj91ATeb2demBAox+93FG78WOx0Mpsfi45rSIOXLrZtJIEg0WyvoHefiNN+jgz0uwVsyKSbZopzgzbIadG+bbob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Go2jo/RJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D3maKl023589
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JBKTYpKkO0p
	hGBWecSjnY+M4MAGQXCre+WzNfXWOMeU=; b=Go2jo/RJcASnyPTMxi28UiOJHE+
	SC4BRR3zurlF4R8nyXhDKqzYuXg9nU4tvauuqyUD17R4FGIs8Nki9N6j1P6Tzo50
	q3Z/ktRsskwiWu/Y3ImSGv+/RN5khHkZbETNcR8woFHOHV2YDHAIEuk4Gq+ulnkM
	mB8+1lLwxESyuB32jcVZMjUvL/uaWbm2l6do36inizGNaY5Z9AAI0H0nSQU70v+D
	2+KekcmNq2gESWZvC11U2P/HE5BaihZ9TEkSlr+w3UPjByk7S+uVFQs5DZykXhHv
	fdXOYKVSKTIoa8oujTAAyGyBTGXtu9kFielc+cPZu0z3C6UvWdSAjxXXLng==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfejweu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-740b646ff9eso3780367b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 21:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747110516; x=1747715316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBKTYpKkO0phGBWecSjnY+M4MAGQXCre+WzNfXWOMeU=;
        b=Yf/I9GuPUHTT7SQ8jgDGNizgCfg0eO3tyA0bcYWUbZ/ceElKpZIBhKn9DSel1bePwg
         wHPnzjZSGAzT3e9aq5F5q2EOX5D/ps9ZMErCeMefHTV+5Huuhdw5+o143xj94vHA0hnw
         xKYRJ6wNRGZ5byw/Bzucgj2jSsk2RslPk/xR3iO3BMvh3jrtxoLc9sPtxgyT1atYZ/4i
         AD0GXDedW1DukZs8aa80ieBvdieJ2zlZqDrZ24xdZAQhU+UNWW7aBfRPIfjeqOpSuW1m
         4S8eEcCp53EzcJOals6S892HwbeBGIF1SOspcm8IUYrUD64GHQBA5Yw6m866jPljNB57
         /Cqw==
X-Forwarded-Encrypted: i=1; AJvYcCUzL5InniuDPcze+txR04VYByNFMeg3qcSmqJ5PnMhYUujaHrmOLsFpiMreHYSKmvhjNgi44azZOF2h4Dy/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/EJ3pbTaeRpKOlwlh4TDVJXxK/XWSkF62DxQNQdSaY7Iwz++u
	iAT4l2Fb2J4AkYna+9NMRAtOO4c2+iyyVwtrodCl/tOSz7ov8fjoM/bcmbSqk5fIgwvr6Xi/1Ga
	E/3L3tyIbCWDRToVQgn2ZH5UA+IMxi9bfXbLkGJIH+B2L4+aGMoSE/Wu3ODLfEU+2
X-Gm-Gg: ASbGncum8y5FHRAKnY1Tg5RoMMuCN0ShBhE7ZBZjA+dXFVW1JXyedLNCRWCCI/fSTq/
	wmQzJMPZUp2yq+8WHf7DUKz1lpirJDIhKGCzqshUTCUa2/3kWgWwCjVL0eHnAM0vptFVkfovzZO
	AjJP2KR1fxzuv9UgRnioaAKy55sH9pQxoMGxX59A4l6QTUckGbb4/A5PFzQyExAyfzpOaFvxXjF
	GW6FjOCHcD4Cz9ItxV9wZM5T66+s8mkOwC5ZwqL9TbcbzAIau61AFMbknd5wQh3+1loUqmokSA7
	QAkrJyA9DBUvpJJnxtYAI7oAZHfp9Rucw6VQlm+VIRqo
X-Received: by 2002:a05:6a21:329f:b0:215:df62:7d51 with SMTP id adf61e73a8af0-215df628053mr5732965637.11.1747110516373;
        Mon, 12 May 2025 21:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj8cGPKXqDpWef9yIeurebhtNZT+H7Bmo9NepDU0xQBRo7bKnmIjazNK/c1Ygs924EivHqHQ==
X-Received: by 2002:a05:6a21:329f:b0:215:df62:7d51 with SMTP id adf61e73a8af0-215df628053mr5732941637.11.1747110515935;
        Mon, 12 May 2025 21:28:35 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:28:35 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to a new list
Date: Tue, 13 May 2025 09:58:22 +0530
Message-Id: <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOSBTYWx0ZWRfX9ycMLbjOdWrw
 PQI2Ymak4vHeDs4qLwCdeTBu0W1igMzMJAz1s5BaU3o16JeLVxSR7E3y9oZB/QaBq+0ceD9D3G2
 AQ8jLPcLgq+pS4vSYZiRpubIKDrB62lREWp09xljRuTpka7V/dr3a/YNxwyBoysccT0ohxBOI3r
 L3h3/eudGuAwWDTq+r22LQiZx3kka7CjwkKg/4nXxwSEWFnD69HB/sSQNLtxET9i4u4dPlSrLdc
 uIPbvmGrfZ6PalNqHKToK1rE6FPJ6owOj5cOdCtU/sOxGV0jB0xVHtnkgLSfujoecylDO4eiqt9
 K6uZUgO5hpl/x/kMzUtBiDdq4nkuZcQqH50Hi86Qx5AeilYWDosoSAhZv4Cv/8HyPyLEkVqyz+D
 WsZq07w5PBcd95JSqoY5KCiWjAW4YB9BtrhqkvN12sw1CTivneA/4IUAUuGuwSKKJd+dt1dC
X-Proofpoint-ORIG-GUID: UA2R96B3xN2RUfGbhjNuFOjhlouu1DkI
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=6822ca75 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8PHFzVjbKYy-BIK1PrEA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: UA2R96B3xN2RUfGbhjNuFOjhlouu1DkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130039

Remote heap allocations are not organized in a maintainable manner,
leading to potential issues with memory management. As the remote
heap allocations are maintained in fl mmaps list, the allocations
will go away if the audio daemon process is killed but there are
chances that audio PD might still be using the memory. Move all
remote heap allocations to a dedicated list where the entries are
cleaned only for user requests and subsystem shutdown.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 21 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ca3721365ddc..d4e38b5e5e6c 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -273,10 +273,12 @@ struct fastrpc_channel_ctx {
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
 	bool valid_attributes;
+	/* Flag if audio PD init mem was allocated */
+	bool audio_init_mem;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
-	struct fastrpc_buf *remote_heap;
+	struct list_head rhmaps;
 	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
@@ -1237,12 +1239,47 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
 	return false;
 }
 
+static void fastrpc_cleanup_rhmaps(struct fastrpc_channel_ctx *cctx)
+{
+	struct fastrpc_buf *buf, *b;
+	struct list_head temp_list;
+	int err;
+	unsigned long flags;
+
+	INIT_LIST_HEAD(&temp_list);
+
+	spin_lock_irqsave(&cctx->lock, flags);
+	list_splice_init(&cctx->rhmaps, &temp_list);
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
+	list_for_each_entry_safe(buf, b, &temp_list, node) {
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
+						  &src_perms, &dst_perms, 1);
+			if (err)
+				continue;
+		}
+		fastrpc_buf_free(buf);
+	}
+}
+
 static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 					      char __user *argp)
 {
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
 	struct fastrpc_phy_page pages[1];
+	struct fastrpc_buf *buf = NULL;
+	u64 phys = 0, size = 0;
 	char *name;
 	int err;
 	bool scm_done = false;
@@ -1252,6 +1289,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		u32 pageslen;
 	} inbuf;
 	u32 sc;
+	unsigned long flags;
 
 	args = kcalloc(FASTRPC_CREATE_STATIC_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
 	if (!args)
@@ -1273,26 +1311,30 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
-	if (!fl->cctx->remote_heap) {
+	if (!fl->cctx->audio_init_mem) {
 		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
-						&fl->cctx->remote_heap);
+						&buf);
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
+			err = qcom_scm_assign_mem(phys, size, &src_perms,
+						  fl->cctx->vmperms, fl->cctx->vmcount);
 			if (err) {
 				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
-					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
+					phys, size, err);
 				goto err_map;
 			}
 			scm_done = true;
+			spin_lock_irqsave(&fl->cctx->lock, flags);
+			list_add_tail(&buf->node, &fl->cctx->rhmaps);
+			spin_unlock_irqrestore(&fl->cctx->lock, flags);
+			fl->cctx->audio_init_mem = true;
 		}
 	}
 
@@ -1309,8 +1351,8 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->phys;
-	pages[0].size = fl->cctx->remote_heap->size;
+	pages[0].addr = phys;
+	pages[0].size = size;
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1328,6 +1370,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 	return 0;
 err_invoke:
+	if (buf) {
+		spin_lock_irqsave(&fl->cctx->lock, flags);
+		list_del(&buf->node);
+		spin_unlock_irqrestore(&fl->cctx->lock, flags);
+	}
 	if (fl->cctx->vmcount && scm_done) {
 		u64 src_perms = 0;
 		struct qcom_scm_vmperm dst_perms;
@@ -1338,15 +1385,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
 		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
-						(u64)fl->cctx->remote_heap->size,
-						&src_perms, &dst_perms, 1);
+		err = qcom_scm_assign_mem(phys, size, &src_perms,
+					  &dst_perms, 1);
 		if (err)
 			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
-				fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
+				phys, size, err);
 	}
 err_map:
-	fastrpc_buf_free(fl->cctx->remote_heap);
+	fl->cctx->audio_init_mem = false;
+	fastrpc_buf_free(buf);
 err_name:
 	kfree(name);
 err:
@@ -1869,6 +1916,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
+	unsigned long flags;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1937,12 +1985,15 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 					buf->phys, buf->size, err);
 			goto err_assign;
 		}
+		spin_lock_irqsave(&fl->cctx->lock, flags);
+		list_add_tail(&buf->node, &fl->cctx->rhmaps);
+		spin_unlock_irqrestore(&fl->cctx->lock, flags);
+	} else {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
 	}
 
-	spin_lock(&fl->lock);
-	list_add_tail(&buf->node, &fl->mmaps);
-	spin_unlock(&fl->lock);
-
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		err = -EFAULT;
 		goto err_assign;
@@ -2362,6 +2413,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	rdev->dma_mask = &data->dma_mask;
 	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
 	INIT_LIST_HEAD(&data->users);
+	INIT_LIST_HEAD(&data->rhmaps);
 	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
 	spin_lock_init(&data->lock);
 	idr_init(&data->ctx_idr);
@@ -2420,8 +2472,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	fastrpc_cleanup_rhmaps(cctx);
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.34.1



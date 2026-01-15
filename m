Return-Path: <linux-arm-msm+bounces-89158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EC7D23292
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5BD33039F81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6932C239E9D;
	Thu, 15 Jan 2026 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hVI2nRWj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9zy3G2/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D473A337119
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465815; cv=none; b=dRLk/YSbBmIwxl2o2fiUxk2YymiMcTyte4eHCL12/iQnAvpe6Hl5g0S2W/76QiK4wnUZlNH7CbjzOskDKo0i/fI5+m15RqiMhLO4t50zMJV+EQwuOf5Qsm79b73ErdwK9/5mk2388kGblguA8Alz/tn6Yfwq/1sivWDazdWx46E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465815; c=relaxed/simple;
	bh=Bt0PcQMneI4KUYJQ68wmmXPifSyAdfuywiTPH2bnP5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ld3FS9Q+LWf1+4w76tIkECqafhr2xZ1sx2Se8ScwLbxwhwax0bHSbO6AMzoMPs6cjm+Meakel/0D+rWzOoYJY4/kq5YKBI4+LRH3859REQKjeGjZc5B9ROQ2UR39LX9VCmmLIlU6iPBJWXuEt6jES4FQ72aotr5ijqwlOStzs2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hVI2nRWj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9zy3G2/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fwsl1991681
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yRAomd5/Wnd
	mqPt4/KPViCWMZ2kB08fk6+zB+UfeCDE=; b=hVI2nRWjdZSESpYczFwIsLzy9Qx
	9zLckqHcW7nRODwuOh/IXba5OqmhGd8vK/Il79OqwH5h4SBnIIsqIfXkQhMFsklf
	2r7jlfcfE28LtJ6/BqmMNgewkFN/X5vfpnNgFv9ieIUTLhZXD7Z24uBsbGFqUw6+
	sPEqt3PYLxMrIX7c+PMvsD0nuvvbgk4dDKlhZUH9eLRIzi3ElqOobEwANmFLO0CV
	m1aMNf4UZ313uVOSOxvCxK+WFCTAjSXJBPpg1SyjD+gEYAMLpMQ0SIUIQQAT8vDH
	HkwoZ59SuYO7u2Wm42SUTNZ74rm+DSi3gQTUZ2D0+CMYYnFdWzw8ZJpe1MA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbu77e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:30:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f73452300so1414656b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 00:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768465809; x=1769070609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRAomd5/WndmqPt4/KPViCWMZ2kB08fk6+zB+UfeCDE=;
        b=C9zy3G2/fhozrSw1d8j4gsmVqjIG18Ur4GnbAWIhyJtaWO///onLNlFKq6c+E/HdQD
         AcRSqouRt5LZAY/7YL5APZES4LV5gQxscDKbEzn5iz5SGOjWhNhzZSoZOjeqwQMCH9lH
         J/vr1txG2CChW8x5rir0+2v7x14LinK0p6xt9Q4rbIWMjFiqGbIlAZEWpknB22jRUO8b
         wJYx1E+84JVzTBQv302kGw2HydTvB92IGgJhZc4mUo3em/iJhVyKSSzP/RAZjPvEnOUv
         YxXVp56W9Pg+mbNtpuFbazgM8S8W0f4ukZuMOl6ZUk5qkpIos9uEHPqANXlsUNf1lgE1
         bf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465809; x=1769070609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yRAomd5/WndmqPt4/KPViCWMZ2kB08fk6+zB+UfeCDE=;
        b=C5WoklDyltnoDxAB3UEucHy1Wf9/pjN8DJxLNVI9nOMmtbVYDjeAsFO9rticgcxGQf
         j0/GI1rY35ob0NfBmy+TI2tRHkzWMMpP0smmzvt/anEdXzhn2wnFU2pwrCQPlpsu2J2Y
         PLYp4MnofGvLUdwEUvrF7EiCoIasfD4GAQ1l1I8Svm2h/uTOuwSikT2tFejsd3CYRE1z
         25czgHZ0QM3QPClmtOKj/C8gh5+1JGHC1+d5uBmU9dribMUBy/a+ydiL3916ADtC/oDl
         N17/aCYPEVC0nhKdRjwXhxeCcj8Rpx5JzF0Yd5FyvHENRtfy3nzTn3Q1sR4pHrinW7Hn
         zbHw==
X-Forwarded-Encrypted: i=1; AJvYcCWJfpGDX7F/IbQPg6wj2ycFS4l2UCJBiNFoTi00Ln5yDHmWPeAdT3fXxp/FzpsCTZLj8w2OcrB2h5KeqNQm@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ5ifVtnutSHV3Gccaeo2FDNXOPG8gn4VdepN0wWRIH0pIy75Y
	jY0TROc+OyI5V2qvRVx+vQsSF2YogB/Fegikto6o7cLRi2OikdhB9wEupAVxkmi2qU/9BOBg0V+
	Vfu65c9u0hAxkTsPIrWX/6DbYkPT7WK1mk3OkbDsi8pXqbBc+1dQlfVD2wuu47RcYLCC4
X-Gm-Gg: AY/fxX6MOQ8VjGvy/d1cBBaQDLG09MOhEJr2NBamAfFNxhpoadG9T+JLUijGW11508b
	z/N/xy5rkRTX2wgkOqLtaLUfSh8O9CU0huhzYtnWHbuvzzm1pN0CtQXy8v/XuDtHQvpW5fANFcW
	w3zm7Ba+IPCB2ziXJTliMQ9hvCvjL0l/a+RX/4yqykwKvDcpoAxtSHGIEcL3+qftqaeypPGpNHK
	fTk/lZumd+umiz3cqnX3/Ei0chemu+hE0tvy5ZmGYAqoevbioZEJScxFSHA4AX2fAGIqgKR7bGn
	D4q4a8ZfRCQnAyrcBzh10l/f2A3udsNssIcqQ+tx778pUptNVTOvzfTsj4hECwxKwoe1QUMr+tj
	wh0BlT6JajoQ+/09ZJkzsLmxcqe4ySF5WhrenP0qP
X-Received: by 2002:a05:6a00:b90a:b0:81f:2b84:6efb with SMTP id d2e1a72fcca58-81f82011df7mr6059471b3a.69.1768465808545;
        Thu, 15 Jan 2026 00:30:08 -0800 (PST)
X-Received: by 2002:a05:6a00:b90a:b0:81f:2b84:6efb with SMTP id d2e1a72fcca58-81f82011df7mr6059441b3a.69.1768465808070;
        Thu, 15 Jan 2026 00:30:08 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e69d1e7sm1773296b3a.58.2026.01.15.00.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:30:07 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, thierry.escande@linaro.org,
        abelvesa@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        ekansh.gupta@oss.qualcomm.com
Subject: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Thu, 15 Jan 2026 16:28:51 +0800
Message-Id: <20260115082851.570-5-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968a591 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6yTI7Z6G2gYhkubfSC0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Ff-eY3CnCo-b5WjhlpnnXwpl_5yRuSFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfX+qb+ANZuxWZw
 miSXwxX/hNvmaqw7M+Vbblvjf89cKLyWJPA3ymyVKaYoV1OHX2v3j2sRbLleLNTmjHSnDChU0Yy
 mIHoYOzdJjELRTez1wO4+U7kVIwE0ONFwayNOlngM4cgKKjdFDXkjpr1xR4a2F+XMIkHuCPCCzS
 RL1xZSPa4ln4G3VnG9WWQqHhXyFxNrAHWSsW1xnpkX2ybcaWdbJX8DzPnFSeV29rmqIinqdoJwj
 AaF8haLoFQFBXmSoNnnEjKw9ndeEc8+r3uC2VFTELVyIBKv2roIemCHADupkInCd6uzop5ZTO24
 lmBlIM5z4oyIJNhPh/vZYD+47vt+BTSmU/is/zDt9iu5w7JiGJNXW0Wm8Fy5nreu/K/isHg7Cjf
 bbg72G/Yh9ZYQfaDXWotn4mEN2oKglJwdsL7Jvrh4MeO9AHiNmrUhCrr3cxOeMuKlqbYTFMmt1V
 +SSH7LmxoISJiYHrxlg==
X-Proofpoint-GUID: Ff-eY3CnCo-b5WjhlpnnXwpl_5yRuSFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150057

The entire reserved-memory region is now assigned to DSP VMIDs during
channel setup and stored in cctx->remote_heap. Memory is reclaimed in
rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
heap lifecycle to the rpmsg channel.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 95 ++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 50 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 833c265add5e..f9edca7a8de1 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -278,6 +278,8 @@ struct fastrpc_channel_ctx {
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
 	bool valid_attributes;
+	/* Flag if audio PD init mem was allocated */
+	bool audio_init_mem;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
@@ -1304,7 +1306,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	struct fastrpc_phy_page pages[1];
 	char *name;
 	int err;
-	bool scm_done = false;
 	struct {
 		int client_id;
 		u32 namelen;
@@ -1334,31 +1335,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	inbuf.client_id = fl->client_id;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
-	if (!fl->cctx->remote_heap) {
-		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
-						&fl->cctx->remote_heap);
-		if (err)
-			goto err_name;
-
-		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
-		if (fl->cctx->vmcount) {
-			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-							(u64)fl->cctx->remote_heap->size,
-							&src_perms,
-							fl->cctx->vmperms, fl->cctx->vmcount);
-			if (err) {
-				dev_err(fl->sctx->dev,
-					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
-					&fl->cctx->remote_heap->dma_addr,
-					fl->cctx->remote_heap->size, err);
-				goto err_map;
-			}
-			scm_done = true;
-			inbuf.pageslen = 1;
-		}
-	}
 
 	fl->pd = USER_PD;
 
@@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	if (!fl->cctx->audio_init_mem) {
+		pages[0].addr = fl->cctx->remote_heap->dma_addr;
+		pages[0].size = fl->cctx->remote_heap->size;
+		fl->cctx->audio_init_mem = true;
+		inbuf.pageslen = 1;
+	} else {
+		pages[0].addr = 0;
+		pages[0].size = 0;
+	}
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1389,26 +1372,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 	return 0;
 err_invoke:
-	if (fl->cctx->vmcount && scm_done) {
-		u64 src_perms = 0;
-		struct qcom_scm_vmperm dst_perms;
-		u32 i;
-
-		for (i = 0; i < fl->cctx->vmcount; i++)
-			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
-
-		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
-		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-						(u64)fl->cctx->remote_heap->size,
-						&src_perms, &dst_perms, 1);
-		if (err)
-			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
-				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
-	}
-err_map:
-	fastrpc_buf_free(fl->cctx->remote_heap);
-err_name:
+	fl->cctx->audio_init_mem = false;
 	kfree(name);
 err:
 	kfree(args);
@@ -2396,7 +2360,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	if (domain_id == SDSP_DOMAIN_ID) {
+	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
 		struct resource res;
 		u64 src_perms;
 
@@ -2408,6 +2372,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 				    data->vmperms, data->vmcount);
 		}
 
+		if (domain_id == ADSP_DOMAIN_ID) {
+			data->remote_heap =
+				kzalloc(sizeof(*data->remote_heap), GFP_KERNEL);
+			if (!data->remote_heap)
+				return -ENOMEM;
+
+			data->remote_heap->dma_addr = res.start;
+			data->remote_heap->size = resource_size(&res);
+		}
 	}
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
@@ -2488,10 +2461,13 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	bool skip_free = false;
+	int err;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
 	cctx->rpdev = NULL;
+	cctx->audio_init_mem = false;
 	list_for_each_entry(user, &cctx->users, user)
 		fastrpc_notify_users(user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
@@ -2505,7 +2481,26 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	fastrpc_buf_free(cctx->remote_heap);
+	if (cctx->remote_heap) {
+		if (cctx->vmcount) {
+			u64 src_perms = 0;
+			struct qcom_scm_vmperm dst_perms;
+
+			for (u32 i = 0; i < cctx->vmcount; i++)
+				src_perms |= BIT(cctx->vmperms[i].vmid);
+
+			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+			dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
+						  cctx->remote_heap->size,
+						  &src_perms, &dst_perms, 1);
+			if (err)
+				skip_free = true;
+		}
+		if (!skip_free)
+			fastrpc_buf_free(cctx->remote_heap);
+	}
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0



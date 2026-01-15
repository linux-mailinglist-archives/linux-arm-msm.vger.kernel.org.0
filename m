Return-Path: <linux-arm-msm+bounces-89155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E75D232CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1079B30270A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2B7334C31;
	Thu, 15 Jan 2026 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afbY9jeP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6BBlPgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601CC33469F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465779; cv=none; b=RUz4zyMLxXu1e9WcnMP5gD4WDMgXR7eA6sCj6/WSuoGyfpbhtnAot45ZeYpB2h/2tfpDyAtz2av21pa8icHmlAzs8LU2X8zXN1FK7slm9FDZSubmBA480SU85fULMDndKtBRHdH3mbtqW8/svhEjKmCFdMal4DvLqivwZ6zzpXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465779; c=relaxed/simple;
	bh=b73oRmsUcCEr+kAZMeuVAMxNJUAgmIX9NK3DcBwLVN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EuRucwKJqvOghVyNs9FC/lCdFRczx29FqpFbF6QFd8mliGnSVXjexi/O8lmvVjslTy63WoqhH5CdvWqY6pMSeb6FyP4jqGz68NZ1wTMyT9KU+w/D16xoT6wPbvY7/TGMLYV3AvRRlhVmjw6IMrA7Q/UYDthtK2v9SjPSSwzP6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afbY9jeP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6BBlPgz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g1tA2074818
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gXRRzI8PFSG
	Xkse4fblghbMDCYBL2rAyR0rE6A7MHy0=; b=afbY9jePQLJ4T8Riy9B6Fz6uBKl
	9aJtbGD5R+Gx9wsLEotDYHrdQMhqjlLFvk4XxvKxmQfEk+3NMteHJ6ko3XKi33dU
	lCeHLZxtfJW174Eg/bmF6gmbYTqfDmPd2TyQdFSEmTnrQDLcEBbDvtDzDAPbU9Td
	geTNliMi5lgOILPcKXmLRY+hr+XwvjrgNQ3+btaVxCuhoobC1GHYw33JaSX0QRjL
	A//cpllfpTxDz+x8qe5RqiJdWLPw6iNNNerk946RMqEt0axc7oobAcdZ+6z/aQSD
	gVFy6qjEjT5WYR0sIy8U3MU8JxV3e0v7Rxyu1+6EEsZh76tcHT0Kh2Z5WyA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9hsh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f3f3af760so1378136b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 00:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768465771; x=1769070571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXRRzI8PFSGXkse4fblghbMDCYBL2rAyR0rE6A7MHy0=;
        b=Y6BBlPgzJIoJuXD/RKAL/P/GTWK6MGxq6MDEH2mvKPLWi1x/qBlNtOYfEi8vYwWYmx
         03c0yDBJL7rJNVoGxj3gwsuPxhnar1fjEtpKihCWN8hyDwYPcNUGWwMYh8bJ4CRpqXv7
         K2Wldw6lljizuhkK0QDrYnaeDnJU5QpeGny7ShJm77MmD6RC+2njsaQyKBFM23fUeNtr
         aJoxb6iZ0xXClYWkeuDGMJFgyF7jlF/aS5l2m2Ik5YMHxZ3pYfNWW5MbSislclkFA5zi
         KrBzo1RVREpWFh2XwzF03+Qph+1UWVMtIoWhf1jEuI0Ds483VJZkfEZXVFltXb3e1R4S
         87QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465771; x=1769070571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gXRRzI8PFSGXkse4fblghbMDCYBL2rAyR0rE6A7MHy0=;
        b=JX9+Tz2b1yY/zALvazs2Eu7l6wwGld7fyXQLolDncMH7HuMD9seFD5KXqwYppeQGOK
         EZbfTHij/2Mu5Z0rMkFRIsZicYj5vlQYpWuiZCJGSpvHjj2oyJDM8eBP+b0TqXaUPDQy
         AkXanDLuzP+aMtRhH3PeplyNhDhtKTI8h6zpJZ63e+Hf54Ml5j3sJ0qFvxfiRAjZsWAO
         GbtQH3vh3D9cyluOvTCzJ52L7pYdtBkGT28WoI41mkU22roTIhSa430jiaws3V8Gikyf
         ZF9T4U8wmTaf6teCcO9efAByWou9vYN4oarRIXYSf8HLS6NRXawzN3yFFoDMFDhDMFsY
         me4g==
X-Forwarded-Encrypted: i=1; AJvYcCVVwEQVsQloOGwcCcTwI9d9DmgP54eBqx5JfgRK3ISRicldO6Y1WWjar4uSIIKBvhgVdVnzHTI+LJZS4LLE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy2ZgQ8CmPVnW52xj7ZO/0HcjaROpsifggE8cwlzhGWuXdX6Fi
	xYX9fKqqNGXDF8wILSjdxvtzfs0IM3m0OLNOqCeaikr0mXvL+EJPButXcRypAqQWpdJNNmy1Frb
	ANQ8wN/50ywU3FWcgewt3BXjP2Fg8axAgIlg8tV7UC3j5GpFwwK1agFZaTBfGRRRoT1i3
X-Gm-Gg: AY/fxX7dzz6hsS9Ao7deppMawyzGCP2C4ug57AlFXoLMANSYTLfRDCOsmSHh0VWp1lI
	qxgfC/usBHZN4oIKOcIQixd+b2w7E3KElIgQGWodV0dTIrll2Ba649jwHynILa/CdsYWGpt3yf/
	3o69OW3bP8at1pVA+mjEiGfvnVCHeX2x3D04u7TN2bF242piIdmDTn6wCqs19OU55a0bOylB3if
	dnJIjEy5syJX1F4pzUs0i1P19XHQQzvjqEpf5lnK6bKV1JwVIFgtUTIKoF0XvNy3jPcICy6OSAa
	/yFNsE2fVR8nXr0tFZmX4K9BFlqpCKPzqFdnQc8tvtTj0xBUO26gdszPi1xD351W5ByosQxhqMc
	DNOVEew//U+NP9OB3prqfxlRPZD+lb1GDl/i6GrSU
X-Received: by 2002:a05:6a00:349a:b0:81e:c91c:70c5 with SMTP id d2e1a72fcca58-81f83cc6427mr4776812b3a.29.1768465771064;
        Thu, 15 Jan 2026 00:29:31 -0800 (PST)
X-Received: by 2002:a05:6a00:349a:b0:81e:c91c:70c5 with SMTP id d2e1a72fcca58-81f83cc6427mr4776785b3a.29.1768465770602;
        Thu, 15 Jan 2026 00:29:30 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e69d1e7sm1773296b3a.58.2026.01.15.00.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:29:30 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, thierry.escande@linaro.org,
        abelvesa@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free to prevent crash
Date: Thu, 15 Jan 2026 16:28:48 +0800
Message-Id: <20260115082851.570-2-jianping.li@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Qt0SETFlbA2iTyeqqNWazsSmmHpPVNah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfXyOXP1jqJo3w3
 9XYrQXfUBjDIfUPIGtuZB0yjHNggt2WIHYfLclufuGtsmlK+IvyRsS7INtt5oflH6Wgy49QiqYh
 i9sNH3Vxi8mUJb6ZP5yiNgWaXPuHnXX34fFD0gHjgcKOxFvc5L2dm93VzaDY0MJFJiLatI11f1i
 t2KJ5EF/6aqqUj2e4K05/GNvYHqgVLdeEeYbQw0bomYCZ1qiS4juBZLgwnGEQZXuG+S7qhM3i/f
 INW4OWW4I23hOrv8LP6nymIlJZ7wkOzaNNGH0NMCeFJxO7lj87ZpLjFyxXL+FZL3D789cFfKNox
 uDoL/MyXyZlSQDABdWLApJTVlqy4fyOaRBp9rHycDJOk7UFRzSZIu4NaUzrt4vpxT1SmWB+T63h
 gx5COxo/tkLo82rgqnXFXvvetEwBLbzyM5SHsrDbgtyum+87mF/ELZAHtNFIfh9Ui5+IRwnoI5D
 mqYxrz9gkFu2Agl+NEQ==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=6968a56b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZnmZ8TzD_GdZzTgawW0A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Qt0SETFlbA2iTyeqqNWazsSmmHpPVNah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150057

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

The fastrpc_buf_free function currently does not handle the case where
the input buffer pointer (buf) is NULL. This can lead to a null pointer
dereference, causing a crash or undefined behavior when the function
attempts to access members of the buf structure. Add a NULL check to
ensure safe handling of NULL pointers and prevent potential crashes.

Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4f5a79c50f58..515a43c9d95d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -414,6 +414,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	if (!buf)
+		return;
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
 			  fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr));
 	kfree(buf);
@@ -510,8 +513,7 @@ static void fastrpc_context_free(struct kref *ref)
 	for (i = 0; i < ctx->nbufs; i++)
 		fastrpc_map_put(ctx->maps[i]);
 
-	if (ctx->buf)
-		fastrpc_buf_free(ctx->buf);
+	fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
@@ -1591,8 +1593,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	list_del(&fl->user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	if (fl->init_mem)
-		fastrpc_buf_free(fl->init_mem);
+	fastrpc_buf_free(fl->init_mem);
 
 	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
 		list_del(&ctx->node);
@@ -2492,8 +2493,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	fastrpc_buf_free(cctx->remote_heap);
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0



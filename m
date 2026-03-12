Return-Path: <linux-arm-msm+bounces-97129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDVSC0BIsmlrLAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 05:59:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 965AB26D412
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 05:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88A4A301CFD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4406B331A7B;
	Thu, 12 Mar 2026 04:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+/HuwE1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063A639A06A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773291581; cv=none; b=RpC88/vv6xjy1CQTNXEUVPRH1/m9b8i5RK8N6mIyPnEqV7IRbbUnEGXShyIh/5HFLGUZ4wEg4i1gRmFhQM82zorv+ojTNfbq8xpn8fIqpBH7Ysuwj+95tn+jzCtuLwq3O8AqLulWDHNDe24yk8iEnkAx4G6VBbhpIljK8RxhnTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773291581; c=relaxed/simple;
	bh=70BeD1knxFPBhbOveZaJ78TQk69t5SY8pDh27xzK/l0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+n7/OEjE+kpiCangLGBDRIdVOaqBqfX0w1x0nsXcewmEcrDnh3sYqj+eMRFUPMJ108Z35kGhhtmrIzxTpzubd7fod6pJL/URKGYre+uWNUbdNiR0SxGKQjGOoLTzqyypPzSXPRCyJmzfqUgQrzrL3U4sTrvb6s+PsBS2iwfn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+/HuwE1; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c73bd024a0dso225675a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 21:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773291579; x=1773896379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JjiMf+HrHgumtDrytCb9PW5t02HTgkYKwwniQ8SZW0c=;
        b=j+/HuwE1M0YhY0t0xFVPNRINMa8yttMhjc7bxlbmfqCpLrUQB4H040lSzT/13alyRy
         6yvjNsv9LFzHDhPaS9M90ILR0gTZH0aHYkaX0fobzKcViqHHp4e7S4lzjAjVXJLMWxDw
         TantOQrphn0ADdBQps61nNMI4q89HnqPM82gIniyNxJ1x4a6545X0lHazNjsMeIa66iB
         7ZkLB29JXwWDe4CupLPnaT08KXZYtMltovVUiejLWKkaZAwuT6iXqrO4G7SCnOwxZvOn
         2VAp1bFlCGvZmfyVCBgx603IBOslw1sDbFgimSN8ThZSX5FgXHBEgS+P47IZ1YrIwaBN
         eaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773291579; x=1773896379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjiMf+HrHgumtDrytCb9PW5t02HTgkYKwwniQ8SZW0c=;
        b=CGe2qUQD85g7TdxPTUAAUCe6d82hNwOyoz5VYR55NFNQ2lBeXLAkGC6WtCEs8RNBFQ
         nIF1DzLpqrJ7C6CBf7IJns8VTbWhV2GeM7pdOUpinkzVclNPVhIat2HoBpJmymGUJPC/
         0yESIu+aJabaX13TkgOmwWE1dv6MsJGNpdpEtBl3a/d9BeeUtDL108O323yiZwQf4fAZ
         PqqtUxxkyt23ShCZyFrEIPEju66dZ9/v8fbnK/M/Fro2Ck79Vmj9dHnGPh+pjOAB90Hk
         g0+RM+ldNqpKENm1p1rWpZeuWfKsdOgBqvUsxE66RQj5NzaV1m366gAnxgJ6Xjrm2KkH
         aPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUuhRei/5A8rewmSmCRQ7zmxKUi7UPn4zeigWqY9qtIgxnqFD2dyBuqmWoo4+UG+V2I4PG2oRELbamxliD@vger.kernel.org
X-Gm-Message-State: AOJu0YynZ+izP/wETyEMkR/vnLDqL7LTdgSJ5JDHtSAdVSVOjx7kLJ09
	xKGeUFs+WzvwihoWyII6okAJVIdFfnDt3chYGDpVTk5U2YX93/KQwmPT0dwx2lgn
X-Gm-Gg: ATEYQzzt6Je2QqnCxyXYbKLKS4X5Z+HDItkfb/ZL7oIVT6xcR1T5MpnJBEIV0muUpw4
	ThiIthu9LnAXKd9h8fUxlwPCYLk3vP9dahuCcYIBPDwvtKtRt830zoMiw2TfbWFXmhG0yEAULXW
	1Bm+zDxzMBmi2+lneU1vQ4s+B1/I2m2loRTEGw+JlkXjmHehLqN5yw4jMBa0FNH+Y2/1m+0jhvi
	1NeIq/vjdIRnXWfsfJNGssKttDdqGJ3aAOWGxIcg3w21XEjEyTm09XxYKc1cbyYlmGrrUxSDm3i
	IfQBxd0iG8/4s0r97zOGDrXiiW/1AyJpVqmN9n6GE+An+xdSgGKhB29sGu6dKLqGFGQh/xH0zXX
	1NByuMQvjFkDgtTZqLveGsIxfT2hp2wNnyjZpJMkD0QZdiagySqDVHUK3RfLLgzHHje1Fg03IGo
	J4xnWLuHJGDr7u0Mmcld1ELqcAcGu3aFNC3xzEJcc9HyXjNS2SkPnO0A==
X-Received: by 2002:a17:902:ea11:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2aeb991a868mr25734465ad.42.1773291579268;
        Wed, 11 Mar 2026 21:59:39 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae255a05sm55804755ad.36.2026.03.11.21.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:59:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: mhi@lists.linux.dev
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:MHI BUS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] bus: mhi: use kzalloc_flex
Date: Wed, 11 Mar 2026 21:59:21 -0700
Message-ID: <20260312045921.7663-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97129-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 965AB26D412
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Change kzalloc + kcalloc to just kzalloc with a flexible array member.

Add __counted_by for extra runtime analysis when requested.

Move counting assignment immediately after allocation as required by
__counted_by.

Move mhi_buf definition as a complete definition is needed for flex
arrays. It's not a pointer anymore.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/bus/mhi/host/boot.c | 20 +++-----------------
 include/linux/mhi.h         | 34 +++++++++++++++++-----------------
 2 files changed, 20 insertions(+), 34 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index f16a1e67a667..e1d77cecd75e 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -333,15 +333,10 @@ static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
 	struct image_info *img_info;
 	struct mhi_buf *mhi_buf;
 
-	img_info = kzalloc_obj(*img_info);
+	img_info = kzalloc_flex(*img_info, mhi_buf, 1);
 	if (!img_info)
 		return -ENOMEM;
 
-	/* Allocate memory for entry */
-	img_info->mhi_buf = kzalloc_obj(*img_info->mhi_buf);
-	if (!img_info->mhi_buf)
-		goto error_alloc_mhi_buf;
-
 	/* Allocate and populate vector table */
 	mhi_buf = img_info->mhi_buf;
 
@@ -358,8 +353,6 @@ static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
 	return 0;
 
 error_alloc_segment:
-	kfree(mhi_buf);
-error_alloc_mhi_buf:
 	kfree(img_info);
 
 	return -ENOMEM;
@@ -375,14 +368,11 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	struct image_info *img_info;
 	struct mhi_buf *mhi_buf;
 
-	img_info = kzalloc_obj(*img_info);
+	img_info = kzalloc_flex(*img_info, mhi_buf, segments);
 	if (!img_info)
 		return -ENOMEM;
 
-	/* Allocate memory for entries */
-	img_info->mhi_buf = kzalloc_objs(*img_info->mhi_buf, segments);
-	if (!img_info->mhi_buf)
-		goto error_alloc_mhi_buf;
+	img_info->entries = segments;
 
 	/* Allocate and populate vector table */
 	mhi_buf = img_info->mhi_buf;
@@ -402,7 +392,6 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	}
 
 	img_info->bhi_vec = img_info->mhi_buf[segments - 1].buf;
-	img_info->entries = segments;
 	*image_info = img_info;
 
 	return 0;
@@ -411,9 +400,6 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
 		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
 				  mhi_buf->buf, mhi_buf->dma_addr);
-	kfree(img_info->mhi_buf);
-
-error_alloc_mhi_buf:
 	kfree(img_info);
 
 	return -ENOMEM;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 88ccb3e14f48..fb3ba639f4f8 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -85,17 +85,33 @@ enum mhi_ch_type {
 	MHI_CH_TYPE_INBOUND_COALESCED = 3,
 };
 
+/**
+ * struct mhi_buf - MHI Buffer description
+ * @buf: Virtual address of the buffer
+ * @name: Buffer label. For offload channel, configurations name must be:
+ *        ECA - Event context array data
+ *        CCA - Channel context array data
+ * @dma_addr: IOMMU address of the buffer
+ * @len: # of bytes
+ */
+struct mhi_buf {
+	void *buf;
+	const char *name;
+	dma_addr_t dma_addr;
+	size_t len;
+};
+
 /**
  * struct image_info - Firmware and RDDM table
  * @mhi_buf: Buffer for firmware and RDDM table
  * @entries: # of entries in table
  */
 struct image_info {
-	struct mhi_buf *mhi_buf;
 	/* private: from internal.h */
 	struct bhi_vec_entry *bhi_vec;
 	/* public: */
 	u32 entries;
+	struct mhi_buf mhi_buf[] __counted_by(entries);
 };
 
 /**
@@ -488,22 +504,6 @@ struct mhi_result {
 	int transaction_status;
 };
 
-/**
- * struct mhi_buf - MHI Buffer description
- * @buf: Virtual address of the buffer
- * @name: Buffer label. For offload channel, configurations name must be:
- *        ECA - Event context array data
- *        CCA - Channel context array data
- * @dma_addr: IOMMU address of the buffer
- * @len: # of bytes
- */
-struct mhi_buf {
-	void *buf;
-	const char *name;
-	dma_addr_t dma_addr;
-	size_t len;
-};
-
 /**
  * struct mhi_driver - Structure representing a MHI client driver
  * @probe: CB function for client driver probe function
-- 
2.53.0



Return-Path: <linux-arm-msm+bounces-88491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5403AD11618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9CBC301EF29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8157A30FC1D;
	Mon, 12 Jan 2026 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDYf26nW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF64A258EE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208552; cv=none; b=HQLija6yixdeiuGBPJD1UzYaJCC+IljJ4YlFJtlyC84tv81X8h4XuegPYKzg9Yhstc5V8YNgc+ikk9Fr27f3v0legmjxct+iLheqy1m01UC69rWxy5+557ZpAoBoeCcNP47fExz8T48sBPEP19psLZstky1goTRNZKUmuKJrSXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208552; c=relaxed/simple;
	bh=T0fMz5giY4vsRsYSwT72RK6O9cR+rZFptXg2JmjRsoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NiwjGGql6iQcleKKqehE448YpHifZw2WtwW1Wi2XI9FIVP9JKJWxWE2RodoNKAiVUAmQ6jQWrbbqEWXHGVkDDIyauaSUA64EcKOBCqp6/L3y3wm+R3ibRxzVnzWrjbDdSpi9bvnL0AaOM1HMlNko94gfr+/7lN7zNMIHvEOvZoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDYf26nW; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b220ddc189so847215585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 01:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768208550; x=1768813350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/3Ni1AGsR21lHeqIB2U7YviI8F5jnCb8Sudq+AQrGs=;
        b=eDYf26nWDrlGnVHqt5f2em1NdRk30deg+k7c2JTA5kSQhUDSRwAjls1gr85EsyPkv+
         KifFvHgfw5H6lp123Ywv8Kyzl5Dg1zBDoDMU2EDaR3LPlEzMS6qL3AEo+JThygZHU1SN
         Zb2TVRMQ0RNpAnwPFSoMUIhgLuZr0BtdlmfdS3SAqVlqQYLMRVgZFnQYXuBtbkzWrqaU
         BRMlMqsj9O+MJ9Wf8e9LB87oBo2oTEXKBp+hiv7yyAnF37ncDwxsQozkupJrbfE5v06W
         MRncfPqbEEG+mNkiJXNAC+GDYvhQW29ohQLyF93W8hke8YpO/yJlgnWYNJkI23K0qYTf
         t5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768208550; x=1768813350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/3Ni1AGsR21lHeqIB2U7YviI8F5jnCb8Sudq+AQrGs=;
        b=YMbO5tlbNDYzFSU1vH0X15YFXW0Bu4jG7q23ZK6ttFsytOMC4bfnLDbHeMt6L3ZL5R
         BfzsZzSDTov1z45o2SvSlas63qyWH1mDI/FXMPXubQEQFYsS8fuaiu33nZkOdc6WCzCq
         FzLFKMg49gcowaUPunuZD2KW0lDHkfhRHLGctYxEEHsUb4rKI9eGDi6p6mmo34FzTQ1C
         0mEeXz8LwB7qe8jMFGmgPvdGTm81Ii2J5IyIaHE0aPpjZwUlZjSH/6rXl99+C/42SEEb
         sCQk61ysN0cB6sxy/lFRIouWoAqxxziImWiBXVkPh+pNrOEFC0SfzB6AQt2oTIQM6muJ
         1Mnw==
X-Forwarded-Encrypted: i=1; AJvYcCWYNp3ksGS6SZURIRcYiUOGZQiMLv1z2YAaFLvh8HQRE6XzCb3428gLGJXC7Bj7Ini7YPpaKnkTQVLBp7Sy@vger.kernel.org
X-Gm-Message-State: AOJu0YwQP+oIMIor+wmkw36PrjCRUxhGn2AE0qT84q/0rSgEmiuodtZX
	ExgIQ4YZV7Z0J55WrF/zcSjMmCfyneHbqEZkNPJQ9bNF6QfhVSA0TEv1xPwjWtsW
X-Gm-Gg: AY/fxX4P3oGHcc3VYj7AjjIK3i/ErLQFTouwaL8PJxIcunIesLrhlvsPQd41oSPpyBz
	OilnCacg6RhHDjMgu5jpYZWAkPAh0o5ZKs/GU12D1XVylFmKbGtby8AoAGv2doy5XmP6E7y6SX/
	65lxAb3mo6XEcmVKw4AoQrN4E+HNNlHA145QhM5fjfAP2dbwf9K4MnzM9JwqT99kHs698dz6u7/
	tPmdF36SAL7Lx+y5CbB7SeUus9MzorfbQHM7e+DuZDarhXMNJO/di1uP07Vwd3AFQ3UDYEKcK2Z
	JwF8Nxqye9Kvaj3DV6MJQlKeJWShe5lRp0lacHVS8MCkD5ma7wmpp4VD7tzgYZh5VjCYeduo5CZ
	8mh3q3sEbskgO+UzUaRHzyq0enynb6DvgAAgEMUxnoGWv11EZrHiOSU0GOUwLtaH3JX/LdYcNp2
	/85NxAd+nN0EdTgp9ft2g7T0zLn+NfRET1cQ==
X-Google-Smtp-Source: AGHT+IEg0mp9jO6y1Lt6tC7eIYErHG5kCDpk5M+8QrBI9vPUXF57/zRZlnQ6clWw/LTZD+kezSTbiA==
X-Received: by 2002:a05:620a:4802:b0:8a1:762a:ab13 with SMTP id af79cd13be357-8c38936cc36mr2222399785a.10.1768208549448;
        Mon, 12 Jan 2026 01:02:29 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm1477935185a.33.2026.01.12.01.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:02:29 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>
Subject: [PATCH] misc: fastrpc: possible double-free of cctx->remote_heap
Date: Mon, 12 Jan 2026 17:02:21 +0800
Message-Id: <20260112090221.3250133-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fastrpc_init_create_static_process() may free cctx->remote_heap on the
err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
frees cctx->remote_heap again if it is non-NULL, which can lead to a
double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
device is subsequently removed/unbound.
Clear cctx->remote_heap after freeing it in the error path to prevent the
later cleanup from freeing it again.

Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..fb3b54e05928 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	}
 err_map:
 	fastrpc_buf_free(fl->cctx->remote_heap);
+	fl->cctx->remote_heap = NULL;
 err_name:
 	kfree(name);
 err:
-- 
2.25.1



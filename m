Return-Path: <linux-arm-msm+bounces-88566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46727D128ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 13:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC4D13019489
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C2B357A20;
	Mon, 12 Jan 2026 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyyueG7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F78833D4F7
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768221178; cv=none; b=t3Huk8lzWkDEsRtSJafvvMrQZ2H5TRvLqp5fg8NzdJCUBmpQo2NP6195aJlrX05v41ESZsV0g2C4EHDQ2ynwMqr7fDmOB8oxSW0YHpVmTfKXvgWuvBkE1irzCCmBH31iJO7qMItX3Tw+JJzCPNtGBMRa8FayP6gTGLeIXQz8geo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768221178; c=relaxed/simple;
	bh=iQ/5mW8VPT8qflkMmutH0Y7ld1+5x5cn1pnmYWwzzMU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h7l8QntTwL3N4UTS6fMKh+XD6kWmq8WzzAaVDzSvDpOsOp9cEz0D2appFGLc1nICwC0weUU6v/ZNz8NMZr61e8LSmp3/e0Bs2sXkS7FQJN5+v8MhKc4SpGK16DzcM1Nvr3fgOO6oDaO47E7zNTfn7hN0Pf9i0F0ZAAOrqZQMGsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyyueG7p; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so2074230b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768221176; x=1768825976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GmdD8KZWFllN0kxC+KJpu7oOwNYAIMDzyBObDdyGg+A=;
        b=XyyueG7puxGPjMnX1LNXXJTYTdVtmukxn1czhBiJ0rR/gWh5wk6xkKyLUEc9B5tHmP
         JpZHaCj3Xk7ww9p2q6+6iag/MSB7Mf+ZThBGngjDTrD3EDexTXhia8widfk7T8MDLLcX
         hULhJooI09hYFsD8EMVZOhSpeuztTW4ArZaHG45m+BgLwd/kXER4y4Ls+GsJPYN8dko2
         7Bz+QY0/R4Rc7pQpppmJOPh7dl1A2rBPzYAN33l0IWjNZ7XKroa0UuPWCCrKCJP+s1YI
         9d7z8tlh8kBb+vzWmiLorYBRvWzHJ77tebBwAr4rDEPsYBN9GYQ+tN2rk4Vc0egnwUf1
         XQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768221177; x=1768825977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmdD8KZWFllN0kxC+KJpu7oOwNYAIMDzyBObDdyGg+A=;
        b=cs5FflqG+PJzQBxynJO7+DzLVTU7bA8WekbwgRREjMzw2GvjrcaCjtz0aarj6UtO1J
         W6Lk5t51Abz9OMvWqrIgBZzjN5NSGT6VRj8Up/L7Vh400YE1I3nkFQNocFbNP+t51u6o
         OfRwQ1JBXnH0vCz410/G6HAUjA0HNfIuEFhCjiuLwS8hiv7bnlDS4ZmCIWGi1EPnI/Hb
         WqNi+QzZRpI/JtPt5bOKPx8QHc55FJpHpPmtvxE9x9mT4Mjb4HP7yauSPriJxyLOKpkA
         VtzDTei7V1XAcaLZkmwvHJMMjCAhMq5SZdureTlLmrtqfuJ/c4olAFgFNCMKRMo1k3m1
         QgWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNcjT5CVpPZjdLFvEMTEiXOJ0R2z3D3XWAkTHKrTagrqB+VMdNA/z44HmQN+4XYgrE9dQTy8jOBgYUL+4D@vger.kernel.org
X-Gm-Message-State: AOJu0YzPu5xJgjsVRqSfZgNM/UNA7WtGhSa4pIZWPlBT6uihmGY3BcWj
	A03Eo8+LbjfKJ74i0jfXGcF+N0Ye6hKx/qAptFbLulaAs4zBbmnJihHj
X-Gm-Gg: AY/fxX7McsR6vCx4PlT6H9cJYSeRhOwmCZjydSbWuNBhvMI+mLZmHnZ/0x53SlK1dlZ
	uP0WPB6F+e3TThPAyPWhcPxGXSC5OkPJnVKNfRWLGgRHEvDgG7/87ROG9wM8xeNjLltlIEzouZR
	6qxUkBwd9IK16jjSRD0z/QCCgHaGzWMrG/fmS4eBXcl4AbbyC1Ycs6mRaBD4xWEYzoL1DB3xL+D
	J1ON9COAsDYb8WtfjEqm06ZaInRqee9iFetMY3JJEgcU35wcoi2s2oP0n7KZCUrUOUyjz0g1y3y
	0M+YP7BEpPdK2LRAp7wRCmSIAOjCqBRqH/sNC3cDdg4oY7WUg7tqj8lAxq0E51H5WOFplwSOkYr
	simVdusIpMLYkJX+ivmL663277zE3CZ1PiDV6rcyPFU7gvXrmd00OV9Nietl20zp6WWkyURy28z
	mmnLWxLw62sbsrONuMOZ3EvJY=
X-Google-Smtp-Source: AGHT+IG6oEHPvEC/onlSfhniFExueTjVWKGz+6vfBL+I0KYIrm1outw4HFM2YSLadev+0+rrQXITRA==
X-Received: by 2002:a05:6a00:4144:b0:81f:5037:a318 with SMTP id d2e1a72fcca58-81f5037a797mr2984858b3a.21.1768221176467;
        Mon, 12 Jan 2026 04:32:56 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f32ccb4aesm6987379b3a.9.2026.01.12.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:32:56 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] misc: fastrpc: possible double-free of cctx->remote_heap
Date: Mon, 12 Jan 2026 20:32:49 +0800
Message-Id: <20260112123249.3523369-1-xjdeng@buaa.edu.cn>
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

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

v2 changes:
Add Fixes: and Cc: stable@vger.kernel.org.
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



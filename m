Return-Path: <linux-arm-msm+bounces-20577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2668F8CFCAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A425A1F22C86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F144139D1C;
	Mon, 27 May 2024 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="lhb1blKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072AF8BF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801692; cv=none; b=I+fxJOOz8drNGTUPSnmUcyvfTAVs5zCuKCQs6xrlRd3Ar4stDTXObiynglAUhVaD4OPIOZjPXEDChveQx7wLtuUqW+9sZPJrlwVqp3OLBV69Bhu8N0t22ppjrgU18BSa+YUC1cPubxoj1dXuuUUqqWcdDexQ+6gKub5xTlYJjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801692; c=relaxed/simple;
	bh=JLG5Tk9lIFQ73u9cPu+K2CKr/ghX4j48CAQjKF0wPkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujxb6QeewP2sMpifZQIFSr7nFnSPzIs3jiPKu8JdA2lNhiU8RdGM2jRdHBJ+AOvYGHrmNkzlQ7uWsDv1JbSXYYEwYq99SEfBWU0bjyTZX7TN/qGMZk/FrVi+xg1dI9xc2XwxYVgmuAqjlcvlMMXTvxjCvyZnx7GNdazwPrVYmR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=lhb1blKM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6266ffc751so327252766b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1716801688; x=1717406488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipebK9m7PVqqulwRzxjF0xLM7H0wET0JcbhhBU7VBX0=;
        b=lhb1blKMjE9t/5U7UIWt/Wb6Bv3ILu1Tk74m7YZ/qrkjtEtq2/+OteOV8LtzIoV2wl
         9idRXoPIpZRxAkEWdC8FQIoiBeSvfNQ3iaYdDgSFFAuswM6f9Oeq7Fyj6etbOQ37Qmvb
         Tiv+qtxmG1EPI77SkNgZ333/cbRRcQbY49Yvyuvnnm5IfA89tX7gt/1p69K4urWWygmj
         pSCFWdMEtmyqo8fQ7oj+IISMUemuA8NXKC5xlN/mVzv1opwIH+ECCfcDOiAyTtJ4JASN
         C+yiaaLmfIHUhYCxuLyn6H3wCHx3YhF8xiQ3SwiC7zKT7rb2ud3bTCCrXhJtKadjXuZU
         4xaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801688; x=1717406488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipebK9m7PVqqulwRzxjF0xLM7H0wET0JcbhhBU7VBX0=;
        b=MN+nTudUxuifXjG8h8vE5VFayLaFjXw+Tfd5btaYiUJvWk5bN5FMNA0myXIW2DSOzI
         nEWqQL0oLitkV9Re5nqhuDewSzgOrbj4Fy7bkVuzic2rK7p34gQD5+mhZjSqUXJ6/g1p
         TCop4J4198dKsT0EoQtmwa7LeZBKL1mXhRiWz+ttmKTxXAIRItS8F7aM2MJJ0wggBSoa
         KV4tAbQk4JaWbOGbPsacxOR0042bpWbefJruKfqZlNehcbsJfzcNh5afm98vJxxbpGXr
         vNujRoEUBAXNoXoN8lJl+7DwrTPPyVEtx9vb60e0CgJkL8TROM4l8hTZUgjwBPJFOzA/
         DTpg==
X-Forwarded-Encrypted: i=1; AJvYcCU9as5WQoREDnYSUy32d6Wq04M1N4WlId/IuzIFK2Ul/iMPfzXvxVXs/oztGgt+W1n64dDISz0sV81uy1/BVLyESg1ym4O76AGLRTe/tg==
X-Gm-Message-State: AOJu0Yyo+ZZO6P3aD1FPyY8UtzVpYWd/M77pWBRk/2fsz9qjF42YG5Ya
	xRjdBhpsw/cf0iBvJnm3up5HkWiDRkEJ4ObgQeZDh8WdolH4SB5jVe5QONOu0+o=
X-Google-Smtp-Source: AGHT+IG2dVBnBfud8TgPZ/tj+z3XZoHB5psvFY/1rOOuSv9EEWfGPcFvymolbCJRBeiPqhCXxo+6vQ==
X-Received: by 2002:a17:906:3cea:b0:a59:a3ef:21f4 with SMTP id a640c23a62f3a-a626511491amr503991366b.53.1716801688140;
        Mon, 27 May 2024 02:21:28 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-100.dynamic.mnet-online.de. [62.216.208.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cd83a1csm466087466b.182.2024.05.27.02.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:21:27 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: thorsten.blum@toblux.com
Cc: amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srinivas.kandagatla@linaro.org
Subject: [RESEND PATCH v2] misc: fastrpc: Use memdup_user()
Date: Mon, 27 May 2024 10:44:30 +0200
Message-ID: <20240527084428.246396-3-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240507222226.288074-2-thorsten.blum@toblux.com>
References: <20240507222226.288074-2-thorsten.blum@toblux.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switching to memdup_user() overwrites the allocated memory only once,
whereas kzalloc() followed by copy_from_user() initializes the allocated
memory to zero and then immediately overwrites it.

Fixes the following Coccinelle/coccicheck warning reported by
memdup_user.cocci:

	WARNING opportunity for memdup_user

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
Changes in v2:
- Use u64_to_user_ptr() as suggested by Arnd Bergmann (thanks!)
- Preserve Acked-by: tag
---
 drivers/misc/fastrpc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4c67e2c5a82e..694fc083b1bd 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1259,17 +1259,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
-	name = kzalloc(init.namelen, GFP_KERNEL);
-	if (!name) {
-		err = -ENOMEM;
+	name = memdup_user(u64_to_user_ptr(init.name), init.namelen);
+	if (IS_ERR(name)) {
+		err = PTR_ERR(name);
 		goto err;
 	}
 
-	if (copy_from_user(name, (void __user *)(uintptr_t)init.name, init.namelen)) {
-		err = -EFAULT;
-		goto err_name;
-	}
-
 	if (!fl->cctx->remote_heap) {
 		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
 						&fl->cctx->remote_heap);
-- 
2.45.1



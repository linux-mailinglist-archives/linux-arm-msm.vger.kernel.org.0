Return-Path: <linux-arm-msm+bounces-19431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3998BEDE8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 22:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723AF1C230F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 20:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C25187320;
	Tue,  7 May 2024 20:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="mKAxOqlw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CD0187327
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 20:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715112900; cv=none; b=j+9q7K7N0zaEHn3XHmHaXK6Lo8Ry++CKNx8nsAQSa2N9bDEf3EzWjEa7e0ixMVMC9n71nA9S6PMkCADZFbeC+ukd1WBcV6xF8GnuFdJp/ZhGxjeK3TJINBnezb0FFD09SmSwUgKpLw2F/UyMoJ6kErTx6OY7idrwVYslSt9HpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715112900; c=relaxed/simple;
	bh=uF/Vd8iS8+hkKkgcHT7XHq6r8l/kr/38zC1///r603M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KaegmZTfSV1xOyB2F7/jM3LwuI+kqhrbxxdGRaJm+52fcb41vBQBE6NG7f0x61aWCkaZrB2ZnT/Qn0EIn7F5k66WpTKPqnu5fWe3qVAkz2+C9X9/Fy3Q0xFDijmogn7Ci9/3usXv1c5dcuB9Q1zOuNbg35fI61vWkSSkRfhyECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=mKAxOqlw; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59a0168c75so926033066b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1715112897; x=1715717697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cc+DhP3qfYMeQYd1WzssP6XA1Z1B/2uDPEzJQepNAyA=;
        b=mKAxOqlwrmfJGrfxuiCJObs39MnQuJtjRFEwx90wZpLM3JZwvHIXzVoRNKc/GAWvGh
         u57h6vSnVIOrpcfagTK5S8xN0BnpshAQ9xVogv9YuTY+Bdsa54WxLL2DiKapU3PD2Tni
         6iaDM9gc0SG+cFD8BUmk8PC0bXfE1M3Wuq+zuwC7Guzr7DyfGTglxIWVDg9gZfr3Nkt4
         E2YOdQoWX6zMatP9HuTbqVVoa0QNU3tnjOn5s4byXICMZRacTxpilEFQVqevyE5dnqq/
         Bcom8dArut4Df69jYZaVHC/CTlkJc88V/gQKK5ezt82p4nB/Z7LnZYE3HUHrdCS7cJxI
         sD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715112897; x=1715717697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cc+DhP3qfYMeQYd1WzssP6XA1Z1B/2uDPEzJQepNAyA=;
        b=g3bBDPQpQUamo/HaTZ/HfFaJWgvSJ+lyqelfa5HcQtWuVK9k0MgeTdY5bfdp9DDAJn
         nRexjDv7QH7MuORFfJmcU3fBazQRFUml2Ud/txmycniBCZTp0PPKEhXjE2Lq4CvBGnd7
         M8TubyFph/hnadIxzi40Pp1c5C72lLu9Ti4yScr6gcZwMAljJR0SagIZkZIkMjEMmwSi
         dnpFZzx+MLruajkGMxM8B7bLRvAjME8E6Rq2smxc8rygE1ssTWWkfyQhR/XEI5uZ+HVh
         zIm1c0kw90mpFgx2n4US6P/THmDGKrMm9mR4mdmTLq8G6jlYQfPpHjfW6arbLMY2l9E0
         TC8A==
X-Gm-Message-State: AOJu0YzQPV8T8qM4Bm5MBGpFr6TTTmw6xQUovQfN2pcohlki6xpVdjMu
	zyYYXm8GXsTEnSOwH+t43zMGLGQcuqWOXr0SeTae0Kacgj4t07i+kNXx2ie+ZLU=
X-Google-Smtp-Source: AGHT+IEQe0zPn3qRHBQ30xg52DP8WChP6Hz5lHqyXN/WSWB0ohXFcZhrQTgXdVgveeG94gxUrJhRhQ==
X-Received: by 2002:a05:6402:50b:b0:573:1ee9:b617 with SMTP id 4fb4d7f45d1cf-5731ee9bb40mr362496a12.36.1715112897342;
        Tue, 07 May 2024 13:14:57 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-100.dynamic.mnet-online.de. [62.216.208.100])
        by smtp.gmail.com with ESMTPSA id w14-20020a056402128e00b0057278b1b139sm6634458edv.29.2024.05.07.13.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 13:14:56 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] misc: fastrpc: Use memdup_user()
Date: Tue,  7 May 2024 22:12:39 +0200
Message-ID: <20240507201238.213396-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.0
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
---
 drivers/misc/fastrpc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4c67e2c5a82e..2857cddaf812 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1259,17 +1259,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
-	name = kzalloc(init.namelen, GFP_KERNEL);
-	if (!name) {
-		err = -ENOMEM;
+	name = memdup_user((void __user *)(uintptr_t)init.name, init.namelen);
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
2.45.0



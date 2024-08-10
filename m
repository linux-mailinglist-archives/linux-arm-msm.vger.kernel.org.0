Return-Path: <linux-arm-msm+bounces-28259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD1694DC7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Aug 2024 13:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C4B61F218FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Aug 2024 11:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD75E156F5E;
	Sat, 10 Aug 2024 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cp6g+lOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687C156C76;
	Sat, 10 Aug 2024 11:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723289394; cv=none; b=vB0mQIB6/tXuGxsFCB1uQIKPkTgm/t8RsP6T3yTAz1Wk5ZtTHFxn+xcwW8sqh9v4kClkC8nlqyYlLenxGH9Y8serI8uoxvGvqUhrFN85uhMCGmyOYi33fUMxc1VPltvR5U1pLz0sBK15xztNCQwmUhZNoqZh8B5ZEPTT3gNt8ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723289394; c=relaxed/simple;
	bh=ixqusSQ1I/hxPKfZzg8az2aFMR8b+G4pX2ZY1e6NaFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y9fJyF3XIXFFIe3qEyhLtXId7lnUFJ+bUqYCixM1XAYz6i6TV8o9GI72n6+rvJSe9W3pEYgGt3kxatQFLluTPom9HNz63g9ncDHD/wuId+CqOA25gfz5JspHy9ZHsrdM79li62qBuq/cZld4+3+nnz4PXT9HlPWuqtSTaGZQXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cp6g+lOA; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70d162eef54so2265856b3a.3;
        Sat, 10 Aug 2024 04:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723289393; x=1723894193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiCIA4Of57lbaaf813bkQDb7E0Z5QglAPM/HOXvdF3w=;
        b=Cp6g+lOAbXIDO/M5hDJ4Pf6kUWMuIfDu3Rc6tr6za8qsg96pNZzKAaGhv82OUKSD2Q
         ElYDerkTuLaY34N6QS5awgqu8xPNZC05CQphbAJUTlflOCZjj+x04gOUM4bl+G1cNxod
         1mKeF4Fo9oQXyOw5f8AD6C7nRGY1ukAb/e+Akb08FVMHhORkuRQKpkDJxsY6WA1SU61N
         bSXJPjbbZL4aJ9+faCeZdlmO+RWjBDIElBGatMwAi53V7EQ8XJ7VlH/I3Oax0ZIfhCXK
         ZesXV/yDvqn9lQMefYrfqXa4AwEbkdkQvvVxA+CIEnWGRZbGd+2nGdcURP4cX6vrOIeW
         bnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723289393; x=1723894193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wiCIA4Of57lbaaf813bkQDb7E0Z5QglAPM/HOXvdF3w=;
        b=WIXYGE/PHpboZuk1ouinibO1vVFoL1c4p5flwH8emW/nZQNQlS2T9Sua9HriDPs2dE
         2q7hAJILGXRwQPlrL+MRxiVF0cFG14OokJjJk8CbKzwpJludW01nGTWviy7vuYq3l+Zk
         nkGWRrDbTTQl+CiHZHtCRZPiem7zqXtmmebgJAuYEeuwZpgzkVNzccBcO+xdVXNwPama
         wr9R1Ocu6DuXLrwrt+I/sBPwUgeipbOzWcEV1LqtgmGrEEPdeDwoJeceRwTcashYd7SV
         NRMwMXYJpqktTHW2nP3NnWoKTrpnL7V0qmt1ZS0hcZi8TQkxizGduImEEufLfNgdfCKI
         VSpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWVAP2X+mPolBWwPDVGHpGZ3rsj1lihER0YMpTgoueux6BGLueqnUyVkArTFaYntJmAq+py923i3I8be4f@vger.kernel.org, AJvYcCXT3lgzuSq/Lq5H1V/53Mq9R0ZTLkPsGALzFJRYoph5MQdoT5L5IruVBhQtUwPo+3A4/OptDLBEbMbydTKB@vger.kernel.org
X-Gm-Message-State: AOJu0YwGg8lyiusS/CDRN72hRWUSIw9dLvRYHuqCWxj+44hkmlOsrNBP
	QRbQ6Ro0qUgKcLj0KzrV7yKEkTkZ8wAQZTOY9OsM0xCq3ZNftp9U
X-Google-Smtp-Source: AGHT+IFFLrXSV9+JbJQlHWg5e69i45Y3QUEbOy1TCpPeglReO8eR90wNrfIufmfrxRocT06DW1dWZw==
X-Received: by 2002:a05:6a00:130d:b0:704:32dc:c4e4 with SMTP id d2e1a72fcca58-710dc627001mr4463972b3a.1.1723289392469;
        Sat, 10 Aug 2024 04:29:52 -0700 (PDT)
Received: from ubuntu.worldlink.com.np ([27.34.65.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5ac6c6dsm1098003b3a.194.2024.08.10.04.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 04:29:52 -0700 (PDT)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: robdclark@gmail.com,
	ean@poorly.run,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fix warning: Using plain integer as NULL pointer in msm_ringbuffer.c
Date: Sat, 10 Aug 2024 11:29:42 +0000
Message-ID: <20240810112944.175509-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sparse reported following warning:

'''
drivers/gpu/drm/msm/msm_ringbuffer.c:34:31: warning: Using plain integer as NULL pointer
'''

This fix changes integer 0 to NULL.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index e397c44cc011..5c73b8577945 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -31,7 +31,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	if (IS_ERR(ring->start)) {
 		ret = PTR_ERR(ring->start);
-		ring->start = 0;
+		ring->start = NULL;
 		goto fail;
 	}
 
-- 
2.43.0



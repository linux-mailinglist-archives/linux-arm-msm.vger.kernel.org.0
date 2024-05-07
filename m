Return-Path: <linux-arm-msm+bounces-19437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D617E8BEFC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 00:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 924AA28266B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 22:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4227078C72;
	Tue,  7 May 2024 22:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="q1fCnkk/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8969B71B3B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 22:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715120670; cv=none; b=pG3y6VSTx+xqhB1a3Ii86D4goBhh33l8+lhRmkTsUMQJD/V6t7KQ8iKaGLn5nNhqzYV3Z1rZ8GAs3CPfu6J9usrwI1A5dn4/4DDhCDTHSBRjlQT6MrAn+ZJTkSY3y0RlIEIzjRl4I/agvyZ1YCbNoudnrotw14eDepdCCkgt9Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715120670; c=relaxed/simple;
	bh=c7UKyLTf3qgP/ZDSdlx8z8d3mhtIEJV2ZyM3UhgQ9Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jO1N7lqt32nIZV0gB9XV5A4jhSnCn3DClvUXuJgX8JzhoJDXeN0mxsk1f/MhSypK50ttjBRxSvCoSCPgJca57yOYnobfrLG6+dPm/JEykA+hR7pUdxNWVhpcxxLofBX0dmiDXpZuucQ16ASn2KOPP2rrEOkEdw3xmiZSxF4dVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=q1fCnkk/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51ffff16400so5281190e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 15:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1715120667; x=1715725467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OA0/ZmfFA8NqMyU/dHLn5RSQ+cSht4+hgJiijtXHso=;
        b=q1fCnkk/F/HfazOuz38pvmNwJrVk+9ItiSIxGlQZy54lOZQAvC4QzBLaTdmfjdiYfh
         tw7ZkPU06JJeodI82p+yVUaY283Y/90stnUlF2f2rOYyaIHH78qJMIEOzns8fXsLodqU
         uucMDXLHjUaZjn0Ga9+h9cr56IM3f/kHVH3McghG6DbV3BY6Fy5+kC3B2/3WBhvbUDev
         CLlIfafIRapeY+jF7d2fY03zIipF3wi80d7XjX1355S/NYt+1vere+O8CiqeivzC21rO
         NBtvoK4q9N6cKwwgvpkSXBoMCadMzfT+jBpFtDwamgwJV/HpZ54RDKDUt48tzHvSqkjt
         SEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715120667; x=1715725467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OA0/ZmfFA8NqMyU/dHLn5RSQ+cSht4+hgJiijtXHso=;
        b=eUP0gS5lq+BAGRUOoLiHab1GuQO+6jge9VgivHsqy400dyviicOuULkqpN7kYHAZ1P
         +zjC6/YQz8s79y/3pOg1ulJeINKXGKbCLdRsDoLaPsgNfCs0axXdSizwg92e4/pPbqVF
         pAId5Vh6s8jgSqigoP8h9N4d6q7KTyyau9Tg5NDnf5MUNlrm4WEwHgeOGGvtjBpQDkkA
         HK+FrWYGykA3DFkwQn0pRUuCiHmE0VIu5SNun328AXWbkImQ0v9LPJ+DAp8iVPP3TqlZ
         bVtJnxYT/9JA7SUjhXBajnuDm/WIQWwNEKthRD/fCrfgKjIzEQ9VyGNmEYAM47Y0kp65
         h/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqvBJpQGVc2YgaslhOFlxD+BfDz0+oE0luO4xBivKhownPqRzQmHstXSuvfJNVmtfCgOmcKyCjEBOW+JpCSvb3/pqtMKZAgocKPr6O0g==
X-Gm-Message-State: AOJu0Yz5snDWh/vhCN5IjF8AbZQ/vN/rMDOmw089TLYAeObV8k+Yf8KB
	Vb/eQ0FyzIEezyJQIkEqC18sth/5TYIc9BUpDrOA0To7eSFuEbbJhy9VywdDSVo=
X-Google-Smtp-Source: AGHT+IEDUraO0PNfs6Jj5XK7HwjpHdYJVJlbuCKQdrAa5Ui5W+qjGBeSjaKTHA1SgWej5R5ja93DGw==
X-Received: by 2002:ac2:4a71:0:b0:519:e878:9385 with SMTP id 2adb3069b0e04-5217c5671a9mr575244e87.18.1715120666552;
        Tue, 07 May 2024 15:24:26 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-100.dynamic.mnet-online.de. [62.216.208.100])
        by smtp.gmail.com with ESMTPSA id w24-20020a1709067c9800b00a59ad48a8b2sm4396056ejo.0.2024.05.07.15.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 15:24:26 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: arnd@arndb.de
Cc: amahesh@qti.qualcomm.com,
	gregkh@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	thorsten.blum@toblux.com
Subject: [PATCH v2] misc: fastrpc: Use memdup_user()
Date: Wed,  8 May 2024 00:22:27 +0200
Message-ID: <20240507222226.288074-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <29b33c18-f123-4656-8507-406c87a12ec8@app.fastmail.com>
References: <29b33c18-f123-4656-8507-406c87a12ec8@app.fastmail.com>
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
2.45.0



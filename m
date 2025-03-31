Return-Path: <linux-arm-msm+bounces-52881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 028ADA76790
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 16:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 420F21887D1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 14:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98947210F53;
	Mon, 31 Mar 2025 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYTAX+BL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81C17A2E2;
	Mon, 31 Mar 2025 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430625; cv=none; b=D50jM5BvdQ4secVFLjhtV8wuq7h44N7iT0/3xiwsowGVs/fqKUsBOnazVZyMAUcKsn5YgILljmA0lSPVep7BrftuiK6sXTudS8I9byz70EDOeLLlM7Fo7x/uc+XplxYaE0+UeVLznYQ0DTqj5hxCFMXxflwM6q0ocEYNT3gu6jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430625; c=relaxed/simple;
	bh=yw4rSSLAQJvHq9WL54GSuYubWtedDjVEaeHmxZ4RiUA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e3vXRoD2v6DfhM7dqAcXNjb8hc9OUAl+AlhDaFxQSKUh1Xkr+a7NEOAmbDmnZH3f3mQDs4p/cdFOoITf12cUvzt1+DYZHJCPduLv0RJKa8QgkFw08OD4n8wH8vm5Rttw1z2EQykbv6euZGr7Z5e44vYhGZ77TXPm0GrpKNTAyaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYTAX+BL; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-227cf12df27so63768205ad.0;
        Mon, 31 Mar 2025 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743430623; x=1744035423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pO1QeCUyXKGemqh/0PucODb/KuSbMsL5qkNhu7BZk4k=;
        b=eYTAX+BLdjCRq+brFTCz6i5qpAvOUffM4ilYZcZM6+jSm0odjIuOOG3T3QpC2ty+kw
         40yse6mlcLDWExMOSCz+xsGePaMeNBnbfPqe8M3RmamCh3ayKk96kkmlfcSY1BWLnsns
         g8HdP/TRZf5S+wycA1cZLW97FVyEfBhjLJz3GyQGLapYWbQMuAaisMllBJ3OnoRLCa/3
         KjzjTRLl/fef7Eh4inUK2F7Mvb3fKllkAkAFX8bdq0XYeFPVJWcYKB4CMSrbSYd8qnYL
         KqOvxuJhB1TjLl0czf3rcXPHmHdlDMxpBFfFj8/BMAGeaayJO3qHBNIUseN1pcLs9qY1
         KUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430623; x=1744035423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pO1QeCUyXKGemqh/0PucODb/KuSbMsL5qkNhu7BZk4k=;
        b=u9bT9o2+cO6MNKCzvd3DrIPfryzXKuSHsESAEBr/lV/I9hQ2HJqC0DPn7cDlgOkRsv
         uOIQcOTTH1ye2PSmDOjyblO3RtYH+Q9loEkroE3fjMzoZyI/ksLaL88/IYwqdLq5bfzS
         ddgRV5hfXmLhCzIy7hkAa3FwWPCSZyIv5xvNZmosPPPJ8+79G2uCjOA3juArSLpXF/Ql
         pPmlOWj9dw8RuNoama4lOYmWLIMhefxXYw4BeE8ou7nO+BokaTtEQktN5JJ2mOz48m27
         Dffo+xCIuZCVAdiGGoHhGbEQddhEtevBFiP73MYpGUsGq1RYhcQ+duz9aYXyQ9X493ml
         5pCA==
X-Forwarded-Encrypted: i=1; AJvYcCVKjA0TJbbvimhir/HISEqm8dgeBoIO1B1gQ3moUj3ETQSfzw+4ygTsbDRJf1gH8RAJSJUM+zI0qWDdXA==@vger.kernel.org, AJvYcCWHpN0AxnFx/hWv3jr345BsscDP4oYp0G77KLs24Hu70Qkj80gbGCzsDMgZnliaNlw+XxpmIh2+a+a+zsdz@vger.kernel.org
X-Gm-Message-State: AOJu0YzsVZoUm5XFVZabd7WQ87CmqYcrTA4MAOG5/XNRl6Y0r5CdmP6R
	j5bOpzYdM8PdVmkkYl/oLmS5WsVp/TIiAu88bze54uJ+z87+0ZDq
X-Gm-Gg: ASbGncsVl6Cq8Y8J+mB9sJBSnd8SG4XNxeTVLIxscBAJGTJE0hdYZ3rsZ4IUdwwO+lj
	E4+vq4JS5B5uuXOI73aM4emrQ90eyznkOEb1cCbfWWttL+x+MzBcCxsh0xsfjOifb7hJxZaYdAd
	iEN4u56+U9avjI5tRPAYljJGnAfvzifu0lZSK6ep9n3sJCectmYtm7KUb8k3HnaSCPvlt5SeDIP
	bAzrXnIZtGVHnylzNWhZ5uuQooUMtSWix2HXITFdbGu7Lg4Mk8qMy/KgFwPFv0zg4sE6ImxSQ/J
	isBF4Gz9xc+JsUWaSwUFR8WLOhjiDbokirtmEXKyZzU0G+B/44rdWkXvbXZN2v0wejGjolE=
X-Google-Smtp-Source: AGHT+IHiS3NQ9inGx04Z/RImRKqM2ZGoOKLOipMryfa1UnPAFRetOHxg2LrRkj+KBOMUbzqf7YBA6g==
X-Received: by 2002:a17:902:ef07:b0:215:44fe:163d with SMTP id d9443c01a7336-2292eefd198mr163250605ad.17.1743430623282;
        Mon, 31 Mar 2025 07:17:03 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee5011sm69916735ad.103.2025.03.31.07.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 07:17:02 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] backlight: pm8941: Add NULL check in wled_configure()
Date: Mon, 31 Mar 2025 22:16:54 +0800
Message-Id: <20250331141654.12624-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() return NULL if memory allocation fails. Currently,
wled_configure() does not check for this case, leading to a possible NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
characters.

 drivers/video/backlight/qcom-wled.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9afe701b2a1b..a63bb42c8f8b 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1406,9 +1406,11 @@ static int wled_configure(struct wled *wled)
 	wled->ctrl_addr = be32_to_cpu(*prop_addr);
 
 	rc = of_property_read_string(dev->of_node, "label", &wled->name);
-	if (rc)
+	if (rc) {
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
-
+		if (!wled->name)
+			return -ENOMEM;
+	}
 	switch (wled->version) {
 	case 3:
 		u32_opts = wled3_opts;
-- 
2.34.1



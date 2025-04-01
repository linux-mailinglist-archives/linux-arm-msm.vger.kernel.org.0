Return-Path: <linux-arm-msm+bounces-52941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFF3A77671
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 10:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75ED57A3E55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 08:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261A11EB1AC;
	Tue,  1 Apr 2025 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RS827a8y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD7C1EB1A1;
	Tue,  1 Apr 2025 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496223; cv=none; b=TBT1zlgbya9lIfaauq/eSNiBkRbB9w15TWjUpuyGu/JSr19y4lUc+Clr10UzkJ5D67Tx3OjZn+zRHAXeO3/RzGWbEQhqjieyw2hye3Uz6bbuWnhYbGUhvBZM5mCCD0VbGbLMlpJBwQcuKuiysACSqZAIkgAIjvUNmZQinDCHpxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496223; c=relaxed/simple;
	bh=mgWZDcrAngsGOnaDIRNc1m62eYmIE4BhxGoNnv+YqYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OiDXf4oXlL5wmitbuuARANQfJhv9XyDbDfjOi5eZBQDh/4fMjDqKjzlKOHXSlTpFx6otIimmgrAMyJnmUxrZkYhUhl7QLpCJKGUYYm/M/w6kCmCTWrg7craORZW+jVbxwGyK+Ic6Cg++TgoCdHBWjnq/rdyDH0kPAAU0vNbZnLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RS827a8y; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-3014cb646ecso6664084a91.1;
        Tue, 01 Apr 2025 01:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743496221; x=1744101021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjoRRxErQAE65f2vVZqYUjTQAES/NXv5oq8jYX02KT4=;
        b=RS827a8yqnNraDE/BXqnO00GIjxJNi+2ZQyWyuDBCNCvA9GMdntJ+vRxTD0b3te+MV
         SSXBbcMItGaZ6xbLYrryMMtf6KOqVvDDE9Z8BBKmMDVyJ8ab+oAq8c3DYvZBIm68BNzH
         qfwar/RFRIFQLY9ScEwt7gu7TimtTHO3QmEaWUY9iEIZHaZJyHzHzb5/10BrNKBYpNBN
         igZJhL2rbbDKBiTVNVVeVau7HV34nCxF8zOYIXr9hIsLEOGIv5Dr9VP8x4esSdiT3fi0
         t1STwVz//gt8MoQycYF/3kOjBVyHDucO0/B4tVfTlvrO/UzYHxo8QrKzzYUSZZY2sUBe
         60yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496221; x=1744101021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjoRRxErQAE65f2vVZqYUjTQAES/NXv5oq8jYX02KT4=;
        b=uzjTUycoceWQT15C2IIbbGAsNzXS/QH5vFb/H1iXywj3JWXq8TLivRBr1/jWuN/8h7
         eXXQ1q2Zk+hr3EeYD+ZkJLOiwnvjQgfnKWscoRYg89PCevWYKgmomno+3F8hJXSBYvCF
         Nw6fXcA4r0CvYXUd5vx2u2U+EQ94NfhoqSMd7Mh/gMDARt/q+QxSdC0oy0RXlJOS75ag
         Xw2qeKbgGXo0IjSDM/RPx1KNxwMBk8lD/dHuEpwXUS+c9Z/BC3AHhqeJ03mME2Rdy+ub
         jDM5g1HdR9Ir4A+8Aw1TLdAoi6aG0CnC7Rh05fb5qp1Zgpy8GZl2V1hU3fq94GdCBVyk
         5sVg==
X-Forwarded-Encrypted: i=1; AJvYcCUXdhG6u0sPqaS5+0HqmHlav2Pa21gJjeQhY7h7qkwdF7iiIfnJv9t0l+fj8y7MalvqzVvEetWhAJeRbFQp@vger.kernel.org, AJvYcCWpvuHKqTmgEhdBXv9PFGj6czeQS/DJ/+YphZRDz0aBBuUcBkD9HRuPikEZpXaoarkap5RsReS4tSYUIA0=@vger.kernel.org, AJvYcCXXep09nVrE/l7keeLfEc8wsqJ/iFMwf2Arhaty/l45KQxuF1DAH+7jLQ4DHx0gToX6zsFqRD5hgnYiryRa@vger.kernel.org
X-Gm-Message-State: AOJu0YxDk2ASOerLyb6nErPPyfvfuPmwdalPlXYazPOUV85VOWbqkhFw
	r3KVzWgu/3vCzcnJLTIJOuAWq41BRdlLAcZeldU6Zft46xidKGAI
X-Gm-Gg: ASbGncs3euc9hCGXiD+ftkLuJ8HfaNG2yYmj2gA6pDavO8Jl3/qQ/77tG91mWqAvDqd
	biHJaVp/hsjGUDnnbSveVqwHw75iIAh36zSrPa0DwqHGCODcTJxp/MlG5x+9i87CoJpJWzoYGha
	ME9iLjCDa1wvorNXNbVhwz91INPj+RJhnYzMU/0CzskuSXBfy6crXpgInku8Spms69pdqpBkiVz
	XiTO5cpuVHqfvC/rIct+elQ3j+wYiJdfugQJB8wNpUD9RBmyabgiOhDN6JIEPsNSIL3MDJIy+ef
	V301lgQsrCWX3M/1gMONx7YC4Q+7mNT9VrWTddw1su14f2x0Wvcy/9iaoT3hmsEMJXFBKwg=
X-Google-Smtp-Source: AGHT+IFWAAHV082oTdqQGEjBX414lW/d/FJAUbsjDbzy53pI1JmjcwR0u4fqgwsDs6QJqtqU53fJMg==
X-Received: by 2002:a17:90b:384d:b0:2f9:9ddd:689b with SMTP id 98e67ed59e1d1-3053214bfd5mr14011201a91.22.1743496220800;
        Tue, 01 Apr 2025 01:30:20 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30562c6d29dsm505191a91.2.2025.04.01.01.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:30:20 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Markus.Elfring@web.de
Cc: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Date: Tue,  1 Apr 2025 16:29:50 +0800
Message-Id: <20250401082950.21698-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
References: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function wled_configure() uses devm_kasprintf() without checking for
allocation failures, which could lead to NULL pointer dereferences.

Add proper error handling when devm_kasprintf() fails by:
- Returning -ENOMEM immediately
- Ensuring no resources are left allocated (none need cleanup in this case)

Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
V2 -> V3: Fix commit message and verify proper error handling with
resource cleanup.
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



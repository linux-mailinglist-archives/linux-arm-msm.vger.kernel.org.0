Return-Path: <linux-arm-msm+bounces-67567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75089B19291
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 226017A56F9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B192028B7F3;
	Sun,  3 Aug 2025 03:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HM9S8sdK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD2E28B50E;
	Sun,  3 Aug 2025 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193590; cv=none; b=byCrvRNCcNcJhRpassFUTR2tkcRao1vhmmhjw53F+96CoN6BLhcipSASyvgxICVFX3ByPT/FZDkWwScUfTpkzI/sJ79d+HmQvMt0dsrsb0omQ406zsunle25blRaYtb1gRMi6gvYo5jLGRmiCrsILW/9DHNa05ozoqURgjgL2f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193590; c=relaxed/simple;
	bh=9aI7lG0Tl2hJuBK90YHBJAsoJ/8cxUI8i1v/f3BffTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDklFiLYsgdp8WRS3+bQx7hsnm0Mo6R4wneVHCSLFFOjAZ+u+PAPBsq+tO9J8mLJN/D5Pbp5OZPj4L47DknsD6O3OZG9eHrCaKUGwEdhhTb/vHXxJVHQvBYFT8VBxDcYvnclqDvMauNkNPYSMVJk+0yyOCb1jWalG65IlRA4+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HM9S8sdK; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3e3f01612daso11600565ab.2;
        Sat, 02 Aug 2025 20:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193588; x=1754798388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y2j3K6T9pEbVJmy/1+mQG/Hh4BA91G5pqycFLMj9u0=;
        b=HM9S8sdKQ02SlLx1blG5dKFHMqPWAsqVyRi0irWsh2RRQL7oqNyOxAv1dxR2m680qN
         AQm/8UL7JwjrDHqLA+mcI4BPXXvjLRSwS94ukMcKHYxs8eGg/yW6b1Pwp4BxICDJs2mJ
         EXfO45Meu4jYQ9w8UemKR3+OoYdvWzogcCEiB/nKZF6O+LxfnHdVSIjYNGdGg971Mgta
         ehox/86vyZKDkFfhk2XTumuhvJxTYxcBzljC1dj6qKsGnOSUpE7QgypkEC1rccGzgeSO
         saHSZCeznrAvj3MKCDrD++Fc1J2rjnbWecSm7TqvhL+fwSjGUPsmYZoEfJmpTbMmwACw
         Uwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193588; x=1754798388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y2j3K6T9pEbVJmy/1+mQG/Hh4BA91G5pqycFLMj9u0=;
        b=g9Sa553Iatbbmzh0wPmoKcTVHIpEjeTaGWLMVuLL6nIfT18mMqOOrRn2A6BHgYXj96
         K/32EmwD586+bplDrgdl0p/sKIAQ0S3ymWnPJOIrV7iZ7bC9H6hI5nIM4geZdzJqhW+i
         0VFLx5xa1FI1d/97Q+YWFZjM0DIMTh57pCtA4m3Hu6HZFT2clvPispXKSJAcF58Hi3Ay
         i1QDMZNrv1AitXpuLKQFwdUDrcIpNqxMpZXL2iDIj0kdd84LOuydHw+hDOoz3M4y+X1e
         LH0R8wPJq+ryAF8T0CUqsvnkQOwIEba/WqBat/YHPY63iudeO0HUrvpd5DB3Nyh7pbkr
         4BAA==
X-Forwarded-Encrypted: i=1; AJvYcCVo9P715QLtK4yZInNoKF420/2FYO8LxAj3ur4KNNhuLL82Yav2qMG9SJ2Z5MdaHo7xT+rhSdUwtGa2+WZm@vger.kernel.org
X-Gm-Message-State: AOJu0YweQpS+jeI6lxQ1iKGq99apgIJTugGRrtwuyMUdZPF+Mt+muJZC
	BKaPzmCLFwy0lK21wAg3FMLdvNGgLImUjk8rirXg/ZwAPeCR4vhgwwkuuD2PMS1fOgM=
X-Gm-Gg: ASbGncuZP7fXlnA/LhtzFvz85E4e+S/+572NIXd5U8B3jRQeA8fpArINrsxMHXpD1+X
	jlbKbVmQV6SioQYu4DaHbarroY+iU6r83q9S2CnySrDaUAEeqprE/9EWLWJtfRS8fsfhL5bP3I/
	Jjs5QbVDJHewM/sp57kG88mViCiT9skjzdUpBM7bF5pZdB7ZJLQcRS90Ox+LTgdM5Tod2z0NH0l
	JHNPb8RLGp6Dsx34lYKC5eRiZs0z4lZnnO6qlFkdO3Ec3mrTAZrFpzK+dzph0Rnf05AjN0ga2kI
	BIT24nESzfkgZqToWQiZ9uWSmjCPh+VFvsf28yj4AbdC6ZRXyjkioiNzAg4TujjSBp6gtj3pyCa
	LFfAchow/KOFQQoVWWWuUhPT8wiwB25x2ThIvJMobTO5vrmiR6yqbo7eov2z4zshw9++629Zg+2
	sC6A==
X-Google-Smtp-Source: AGHT+IG5rAfDnGWWHI38mC3T85otZ6jr6iMt5B4TFAIz2EjPIhuXzfVe7WbaaJ0FoMpD7p5DssgRSA==
X-Received: by 2002:a05:6e02:164f:b0:3e2:a749:250b with SMTP id e9e14a558f8ab-3e41615d149mr81988415ab.14.1754193587969;
        Sat, 02 Aug 2025 20:59:47 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 51/58] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Sat,  2 Aug 2025 21:58:09 -0600
Message-ID: <20250803035816.603405-52-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The udl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index bc58991a6f144..5ae66ffd72bd6 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -21,6 +21,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
-- 
2.50.1



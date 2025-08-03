Return-Path: <linux-arm-msm+bounces-67566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A3B19297
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AF173A35EF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5219228B516;
	Sun,  3 Aug 2025 03:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xg+DB9/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89A28B41D;
	Sun,  3 Aug 2025 03:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193589; cv=none; b=NcgwKyHhwvUpPiqRgdTsJP/pOflMTtcedqQNj1pvnB6ts9d9Oy7V7xwV6ENz/CkgDZEOQzcefNeGCummKGX56l1HfycobkNkBZTnhllMp8yecJR/X6BOEber8U9Pkl609qz44OZYOQxfmqvMmC7jWK8xiFrKG0PvIsRY75hJ0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193589; c=relaxed/simple;
	bh=N3EoyuzODfPWQnX29Z81KHejIdqx6hmlepp49hsmKeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htIaA+66MpQAfWtbDhbt4O/lmy6/DZCRRHzY/3NZc1LGefjQs5xvowyOKcQNKj41aTGRgFwH/xoOQoHKSXBltVLLncU/IX1p0ORal6g1eC8kdvJM6RQVvDSBx5SFLVt+G0XjJ65yo7xbAJjotF8C2hJ0QVi1clTSbUnCu4fU70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xg+DB9/R; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3e3d94aa969so14697725ab.1;
        Sat, 02 Aug 2025 20:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193587; x=1754798387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2JGFRfrIhHONHk9F3zUV83hFGKQa8jTEAD0j3plUI0=;
        b=Xg+DB9/RbxIvMwW7dzeQ+ti+objx9O0klc7RbdhlhijJ9Ll9MrcwM0tPt99bORmytB
         rd7rwmA6uOd5hlkfnZH83ZqBw2K94utrcwzKWjdlIh5BPGQ7cZ+Y7RH+/67+sWXATC7E
         CJ1guASs9ZvhIK3kSXKQsXoqNHtjDfGj4VKqv7DW/pIe9dThbLha8W0O3XwUJSAds1HY
         hHwGjvZe3RJ6Nj07NnghkcUAvt+Qubsv/XT6CA9AAGp8gS8yaEuG5TshVy9HJKk9G73N
         UM764DVsDHgOtWSf9q41uIieBBwbtnJRx5LvhvJS8p5dZJw4csQH45SS4peKenHSsBe8
         5BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193587; x=1754798387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2JGFRfrIhHONHk9F3zUV83hFGKQa8jTEAD0j3plUI0=;
        b=akpltjSzwChg8HEKaVnk5xg3eW2QQcsXvJXsbAt2mvZ2QNi5Kg/MdHTFtmKbUVm9Za
         JH8jh4x9Ht0tHQ5yMPLDv1tY6v7aCkkIayIZzDAXv8NTE98oQAlV9PIt2w7mUTKwO0vL
         +Eb7jwnGYN6xsPg4KEli+T5C10wHUlq3/8IP18PO/7F0GBOfThHkX/FnASGnDwKdEBgg
         s4tRzA+Bd6fgMgiA8RO6zfliCsz/GkH6bKpLM+noN6fBmx3ZAvlnyJSZGTG9jnRBz/zH
         Gt2qbU3iBtmvazWqcWjSsZuXZexpFSUV+qn2ZfDo4JVQUYtjl2QA2Ap0CY8kzPFhKuiM
         dcTA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Iccj7ckH9BfMlfQiRksVCni4awpiTl57P1TId+jX0NoFTfDrGg04bzYcVNHggXELrt1bvJYrFrjre6P7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx07+6X9qM2DPJoDFY/wVa2FDcYo/cGXeNELBD+QgO1UPut4hC
	sd3qP2SFgAgfPZydjgTqeA7mjrwF/PFclDxrkYUmBGl7gi4/F9lNeLPuwMaI5URozhw=
X-Gm-Gg: ASbGncvjF6UDAiyOT41bXGbfUEd471sySbj1bX43lx8eaTXIeMlz/fAVEvJJ7jdqp0Q
	lQM10jG++EpO9om7eOs/vIpBKr9BBDGHUxmFDslA/9u6/EC8ahBfv/UR1bInVAKxWwxPtMAcZHj
	hUNmTFwBxgRXgY98EKYeod3TN66dH+FL1/sBuRsFq+ljsuLPYYXyCFEZbg7QSoWOZ8D2WMTXS0+
	1LGGHG5bS9GVt7bt7iZTl/xBv8MM6K9edyBl4kFue1homUJpHtSb/F5OjNSK2frFP684YWbG17g
	w9JPiI7Bmsq7XOzD1TCSp0nPSuIFZIHe1zUG6wJX462QfJhBj/gtBkKCvXGDkkh8zTg5euk3Mpm
	jPnCi1/ORyXFkRFA/7HBcslLRnJSomKXK7phtCkVqjanYU4eFdnxun95E18ZAHnckryUb1b5XVM
	7cOlnOGiu774EV
X-Google-Smtp-Source: AGHT+IHqVFvq1DXgRalOAEJ4e6OJ3Wn8/7Lu6yNitZbnZoklyriFDbu+1seaMWuZezPTVSx6Id5Rjg==
X-Received: by 2002:a05:6e02:3042:b0:3e3:ccdb:6ccc with SMTP id e9e14a558f8ab-3e4160fb7femr85375625ab.3.1754193586726;
        Sat, 02 Aug 2025 20:59:46 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:46 -0700 (PDT)
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
Subject: [PATCH v4 50/58] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Sat,  2 Aug 2025 21:58:08 -0600
Message-ID: <20250803035816.603405-51-jim.cromie@gmail.com>
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

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index a24d1655f7b8e..29e47700688a9 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -37,6 +37,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.50.1



Return-Path: <linux-arm-msm+bounces-67521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF6B19204
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 05:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A98ED3BB680
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 03:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2157027F195;
	Sun,  3 Aug 2025 03:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmXSK6DM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88A27EFF1;
	Sun,  3 Aug 2025 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193523; cv=none; b=iHfCQbCdeLsKt8+rF1eJfqFaJexQCiMv/38n1ZzLKJ60quxton9YRzxV+P7uR5FYxe551T1txX9ULaIZdyBu/dgmCUjcgaiezFCC2sQnsY9Cwtkf4NOtu/WZVLTQOd9eAUYPUF7+/6bl4d5NCjr79cXnCBjmZr1MJjlGbbkp0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193523; c=relaxed/simple;
	bh=d/hOXpE0Mgs1kPAgSx7IHtqQI95jk1oTu9WL6Byrbg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRrdT/2YwLnDFtoyXcbbXdfHeZsQA1jTp+EaMLeaPGKO0PY/+wQdl7oYOO0yVo1aSP6AJOXQpfL+9ypLm3ht+CWgR8/CSZWEH427bh8hyuab0nc2/CxJRzNKaDcFvWgQF/GJGUJeynjIF/YsRgAAXzB9kgcU6rROswRj4yzXHc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmXSK6DM; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3e3ea9e8154so15985445ab.2;
        Sat, 02 Aug 2025 20:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193520; x=1754798320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfqa6P75QZanGMFi9p8HAZ4Dyz8oIWbnQ0m74z0/sC8=;
        b=QmXSK6DMWVIoWPsYoFSLHdD9RybPuvYGuC4/nSD/+ts4gZJeID3f/UdyqGGwRbEffK
         n9LCJHQiTx/2+P9HB1T32qKqrGRtRfxHOPznry60A5sGx5Q8pA4082iCBDMVlFMhdd0u
         CdiVbJ7Fd5oUl8NBeaM5CyK6+XREHfalpt27tSj8pMuPlmHjeVYBosl1d+td6dSLl8sp
         JjHE7cFpHSwdNIopLQ39Ydv/QpxuyDmmEk4353fWgGOVkdjjVMdnedOKdxA00VPa33jk
         dfjIcdQh37dyqod792zq1dXzq7FUcnK10wijok2e5DqIQl/xyxZ+rxS0VaCyQZ9oxXGE
         UvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193520; x=1754798320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfqa6P75QZanGMFi9p8HAZ4Dyz8oIWbnQ0m74z0/sC8=;
        b=QQuCBgcgnZn7J+hgnwQOqO1DQdtwTKKyWtGsZTaTKJ7I6SQZrGw+aDNAyux4Padhmk
         MyeVlnZU0jgiiql7QZFt3uFsMilNg5Wizkyt59hZeTx4n+hWlWcTTmOi+HIrxrxzAABp
         vwUyt7NiazonLAS7HFfyNeGXbODCMPDXvzg8rUjo+fULlxT+2SR6qU6d5i0FS2DWijeT
         54AjjNJKmNixJGW1k/XwwB6wLUmGbjUSkXfCtt7vG388u5UiAH4l/KWtVycL5EEezMbT
         5oNVuXvf/JMdqYxFWalsJFZ/hLslsUvjIuKPYPFkxtxZk3gea9fYWytZb05mvKndtsCu
         VVdg==
X-Forwarded-Encrypted: i=1; AJvYcCUrVNlXuzbEvdlUwjF93W0RSM/SYft1snY/zZz6zJg2C7WEgcDexpiyPqqeLYCHXpVQ3Zl6+2YhInisplDO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8dN7GjhYOVlrhfIKDOSzAa0f7RsWGABY8jCSXApLHP+odqvQD
	wO6vR06yWbK78E08Od12VQOMGmqHFsTh72CT2wGeYOX4BhNKUUZUk8kpkV0UF9njhKc=
X-Gm-Gg: ASbGncurg3PfaYtgqdT7blIYnrqR1MRjXqmhwPSdYXFyLgfi2YE2Ti7Fo8D4IVFJtBm
	JvoAy4MZ/vVoJw9tmuHzvKY+2G+zYvLIWwJGw/jFpTAOlFuuq/40BHD+mNrAv0SUCkQef9teeuD
	/O06SuMQ89EJ+G3/ysQz+eIk3RHY1fxU81zY0zytEKnJRlTHzEew3FmckrF+kJoDfhJmvdUoA11
	lhmeTD24JGtozSieV5YM6aoILHf6E8qqXvnG+eLPlHr+G1JgyhHxZSnRh9aIOQauhbmpupk1T5J
	0bXEJ31MPf7j3nqRtpzb9m1GoQVa7DbW5uzE21m/Ct69wuhmkaSf/XcvC4jqSsyi2+9SqHsMVu4
	TbB/4WyyQL+QWmQkJch3SiN8Cm6m4YShWZs3J9lBi2O1Qh4313DaA6+tLTzUhd+Rh6tB7bEZXDt
	VYtw==
X-Google-Smtp-Source: AGHT+IHF9fqXIQ9Dy28IS+EYItwaYkEB1EPsxWBXZaRJEXylDi+/C1dLpmjsAMSA//MVYJtcdRokew==
X-Received: by 2002:a05:6e02:360b:b0:3e2:c62c:5531 with SMTP id e9e14a558f8ab-3e41618bf16mr95994745ab.20.1754193520351;
        Sat, 02 Aug 2025 20:58:40 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:40 -0700 (PDT)
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
Subject: [PATCH v4 05/58] dyndbg: make ddebug_class_param union members same size
Date: Sat,  2 Aug 2025 21:57:23 -0600
Message-ID: <20250803035816.603405-6-jim.cromie@gmail.com>
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162a..b9afc7731b7ca 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 147540c57154b..55df35df093b0 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -799,7 +799,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.50.1



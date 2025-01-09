Return-Path: <linux-arm-msm+bounces-44680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F3A08347
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 00:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09DD07A1EF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 23:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE4D205AD7;
	Thu,  9 Jan 2025 23:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3hJU/4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7F0171658;
	Thu,  9 Jan 2025 23:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736464060; cv=none; b=p6Ce8CwbLmyLfcKlC2ZU2pQFygOle9MLuM7E9xbvSWaOz2bulzi9ZBrP8LuiIkmhbXV4Gq/WLS+gUgA9cgMI5RfzGcQ6KmcVFBlt7CDuXFTZThL+D5iu7PZj1/Fk5fibQOSw5YuYS0jp8/zQeYvRVAvj4oKXrHi+1WKbvXf48gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736464060; c=relaxed/simple;
	bh=vmMryDxbgvpoI6kGJc9UE7lXz4Gghjxx2kQADnyVMsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PcJB3t6fY1C5fVd3pOqHI77GI7l1IWqoWBxpJQebw5zJdGYhFDqpce5r4OubKlZxhsYasDsn7bcGFbtdMGgs94uJilsY4DjphoYDbaX4lhnZAF0LJmakEwEv13ECs3w8PS+x1x8ulPxqs7JTD0n50uxS+L4GfJn/FSx0UghiD3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3hJU/4U; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso1917211a91.2;
        Thu, 09 Jan 2025 15:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736464058; x=1737068858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsEXuz5pOePCgHaBAUoGEuivEUiSeuPzmqjBLNVeF5U=;
        b=K3hJU/4UQteYg9yB6JMV4FwMISlKGc/xnJKP4QW4AO4h9yPGpyBzOPfAxykH7h1Qtj
         CT9Du1bZN4akYgNYAQfZB6U+3SXXe2EHEiM/Yp+faNVepFl9KoXVa2hVyIpmHEn4iZaU
         bTNiqouM5dbbhAvJnkzTspt1eJ+zmRUGIglpGimQxoPVFdSCt5hFmtEwvLS7is5waNWP
         RhSkvYruPtKEyUUbNWCL92wDWABeGtOKwl5ak2BjrdHZM52UUiI0J8tmoaWmIN7uH+vI
         Qhom2N+pqlq0PpCJXQ69Kpb3akrCvDFaChYO2/Sb9bnjPoaVO+Lz0yfTm4M0h3EENqgk
         Tf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736464058; x=1737068858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsEXuz5pOePCgHaBAUoGEuivEUiSeuPzmqjBLNVeF5U=;
        b=Qljualr6Fq6buuyZUEOQsJQOe+G7QrUKOeDNAG8dgxja5Or/dfdKz60SlbVl00qCOP
         RoufD/c+1H97qB44FJDq6vwgt3KnbD740kMFvkBfUYGPS72S23M7VZHltp71dBgs6tdv
         DC77NjHV0E6wlQGbwbhxpZVcy7VMSjbszxuY9EoPbqi+eZ/IGL8V+gR0Nmvzmvqk0Mw8
         u9tDzipDFdfQFO0+rnNCmFxf5HdmPyyaFGoCU03vsJvma2hGp5RkKcUoRtGNtyvWlNql
         0ob30giuS+nKehqJbnSv9oS2wjh3e/BH5j1yiMxC9J7sUwqDUri0kCw6AvOpMGj+l705
         va6A==
X-Forwarded-Encrypted: i=1; AJvYcCVNLUZ5jIGTOyjbTunG0qkziIlNeMbZor/uyRurbSzKx4wpTsvjCe5K7Eww2VFVoneOSFmtmfpEN5+8C88y@vger.kernel.org, AJvYcCVU961n6sCwVch87feXS9suOjsTFD9LhKC+udZ5eV9M8L5N5qvbB2pA0IB//eNrSrCY66CEb/ogzD+70i0x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5yMn/OORJ24PCqBUSsdBQLPEe6tHqP7EWJtKxcKRwMPxzVnlq
	zhr4qdeJjzdFjnfqQPsstFh3wiBK5Q0mAExIw59NvhHK+xWyCXP6
X-Gm-Gg: ASbGnct9vwL8iZqks/W0Gw7XdRIn+tDch8rzkAFVrJ761doHjuUWLQoHz0ZK9qmt2nU
	WdU9BD6bPDeJCz34lgHlrVym2DHcG60p2SzotocMRBN5ewkTiFijnNY1WQ8RNXH4QUYr3kMbFO/
	XzcnxdJfQq+kHeIPLul7wzX2RUloZIGqC3f/qETXX1HJNBp1gdwkqmqW3Evn0WO6z1fyXzht/Eu
	tsRUxQl9j4ZW6hgmhHZCx5eTsFk76MN0zTu1KzuriwZaFrpAKnu7gN7ihh4ZH5S2iNdlPrkpbta
	JVhrRfc41wGeyc/cs7/e1rCE7p7RivU=
X-Google-Smtp-Source: AGHT+IFijBusIXQNveTYyVkWineuwP7XNYtVjA05OP1gn+j7t447g9otZeq6N7nH7yR5y0Gph1vzJQ==
X-Received: by 2002:a17:90b:540b:b0:2f2:3efd:96da with SMTP id 98e67ed59e1d1-2f548f4ea9emr13487800a91.24.1736464058061;
        Thu, 09 Jan 2025 15:07:38 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a28730dsm4544298a91.20.2025.01.09.15.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:07:37 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Avoid rounding up to one jiffy
Date: Thu,  9 Jan 2025 15:07:33 -0800
Message-ID: <20250109230734.8111-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

If userspace is trying to achieve a timeout of zero, let 'em have it.
Only round up if the timeout is greater than zero.

Fixes: 4969bccd5f4e ("drm/msm: Avoid rounding down to zero jiffies")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fee31680a6d5..451d258b9827 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -537,16 +537,14 @@ static inline int align_pitch(int width, int bpp)
 static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 {
 	ktime_t now = ktime_get();
-	s64 remaining_jiffies;
 
-	if (ktime_compare(*timeout, now) < 0) {
-		remaining_jiffies = 0;
+	if (ktime_compare(*timeout, now) <= 0) {
+		return 0;
 	} else {
 		ktime_t rem = ktime_sub(*timeout, now);
-		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
+		s64 remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
+		return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
 	}
-
-	return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
 }
 
 /* Driver helpers */
-- 
2.47.1



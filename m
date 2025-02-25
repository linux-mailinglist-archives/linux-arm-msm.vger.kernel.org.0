Return-Path: <linux-arm-msm+bounces-49392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5377A45082
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 23:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D10FF3AB6CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 22:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C037230D01;
	Tue, 25 Feb 2025 22:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3lRjVlq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B861C84C8;
	Tue, 25 Feb 2025 22:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740523970; cv=none; b=gGR5M6ZN9Oe7Zzntl1fsgYUEgBT5W8yNUZxp9ZtdoipbvyK5wXbomybYodAsdBX5fnMlU1Qb4pttsjDVkJqL78W6PNNO2vt//CtKwWvHntGR5JPKxWtFHLFt4zYEsndAHoRkE6pjAIFLCDJ42dA8yjy2qENuY3v4sv1xKKTyjTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740523970; c=relaxed/simple;
	bh=7hMZJ/TJBr13gZ/c7AMGuFE6LXoz4EZUqCy+VhTWWAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cc+yr0Lv5v4IfGJ4r+Iw9YVlZyHQq+QD7ePqtcnQImqy9EK0SYOVk84NXEvVW2FlRMrtJRnRKWss/+hu4cys5UFgaO88q9dimIjDey+T7NdxOWC+mY9Pq+O8c80bNEwbrLkguYMp/IB567P+nTyVzj/xP17blqpA60dMwe0sc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3lRjVlq; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220e83d65e5so116903545ad.1;
        Tue, 25 Feb 2025 14:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740523968; x=1741128768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OxsB6aMdBT4Hx4H6RblTo/4XJIt/eXGQbiNeASQfp+4=;
        b=c3lRjVlqHH+gONx7mdwrMWfG08+2+zip6tsif7lS/kjrik8d6/hVchALs3bqfTxpLU
         Vovx5fflGQJ3VGXySuOBlXNnabZh5+bgKQF2qPznIGAylRLp0aT0qwXjfYMzeRjl415h
         KT67KRs0hXHpZxPU5Mmt8KXpZIqcEyPy6bjhxB4x27uYsPT7+K4np9G+LmfhjTatqlx3
         zQugz8JcJ5WV3lZ5BIl/8oWyQuw8t2YKHasXza7omMgm6My3WMiWN56gIb3th5jS9Eax
         BteIfmTUCmuHUsllvN99XQXbId2pHuy5GToGFp1zzpALkfcCO9VSBpQnBoQDojelZeD1
         x3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740523968; x=1741128768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxsB6aMdBT4Hx4H6RblTo/4XJIt/eXGQbiNeASQfp+4=;
        b=kWppldqYWzQZYaO0ZgR4foEBM4nN+kv8CO7gTgJsShqzZm+tCD6Ao7vAQmxBt9RSj2
         nlnEcbmFmL1RbKD5hsB0my/c+H4n3j+vXFWtkHeZ84lwC+hidI4KNN6AnmJo6mij1p2E
         sp0SEVEd5jJwczbnLklALooMtIwQOwYDJn7JdNIO1V4Pof/xGHdix8rab4Gx9DY5cPcX
         oIeTi0mhhHr6Qz7o7K08U26cO4ywQMaRYpJ01NUIdftmCiVadD4NBtWUJa29apBrXE3F
         GYpMKCRafDXboUY+ojchfswXgzvwaLLE9rNnHmceztPo9rTtOdslpwd6Ym9S2jlqzMiP
         1Okw==
X-Forwarded-Encrypted: i=1; AJvYcCUCk/gDWLHTstHHfZoUV8h+Cfaucwacnp8CC23pCbnz+BdzdroZkvjLYjo8u7lSpUqQIi+D5t1gE37/WiTK@vger.kernel.org, AJvYcCWG0rqvBkADv862n9aVJTif46VZUGgC4O/11faITWwN0F/30E1O6qpiwC+ClkVsrEGYxHy9BK5Tbb0Wyduc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/ERm/AmkpS/E9KRWRm4TDQAV3vD2rZwBv3Le+T4FZQiyDI5c
	dB65f8ddkHm3w1n8WkAAlsqH/E5q2xi8dy0Rd4G/uP0ipQikzSYL
X-Gm-Gg: ASbGncuWGlRQuToN9yvW5rYWIVFRHtsL0Fj7yxL2hcllh4lzq4AjBDa1fNAQA6WRThX
	KWv877CU56ubylAref63cVey6oMLhyDNT9f4H+SKMSHC9a/ONaFwkGHzEcI5X32c+GL1vnoIpyo
	KU/YcxmLzmzv2GaB8v0y4GhIeyaY48/rSRT4eJnWVxC2O5TBb+Csz+5K4jLi0VCkcj4LeKwEUFA
	TfMuV9BVfgA9z03ah3kYggEpT/6dGGhtw3xsYsEoNVo6MzV1gnd+wQC+/78bFIT+Ht2IWHJWRNZ
	n6KIamzt6B6XjH0OBSzvexEZFCL6cuseDPB4MukaH+3URnLKH7v1lmRQf4qmWJngcCyX8U+89UP
	l
X-Google-Smtp-Source: AGHT+IE96kce529uDgDYL6+xVtBIYKH6aY66S2u6/reMukc5S8jwhotL/L+R/0JeO62YdHg51R5X+w==
X-Received: by 2002:a17:902:ecca:b0:220:f06b:318 with SMTP id d9443c01a7336-22320080b32mr19996865ad.14.1740523967658;
        Tue, 25 Feb 2025 14:52:47 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0b2975sm19402755ad.259.2025.02.25.14.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:52:46 -0800 (PST)
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
Subject: [PATCH] drm/msm: Expose DRIVER_SYNCOBJ_TIMELINE
Date: Tue, 25 Feb 2025 14:52:43 -0800
Message-ID: <20250225225244.26625-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Initially we didn't want to expose the cap, as it would expose a bug
in the vk driver (turnip) with older mesa versions.  This was fixed over
a year ago (and cherry-picked to stable release branches at the time),
see https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25981.
So let's go ahead and expose it now.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 37db92c8cecb..70373e0fd4a6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -812,6 +812,7 @@ static const struct drm_driver msm_driver = {
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET |
+				DRIVER_SYNCOBJ_TIMELINE |
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
-- 
2.48.1



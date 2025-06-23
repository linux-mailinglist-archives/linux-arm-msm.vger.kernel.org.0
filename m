Return-Path: <linux-arm-msm+bounces-62114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC968AE4CF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 20:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6E5A7AA822
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 18:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4413F248F59;
	Mon, 23 Jun 2025 18:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsFDKzkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C8446BF;
	Mon, 23 Jun 2025 18:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704462; cv=none; b=WxVpFFG4yWQ/EGolh5GQ6YgmLGfwD9w8/vX9xqPX3b7kya44fVP5DI+yxHv/UQQ8U9TnITpBSpCEU18+YalzV+0Lho5QL+TngXU6ukvZSA3pQuy/u5yXz0jUxl6aD9Bq0iiPG7nCkKdWNMp5eJP/F0Fpt3GvskpKn+WTdkKHRAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704462; c=relaxed/simple;
	bh=3rshOR7CPuXyaGwHcakcso417Fg4JBCnCi4RyECR8xI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SkLZpchcAMDsTbwSkblG+hqnE9w88fICywrzcGAGV89vDGRZnbw5FCwq1DS0WVUxllItKcYMWwvSrsVAFcnVLLho5mWEoR6MLKjXTAjo6VjzPO/yGkyPN429k+r0blfyXAPJvuxTb2V0dOzvI96YyhP9+UgjpO0wHpYUzrA+tKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsFDKzkJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-236377f00a1so42367575ad.3;
        Mon, 23 Jun 2025 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750704460; x=1751309260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lX1PV8eCj+w6gmSly9JqA8eydGEbPW07Za33Kr6VYKg=;
        b=XsFDKzkJbXZnydEav58Q+qn0vjRH4WgC2zpjMg8QNLUtPuJJ3MOz/n4z4je7ZZuExG
         m6f9HmS+H/CKAEGaVa+Jq+fUZ7WzLd9RiRCRQm7a0iriCioO1rH/eBb2/lbclurMChgb
         o0WDSow9uvtAI6MbgD8bBwxpesesc7NLjdGg4ixknWj0NUE/0h+IPJDV0P+tCnqx4kr5
         sjgNSvFMdvo4Xr1TsVl2nBIjx3pmCR43gk41BRbDAqaNlsYM9o7DM8wE4k0P6aQZPCjM
         +Siq7xQCvpKJvoBQ2WBGssdMvLHztNdnoBTtBh3WPsHaHJM16RYOEmiZOk1axBgedGXf
         DvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750704460; x=1751309260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lX1PV8eCj+w6gmSly9JqA8eydGEbPW07Za33Kr6VYKg=;
        b=cI3iV8Ww52UW3z5YGlNhWQ70UKRp+lg02Ke+t9Nnmvjiep9SWIIuT41KHVZ4ciyDmb
         uW3+Z7JZh7xlmGpoELdAkttW+oyxW9YKHxPJUm4U/SoRTNVAIdf2Ora0YxFgk94JVPVW
         AwjkrHuS55RtrkWCD0sKCnUAiWhsnV9gamEZsexRsa5xpJMFLwm9fMiv95H0SNYMkCgr
         n+APsEv3OIhLwMpq8wxYY/X5ZE5ltomfW0y/aylKT4dlNJdYAPbXZ94C/S+3uM8lWr2S
         34yxT7PWY0j6gkI7xazNkEzH9WNF4J24+Ed18baJDAy4glPZljTdvb1Xyxm442vh314e
         MT8g==
X-Forwarded-Encrypted: i=1; AJvYcCWAGAdhd1uudTXtXcYoq/mjDQnd6rfFGjYLpNYEBYgLPraemANTeIPwA7TwAfwtFJVBgscGpcyIIsaYHVnk@vger.kernel.org, AJvYcCWeApr8ad0v/pEu6tMJbDIJWiefJ3ytgQeJnIXwfc8RONS/GHcLVPmSnsRWVLKbAxnCAj2nOVhV+Av1ox5H@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv3M+UCTuIbOhxoerma4f0/IVej4yLIf75idWfsTEGd4gedfWx
	+b1ouawJJ+M0XdqoVF4alZ3/ujtPuy5gsjaliYIPuYJ3FTnDvCg+/6o9
X-Gm-Gg: ASbGncvhxRfqekTIbph/4lgvD01SspLZ8BbHSDjsiCJgya8UlRzdYLhSK3u6x5t21uI
	BPUhiugjc6fGUSBqhw/KwvbCcaDgeKR/ykWdtQ8nGlU7h4K5/aE3jXWZ5jYkDN28vsBah4m+/bn
	nZO9pg1O94+AxGq/B3i8eSy2xCPby5wNBlImUeM0to7DovUPVI3Rtnksk8WXSVz9LBf09DXKxbI
	56d7d2tIDqgUAuul3egz5U1p8119cCsWgciUxNVV3M29H4WKYwgSEd1SLBD4SUGCy98Oc7+f1mJ
	8XrlHrLfhdylEoXYPNqpSPgqqV/HzkaY36RXG3+8ETZvBD0hHo5RK1wxQoIZs/r8/17EInJhPwK
	wduIz+cioFmmjXcVxZE7bCW/TPfE=
X-Google-Smtp-Source: AGHT+IG+q7JDDjJJiD6LIsW+SwYhlGS8aClQvrcI6niGs17mM8MdIZ/h4GRG4ZubHXABG5IObcnk4g==
X-Received: by 2002:a17:902:f64a:b0:235:6e1:3edf with SMTP id d9443c01a7336-237d9878c08mr226699925ad.34.1750704459951;
        Mon, 23 Jun 2025 11:47:39 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:229b:2db5:edc5:d79f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86150d8sm88037745ad.123.2025.06.23.11.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 11:47:39 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jessica.zhang@oss.qualcomm.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
Date: Tue, 24 Jun 2025 02:47:34 +0800
Message-ID: <20250623184734.22947-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the report of Coverity Scan [1], "sync_file" is going to be
NULL when entering the "if" section after "out_post_unlock", so
"fput(sync_file->file)" is never going to be exected in this block.

[1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1655089
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d4f71bb54e84..cba1dc6fe6c6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out_post_unlock:
 	if (ret && (out_fence_fd >= 0)) {
 		put_unused_fd(out_fence_fd);
-		if (sync_file)
-			fput(sync_file->file);
 	}
 
 	if (!IS_ERR_OR_NULL(submit)) {
-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-55957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D272BA9FB42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 22:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E04C1895563
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013682135C2;
	Mon, 28 Apr 2025 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOGKQTZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E82205519;
	Mon, 28 Apr 2025 20:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873826; cv=none; b=B5SvfyitCmWh58yb2yt6kbWAgRrMW11r0zRADcTyTvthFFWjQocUYqDotImJ5glCjLSacGQGQGds3eTdCcUClF63Zb3WJcoM8C20tYYh2VD/5UDCPsyDVGLpY+cHoHvOcF/7lIZhLX3jG2yIHhSIYkLCmUAg/G/Snu/I/zACiy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873826; c=relaxed/simple;
	bh=V8c42ToE53u4EzIBKNHkOhDJybrEWeX5QGoGp8mh/ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qbGLl8m2xX4fjxCIAdvl9P+JoGOnFwMWiiUMgKUE4yweLE0MNcGVLps0AFfXQ/GkEo4hVcc3l3NhPJwTRfhtuQcDbQ6HNSwvQ/xPDltArLyoE6WeUhhCEpjZgYMA1vkartosKKfNgO5RmoRX5q5i5jdbkf0+NyCvMMvJrL1e3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOGKQTZN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2295d78b433so56997765ad.2;
        Mon, 28 Apr 2025 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873825; x=1746478625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
        b=NOGKQTZN/8hYHA76lzWl8ZXB+ea4Y5swVolMOfewX8m8QZMk9KviPzxD8MtWwP9LvL
         2CllQ6U6vRnl/Y1pAoPiIo/6jQA+iJLpjsZB4YIG9dpJE/c7fRwSYyohny6XDf5wEnE4
         Jn/5y2TYKjvKplaC9oTIaj7mdFltt53D0Jy5ugOv3xynd2wWbOEWvVIPrs40UC9sjFdG
         ytVKYCG+L8DR4JQ7TzumNxvQbIJ/MHukFPoCa4Hw4xnWtS6YdPq6o9FcvN/WUhV2tyrb
         zhvkGTfO9a9wMPPcVJ0jB+f2KKP7lOWOH7NJSkIl+6Xc/i7bnaeXtroN4x7FYKo+lM4c
         LwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873825; x=1746478625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
        b=N8835RjQL/bQM9D87N0mlnULV2bqckEESry/4Qna3kZzWXn+yodiNV79h9w76cvMk+
         3SBqtLlNQ9BnbcK2RGoVyOuqrzd6dCy806wslvUW6fM6Cv479H96yFBCHDvki+s5GW9I
         hikk1b3ltCsRm7DUB0YZ9aLq/eQ0PvNo39pgQuTtQQ78z4BY5cBhcKovNIazIsePBceO
         b035cQMHlGwZAVICGtN+TORPDhl/tz0kpfBVVPAjviQ04FC7dqPf/BhzP5ocj9ozP8Vl
         FtRtJudmfUakjp5jR/Dc9BTuqNa1IlX7tocsW3FOuLOzk/nNPHqOxWUa1O2LF11clKZw
         t1AA==
X-Forwarded-Encrypted: i=1; AJvYcCX9k6h15ZIZvf6OBEuPElH9fFWQ1LNwkwt93f4mGvokuhwF6uAPoKWPkplgYOqTiPORoQCuBFsXdUSvLFdH@vger.kernel.org, AJvYcCXM2pht7k0jSCv1ElmwWUUbFg3bwzywB5itWYX4AGMd/0e5+xHh2f9nvcf/6TNiJtjNhuBYgWNFzlLWBORe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3hzIbDPhukeUQp6X7c0+g1MVZ0YZCGfnwI1m+c07vQGT//UQT
	yJVjDqiD1aTm+YrZZocnrDYOvfCa+84jMCXRngee9agri/LnoUAx
X-Gm-Gg: ASbGncsT05uQt6JmD+yyuOoDTeoJBvZWPwguj1PS4Ouig4tfPAnAr/gpXHNO24Fehve
	ECHa/QghVAkHUHFJEUj3XH5TM5I0oVOQtpR+Tkp4+Lp2NXTsdoN/a2L+LaccEGy25Bv4SYgmX3A
	YESCvK7XmRxUvQNco49xdKm7XchzcAPrLdGZiJoUEuvSABSXwFJ7LhG25CQsRogAO2JiK7/ewZ8
	lXzPYJQYsu3iio91KNyHd66CAhzQeDsuE35PN5GLEIAaDVJvFGBTL5kYtC46IRhONnwZhiCxJya
	XqVfk/y8+voKLzM2JizxGjQLQfgeVZ1ub20XSm14YqHlF+Np7Mo84jX5xo9efJUkW8jDvmvFQIz
	nhgF+9UVsJhec33/TMReIsH0qjw==
X-Google-Smtp-Source: AGHT+IFl3SMyTEaho/8MJLgQp7mtfCLrZVXdq0dRk9iHPFdYtDqPrzxxbo4vf4F9sHz9doDAlLKRFw==
X-Received: by 2002:a17:90b:1c07:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-30a01317a49mr14615445a91.8.1745873824756;
        Mon, 28 Apr 2025 13:57:04 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef14a3b2sm9502652a91.48.2025.04.28.13.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 10/33] drm/msm: Don't close VMAs on purge
Date: Mon, 28 Apr 2025 13:54:17 -0700
Message-ID: <20250428205619.227835-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0



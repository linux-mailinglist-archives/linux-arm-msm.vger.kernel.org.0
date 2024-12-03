Return-Path: <linux-arm-msm+bounces-40061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8279E1A41
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 12:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01355B37D37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0271E048B;
	Tue,  3 Dec 2024 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZECnII4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1718859F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219965; cv=none; b=rv9p/xTzXowIINylMTEvBzoNO9+36OhMAb7p0SaRrITMpP9CNQwhYZvIok3ueCemLA7K9+oEXwf8/SS5jZn1U0QhJOftfXkHw4zCse4v8WCshdO2DGk4NJY0hJJ2UUnc1ivhvu0vfi9qq8wZgRYmxobROAC3FuDunkm/9oyWOrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219965; c=relaxed/simple;
	bh=AOoWoQcYbGXrHya5oj0rDuWoKX4/uAG4sFUcima7i2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jR9Mh6+BdUt43xDesvbhjbvGSrNIMH9D7r93XtdqTOqzyrpMpl4+rNghR3vvxZJpeBFVgjP9He2oLURa4rKcGiEMLKIFPmXjN6letQQMpuvnULknvewTEvD9CuDvi066lQE6ailsg/jYyTZhbVhKYQLBh7AL9Pb9TT7Oe4LKkmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZECnII4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d0cd8a0e91so4262306a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 01:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733219962; x=1733824762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ahmnL1IDbHLPob3UkQDYkiIlRrX9F5Q3RSPdj7jI85A=;
        b=QZECnII4+/2gNTmYWNVZCZXazNOmuzu4mM8ejaiGPHXb3++2newV+eB50sfTjI7Qpc
         kzMK6vRXtdrpJpeWqET7pd8ek+0HIccKzEwdY+R4u7Obynb7ImaorzshOZqOyTkWO776
         LYeB2NSkVqFTfJSxERke9/yzYlJEWUARdG+30L+X/IxMcWOCNqp0GimFDFZ1VeJhNjam
         /TtV5hm9Nb6o3TRKs/0eK8SRMZ1LeH5xheAbDy6xCFfpvUzTpb6axuJpZfhfkWmsZzSI
         KF1FVsSTV+TsddFh74/gG5GH6lM5mpWN+P5P35ZeUhRVpa4bQ/8cj/L87s3ZlN5De58t
         yjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219962; x=1733824762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahmnL1IDbHLPob3UkQDYkiIlRrX9F5Q3RSPdj7jI85A=;
        b=WFbbshSivPJOL7gZlEoSce4nKAyVbFxVBXCCgIAHP+w9kMc+9Kb4Cf0WzIhMNbupny
         UZfrc+41z5Iw/yaA8vyoFtpaUrgPd0vpc9H4/Br2aiXjfqW75/wtIlkm06OLIXQB9aFr
         WBZgQNtyipS7Y/bbPWRJUsOFMYVVZ/GE/HvMrurYkdueYw018/4DbHQTFw/QT+Gu1LWl
         5mdAoWwTRZebIE0HIiR0IP6yFiJ+7xI/D8mLghwoz3s7ht0du54jma/ic7Smcp9PfYCU
         YwpC/wSQDUIqOImlWd0ZajnU8t+pqllG7oIt3Bld+qX7XatAG6qjfYvCZSo1vZOo08aM
         u95w==
X-Gm-Message-State: AOJu0YzkhC5SkvwQpreht/8GsY8QKalf7wPCRwOQ7jvNARDJ4vdFt4rA
	iGj4X+ijRac2O0IVt4r7c/3HDQCaqieyGa087GQSCHW4D8K2hoFS
X-Gm-Gg: ASbGncu3wHDmwUOIqbG4wvLyluS5A51wly8qwO/G8GRPdzY203IlenPFEpcx+B2FWn7
	a78/xLt9Gugb8FmTYixF5BgP0EDmjnOIQwgJMb0GIOpgPPCU6CssqfHJp7bMg+zoxczRFBaUqxB
	ILdAzd83URLBVnxWxcIBvZ0QTdp5BE8W5GATodVZxnMPGRPvKfWdNgNINmmcLjeidKccxDu1nHB
	8VawBHr4llkz9EEj6e8SXV9CqzFFeg8mJyL+FFRV+tdGON3K1sxfxbdZ7Oh5URFX21RMA==
X-Google-Smtp-Source: AGHT+IErEKTcX9+KMr3v46BnRtMhPvpHhE5bS9oaE9UMKoPerpaBYHBLIEZ8kNKDthyQ+8ttTNBC6A==
X-Received: by 2002:a05:6402:378a:b0:5cf:c0d2:698 with SMTP id 4fb4d7f45d1cf-5d10cb5baf9mr1582390a12.18.1733219961754;
        Tue, 03 Dec 2024 01:59:21 -0800 (PST)
Received: from archlinux.tail7f7b1.ts.net ([195.136.68.87])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097d9f6b6sm5867365a12.2.2024.12.03.01.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:59:21 -0800 (PST)
From: Danylo Piliaiev <danylo.piliaiev@gmail.com>
X-Google-Original-From: Danylo Piliaiev <dpiliaiev@igalia.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	danylo.piliaiev@gmail.com
Subject: [PATCH 0/1] Expose UCHE_TRAP_BASE value via uapi
Date: Tue,  3 Dec 2024 10:59:19 +0100
Message-ID: <20241203095920.505018-1-dpiliaiev@igalia.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter would be used in [1] to implement VK_KHR_shader_clock
and GL_ARB_shader_clock.

Downstream driver exposes uche trap base via uapi only on A7XX+.
However, from testing, we could get correct shader clock on A6XX.
The uche trap base value is not used by Mesa for A4XX and A5XX.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29860

Danylo Piliaiev (1):
  drm/msm: Expose uche trap base via uapi

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 include/uapi/drm/msm_drm.h              |  1 +
 6 files changed, 23 insertions(+), 11 deletions(-)

-- 
2.46.2



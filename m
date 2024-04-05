Return-Path: <linux-arm-msm+bounces-16566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A940889A265
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D8101F243E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 16:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECE316F832;
	Fri,  5 Apr 2024 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4/hj8oA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD1F171078
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712334184; cv=none; b=RmbHysAXp6dkmlSoy941/KPfyv1SNaspQF+vO8pCup9PUtrOalJTaL4W6EiaUq/jx9yC+G0xU82L18w3NK2tBaXPmcZCvF/c4VKME2OcfYLq1kvf/CGawhATJ8Y1lDAOTZyu8gIXNr9QCyRjuGA1FVR7P+Z2Dec7p3S5ah/LIY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712334184; c=relaxed/simple;
	bh=Go7E0ATI5upfh6x0MsmrMrrB/+sC4043D/fs3um9sBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=my0qMq6AjMenfzc4aLfscWIQRWcBCMsT3LnkzvCjpLaPJXVqV5jdXgcHyKBrxt2Ye4qmYMv31feZv0Jvh5BHQF7n5rogy/ssK+8IJ3F/kzLfkg3VbpeO8lbjcYrtH7NegSvm3P3BRA5CCOdI0olCIMJUgd0GuOFfo0ai/+vGWxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4/hj8oA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4163378017aso957415e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712334181; x=1712938981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGKOYnuEAajSEHVM/5aqmgDsa6F7CuMuUvfl87fK+tQ=;
        b=B4/hj8oAdObaMHv6LNW2zwx7WL/V4VZEQwcoVD4PmWDm2fCuOciFqN1WgEatQw7FTr
         1MWMRBsS1ZvwT7bfwTGU+d49JzML6NtK6hSsLNQLULh8kUYWo/i07/y31IzupAzZQHXL
         cCJDmoNGEpHjm2Pg3SytR9gxylW6/dGVOOpRh+/RIc88BAi17fiPATR6X/wY+nQHE3bP
         j0lCjz8f/Cqlxj9w+1N1e1sL7w1NkRplcz1oyvO9gOfJTSSLuIRvLBklVa0LBFDujS2k
         g6SuqE2GV4QLkdsQFuQYW6gY7IZmPH3gTTG/B+uzq0Hv9usTGqPrkFvPIuhi/p+8OW9w
         uMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712334181; x=1712938981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGKOYnuEAajSEHVM/5aqmgDsa6F7CuMuUvfl87fK+tQ=;
        b=VfqPLbvQQELAhEyCtazsXHyr4NTr10S49HZ6kQh0tvb4ubajzcc5c6OYsoCXa5iQv6
         onnbfGy5RS8F0c1L3cAFY7MzYonILVlyquHPNLNPpL0LEjlueq4Lgnbq8MXohtdaK9VH
         jpkHriKj0ZPBBU9IfsutoFUC3f8RiFaK+tYimveNcaBQ45LGRcnCXF/2X3tY80JhuTsl
         pK/1DOvlDnZ5IIUVh3A9kVdYEpq9zcKruYfJO0vjsQiC3wOvbjhf3NHR/m30/zdPd5m6
         7cVVUMMVMBMyfI3xt1+YSgRfyy81WbSXMWLdIBjy4orOgb8+P/xbheExUP4J4tQF9mNl
         +WVw==
X-Forwarded-Encrypted: i=1; AJvYcCWOkCmodyXu5WZMRLzXR0icRCkXRpazLHSZUWiViMd1uYL38o3up2sUq4/IynHuOKb4H61ulzTVBQwgtVskIOeAHqGGsVTAeP2ThPPLZg==
X-Gm-Message-State: AOJu0Ywu8ycDgj0jEhEb2oAsTRY2DGvoaMpJwWYVx2geucKOqv4TK33K
	Hn1pPcdHlnDpQq4unU85dZMa7d2BA613vwjz/gTJw9vyZI1Yt3bCGlq9AdcS2iZxTEOL
X-Google-Smtp-Source: AGHT+IGCpikpowkJggw/FKTCISW0+1qW7dIxEZgggsJj4u7eZ9D6ER1dmt/XZZFKbe/JxthCZ4Rpyw==
X-Received: by 2002:a05:600c:5247:b0:415:4b4b:1e28 with SMTP id fc7-20020a05600c524700b004154b4b1e28mr1616749wmb.20.1712334181396;
        Fri, 05 Apr 2024 09:23:01 -0700 (PDT)
Received: from kali.localhost ([46.164.87.152])
        by smtp.gmail.com with ESMTPSA id hi23-20020a05600c535700b004146a1bf590sm6725202wmb.32.2024.04.05.09.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:23:00 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
To: dmitry.baryshkov@linaro.org
Cc: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	tzimmermann@suse.de,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	Kiarash Hajian <kiarash8112hajian@gmail.com>
Subject: [PATCH 0/1] drm/msm: request memory region
Date: Fri,  5 Apr 2024 12:22:06 -0400
Message-ID: <20240405162213.28263-1-kiarash8112hajian@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kiarash Hajian (1):
  drm/msm: request memory region

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 drivers/gpu/drm/msm/msm_io_utils.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 8cb4a9a82b21623dbb4b3051dd30d98356cf95bc
-- 
2.43.0



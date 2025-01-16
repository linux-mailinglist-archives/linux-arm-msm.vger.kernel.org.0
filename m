Return-Path: <linux-arm-msm+bounces-45200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9319A133D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19DAA161AA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA4619644B;
	Thu, 16 Jan 2025 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LasMBSpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD411AB6DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012405; cv=none; b=lM3CUCcQ/x355SKapXVtcgtNt50bcqQUnF2vK7YL9Uf8QdScEIqCp/Wv3E/gl0SuhrJfAyvebW+YTSjoaIIrQx0uO60kVLkknPWDMK47JRk1h2YHt8Hx0N2q+4WA6Zy7H0avP36hnDmDvL+wlGbnyj+hiyhyzn6c++XRLT5h4Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012405; c=relaxed/simple;
	bh=Sj3Czivhsbaa4LJdooT+esNwlFrWC/YCnOEkeTa//RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbOOfNSw4jqkfTbdsfSW1HArYuYNbUQUxNFLC8J1Fyj9lHG9aXGx79kzmxexDS3B5S1Qp4mWuQyDKROXjfjKMDWYbPw157CMMnhHCPFIY32OJtHzZsXPuJ4zqEO6Mpoi4my7ppGj+P4a0H2T0EZ6LDnFm96keR+p0IbakUK8Gfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LasMBSpi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216426b0865so9165345ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012403; x=1737617203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vUwtbv6QkBMkinOtoSzI57ocGpisrQ8kP4ZBj8OJ9w=;
        b=LasMBSpiolCyo4sysKJfPrw4cZZlkhamp4TFaSnjz/xKwiSTDevrCrFfRtk0wpllfa
         hCv7XW73bLFPdeENi1xBZ4zS4mjOg9Slgs7HcMU7eJcOuMGiyLsAO8Cf5puHnfZYOKLx
         2hRK85XVyCW7F+dwKC2ZbIGK5aPcbXXYR+em6Xssp4w5SYEFGOqp1TuYFzBfszBV2BmV
         Qnj6C9rIK4AoGqZ6R158fVg3QPJhsuTmUkMhEsYHGQpmw06rpM3fzX0kl/dDqcaNL9ak
         SI2rRfgWgCsULX1RDt0UR1Vn1qs61CvV1CaMAYqdBwLzV2H89/qgo2ayLyM6b7dwyUwk
         kPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012403; x=1737617203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vUwtbv6QkBMkinOtoSzI57ocGpisrQ8kP4ZBj8OJ9w=;
        b=Js6mjZuouR/CqP0cZAPDKjE5IT5IN5NMJVAbp2Tr4av7UwUYwpyS1HdtoV/X1LmOct
         HIanPcXkg8CdAhW2v9nWTjmIrCs/jOIoOepQgYZCGuSmEzSHWUW0eocG6AFwjd5HNmaR
         dluXfL2cEzAKO4Kgw9AyHdvOiPDwNKi1sdm8+VCNQB6c7gMyziqFj66T5iZFmMz+qD6k
         0xOu2v8Bt5JcN9KPT48HK9/CEqcG+nrsLQ9ySMkj5hp8bDiq/2jZuPN5cU54EabKviD7
         sWdM+5aVOcW2JHHHA8VJEjYj7JtJ1Tgld0gQy3LlshXtYntc9AGwtBvKQGxPrnU1madF
         +v1w==
X-Gm-Message-State: AOJu0Yyg4TRFeLGl+1VkzfiqnNPYBwEQYKJXjgVK03Y7J9XT1wa/AtJ6
	+PRQCmQAGpUYIgMpVy14H1IYNbhLeEmOMtlvL1Rp1V3xCFoHlO9U0texsEOO/Dw=
X-Gm-Gg: ASbGncvljEW+wtny6S0gpuwWCGUxnHUiftYNya2YQhQ8k747XCgx6FFqMGoYYFuLDfQ
	54UiNHJmZPrO6hen+I0vnWt7ePU5gXxyjlITD7MXDyxuIGtVVylAxt1kKBbEK9pW/f43SuhF88t
	JMDIm1/rbRG5qlN+Gx1mq4CHrlTsubcIape4VhlRTPIt/hCjiFVEm9MEYzYXTWlaggc7HZL2axc
	kmfkAQ1sYSnc1GNmLphscUMNgi8vnLwIKD11s4+05IUcqQmeEa6ew==
X-Google-Smtp-Source: AGHT+IHEZ8xbbHf6WOE5lVgvL/EZZjzSZcR/ONwuLfwLhiLy0XL6LoLqBpWJ3PuAXM7IxlN82vAVrA==
X-Received: by 2002:a05:6a00:4485:b0:71e:16b3:e5dc with SMTP id d2e1a72fcca58-72d21fd8b84mr48514252b3a.19.1737012403491;
        Wed, 15 Jan 2025 23:26:43 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:26:43 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:55 +0800
Subject: [PATCH v4 06/16] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-6-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1148;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Sj3Czivhsbaa4LJdooT+esNwlFrWC/YCnOEkeTa//RM=;
 b=wwLDum0ZmSKxVWLUCff0iyuTso8UOKgLOcC3MiXn4ZuV5Y6iB9FHmaZj2ZQVC7cFkBqmZxjDI
 a2qygM2FjnWB8cXJ4P9EoUGyKCT+CWVNu+4OQpOFxt5SOMAwFQ1W45Q
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add the case to reserve multiple pairs mixers for high resolution.
Current code only supports one pair of mixer usage case. To support
quad-pipe usage case, two pairs of mixers are needed.

Reset the current lm_count to an even number instead of completely
clearing it. This prevents all pairs from being cleared in cases
where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 24e085437039e..3b3660d0b166d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -321,7 +321,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1


